<?php
$ida = $_GET['id'];
require './include/part/header.inc.php';
if(isset($_SESSION['user_id'])) {
 
    $seller->deleteArticle($ida);
    $user->redirect("profile.php");
  }

?>