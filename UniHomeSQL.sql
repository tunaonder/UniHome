-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 22, 2016 at 07:09 AM
-- Server version: 5.5.52
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `unihomev2`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(11) NOT NULL,
  `user_1_id` int(11) NOT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `user_1_name` varchar(128) NOT NULL,
  `user_2_name` varchar(128) NOT NULL,
  `product_1_name` varchar(128) DEFAULT NULL,
  `product_2_name` varchar(128) DEFAULT NULL,
  `data_1` text,
  `data_2` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_type_id` (`event_type_id`),
  KEY `user_1_id` (`user_1_id`),
  KEY `user_2_id` (`user_2_id`),
  KEY `product_1_id` (`product_1_name`),
  KEY `product_2_id` (`product_2_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=140 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_type_id`, `user_1_id`, `user_2_id`, `user_1_name`, `user_2_name`, `product_1_name`, `product_2_name`, `data_1`, `data_2`, `date_created`) VALUES
(93, 5, 2, 1, 'Zahra Ghaed', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-12 22:29:29'),
(94, 4, 2, 1, 'Zahra Ghaed', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-12 22:29:35'),
(95, 4, 2, 3, 'Zahra Ghaed', 'Deniz Sahici', NULL, NULL, NULL, NULL, '2016-11-12 22:29:52'),
(96, 4, 1, 3, 'Sait Onder', 'Deniz Sahici', NULL, NULL, NULL, NULL, '2016-11-13 16:30:40'),
(97, 8, 7, NULL, 'Reza', '', 'laptop', NULL, NULL, NULL, '2016-11-13 19:50:34'),
(98, 8, 1, NULL, 'Sait Onder', '', 'IPhone 4', NULL, NULL, NULL, '2016-11-14 01:08:47'),
(99, 4, 8, 1, 'Tuna Onder', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-14 01:17:40'),
(100, 8, 9, NULL, 'test', '', 'object test for sale', NULL, NULL, NULL, '2016-11-14 01:23:28'),
(101, 8, 8, NULL, 'Tuna Onder', '', 'Superman Tank Top', NULL, NULL, NULL, '2016-11-14 01:40:18'),
(102, 8, 8, NULL, 'Tuna Onder', '', 'Desk chair. 3 years old', NULL, NULL, NULL, '2016-11-14 01:41:26'),
(103, 8, 8, NULL, 'Tuna Onder', '', 'Couch for sale', NULL, NULL, NULL, '2016-11-14 01:42:38'),
(104, 8, 8, NULL, 'Tuna Onder', '', 'Huge Desk', NULL, NULL, NULL, '2016-11-14 01:45:12'),
(105, 4, 4, 3, 'Mehmet Aslan', 'Deniz Sahici', NULL, NULL, NULL, NULL, '2016-11-14 01:45:42'),
(106, 8, 4, NULL, 'Mehmet Aslan', '', 'ipad air 2', NULL, NULL, NULL, '2016-11-14 01:46:26'),
(107, 8, 3, NULL, 'Deniz Sahici', '', 'old microwave very cheap', NULL, NULL, NULL, '2016-11-14 01:47:36'),
(108, 8, 3, NULL, 'Deniz Sahici', '', '17 inc dell monitor', NULL, NULL, NULL, '2016-11-14 01:48:35'),
(109, 8, 1, NULL, 'Sait Onder', '', 'Nike tshirt brand new', NULL, NULL, NULL, '2016-11-14 01:49:59'),
(110, 8, 1, NULL, 'Sait Onder', '', 'Tv stand', NULL, NULL, NULL, '2016-11-14 01:50:53'),
(111, 11, 7, NULL, 'Reza', '', 'laptop', NULL, ', address', NULL, '2016-11-14 02:06:16'),
(112, 8, 7, NULL, 'Reza', '', 'Very cool sunglasses', NULL, NULL, NULL, '2016-11-14 02:10:12'),
(113, 8, 7, NULL, 'Reza', '', 'Pretty boot good condition ', NULL, NULL, NULL, '2016-11-14 02:13:56'),
(114, 8, 7, NULL, 'Reza', '', 'Good condition microwave', NULL, NULL, NULL, '2016-11-14 02:16:12'),
(115, 8, 7, NULL, 'Reza', '', 'good nice chair', NULL, NULL, NULL, '2016-11-14 02:18:29'),
(116, 8, 7, NULL, 'Reza', '', 'Old cool bed', NULL, NULL, NULL, '2016-11-14 02:20:15'),
(117, 8, 7, NULL, 'Reza', '', 'ps3 with 100 games', NULL, NULL, NULL, '2016-11-14 02:22:15'),
(118, 8, 7, NULL, 'Reza', '', 'Some funny toy ', NULL, NULL, NULL, '2016-11-14 02:25:35'),
(119, 8, 7, NULL, 'Reza', '', 'Not used plate', NULL, NULL, NULL, '2016-11-14 02:28:22'),
(120, 8, 7, NULL, 'Reza', '', 'shaving razor', NULL, NULL, NULL, '2016-11-14 02:31:17'),
(121, 9, 9, NULL, 'test', '', 'object test for sale', NULL, NULL, NULL, '2016-11-14 02:32:42'),
(122, 8, 10, NULL, 'John Smith', '', 'Large LED TV', NULL, NULL, NULL, '2016-11-14 05:34:11'),
(123, 8, 10, NULL, 'John Smith', '', 'Lovely armchair', NULL, NULL, NULL, '2016-11-14 05:41:04'),
(124, 8, 10, NULL, 'John Smith', '', 'Romantic lamp', NULL, NULL, NULL, '2016-11-14 05:43:08'),
(125, 11, 10, NULL, 'John Smith', '', 'Romantic lamp', NULL, ', price', NULL, '2016-11-14 05:45:51'),
(126, 8, 2, NULL, 'Zahra Ghaed', '', 'Formal coat with tag', NULL, NULL, NULL, '2016-11-14 05:49:56'),
(127, 8, 2, NULL, 'Zahra Ghaed', '', 'GE airconditioner', NULL, NULL, NULL, '2016-11-14 05:51:51'),
(128, 8, 2, NULL, 'Zahra Ghaed', '', 'Paintings', NULL, NULL, NULL, '2016-11-14 05:54:18'),
(129, 8, 2, NULL, 'Zahra Ghaed', '', 'High tech phone', NULL, NULL, NULL, '2016-11-14 05:57:27'),
(130, 8, 2, NULL, 'Zahra Ghaed', '', 'VT sweater', NULL, NULL, NULL, '2016-11-14 05:59:57'),
(131, 8, 2, NULL, 'Zahra Ghaed', '', '2015 mac book pro', NULL, NULL, NULL, '2016-11-14 06:06:56'),
(132, 8, 2, NULL, 'Zahra Ghaed', '', 'Modern desk lamp', NULL, NULL, NULL, '2016-11-14 06:09:11'),
(133, 11, 7, NULL, 'Reza', '', 'Not very used plate', NULL, ', title, address', NULL, '2016-11-14 18:54:49'),
(134, 11, 7, NULL, 'Reza', '', 'Not very used plate', NULL, ', description', NULL, '2016-11-14 18:55:23'),
(135, 4, 12, 1, 'Test', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-16 01:56:35'),
(136, 8, 13, NULL, 'Kurt Luther', '', 'some furniture', NULL, NULL, NULL, '2016-11-20 21:41:28'),
(137, 11, 13, NULL, 'Kurt Luther', '', 'some furniture!', NULL, ', title', NULL, '2016-11-20 21:41:35'),
(138, 4, 13, 1, 'Kurt Luther', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-20 21:42:36'),
(139, 4, 13, 2, 'Kurt Luther', 'Zahra Ghaed', NULL, NULL, NULL, NULL, '2016-11-20 21:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(4, 'follow_user'),
(5, 'unfollow_user'),
(8, 'add_item'),
(9, 'delete_item'),
(11, 'edit_item');

-- --------------------------------------------------------

--
-- Table structure for table `Favorite`
--

CREATE TABLE IF NOT EXISTS `Favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Favorite`
--

INSERT INTO `Favorite` (`id`, `user_id`, `post_id`) VALUES
(1, 1, 6),
(2, 8, 8),
(3, 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `Follow`
--

CREATE TABLE IF NOT EXISTS `Follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) NOT NULL,
  `followee_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Follow`
--

INSERT INTO `Follow` (`id`, `follower_id`, `followee_id`, `date_created`) VALUES
(1, 1, 2, '2016-11-12 22:20:16'),
(3, 2, 1, '2016-11-12 22:29:35'),
(4, 2, 3, '2016-11-12 22:29:52'),
(5, 1, 3, '2016-11-13 16:30:40'),
(6, 8, 1, '2016-11-14 01:17:40'),
(7, 4, 3, '2016-11-14 01:45:42'),
(8, 12, 1, '2016-11-16 01:56:35'),
(9, 13, 1, '2016-11-20 21:42:36'),
(10, 13, 2, '2016-11-20 21:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE IF NOT EXISTS `Post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `photoInfo` varchar(128) DEFAULT NULL,
  `conditionInfo` enum('New','Used') NOT NULL,
  `category` enum('For Sale','Roommate') NOT NULL,
  `type` enum('Furniture','Electronic','Clothing','Misc','Household') NOT NULL,
  `address` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`id`, `title`, `description`, `price`, `photoInfo`, `conditionInfo`, `category`, `type`, `address`, `created_at`, `created_by`) VALUES
(1, 'Iphone 5s, has no problem!', 'This Phone works perfectly without any problems!. There are just a few scratches, but it is perfectly normal for 2 years old phone! It has been generally used with a case and screen protector', 200, 'iphone.jpg', 'Used', 'For Sale', 'Electronic', 'Blacksburg, VA', '2016-11-12 22:20:16', 1),
(2, 'Brand New VT shirt', 'Brand New VIRGINIA TECH FROM NIKE! %100 Cotton. Price is negotiable! You can text me a message!', 35, 'vtshirt.jpg', 'New', 'For Sale', 'Clothing', 'Blacksburg, VA', '2016-11-12 22:20:16', 1),
(3, 'PS 4 Refurbished. Good Condition', 'This ps4 is only 3 months old! Bought refurbished, but couldnt find enough time to play. Three games will be given with the console for free(GTA 5, FIFA 2016, Witcher 3). If you dont want the games, price can be $150!', 250, 'ps4.jpg', 'Used', 'For Sale', 'Electronic', 'Roanoke, VA', '2016-11-12 22:20:16', 2),
(4, 'Coffe Machine, less than 1 year old!', 'Perfect quality German Product! Almost 1 year old, but looks like brand new! If you like coffee, Bosch Tossimo is for you! Less than half price of a brand new one.', 30, 'coffemachine.jpg', 'Used', 'For Sale', 'Household', 'Radford, VA', '2016-11-12 22:20:16', 2),
(5, 'High Quality Drawer!', 'Only reason I sell this drawer is I graduated and going to leave Blacksburg in a week! Must be picked up ASAP. Price can be negotiable.', 220, 'drawer.jpg', 'Used', 'For Sale', 'Furniture', 'Blacksburg, VA', '2016-11-12 22:20:16', 1),
(6, 'Adidas Outdoor for cheap price!', 'After I bought these nice pair of shoes, I realized that they dont fit well to me. Its size is 9 US. I am selling this $50 cheaper than the original price. Call me!', 75, 'shoe.jpg', 'Used', 'For Sale', 'Clothing', 'Roanoke, VA', '2016-11-12 22:20:16', 3),
(7, 'laptop', 'used works perfectly fine!', 500, '50430-laptop.jpg', 'Used', 'For Sale', 'Electronic', 'blacksburg', '2016-11-13 19:50:34', 7),
(8, 'IPhone 4', '3 years old Iphone. Works great! Price is negotiable', 100, '29223-iphone4.jpg', 'Used', 'For Sale', 'Electronic', 'blacksburg', '2016-11-14 01:08:47', 1),
(10, 'Superman Tank Top', 'Brand new shirt. Size small', 10, '24632-superman.jpg', 'New', 'For Sale', 'Clothing', 'roanoke\r\n', '2016-11-14 01:40:18', 8),
(11, 'Desk chair. 3 years old', 'Comfortable chair without any problem. $15 or best offer', 15, '71555-chair.jpg', 'Used', 'For Sale', 'Furniture', 'blacksburg', '2016-11-14 01:41:26', 8),
(12, 'Couch for sale', 'it is very comfortable and has no problems. ', 50, '42716-couch.jpg', 'Used', 'For Sale', 'Furniture', 'blacksburg', '2016-11-14 01:42:38', 8),
(13, 'Huge Desk', 'Perfect condition no scratch like a brand new', 100, '53950-desk.jpg', 'Used', 'For Sale', 'Furniture', 'blacksburg', '2016-11-14 01:45:12', 8),
(14, 'ipad air 2', 'good condition, just a few scratches', 300, '97024-ipad.jpg', 'Used', 'For Sale', 'Electronic', 'blacksburg', '2016-11-14 01:46:26', 4),
(15, 'old microwave very cheap', 'works fine. price is negotiable. please message me', 20, '23494-microvawe.jpg', 'Used', 'For Sale', 'Household', 'christiansburg', '2016-11-14 01:47:36', 3),
(16, '17 inc dell monitor', 'works perfect. price is not negotiable', 50, '57594-monitor.jpg', 'Used', 'For Sale', 'Electronic', 'christiansburg', '2016-11-14 01:48:35', 3),
(17, 'Nike tshirt brand new', 'I am selling because it fits small to my size. Size is Medium.', 30, '68006-tshirt.jpg', 'New', 'For Sale', 'Clothing', 'blacksburg', '2016-11-14 01:49:59', 1),
(18, 'Tv stand', 'Must be picked up or delivery is extra $10', 30, '87447-tv_stand.jpg', 'Used', 'For Sale', 'Furniture', 'blacksburg', '2016-11-14 01:50:53', 1),
(19, 'Very cool sunglasses', 'Never used good condition sunglasses just for you', 1000, '46563-ray_ban_black_1.jpg', 'Used', 'For Sale', 'Clothing', 'california', '2016-11-14 02:10:12', 7),
(20, 'Pretty boot good condition ', 'never used we can talk about the price!', 67, '8552-boots..jpg', 'Used', 'For Sale', 'Clothing', 'texas', '2016-11-14 02:13:56', 7),
(21, 'Good condition microwave', 'This is working good microwave', 10, '17506-microwave.jpg', 'New', 'For Sale', 'Household', 'blacksburg', '2016-11-14 02:16:12', 7),
(22, 'good nice chair', 'this is very good chair yes. Only used for 25 years.', 300, '3962-cgair.jpg', 'Used', 'For Sale', 'Furniture', 'roanoke', '2016-11-14 02:18:29', 7),
(23, 'Old cool bed', 'You can sleep on it for eternity', 20, '79536-bed.jpg', 'Used', 'For Sale', 'Furniture', 'graveyard', '2016-11-14 02:20:15', 7),
(24, 'ps3 with 100 games', 'Not played with it a lot. works perfect.', 130, '9328-ps3.jpg', 'Used', 'For Sale', 'Electronic', 'north pole', '2016-11-14 02:22:15', 7),
(25, 'Some funny toy ', 'I don''t know why I bought it for myself I''m a grown up man!!', 30, '29256-download.jpg', 'New', 'For Sale', 'Misc', 'blacksburg\r\n', '2016-11-14 02:25:35', 7),
(26, 'Not very used plate', 'I never used it for myself, just for guests.', 60, '86697-plate.jpg', 'New', 'For Sale', 'Household', 'blacksburg', '2016-11-14 02:28:22', 7),
(27, 'shaving razor', 'Best in the market, no hair will dare to grow when they see the sharp razor treating their existence.', 40, '84784-gillete.jpg', 'New', 'For Sale', 'Household', 'blacksburg', '2016-11-14 02:31:17', 7),
(28, 'Large LED TV', 'Like brand new. Barely used', 400, '85360-img_5301.jpg', 'New', 'For Sale', 'Electronic', 'radford, va', '2016-11-14 05:34:11', 10),
(29, 'Lovely armchair', 'brand new Italian style armchair', 250, '90276-img_5300.jpg', 'New', 'For Sale', 'Furniture', 'pulaski, va', '2016-11-14 05:41:04', 10),
(30, 'Romantic lamp', 'perfect for a small bedroom', 50, '9641-img_5310.jpg', 'New', 'For Sale', 'Furniture', 'blacksburg, va', '2016-11-14 05:43:08', 10),
(31, 'Formal coat with tag', 'New H&M coat. Perfect for interview. Bought for 50, asking for 40. ', 40, '67890-fullsizerender.jpg', 'New', 'For Sale', 'Clothing', 'christiansburg, va', '2016-11-14 05:49:56', 2),
(32, 'GE airconditioner', 'Works fine. Perfect for hot summers.', 320, '84042-img_5304.jpg', 'Used', 'For Sale', 'Household', 'salem, va', '2016-11-14 05:51:51', 2),
(33, 'Paintings', 'From a local artist. Priceless', 980, '12501-img_5306.jpg', 'New', 'For Sale', 'Household', 'roanoke, va', '2016-11-14 05:54:18', 2),
(34, 'High tech phone', 'Last used hundred years ago.', 1, '68662-img_5311.jpg', 'Used', 'For Sale', 'Electronic', 'virginia beach, va', '2016-11-14 05:57:27', 2),
(35, 'VT sweater', 'small. Never used. Selling because it doesn''t fit.', 20, '9537-img_5312.jpg', 'New', 'For Sale', 'Clothing', 'fairfax, va', '2016-11-14 05:59:57', 2),
(36, '2015 mac book pro', 'selling because I bought a 2016 model.', 2000, '31831-img_5314.jpg', 'Used', 'For Sale', 'Electronic', 'blacksburg, va', '2016-11-14 06:06:56', 2),
(37, 'Modern desk lamp', 'Bought it from a garage sale. Selling because no longer needed.', 10, '25037-img_5315.jpg', 'Used', 'For Sale', 'Household', 'richmond, va', '2016-11-14 06:09:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `university` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('User','Admin') NOT NULL DEFAULT 'User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `phone_number`, `university`, `password`, `created_at`, `type`) VALUES
(1, 'Sait Onder', 'saito@vt.edu', '5401112233', 'Virginia Tech', '1234', '2016-11-12 22:20:16', 'Admin'),
(2, 'Zahra Ghaed', 'ghaed@vt.edu', '1234567890', 'Virginia Tech', '1234', '2016-11-12 22:20:16', 'Admin'),
(3, 'Deniz Sahici', 'deniz@radford.edu', '4445551313', 'Radford University', '1234', '2016-11-12 22:20:16', 'User'),
(4, 'Mehmet Aslan', 'metmet@vt.edu', '3503506666', 'Virginia Tech', '1234', '2016-11-12 22:20:16', 'User'),
(5, 'Metin Kaya', 'metin@nrc.edu', '3503506666', 'New River College', '1234', '2016-11-12 22:20:16', 'User'),
(6, 'Raziye Eraydin', 'raziye@vt.edu', '3503506666', 'Roanoke College', '1234', '2016-11-12 22:20:16', 'User'),
(7, 'Reza', 'rtasooji@vt.edu', '1234567890', 'Virginia Tech', '1234', '2016-11-13 19:44:31', 'User'),
(8, 'Tuna Onder', 'tuna.bilkent@gmail.com', '1111444332', 'Radford University', '1234', '2016-11-14 01:16:46', 'User'),
(9, 'test', 't@t.con', '1234567890', 'Virginia Tech', '1234', '2016-11-14 01:21:55', 'User'),
(10, 'John Smith', 'jsmith@test.com', '1234567890', 'Virginia Tech', '1234', '2016-11-14 01:23:55', 'User'),
(11, 'navya', 'navya@gmail.com', '3233213213', 'Virginia Tech', '1234', '2016-11-15 03:41:46', 'User'),
(12, 'Test', 'test@test.com', '5401111111', 'Virginia Tech', '12345678', '2016-11-16 01:55:47', 'User'),
(13, 'Kurt Luther', 'kluther@vt.edu', '4042750400', 'Virginia Tech', 'test', '2016-11-20 21:37:41', 'Admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_5` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
