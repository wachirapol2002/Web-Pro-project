-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 04:29 AM
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
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `password` varchar(255) NOT NULL COMMENT 'รหัสผ่าน',
  `permission` enum('staff','customer','VIP','') NOT NULL COMMENT 'ระดับการอนุญาต',
  `firstname` varchar(100) DEFAULT NULL COMMENT 'ชื่อ',
  `lastname` varchar(100) DEFAULT NULL COMMENT 'นามสกุล',
  `email` varchar(100) DEFAULT NULL COMMENT 'อีเมล',
  `phone` varchar(10) DEFAULT NULL COMMENT 'หมายเลขโทรศัพท์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `permission`, `firstname`, `lastname`, `email`, `phone`) VALUES
('kaka24502', '$2b$05$j.OkIufdPhjIdAfvEfob6Oh7PM1k3CUOkky3UWfdKkQR3H7Avfjbi', 'staff', 'Wachirapol', 'Klinkasorn', 'wachirapol2545@gmail.com', '0909209945'),
('kaka24503', '$2b$05$u/1dC5V73bcdMbW4XRSZEuGkBOYJRVfbyNu0sKWC4AVmNVkKaov5W', 'VIP', 'Wachirapol', 'Klinkasorn', 'wachirapol2545@gmail.com', '0909209945'),
('table1', '$2b$05$7kLvt5yn7D4YJ80RUWb4S.bpvPqgI4B08NuydaV2ywqNLPvmH6UmS', 'customer', NULL, NULL, NULL, NULL),
('table10', '$2b$05$Axi12Iy/VKprwCmrlDfI4O/tcOU0F5mwjZ.DAxJ.INuiV0r.cW2KO', 'customer', NULL, NULL, NULL, NULL),
('table11', '$2b$05$N03hoclYmKmCR.VR7xQloOfHJwwul2koaZ7AmvMeMMdJb371dKSBW', 'customer', NULL, NULL, NULL, NULL),
('table12', '$2b$05$cZN7TsPImODc26VVvLDKBO9x4TtXDDZ5UhE1Rd5avlME3zTt./ff2', 'customer', NULL, NULL, NULL, NULL),
('table13', '$2b$05$XnWIkIlS2ZCXy2cTongtm.YRjIbOcXJztxXFmtQQ2Z8KoD3q6beEO', 'customer', NULL, NULL, NULL, NULL),
('table14', '$2b$05$aXgEqF4oDeBmNtgVujFJsOBmUs42GK9o9zzXYA5a9DMrnHEWcFzly', 'customer', NULL, NULL, NULL, NULL),
('table15', '$2b$05$mAwfx3Qtu.4hhraYIpPW1uhYMYkyjAkhCgO2bt/tE/vUuPCjqi4Y.', 'customer', NULL, NULL, NULL, NULL),
('table16', '$2b$05$N6dN6CSe4puJpdyT7W37TOuIQ/O2owUtyv.OaNUoFPSAB1LVXdsp.', 'customer', NULL, NULL, NULL, NULL),
('table17', '$2b$05$3J1e3WtqXTQDkbsSDcpHPe4s3L5o1na9HUmmxMc0rx24JQt8rsFqa', 'customer', NULL, NULL, NULL, NULL),
('table18', '$2b$05$Z9hTQTTt9PQtyNyy96D9Y.NcWOglnF6wE.EJNxcKmg.PDJz2v7sHa', 'customer', NULL, NULL, NULL, NULL),
('table19', '$2b$05$OqnwbWI5lHoUJBeLkzioCOSdYV7D4f7UOdWYDWM0n4MK/UdwjbC5.', 'customer', NULL, NULL, NULL, NULL),
('table2', '$2b$05$bpVeUA4byNef3ZBc2v9QI.AkTFpLPn4XTwbQj3MHcKrbpFmCZUEWO', 'customer', NULL, NULL, NULL, NULL),
('table20', '$2b$05$udi5Fc9JRthQwsHK1tEX/OmAlfLUrKugqefsMWgQCdC6uonUap8jO', 'customer', NULL, NULL, NULL, NULL),
('table3', '$2b$05$wwSRDRJ./0mW9JeNujIiW.VGGbNrIXEynQ4yrJXfDGJxsauzJ9MwO', 'customer', NULL, NULL, NULL, NULL),
('table4', '$2b$05$MsQLyQ1h12TdkyNiQ1lj0uwmWlLhohviOFss/3WZ6zXi5OAGtI/kS', 'customer', NULL, NULL, NULL, NULL),
('table5', '$2b$05$toTRTcMK3QXxUPtmQJMRyeOJ3bEkj0xmnFLDNczru.4S3o8aAZUh6', 'customer', NULL, NULL, NULL, NULL),
('table6', '$2b$05$cA9pUffwdmFWWVPZ2oBsHOH2OVCa/ygUIGiPd.KMBsDKPT3aSslUO', 'customer', NULL, NULL, NULL, NULL),
('table7', '$2b$05$5LuWKJJgBA225gzg2BUSNOW.tEC1yXZjG7MKq66dXk6fQndb/hOj2', 'customer', NULL, NULL, NULL, NULL),
('table8', '$2b$05$LtVViSSgmkoXdBpKH28w9OEV1XO04Ej3CyhZ3PB1uJf.AMBdbhnZq', 'customer', NULL, NULL, NULL, NULL),
('table9', '$2b$05$/rciDqd15jvwbcpNrFZ.5ObSmzsHhvnjuVZNMfPcqT90KIjUOjH36', 'customer', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสการจอง',
  `username` varchar(20) NOT NULL COMMENT 'ชื่อผู้ใช้งาน',
  `table_num` int(2) NOT NULL COMMENT 'หมายเลขโต๊ะ',
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
  `menu_price` int(10) NOT NULL COMMENT 'ราคาเมนู',
  `menu_quantity` int(10) NOT NULL COMMENT 'จำนวนตั้งต้น'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `menu_pic`, `menu_name`, `menu_price`, `menu_quantity`) VALUES
(0000000001, '/static/imagefood/SlicedPorkNeck.jpg', 'สันคอหมู', 50, 0),
(0000000002, '/static/imagefood/Bacon.jpg', 'เบคอน', 50, 0),
(0000000003, '/static/imagefood/Streakypork.jpg', 'หมูสามชั้น', 50, 0),
(0000000004, '/static/imagefood/sirloin.jpg', 'เนื้อสันคอ', 50, 0),
(0000000005, '/static/imagefood/Chinese cabbage.jpg', 'ผักกาดขาว', 50, 0),
(0000000006, '/static/imagefood/Water Spinach.jpg', 'ผักบุ้ง', 50, 0),
(0000000007, '/static/imagefood/Egg Tofu.png', 'เต้าหู้ไข่', 50, 0),
(0000000008, '/static/imagefood/egg.jpg', 'ไข่ไก่', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสคำสั่งซื้อ',
  `order_price` int(10) NOT NULL COMMENT 'ราคาคำสั่งซื้อ',
  `order_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'เวลาคำสั่งซื้อ',
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
  `table_status` enum('available','unavailable','booked','') NOT NULL COMMENT 'สถานะโต๊ะ',
  `username` varchar(20) DEFAULT NULL COMMENT 'ชื่อผู้ใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_num`, `total_price`, `table_status`, `username`) VALUES
(1, 0, 'available', NULL),
(2, 0, 'available', NULL),
(3, 0, 'available', NULL),
(4, 0, 'available', NULL),
(5, 0, 'available', NULL),
(6, 0, 'available', NULL),
(7, 0, 'available', NULL),
(8, 0, 'available', NULL),
(9, 0, 'available', NULL),
(10, 0, 'available', NULL),
(11, 0, 'available', NULL),
(12, 0, 'available', NULL),
(13, 0, 'available', NULL),
(14, 0, 'available', NULL),
(15, 0, 'available', NULL),
(16, 0, 'available', NULL),
(17, 0, 'available', NULL),
(18, 0, 'available', NULL),
(19, 0, 'available', NULL),
(20, 0, 'available', NULL);

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
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
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
  ADD PRIMARY KEY (`table_num`),
  ADD KEY `tables_accounts` (`username`);

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
  MODIFY `menu_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'รหัสเมนู', AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `booking_account` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_tables` FOREIGN KEY (`table_num`) REFERENCES `tables` (`table_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_account` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `payments_account` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_tables` FOREIGN KEY (`table_num`) REFERENCES `tables` (`table_num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_accounts` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vip`
--
ALTER TABLE `vip`
  ADD CONSTRAINT `vip_account` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
