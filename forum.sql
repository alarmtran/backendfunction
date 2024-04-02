-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 07:18 PM
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
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `post_id` int(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `author`, `content`, `created_at`) VALUES
(1, 4, 'Trần Thanh Lâm', 'lâm', '2024-03-30 16:14:44'),
(2, 4, 'té', '1', '2024-03-30 16:20:36'),
(3, 5, 'a', 'b', '2024-03-30 16:22:25'),
(4, 5, 'âd', 'ádasdas', '2024-03-30 16:36:45'),
(5, 5, 'aaaa', 'aaaa', '2024-03-30 16:38:26'),
(6, 5, 'a', 'b', '2024-03-30 16:57:02'),
(7, 5, 'sa', 'á', '2024-04-01 02:26:43'),
(8, 5, '1111', '11111', '2024-04-01 03:08:04'),
(9, 4, '1111', '111111', '2024-04-01 03:11:58'),
(10, 6, 'Alarm Tran', 'Hello', '2024-04-01 04:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author`, `created_at`) VALUES
(4, 'Hello everyone !!!', 'This is basic demo', 'lamtran', '2024-03-29 07:11:40'),
(5, 'Su', '1', 'demo', '2024-03-30 16:22:21'),
(6, 'Test', 'Je t\'aime', 'demo', '2024-04-01 04:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(255) NOT NULL,
  `comment_id` int(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `comment_id`, `author`, `content`, `image`, `created_at`, `parent_id`) VALUES
(1, 9, '111', '111', NULL, '2024-04-01 03:17:04', NULL),
(2, 9, '11123123131', '1321312312312', NULL, '2024-04-01 03:17:17', 1),
(3, 9, '4', '1', NULL, '2024-04-01 03:19:48', NULL),
(4, 9, '123123123', '1231231231312321321', NULL, '2024-04-01 03:20:00', NULL),
(5, 9, '123', '123', NULL, '2024-04-01 03:20:16', NULL),
(6, 9, 'test', 'test', NULL, '2024-04-01 03:20:34', 2),
(7, 9, 'kkkk', 'kkkk', NULL, '2024-04-01 03:20:41', 6),
(8, 9, '1', '1', NULL, '2024-04-01 03:36:29', NULL),
(9, 9, '2', '3', NULL, '2024-04-01 03:39:35', 8),
(10, 9, '4', '56', NULL, '2024-04-01 03:41:24', 3),
(11, 9, '6', '7', NULL, '2024-04-01 03:46:08', NULL),
(12, 9, '6', '7', NULL, '2024-04-01 03:46:27', NULL),
(13, 8, 'sae', '1111', NULL, '2024-04-01 03:46:43', NULL),
(14, 8, '1111', 'adasdasd', NULL, '2024-04-01 03:46:54', 13),
(15, 10, 'Ronaldo', 'Siuuuu', NULL, '2024-04-01 04:01:09', NULL),
(16, 10, 'Fan', 'Wow', NULL, '2024-04-01 04:01:20', 15),
(17, 10, 'haha', 'Amazing', NULL, '2024-04-01 04:01:31', 16),
(18, 10, 'Lam', 'I love France !!', NULL, '2024-04-01 04:01:47', NULL),
(19, 10, 'HAHAHAAH', 'really ?', NULL, '2024-04-01 04:02:06', 18);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '1'),
(2, '123', '$2y$10$jr.K7Ou97ncRoBEm6ak8AuGuIKCkTGjRAd/TkZqvZW7HThoQSCvtu'),
(3, 'cr7', '$2y$10$idH1UbGLl60ucbUjyBTihuSy2HDx6gQQ6lJYj/QUch6mkWCyJXjwa'),
(4, 'siu', 'siu'),
(6, 'tabi', '111'),
(7, 'lamtran', '1234'),
(8, 'demo', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `replies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
