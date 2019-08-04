<?php
require './include/part/header.inc.php';
if(isset($_SESSION['user_id'])) {

    
    switch ($user->getUserType()) {
        case 'Seller':
        
            $user->redirect('index.php');
            break;
        case 'Buyer':
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
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="./css/nav.css">
  <link rel="stylesheet" href="./css/main.css">
<!--===============================================================================================-->
</head>
<body>
    <?php
        include ('./include/part/nav.php');
        include ('./include/part/sidebar.php');
        //include ('./include/database.php');
    ?>
    <!-- Page Content -->
<div class="main">
<div class="wrap-table100">
<div class="table100">
<table>
<thead>
<tr class="table100-head">
<th class="column1">Order ID</th>
<th class="column2">Article name</th>
<th class="column3">Shiping</th>
<th class="column4">Price</th>
</tr>
</thead>
<tbody>
        <?php $user->ordered();?>
</tbody>
</table>
</div>
</div>

    
</div>

</body>
</html>


<?php
            break;
        
        default:
            echo "Error 500";
            break;
    }
}else {
    header("Location: ./login.php?=error");
  exit();
  }
?>