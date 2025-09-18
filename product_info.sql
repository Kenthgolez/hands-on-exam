-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 18, 2025 at 04:31 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

DROP TABLE IF EXISTS `costumer`;
CREATE TABLE IF NOT EXISTS `costumer` (
  `costumerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`costumerID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `costumer`
--

INSERT INTO `costumer` (`costumerID`, `name`, `email`, `mobile`, `address`, `password`) VALUES
(11, 'alex', 'alex@gmail.com', 2147483647, 'jaro', 'alex123'),
(22, 'perd', 'perdo@gmail.com', 2147483647, 'lapaz', 'perd123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `costumerID` int NOT NULL,
  `orderDate` int NOT NULL,
  `totalAmount` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `costumerID` (`costumerID`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `costumerID`, `orderDate`, `totalAmount`, `status`) VALUES
(111, 11, 2025, 60, 0),
(222, 22, 2025, 70, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` int NOT NULL,
  `paymentMethod` varchar(25) NOT NULL,
  PRIMARY KEY (`paymentID`),
  UNIQUE KEY `orderID` (`orderID`),
  KEY `amount` (`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `orderID`, `paymentDate`, `amount`, `paymentMethod`) VALUES
(101, 111, '0000-00-00', 60, 'Gcash'),
(202, 222, '0000-00-00', 70, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(25) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `name`, `price`, `category`, `stock`) VALUES
(1, 'redhorse', 60, 'drinks', 50),
(2, 'tanduay', 70, 'drinks', 50);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `costumer`
--
ALTER TABLE `costumer`
  ADD CONSTRAINT `costumer_ibfk_1` FOREIGN KEY (`costumerID`) REFERENCES `orders` (`costumerID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `payment` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`amount`) REFERENCES `product` (`price`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
