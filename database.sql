-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2026 at 06:58 PM
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
-- Database: `cainta_scholarship`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `scholar_id` int(11) NOT NULL,
  `school_year` varchar(20) DEFAULT NULL,
  `semester` enum('1st','2nd') DEFAULT NULL,
  `gwa` decimal(4,2) DEFAULT NULL,
  `monthly_income` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','for_review','approved','rejected','incomplete') DEFAULT 'pending',
  `remarks` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `father_name` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `scholar_id`, `school_year`, `semester`, `gwa`, `monthly_income`, `status`, `remarks`, `submitted_at`, `father_name`, `father_occupation`, `mother_name`, `mother_occupation`) VALUES
(5, 3, '2025-2026', '1st', NULL, NULL, 'pending', NULL, '2026-04-26 15:27:47', 'ASDASDSA', 'ASDASDADA', 'afsfasfaAFDASDA', 'ASFAFFS'),
(6, 9, '2025-2026', '1st', NULL, NULL, 'incomplete', '', '2026-05-13 09:34:43', 'ASDasdsaaa', 'asdada', 'dasdsada', 'asdadadas'),
(7, 4, '2025-2026', '2nd', NULL, NULL, 'rejected', '', '2026-05-13 09:35:23', 'asdadasda', 'gdsgsadgfsd', 'gdfgsdfg', 'dgfdsgsdfgds'),
(8, 5, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-13 09:38:09', 'asdadasdasd', 'afsasffsa', 'afssafasasfasf', 'fasfsafasf'),
(9, 6, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-13 09:39:39', 'saasdadasd', 'asdasdasda', 'dasdsadsad', 'asdsadasd'),
(10, 7, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-13 09:40:26', 'asdasda', 'adsdsada', 'dasdada', 'dasdada'),
(11, 8, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-13 09:40:58', 'asdasdasdasdas', 'dasdadadasdsa', 'asdasdasdsada', 'dasdadad'),
(12, 1, '2025-2026', '2nd', NULL, NULL, 'incomplete', 'grade slip and school receipt not submitted', '2026-05-15 16:20:01', 'IAN VILLAR', 'DRIVER', 'IRY CALOOYONG MAANO', 'TGP'),
(13, 1, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:22:27', 'IAN VILLAR', 'DRIVER', 'IRY CALOOYONG MAANO', 'TGP'),
(14, 10, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:25:15', 'asdadada', 'dasdasdas', 'dasdasdasd', 'dasasdasd'),
(15, 11, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:33:13', 'yuyuyuu', 'yuyuyu', 'uyuyu', 'uuyuy'),
(16, 12, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:35:49', 'aeddeadadsadasd', 'dasdasdadasd', 'asdasdsadasdsadasd', 'dasdasdada'),
(17, 13, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:37:58', 'asdadas', 'sdasdasda', 'dasdad', 'dasdasda'),
(18, 14, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:41:08', 'asdad', 'dasdasd', 'asdasdd', 'dasdasdas'),
(19, 15, '2025-2026', '2nd', NULL, NULL, 'approved', '', '2026-05-15 16:43:39', 'dsadsad', 'adasdsad', 'asdasddas', 'dsadsad');

-- --------------------------------------------------------

--
-- Table structure for table `disbursements`
--

CREATE TABLE `disbursements` (
  `disbursement_id` int(11) NOT NULL,
  `scholar_id` int(11) NOT NULL,
  `school_year` varchar(20) DEFAULT NULL,
  `semester` enum('1st','2nd') DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','released') DEFAULT 'pending',
  `released_by` int(11) DEFAULT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) DEFAULT 0,
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `application_id`, `document_type`, `file_path`, `verified`, `verified_by`, `verified_at`) VALUES
(13, 5, 'barangay', 'Brgy. Santo Niño', 0, NULL, NULL),
(14, 5, 'birthdate', '2002-08-28', 0, NULL, NULL),
(15, 5, 'school', 'ASDASDDAS', 0, NULL, NULL),
(16, 5, 'course', 'AFSASFAF', 0, NULL, NULL),
(17, 5, 'year_level', '1', 0, NULL, NULL),
(18, 5, 'grade_slip', 'grade_slip_3_1777217267.png', 0, NULL, NULL),
(19, 5, 'enrollment_receipt', 'enrollment_receipt_3_1777217267.png', 0, NULL, NULL),
(20, 5, 'enrollment_form', 'enrollment_form_3_1777217267.png', 0, NULL, NULL),
(21, 6, 'barangay', 'Brgy. San Isidro', 0, NULL, NULL),
(22, 6, 'birthdate', '2001-01-01', 0, NULL, NULL),
(23, 6, 'school', 'PUP', 0, NULL, NULL),
(24, 6, 'course', 'BSA', 0, NULL, NULL),
(25, 6, 'year_level', '1', 0, NULL, NULL),
(26, 6, 'grade_slip', 'grade_slip_9_1778664883.png', 0, NULL, NULL),
(27, 6, 'enrollment_receipt', 'enrollment_receipt_9_1778664883.png', 0, NULL, NULL),
(28, 6, 'enrollment_form', 'enrollment_form_9_1778664883.jpg', 0, NULL, NULL),
(29, 7, 'barangay', 'Brgy. San Andres', 0, NULL, NULL),
(30, 7, 'birthdate', '2001-01-01', 0, NULL, NULL),
(31, 7, 'school', 'PLM', 0, NULL, NULL),
(32, 7, 'course', 'BSMT', 0, NULL, NULL),
(33, 7, 'year_level', '1', 0, NULL, NULL),
(34, 7, 'grade_slip', 'grade_slip_4_1778664923.jpg', 0, NULL, NULL),
(35, 7, 'enrollment_receipt', 'enrollment_receipt_4_1778664923.jpg', 0, NULL, NULL),
(36, 7, 'enrollment_form', 'enrollment_form_4_1778664923.jpg', 0, NULL, NULL),
(37, 8, 'barangay', 'Brgy. San Andres', 0, NULL, NULL),
(38, 8, 'birthdate', '2001-01-01', 0, NULL, NULL),
(39, 8, 'school', 'ICCT', 0, NULL, NULL),
(40, 8, 'course', 'BSSS', 0, NULL, NULL),
(41, 8, 'year_level', '1', 0, NULL, NULL),
(42, 8, 'grade_slip', 'grade_slip_5_1778665089.webp', 0, NULL, NULL),
(43, 8, 'enrollment_receipt', 'enrollment_receipt_5_1778665089.webp', 0, NULL, NULL),
(44, 8, 'enrollment_form', 'enrollment_form_5_1778665089.jpg', 0, NULL, NULL),
(45, 9, 'barangay', 'Brgy. San Andres', 0, NULL, NULL),
(46, 9, 'birthdate', '2001-01-01', 0, NULL, NULL),
(47, 9, 'school', 'PLM', 0, NULL, NULL),
(48, 9, 'course', 'BSN', 0, NULL, NULL),
(49, 9, 'year_level', '1', 0, NULL, NULL),
(50, 9, 'grade_slip', 'grade_slip_6_1778665179.webp', 0, NULL, NULL),
(51, 9, 'enrollment_receipt', 'enrollment_receipt_6_1778665179.webp', 0, NULL, NULL),
(52, 9, 'enrollment_form', 'enrollment_form_6_1778665179.jpg', 0, NULL, NULL),
(53, 10, 'barangay', 'Brgy. San Isidro', 0, NULL, NULL),
(54, 10, 'birthdate', '2001-01-01', 0, NULL, NULL),
(55, 10, 'school', 'ATENEO', 0, NULL, NULL),
(56, 10, 'course', 'BSPsych', 0, NULL, NULL),
(57, 10, 'year_level', '1', 0, NULL, NULL),
(58, 10, 'grade_slip', 'grade_slip_7_1778665226.webp', 0, NULL, NULL),
(59, 10, 'enrollment_receipt', 'enrollment_receipt_7_1778665226.webp', 0, NULL, NULL),
(60, 10, 'enrollment_form', 'enrollment_form_7_1778665226.jpg', 0, NULL, NULL),
(61, 11, 'barangay', 'Brgy. San Isidro', 0, NULL, NULL),
(62, 11, 'birthdate', '2001-01-01', 0, NULL, NULL),
(63, 11, 'school', 'NU', 0, NULL, NULL),
(64, 11, 'course', 'BSTM', 0, NULL, NULL),
(65, 11, 'year_level', '1', 0, NULL, NULL),
(66, 11, 'grade_slip', 'grade_slip_8_1778665258.jpg', 0, NULL, NULL),
(67, 11, 'enrollment_receipt', 'enrollment_receipt_8_1778665258.jpg', 0, NULL, NULL),
(68, 11, 'enrollment_form', 'enrollment_form_8_1778665258.jpg', 0, NULL, NULL),
(69, 12, 'barangay', 'Brgy. San Juan', 0, NULL, NULL),
(70, 12, 'birthdate', '2002-09-28', 0, NULL, NULL),
(71, 12, 'school', 'STI COLLEGE ORTIGAS-CAINTA', 0, NULL, NULL),
(72, 12, 'course', 'BSIT', 0, NULL, NULL),
(73, 12, 'year_level', '3', 0, NULL, NULL),
(74, 12, 'enrollment_form', 'enrollment_form_1_1778862001_190.jpg', 0, NULL, NULL),
(75, 13, 'barangay', 'Brgy. San Juan', 0, NULL, NULL),
(76, 13, 'birthdate', '2002-09-28', 0, NULL, NULL),
(77, 13, 'school', 'STI COLLEGE ORTIGAS-CAINTA', 0, NULL, NULL),
(78, 13, 'course', 'BSIT', 0, NULL, NULL),
(79, 13, 'year_level', '3', 0, NULL, NULL),
(80, 13, 'grade_slip', 'grade_slip_1_1778862147_838.jpg', 0, NULL, NULL),
(81, 13, 'enrollment_receipt', 'enrollment_receipt_1_1778862147_983.jpg', 0, NULL, NULL),
(82, 13, 'enrollment_form', 'enrollment_form_1_1778862147_681.jpg', 0, NULL, NULL),
(83, 14, 'barangay', 'Brgy. San Roque', 0, NULL, NULL),
(84, 14, 'birthdate', '2001-01-01', 0, NULL, NULL),
(85, 14, 'school', 'MAPUA', 0, NULL, NULL),
(86, 14, 'course', 'BSA', 0, NULL, NULL),
(87, 14, 'year_level', '2', 0, NULL, NULL),
(88, 14, 'grade_slip', 'grade_slip_10_1778862315_917.jpg', 0, NULL, NULL),
(89, 14, 'enrollment_receipt', 'enrollment_receipt_10_1778862315_771.jpg', 0, NULL, NULL),
(90, 14, 'enrollment_form', 'enrollment_form_10_1778862315_539.jpg', 0, NULL, NULL),
(91, 15, 'barangay', 'Brgy. San Roque', 0, NULL, NULL),
(92, 15, 'birthdate', '2002-02-02', 0, NULL, NULL),
(93, 15, 'school', 'UP', 0, NULL, NULL),
(94, 15, 'course', 'BSE', 0, NULL, NULL),
(95, 15, 'year_level', '2', 0, NULL, NULL),
(96, 15, 'grade_slip', 'grade_slip_11_1778862793_100.jpg', 0, NULL, NULL),
(97, 15, 'enrollment_receipt', 'enrollment_receipt_11_1778862793_633.jpg', 0, NULL, NULL),
(98, 15, 'enrollment_form', 'enrollment_form_11_1778862793_250.jpg', 0, NULL, NULL),
(99, 16, 'barangay', 'Brgy. Santa Rosa', 0, NULL, NULL),
(100, 16, 'birthdate', '2001-02-03', 0, NULL, NULL),
(101, 16, 'school', 'De La Salle University ', 0, NULL, NULL),
(102, 16, 'course', 'BEMS', 0, NULL, NULL),
(103, 16, 'year_level', '4', 0, NULL, NULL),
(104, 16, 'grade_slip', 'grade_slip_12_1778862949_983.jpg', 0, NULL, NULL),
(105, 16, 'enrollment_receipt', 'enrollment_receipt_12_1778862949_423.jpg', 0, NULL, NULL),
(106, 16, 'enrollment_form', 'enrollment_form_12_1778862949_993.jpg', 0, NULL, NULL),
(107, 17, 'barangay', 'Brgy. Santa Rosa', 0, NULL, NULL),
(108, 17, 'birthdate', '2001-03-03', 0, NULL, NULL),
(109, 17, 'school', 'University of Santo Tomas ', 0, NULL, NULL),
(110, 17, 'course', 'BAgr', 0, NULL, NULL),
(111, 17, 'year_level', '2', 0, NULL, NULL),
(112, 17, 'grade_slip', 'grade_slip_13_1778863078_915.jpg', 0, NULL, NULL),
(113, 17, 'enrollment_receipt', 'enrollment_receipt_13_1778863078_716.jpg', 0, NULL, NULL),
(114, 17, 'enrollment_form', 'enrollment_form_13_1778863078_853.jpg', 0, NULL, NULL),
(115, 18, 'barangay', 'Brgy. Santo Domingo', 0, NULL, NULL),
(116, 18, 'birthdate', '2001-01-01', 0, NULL, NULL),
(117, 18, 'school', 'Far Eastern University ', 0, NULL, NULL),
(118, 18, 'course', 'BBA', 0, NULL, NULL),
(119, 18, 'year_level', '2', 0, NULL, NULL),
(120, 18, 'grade_slip', 'grade_slip_14_1778863268_803.jpg', 0, NULL, NULL),
(121, 18, 'enrollment_receipt', 'enrollment_receipt_14_1778863268_966.jpg', 0, NULL, NULL),
(122, 18, 'enrollment_form', 'enrollment_form_14_1778863268_376.jpg', 0, NULL, NULL),
(123, 19, 'barangay', 'Brgy. Santo Niño', 0, NULL, NULL),
(124, 19, 'birthdate', '2001-04-04', 0, NULL, NULL),
(125, 19, 'school', 'Polytechnic University of the Philippines ', 0, NULL, NULL),
(126, 19, 'course', 'B.A.J.', 0, NULL, NULL),
(127, 19, 'year_level', '2', 0, NULL, NULL),
(128, 19, 'grade_slip', 'grade_slip_15_1778863419_686.jpg', 0, NULL, NULL),
(129, 19, 'enrollment_receipt', 'enrollment_receipt_15_1778863419_797.jpg', 0, NULL, NULL),
(130, 19, 'enrollment_form', 'enrollment_form_15_1778863419_563.jpg', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `reorder_level` int(11) DEFAULT 10,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `transaction_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `scholar_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `type` enum('IN','OUT') DEFAULT NULL,
  `processed_by` int(11) DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholars`
--

CREATE TABLE `scholars` (
  `scholar_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `address` text DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `school` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_archived` tinyint(4) DEFAULT 0,
  `archived_at` timestamp NULL DEFAULT NULL,
  `archive_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholars`
--

INSERT INTO `scholars` (`scholar_id`, `first_name`, `last_name`, `middle_name`, `birthdate`, `gender`, `address`, `barangay`, `contact_no`, `email`, `school`, `course`, `year_level`, `status`, `created_at`, `is_archived`, `archived_at`, `archive_reason`) VALUES
(1, 'John Ryan', 'Villar', '', '2006-09-12', 'Male', 'PELICAN ST ANAKPAWIS CAINTA RIZAL', 'Brgy. San Juan', '09123132123', 'johnryanvillar7@gmail.com', 'ICCT COLLEGE CAINTA', 'BSIT', 1, 'active', '2026-04-30 00:40:17', 0, NULL, NULL),
(4, 'MILYN', 'AMOGUIS', 'PAGALAN', '2001-01-01', 'Female', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Isidro', '09211312414', 'amoguis@gmail.com', 'ATENEO', 'BSPsych', 1, 'active', '2026-05-13 09:43:23', 0, NULL, NULL),
(5, 'SANDARA', 'ABELLO', 'GUCAN', '2001-01-01', 'Female', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Andres', '09211312413', 'abello@gmail.com', 'PLM', 'BSN', 1, 'active', '2026-05-13 09:43:36', 0, NULL, NULL),
(6, 'EMANUEL', 'ABANTE', 'DE CLARO', '2001-01-01', 'Male', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Andres', '09211312412', 'abante@gmail.com', 'ICCT', 'BSSS', 1, 'active', '2026-05-13 09:43:48', 0, NULL, NULL),
(7, 'James', 'Villar', 'Brian', '2002-09-28', 'Male', 'PELICAN ST ANAKPAWIS CAINTA RIZAL', 'Brgy. San Juan', '09305622222', 'villarjamesbrian1@gmail.com', 'STI COLLEGE ORTIGAS-CAINTA', 'BSIT', 3, 'active', '2026-05-15 16:22:52', 0, NULL, NULL),
(8, 'Caimee', 'Buban', 'G', '2001-01-01', 'Female', 'san roque', 'Brgy. San Roque', '11231231326', 'buban@gmail.com', 'MAPUA', 'BSA', 2, 'active', '2026-05-15 16:29:28', 0, NULL, NULL),
(9, 'BRIXX', 'AMPIL', 'BULAN', '2001-01-01', 'Male', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Isidro', '09211312414', 'ampil@gmail.com', 'NU', 'BSTM', 1, 'active', '2026-05-15 16:30:03', 0, NULL, NULL),
(10, 'Mary', 'Yu', 'Villegas', '2002-02-02', 'Female', 'san roque', 'Brgy. San Roque', '09512351315', 'yu@gmail.com', 'UP', 'BSE', 2, 'active', '2026-05-15 16:33:22', 0, NULL, NULL),
(11, 'Lady', 'Dela Cruz', 'Lapitan', '2001-02-03', 'Female', 'Santa Rosa', 'Brgy. Santa Rosa', '09777777777', 'delacruz@gmail.com', 'De La Salle University ', 'BEMS', 4, 'active', '2026-05-15 16:36:07', 0, NULL, NULL),
(12, 'RUN', 'HERNANDEZ', 'SEÑORA', '2001-03-03', 'Male', 'Santa Rosa', 'Brgy. Santa Rosa', '09777777111', 'hernandez@gmail.com', 'University of Santo Tomas ', 'BAgr', 2, 'active', '2026-05-15 16:38:14', 0, NULL, NULL),
(13, 'MARGARET', 'DE GUZMAN', 'TOLENTINO', '2001-01-01', 'Female', 'santo domingo', 'Brgy. Santo Domingo', '09532234525', 'deguzman@gmail.com', 'Far Eastern University ', 'BBA', 2, 'active', '2026-05-15 16:41:22', 0, NULL, NULL),
(14, 'PAULINE', 'FABIAN', 'FAMADICO', '2001-04-04', 'Female', 'Santo Nino', 'Brgy. Santo Niño', '09314444444', 'fabian@gmail.com', 'Polytechnic University of the Philippines ', 'B.A.J.', 2, 'active', '2026-05-15 16:43:53', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_archived` tinyint(4) DEFAULT 0,
  `archived_at` timestamp NULL DEFAULT NULL,
  `archive_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `middle_name`, `email`, `password`, `contact_no`, `address`, `barangay`, `birthdate`, `gender`, `is_active`, `created_at`, `is_archived`, `archived_at`, `archive_reason`) VALUES
(1, 'James', 'Villar', 'Brian', 'villarjamesbrian1@gmail.com', '$2y$10$xkD9aZiyqQKTURkemomCi.kSacSq8py0TyOQybEFYxZVNq44YnNjq', '09305622222', 'PELICAN ST ANAKPAWIS CAINTA RIZAL', 'Brgy. San Juan', '2002-09-28', 'Male', 1, '2026-04-30 00:37:13', 0, NULL, NULL),
(2, 'John Ryan', 'Villar', '', 'johnryanvillar7@gmail.com', '$2y$10$sHQuxt.pCb7MeTi6Gnh/9em5FiePCWUuYNJwLVjUjlet8uOMQx1F.', '09123132123', 'PELICAN ST ANAKPAWIS CAINTA RIZAL', 'Brgy. San Andres', '2006-09-12', 'Male', 1, '2026-04-30 00:39:19', 0, NULL, NULL),
(3, 'Angelus', 'Pacheco', '', 'angeluspacheco2827@gmail.com', '$2y$10$cFpKYROvue8ELspWWN9bgOniHTRjX1T5AIBvf5jdUl7A7NIsyKJCG', '09612376162', 'Tassel St Greenland Subd', 'Brgy. San Isidro', '2002-08-28', 'Female', 1, '2026-04-30 00:39:55', 0, NULL, NULL),
(4, 'DAVID', 'ABALES', 'APOLINAR', 'abales@gmail.com', '$2y$10$LN6ZJOqFyVpND1nOHaXiM.SH/ExX9cEoRSXJhbH4C2R6YHaST0jWq', '09211312412', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Andres', '2001-01-01', 'Male', 1, '2026-05-13 09:30:20', 0, NULL, NULL),
(5, 'EMANUEL', 'ABANTE', 'DE CLARO', 'abante@gmail.com', '$2y$10$0HrXSzOG.Jl6c/v36JvYg.tYBqSHUyyGuAvFWW6sxjkJN7vl7.PNC', '09211312412', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Andres', '2001-01-01', 'Male', 1, '2026-05-13 09:31:06', 0, NULL, NULL),
(6, 'SANDARA', 'ABELLO', 'GUCAN', 'abello@gmail.com', '$2y$10$LpqqMwxRynLwpjtGZA.sq.lIadZ5HVSixS1Kjlf5tRL7AOaJC0uvO', '09211312413', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Andres', '2001-01-01', 'Female', 1, '2026-05-13 09:31:49', 0, NULL, NULL),
(7, 'MILYN', 'AMOGUIS', 'PAGALAN', 'amoguis@gmail.com', '$2y$10$8z4fUS8xz2SjokxDdPLTvulKIQ0C570Vte7qiTyhIRB100b3wnWKe', '09211312414', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Isidro', '2001-01-01', 'Female', 1, '2026-05-13 09:32:39', 0, NULL, NULL),
(8, 'BRIXX', 'AMPIL', 'BULAN', 'ampil@gmail.com', '$2y$10$3jiceWq3TDM.5qJlDPH2qeO0lLNefMQM77pIC96JSB5Jy.OSEy89y', '09211312414', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Isidro', '2001-01-01', 'Male', 1, '2026-05-13 09:33:15', 0, NULL, NULL),
(9, 'PRINCESS', 'GARCIA', 'BORROMEO', 'garcia@gmail.com', '$2y$10$1fMRI8m6HtxdS7uEdgASRucY5R2YyplcrQEmF1HXOlpoVVx8YyK.u', '09211312415', 'asdasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 'Brgy. San Isidro', '2001-01-01', 'Female', 1, '2026-05-13 09:33:52', 0, NULL, NULL),
(10, 'Caimee', 'Buban', 'G', 'buban@gmail.com', '$2y$10$vbRucnjC2WwXY/Hj3y4X.OEQOg/3nrPKC0MEwYGw8zX8laZScGpnW', '11231231326', 'san roque', 'Brgy. San Roque', '2001-01-01', 'Female', 1, '2026-05-15 16:24:42', 0, NULL, NULL),
(11, 'Mary', 'Yu', 'Villegas', 'yu@gmail.com', '$2y$10$60RMsDgOBWwCMmkgNJmdMeSH3l7ItKUbDDdhLmY98nkNoqJ1ESTh6', '09512351315', 'san roque', 'Brgy. San Roque', '2002-02-02', 'Female', 1, '2026-05-15 16:32:04', 0, NULL, NULL),
(12, 'Lady', 'Dela Cruz', 'Lapitan', 'delacruz@gmail.com', '$2y$10$FirxKZ4uiFuAPv5ZhgrjK.PCJujV4osggRHZJnivKI2jJPkG3HuUm', '09777777777', 'Santa Rosa', 'Brgy. Santa Rosa', '2001-02-03', 'Female', 1, '2026-05-15 16:34:39', 0, NULL, NULL),
(13, 'RUN', 'HERNANDEZ', 'SEÑORA', 'hernandez@gmail.com', '$2y$10$dPtWUPcT.n7e2EiEVtFJweBJ039oF1xWoEPvANJXq3Q7UNAGOGNym', '09777777111', 'Santa Rosa', 'Brgy. Santa Rosa', '2001-03-03', 'Male', 1, '2026-05-15 16:37:08', 0, NULL, NULL),
(14, 'MARGARET', 'DE GUZMAN', 'TOLENTINO', 'deguzman@gmail.com', '$2y$10$1IU1d2lLZp6KJGQNGal/WuW9fECI6h6fg6wYBTPil2Hjz9WvgI45y', '09532234525', 'santo domingo', 'Brgy. Santo Domingo', '2001-01-01', 'Female', 1, '2026-05-15 16:40:21', 0, NULL, NULL),
(15, 'PAULINE', 'FABIAN', 'FAMADICO', 'fabian@gmail.com', '$2y$10$oZgJEUwpAvr64Eo5VKmoeugEs0w3Gwviol8uiOgnnmows4cepp3PO', '09314444444', 'Santo Nino', 'Brgy. Santo Niño', '2001-04-04', 'Female', 1, '2026-05-15 16:42:45', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','officer','cashier') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `username`, `password`, `role`, `email`, `is_active`, `created_at`) VALUES
(1, 'Administrator', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'admin@cainta.gov.ph', 1, '2026-03-31 08:23:49'),
(2, 'Scholarship Officer', 'officer', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'officer', 'officer@cainta.gov.ph', 1, '2026-03-31 08:23:49'),
(3, 'Cashier', 'cashier', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cashier', 'cashier@cainta.gov.ph', 1, '2026-03-31 08:23:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `scholar_id` (`scholar_id`);

--
-- Indexes for table `disbursements`
--
ALTER TABLE `disbursements`
  ADD PRIMARY KEY (`disbursement_id`),
  ADD KEY `scholar_id` (`scholar_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `scholars`
--
ALTER TABLE `scholars`
  ADD PRIMARY KEY (`scholar_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

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
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `disbursements`
--
ALTER TABLE `disbursements`
  MODIFY `disbursement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scholars`
--
ALTER TABLE `scholars`
  MODIFY `scholar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`);

--
-- Constraints for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `inventory_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory_items` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
