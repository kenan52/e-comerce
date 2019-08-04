<?php
require './include/part/header.inc.php';
if(isset($_SESSION['user_id'])) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Article</title>
    <!--===============================================================================================-->
  
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/nav.css">
  <link rel="stylesheet" href="./css/main.css">
<!--===============================================================================================-->
</head>
<body>
    <?php
    include ('./include/part/nav.php');
    include ('./include/part/sidebar.php');     
    ?>
    <!-- Page Content -->
<div class="main">
    <div class="flex-container article">
    <?php
        $article = $_GET['id'];
        $user->articleInfo($article);
        
        }else {
    header("Location: ./login.php?=error");
    exit();
  }
    ?>
        </div>
    </div>
</body>
</html>