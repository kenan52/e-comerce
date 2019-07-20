-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2019 at 04:08 PM
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
(2, 'Frizider', 'https://www.lacasadelelectrodomestico.com/varios/ImagenesArticulos/u_10144969.jpg', '2658.99', 'regerg er ger ', 4, 4, 0, '0000-00-00 00:00:00'),
(3, 'Austone 175/65R14 82T SP801', 'https://ekupi.blob.core.windows.net/ekupime/1200Wx1200H/ME-y204759_1.image', '28.00', 'Slike proizvoda su informativnog tipa i moguće je da u potpunosti ne odgovaraju proizvodu.', 10, 3, 1, '0000-00-00 00:00:00'),
(4, 'Mercedes SLS AMG GT R', 'https://ekupi.blob.core.windows.net/ekupime/1200Wx1200H/ME-y204048_1.image', '179.00', 'Model: Mercedes SLS AMG GT R\r\nBoja: Bijela\r\nMotor: 2x 45W\r\nBaterija: 2x 6V 4,5Ah\r\nBrzine: 2 brzine u autići - 3 razine brzine na daljinskom\r\nKotači: mekani EVA kotači osiguravaju komfor\r\nVeličina auta: 102cm x 62cm x 53cm\r\nPromjer kotača: 19cm brzina: 2-5 km/h\r\nTežina vozila: 20 kg\r\nMax. opterećenje: 30 kg\r\nVrijeme punjenja: 8 - 12 sati\r\nVrijeme vožnje: do 1 sat', 10, 8, 1, '0000-00-00 00:00:00'),
(6, 'Quad BMD0909 bijeli', 'https://ekupi.blob.core.windows.net/ekupime/1200Wx1200H/ME-y206287_1.image', '189.00', 'Quad BMD0909 bijeli - auto na akumulator', 10, 8, 1, '0000-00-00 00:00:00'),
(7, 'Audi TT RS crveni', 'https://ekupi.blob.core.windows.net/ekupime/1200Wx1200H/ME-y204046_1.image', '159.00', 'Audi TT RS crveni', 10, 8, 1, '0000-00-00 00:00:00'),
(12, 'Tigar 195/65 R15 91H', 'https://ekupi.blob.core.windows.net/ekupime/1200Wx1200H/ME-y205329_1.image', '48.65', 'Slike proizvoda su informativnog tipa i moguće je da u potpunosti ne odgovaraju proizvodu.', 16, 3, 1, '0000-00-00 00:00:00'),
(13, 'test', 'http://denrakaev.com/wp-content/uploads/2015/03/no-image.png', '99.00', 'Slike proizvoda su informativnog tipa i moguće je da u potpunosti ne odgovaraju proizvodu.', 16, 3, 1, '0000-00-00 00:00:00');

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
  `status` int(11) NOT NULL,
  `account_enabled` int(11) NOT NULL,
  `account_expiry` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `buyer_name`, `email`, `password`, `img`, `phone`, `description`, `status`, `account_enabled`, `account_expiry`) VALUES
(53, 'Filmotex', 'babacic@bk.ru', 'e10adc3949ba59abbe56e057f20f883e', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+358654876', 'ifyeiuiugeifeif', 0, 0, '0000-00-00'),
(55, 'filmotex.eu', 'egsegrg@gmail.com', '$2y$10$nGJci4VEeyUeIIiIcvRrDOpsZ/BPn/CCMxCLX.2OhJek.pz4XNkDm', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+358654876', 'ifyeiuiugeifeif', 0, 0, '0000-00-00'),
(61, 'Serpents', 'serpents@gmail.com', '$2y$10$gsnRvOVu38g8lb4nidk/AO5iMpUL3UxK223A3O6TcBYjCUhrRrBXq', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+365894785', 'fopwe ifweofihewoi ho', 0, 0, '0000-00-00'),
(62, 'f', 'fff@gmail.com', '$2y$10$YsZUvmckB/QHrw64se9JkePUJDNmPE5csFUqi3Z2nL6jnB69.ooyK', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+365894785', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0, 0, '0000-00-00');

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
(1, 'Cars'),
(2, 'Home & Garden'),
(3, 'Electronics'),
(4, 'Fashion'),
(5, 'Health & Beauty'),
(6, 'Tools & Home Improvment'),
(7, 'Toys & Hobbies'),
(8, 'Sports & Outdoors'),
(9, 'Baby & Kids'),
(10, 'Jewerly & Watches');

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
(2, 1, 5, 2, 2, 222, 'sr', '0000-00-00 00:00:00'),
(3, 1, 5, 2, 2, 222, 'sr', '0000-00-00 00:00:00'),
(6, 53, 10, 2, 0, 0, '', '0000-00-00 00:00:00'),
(7, 55, 12, 4, 0, 0, '', '0000-00-00 00:00:00'),
(10, 55, 12, 4, 0, 0, '', '0000-00-00 00:00:00'),
(11, 55, 12, 4, 0, 0, '', '0000-00-00 00:00:00'),
(12, 55, 12, 4, 0, 0, '', '0000-00-00 00:00:00'),
(13, 55, 12, 4, 0, 0, '', '0000-00-00 00:00:00'),
(14, 55, 12, 4, 0, 0, '', '0000-00-00 00:00:00'),
(21, 53, 10, 4, 0, 0, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(22, 53, 10, 4, 0, 0, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(23, 53, 10, 4, 0, 0, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(24, 57, 12, 3, 0, 30, '', '0000-00-00 00:00:00'),
(25, 57, 12, 3, 0, 30, '', '0000-00-00 00:00:00'),
(26, 53, 10, 4, 0, 0, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(27, 53, 10, 4, 0, 0, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(28, 53, 10, 4, 0, 179, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(29, 53, 10, 4, 0, 179, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(30, 53, 10, 4, 0, 179, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(31, 53, 10, 3, 0, 28, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(32, 53, 10, 3, 0, 28, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(33, 53, 10, 3, 0, 28, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(34, 53, 4, 2, 0, 2659, 'Dzemala bijedica 129', '0000-00-00 00:00:00'),
(35, 53, 4, 2, 0, 2659, 'Ä†emal Babacicbabacic@bk.ru', '0000-00-00 00:00:00'),
(36, 53, 4, 2, 0, 2659, 'Name: Email: ', '0000-00-00 00:00:00'),
(37, 53, 4, 2, 0, 2659, 'Name: Ä†emalEmail: babacic@bk.ru', '0000-00-00 00:00:00'),
(38, 53, 4, 2, 0, 2659, 'Ä†emalbabacic@bk.ru', '0000-00-00 00:00:00'),
(39, 53, 4, 2, 0, 2659, ' Name: Ä†emal Email: babacic@bk.ru', '0000-00-00 00:00:00'),
(40, 53, 4, 2, 0, 2659, ' Name: Ä†emal. Email: babacic@bk.ru', '0000-00-00 00:00:00'),
(41, 53, 4, 2, 0, 2659, ' Name: Ä†emal. Email: babacic@bk.ru', '0000-00-00 00:00:00'),
(42, 53, 4, 2, 0, 2659, ' Name: Ćemal. Email: babacic@bk.ru', '0000-00-00 00:00:00'),
(43, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: . City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(44, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(45, 53, 10, 3, 0, 28, ' Name: . Email: . Address: . City: . State: . Zip: ', '0000-00-00 00:00:00'),
(46, 53, 4, 2, 0, 2659, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(47, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(48, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(49, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(50, 53, 4, 2, 0, 2659, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(51, 53, 4, 2, 0, 2659, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(52, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(53, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Ba. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(54, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(55, 53, 4, 2, 0, 2659, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(56, 53, 10, 3, 0, 28, ' Name: Ćemal Babacic. Email: babacic@bk.ru. Address: Polje BB. City: Bar. State: Polje. Zip: 71000', '0000-00-00 00:00:00'),
(57, 30, 4, 2, 0, 2659, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(61, 53, 16, 12, 0, 49, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(62, 53, 10, 3, 0, 28, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(64, 53, 16, 12, 0, 49, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(65, 53, 10, 7, 0, 159, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(66, 63, 10, 4, 0, 179, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(67, 53, 10, 3, 0, 28, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(68, 62, 10, 6, 0, 189, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00'),
(69, 62, 10, 6, 0, 189, ' Name: Kenan. Email: babacic.kenan.kenan52@gmail.com. Address: polje. City: bar. State: 85000. Zip: 85000', '0000-00-00 00:00:00');

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
  `description` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `seller_name`, `email`, `password`, `img`, `phone`, `description`) VALUES
(10, 'Filmotex', 'babacic@bk.ru', 'RHRGDFHDH', '', '+358654876', 0),
(14, 'filmotex.eu', 'babacic00@bk.ru', '$2y$10$L6453QTPw60H9SjiT2M/VOGsoC2.8S1xnMrm2Ehhuw6xEXfxcgsWi', '', '+358654876', 0),
(15, 'Kenan Babačić', 'kenan2000@live.com', '$2y$10$dv5ID36aSLV.J6zX8wWtseW4ojJPbOsQQPITkTiIt0Q1AG9hGxZ2S', 'https://scontent-waw1-1.xx.fbcdn.net/v/t1.0-9/60204737_1991376611169443_219567580099117056_n.jpg?_nc_cat=110&_nc_oc=AQnRAXnFk0LMwrczh7oImdBkNRZ1UxhnueKlK31jotewR4pdMJ_YW73H1sapse4YjoU&_nc_ht=scontent-waw1-1.xx&oh=e813f52b2edcd4cc9e12f2f0c025be3a&oe=5DB1CB11', '+365894785', 0),
(16, 'Seller Yugo', 'yugo@gmail.com', '$2y$10$x7sKpATYcYO.6mhPqG/sGOjEMbHBm.7wBHw6T6kS82FULTjJPHZqC', 'https://afcm.ca/wp-content/uploads/2018/06/no-photo.png', '+365894785', 0);

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
(10, 'Clothes', 9);

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
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id_subcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
