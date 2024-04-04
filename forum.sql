-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 06:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--
CREATE
DATABASE IF NOT EXISTS `forum` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE
`forum`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments`
(
    `id`
    int
(
    255
) NOT NULL AUTO_INCREMENT,
    `post_id` int
(
    255
) NOT NULL,
    `author` varchar
(
    255
) NOT NULL,
    `content` text NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp
(
) ON UPDATE current_timestamp
(
),
    `image_path` varchar
(
    255
) DEFAULT NULL,
    PRIMARY KEY
(
    `id`
)
    ) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE =utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `author`, `content`, `created_at`, `image_path`)
VALUES (1, 4, 'Trần Thanh Lâm', 'lâm', '2024-03-30 16:14:44', NULL),
       (2, 4, 'té', '1', '2024-03-30 16:20:36', NULL),
       (3, 5, 'a', 'b', '2024-03-30 16:22:25', NULL),
       (4, 5, 'âd', 'ádasdas', '2024-03-30 16:36:45', NULL),
       (5, 5, 'aaaa', 'aaaa', '2024-03-30 16:38:26', NULL),
       (6, 5, 'a', 'b', '2024-03-30 16:57:02', NULL),
       (7, 5, 'sa', 'á', '2024-04-01 02:26:43', NULL),
       (8, 5, '1111', '11111', '2024-04-01 03:08:04', NULL),
       (9, 4, '1111', '111111', '2024-04-01 03:11:58', NULL),
       (10, 6, 'Alarm Tran', 'Hello', '2024-04-01 04:00:50', NULL),
       (11, 3, 'siu', 'test', '2024-04-04 04:04:40', NULL),
       (12, 3, 'siu', 'test2', '2024-04-04 04:07:51', NULL),
       (13, 3, 'siu', 'test2', '2024-04-04 04:08:01', NULL),
       (14, 3, 'siu', 'test3', '2024-04-04 04:08:42', 'uploads/h13.jpg'),
       (15, 3, 'siu', 'test4', '2024-04-04 04:15:58', NULL),
       (16, 3, 'siu', 'test5', '2024-04-04 04:19:10', NULL),
       (17, 3, 'siu', 'test6', '2024-04-04 04:25:46', 'uploads/h13.jpg'),
       (18, 2, 'siu', 'test', '2024-04-04 04:28:49', 'uploads/h13.jpg'),
       (19, 2, 'siu', 'test2', '2024-04-04 04:30:51', 'uploads/h8.jpg'),
       (20, 2, 'siu', 'tês', '2024-04-04 04:44:22', 'uploads/h12.jpg'),
       (21, 2, 'siu', 'test', '2024-04-04 04:46:08', 'h3.jpg'),
       (22, 2, 'siu', 'test', '2024-04-04 04:47:14', '25.2. 2024.png'),
       (23, 1, 'siu', 'test', '2024-04-04 05:22:01', NULL),
       (24, 4, 'ninh', '13', '2024-04-04 05:24:33', NULL),
       (25, 1, 'siu', 'test', '2024-04-04 05:37:17', 'uploads/19.2.6.png'),
       (26, 1, 'siu', 'test', '2024-04-04 05:38:53', 'uploads/19.2.1.png'),
       (27, 4, 'siu', 'test', '2024-04-04 05:40:42', 'uploads/1.png'),
       (28, 4, 'siu', 'test', '2024-04-04 05:41:24', 'uploads/19.2.1.png'),
       (29, 4, 'siu', 'test', '2024-04-04 05:44:56', 'uploads/19.2.1.png'),
       (30, 4, 'siu', 'test', '2024-04-04 06:06:42', 'uploads/19.2.1.png'),
       (31, 4, 'siu', '108', '2024-04-04 06:08:26', 'uploads/19.2.7.png'),
       (32, 4, 'siu', '112', '2024-04-04 06:12:15', 'uploads/1.png'),
       (33, 4, 'siu', '117', '2024-04-04 06:17:15', 'uploads/1.png'),
       (34, 4, 'siu', '118', '2024-04-04 06:20:46', 'uploads/19.2.2.png'),
       (35, 4, 'siu', '127', '2024-04-04 06:27:53', 'uploads/1.png'),
       (36, 4, 'siu', '128', '2024-04-04 06:28:17', 'uploads/1.png'),
       (37, 4, 'siu', '138', '2024-04-04 06:38:33', 'uploads/1.png'),
       (38, 4, 'siu', '143', '2024-04-04 06:43:57', 'uploads/1.png'),
       (39, 4, 'siu', '150', '2024-04-04 06:50:21', 'uploads/22001627.jpg'),
       (40, 4, 'ff', 'f', '2024-04-04 07:09:37', '1.png'),
       (41, 4, 't', 't', '2024-04-04 07:10:23', '1.png'),
       (42, 4, 'siu', 'test', '2024-04-04 13:33:35', 'uploads/1.png'),
       (43, 4, 'siu', '836', '2024-04-04 13:36:18', 'uploads/1.png'),
       (44, 4, 'siu', '837', '2024-04-04 13:37:49', 'uploads/1.png'),
       (45, 4, 'siu', '842', '2024-04-04 13:42:27', 'uploads/h13.jpg'),
       (46, 4, 'siu', '843', '2024-04-04 13:43:34', 'uploads/h13.jpg'),
       (47, 4, 'siu', '903', '2024-04-04 14:03:33', 'uploads/h6.jpg'),
       (48, 4, 'siu', '904', '2024-04-04 14:05:19', 'uploads/h1.jpg'),
       (49, 4, 'siu', '922', '2024-04-04 14:22:14', 'uploads/h13.jpg'),
       (50, 4, 'siu', '938', '2024-04-04 14:38:45', 'uploads/h6.jpg'),
       (51, 4, 'siu', 'test', '2024-04-04 15:42:58', 'uploads/h13.jpg'),
       (52, 5, 'siu', '1051', '2024-04-04 15:51:58', 'uploads/h1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts`
(
    `id`
    int
(
    11
) NOT NULL AUTO_INCREMENT,
    `title` varchar
(
    255
) NOT NULL,
    `content` text NOT NULL,
    `author` varchar
(
    255
) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp
(
),
    PRIMARY KEY
(
    `id`
)
    ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE =utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author`, `created_at`)
VALUES (1, 'Hello everyone !!!', 'This is basic demo', 'lamtran', '2024-03-29 07:11:40'),
       (2, 'Su', '1', 'demo', '2024-03-30 16:22:21'),
       (3, 'Test', 'Je t\'aime', 'demo', '2024-04-01 04:00:41'),
(4, 'Test', '1', 'siu', '2024-04-04 05:23:33'),
(5, 'css', 'mi', 'siu', '2024-04-04 15:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `comment_id` int(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `comment_id`, `author`, `content`, `image`, `created_at`, `parent_id`, `image_path`) VALUES
(1, 9, '111', '111', NULL, '2024-04-01 03:17:04', NULL, NULL),
(2, 9, '11123123131', '1321312312312', NULL, '2024-04-01 03:17:17', 1, NULL),
(3, 9, '4', '1', NULL, '2024-04-01 03:19:48', NULL, NULL),
(4, 9, '123123123', '1231231231312321321', NULL, '2024-04-01 03:20:00', NULL, NULL),
(5, 9, '123', '123', NULL, '2024-04-01 03:20:16', NULL, NULL),
(6, 9, 'test', 'test', NULL, '2024-04-01 03:20:34', 2, NULL),
(7, 9, 'kkkk', 'kkkk', NULL, '2024-04-01 03:20:41', 6, NULL),
(8, 9, '1', '1', NULL, '2024-04-01 03:36:29', NULL, NULL),
(9, 9, '2', '3', NULL, '2024-04-01 03:39:35', 8, NULL),
(10, 9, '4', '56', NULL, '2024-04-01 03:41:24', 3, NULL),
(11, 9, '6', '7', NULL, '2024-04-01 03:46:08', NULL, NULL),
(12, 9, '6', '7', NULL, '2024-04-01 03:46:27', NULL, NULL),
(13, 8, 'sae', '1111', NULL, '2024-04-01 03:46:43', NULL, NULL),
(14, 8, '1111', 'adasdasd', NULL, '2024-04-01 03:46:54', 13, NULL),
(15, 10, 'Ronaldo', 'Siuuuu', NULL, '2024-04-01 04:01:09', NULL, NULL),
(16, 10, 'Fan', 'Wow', NULL, '2024-04-01 04:01:20', 15, NULL),
(17, 10, 'haha', 'Amazing', NULL, '2024-04-01 04:01:31', 16, NULL),
(18, 10, 'Lam', 'I love France !!', NULL, '2024-04-01 04:01:47', NULL, NULL),
(19, 10, 'HAHAHAAH', 'really ?', NULL, '2024-04-01 04:02:06', 18, NULL),
(20, 48, 'siu', '909', NULL, '2024-04-04 14:09:55', NULL, NULL),
(21, 49, 'siu', '923', NULL, '2024-04-04 14:22:23', NULL, NULL),
(22, 49, 'siu', '923', NULL, '2024-04-04 14:23:38', NULL, 'uploads/h8.jpg'),
(23, 50, 'siu', '939', NULL, '2024-04-04 14:40:31', NULL, 'uploads/h13.jpg'),
(24, 51, 'siu', 'test2', NULL, '2024-04-04 15:43:23', NULL, 'uploads/h1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '1'),
(2, '123', '$2y$10$jr.K7Ou97ncRoBEm6ak8AuGuIKCkTGjRAd/TkZqvZW7HThoQSCvtu'),
(3, 'cr7', '$2y$10$idH1UbGLl60ucbUjyBTihuSy2HDx6gQQ6lJYj/QUch6mkWCyJXjwa'),
(4, 'siu', 'siu'),
(5, 'tabi', '111'),
(6, 'lamtran', '1234'),
(7, 'demo', '123');

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
