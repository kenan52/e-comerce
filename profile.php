<?php
require './include/part/header.inc.php';
if(isset($_SESSION['user_id'])) {

    
    switch ($user->getUserType()) {
        case 'Buyer':
        
            include './include/part/themeplate/buyer_profile.php';
            break;
        case 'Seller':
            include './include/part/themeplate/seller_profile.php';
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