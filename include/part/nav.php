
<nav>
    <div class="hamburger">
      <div class="line"></div>
      <div class="line"></div>
       <div class="line"></div>

    </div>
    <ul class="nav-links">
       <li><a href="./logout.php">Log Out</a></li>
       <?php if ($_SESSION['type'] == 'Seller') {
           echo '<li><a href="./sold.php">Orders</a></li>';
           echo '<li><a href="./insertArticle.php">Insert Article</a></li>';
        }
        if ($_SESSION['type'] == 'Buyer') {
            echo '<li><a href="./ordered.php">Ordered</a></li>';   
        }
       ?>
       <li><a href="./profile.php?id=<?php echo $user->getUserId()?>"><?php echo $user->getUserName();?></a></li>
       <li><a href="./index.php">Home</a></li>
       
       
       <span class="dot"></span>
    </ul>
   
    <div class="search">
                <div class="md-form active-cyan active-cyan-2 mb-3">
                    <form action="search.php" method="get">
                        <input class="form-control" name="search" type="text" placeholder="Search" aria-label="Search">
                    </form>
                </div>
    </div>
</nav>
<script src="app.js"></script>
