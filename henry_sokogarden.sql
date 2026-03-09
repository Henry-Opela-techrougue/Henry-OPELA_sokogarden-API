-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2026 at 10:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `henry_sokogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_cost` int(255) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_description`, `product_cost`, `product_category`, `product_image`) VALUES
(1, 'oppo F11', '16gb ram 128gb storage black android 12', 20000, 'electronics', 'oppo F11.jpeg'),
(5, 'sumsung s20', '16gb ram 128gb storage black android 12', 29500, 'electronics', 'sumsung s20.jpeg'),
(6, 'sumsung A03 core', '4gb ram 32gb storage black android 12', 12300, 'electronics', 'sumsung A03 core.jpeg'),
(7, 'sumsung A40', '8gb ram 64gb storage black android 12', 17350, 'electronics', 'sumsung A40.jpeg'),
(8, 'redmi ', '8gb ram 128gb storage black android 12', 12350, 'electronics', 'redmi 14C.jpeg'),
(9, 'markpen', 'Black permanent', 140, 'stationary', 'markpen permanent.jpeg'),
(10, 'biro pen', 'blue ink ', 50, 'stationary', 'biro.jpeg'),
(11, 'fountain pen', 'black ink', 50, 'stationary', 'fountain pen.jpeg'),
(12, 'mechanical pencil', 'graphite lead', 20, 'stationary', 'mechanical pencil.jpeg'),
(13, 'drawing pencil set', 'graphite lead pencils, erasers and blenders', 1520, 'stationary', 'pencil set.jpeg'),
(14, 'transformer ', 'can change from car to bot', 1520, 'toys', 'transformer toy.jpeg'),
(15, 'toy gun', 'shoots plastic bullets', 2350, 'toys', 'gun toy.jpeg'),
(16, 'toy guitar', 'uses plastic strings', 3500, 'toys', 'toy guitar.jpeg'),
(17, 'piano', 'functionable keys and instrumental', 7600, 'toys', 'piao toy.jpeg'),
(18, 'dinosour', 'plastic made and durable', 750, 'toys', 'dinosour toy.jpeg'),
(19, 'soccer ball', 'bundesliga category ', 2550, 'football', 'soccer ball.jpeg'),
(21, 'ghost boots', 'black and golden look and durable', 7650, 'football', 'nike ghost cleats.jpeg'),
(22, 'Real Madrid jersey', 'original and long lasting', 1250, 'football', 'real madrid.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone`, `password`) VALUES
(1, 'Opela', 'henryopela64@gmail.com', '0104554676', 'querty321'),
(2, 'Opelat', 'henryopela64@gmail.com', '0104554676', 'querty321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
