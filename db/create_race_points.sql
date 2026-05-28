-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Vært: localhost:3306
-- Genereringstid: 27. 05 2026 kl. 17:14:39
-- Serverversion: 12.2.2-MariaDB-log
-- PHP-version: 8.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jacobzimling_mlcrc`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `race_points`
--

CREATE TABLE `race_points` (
  `rank` int(11) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Data dump for tabellen `race_points`
--

INSERT INTO `race_points` (`rank`, `point`) VALUES
(1, 15),
(2, 12),
(3, 10),
(4, 8),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1),
(11, 0),
(12, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
