<?php

$server = 'localhost';
$username = 'root';
$password_conn = '';
$database = 'importdo';

try {
  $conn = new PDO("mysql:host=$server; dbname=$database;", $username, $password_conn);
  $conn -> exec("SET CHARACTER SET utf8");
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e){
    die("Connection failed: " . $e->getMessage());
}

?>

