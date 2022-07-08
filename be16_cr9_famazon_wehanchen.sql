-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 11:57 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be16_cr9_famazon_wehanchen`
--
CREATE DATABASE IF NOT EXISTS `be16_cr9_famazon_wehanchen` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `be16_cr9_famazon_wehanchen`;

-- --------------------------------------------------------

--
-- Table structure for table `address_c`
--

CREATE TABLE `address_c` (
  `id` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL,
  `fk_shipping_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address_c`
--

INSERT INTO `address_c` (`id`, `zip`, `country`, `city`, `area`, `fk_shipping_id`, `fk_customer_id`) VALUES
(1, 1050, 'Austria', 'Vienna', 'Wieden', 1, 1),
(2, 1100, 'Austria', 'Vienna', 'Favoriten', 2, 3),
(3, 1190, 'Austria', 'Vienna', 'Döbling', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'Helohome'),
(3, 'Asus');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `age` smallint(3) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `f_name`, `l_name`, `age`, `email`) VALUES
(1, 'wehan', 'chen', 18, 'chen007@live.at'),
(2, 'serri', 'ghiath', 20, 'serri@gmail.at'),
(3, 'irati', 'pinto', 20, 'irati@gmail.at');

-- --------------------------------------------------------

--
-- Table structure for table `e-commerce`
--

CREATE TABLE `e-commerce` (
  `id` int(11) NOT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `fk_many_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `e-commerce`
--

INSERT INTO `e-commerce` (`id`, `fk_order_id`, `fk_many_product_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `f_name` varchar(40) DEFAULT NULL,
  `l_name` varchar(40) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id`, `f_name`, `l_name`, `salary`) VALUES
(1, 'hasan', 'atatürk', 4000),
(2, 'dominik', 'hofmann', 3800),
(3, 'mohamad', 'heli', 3500);

-- --------------------------------------------------------

--
-- Table structure for table `many_product`
--

CREATE TABLE `many_product` (
  `id` int(11) NOT NULL,
  `fk_company_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `many_product`
--

INSERT INTO `many_product` (`id`, `fk_company_id`, `fk_product_id`) VALUES
(1, 1, 3),
(2, 3, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `id` int(11) NOT NULL,
  `fk_e_commerce_id` int(11) DEFAULT NULL,
  `fk_employer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`id`, `fk_e_commerce_id`, `fk_employer_id`) VALUES
(1, 2, 2),
(2, 1, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `payment` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `product_id`, `amount`, `order_date`, `fk_customer_id`, `payment`) VALUES
(1, 1, 1, '2022-07-08 22:58:00', 1, 'paypal'),
(2, 2, 2, '2022-07-11 22:59:02', 2, 'creditcard'),
(3, 3, 5, '2022-07-04 22:59:47', 3, 'mastercard');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_price` float DEFAULT NULL,
  `product_type` varchar(30) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_price`, `product_type`, `product_name`) VALUES
(1, 1049, 'Laptop', 'ROG Strix G15'),
(2, 328, 'Washing Machine', 'HLT16W'),
(3, 359, 'Apple Watch', 'M07H3LL/A');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `fk_many_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `fk_many_product_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shop_No` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `quantity`, `shop_No`, `fk_product_id`) VALUES
(1, 5, 3, 3),
(2, 10, 1, 1),
(3, 7, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_c`
--
ALTER TABLE `address_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shipping_id` (`fk_shipping_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e-commerce`
--
ALTER TABLE `e-commerce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_many_product_id` (`fk_many_product_id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `many_product`
--
ALTER TABLE `many_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_e_commerce_id` (`fk_e_commerce_id`),
  ADD KEY `fk_employer_id` (`fk_employer_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_many_product_id` (`fk_many_product_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_c`
--
ALTER TABLE `address_c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `e-commerce`
--
ALTER TABLE `e-commerce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `many_product`
--
ALTER TABLE `many_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_c`
--
ALTER TABLE `address_c`
  ADD CONSTRAINT `address_c_ibfk_1` FOREIGN KEY (`fk_shipping_id`) REFERENCES `shipping` (`id`),
  ADD CONSTRAINT `address_c_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `e-commerce`
--
ALTER TABLE `e-commerce`
  ADD CONSTRAINT `e-commerce_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `e-commerce_ibfk_2` FOREIGN KEY (`fk_many_product_id`) REFERENCES `many_product` (`id`);

--
-- Constraints for table `many_product`
--
ALTER TABLE `many_product`
  ADD CONSTRAINT `many_product_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `many_product_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`fk_e_commerce_id`) REFERENCES `e-commerce` (`id`),
  ADD CONSTRAINT `office_ibfk_2` FOREIGN KEY (`fk_employer_id`) REFERENCES `employer` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`fk_many_product_id`) REFERENCES `many_product` (`id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
