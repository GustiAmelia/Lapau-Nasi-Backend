-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2020 pada 07.04
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lapau_nasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Drink'),
(2, 'Cake'),
(3, 'Main Course'),
(4, 'Dessert');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `cashier` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id`, `invoice`, `cashier`, `amount`, `date`) VALUES
(56, '#1604752144876', 'Kim Namjoon', 27500, '2020-11-07 12:29:08'),
(57, '#1604752212293', 'Kim Namjoon', 111100, '2020-11-07 12:30:16'),
(58, '#1604752223417', 'Kim Namjoon', 22000, '2020-11-07 12:30:26'),
(59, '#1604752233326', 'Kim Namjoon', 41800, '2020-11-07 12:30:35'),
(60, '#1604756389274', 'Kim Namjoon', 133100, '2020-11-07 13:39:54'),
(61, '#1604758262235', 'Kim Namjoon', 258500, '2020-11-07 14:11:05'),
(62, '#1604758362063', 'Kim Namjoon', 16500, '2020-11-07 14:12:45'),
(63, '#1604758441054', 'Kim Namjoon', 92400, '2020-11-07 14:14:06'),
(64, '#1604796868346', 'Park Jimin', 5500, '2020-11-08 00:54:33'),
(65, '#1604799186181', 'Park Jimin', 52800, '2020-11-08 01:33:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id`, `level`) VALUES
(1, 'admin'),
(2, 'cashier');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `invoice`, `product_id`, `quantity`) VALUES
(73, '#1604752144876', 1, 1),
(74, '#1604752144876', 2, 1),
(75, '#1604752212293', 4, 1),
(76, '#1604752212293', 2, 1),
(77, '#1604752212293', 6, 1),
(78, '#1604752212293', 5, 1),
(79, '#1604752223417', 1, 1),
(80, '#1604752223417', 3, 1),
(81, '#1604752233326', 5, 1),
(82, '#1604752233326', 2, 1),
(83, '#1604756389274', 1, 1),
(84, '#1604756389274', 2, 1),
(85, '#1604756389274', 3, 1),
(86, '#1604756389274', 4, 1),
(87, '#1604756389274', 5, 1),
(88, '#1604756389274', 6, 1),
(89, '#1604758262235', 6, 4),
(90, '#1604758262235', 3, 4),
(91, '#1604758262235', 2, 1),
(92, '#1604758262235', 5, 1),
(93, '#1604758262235', 4, 1),
(94, '#1604758262235', 1, 1),
(95, '#1604758362063', 3, 3),
(96, '#1604758441054', 5, 3),
(97, '#1604796868346', 3, 1),
(98, '#1604799186181', 2, 1),
(99, '#1604799186181', 3, 1),
(100, '#1604799186181', 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `upload_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_image`, `price`, `category_id`, `upload_at`, `update_at`) VALUES
(1, 'Coffee Latte', '/images/1603790691528-product_image.png', 15000, 1, '2020-10-27 09:33:44', NULL),
(2, 'Espresso', '/images/1603792279859-product_image.png', 10000, 1, '2020-10-27 09:51:19', NULL),
(3, 'Cappucino', '/images/1603792609817-product_image.png', 5000, 1, '2020-10-27 09:56:50', NULL),
(4, 'Black Forest', '/images/1603792781987-product_image.png', 30000, 2, '2020-10-27 09:59:42', NULL),
(5, 'Choco Rhum', '/images/1603792981223-product_image.png', 28000, 2, '2020-10-27 10:03:01', NULL),
(6, 'Red Velvet Latte', '/images/1603793251009-product_image.png', 33000, 1, '2020-10-27 10:07:31', NULL),
(22, 'Chicken Katsu Dabu-dabu', '/images/1604417087127-product_image.png', 60000, 3, '2020-11-03 15:24:48', NULL),
(23, 'Salmon Truffle Teriyaki', '/images/1604417152449-product_image.png', 60000, 3, '2020-11-03 15:25:52', NULL),
(24, 'Wiener Schnitzel', '/images/1604417234570-product_image.png', 69000, 3, '2020-11-03 15:27:14', NULL),
(25, 'Teh Telur', '/images/1604804199251-product_image.jpg', 10000, 1, '2020-11-08 02:56:39', '2020-11-09 05:10:00'),
(29, 'Nasi Rendang', '/images/1604887185435-product_image.jpg', 18000, 3, '2020-11-09 01:59:45', '2020-11-09 03:57:32'),
(31, 'Bolu Pandan', '/images/1604898703953-product_image.jpg', 10000, 2, '2020-11-09 04:20:15', '2020-11-09 05:11:44'),
(32, 'Nasi lemak', '/images/1604895791907-product_image.jpg', 15000, 4, '2020-11-09 04:23:11', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `level_id`) VALUES
(1, '', 'amel@gmail.com', '$2b$10$QxMrGjlOuaXbX3J/Zhw7SO2eV.IynAx.8y40bQ00nifBCe/Uaet5C', 1),
(3, 'Joen Jongkook', 'jongkook@gmail.com', '$2b$10$gcCikUoG1.ou1ph3DshV9uuIx6TPpA2vqhoEtDEwx/g/MGnpuhNki', 2),
(4, 'Kim Namjoon', 'namjoon@gmail.com', '$2b$10$3Mi../va7kJJQA58gBRzvegy7joam0X4AcHnzavjdugmEs/bSLGeK', 2),
(5, 'Park Jimin', 'jimin@gmail.com', '$2b$10$BMhPXNA/XA36hfSZP7hP5OPutL4U0eRkJY8glB43Rw2xbsUZIceDq', 2),
(6, 'Kim Taehyung', 'v@gmail.com', '$2b$10$T9QcgFbU17ugG7lFF0D8duA/8uYfmkh1Q5klrJd.0t2asUCg1c/GO', 2),
(7, 'test', 'test@gmail.com', '$2b$10$gsoLZHV.m6bgiCS36Ar70.BFSeZJq6db0FZNtXNBZcaXNRTNZ083O', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice` (`invoice`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `invoice` (`invoice`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
