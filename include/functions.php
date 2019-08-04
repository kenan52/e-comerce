<?php
class User {
    public function loginUser($email, $pass_input) {
        if (isset($_POST['type'])) {
            try {
                require './database.php';
                switch ($_POST['type']) {
                    case 'Buyer':
                        $stmt = $conn->prepare("SELECT * FROM buyer WHERE email=:email");
                        break;
                    case 'Seller':
                        $stmt = $conn->prepare("SELECT * FROM seller WHERE email=:email");
                        break;
                    default:
                        break;
                }
                $stmt->execute(array(
                    ':email' => $email
                ));
                $userRow = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($stmt->rowCount() > 0) {
                    if (password_verify($pass_input, $userRow['password'])) {
                        switch ($_POST['type']) {
                            case 'Buyer':
                                $_SESSION['type']        = $_POST['type'];
                                $_SESSION['user_id']     = $userRow['buyer_id'];
                                $_SESSION['buyer_name']  = $userRow['buyer_name'];
                                $_SESSION['email']       = $userRow['email'];
                                $_SESSION['password']    = $userRow['password'];
                                $_SESSION['phone']       = $userRow['phone'];
                                $_SESSION['description'] = $userRow['description'];
                                $this->redirect('index.php');
                                break;
                            case 'Seller':
                                $_SESSION['type']        = $_POST['type'];
                                $_SESSION['user_id']     = $userRow['seller_id'];
                                $_SESSION['buyer_name']  = $userRow['seller_name'];
                                $_SESSION['email']       = $userRow['email'];
                                $_SESSION['password']    = $userRow['password'];
                                $_SESSION['phone']       = $userRow['phone'];
                                $_SESSION['description'] = $userRow['description'];
                                $this->redirect('index.php');
                                break;
                            default:
                        }
                    } else {
                        return false;
                    }
                }
            }
            catch (PDOException $e) {
                echo $e->getMessage();
            }
        }
    }
    public function registerBuyer($name, $email, $password, $phone, $desc) {
        try {
            require './database.php';
            $stmt = $conn->prepare("SELECT * FROM buyer WHERE email= :email");
            $stmt->execute(array(
                ':email' => $email
            ));
            if ($stmt->rowCount() == 0) {
                $new_password = password_hash($password, PASSWORD_BCRYPT);
                $stmt         = $conn->prepare("INSERT INTO buyer(buyer_name,email,password,phone,description) 
                VALUES(:name, :email, :password, :phone, :desc)");
                $stmt->bindparam(":name", $name);
                $stmt->bindparam(":email", $email);
                $stmt->bindparam(":password", $new_password);
                $stmt->bindparam(":phone", $phone);
                $stmt->bindparam(":desc", $desc);
                $stmt->execute();
                return $stmt;
            } else {
                echo 'Email alredy exist !';
            }
        }
        catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    public function registerSeller($name, $email, $password, $phone, $desc) {
        try {
            require './database.php';
            $stmt = $conn->prepare("SELECT * FROM seller WHERE email= :email");
            $stmt->execute(array(
                ':email' => $email
            ));
            if ($stmt->rowCount() == 0) {
                $new_password = password_hash($password, PASSWORD_DEFAULT);
                $stmt         = $conn->prepare("INSERT INTO seller(seller_name,email,password,phone,description) 
            VALUES(:name, :email, :password, :phone, :desc)");
                $stmt->bindparam(":name", $name);
                $stmt->bindparam(":email", $email);
                $stmt->bindparam(":password", $new_password);
                $stmt->bindparam(":phone", $phone);
                $stmt->bindparam(":desc", $desc);
                $stmt->execute();
                return $stmt;
            } else {
                echo 'Email alredy exist !';
            }
        }
        catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    public function is_loggedin() {
        if (isset($_SESSION['user_session'])) {
            return true;
        }
    }
    public function redirect($url) {
        header("Location: $url");
    }
    public function logout() {
        session_destroy();
        unset($_SESSION['user_session']);
        return true;
    }
    public function sidebar(){
        include ('./database.php');
        $sql = "SELECT * from category";
        $result = $conn->query($sql);

        foreach ($result as $key) {
            echo "<button class='dropdown-btn'>" . $key['name'] .
                "<i class='fa fa-caret-down'></i>
                </button>";
                $id_cat = $key['id_cat'];

                $sql = "SELECT * from subcategory WHERE id_cat = $id_cat";
                $sub = $conn->query($sql);

                echo " <div class='dropdown-container'>";
                foreach ($sub as $subc) {       
                echo "<a href='category.php?id=" .$subc['id_subcat']. "'>" .$subc['name']. "</a>";
                }
                echo "</div>";
                echo "<hr>";
        }
    } 
    public function allArticles() {
        require './database.php';
        $sql = "SELECT * from article WHERE status = 1";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<a href=./article.php?id=" . $subc['article_id'] . ">";
            echo "<div class='card'>";
            echo "<img src=" . $subc['img'] . ">";
            echo "</a> ";
            echo "<h4>" . $subc['name'] . "</h4><br>";
            echo "<p>" . $subc['price'] . "$</p>";
            echo "</div>";
        }
    }
    public function articlesById($a_id) {
        require './database.php';
        $sql = "SELECT * from article WHERE SUBCAT = $a_id; AND WHERE status = 1";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<a href=./article.php?id=" . $subc['article_id'] . ">";
            echo "<div class='card'>";
            echo "<img src=" . $subc['img'] . ">";
            echo "</a> ";
            echo "<h4>" . $subc['name'] . "</h4><br>";
            echo "<p>" . $subc['price'] . "$</p>";
            echo "</div>";
        }
    }
    public function searchArticles($search) {
        require './database.php';
        $sql = "SELECT * from article WHERE `name` LIKE '%$search%' && status = 1";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<a href=./article.php?id=" . $subc['article_id'] . ">";
            echo "<div class='card'>";
            echo "<img src=" . $subc['img'] . ">";
            echo "</a> ";
            echo "<h4>" . $subc['name'] . "</h4><br>";
            echo "<p>" . $subc['price'] . "$</p>";
            echo "</div>";
        }
    }
    public function articleInfo($article) {
        require './database.php';
        $sql = "SELECT * from article WHERE article_id = $article; && status = 1";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<div class='article-img'>";
            echo "<img src=" . $subc['img'] . ">";
            echo "</div>";
            echo "<div class='article-desc'>";
            echo "<h4>" . $subc['name'] . "</h4><br>";
            echo "<p><b>Price: " . $subc['price'] . "$</b></p>";
            echo "<p>" . $subc['description'] . "</p>";
            echo "<a href=./order.php?id=" . $subc['article_id'] . ">";
            if ($_SESSION['type'] == "Buyer") {
                echo '<button type="button" class="btn btn-default">Buy Article</button>';
            }
            echo "</div>";
            echo "</div>";
        }
    }
    public function getUserImage() {
        require './database.php';
        $sql = "SELECT `img` FROM `buyer` WHERE buyer_id = $_SESSION[user_id]";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo $subc['img'];
        }
    }
    public function ordered() {
        require './database.php';
        $sql = "SELECT o.order_id,a.name, b.buyer_name, o.price, o.shiping FROM `order`AS o LEFT JOIN buyer b ON o.buyer_id = b.buyer_id LEFT JOIN article AS a ON o.id_article = a.article_id WHERE o.buyer_id = $_SESSION[user_id]";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<tr>";
            echo "<td class='column1'>" . $subc['order_id'] . "</td>";
            echo "<td class='column2'>" . $subc['name'] . "</td>";
            echo "<td class='column3'>" . $subc['shiping'] . "</td>";
            echo "<td class='column4'>" . $subc['price'] . "$</td>";
            echo "</tr>";
        }
    }
    // Getters
    // Return account type.
    public function getUserType() {
        return $_SESSION['type'];
    }
    // Return account ID.
    public function getUserId() {
        return $_SESSION['user_id'];
    }
    // Return user name.
    public function getUserName() {
        return $_SESSION['buyer_name'];
    }
    public function getSellerName() {
        return $_SESSION['buyer_name'];
    }
    // Return user email.
    public function getUserEmail() {
        return $_SESSION['email'];
    }
    // Return user password.
    public function getUserPassword() {
        return $_SESSION['password'];
    }
    // Return user phone.
    public function getUserPhone() {
        return $_SESSION['phone'];
    }
    // Return user description.
    public function getUserDesc() {
        return $_SESSION['description'];
    }
    // Order Getters
    public function getOrderId($article) {
        require './database.php';
        $sql = "SELECT * from article WHERE article_id = $article";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            return $subc['article_id'];
        }
    }
    public function getOrderName($article) {
        require './database.php';
        $sql = "SELECT * from article WHERE article_id = $article";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            return $subc['name'];
        }
    }
    public function getOrderPrice($article) {
        require './database.php';
        $sql = "SELECT * from article WHERE article_id = $article";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            return $subc['price'];
        }
    }
    public function getSellerId($article) {
        require './database.php';
        $sql = "SELECT * from article WHERE article_id = $article";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            return $subc['seller_id'];
        }
    }
    public function Order($buyer_id, $seller_id, $id_article, $price, $address) {
        require './database.php';
        try {
            $sql = "INSERT INTO `order` (`buyer_id`, `seller_id`, `id_article`, `qty`, `price`, `time`, `order_id`, `shiping`) 
            VALUES ($buyer_id, $seller_id, $id_article, '', '$price', '', NULL, '$address')";
            $conn->exec($sql);
        }
        catch (PDOException $e) {
            echo $sql . "<br>" . $e->getMessage();
        }
        $conn = null;
    }
}
class Seller {
    public function getSellerImage() {
        require './database.php';
        $sql = "SELECT img FROM seller WHERE seller_id = $_SESSION[user_id]";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo $subc['img'];
        }
    }
    public function insertArticle($name, $img, $price, $desc, $seller_id, $subcat) {
        require './database.php';
        try {
            $stmt = $conn->prepare("INSERT INTO article (name,img,price,description,seller_id,subcat) 
            VALUES(:name, :img, :price, :desc, :seller_id, :subcat)");
            $stmt->bindparam(":name", $name);
            $stmt->bindparam(":img", $img);
            $stmt->bindparam(":price", $price);
            $stmt->bindparam(":desc", $desc);
            $stmt->bindparam(":seller_id", $seller_id);
            $stmt->bindparam(":subcat", $subcat);
            $stmt->execute();
            return $stmt;
        }
        catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    public function deleteArticle($a_id) {
        require './database.php';
        try {
            $sql = "UPDATE `article` SET `status` = 0 WHERE article_id = $a_id && seller_id= $_SESSION[user_id]";
            $conn->query($sql);
        }
        catch (PDOException $e) {
            echo $e->getMessage();
        }
    }
    public function articlesBySeller() {
        require './database.php';
        $sql = "SELECT * from article WHERE seller_id = $_SESSION[user_id] && status = 1";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<a href=./article.php?id=" . $subc['article_id'] . ">";
            echo "<div class='card seller'>";
            echo "<img src=" . $subc['img'] . ">";
            echo "</a> ";
            echo "<h4>" . $subc['name'] . "</h4><br>";
            echo "<p>" . $subc['price'] . "$</p>";
            echo "<form action=deleteArticle.php?id=" . $subc['article_id'] . " method='post'>";
            echo "<input class='delete-btn' type='submit' value='Delete' name='delete' action='deleteArticle.php?id=5'>";
            echo '</form>';
            echo "</div>";
        }
    }
    public function category() {
        require './database.php';
        $sql = "SELECT * from subcategory";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<option value=" . $subc['id_subcat'] . ">" . $subc['name'] . "</option>";
        }
    }
    public function sold() {
        require './database.php';
        $sql = "SELECT o.order_id,a.name, b.buyer_name, o.price, o.shiping FROM `order`AS o LEFT JOIN buyer b ON o.buyer_id = b.buyer_id LEFT JOIN article AS a ON o.id_article = a.article_id WHERE o.seller_id = $_SESSION[user_id]";
        $sub = $conn->query($sql);
        foreach ($sub as $subc) {
            echo "<tr>";
            echo "<td class='column1'>" . $subc['order_id'] . "</td>";
            echo "<td class='column2'>" . $subc['name'] . "</td>";
            echo "<td class='column3'>" . $subc['shiping'] . "</td>";
            echo "<td class='column4'>" . $subc['price'] . "$</td>";
            echo "</tr>";
        }
    }
}
?>