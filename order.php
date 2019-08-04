
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
<?php
$ida = $_GET['id'];
$orderStatus = 'none';
require './include/part/header.inc.php';
if(isset($_SESSION['user_id'])) {
 
  if(isset($_POST["submit"])){
    if(!empty($_POST["firstname"] && $_POST["email"] && $_POST["address"] && $_POST["city"] && $_POST["state"] && $_POST["zip"])){
    $ida = $_GET['id'];
    

    $buyer_id = $user->getUserId();
    $seller_id = $user->getSellerId($ida);;
    $price = $user->getOrderPrice($ida);
    $address = " Name: " . $_POST['firstname'] . ". Email: " . $_POST['email'] . ". Address: " . $_POST['address'] .
     ". City: " . $_POST['city'] . ". State: " . $_POST['state'] . ". Zip: " . $_POST['zip'];
    $user->Order($buyer_id, $seller_id, $ida, $price, $address);

    $orderStatus = 'ordered';
    }
    else {
      $orderStatus = 'error';
      
    }
  }

?>
<body>
    <?php
    include ('./include/part/nav.php');
    include ('./include/part/sidebar.php');     
    ?>
    <!-- Page Content -->
<div class="main">
    <div class="flex-container">
    <?php
        $order = $_GET['id'];
        

        }else {
    
  }
    ?>
        <div class="row">
  <div class="col-75">
    <div class="container">
      <form action="order.php?id=<?php echo $ida;?>" method="POST">

        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">

            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>

        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input type="submit" name="submit" value="Continue to checkout" class="btn">
        <?php
    if ($orderStatus == 'ordered') {
      echo '<div class="alert alert-success" role="alert">
    Well done! You have successfully ordered an item.
    </div>';
    }if ($orderStatus == 'error') {
     echo  '<div class="alert alert-danger" role="alert">
      
    Fill in all fields!
    </div>';
    }
      
  ?>
      </form>
    </div>
  </div>
  
  
  <div class="col-25">
    <div class="container">
      <h4>Cart 
        <span class="price" style="color:black">
          <i class="fa fa-shopping-cart"></i> 
          <b>1</b>
        </span>
      </h4>
      <p><a href="#"><?php echo $user->getOrderName($order);?></a> <span class="price"><?php echo $user->getOrderPrice($order);?> $</span></p>
      <br>
      <hr>
      <p>Total <span class="price" style="color:black"><b><?php echo $user->getOrderPrice($order);?> $</b></span></p>
    </div>
  </div>
</div>

        </div>
    </div>
</body>
</html>