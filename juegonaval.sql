-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2021 at 11:38 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `juegonaval`
--

-- --------------------------------------------------------

--
-- Table structure for table `tableros`
--

CREATE TABLE `tableros` (
  `id` int(10) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `usuario1_id` int(10) NOT NULL,
  `usuario2_id` int(10) NOT NULL,
  `estatus` varchar(15) NOT NULL,
  `ganador_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tableros`
--

INSERT INTO `tableros` (`id`, `codigo`, `usuario1_id`, `usuario2_id`, `estatus`, `ganador_id`, `created_at`, `updated_at`) VALUES
(5, 'YSPE6', 8, 6, 'Finalizado', 8, '2021-03-26 10:59:00', '2021-03-26 14:43:51'),
(9, '8WLgF', 6, 8, 'Finalizado', 8, '2021-03-26 13:44:37', '2021-03-26 13:45:38'),
(10, 'sSXW', 8, 6, 'Finalizado', 8, '2021-03-26 14:44:15', '2021-03-26 14:45:26'),
(11, 'Fxu7C', 6, 8, 'Finalizado', 6, '2021-03-26 15:14:55', '2021-03-26 15:17:19'),
(12, '4Mj6', 6, 6, 'activo', 6, '2021-03-26 15:19:08', '2021-03-26 15:19:20'),
(13, 'I4nNg', 6, 6, 'activo', 6, '2021-03-26 15:20:54', '2021-03-26 15:21:08'),
(14, 'vbWS', 6, 8, 'jugando', 6, '2021-03-26 15:25:53', '2021-03-26 15:32:09'),
(15, 'IEMxZ', 6, 6, 'activo', 6, '2021-03-26 15:37:28', '2021-03-26 15:37:46'),
(17, 'd2Jr', 9, 9, 'nuevo', 9, '2021-03-27 04:02:30', '2021-03-27 04:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `tablero_barcos`
--

CREATE TABLE `tablero_barcos` (
  `id` int(10) NOT NULL,
  `tablero_id` int(10) NOT NULL,
  `usuario_id` int(10) NOT NULL,
  `barco1` int(10) NOT NULL,
  `barco2` int(10) NOT NULL,
  `barco3` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tablero_barcos`
--

INSERT INTO `tablero_barcos` (`id`, `tablero_id`, `usuario_id`, `barco1`, `barco2`, `barco3`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 1, 2, 3, '2021-03-11 04:47:21', '2021-03-11 04:47:21'),
(5, 1, 1, 1, 2, 3, '2021-03-11 04:58:50', '2021-03-11 04:58:50'),
(6, 2, 6, 1, 2, 3, '2021-03-23 04:39:59', '2021-03-23 04:39:59'),
(7, 2, 7, 7, 2, 8, '2021-03-23 04:42:38', '2021-03-23 04:42:38'),
(8, 3, 6, 11, 5, 4, '2021-03-23 04:53:06', '2021-03-23 04:53:06'),
(9, 5, 6, 2, 8, 11, '2021-03-26 11:16:58', '2021-03-26 11:16:58'),
(10, 5, 8, 1, 7, 11, '2021-03-26 11:17:47', '2021-03-26 11:17:47'),
(11, 7, 6, 1, 6, 11, '2021-03-26 11:45:18', '2021-03-26 11:45:18'),
(12, 6, 8, 1, 5, 9, '2021-03-26 11:46:12', '2021-03-26 11:46:12'),
(13, 6, 6, 1, 6, 2, '2021-03-26 11:47:50', '2021-03-26 11:47:50'),
(14, 3, 8, 1, 2, 3, '2021-03-26 11:51:21', '2021-03-26 11:51:21'),
(15, 7, 8, 1, 5, 9, '2021-03-26 12:18:48', '2021-03-26 12:18:48'),
(16, 4, 6, 1, 2, 3, '2021-03-26 12:50:13', '2021-03-26 12:50:13'),
(17, 4, 8, 1, 11, 12, '2021-03-26 12:50:19', '2021-03-26 12:50:19'),
(18, 8, 8, 1, 2, 3, '2021-03-26 12:51:35', '2021-03-26 12:51:35'),
(19, 8, 6, 1, 2, 3, '2021-03-26 12:51:38', '2021-03-26 12:51:38'),
(20, 9, 6, 1, 2, 3, '2021-03-26 13:44:40', '2021-03-26 13:44:40'),
(21, 9, 8, 1, 2, 3, '2021-03-26 13:44:56', '2021-03-26 13:44:56'),
(22, 10, 8, 1, 5, 9, '2021-03-26 14:44:20', '2021-03-26 14:44:20'),
(23, 10, 6, 1, 2, 3, '2021-03-26 14:44:46', '2021-03-26 14:44:46'),
(24, 11, 6, 1, 2, 3, '2021-03-26 15:14:58', '2021-03-26 15:14:58'),
(25, 11, 8, 1, 2, 3, '2021-03-26 15:15:47', '2021-03-26 15:15:47'),
(26, 12, 6, 1, 2, 3, '2021-03-26 15:19:20', '2021-03-26 15:19:20'),
(27, 13, 6, 1, 2, 7, '2021-03-26 15:21:08', '2021-03-26 15:21:08'),
(28, 14, 6, 1, 2, 7, '2021-03-26 15:26:05', '2021-03-26 15:26:05'),
(29, 14, 8, 1, 5, 6, '2021-03-26 15:32:09', '2021-03-26 15:32:09'),
(30, 15, 6, 1, 2, 3, '2021-03-26 15:37:46', '2021-03-26 15:37:46'),
(31, 16, 9, 5, 6, 7, '2021-03-27 04:01:29', '2021-03-27 04:01:29'),
(32, 16, 7, 1, 6, 7, '2021-03-27 04:07:42', '2021-03-27 04:07:42'),
(33, 18, 9, 1, 2, 3, '2021-03-27 04:31:21', '2021-03-27 04:31:21'),
(34, 18, 7, 1, 2, 3, '2021-03-27 04:31:42', '2021-03-27 04:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `tablero_movimiento`
--

CREATE TABLE `tablero_movimiento` (
  `id` int(10) NOT NULL,
  `tablero_id` int(10) NOT NULL,
  `usuario_id` int(10) NOT NULL,
  `posicion` int(10) NOT NULL,
  `estatus` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tablero_movimiento`
--

INSERT INTO `tablero_movimiento` (`id`, `tablero_id`, `usuario_id`, `posicion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 5, 8, 2, '1', '2021-03-26 11:17:49', '2021-03-26 11:17:49'),
(2, 5, 6, 10, '0', '2021-03-26 11:18:05', '2021-03-26 11:18:05'),
(3, 5, 8, 10, '0', '2021-03-26 11:18:14', '2021-03-26 11:18:14'),
(4, 5, 6, 5, '0', '2021-03-26 11:18:18', '2021-03-26 11:18:18'),
(5, 5, 8, 11, '1', '2021-03-26 11:18:25', '2021-03-26 11:18:25'),
(6, 5, 6, 9, '0', '2021-03-26 11:18:50', '2021-03-26 11:18:50'),
(7, 5, 8, 10, '0', '2021-03-26 11:19:02', '2021-03-26 11:19:02'),
(8, 5, 6, 7, '1', '2021-03-26 11:19:17', '2021-03-26 11:19:17'),
(9, 5, 8, 8, '1', '2021-03-26 11:19:50', '2021-03-26 11:19:50'),
(10, 5, 6, 5, '0', '2021-03-26 11:20:00', '2021-03-26 11:20:00'),
(11, 5, 8, 10, '0', '2021-03-26 11:20:08', '2021-03-26 11:20:08'),
(12, 5, 6, 3, '0', '2021-03-26 11:20:29', '2021-03-26 11:20:29'),
(13, 5, 8, 5, '0', '2021-03-26 11:20:33', '2021-03-26 11:20:33'),
(14, 5, 6, 3, '0', '2021-03-26 11:20:35', '2021-03-26 11:20:35'),
(15, 5, 8, 1, '0', '2021-03-26 11:20:38', '2021-03-26 11:20:38'),
(16, 5, 6, 1, '1', '2021-03-26 11:20:40', '2021-03-26 11:20:40'),
(17, 5, 8, 3, '0', '2021-03-26 11:20:47', '2021-03-26 11:20:47'),
(18, 5, 6, 4, '0', '2021-03-26 11:20:55', '2021-03-26 11:20:55'),
(19, 5, 8, 4, '0', '2021-03-26 11:20:59', '2021-03-26 11:20:59'),
(20, 5, 6, 6, '0', '2021-03-26 11:21:09', '2021-03-26 11:21:09'),
(21, 5, 8, 7, '0', '2021-03-26 11:21:14', '2021-03-26 11:21:14'),
(22, 5, 6, 6, '0', '2021-03-26 11:21:17', '2021-03-26 11:21:17'),
(23, 5, 8, 6, '0', '2021-03-26 11:21:20', '2021-03-26 11:21:20'),
(24, 5, 6, 9, '0', '2021-03-26 11:21:24', '2021-03-26 11:21:24'),
(25, 5, 8, 9, '0', '2021-03-26 11:21:27', '2021-03-26 11:21:27'),
(26, 5, 6, 12, '0', '2021-03-26 11:21:30', '2021-03-26 11:21:30'),
(27, 5, 8, 12, '0', '2021-03-26 11:21:35', '2021-03-26 11:21:35'),
(28, 5, 6, 12, '0', '2021-03-26 11:21:37', '2021-03-26 11:21:37'),
(29, 6, 6, 6, '0', '2021-03-26 11:50:59', '2021-03-26 11:50:59'),
(30, 3, 6, 4, '0', '2021-03-26 11:51:32', '2021-03-26 11:51:32'),
(31, 3, 8, 4, '1', '2021-03-26 11:51:37', '2021-03-26 11:51:37'),
(32, 3, 6, 1, '1', '2021-03-26 11:51:48', '2021-03-26 11:51:48'),
(33, 3, 8, 5, '1', '2021-03-26 11:52:06', '2021-03-26 11:52:06'),
(34, 3, 6, 2, '1', '2021-03-26 11:52:15', '2021-03-26 11:52:15'),
(35, 3, 8, 11, '1', '2021-03-26 11:53:23', '2021-03-26 11:53:23'),
(36, 3, 6, 3, '1', '2021-03-26 11:53:37', '2021-03-26 11:53:37'),
(37, 3, 8, 5, '1', '2021-03-26 11:54:21', '2021-03-26 11:54:21'),
(38, 3, 6, 3, '1', '2021-03-26 11:54:26', '2021-03-26 11:54:26'),
(39, 3, 8, 11, '1', '2021-03-26 11:54:28', '2021-03-26 11:54:28'),
(40, 3, 6, 4, '0', '2021-03-26 12:00:44', '2021-03-26 12:00:44'),
(41, 7, 6, 1, '1', '2021-03-26 12:19:17', '2021-03-26 12:19:17'),
(42, 7, 8, 2, '0', '2021-03-26 12:19:39', '2021-03-26 12:19:39'),
(43, 7, 6, 5, '1', '2021-03-26 12:19:53', '2021-03-26 12:19:53'),
(44, 7, 8, 8, '0', '2021-03-26 12:20:08', '2021-03-26 12:20:08'),
(45, 7, 6, 9, '1', '2021-03-26 12:20:22', '2021-03-26 12:20:22'),
(46, 7, 8, 4, '0', '2021-03-26 12:37:04', '2021-03-26 12:37:04'),
(47, 7, 6, 2, '0', '2021-03-26 12:37:07', '2021-03-26 12:37:07'),
(48, 7, 8, 4, '0', '2021-03-26 12:41:54', '2021-03-26 12:41:54'),
(49, 2, 6, 5, '0', '2021-03-26 12:49:13', '2021-03-26 12:49:13'),
(50, 8, 6, 1, '1', '2021-03-26 12:53:09', '2021-03-26 12:53:09'),
(51, 8, 8, 9, '0', '2021-03-26 12:59:09', '2021-03-26 12:59:09'),
(52, 8, 6, 8, '0', '2021-03-26 12:59:11', '2021-03-26 12:59:11'),
(53, 8, 8, 7, '0', '2021-03-26 12:59:13', '2021-03-26 12:59:13'),
(54, 8, 6, 4, '0', '2021-03-26 12:59:15', '2021-03-26 12:59:15'),
(55, 8, 8, 4, '0', '2021-03-26 12:59:18', '2021-03-26 12:59:18'),
(56, 8, 6, 5, '0', '2021-03-26 12:59:21', '2021-03-26 12:59:21'),
(57, 8, 8, 5, '0', '2021-03-26 12:59:23', '2021-03-26 12:59:23'),
(58, 8, 6, 6, '0', '2021-03-26 12:59:26', '2021-03-26 12:59:26'),
(59, 8, 8, 6, '0', '2021-03-26 12:59:29', '2021-03-26 12:59:29'),
(60, 8, 6, 7, '0', '2021-03-26 12:59:32', '2021-03-26 12:59:32'),
(61, 8, 8, 7, '0', '2021-03-26 12:59:35', '2021-03-26 12:59:35'),
(62, 8, 6, 9, '0', '2021-03-26 12:59:37', '2021-03-26 12:59:37'),
(63, 8, 8, 9, '0', '2021-03-26 12:59:42', '2021-03-26 12:59:42'),
(64, 8, 6, 10, '0', '2021-03-26 12:59:50', '2021-03-26 12:59:50'),
(65, 8, 8, 10, '0', '2021-03-26 12:59:53', '2021-03-26 12:59:53'),
(66, 8, 6, 11, '0', '2021-03-26 12:59:55', '2021-03-26 12:59:55'),
(67, 8, 8, 1, '1', '2021-03-26 12:59:58', '2021-03-26 12:59:58'),
(68, 8, 6, 2, '1', '2021-03-26 13:00:01', '2021-03-26 13:00:01'),
(69, 8, 8, 3, '1', '2021-03-26 13:00:04', '2021-03-26 13:00:04'),
(70, 8, 6, 3, '1', '2021-03-26 13:00:08', '2021-03-26 13:00:08'),
(71, 9, 6, 10, '0', '2021-03-26 13:45:03', '2021-03-26 13:45:03'),
(72, 9, 8, 1, '1', '2021-03-26 13:45:10', '2021-03-26 13:45:10'),
(73, 9, 6, 6, '0', '2021-03-26 13:45:17', '2021-03-26 13:45:17'),
(74, 9, 8, 2, '1', '2021-03-26 13:45:24', '2021-03-26 13:45:24'),
(75, 9, 6, 7, '0', '2021-03-26 13:45:31', '2021-03-26 13:45:31'),
(76, 9, 8, 3, '1', '2021-03-26 13:45:37', '2021-03-26 13:45:37'),
(77, 10, 8, 1, '1', '2021-03-26 14:44:53', '2021-03-26 14:44:53'),
(78, 10, 6, 5, '1', '2021-03-26 14:45:02', '2021-03-26 14:45:02'),
(79, 10, 8, 2, '1', '2021-03-26 14:45:11', '2021-03-26 14:45:11'),
(80, 10, 6, 3, '0', '2021-03-26 14:45:19', '2021-03-26 14:45:19'),
(81, 10, 8, 3, '1', '2021-03-26 14:45:25', '2021-03-26 14:45:25'),
(82, 11, 6, 3, '1', '2021-03-26 15:16:41', '2021-03-26 15:16:41'),
(83, 11, 8, 1, '1', '2021-03-26 15:16:58', '2021-03-26 15:16:58'),
(84, 11, 6, 1, '1', '2021-03-26 15:17:05', '2021-03-26 15:17:05'),
(85, 11, 8, 5, '0', '2021-03-26 15:17:13', '2021-03-26 15:17:13'),
(86, 11, 6, 2, '1', '2021-03-26 15:17:18', '2021-03-26 15:17:18'),
(87, 14, 6, 1, '1', '2021-03-26 15:32:55', '2021-03-26 15:32:55'),
(88, 14, 8, 1, '1', '2021-03-26 15:41:11', '2021-03-26 15:41:11'),
(89, 16, 9, 1, '1', '2021-03-27 04:07:56', '2021-03-27 04:07:56'),
(90, 16, 7, 6, '1', '2021-03-27 04:08:03', '2021-03-27 04:08:03'),
(91, 16, 9, 2, '0', '2021-03-27 04:08:09', '2021-03-27 04:08:09'),
(92, 16, 7, 2, '0', '2021-03-27 04:08:17', '2021-03-27 04:08:17'),
(93, 16, 9, 3, '0', '2021-03-27 04:08:21', '2021-03-27 04:08:21'),
(94, 16, 7, 4, '0', '2021-03-27 04:08:26', '2021-03-27 04:08:26'),
(95, 16, 9, 5, '0', '2021-03-27 04:08:31', '2021-03-27 04:08:31'),
(96, 16, 7, 5, '1', '2021-03-27 04:08:36', '2021-03-27 04:08:36'),
(97, 16, 9, 6, '1', '2021-03-27 04:08:41', '2021-03-27 04:08:41'),
(98, 16, 7, 6, '1', '2021-03-27 04:08:46', '2021-03-27 04:08:46'),
(99, 18, 9, 1, '1', '2021-03-27 04:31:55', '2021-03-27 04:31:55'),
(100, 18, 7, 1, '1', '2021-03-27 04:32:01', '2021-03-27 04:32:01'),
(101, 18, 9, 6, '0', '2021-03-27 04:32:08', '2021-03-27 04:32:08'),
(102, 18, 7, 2, '1', '2021-03-27 04:32:13', '2021-03-27 04:32:13'),
(103, 18, 9, 8, '0', '2021-03-27 04:32:19', '2021-03-27 04:32:19'),
(104, 18, 7, 3, '1', '2021-03-27 04:32:25', '2021-03-27 04:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password1` varchar(200) NOT NULL,
  `password2` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `password1`, `password2`, `created_at`, `updated_at`) VALUES
(7, 'rival@gmail.com', '$2y$10$PmuFZULiLEf3kiNKrwVlqeEr1EyKdycRXXSEzoCtvZNUL/AJBDUUm', '$2y$10$kAE2.2QZlNrmDh1d9JQp6.P2CuDG8GK3RAAcsMYX2RFU7e3giWb8m', '2021-03-23 04:41:59', '2021-03-23 04:41:59'),
(8, 'rival@hotmail.com', '$2y$10$Lh7Dvu/3eycg/PcQkIjTCemVwLHjldM1nc.dVeIfuFgeFVCGyUMaq', '$2y$10$/mWV5SfIPOZYAFclaTwPXOB1ob2g.p4xKjGRYMTSNtses/VcMaKRO', '2021-03-26 10:56:34', '2021-03-26 10:56:34'),
(9, 'adrian@gmail.com', '$2y$10$33CRH346jZJl0C4MH7vvLOEp0YfwlTI0sn1GwRJw9iZYhK52hVWUC', '$2y$10$O/O7DMOjJNTvQ93SkDBjfu79pJA8sNk1.BRYbrrCOrZiH1BdsNRx6', '2021-03-27 04:00:35', '2021-03-27 04:00:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tableros`
--
ALTER TABLE `tableros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tablero_barcos`
--
ALTER TABLE `tablero_barcos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tablero_movimiento`
--
ALTER TABLE `tablero_movimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarioId` (`usuario_id`),
  ADD KEY `tableroId` (`tablero_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tableros`
--
ALTER TABLE `tableros`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tablero_barcos`
--
ALTER TABLE `tablero_barcos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tablero_movimiento`
--
ALTER TABLE `tablero_movimiento`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
