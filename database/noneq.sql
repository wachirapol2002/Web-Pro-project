-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 09:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noneq`
--

-- --------------------------------------------------------

--
-- Table structure for table `acccount`
--

CREATE TABLE `acccount` (
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `password` varchar(20) NOT NULL COMMENT 'รหัสผ่าน',
  `permission` enum('staff','customer','VIP','') NOT NULL COMMENT 'ระดับการอนุญาต',
  `firstname` varchar(100) NOT NULL COMMENT 'ชื่อ',
  `lastname` varchar(100) NOT NULL COMMENT 'นามสกุล',
  `email` varchar(100) NOT NULL COMMENT 'อีเมล',
  `phone` varchar(10) NOT NULL COMMENT 'หมายเลขโทรศัพท์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสการจอง',
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `table_num` int(2) NOT NULL COMMENT 'หมายเลขโต๊ะ',
  `booking_date` date NOT NULL COMMENT 'วันที่จอง',
  `booking_time` time NOT NULL COMMENT 'เวลาที่จอง',
  `create_booking` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'เวลาที่สร้างการจอง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `checkIN` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสเข้าใช้โต๊ะ',
  `booking_id` int(10) UNSIGNED ZEROFILL DEFAULT NULL COMMENT 'รหัสการจอง',
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `table_num` int(2) NOT NULL COMMENT 'หมายเลขโต๊ะ',
  `checkIN_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'เวลาที่จอง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสเมนู',
  `menu_pic` varchar(255) NOT NULL COMMENT 'ภาพเมนู',
  `menu_name` varchar(50) NOT NULL COMMENT 'ชื่อเมนู',
  `menu_price` int(10) NOT NULL COMMENT 'ราคาเมนู'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสคำสั่งซื้อ',
  `order_price` int(10) NOT NULL COMMENT 'ราคาคำสั่งซื้อ',
  `order_time` datetime NOT NULL COMMENT 'เวลาคำสั่งซื้อ',
  `table_num` int(2) NOT NULL COMMENT 'หมายเลขโต๊ะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสรายละเอียดคำสั่งซื้อ',
  `order_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสคำสั่งซื้อ',
  `menu_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสเมนู',
  `quantity` int(4) NOT NULL COMMENT 'จำนวน',
  `quantity_price` int(10) NOT NULL COMMENT 'ราคาทั้งหมด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสการจ่ายเงิน',
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `table_num` int(2) NOT NULL COMMENT 'หมายเลขโต๊ะ',
  `total_price` int(10) NOT NULL COMMENT 'ราคารวมของโต๊ะ',
  `payment_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'เวลาที่จ่ายเงิน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_num` int(2) NOT NULL COMMENT 'หมายเลขโต๊ะ',
  `total_price` int(10) NOT NULL COMMENT 'ราคารวมทั้งโต๊ะ',
  `table_status` enum('available','unavailable','booked','') NOT NULL COMMENT 'สถานะโต๊ะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_num`, `total_price`, `table_status`) VALUES
(1, 0, 'available'),
(2, 0, 'available'),
(3, 0, 'available'),
(4, 0, 'available'),
(5, 0, 'available'),
(6, 0, 'available'),
(7, 0, 'available'),
(8, 0, 'available'),
(9, 0, 'available'),
(10, 0, 'available'),
(11, 0, 'available'),
(12, 0, 'available'),
(13, 0, 'available'),
(14, 0, 'available'),
(15, 0, 'available'),
(16, 0, 'available'),
(17, 0, 'available'),
(18, 0, 'available'),
(19, 0, 'available'),
(20, 0, 'available'),
(21, 0, 'available'),
(22, 0, 'available'),
(23, 0, 'available'),
(24, 0, 'available'),
(25, 0, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `vip`
--

CREATE TABLE `vip` (
  `VIP_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสVIP',
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `expire_date` date NOT NULL COMMENT 'วันหมดอายุ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acccount`
--
ALTER TABLE `acccount`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `booking_account` (`username`),
  ADD KEY `booking_tables` (`table_num`);

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`checkIN`),
  ADD KEY `checkin_account` (`username`),
  ADD KEY `checkin_tables` (`table_num`),
  ADD KEY `checkin_booking` (`booking_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_tables` (`table_num`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_details_orders` (`order_id`),
  ADD KEY `order_details_menus` (`menu_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payments_account` (`username`),
  ADD KEY `payments_tables` (`table_num`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_num`);

--
-- Indexes for table `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`VIP_id`),
  ADD KEY `vip_account` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสการจอง';

--
-- AUTO_INCREMENT for table `checkin`
--
ALTER TABLE `checkin`
  MODIFY `checkIN` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสเข้าใช้โต๊ะ';

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสเมนู';

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสคำสั่งซื้อ';

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสรายละเอียดคำสั่งซื้อ';

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสการจ่ายเงิน';

--
-- AUTO_INCREMENT for table `vip`
--
ALTER TABLE `vip`
  MODIFY `VIP_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสVIP';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_account` FOREIGN KEY (`username`) REFERENCES `acccount` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_tables` FOREIGN KEY (`table_num`) REFERENCES `tables` (`table_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_account` FOREIGN KEY (`username`) REFERENCES `acccount` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checkin_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checkin_tables` FOREIGN KEY (`table_num`) REFERENCES `tables` (`table_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_tables` FOREIGN KEY (`table_num`) REFERENCES `tables` (`table_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_account` FOREIGN KEY (`username`) REFERENCES `acccount` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_tables` FOREIGN KEY (`table_num`) REFERENCES `tables` (`table_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vip`
--
ALTER TABLE `vip`
  ADD CONSTRAINT `vip_account` FOREIGN KEY (`username`) REFERENCES `acccount` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
