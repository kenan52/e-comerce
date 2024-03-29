<?php

/* 
 * AUTHENTICATION CLASS
 *
 * By Alex Web Develop
 * https://alexwebdevelop.com/user-authentication/
*/


/*
 * SQL tables

CREATE TABLE IF NOT EXISTS `accounts` (
`buyer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`buyer_name` varchar(254) NOT NULL,
`password` varchar(254) NOT NULL,
`account_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
`account_expiry` date NOT NULL DEFAULT '1999-01-01',
PRIMARY KEY (`buyer_id`),
UNIQUE KEY `buyer_name` (`buyer_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sessions` (
`session_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`session_buyer_id` int(10) unsigned NOT NULL,
`session_cookie` char(32) NOT NULL,
`session_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`session_id`),
UNIQUE KEY `session_cookie` (`session_cookie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

*/


/* Database PDO connection. */
try
{
	$db = new PDO('mysql:host=localhost;dbname=importdo', 'root', '');
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e)
{
	echo $e->getMessage();
}


/* Authentication class. */
class User
{
	/* Cookie name used for cookie authentication */
	const cookie_name = 'auth_cookie';
	
	/* Cookie session's length in seconds (after that, the user must authenticate again with username and password) */
	const session_time = 604800; // 7 days
	
	/* Account Id (taken from the buyer_id column of the accounts table) */
	private $buyer_id;
	
	/* Account username */
	private $buyer_name;
	
	/* Boolean value set to TRUE if the authentication is successful */
	private $is_authenticated;
	
	/* Optional account expiry date */
	private $expiry_date;
	
	/* Cookie session id (session_id column from the sessions table) */
	private $session_id;
	
	/* Timestamp of the last login (stored in "Unix timestamp" format) */
	private $session_start_time;
	
	/* PDO object to use for database operations */
	private $db;
	
	
	/* STATIC FUNCTIONS */
	
	/* Adds a new account */
	public static function add_account($username, $password, &$db)
	{
		/* First we check the strings' length */
		if ((mb_strlen($username) < 3) || (mb_strlen($username) > 24))
		{
		  return TRUE;
		}
		
		if ((mb_strlen($password) < 3) || (mb_strlen($password) > 24))
		{
		  return TRUE;
		}
		
		/* Password hash */
		$hash = password_hash($password, PASSWORD_DEFAULT);
		
		try
		{
		  /* Add the new account on the database (it's a good idea to check first if the username already exists) */
		  $sql = 'INSERT INTO buyer (buyer_name, password, account_enabled, account_expiry) VALUES (?, ?, ?, ?)';
		  $st = $db->prepare($sql);
		  $st->execute(array($username, $hash, '1', '1999-01-01'));
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
		
		/* If no exception occurs, return true */
		return TRUE;
	}
	
	/* Deletes an account */
	public static function delete_account($buyer_id, &$db)
	{
		/* Note: you should only allow "admin" users to run this function 
		  and carefully check the $buyer_id value */
		
		try
		{
		  /* First, we close any open session the account may have */
		  $sql = 'DELETE FROM sessions WHERE (session_buyer_id = ?)';
		  $st = $db->prepare($sql);
		  $st->execute(array($buyer_id));
			
		  /* Now we delete the account record */
		  $sql = 'DELETE FROM accounts WHERE (buyer_id = ?)';
		  $st = $db->prepare($sql);
		  $st->execute(array($buyer_id));
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
		
		/* If no exception occurs, return true */
		return TRUE;
	}
	
	/* Edit an existing user; arguments set to NULL are not changed */
	public static function edit_account($buyer_id, &$db, $username = NULL, $password = NULL, $enabled = NULL, $expiry = NULL)
	{  
		/* Note: 
		  each argument should be checked and validated before running the update query.
		  You should check the strings' length (like in the other functions), the correct 
		  format of the expiry date and so on.
		*/
		
		/* Array of values for the PDO statement */
		$sql_vars = array();
		
		/* Edit query */
		$sql = 'UPDATE accounts SET ';
		
		/* Now we check which fields need to be updated */
		if (!is_null($username))
		{
		  $sql .= 'buyer_name = ?, ';
		  $sql_vars[] = $username;
		}
		
		if (!is_null($password))
		{
		  $sql .= 'password = ?, ';
		  $sql_vars[] = password_hash($password, PASSWORD_DEFAULT);
		}
		
		if (!is_null($enabled))
		{
		  $sql .= 'account_enabled = ?, ';
		  $sql_vars[] = strval(intval($enabled, 10));
		}
		
		if (!is_null($expiry))
		{
		  $sql .= 'account_expiry = ?, ';
		  $sql_vars[] = $expiry;
		}
		
		if (count($sql_vars) == 0)
		{
		  /* Nothing to change */
		  return TRUE;
		}
		
		$sql = mb_substr($sql, 0, -2) . ' WHERE (buyer_id = ?)';
		$sql_vars[] = $buyer_id;
		
		try
		{
		  /* Execute query */
		  $st = $db->prepare($sql);
		  $st->execute($sql_vars);
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
		
		/* If no exception occurs, return true */
		return TRUE;
	}
	
	
	/* PUBLIC FUNCTIONS */
	
	/* Constructor; it takes the $db object as argument, passed by reference */
	public function __construct(&$db)
	{
		$this->buyer_id = NULL;
		$this->buyer_name = NULL;
		$this->is_authenticated = FALSE;
		$this->expiry_date = NULL;
		$this->session_id = NULL;
		$this->session_start_time = NULL;
		$this->db = $db;
	}
	
	/* Username and password authentication */
	public function login($name, $password)
	{
		/* Check the strings' length */
		if ((mb_strlen($name) < 3) || (mb_strlen($name) > 24))
		{
		  return TRUE;
		}
		
		if ((mb_strlen($password) < 3) || (mb_strlen($password) > 24))
		{
		  return TRUE;
		}
		
		try
		{
		  /* First we search for the username */
		  $sql = 'SELECT * FROM buyer WHERE (buyer_name = ?) AND (account_enabled = 1) AND ((account_expiry > NOW()) OR (account_expiry < ?))';
		  $st = $this->db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
		  $st->execute(array($name, '2000-01-01'));
		  $res = $st->fetch(PDO::FETCH_ASSOC);
			
		  /* If the username exists and is enabled, then we check the password */
		  if (password_verify($password, $res['password']))
		  {
			 /* Log in ok, we retrieve the account data */
			 $this->buyer_id = $res['buyer_id'];
			 $this->buyer_name = $res['buyer_name'];
			 $this->is_authenticated = TRUE;
			 $this->expiry_date = $res['account_expiry'];
			 $this->session_start_time = time();
			  
			 /* Now we create the cookie and send it to the user's browser */
			 $this->create_session();
			 echo $name->buyer_id;
		  }
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
		
		/* If no exception occurs, return true */ 
		return TRUE;
	}
	
	
	/* Cookie authentication */
	public function cookie_login()
	{
		try
		{
		  if (array_key_exists(self::cookie_name, $_COOKIE))
		  {
			 /* First we check the cookie's length */
			 if (mb_strlen($_COOKIE[self::cookie_name]) < 1) 
			 { 
				 return TRUE;
			 }

			 $auth_sql = 'SELECT *, UNIX_TIMESTAMP(session_start) AS session_start_ts FROM sessions, accounts WHERE (session_cookie = ?) AND (session_buyer_id = buyer_id) AND (account_enabled = 1) AND ((account_expiry > NOW()) OR (account_expiry < ?))';
			 $cookie_md5 = md5($_COOKIE[self::cookie_name]);
			 $auth_st = $this->db->prepare($auth_sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
			 $auth_st->execute(array($cookie_md5, '2000-01-01'));
			 
			 if ($res = $auth_st->fetch(PDO::FETCH_ASSOC))
			 {
				/* Log in successful */
				$this->buyer_id = $res['buyer_id'];
				$this->buyer_name = $res['buyer_name'];
				$this->is_authenticated = TRUE;
				$this->expiry_date = $res['account_expiry'];
				$this->session_id = $res['session_id'];
				$this->session_start_time = intval($res['session_start_ts'], 10);
			 }
		  }
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
		
		/* If no exception occurs, return true */ 
		return TRUE;
	}
	
	
	/* Logs out user and close his current session (and all other sessions if $close_all_sessions is TRUE) */
	public function logout($close_all_sessions = FALSE)
	{
		/* First we check if a cookie does exist */
		if (mb_strlen($_COOKIE[self::cookie_name]) < 1)
		{
		  return TRUE;
		}
		
		try
		{
		  /* First, we close the current session */
		  $cookie_md5 = md5($_COOKIE[self::cookie_name]);
		  $sql = 'DELETE FROM sessions WHERE (session_cookie = ?) AND (session_buyer_id = ?)';
		  $st = $this->db->prepare($sql);
		  $st->execute(array($cookie_md5, $this->buyer_id));
			
		  /* Do we need to close other sessions as well? */
		  if ($close_all_sessions)
		  {
			 /* We close all account's sessions */
			 $sql = 'DELETE FROM sessions WHERE (session_buyer_id = ?)';
			 $st = $this->db->prepare($sql);
			 $st->execute(array($this->buyer_id));
		  }
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
		
		/* Delete the cookie from user's browser */
		setcookie(self::cookie_name, '', 0, '/');
		$_COOKIE[self::cookie_name] = NULL;
		
		/* Clear user-related properties */
		$this->buyer_id = NULL;
		$this->buyer_name = NULL;
		$this->is_authenticated = FALSE;
		$this->expiry_date = NULL;
		$this->session_id = NULL;
		$this->session_start_time = NULL;
		
		/* If no exception occurs, return true */ 
		return TRUE;
	}

	
	/* PRIVATE FUNCTIONS */
	
	/* Sends a new authentication cookie to the client's browser and saves the cookie hash in the database */
	private function create_session()
	{
		try
		{
		  /* Create a new cookie */
		  $cookie = bin2hex(random_bytes(16));
		
		  /* Saves the md5 hash of the new cookie in the database */
		  $sql = 'INSERT INTO sessions (session_cookie, session_buyer_id, session_start) VALUES (?, ?, NOW())';
		  $st = $this->db->prepare($sql);
		  $st->execute(array(md5($cookie), $this->buyer_id));
		
		  /* Reads the session ID of the new cookie session and stores it in the class parameter */
		  $this->session_id = $this->db->lastInsertId();
		}
		catch (PDOException $e)
		{
		  /* Exception (SQL error) */
		  echo $e->getMessage();
		  return FALSE;
		}
	 
		/* Finally we actually send the cookie to the user and we save it in the $_COOKIE PHP superglobal */
		setcookie(self::cookie_name, $cookie, time() + self::session_time, '/');
		$_COOKIE[self::cookie_name] = $cookie;

		/* If no exception occurs, return true */ 
		return TRUE;
	}
}
