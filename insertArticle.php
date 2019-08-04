<?php
require './include/part/header.inc.php';
if(isset($_SESSION['user_id'])) {
    if($_SESSION['type'] == 'Seller') {

      if (isset($_POST['submit'])) {
        $name =  $_POST['name']  ;
        $img = $_POST['img'];
        $price = $_POST['price'];
        $desc = $_POST['desc'];
        $seller_id = $user->getUserId();
        $subcat = $_POST['category'];

        if (!empty($_POST['name'] && $_POST['img'] && $_POST['price'] && $_POST['desc'] && $_POST['category'])) {
          $seller->insertArticle($name, $img, $price, $desc, $seller_id, $subcat);

          $inserted = "inserted";
        }else {
          $inserted = "";
        }
        
      }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Insert Article</title>
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
    <div class="insertArticle">
<div class="main">
    <div class="flex-container">
    <br>
      <div class="form" style="width: 70%">
            <form action="insertArticle.php" method="post">

            <div class="form-group">
              <label for="formGroupExampleInput">Article Name</label>
              <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Name..." name="name">
            </div>
            <div class="form-group">
              <label for="formGroupExampleInput">Img URL</label>
              <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Url..." name="img">
            </div>
            <div class="form-group">
              <label for="formGroupExampleInput">Price</label>
              <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Price" name="price">
            </div>
            <div class="form-group">
              <label for="formGroupExampleInput">Description</label>
              <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Description" name="desc">
            </div>

                
            <div class="col-auto my-1">
                <label for="formGroupExampleInput">Category</label>
                <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
                <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="category">
                    <option selected>Select...</option>
                    <?php
                    $seller->category();
                
                    ?>
                </select>
                </div>
            <div class="col-auto my-1">
                    <button type="submit" class="btn btn-primary" name="submit">Insert Article</button>
                  </div>
          </form>
          <?php
                  if(isset($inserted)){
                    if ($inserted == "inserted") {
                      echo '<div class="alert alert-success" role="alert">
                      Success!
                    </div>';
                    }else {
                      echo '<div class="alert alert-danger" role="alert">
                      Please enter all required fields!
                    </div>';
                    }
                  }
                ?>
    </div>
    </div>
    <?php
        
        }else {
    header("Location: ./login.php?=error");
  exit();
    }
  }
    ?>
        </div>
    </div>
</body>
</html>