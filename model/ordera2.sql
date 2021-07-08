-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2021 at 04:58 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordera2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `password`, `PhoneNumber`) VALUES
('MohamedWaheed', '12121', 76270),
('mohamedsobhy', '0823o3', 857607260),
('MohamedWaheed', '123456', 1144338618);

-- --------------------------------------------------------

--
-- Table structure for table `captain`
--

CREATE TABLE `captain` (
  `delivery_id` int(11) NOT NULL,
  `First_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `Scooter` varchar(10) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `online_status` varchar(10) DEFAULT NULL,
  `transportation_state` int(11) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `captain`
--

INSERT INTO `captain` (`delivery_id`, `First_name`, `last_name`, `password`, `email`, `Scooter`, `location`, `online_status`, `transportation_state`, `PhoneNumber`) VALUES
(1, 'Bahaa', 'Mahmoud', 'bahaa', 'bahaa123@gmail.com', 'abc-123', NULL, 'Active', NULL, NULL),
(4, 'Muhammad', 'Waheed', 'Mohamed', 'mohamed@gmail.com', 'abc-124', NULL, NULL, NULL, 1144338618);

-- --------------------------------------------------------

--
-- Table structure for table `captain_trans`
--

CREATE TABLE `captain_trans` (
  `delivery` int(11) DEFAULT NULL,
  `From_location` varchar(100) DEFAULT NULL,
  `to_location` varchar(100) DEFAULT NULL,
  `distance` varchar(15) DEFAULT NULL,
  `duration` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `user_id` int(11) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `user_location` varchar(100) DEFAULT NULL,
  `product_location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `restaurants_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`restaurants_id`, `item_id`, `name`, `description`, `price`, `image`) VALUES
(2, 2, 'BigMac', 'Unavailable', 45, 'asd'),
(2, 15, 'sundays13', 'Icecream', 15, 'asd'),
(2, 16, 'sundays3', 'Icecream', 15, 'asd'),
(2, 17, 'sundays4', 'Icecream', 15, 'asd'),
(2, 18, 'sundays5', 'Icecream', 15, 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `supermarket_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `library_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `image` varchar(999) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`library_id`, `name`, `description`, `location`, `image`, `status`) VALUES
(1, 'EL Andalus', 'stationary', 1234, 'dfsgjlk', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurants_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(999) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `image` varchar(999) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurants_id`, `name`, `description`, `location`, `image`, `status`) VALUES
(1, 'mac', 'ja;jda', '12345', 'mnlnslkd', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `supermarket`
--

CREATE TABLE `supermarket` (
  `supermarket_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(999) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `image` varchar(999) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supermarket`
--

INSERT INTO `supermarket` (`supermarket_id`, `name`, `description`, `location`, `image`, `status`) VALUES
(1, 'elsheemy', 'supermarket', 123456789, 'kaj;as', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `library_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `waiting_list`
--

CREATE TABLE `waiting_list` (
  `id` int(11) NOT NULL,
  `First_name` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Scooter` varchar(10) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `waiting_list`
--

INSERT INTO `waiting_list` (`id`, `First_name`, `lastname`, `password`, `Email`, `Scooter`, `PhoneNumber`) VALUES
(4, 'Muhammad', 'Emad', 'Mohamed', 'waheed@gmail.com', 'abc-123', 1144338618),
(5, 'Muhammad', 'Emad', 'Mohamed', 'mo@gmail.com', 'abc-123', 1144338618),
(6, 'Muhammad', 'Emad', 'Mohamed', 'moh@gmail.com', 'abc-123', 1144338618),
(7, 'Muhammad', 'Emad', 'Mohamed', 'moha@gmail.com', 'abc-123', 1144338618),
(8, 'Muhammad', 'Emad', 'Mohamed', 'moha@gmail.com', 'abc-123', 1144338618),
(9, 'Muhammad', 'Emad', 'Mohamed', 'moha@gmail.com', 'abc-123', 1144338618),
(10, 'Muhammad', 'Emad', 'Mohamed', 'moha@gmail.com', 'abc-123', 1144338618),
(11, 'Muhammad', 'Emad', 'Mohamed', 'moha@gmail.com', 'abc-123', 1144338618),
(12, 'Bahaa', 'mahmoud', 'bahaa', 'bahaa246@gmail.com', 'abc-246', 144338618),
(13, 'Bahaa', 'mahmoud', 'bahaa', 'bahaa123@gmail.com', 'abc-246', 144338618),
(14, 'Bahaa', 'mahmoud', 'bahaa', 'bahaa123@gmail.com', 'abc-123', 144338618),
(15, 'Bahaa', 'mahmoud', 'bahaa', 'bahaa123@gmail.com', 'abc-123', 144338618),
(16, 'Bahaa', 'mahmoud', 'bahaa', 'bahaa123@gmail.com', 'abc-123', 144338618),
(17, 'Bahaa', 'mahmoud', 'bahaa', 'bahaa1234@gmail.com', 'abc-123', 144338618);

-- --------------------------------------------------------

--
-- Table structure for table `_user`
--

CREATE TABLE `_user` (
  `user_id` int(11) NOT NULL,
  `First_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `_user`
--

INSERT INTO `_user` (`user_id`, `First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES
(1, 'Mohamed', 'Waheed', 'waheed', 'mody.man531@gmail.com', ' ', 1144338618),
(4, 'Mohamed', 'Sobhi', 'MOSO', 'mody1234@gmail.com', 'abcde', 1044338618);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captain`
--
ALTER TABLE `captain`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`library_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurants_id`);

--
-- Indexes for table `supermarket`
--
ALTER TABLE `supermarket`
  ADD PRIMARY KEY (`supermarket_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `waiting_list`
--
ALTER TABLE `waiting_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_user`
--
ALTER TABLE `_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captain`
--
ALTER TABLE `captain`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `groceries`
--
ALTER TABLE `groceries`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `library_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurants_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supermarket`
--
ALTER TABLE `supermarket`
  MODIFY `supermarket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waiting_list`
--
ALTER TABLE `waiting_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `_user`
--
ALTER TABLE `_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `fk_food` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`restaurants_id`);

--
-- Constraints for table `groceries`
--
ALTER TABLE `groceries`
  ADD CONSTRAINT `fk_groceries` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarket` (`supermarket_id`);

--
-- Constraints for table `tools`
--
ALTER TABLE `tools`
  ADD CONSTRAINT `fk_tools` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
