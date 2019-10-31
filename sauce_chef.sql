-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 06:38 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sauce_chef`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `cust_lname` varchar(45) NOT NULL,
  `cust_fname` varchar(45) NOT NULL,
  `cust_add` varchar(100) NOT NULL,
  `cust_phone` int(11) DEFAULT NULL,
  `RESTO_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `cust_lname`, `cust_fname`, `cust_add`, `cust_phone`, `RESTO_id`) VALUES
(1910310001, 'Cariaga', 'Kristine Cay', 'Taguig', 123123, 1),
(1910310002, 'Caridad', 'John Asirrh', 'Makati', 123123123, 1),
(1910310003, 'Bunagan', 'Jhed Ross', 'Taguig', 32223, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_lname` varchar(45) DEFAULT NULL,
  `emp_fname` varchar(45) DEFAULT NULL,
  `emp_add` varchar(45) DEFAULT NULL,
  `emp_email` varchar(45) DEFAULT NULL,
  `emp_phone` varchar(45) DEFAULT NULL,
  `emp_type` varchar(45) DEFAULT NULL,
  `RESTO_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_lname`, `emp_fname`, `emp_add`, `emp_email`, `emp_phone`, `emp_type`, `RESTO_id`) VALUES
(2012001, 'Oyamat', 'Jigs', 'Makati', 'jo@gmail.com', '12333212', 'Full-time', 1),
(2012002, 'Maga', 'Kat', 'Taguig', 'kmaga@gmail.com', '32132312', 'Full-time', 1),
(2018034, 'Ascari', 'Alberto', 'Taguig', 'aa@gmail.com', '3232223', 'Part-time', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `food_name` varchar(45) DEFAULT NULL,
  `food_price` int(11) DEFAULT NULL,
  `food_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `food_name`, `food_price`, `food_type`) VALUES
(1, 'Chicken Sandwich', 49, 'Sandwich'),
(2, 'Tuna Sandwich', 49, 'Sandwich'),
(3, 'Ice Cream Sandwich', 59, 'Sandwich'),
(4, 'Chicken Meal', 79, 'Rice Meal'),
(5, 'Pork chop Meal', 89, 'Rice Meal');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `ingredient_code` varchar(45) DEFAULT NULL,
  `ingredient_desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `ingredient_code`, `ingredient_desc`) VALUES
(1, 'S1', NULL),
(2, 'S2', NULL),
(3, 'S3', NULL),
(4, 'RM1', NULL),
(5, 'RM2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `od_quantity` int(4) NOT NULL,
  `od_item` varchar(1000) NOT NULL,
  `od_remarks` varchar(1000) DEFAULT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `od_quantity`, `od_item`, `od_remarks`, `food_id`) VALUES
(1, 1, 'Chicken Meal', 'Drinks - less ice', 4),
(2, 1, 'Chicken Sandwich', NULL, 1),
(3, 1, 'Pork chop Meal', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_header`
--

CREATE TABLE `order_header` (
  `id` int(11) NOT NULL,
  `oh_date` date NOT NULL,
  `order_stat` varchar(45) NOT NULL,
  `CUSTOMER_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_header`
--

INSERT INTO `order_header` (`id`, `oh_date`, `order_stat`, `CUSTOMER_id`, `order_detail_id`) VALUES
(1, '2019-10-31', 'To be delivered', 1910310001, 1),
(2, '2019-10-31', 'On queue', 1910310002, 2),
(3, '2019-10-31', 'On queue', 1910310003, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_amount_total` decimal(10,0) NOT NULL,
  `payment_amount_paid` decimal(10,0) DEFAULT NULL,
  `payment_tax` decimal(10,0) DEFAULT NULL,
  `payment_discount` decimal(10,0) DEFAULT NULL,
  `payment_change` decimal(10,0) DEFAULT NULL,
  `payment_reference_num` int(11) DEFAULT NULL,
  `order_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `payment_amount_total`, `payment_amount_paid`, `payment_tax`, `payment_discount`, `payment_change`, `payment_reference_num`, `order_header_id`) VALUES
(10001, '79', '80', '0', '0', '1', 102, 1),
(10002, '49', '50', '0', '0', '1', 102, 2),
(10003, '89', '100', '0', '0', '11', 103, 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `resto_id` int(11) NOT NULL,
  `po_order_date` date DEFAULT NULL,
  `po_delivery_date` date DEFAULT NULL,
  `po_order_stat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`id`, `supplier_id`, `resto_id`, `po_order_date`, `po_delivery_date`, `po_order_stat`) VALUES
(21011, 2101, 1, '2019-10-09', '2019-10-11', 'Delivered'),
(21012, 2101, 1, '2019-10-10', '2019-10-12', 'Delivered'),
(21021, 2102, 1, '2019-10-08', '2019-10-12', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `ingredients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `food_id`, `ingredients_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `resto`
--

CREATE TABLE `resto` (
  `id` int(11) NOT NULL,
  `resto_name` varchar(45) DEFAULT NULL,
  `resto_found_date` date DEFAULT NULL,
  `resto_owner` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resto`
--

INSERT INTO `resto` (`id`, `resto_name`, `resto_found_date`, `resto_owner`) VALUES
(1, 'Sauce Chef', '2012-12-12', 'Patrick Volante');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(45) DEFAULT NULL,
  `supplier_loc` varchar(45) DEFAULT NULL,
  `partners_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier_name`, `supplier_loc`, `partners_num`) VALUES
(2101, 'Ingredients and Catering Store', 'Taguig', 31231),
(2102, 'Sesame Merchandise', 'Makati', 322233);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_CUSTOMER_RESTO1_idx` (`RESTO_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_EMPLOYEE_RESTO1_idx` (`RESTO_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_detail_food1_idx` (`food_id`);

--
-- Indexes for table `order_header`
--
ALTER TABLE `order_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ORDER_CUSTOMER1_idx` (`CUSTOMER_id`),
  ADD KEY `fk_order_header_order_detail1_idx` (`order_detail_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_order_header1_idx` (`order_header_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplier_has_resto_resto1_idx` (`resto_id`),
  ADD KEY `fk_supplier_has_resto_supplier1_idx` (`supplier_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ingredients_has_food_food1_idx` (`food_id`),
  ADD KEY `fk_recipe_ingredients1_idx` (`ingredients_id`);

--
-- Indexes for table `resto`
--
ALTER TABLE `resto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1910310004;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2018035;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_header`
--
ALTER TABLE `order_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10004;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21022;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resto`
--
ALTER TABLE `resto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_CUSTOMER_RESTO1` FOREIGN KEY (`RESTO_id`) REFERENCES `resto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_EMPLOYEE_RESTO1` FOREIGN KEY (`RESTO_id`) REFERENCES `resto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `fk_order_detail_food1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_header`
--
ALTER TABLE `order_header`
  ADD CONSTRAINT `fk_ORDER_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_header_order_detail1` FOREIGN KEY (`order_detail_id`) REFERENCES `order_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_order_header1` FOREIGN KEY (`order_header_id`) REFERENCES `order_header` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `fk_supplier_has_resto_resto1` FOREIGN KEY (`resto_id`) REFERENCES `resto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_supplier_has_resto_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `fk_ingredients_has_food_food1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recipe_ingredients1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
