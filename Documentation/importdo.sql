-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2019 at 04:19 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `importdo`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://denrakaev.com/wp-content/uploads/2015/03/no-image.png',
  `price` decimal(10,2) NOT NULL,
  `description` varchar(10000) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Slike proizvoda su informativnog tipa i moguće je da u potpunosti ne odgovaraju proizvodu.',
  `seller_id` int(11) NOT NULL,
  `subcat` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `name`, `img`, `price`, `description`, `seller_id`, `subcat`, `status`, `datetime`) VALUES
(58, 'Lacoste Men\'s L1212 Cotton Short Sleeve Classic Fit Polo Shirt', 'https://i.ebayimg.com/images/g/WtQAAOSwRLJdFvKm/s-l1600.jpg', '55.99', 'Lacoste Men\'s L1212 Cotton Short Sleeve Classic Fit Polo Shirt', 17, 18, 1, '0000-00-00 00:00:00'),
(59, 'Ralph Lauren Men\'s Polo Short Sleeve Polo T Shirt Custom Slim Fit 100% Authentic', 'https://i.ebayimg.com/images/g/Z08AAOSwEJZdNgqk/s-l1600.jpg', '33.73', 'Ralph Lauren Mens Polo Shirt     Brand new with tag   Custom Slim Fit  Short sleeves with ribbed armbands.  tennis tail   singature emboroidered pony at the left chest   100% cotton 2 button placket   ribbed collar and sleeve hems   machine washable     Size Guide   Small: 36\"-38\"  Medium 38\"-40\"  Large 40\"-42\"  XL 42\"-44\"  XXL 44\"-46\"        Shipping    all order are shipped same Working Day if order made before 14 o\'clock ', 17, 18, 1, '0000-00-00 00:00:00'),
(60, 'New Double Outdoor Person Travel Camping Hanging Hammock Bed Wi Mosquito Net Set', 'https://i.ebayimg.com/images/g/Dp4AAOSwT4ZbA9y2/s-l1600.jpg', '19.79', 'Features   ★ SOFT AND COMFORTABLE: The soft and silky tactility and the lightweight and appropriate size, it’s softer & stronger than most other hammocks. For sports and outdoors.And you don\'t need to buy extra straps. Come on, have a great holiday with your family!  ★ REFUSED TO BE A MOSQUITO DINNER: Needle-like meshes and easily-close zippers, mosquito net can keep the bugs out and let you sleep in comfort.Our design allows the hammock to be simply turned over for use with or without mosquito net.  ★ SUPPORTING UP TO 400 lbs: Ours are made of high quality 210T parachute nylon ,This extra soft yet strong material gives you the most comfortable and relaxing experience ever. you can lay down with your kids and you will still have plenty of room.  ★ LIGHTWEIGHT AND COMPACT: It is only 1.45lb. Packs down to about the size of a grapefruit. This portable hammock redefines grab-n-go camping. No need to take along a bulky pad and heavy sleeping bag, just stuffing the hammock into the small attached sack and carrying it to your trip.', 17, 24, 1, '0000-00-00 00:00:00'),
(61, '100 LED Solar Power Fairy Light String Lamp Party Christmas Xmas Decor Outdoor', 'https://i.ebayimg.com/images/g/wEEAAOSw-0xYRfqR/s-l1600.jpg', '9.99', 'These holiday lights don\'t have to be used just for the holidays. You can use them to deck out your patio or bring new life into any room inside your house. The best part? These lights are solar powered so you won\'t take on any additional electrical costs and they automatically turn off when the power is out. These Solar String Lights could decorate your home and garden perfectly! Colorful, bright, energy saving and convenient, suitable for gardening decoration or commercial activities. The celebration is coming now, come and get your Solar String Lights!', 17, 24, 1, '0000-00-00 00:00:00'),
(62, 'Sun Joe Spx3000 Pressure Joe 2030 PSI 1.76 GPM 14.5-amp Electric Pressure Washer', 'https://i.ebayimg.com/00/s/MTYwMFgxNjAw/z/DBgAAOSwnypcjnEM/$_32.JPG', '35.85', 'Product Identifiers GTIN0856890003733 BRANDSnow Joe LLC MPNSPX3000 UPC0856890003733 eBay Product ID (ePID)6027052031 Product Key Features ModelSPX3000 StyleModern Power SourceCorded Electric Max. Pressure3000 psi TypeCold Water Pressure Washer', 17, 12, 1, '0000-00-00 00:00:00'),
(63, 'CREE H4 HB2 9003 2000W 300000LM 4-Sides LED Headlight Kit Hi/Lo Power Bulb 6000K', 'https://i.ebayimg.com/images/g/lEUAAOSwyrlcYnVW/s-l1600.jpg', '24.99', 'Specification:  Plug Type: H4, Hi-Lo Beam Power(per set): 2000W/Set, 1000W/bulb LED Quantity(each bulb): 4pcs* COB chips Luminous Flux: 300000lm/set (150000lm/bulb) Operating Voltage: DC 9-32V(fit 12V,24V vehicles) Color Temperature: Pure White 6000K - 6500K IP68 rated water and dust seal,over 50000hrs lifetime Beam Angle: 270 degree@low beam,360 degree@high beam Material: Aviation 6063 aluminum profile Operating Temperature: -40-80 degree Celsius Usage: Headlight, Fog light', 17, 34, 1, '0000-00-00 00:00:00'),
(64, 'LEMFO LF23 Smart Watch Waterproof Sport Fitness Bracelet Tracker For Android iOS', 'https://i.ebayimg.com/images/g/5CUAAOSwzkRdDwwn/s-l1600.jpg', '16.99', 'LEMFO LF23 Flagship Rugged Smartwatch 33-month Standby Time 24h All-Weather Monitor Waterproof IP68 Smart Watch For IOS Android  Details:   *  1.21inch FSTN LCD full-view screen     *  50 meters waterproof, can swim  (Note: Do not wear in the saunal, hot spring environment)     *  Built-in 610MAh CR2450 standard button battery, No need to charge,  Standby time for 33 months in power saving mode     * Call and SMS alert and Various social chat message to remind: QQ, Micro letter, Twitter, Facebook, Whatsapp, Skype (no content)     * Remote camera control: The watch could remotely control the cell phone to take pictures within 10 meters     * 24 hours real-time Sporting Activities Tracker: Walking pace, walking mileage, physical consumption of three data at a plancestep forward     *  APP name: \"Sport+\"     * Support Android 4.4 & iOS8.0 or above  ', 17, 20, 1, '0000-00-00 00:00:00'),
(65, '1/23x OEM Original Samsung Earphones Headphones Galaxy S3 S4 S5 S6 S7 S8 Note 5', 'https://i.ebayimg.com/images/g/ukUAAOSwgGZb6xZ5/s-l1600.jpg', '19.99', '   Samsung EHS64AVFWE Premium Hands Free Headset, White (3.5mm Stereo) Headset is lightweight and comfortable, this Stereo Headset enables you to carry on conversations while you continue to do other things (For Devices that Support Phone Calling), including listening to music on the go. Universally compatible for use with other devices having a 3.5mm connector/jack. - Remote - In-Line Mic - White - 3.5mm Headset Jack. Compatible with: Droid Charge i510, Nexus S i9020a i9020t D720, INFUSE 4G and Samsung Galaxy S Phone Models.', 17, 15, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL,
  `buyer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `buyer_name`, `email`, `password`, `img`, `phone`, `description`, `status`) VALUES
(1, 'Kenan Babačić', 'babacic@bk.ru', '$2y$10$qdCnT/k04Zp6PsTdNcdUOezVH/5BI1RamTqRBEVUM0QT8iv01KdXa', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+365894785', 'Oto je moj testni profil', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cat` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cat`, `name`) VALUES
(1, 'Automobiles & Motorcycles'),
(2, 'Home & Garden'),
(3, 'Electronics'),
(4, 'Fashion'),
(5, 'Health & Beauty'),
(8, 'Sports & Outdoors'),
(9, 'Baby & Kids'),
(12, 'Collectibles');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(6) NOT NULL,
  `shiping` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `buyer_id`, `seller_id`, `id_article`, `qty`, `price`, `shiping`, `time`) VALUES
(1, 1, 17, 58, 0, 56, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `seller_name`, `email`, `password`, `img`, `phone`, `description`, `status`) VALUES
(17, 'Admin', 'babacic@bk.ru', '$2y$10$uR4aHt.pSEm4v.UUEWHA3ebjdFzx0W0pr0hVcRR5wtWY4O1xwF1Fe', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+365894785', 0, 1),
(18, 'makel', 'xodx?xdox@hotmail.com', '$2y$10$m/vJOA28fcCwNay38zTFpeO0LOVcdqimZ5meYUh88h55lX0mhpO3O', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '061091980', 0, 1),
(19, 'makel', 'xdox_xdox@homtail.com', '$2y$10$6UoBnP4tT0R/lWWs07a7Su.Ya8WlqxWqzM8SLi4GUHjNAHM42Nu4e', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '061091980', 0, 1),
(20, 'filmotex.eu', 'babacic.kenan.kenan52@gmail.com', '$2y$10$TGPbPEKW3FCP9vSk0LaU8ea51NFTMPiFdK8eLa6g64jnQGqK1wb2S', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+365894785', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id_subcat` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_cat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id_subcat`, `name`, `id_cat`) VALUES
(3, 'Car Parts', 1),
(8, 'Toys', 9),
(9, 'LEGO', 9),
(10, 'Clothes', 9),
(12, 'Tools & Workshop Equipment', 2),
(13, 'Cell Phones', 3),
(14, 'Smart Watches', 3),
(15, 'Accessories', 3),
(16, 'Women\'s Clothing\r\n', 4),
(17, 'Women\'s Shoes\r\n', 4),
(18, 'Men\'s Clothing', 4),
(19, 'Men\'s Shoes', 4),
(20, 'Watches', 4),
(21, 'Fine Jewelry', 4),
(22, 'Fashion Jewelry', 4),
(23, 'Men\'s Accessories', 4),
(24, 'Yard, Garden & Outdoor Living', 2),
(25, 'Home Improvement', 2),
(26, 'Baby', 2),
(27, 'Kitchen, Dining & Bar', 2),
(28, 'Lamps, Lighting & Ceiling Fans', 2),
(29, 'Makeup', 5),
(30, 'Health Care', 5),
(31, 'Fragrances', 5),
(32, 'Nail Care, Manicure & Pedicure', 5),
(33, 'Hair Care & Styling', 5),
(34, 'Car Lights', 1),
(35, 'Auto Replacement Parts', 1),
(36, 'Car Electronics', 1),
(37, 'Interior Accessories', 1),
(38, 'Car Repair Tools', 1),
(39, 'Exterior Accessories', 1),
(40, 'Cycling', 8),
(41, 'Outdoor Sports', 8),
(42, 'Hunting', 8),
(43, 'Fishing', 8),
(44, 'Fitness, Running & Yoga', 8),
(45, 'Action Figures', 12),
(46, 'Coins and Paper Money', 12),
(47, 'Stamps', 12),
(48, 'Postcards', 12),
(49, 'Autographed Memorabilia', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `subcategory` (`subcat`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id_subcat`),
  ADD KEY `id_cat` (`id_cat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id_subcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`subcat`) REFERENCES `subcategory` (`id_subcat`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `category` (`id_cat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
