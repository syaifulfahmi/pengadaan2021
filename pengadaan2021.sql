-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2021 at 03:03 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengadaan2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `token` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `nama`, `email`, `alamat`, `password`, `status`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@mail.com', 'Jl. Admin', 'eyJpdiI6InlEenN0UUZjOWUyWnY4bE1BQytmTUE9PSIsInZhbHVlIjoibHVqZ3lDSHVHMmtnY3FtcDFQeUdcL1B4R3pvaVdvNjBYVjhpSllmT2oxQWs9IiwibWFjIjoiYTY0MGRhMWY0MTBiZDU3MmJlZjhkNTJjMDJmMmFmNmRkNTQxNTcwMzQyY2RiZDJiMjg5YmRiNjRiYTg5YWRmMCJ9', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9hZG1pbiI6MX0.SUtwbgUN8oEPAQX16MHej9kS79NB57BEinD1sFhRTyM', '2021-08-02 10:48:43', '2021-08-24 17:50:11'),
(3, 'admin2', 'admin2@mail.com', 'alamat admin2', 'eyJpdiI6Inc3TTlwczdtR0ZuYjdQYmxiM2RTZ2c9PSIsInZhbHVlIjoiZHp4aWdURzM4OFpNakVXV3Q3ZURRQkJKZWZZSkI3TndDXC9ZQTBcLzBtcm9zPSIsIm1hYyI6ImIwNDgzYWE5ZWIwMjVkNDRlMmYxODgwMjQwNzJjOWEyZDY0MTkxYTE5NTZlMzQ2OWUwOWJhZjJhNWQxMDc3NjUifQ==', 1, 'keluar', '2021-08-04 01:45:49', '2021-08-21 23:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_laporan`
--

CREATE TABLE `tbl_laporan` (
  `id_laporan` int(11) NOT NULL,
  `id_pengajuan` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `laporan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_laporan`
--

INSERT INTO `tbl_laporan` (`id_laporan`, `id_pengajuan`, `id_supplier`, `laporan`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'public/laporan/ANihqsmbcJ4NicyeLv3cckzsczAZFAY6C5ONIiT8.pdf', '2021-08-15 01:19:43', '2021-08-15 01:19:43'),
(2, 1, 1, 'public/laporan/WL35bgIB3j0tB4gdn6rNK7CVEwLBg6jz4EJVkJLE.pdf', '2021-08-15 02:58:19', '2021-08-15 02:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengadaan`
--

CREATE TABLE `tbl_pengadaan` (
  `id_pengadaan` int(11) NOT NULL,
  `nama_pengadaan` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL,
  `anggaran` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pengadaan`
--

INSERT INTO `tbl_pengadaan` (`id_pengadaan`, `nama_pengadaan`, `deskripsi`, `gambar`, `anggaran`, `status`, `created_at`, `updated_at`) VALUES
(1, 'buku tulis', 'https://ehibahbansos.bantenprov.go.id/upload/media/proposal/2ccefdcea8dd9df9338952cdd16be4eb.pdf', 'public/gambar/C2bH0aOfu2fzkccAF75ihYiOMKJ06milmH0EdhDK.png', 5000000, 1, '2021-08-11 10:15:58', '2021-08-11 12:17:30'),
(2, 'meja', 'https://ehibahbansos.bantenprov.go.id/upload/media/proposal/2ccefdcea8dd9df9338952cdd16be4eb.pdf', 'public/gambar/4ankvwJr8cCQ9J6V6ntwGlvWcJTwYy5t2jSe3cjZ.jpg', 1000000, 1, '2021-08-11 11:10:39', '2021-08-11 11:27:03'),
(4, 'mobil', 'https://ehibahbansos.bantenprov.go.id/upload/media/proposal/2ccefdcea8dd9df9338952cdd16be4eb.pdf', 'public/gambar/job3ZvrlcBGtGvadEgQ6XmqEgID0HV5GOxHVs3xN.png', 400000000, 1, '2021-08-11 11:54:41', '2021-08-11 11:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan`
--

CREATE TABLE `tbl_pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_pengadaan` int(11) NOT NULL,
  `anggaran` double NOT NULL,
  `proposal` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pengajuan`
--

INSERT INTO `tbl_pengajuan` (`id_pengajuan`, `id_supplier`, `id_pengadaan`, `anggaran`, `proposal`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 200000000, 'public/proposal/MiIzntjviMLEqqUCReNbt9Bj6KFU5hJBuTeyIzhL.pdf', 3, '2021-08-11 15:08:18', '2021-08-15 03:00:01'),
(2, 1, 1, 5000000, 'public/proposal/n3sCFv7lqMjpnHzfvQuBJDJ4lnnVdbNCqZGV6L1O.pdf', 3, '2021-08-15 00:24:56', '2021-08-15 02:56:20'),
(3, 1, 2, 1000000, 'public/proposal/um9fUCqyVHct2nlYHFKn4HwR9X2bAXaIUcVq24Ii.pdf', 2, '2021-08-21 23:54:22', '2021-08-21 23:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_usaha` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_npwp` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `token` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id_supplier`, `nama_usaha`, `email`, `alamat`, `no_npwp`, `password`, `status`, `token`, `created_at`, `updated_at`) VALUES
(1, 'pt tes', 'tes@mail.com', 'jl pt tes', '1234567890', 'eyJpdiI6ImdkZVdJUnVsVGpsYVZ5TlwvR0ZsUG93PT0iLCJ2YWx1ZSI6IkJxSDBFcHBhcjZaVW5Pb0I2dnFmaWJPNU52dmpLOEJ6MHhWUHBjOEVrMXM9IiwibWFjIjoiYWNhMDFjODFhNzVjOGRkZTNhNTdjMmM2M2RlNjBhYWMzOGFhMTE5N2I5Zjg5MTIzNTJkNTFhOWEyYmY0MGE5MyJ9', 1, 'keluar', '2021-08-02 07:17:16', '2021-08-24 17:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `tbl_pengadaan`
--
ALTER TABLE `tbl_pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`);

--
-- Indexes for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id_supplier`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pengadaan`
--
ALTER TABLE `tbl_pengadaan`
  MODIFY `id_pengadaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
