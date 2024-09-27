-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 10:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental_web_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `daily_rent_price` decimal(8,2) NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `model`, `year`, `car_type`, `daily_rent_price`, `availability`, `image`, `created_at`, `updated_at`) VALUES
(6, 'bmw', 'brand new car', '500', 2020, 'car', 8000.00, 1, '/storage/images/cars/ADkQqKSQMaSKrggYdyN9tVLhNvcYOoxDBOUMcms4.jpg', '2024-09-27 06:23:16', '2024-09-27 06:23:16'),
(7, 'new car', 'new brand', 'Md-500', 2023, 'Car', 5000.00, 1, '/storage/images/cars/0Q0wyxTWJyp77zyBvxaYl8dduBfdesyegy6Xagpx.jpg', '2024-09-27 07:39:22', '2024-09-27 07:39:22'),
(8, 'toyota', 'toyota', 'M-568', 2000, 'car', 3000.00, 1, '/storage/images/cars/JprCczeo6gKqOfcEbTRnvlk27LzUg7ugmMxA5f9g.jpg', '2024-09-27 10:14:56', '2024-09-27 10:14:56'),
(9, 'New car', 'car brand', 'M-500', 2018, 'car', 4000.00, 1, '/storage/images/cars/I8EtAEaKPtubL6T59eX9yNfactctbNbfnYl6ot9c.jpg', '2024-09-27 10:15:44', '2024-09-27 10:15:44'),
(10, 'car no 5', 'new brand', 'M-600', 2019, 'car', 9000.00, 0, '/storage/images/cars/xuS6l3tYqmvHqKWjVINEkypNhpWvpVLUZ4TfCMo4.jpg', '2024-09-27 10:17:05', '2024-09-27 10:17:05'),
(11, 'Test car name New', 'new brand', 'm-500', 2020, 'car', 2000.00, 0, '/storage/images/cars/0N6l5gvsteBJEVuBJyxTDuBid78zEKErxx4UQOsK.jpg', '2024-09-27 14:19:11', '2024-09-27 14:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_22_195128_create_cars_table', 1),
(5, '2024_09_22_195147_create_rentals_table', 1),
(6, '2024_09_25_194315_add_address_and_rental_history_to_users_table', 2),
(7, '2024_09_26_185921_add_status_to_rentals_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('ongoing','completed','canceled','pending') NOT NULL DEFAULT 'ongoing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`id`, `user_id`, `car_id`, `start_date`, `end_date`, `total_cost`, `created_at`, `updated_at`, `status`) VALUES
(3, 1, 8, '2024-09-28', '2024-09-29', 6000.00, '2024-09-27 12:53:53', '2024-09-27 14:36:27', 'ongoing'),
(4, 1, 8, '2024-09-28', '2024-09-29', 6000.00, '2024-09-27 12:54:58', '2024-09-27 14:36:42', 'completed'),
(5, 1, 7, '2024-09-28', '2024-09-29', 10000.00, '2024-09-27 13:00:43', '2024-09-27 13:00:43', 'pending'),
(6, 1, 8, '2024-09-28', '2024-09-29', 6000.00, '2024-09-27 13:39:40', '2024-09-27 13:39:40', 'pending'),
(7, 1, 8, '2024-09-28', '2024-09-29', 6000.00, '2024-09-27 13:41:16', '2024-09-27 13:41:16', 'pending'),
(8, 1, 7, '2024-09-28', '2024-09-29', 10000.00, '2024-09-27 13:45:54', '2024-09-27 13:45:54', 'pending'),
(9, 1, 7, '2024-09-28', '2024-09-29', 10000.00, '2024-09-27 13:48:06', '2024-09-27 13:48:06', 'pending'),
(10, 1, 7, '2024-09-28', '2024-09-29', 10000.00, '2024-09-27 13:53:08', '2024-09-27 13:53:08', 'pending'),
(11, 1, 8, '2024-09-28', '2024-09-29', 6000.00, '2024-09-27 13:59:04', '2024-09-27 13:59:04', 'pending'),
(12, 1, 8, '2024-09-28', '2024-09-30', 9000.00, '2024-09-27 13:59:51', '2024-09-27 13:59:51', 'pending'),
(13, 1, 8, '2024-09-28', '2024-09-30', 9000.00, '2024-09-27 14:05:29', '2024-09-27 14:05:29', 'pending'),
(14, 1, 8, '2024-09-28', '2024-09-30', 9000.00, '2024-09-27 14:06:33', '2024-09-27 14:06:33', 'pending'),
(17, 8, 6, '2024-09-29', '2024-09-30', 6000.00, '2024-09-27 14:37:50', '2024-09-27 14:37:50', 'ongoing'),
(18, 8, 7, '2024-09-28', '2024-09-29', 10000.00, '2024-09-27 14:39:21', '2024-09-27 14:39:21', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('utWTnGoneEO9YApTq4o55ClB4NAQRhwtzscRUMFj', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibU1ZeEczVldCN2R6MVliN1dUWVJpeWFWQTZBNXJsMmhZMk8xYmQyMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1727469630);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `mobile_no` varchar(20) NOT NULL DEFAULT '0088-01',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `rental_hostory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `mobile_no`, `remember_token`, `created_at`, `updated_at`, `address`, `rental_hostory`) VALUES
(1, 'faruk', 'farukbilkis2013@gmail.com', NULL, '$2y$12$5xPEoNbCYQ7sMeQjr1zD9uE3sPUutJYad2y/AEvL1S6q4SMgArnee', 'admin', '0088-01', 'zEjmllD3trAkHQEA45xbNv9rWeCjSmBs8MgmWMSJixScsXnU1DgAHBE77JET', '2024-09-23 12:47:12', '2024-09-23 12:47:12', NULL, NULL),
(5, 'Faruk', 'farukbilkis@gmail.com', NULL, '$2y$12$GMJbFryHLh8T4FGS7wv8aOA41GSGPK6bEreDCw0U6sX4q.QlYLolS', 'customer', '01820723784', NULL, '2024-09-25 14:18:28', '2024-09-25 14:18:28', 'Dorikandi,  Muradnager', NULL),
(6, 'Faruk', 'dhaka@gmail.com', NULL, '$2y$12$i4TRaS0NYe8Xk9lBPAhE4O/LrtbrforbYXmuTPV4SZD13.zzPns.i', 'customer', '01820723784', NULL, '2024-09-25 14:21:43', '2024-09-25 14:21:43', 'Dorikandi,  Muradnager', NULL),
(8, 'rasel test', 'raseltest@gmail.com', NULL, '$2y$12$jHUS/ytlzhJVR8Tq0iHuD.F7zLClY3Kh/amRdYB7y.VXnAjBTeEqq', 'customer', '01817638895', NULL, '2024-09-27 14:34:58', '2024-09-27 14:35:38', 'dhaka', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rentals_user_id_foreign` (`user_id`),
  ADD KEY `rentals_car_id_foreign` (`car_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rentals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
