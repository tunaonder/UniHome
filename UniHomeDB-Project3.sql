-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 12, 2016 at 08:02 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unihome`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `user_1_id` int(11) NOT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `user_1_name` varchar(128) NOT NULL,
  `user_2_name` varchar(128) NOT NULL,
  `product_1_name` varchar(128) DEFAULT NULL,
  `product_2_name` varchar(128) DEFAULT NULL,
  `data_1` text,
  `data_2` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_type_id`, `user_1_id`, `user_2_id`, `user_1_name`, `user_2_name`, `product_1_name`, `product_2_name`, `data_1`, `data_2`, `date_created`) VALUES
(93, 11, 2, NULL, 'Zahra Ghaed', '', 'PS 4 Refurbished. Good Condition', NULL, ', price', NULL, '2016-11-12 17:26:39'),
(94, 4, 10, 1, 'Reza Tasooji', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-12 18:35:19'),
(95, 4, 10, 3, 'Reza Tasooji', 'Deniz Sahici', NULL, NULL, NULL, NULL, '2016-11-12 18:35:28'),
(96, 5, 10, 1, 'Reza Tasooji', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-12 18:36:24'),
(97, 5, 10, 3, 'Reza Tasooji', 'Deniz Sahici', NULL, NULL, NULL, NULL, '2016-11-12 18:36:25'),
(98, 4, 10, 1, 'Reza Tasooji', 'Sait Onder', NULL, NULL, NULL, NULL, '2016-11-12 18:36:31'),
(99, 4, 10, 3, 'Reza Tasooji', 'Deniz Sahici', NULL, NULL, NULL, NULL, '2016-11-12 18:36:42'),
(100, 8, 10, NULL, 'Reza Tasooji', '', 'Laptop, like new!', NULL, NULL, NULL, '2016-11-12 18:49:29'),
(101, 11, 10, NULL, 'Reza Tasooji', '', 'Gaming laptop, like new!', NULL, ', title', NULL, '2016-11-12 18:57:24'),
(102, 4, 2, 10, 'Zahra Ghaed', 'Reza Tasooji', NULL, NULL, NULL, NULL, '2016-11-12 18:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`id`, `user_id`, `post_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followee_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower_id`, `followee_id`, `date_created`) VALUES
(1, 1, 2, '2016-11-12 00:25:05'),
(27, 8, 1, '2016-11-12 12:07:47'),
(29, 9, 1, '2016-11-12 14:04:19'),
(30, 2, 1, '2016-11-12 17:17:11'),
(33, 10, 1, '2016-11-12 18:36:31'),
(34, 10, 3, '2016-11-12 18:36:42'),
(35, 2, 10, '2016-11-12 18:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `photoInfo` varchar(128) DEFAULT NULL,
  `conditionInfo` enum('New','Used') NOT NULL,
  `category` enum('For Sale','Roommate') NOT NULL,
  `type` enum('Furniture','Electronic','Clothing','Misc','Household') NOT NULL,
  `address` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `price`, `photoInfo`, `conditionInfo`, `category`, `type`, `address`, `created_at`, `created_by`) VALUES
(1, 'Iphone 5s, has no problem!', 'This Phone works perfectly without any problems!. There are just a few scratches, but it is perfectly normal for 2 years old phone! It has been generally used with a case and screen protector', 200, 'iphone.jpg', 'Used', 'For Sale', 'Electronic', 'Blacksburg, VA', '2016-11-12 00:25:05', 1),
(2, 'Brand New VT shirt', 'Brand New VIRGINIA TECH FROM NIKE! %100 Cotton. Price is negotiable! You can text me a message!', 35, 'vtshirt.jpg', 'New', 'For Sale', 'Clothing', 'Blacksburg, VA', '2016-11-12 00:25:05', 1),
(3, 'PS 4 Refurbished. Good Condition', 'This ps4 is only 3 months old! Bought refurbished, but couldnt find enough time to play. Three games will be given with the console for free(GTA 5, FIFA 2016, Witcher 3). If you dont want the games, price can be $150!', 220, 'ps4.jpg', 'Used', 'For Sale', 'Electronic', 'Roanoke, VA', '2016-11-12 00:25:05', 2),
(4, 'Coffe Machine, less than 1 year old!', 'Perfect quality German Product! Almost 1 year old, but looks like brand new! If you like coffee, Bosch Tossimo is for you! Less than half price of a brand new one.', 30, 'coffemachine.jpg', 'Used', 'For Sale', 'Household', 'Radford, VA', '2016-11-12 00:25:05', 2),
(5, 'High Quality Drawer!', 'Only reason I sell this drawer is I graduated and going to leave Blacksburg in a week! Must be picked up ASAP. Price can be negotiable.', 220, 'drawer.jpg', 'Used', 'For Sale', 'Furniture', 'Blacksburg, VA', '2016-11-12 00:25:05', 1),
(6, 'Adidas Outdoor for cheap price!', 'After I bought these nice pair of shoes, I realized that they dont fit well to me. Its size is 9 US. I am selling this $50 cheaper than the original price. Call me!', 75, 'shoe.jpg', 'Used', 'For Sale', 'Clothing', 'Roanoke, VA', '2016-11-12 00:25:05', 3),
(7, 'Gaming laptop, like new!', 'I am selling my MSI Gaming Laptop. The Laptop is in like New working / cosmetic condition. It comes with the Box, Charger & MSI Laptop Sleeve. ', 770, '16372-laptop.jpg', 'Used', 'For Sale', 'Electronic', 'Jefferson street, Blacksburg, VA', '2016-11-12 18:49:29', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `university` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('User','Admin') NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `university`, `password`, `created_at`, `type`) VALUES
(1, 'Sait Onder', 'saito@vt.edu', '5401112233', 'Virginia Tech', '1234', '2016-11-12 00:25:05', 'Admin'),
(2, 'Zahra Ghaed', 'ghaed@vt.edu', '1234567890', 'Virginia Tech', '1234', '2016-11-12 00:25:05', 'Admin'),
(3, 'Deniz Sahici', 'deniz@radford.edu', '4445551313', 'Radford University', '1234', '2016-11-12 00:25:05', 'User'),
(4, 'Mehmet Aslan', 'metmet@vt.edu', '3503506666', 'Virginia Tech', '1234', '2016-11-12 00:25:05', 'User'),
(5, 'Metin Kaya', 'metin@nrc.edu', '3503506666', 'New River College', '1234', '2016-11-12 00:25:05', 'User'),
(6, 'Raziye Eraydin', 'raziye@vt.edu', '3503506666', 'Roanoke College', '1234', '2016-11-12 00:25:05', 'User'),
(10, 'Reza Tasooji', 'rtasooji@vt.edu', '5409999999', 'Virginia Tech', '1234', '2016-11-12 18:32:46', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_type_id` (`event_type_id`),
  ADD KEY `user_1_id` (`user_1_id`),
  ADD KEY `user_2_id` (`user_2_id`),
  ADD KEY `product_1_id` (`product_1_name`),
  ADD KEY `product_2_id` (`product_2_name`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
