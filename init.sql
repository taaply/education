-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2025 at 09:53 PM
-- Server version: 8.0.41
-- PHP Version: 8.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lekel683_education`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE `academic_calendars` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,4) NOT NULL COMMENT 'Daily price',
  `feature_id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Inactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `price`, `feature_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Timetable', 0.0000, 7, 1, '2024-06-18 22:25:19', '2024-06-18 22:25:30', NULL),
(2, 'Slider', 0.0000, 3, 1, '2024-06-18 22:39:15', '2024-06-18 22:41:13', NULL),
(3, 'Assignment', 0.0000, 11, 1, '2024-06-18 22:41:07', '2024-06-18 22:41:16', NULL),
(4, 'Attendance', 0.0000, 8, 1, '2024-06-18 23:33:52', '2024-06-18 23:33:57', NULL),
(5, 'Lesson', 0.0000, 10, 1, '2024-06-18 23:34:37', '2024-06-18 23:34:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `addon_subscriptions`
--

CREATE TABLE `addon_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `feature_id` bigint UNSIGNED NOT NULL,
  `price` double(8,4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 => Discontinue next billing, 1 => Continue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_subscriptions`
--

INSERT INTO `addon_subscriptions` (`id`, `school_id`, `feature_id`, `price`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 11, 0.0000, '2024-06-18', '2025-06-17', 1, '2024-06-18 22:41:53', '2024-06-18 22:41:53', NULL),
(2, 4, 8, 0.0000, '2024-06-18', '2025-06-17', 1, '2024-06-18 23:35:01', '2024-06-18 23:35:01', NULL),
(3, 4, 10, 0.0000, '2024-06-18', '2025-06-17', 1, '2024-06-18 23:35:11', '2024-06-18 23:35:11', NULL),
(4, 4, 3, 0.0000, '2024-06-18', '2025-06-17', 1, '2024-06-18 23:39:26', '2024-06-18 23:39:26', NULL),
(5, 73, 3, 0.0000, '2025-02-13', '2026-01-28', 1, '2025-02-13 18:52:01', '2025-02-13 18:52:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `description`, `session_year_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Public Holiday', 'Today is puvlic Holiday', 34, 29, '2024-06-28 16:54:59', '2024-06-28 16:54:59'),
(2, 'Notice', 'Its Notice', 34, 29, '2024-06-28 16:58:10', '2024-06-28 16:58:10'),
(3, 'Field Trip to Buea', NULL, 40, 33, '2024-07-23 02:43:10', '2024-07-23 02:43:10'),
(4, 'Geography Studies Trip to Bamenda', 'We will be visiting a few places around Cameroon', 40, 33, '2024-07-23 02:46:32', '2024-07-23 02:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_classes`
--

CREATE TABLE `announcement_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `announcement_id` bigint UNSIGNED DEFAULT NULL,
  `class_section_id` bigint UNSIGNED DEFAULT NULL,
  `class_subject_id` bigint UNSIGNED DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcement_classes`
--

INSERT INTO `announcement_classes` (`id`, `announcement_id`, `class_section_id`, `class_subject_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 1, 13, 10, 29, '2024-06-28 16:54:59', '2024-06-28 16:54:59'),
(2, 2, 13, NULL, 29, '2024-06-28 16:58:10', '2024-06-28 16:58:10'),
(3, 3, 43, NULL, 33, '2024-07-23 02:43:10', '2024-07-23 02:43:10'),
(4, 4, 43, 14, 33, '2024-07-23 02:46:32', '2024-07-23 02:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `points` int DEFAULT NULL,
  `resubmission` tinyint(1) NOT NULL DEFAULT '0',
  `extra_days_for_resubmission` int DEFAULT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL COMMENT 'teacher_user_id',
  `edited_by` bigint UNSIGNED DEFAULT NULL COMMENT 'teacher_user_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `class_section_id`, `class_subject_id`, `name`, `instructions`, `due_date`, `points`, `resubmission`, `extra_days_for_resubmission`, `session_year_id`, `school_id`, `created_by`, `edited_by`, `created_at`, `updated_at`) VALUES
(1, 13, 10, 'Assignment no 1', 'Please read the instructions here', '2024-06-28 15:10:00', NULL, 1, 5, 34, 29, 104, NULL, '2024-06-28 16:37:46', '2024-06-28 16:37:46'),
(2, 13, 11, 'Organic Compunds', 'Please write down all the compunds', '2024-07-08 12:17:00', 20, 0, NULL, 34, 29, 104, NULL, '2024-07-06 16:47:57', '2024-07-06 16:47:57'),
(3, 43, 14, 'Write an essay about Cameroon geography', 'Write an essay not more than 1500 words.', '2024-09-30 18:00:00', 10, 0, NULL, 40, 33, 119, NULL, '2024-07-23 02:39:54', '2024-07-23 02:39:54'),
(4, 43, 16, 'First Day at School', 'Write an essay about your first day at school. No less than 3000 words.', '2024-11-22 18:00:00', 10, 0, NULL, 40, 33, 119, NULL, '2024-07-23 03:05:10', '2024-07-23 03:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `assignment_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `points` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = Pending/In Review , 1 = Accepted , 2 = Rejected , 3 = Resubmitted',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignment_submissions`
--

INSERT INTO `assignment_submissions` (`id`, `assignment_id`, `student_id`, `session_year_id`, `feedback`, `points`, `status`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 3, 121, 40, NULL, NULL, 0, 33, '2024-07-23 03:06:25', '2024-07-23 03:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `session_year_id` bigint UNSIGNED NOT NULL,
  `type` tinyint NOT NULL COMMENT '0=Absent, 1=Present',
  `date` date NOT NULL,
  `remark` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `class_section_id`, `student_id`, `session_year_id`, `type`, `date`, `remark`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 43, 122, 40, 0, '2024-07-22', '', 33, '2024-07-23 02:40:47', '2024-07-23 02:40:47'),
(2, 43, 121, 40, 1, '2024-07-22', '', 33, '2024-07-23 02:40:47', '2024-07-23 02:40:47'),
(3, 43, 122, 40, 1, '2024-07-21', '', 33, '2024-07-23 02:40:59', '2024-07-23 02:40:59'),
(4, 43, 121, 40, 1, '2024-07-21', '', 33, '2024-07-23 02:40:59', '2024-07-23 02:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `include_semesters` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no 1 - yes',
  `medium_id` bigint UNSIGNED NOT NULL,
  `shift_id` bigint UNSIGNED DEFAULT NULL,
  `stream_id` bigint UNSIGNED DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `include_semesters`, `medium_id`, `shift_id`, `stream_id`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 0, 1, NULL, NULL, 1, '2024-06-16 21:14:28', '2024-06-16 21:14:28', NULL),
(2, 'Social Studies', 0, 2, NULL, NULL, 2, '2024-06-17 23:52:25', '2024-06-17 23:52:25', NULL),
(3, '9th', 1, 3, NULL, NULL, 4, '2024-06-18 05:59:13', '2024-06-18 23:57:59', NULL),
(4, '8th', 0, 3, 1, NULL, 4, '2024-06-18 22:15:00', '2024-06-18 23:43:23', NULL),
(5, '1', 0, 4, NULL, NULL, 26, '2024-06-24 07:56:16', '2024-06-24 21:56:48', '2024-06-24 21:56:48'),
(6, 'Class 1', 0, 4, NULL, NULL, 26, '2024-06-24 21:56:39', '2024-06-24 22:01:00', NULL),
(7, 'Class 2', 0, 4, NULL, NULL, 26, '2024-06-24 21:57:31', '2024-06-24 21:57:31', NULL),
(8, 'Class 3', 0, 4, NULL, NULL, 26, '2024-06-24 21:57:44', '2024-06-24 21:57:44', NULL),
(9, 'Class dummy', 0, 6, NULL, NULL, 29, '2024-06-25 18:10:47', '2024-06-25 18:10:47', NULL),
(10, '1', 0, 7, NULL, NULL, 31, '2024-06-26 02:54:36', '2024-06-26 02:54:36', NULL),
(11, 'Pre-Nursery', 1, 8, NULL, NULL, 32, '2024-06-27 01:10:07', '2024-06-27 01:10:07', NULL),
(12, 'Nursery 1', 1, 8, NULL, NULL, 32, '2024-06-27 01:10:29', '2024-06-27 01:10:29', NULL),
(13, 'Nursery 2', 1, 8, NULL, NULL, 32, '2024-06-27 01:10:45', '2024-06-27 01:10:45', NULL),
(14, 'Class 1', 1, 8, NULL, NULL, 32, '2024-06-27 01:11:02', '2024-06-27 01:11:02', NULL),
(15, 'Class 2', 1, 8, NULL, NULL, 32, '2024-06-27 01:11:19', '2024-06-27 01:11:19', NULL),
(16, 'Class 3', 1, 8, NULL, NULL, 32, '2024-06-27 01:11:36', '2024-06-27 01:11:36', NULL),
(17, 'Class 4', 1, 8, NULL, NULL, 32, '2024-06-27 01:12:12', '2024-06-27 01:12:12', NULL),
(18, 'Class 5', 1, 8, NULL, NULL, 32, '2024-06-27 01:12:30', '2024-06-27 01:12:30', NULL),
(19, 'Class 6', 1, 8, NULL, NULL, 32, '2024-06-27 01:12:50', '2024-06-27 01:12:50', NULL),
(20, 'Pre-Nursery', 1, 9, NULL, NULL, 32, '2024-06-27 01:13:59', '2024-06-27 01:13:59', NULL),
(21, 'Nursery 1', 1, 9, NULL, NULL, 32, '2024-06-27 01:14:39', '2024-06-27 01:14:39', NULL),
(22, 'Nursery 2', 1, 9, NULL, NULL, 32, '2024-06-27 01:14:50', '2024-06-27 01:14:50', NULL),
(23, 'Sil', 1, 9, NULL, NULL, 32, '2024-06-27 01:15:38', '2024-06-27 01:15:38', NULL),
(24, 'CP', 1, 9, NULL, NULL, 32, '2024-06-27 01:15:55', '2024-06-27 01:15:55', NULL),
(25, 'CE 1', 1, 9, NULL, NULL, 32, '2024-06-27 01:16:35', '2024-06-27 01:16:35', NULL),
(26, 'CE 2', 1, 9, NULL, NULL, 32, '2024-06-27 01:16:46', '2024-06-27 01:16:46', NULL),
(27, 'CM 1', 1, 9, NULL, NULL, 32, '2024-06-27 01:17:01', '2024-06-27 01:17:01', NULL),
(28, 'CM2', 1, 9, NULL, NULL, 32, '2024-06-27 01:17:12', '2024-06-27 01:17:12', NULL),
(29, 'Class 1', 0, 10, NULL, NULL, 33, '2024-07-01 18:37:23', '2024-07-22 01:38:55', NULL),
(30, 'Decorum Hall', 0, 12, NULL, NULL, 36, '2024-07-04 18:00:15', '2024-07-04 18:00:15', NULL),
(31, 'Smithen Hall', 0, 12, NULL, NULL, 36, '2024-07-04 18:01:21', '2024-07-04 18:01:21', NULL),
(32, 'Class 2', 0, 10, NULL, NULL, 33, '2024-07-22 01:37:48', '2024-07-22 01:37:48', NULL),
(33, 'Class 3', 0, 10, NULL, NULL, 33, '2024-07-22 01:37:56', '2024-07-22 01:37:56', NULL),
(34, 'Class 4', 0, 10, NULL, NULL, 33, '2024-07-22 01:38:19', '2024-07-22 01:38:19', NULL),
(35, 'Class 5', 0, 10, NULL, NULL, 33, '2024-07-22 01:38:34', '2024-07-22 01:38:34', NULL),
(36, 'Class 6', 0, 10, NULL, NULL, 33, '2024-07-22 01:38:44', '2024-07-22 01:38:44', NULL),
(37, 'Form 1', 0, 10, NULL, NULL, 33, '2024-07-22 01:39:27', '2024-07-22 01:39:41', NULL),
(38, 'Form 2', 0, 10, NULL, NULL, 33, '2024-07-22 01:39:59', '2024-07-22 01:39:59', NULL),
(39, 'Form 3', 0, 10, NULL, NULL, 33, '2024-07-22 01:40:10', '2024-07-22 01:40:10', NULL),
(40, 'Form 4', 0, 10, NULL, NULL, 33, '2024-07-22 01:40:23', '2024-07-22 01:40:23', NULL),
(41, 'Form 5', 0, 10, NULL, NULL, 33, '2024-07-22 01:40:33', '2024-07-22 01:40:33', NULL),
(42, 'Lower Sixth', 0, 10, NULL, 4, 33, '2024-07-22 01:40:54', '2024-07-22 01:43:24', NULL),
(43, 'Upper Sixth', 0, 10, NULL, 4, 33, '2024-07-22 01:41:39', '2024-07-22 01:43:07', NULL),
(44, 'Lower Sixth', 0, 10, NULL, 5, 33, '2024-07-22 01:43:47', '2024-07-22 01:43:47', NULL),
(45, 'Upper Sixth', 0, 10, NULL, 5, 33, '2024-07-22 01:44:11', '2024-07-22 01:44:11', NULL),
(46, 'Class 1', 1, 14, NULL, NULL, 73, '2025-01-20 23:05:51', '2025-02-26 21:31:04', '2025-02-26 21:31:04'),
(47, '6eme', 1, 14, NULL, 12, 73, '2025-02-26 20:23:23', '2025-03-18 00:49:05', NULL),
(48, '5eme', 1, 14, NULL, 12, 73, '2025-02-26 20:25:31', '2025-03-18 00:48:39', NULL),
(49, '4eme ALL', 1, 14, NULL, 12, 73, '2025-02-26 20:26:01', '2025-03-18 00:48:14', NULL),
(50, '4eme ESP', 1, 14, NULL, 12, 73, '2025-02-26 20:26:22', '2025-03-18 00:46:54', NULL),
(51, '3eme', 1, 14, NULL, 11, 73, '2025-02-26 21:32:59', '2025-03-18 00:46:15', NULL),
(52, 'Seconde C', 1, 14, NULL, 10, 73, '2025-03-18 00:36:13', '2025-03-18 00:36:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `medium_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `medium_id`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, '2024-06-16 21:14:28', '2024-06-16 21:14:28', NULL),
(2, 2, 2, 2, 2, '2024-06-17 23:52:25', '2024-06-17 23:52:25', NULL),
(3, 3, 3, 3, 4, '2024-06-18 05:59:13', '2024-06-18 05:59:13', NULL),
(4, 4, 3, 3, 4, '2024-06-18 22:15:00', '2024-06-18 22:15:00', NULL),
(5, 5, 5, 4, 26, '2024-06-24 07:56:16', '2024-06-24 21:56:48', '2024-06-24 21:56:48'),
(6, 5, 6, 4, 26, '2024-06-24 07:56:16', '2024-06-24 21:56:48', '2024-06-24 21:56:48'),
(7, 6, 5, 4, 26, '2024-06-24 21:56:39', '2024-06-24 21:56:39', NULL),
(8, 6, 6, 4, 26, '2024-06-24 21:56:39', '2024-06-24 21:56:39', NULL),
(9, 7, 5, 4, 26, '2024-06-24 21:57:31', '2024-06-24 21:57:31', NULL),
(10, 7, 6, 4, 26, '2024-06-24 21:57:31', '2024-06-24 21:57:31', NULL),
(11, 8, 5, 4, 26, '2024-06-24 21:57:44', '2024-06-24 21:57:44', NULL),
(12, 8, 6, 4, 26, '2024-06-24 21:57:44', '2024-06-24 21:57:44', NULL),
(13, 9, 7, 6, 29, '2024-06-25 18:10:47', '2024-06-25 18:10:47', NULL),
(14, 10, 8, 7, 31, '2024-06-26 02:54:36', '2024-06-26 02:54:36', NULL),
(15, 11, 9, 8, 32, '2024-06-27 01:10:07', '2024-06-27 01:10:07', NULL),
(16, 12, 9, 8, 32, '2024-06-27 01:10:29', '2024-06-27 01:10:29', NULL),
(17, 13, 9, 8, 32, '2024-06-27 01:10:45', '2024-06-27 01:10:45', NULL),
(18, 14, 10, 8, 32, '2024-06-27 01:11:02', '2024-06-27 01:11:02', NULL),
(19, 15, 10, 8, 32, '2024-06-27 01:11:19', '2024-06-27 01:11:19', NULL),
(20, 16, 10, 8, 32, '2024-06-27 01:11:36', '2024-06-27 01:11:36', NULL),
(21, 17, 10, 8, 32, '2024-06-27 01:12:12', '2024-06-27 01:12:12', NULL),
(22, 18, 10, 8, 32, '2024-06-27 01:12:30', '2024-06-27 01:12:30', NULL),
(23, 19, 10, 8, 32, '2024-06-27 01:12:50', '2024-06-27 01:12:50', NULL),
(24, 20, 9, 9, 32, '2024-06-27 01:13:59', '2024-06-27 01:13:59', NULL),
(25, 21, 9, 9, 32, '2024-06-27 01:14:39', '2024-06-27 01:14:39', NULL),
(26, 22, 9, 9, 32, '2024-06-27 01:14:50', '2024-06-27 01:14:50', NULL),
(27, 23, 10, 9, 32, '2024-06-27 01:15:38', '2024-06-27 01:15:38', NULL),
(28, 24, 10, 9, 32, '2024-06-27 01:15:55', '2024-06-27 01:15:55', NULL),
(29, 25, 10, 9, 32, '2024-06-27 01:16:35', '2024-06-27 01:16:35', NULL),
(30, 26, 10, 9, 32, '2024-06-27 01:16:46', '2024-06-27 01:16:46', NULL),
(31, 27, 10, 9, 32, '2024-06-27 01:17:01', '2024-06-27 01:17:01', NULL),
(32, 28, 10, 9, 32, '2024-06-27 01:17:12', '2024-06-27 01:17:12', NULL),
(33, 29, 11, 10, 33, '2024-07-01 18:37:23', '2024-07-01 18:37:23', NULL),
(34, 30, 14, 12, 36, '2024-07-04 18:00:15', '2024-07-04 18:00:15', NULL),
(35, 31, 13, 12, 36, '2024-07-04 18:01:21', '2024-07-04 18:01:21', NULL),
(36, 31, 14, 12, 36, '2024-07-04 18:01:21', '2024-07-04 18:01:21', NULL),
(37, 31, 15, 12, 36, '2024-07-04 18:01:21', '2024-07-04 18:01:21', NULL),
(38, 32, 11, 10, 33, '2024-07-22 01:37:48', '2024-07-22 01:37:48', NULL),
(39, 33, 11, 10, 33, '2024-07-22 01:37:56', '2024-07-22 01:37:56', NULL),
(40, 34, 11, 10, 33, '2024-07-22 01:38:19', '2024-07-22 01:38:19', NULL),
(41, 35, 11, 10, 33, '2024-07-22 01:38:34', '2024-07-22 01:38:34', NULL),
(42, 36, 11, 10, 33, '2024-07-22 01:38:44', '2024-07-22 01:38:44', NULL),
(43, 37, 16, 10, 33, '2024-07-22 01:39:27', '2024-07-22 01:39:27', NULL),
(44, 38, 16, 10, 33, '2024-07-22 01:39:59', '2024-07-22 01:39:59', NULL),
(45, 39, 16, 10, 33, '2024-07-22 01:40:10', '2024-07-22 01:40:10', NULL),
(46, 40, 16, 10, 33, '2024-07-22 01:40:23', '2024-07-22 01:40:23', NULL),
(47, 41, 16, 10, 33, '2024-07-22 01:40:33', '2024-07-22 01:40:33', NULL),
(48, 42, 17, 10, 33, '2024-07-22 01:40:54', '2024-07-22 01:40:54', NULL),
(49, 43, 17, 10, 33, '2024-07-22 01:41:40', '2024-07-22 01:41:40', NULL),
(50, 44, 17, 10, 33, '2024-07-22 01:43:47', '2024-07-22 01:43:47', NULL),
(51, 45, 17, 10, 33, '2024-07-22 01:44:11', '2024-07-22 01:44:11', NULL),
(53, 47, 21, 14, 73, '2025-02-26 20:23:23', '2025-02-26 20:23:23', NULL),
(54, 48, 21, 14, 73, '2025-02-26 20:25:31', '2025-02-26 20:25:31', NULL),
(55, 49, 21, 14, 73, '2025-02-26 20:26:01', '2025-02-26 20:26:01', NULL),
(56, 50, 21, 14, 73, '2025-02-26 20:26:22', '2025-02-26 20:26:22', NULL),
(57, 51, 21, 14, 73, '2025-02-26 21:32:59', '2025-02-26 21:32:59', NULL),
(58, 52, 21, 14, 73, '2025-03-18 00:36:13', '2025-03-18 00:36:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Compulsory / Elective',
  `elective_subject_group_id` bigint UNSIGNED DEFAULT NULL COMMENT 'if type=Elective',
  `semester_id` bigint UNSIGNED DEFAULT NULL,
  `virtual_semester_id` int GENERATED ALWAYS AS ((case when (`semester_id` is not null) then `semester_id` else 0 end)) VIRTUAL,
  `school_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`id`, `class_id`, `subject_id`, `type`, `elective_subject_group_id`, `semester_id`, `school_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'Compulsory', NULL, NULL, 4, NULL, '2024-06-18 22:20:31', '2024-06-18 22:20:31'),
(3, 3, 2, 'Compulsory', NULL, 1, 4, NULL, '2024-06-19 00:00:11', '2024-06-19 00:21:51'),
(4, 3, 1, 'Compulsory', NULL, 1, 4, NULL, '2024-06-19 00:21:51', '2024-06-19 00:21:51'),
(5, 6, 3, 'Compulsory', NULL, NULL, 26, NULL, '2024-06-24 22:00:00', '2024-06-24 22:00:00'),
(6, 6, 4, 'Compulsory', NULL, NULL, 26, NULL, '2024-06-24 22:00:00', '2024-06-24 22:00:00'),
(7, 7, 3, 'Compulsory', NULL, NULL, 26, NULL, '2024-06-24 22:00:18', '2024-06-24 22:00:18'),
(8, 7, 4, 'Compulsory', NULL, NULL, 26, NULL, '2024-06-24 22:00:18', '2024-06-24 22:00:18'),
(9, 8, 3, 'Compulsory', NULL, NULL, 26, NULL, '2024-06-24 22:18:53', '2024-06-24 22:18:53'),
(10, 9, 7, 'Compulsory', NULL, NULL, 29, NULL, '2024-06-27 20:13:00', '2024-06-27 20:23:39'),
(11, 9, 8, 'Compulsory', NULL, NULL, 29, NULL, '2024-06-27 20:23:39', '2024-06-27 20:23:39'),
(12, 9, 9, 'Compulsory', NULL, NULL, 29, NULL, '2024-06-27 20:23:39', '2024-06-27 20:23:39'),
(13, 37, 10, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:11:36', '2024-07-22 07:11:36'),
(14, 37, 11, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:11:36', '2024-07-22 07:11:36'),
(15, 37, 15, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:11:36', '2024-07-22 07:11:36'),
(16, 37, 16, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:11:36', '2024-07-22 07:11:36'),
(17, 38, 10, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:00', '2024-07-22 07:12:00'),
(18, 38, 11, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:00', '2024-07-22 07:12:00'),
(19, 38, 15, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:00', '2024-07-22 07:12:00'),
(20, 38, 16, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:00', '2024-07-22 07:12:00'),
(21, 39, 10, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:23', '2024-07-22 07:12:23'),
(22, 39, 11, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:23', '2024-07-22 07:12:23'),
(23, 39, 15, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:23', '2024-07-22 07:12:23'),
(24, 39, 16, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:12:23', '2024-07-22 07:12:23'),
(25, 40, 11, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:14:07', '2024-07-22 07:14:07'),
(26, 40, 16, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:14:07', '2024-07-22 07:14:07'),
(27, 40, 10, 'Elective', 1, NULL, 33, NULL, '2024-07-22 07:14:07', '2024-07-22 07:14:07'),
(28, 40, 15, 'Elective', 1, NULL, 33, NULL, '2024-07-22 07:14:07', '2024-07-22 07:14:07'),
(29, 45, 16, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:24:29', '2024-07-22 07:24:29'),
(30, 45, 11, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:24:29', '2024-07-22 07:24:29'),
(31, 45, 10, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:24:44', '2024-07-22 07:24:44'),
(32, 45, 15, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:24:44', '2024-07-22 07:24:44'),
(33, 44, 10, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:25:03', '2024-07-22 07:25:03'),
(34, 44, 15, 'Compulsory', NULL, NULL, 33, NULL, '2024-07-22 07:25:03', '2024-07-22 07:25:03'),
(48, 52, 20, 'Compulsory', NULL, 13, 73, NULL, '2025-03-18 00:43:24', '2025-03-18 00:43:24'),
(49, 52, 21, 'Compulsory', NULL, 13, 73, NULL, '2025-03-18 00:43:24', '2025-03-18 00:43:24'),
(50, 52, 22, 'Compulsory', NULL, 13, 73, NULL, '2025-03-18 00:43:24', '2025-03-18 00:43:24'),
(51, 52, 17, 'Elective', 3, 13, 73, NULL, '2025-03-18 00:43:24', '2025-03-18 00:43:24'),
(52, 52, 18, 'Elective', 3, 13, 73, NULL, '2025-03-18 00:43:24', '2025-03-18 00:43:24'),
(53, 52, 19, 'Elective', 3, 13, 73, NULL, '2025-03-18 00:43:24', '2025-03-18 00:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `class_teachers`
--

CREATE TABLE `class_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_teachers`
--

INSERT INTO `class_teachers` (`id`, `class_section_id`, `teacher_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 4, 22, 4, '2024-06-18 23:45:51', '2024-06-18 23:45:51'),
(4, 3, 23, 4, '2024-06-19 00:01:02', '2024-06-19 00:01:02'),
(5, 12, 46, 26, '2024-06-24 22:20:37', '2024-06-24 22:20:37'),
(6, 11, 46, 26, '2024-06-24 22:21:36', '2024-06-24 22:21:36'),
(7, 10, 46, 26, '2024-06-24 22:21:54', '2024-06-24 22:21:54'),
(8, 9, 46, 26, '2024-06-24 22:22:17', '2024-06-24 22:22:17'),
(9, 8, 46, 26, '2024-06-24 22:22:31', '2024-06-24 22:22:31'),
(10, 7, 46, 26, '2024-06-24 22:22:43', '2024-06-24 22:22:43'),
(11, 43, 119, 33, '2024-07-22 07:17:09', '2024-07-22 07:17:09'),
(12, 44, 119, 33, '2024-07-22 07:17:34', '2024-07-22 07:17:34'),
(13, 45, 119, 33, '2024-07-22 07:18:31', '2024-07-22 07:18:31'),
(14, 53, 171, 73, '2025-02-26 21:24:41', '2025-02-26 21:24:41'),
(15, 53, 172, 73, '2025-02-26 21:24:41', '2025-02-26 21:24:41'),
(16, 53, 173, 73, '2025-02-26 21:24:41', '2025-02-26 21:24:41'),
(17, 54, 171, 73, '2025-02-26 21:26:53', '2025-02-26 21:26:53'),
(18, 54, 172, 73, '2025-02-26 21:26:53', '2025-02-26 21:26:53'),
(19, 54, 173, 73, '2025-02-26 21:26:53', '2025-02-26 21:26:53'),
(20, 57, 171, 73, '2025-02-26 21:43:13', '2025-02-26 21:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `compulsory_fees`
--

CREATE TABLE `compulsory_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `payment_transaction_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('Full Payment','Installment Payment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `installment_id` bigint UNSIGNED DEFAULT NULL,
  `mode` enum('Cash','Cheque','Online') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `due_charges` double(8,2) DEFAULT NULL,
  `fees_paid_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('Success','Pending','Failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compulsory_fees`
--

INSERT INTO `compulsory_fees` (`id`, `student_id`, `payment_transaction_id`, `type`, `installment_id`, `mode`, `cheque_no`, `amount`, `due_charges`, `fees_paid_id`, `status`, `date`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 84, NULL, 'Full Payment', NULL, 'Cash', NULL, 100000.00, NULL, 1, 'Success', '2024-06-25', 26, '2024-06-25 20:34:33', '2024-06-25 20:34:33', NULL),
(2, 86, NULL, 'Full Payment', NULL, 'Cheque', '2384883', 100000.00, NULL, 2, 'Success', '2024-06-25', 26, '2024-06-25 20:45:07', '2024-06-25 20:45:07', NULL),
(3, 122, NULL, 'Full Payment', NULL, 'Cash', NULL, 500000.00, NULL, 3, 'Success', '2024-07-21', 33, '2024-07-22 07:54:51', '2024-07-22 07:54:51', NULL),
(4, 121, NULL, 'Installment Payment', 3, 'Cheque', '4859394503', 250000.00, 0.00, 4, 'Success', '2024-07-21', 33, '2024-07-22 07:58:49', '2024-07-22 07:58:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elective_subject_groups`
--

CREATE TABLE `elective_subject_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `total_subjects` int NOT NULL,
  `total_selectable_subjects` int NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `semester_id` bigint UNSIGNED DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elective_subject_groups`
--

INSERT INTO `elective_subject_groups` (`id`, `total_subjects`, `total_selectable_subjects`, `class_id`, `semester_id`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 40, NULL, 33, '2024-07-22 07:14:07', '2024-07-22 07:14:07', NULL),
(3, 3, 2, 52, 13, 73, '2025-03-18 00:43:24', '2025-03-18 00:43:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `publish` tinyint NOT NULL DEFAULT '0',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `name`, `description`, `class_id`, `session_year_id`, `start_date`, `end_date`, `publish`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1st Term', '1st term examinations are going to held.', 9, 34, '2024-06-30', '2024-06-30', 0, 29, '2024-06-28 17:05:34', '2024-06-28 17:08:08', NULL),
(2, 'Chemistry', NULL, 37, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(3, 'Chemistry', NULL, 38, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(4, 'Chemistry', NULL, 39, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(5, 'Chemistry', NULL, 40, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(6, 'Chemistry', NULL, 41, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(7, 'Chemistry', NULL, 44, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(8, 'Chemistry', NULL, 45, 40, NULL, NULL, 0, 33, '2024-07-22 06:54:50', '2024-07-22 06:54:50', NULL),
(9, 'Biology', NULL, 37, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(10, 'Biology', NULL, 38, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(11, 'Biology', NULL, 39, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(12, 'Biology', NULL, 40, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(13, 'Biology', NULL, 41, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(14, 'Biology', NULL, 44, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(15, 'Biology', NULL, 45, 40, NULL, NULL, 0, 33, '2024-07-22 06:55:40', '2024-07-22 06:55:40', NULL),
(16, 'English Literature', NULL, 37, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(17, 'English Literature', NULL, 38, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(18, 'English Literature', NULL, 39, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(19, 'English Literature', NULL, 40, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(20, 'English Literature', NULL, 41, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(21, 'English Literature', NULL, 42, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(22, 'English Literature', NULL, 43, 40, NULL, NULL, 0, 33, '2024-07-22 06:56:18', '2024-07-22 06:56:18', NULL),
(23, 'sequence 1', NULL, 47, 83, NULL, NULL, 0, 73, '2025-03-18 01:03:33', '2025-03-18 01:03:33', NULL),
(24, 'sequence 1', NULL, 48, 83, NULL, NULL, 0, 73, '2025-03-18 01:03:33', '2025-03-18 01:03:33', NULL),
(25, 'sequence 1', NULL, 49, 83, NULL, NULL, 0, 73, '2025-03-18 01:03:33', '2025-03-18 01:03:33', NULL),
(26, 'sequence 1', NULL, 50, 83, NULL, NULL, 0, 73, '2025-03-18 01:03:33', '2025-03-18 01:03:33', NULL),
(27, 'sequence 1', NULL, 51, 83, NULL, NULL, 0, 73, '2025-03-18 01:03:33', '2025-03-18 01:03:33', NULL),
(28, 'sequence 1', NULL, 52, 83, NULL, NULL, 0, 73, '2025-03-18 01:03:33', '2025-03-18 01:03:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_timetable_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `obtained_marks` double(8,2) NOT NULL,
  `teacher_review` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_status` tinyint(1) NOT NULL COMMENT '1=Pass, 0=Fail',
  `session_year_id` bigint UNSIGNED NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `total_marks` int NOT NULL,
  `obtained_marks` double(8,2) NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetables`
--

CREATE TABLE `exam_timetables` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `total_marks` double(8,2) NOT NULL,
  `passing_marks` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_timetables`
--

INSERT INTO `exam_timetables` (`id`, `exam_id`, `class_subject_id`, `total_marks`, `passing_marks`, `date`, `start_time`, `end_time`, `session_year_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 1100.00, 600.00, '2024-06-30', '12:37:00', '15:37:00', 34, 29, '2024-06-28 17:08:08', '2024-06-28 17:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` bigint UNSIGNED DEFAULT NULL,
  `basic_salary` bigint NOT NULL DEFAULT '0',
  `paid_leaves` double(8,2) NOT NULL DEFAULT '0.00',
  `month` bigint DEFAULT NULL,
  `year` int DEFAULT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `ref_no`, `staff_id`, `basic_salary`, `paid_leaves`, `month`, `year`, `title`, `description`, `amount`, `date`, `school_id`, `session_year_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 5, 1000, 0.00, 6, 2024, 'June - 2024', 'Salary', 100000.00, '2024-06-30', 26, 28, '2024-06-26 01:31:35', '2024-06-26 01:31:35'),
(2, NULL, NULL, 4, 100, 0.00, 6, 2024, 'June - 2024', 'Salary', 0.00, '2024-06-30', 26, 28, '2024-06-26 01:31:35', '2024-06-26 01:47:16'),
(4, NULL, NULL, 12, 300000, 0.00, 10, 2024, 'October - 2024', 'Salary', 0.00, '2024-09-30', 33, 40, '2024-08-22 22:39:54', '2024-08-22 22:39:54'),
(5, NULL, NULL, 11, 150000, 0.00, 10, 2024, 'October - 2024', 'Salary', 0.00, '2024-09-30', 33, 40, '2024-08-22 22:39:54', '2024-08-22 22:39:54'),
(6, NULL, NULL, 12, 300000, 0.00, 9, 2024, 'September - 2024', 'Salary', 300000.00, '2024-09-30', 33, 40, '2024-08-22 22:40:31', '2024-08-22 22:40:31'),
(7, NULL, NULL, 11, 150000, 0.00, 9, 2024, 'September - 2024', 'Salary', 0.00, '2024-09-30', 33, 40, '2024-08-22 22:40:31', '2024-08-22 22:40:31'),
(8, NULL, NULL, 12, 300000, 0.00, 9, 2025, 'September - 2025', 'Salary', 999999.99, '2025-09-30', 33, 40, '2025-01-20 20:26:58', '2025-01-20 20:26:58'),
(9, NULL, NULL, 11, 150000, 0.00, 9, 2025, 'September - 2025', 'Salary', 0.00, '2025-09-30', 33, 40, '2025-01-20 20:26:58', '2025-01-20 20:26:58'),
(10, NULL, NULL, 12, 300000, 0.00, 10, 2025, 'October - 2025', 'Salary', 0.00, '2025-10-31', 33, 40, '2025-01-20 20:27:44', '2025-01-20 20:27:44'),
(11, NULL, NULL, 11, 0, 0.00, 10, 2025, 'October - 2025', 'Salary', 0.00, '2025-10-31', 33, 40, '2025-01-20 20:27:44', '2025-01-20 20:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `description`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Field Trip', NULL, 33, '2024-07-22 03:47:13', '2024-07-22 03:47:13', NULL),
(2, 'Food', NULL, 33, '2024-07-22 03:47:30', '2024-07-22 03:47:30', NULL),
(3, 'Electricity', NULL, 33, '2024-07-22 03:47:46', '2024-07-22 03:47:46', NULL),
(4, 'Water', NULL, 33, '2024-07-22 03:47:51', '2024-07-22 03:47:51', NULL),
(5, 'Bus Maintenance', NULL, 33, '2024-07-22 03:48:04', '2024-07-22 03:48:04', NULL),
(6, 'Fuel', NULL, 33, '2024-07-22 03:48:08', '2024-07-22 03:48:08', NULL),
(7, 'School Supplies', NULL, 33, '2024-07-22 03:48:37', '2024-07-22 03:48:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extra_student_datas`
--

CREATE TABLE `extra_student_datas` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `form_field_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'What is Taaply SALMS?', 'Taaply SALMS (School and Learning Management System) is a comprehensive platform designed to manage, track, and enhance the educational experience for both educators and students. It integrates various functionalities such as attendance, grading, assignments, and communication into a single, easy-to-use system.', '2024-06-15 18:49:31', '2024-06-15 18:49:31'),
(2, 'Who can use Taaply SALMS?', 'Taaply SALMS is suitable for K-12 schools, colleges, universities, and other educational institutions. It can be used by administrators, teachers, students, and parents.', '2024-06-15 18:49:56', '2024-06-15 18:49:56'),
(3, 'What features does Taaply SALMS offer?', 'Taaply SALMS offers a wide range of features, including:\r\n\r\nAttendance tracking\r\nGradebook and report cards\r\nAssignment creation and submission\r\nCommunication tools (messaging, announcements)\r\nCalendar and scheduling\r\nStudent and teacher profiles\r\nLearning materials and resources management', '2024-06-15 18:50:20', '2024-06-15 18:50:20'),
(4, 'Can Taaply SALMS be integrated with other systems?', 'Yes, Taaply SALMS supports integration with various other systems, including student information systems (SIS), content management systems (CMS), and third-party educational tools.', '2024-06-15 18:50:42', '2024-06-15 18:50:42'),
(5, 'How does Taaply SALMS handle attendance?', 'Taaply SALMS includes an attendance tracking feature that allows teachers to mark attendance electronically. It can also generate attendance reports and notify parents about their child\'s attendance status.', '2024-06-15 18:50:57', '2024-06-15 18:50:57'),
(6, 'Can the Taaply student card be used for attendance?', 'Yes, the Taaply student card can function as an attendance badge for students, allowing for easy and efficient attendance tracking when scanned.', '2024-06-15 18:51:21', '2024-06-15 18:51:48'),
(7, 'How are assignments managed in Taaply SALMS?', 'Teachers can create, distribute, and manage assignments through the platform. Students can submit their work electronically, and teachers can provide feedback and grades within the system.', '2024-06-15 18:52:09', '2024-06-15 18:52:09'),
(8, 'How is grading handled?', 'Taaply SALMS includes a robust gradebook feature where teachers can input and manage grades. It also allows for the generation of report cards and progress reports.', '2024-06-15 18:52:24', '2024-06-15 18:52:24'),
(9, 'What communication tools are available in Taaply SALMS?', 'The platform includes messaging, announcements, and discussion forums to facilitate communication between teachers, students, and parents.', '2024-06-15 18:52:43', '2024-06-15 18:52:43'),
(10, 'Can parents access Taaply SALMS?', 'Yes, parents can have access to certain features of Taaply SALMS, such as their child\'s attendance records, grades, and school announcements, depending on the permissions set by the school.', '2024-06-15 18:52:57', '2024-06-15 18:52:57'),
(11, 'How secure is Taaply SALMS?', 'Taaply SALMS employs advanced security measures to protect user data, including encryption, secure user authentication, and regular security audits.', '2024-06-15 18:53:15', '2024-06-15 18:53:15'),
(12, 'What measures are in place to ensure student privacy?', 'Taaply SALMS complies with all relevant privacy laws and regulations, ensuring that student data is handled with the utmost care and confidentiality.', '2024-06-15 18:53:30', '2024-06-15 18:53:30'),
(13, 'What kind of support is available for Taaply SALMS users?', 'Taaply provides comprehensive support for SALMS users, including online resources, tutorials, and a dedicated support team to assist with any issues or questions.', '2024-06-15 18:53:50', '2024-06-15 18:53:50'),
(14, 'Is training available for new users?', 'Yes, Taaply offers training programs for administrators, teachers, and other users to help them get the most out of the SALMS platform.', '2024-06-15 18:54:11', '2024-06-15 18:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Student Management', 1, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(2, 'Academics Management', 1, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(3, 'Slider Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(4, 'Teacher Management', 1, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(5, 'Session Year Management', 1, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(6, 'Holiday Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(7, 'Timetable Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(8, 'Attendance Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(9, 'Exam Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(10, 'Lesson Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(11, 'Assignment Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(12, 'Announcement Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(13, 'Staff Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(14, 'Expense Management', 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(15, 'Staff Leave Management', 0, '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(16, 'Fees Management', 0, '2024-02-16 01:56:33', '2024-02-16 01:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `due_charges` double(8,2) NOT NULL COMMENT 'in percentage (%)',
  `class_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `name`, `due_date`, `due_charges`, `class_id`, `school_id`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Class Name - Class 1 - English', '2025-03-05', 5.00, 6, 26, 28, '2024-06-25 20:27:51', '2024-06-25 20:32:33', NULL),
(2, 'Class Name - Class 2 - English', '2024-07-01', 5.00, 7, 26, 28, '2024-06-25 20:27:51', '2024-06-25 20:27:51', NULL),
(3, 'Class Name - Class 3 - English', '2024-07-01', 5.00, 8, 26, 28, '2024-06-25 20:27:51', '2024-06-25 20:27:51', NULL),
(4, 'Class 1 - English', '2024-09-30', 10.00, 29, 33, 40, '2024-07-22 03:51:40', '2024-07-22 03:51:40', NULL),
(5, 'Class 2 - English', '2024-09-30', 10.00, 32, 33, 40, '2024-07-22 03:51:40', '2024-07-22 03:51:40', NULL),
(6, 'Class 3 - English', '2024-09-30', 10.00, 33, 33, 40, '2024-07-22 03:51:40', '2024-07-22 03:51:40', NULL),
(7, 'Class 4 - English', '2024-09-30', 10.00, 34, 33, 40, '2024-07-22 03:51:40', '2024-07-22 03:51:40', NULL),
(8, 'Class 5 - English', '2024-09-30', 10.00, 35, 33, 40, '2024-07-22 03:51:40', '2024-07-22 03:51:40', NULL),
(9, 'Class 6 - English', '2024-09-30', 10.00, 36, 33, 40, '2024-07-22 03:51:40', '2024-07-22 03:51:40', NULL),
(10, 'Form 1 - English', '2024-10-30', 15.00, 37, 33, 40, '2024-07-22 03:55:04', '2024-07-22 03:55:04', NULL),
(11, 'Form 2 - English', '2024-10-30', 15.00, 38, 33, 40, '2024-07-22 03:55:04', '2024-07-22 03:55:04', NULL),
(12, 'Form 3 - English', '2024-10-30', 15.00, 39, 33, 40, '2024-07-22 03:55:04', '2024-07-22 03:55:04', NULL),
(13, 'Form 4 - English', '2024-10-30', 15.00, 40, 33, 40, '2024-07-22 03:55:04', '2024-07-22 03:55:04', NULL),
(14, 'Form 5 - English', '2024-10-30', 15.00, 41, 33, 40, '2024-07-22 03:55:04', '2024-07-22 03:55:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fees_advance`
--

CREATE TABLE `fees_advance` (
  `id` bigint UNSIGNED NOT NULL,
  `compulsory_fee_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `parent_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_class_types`
--

CREATE TABLE `fees_class_types` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `fees_id` bigint UNSIGNED NOT NULL,
  `fees_type_id` bigint UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `optional` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_class_types`
--

INSERT INTO `fees_class_types` (`id`, `class_id`, `fees_id`, `fees_type_id`, `amount`, `optional`, `school_id`, `created_at`, `updated_at`) VALUES
(3, 8, 3, 2, 100000.00, 0, 26, '2024-06-25 20:29:10', '2024-06-25 20:29:20'),
(4, 7, 2, 2, 100000.00, 0, 26, '2024-06-25 20:29:54', '2024-06-25 20:29:54'),
(5, 6, 1, 2, 100000.00, 0, 26, '2024-06-25 20:32:33', '2024-06-25 20:32:33'),
(6, 29, 4, 3, 150000.00, 0, 33, '2024-07-22 03:51:40', '2024-07-22 03:51:40'),
(7, 32, 5, 3, 150000.00, 0, 33, '2024-07-22 03:51:40', '2024-07-22 03:51:40'),
(8, 33, 6, 3, 150000.00, 0, 33, '2024-07-22 03:51:40', '2024-07-22 03:51:40'),
(9, 34, 7, 3, 150000.00, 0, 33, '2024-07-22 03:51:40', '2024-07-22 03:51:40'),
(10, 35, 8, 3, 150000.00, 0, 33, '2024-07-22 03:51:40', '2024-07-22 03:51:40'),
(11, 36, 9, 3, 150000.00, 0, 33, '2024-07-22 03:51:40', '2024-07-22 03:51:40'),
(12, 37, 10, 3, 300000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(13, 37, 10, 4, 100000.00, 1, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(14, 37, 10, 5, 200000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(15, 38, 11, 3, 300000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(16, 38, 11, 4, 100000.00, 1, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(17, 38, 11, 5, 200000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(18, 39, 12, 3, 300000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(19, 39, 12, 4, 100000.00, 1, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(20, 39, 12, 5, 200000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(21, 40, 13, 3, 300000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(22, 40, 13, 4, 100000.00, 1, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(23, 40, 13, 5, 200000.00, 0, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(24, 41, 14, 3, 300000.00, 0, 33, '2024-07-22 03:55:05', '2024-07-22 03:55:05'),
(25, 41, 14, 4, 100000.00, 1, 33, '2024-07-22 03:55:05', '2024-07-22 03:55:05'),
(26, 41, 14, 5, 200000.00, 0, 33, '2024-07-22 03:55:05', '2024-07-22 03:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `fees_installments`
--

CREATE TABLE `fees_installments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `due_charges` int NOT NULL COMMENT 'in percentage (%)',
  `fees_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_installments`
--

INSERT INTO `fees_installments` (`id`, `name`, `due_date`, `due_charges`, `fees_id`, `session_year_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'First Term', '2024-08-07', 5, 1, 28, 26, '2024-06-25 20:32:33', '2024-06-25 20:32:33'),
(2, 'Second Term', '2024-11-01', 5, 1, 28, 26, '2024-06-25 20:32:33', '2024-06-25 20:32:33'),
(3, 'First Term', '2024-09-15', 50, 10, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(4, 'Second Term', '2024-10-08', 50, 10, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(5, 'First Term', '2024-09-15', 50, 11, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(6, 'Second Term', '2024-10-08', 50, 11, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(7, 'First Term', '2024-09-15', 50, 12, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(8, 'Second Term', '2024-10-08', 50, 12, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(9, 'First Term', '2024-09-15', 50, 13, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(10, 'Second Term', '2024-10-08', 50, 13, 40, 33, '2024-07-22 03:55:04', '2024-07-22 03:55:04'),
(11, 'First Term', '2024-09-15', 50, 14, 40, 33, '2024-07-22 03:55:05', '2024-07-22 03:55:05'),
(12, 'Second Term', '2024-10-08', 50, 14, 40, 33, '2024-07-22 03:55:05', '2024-07-22 03:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `fees_paids`
--

CREATE TABLE `fees_paids` (
  `id` bigint UNSIGNED NOT NULL,
  `fees_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `is_fully_paid` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `is_used_installment` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `amount` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_paids`
--

INSERT INTO `fees_paids` (`id`, `fees_id`, `student_id`, `is_fully_paid`, `is_used_installment`, `amount`, `date`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 84, 1, 0, 100000.00, '2024-06-25', 26, '2024-06-25 20:34:33', '2024-06-25 20:34:33', NULL),
(2, 2, 86, 1, 0, 100000.00, '2024-06-25', 26, '2024-06-25 20:45:07', '2024-06-25 20:45:07', NULL),
(3, 10, 122, 1, 0, 500000.00, '2024-07-21', 33, '2024-07-22 07:54:51', '2024-07-22 07:54:51', NULL),
(4, 10, 121, 0, 1, 250000.00, '2024-07-21', 33, '2024-07-22 07:58:49', '2024-07-22 07:58:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fees_types`
--

CREATE TABLE `fees_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_types`
--

INSERT INTO `fees_types` (`id`, `name`, `description`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tuition', NULL, 27, '2024-06-25 20:24:43', '2024-06-25 20:24:43', NULL),
(2, 'Tuition', NULL, 26, '2024-06-25 20:26:29', '2024-06-25 20:26:29', NULL),
(3, 'Tuition', NULL, 33, '2024-07-22 03:49:04', '2024-07-22 03:49:04', NULL),
(4, 'Books', NULL, 33, '2024-07-22 03:49:20', '2024-07-22 03:49:20', NULL),
(5, 'Boarding', NULL, 33, '2024-07-22 03:49:31', '2024-07-22 03:49:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `modal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_thumbnail` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `modal_type`, `modal_id`, `file_name`, `file_thumbnail`, `type`, `file_url`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Models\\Assignment', 1, 'Ledger--2024-01-01-2024-12-31.pdf', NULL, '1', 'files/667e61422956c1.953082571719558466.pdf', 29, '2024-06-28 16:37:46', '2024-06-28 16:37:46', NULL),
(2, 'App\\Models\\Announcement', 1, 'school-study-learn-books.jpg', NULL, '1', 'files/667e654b42a7e6.416418301719559499.jpg', 29, '2024-06-28 16:54:59', '2024-06-28 16:54:59', NULL),
(3, 'App\\Models\\Lesson', 1, 'Design', NULL, '1', 'files/6696920fc5e333.392755551721143823.png', 29, '2024-07-17 01:00:23', '2024-07-17 01:00:23', NULL),
(4, 'App\\Models\\Lesson', 2, 'Geography Video', 'files/669e8d10e51ad4.066250251721666832.png', '2', 'https://www.youtube.com/watch?v=1uWI0h2QYh4', 33, '2024-07-23 02:17:13', '2024-07-23 02:17:13', NULL),
(5, 'App\\Models\\Lesson', 3, 'Form 1 Geo', 'files/669e914b740411.218105631721667915.png', '2', 'https://www.youtube.com/watch?v=hNVD8fyIsEI', 33, '2024-07-23 02:35:15', '2024-07-23 02:35:15', NULL),
(6, 'App\\Models\\LessonTopic', 1, 'Cameroon Geo', 'files/669e91eacea316.841821551721668074.png', '2', 'https://www.youtube.com/watch?v=n34vFIodRjg', 33, '2024-07-23 02:37:54', '2024-07-23 02:37:54', NULL),
(7, 'App\\Models\\Announcement', 4, 'Screenshot 2024-07-22 173949.png', NULL, '1', 'files/669e93f0780df0.858348871721668592.png', 33, '2024-07-23 02:46:32', '2024-07-23 02:46:32', NULL),
(8, 'App\\Models\\AssignmentSubmission', 1, 'ADVENTIST HEALTH INTERNATIONAL.docx', NULL, '1', 'files/669e9899a71725.684918801721669785.docx', 33, '2024-07-23 03:06:25', '2024-07-23 03:06:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'text,number,textarea,dropdown,checkbox,radio,fileupload',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `default_values` text COLLATE utf8mb4_unicode_ci COMMENT 'values of radio,checkbox,dropdown,etc',
  `other` text COLLATE utf8mb4_unicode_ci COMMENT 'extra HTML attributes',
  `school_id` bigint UNSIGNED NOT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_fields`
--

INSERT INTO `form_fields` (`id`, `name`, `type`, `is_required`, `default_values`, `other`, `school_id`, `rank`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Student Name', 'text', 1, NULL, NULL, 26, 1, '2024-06-25 20:58:05', '2024-06-25 21:00:55', '2024-06-25 21:00:55'),
(2, 'Student ID', 'number', 0, NULL, NULL, 26, 2, '2024-06-25 20:58:25', '2024-06-25 21:00:59', '2024-06-25 21:00:59'),
(3, 'test', 'file', 1, NULL, NULL, 73, 1, '2025-03-18 00:55:42', '2025-03-18 00:55:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint UNSIGNED NOT NULL,
  `starting_range` double(8,2) NOT NULL,
  `ending_range` double(8,2) NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `starting_range`, `ending_range`, `grade`, `school_id`, `created_at`, `updated_at`) VALUES
(2, 0.00, 49.90, 'F', 33, '2024-07-22 07:02:01', '2024-07-22 07:02:01'),
(3, 50.00, 65.00, 'C', 33, '2024-07-22 07:02:01', '2024-07-22 07:02:01'),
(4, 66.00, 80.00, 'B', 33, '2024-07-22 07:02:01', '2024-07-22 07:02:01'),
(5, 81.00, 100.00, 'A', 33, '2024-07-22 07:02:01', '2024-07-22 07:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `guidances`
--

CREATE TABLE `guidances` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `date`, `title`, `description`, `school_id`, `created_at`, `updated_at`) VALUES
(1, '2024-09-09', 'School Holiday', 'All public holidays for school so that attendance is set right', 26, '2024-06-24 23:10:33', '2024-06-25 21:18:12'),
(2, '2024-11-11', 'Labour Day', NULL, 33, '2024-07-22 03:58:06', '2024-07-22 03:58:06'),
(3, '2024-10-15', 'St Peter\'s Day', NULL, 33, '2024-07-22 07:48:29', '2024-07-22 07:48:29'),
(4, '2025-02-11', 'YOUTH DAY', NULL, 73, '2025-02-14 03:01:41', '2025-02-14 03:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>active',
  `is_rtl` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `file`, `status`, `is_rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'en.json', 1, 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(2, 'French', 'fr', 'fr.json', 0, 0, '2024-06-19 20:17:38', '2024-06-19 20:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0 => Pending, 1 => Approved, 2 => Rejected',
  `school_id` bigint UNSIGNED NOT NULL,
  `leave_master_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_details`
--

CREATE TABLE `leave_details` (
  `id` bigint UNSIGNED NOT NULL,
  `leave_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_masters`
--

CREATE TABLE `leave_masters` (
  `id` bigint UNSIGNED NOT NULL,
  `leaves` double(8,2) NOT NULL COMMENT 'Leaves per month',
  `holiday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_masters`
--

INSERT INTO `leave_masters` (`id`, `leaves`, `holiday`, `session_year_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 10.00, 'Sunday,Saturday', 28, 26, '2024-06-26 01:51:02', '2024-06-26 01:51:02');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `name`, `description`, `class_section_id`, `class_subject_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Lesson 1', 'Lorem Ispum', 13, 10, 29, '2024-07-17 01:00:23', '2024-07-17 01:00:23'),
(2, 'Understanding Geography', 'Know all about Geography', 45, 22, 33, '2024-07-23 02:17:12', '2024-07-23 02:17:12'),
(3, 'Introduction to Geography', '101 Geo', 43, 14, 33, '2024-07-23 02:35:15', '2024-07-23 02:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_topics`
--

CREATE TABLE `lesson_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_topics`
--

INSERT INTO `lesson_topics` (`id`, `lesson_id`, `name`, `description`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'Cameroon Geography', 'Learn about Cameroon', 33, '2024-07-23 02:37:54', '2024-07-23 02:37:54');

-- --------------------------------------------------------

--
-- Table structure for table `mediums`
--

CREATE TABLE `mediums` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mediums`
--

INSERT INTO `mediums` (`id`, `name`, `school_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Primary', 1, NULL, '2024-06-16 21:12:24', '2024-06-16 21:12:24'),
(2, 'English', 2, NULL, '2024-06-17 23:52:00', '2024-06-17 23:52:00'),
(3, 'Urdu', 4, NULL, '2024-06-18 05:58:54', '2024-06-18 05:58:54'),
(4, 'English', 26, NULL, '2024-06-24 07:49:44', '2024-06-24 07:49:44'),
(5, 'French', 26, NULL, '2024-06-24 07:50:38', '2024-06-24 07:50:38'),
(6, 'English', 29, NULL, '2024-06-25 18:10:22', '2024-06-25 18:10:22'),
(7, 'English', 31, NULL, '2024-06-26 02:48:11', '2024-06-26 02:48:11'),
(8, 'English', 32, NULL, '2024-06-27 00:54:14', '2024-06-27 00:54:14'),
(9, 'French', 32, NULL, '2024-06-27 00:54:19', '2024-06-27 00:54:19'),
(10, 'English', 33, NULL, '2024-07-01 18:15:03', '2024-07-01 18:15:03'),
(11, 'French', 33, NULL, '2024-07-01 18:15:08', '2024-07-01 18:15:08'),
(12, 'English', 36, NULL, '2024-07-04 16:14:23', '2024-07-04 16:14:23'),
(13, 'French', 36, NULL, '2024-07-04 17:05:41', '2024-07-04 17:05:41'),
(14, 'français', 73, NULL, '2025-01-20 23:00:36', '2025-02-14 19:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_01_091033_create_permission_tables', 1),
(6, '2022_04_01_105826_all_tables', 1),
(7, '2023_11_16_134449_version1-0-1', 1),
(8, '2023_12_07_120054_version1_1_0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(110, 'App\\Models\\User', 22),
(111, 'App\\Models\\User', 22),
(119, 'App\\Models\\User', 22),
(110, 'App\\Models\\User', 23),
(111, 'App\\Models\\User', 23),
(119, 'App\\Models\\User', 23),
(110, 'App\\Models\\User', 46),
(111, 'App\\Models\\User', 46),
(119, 'App\\Models\\User', 46),
(192, 'App\\Models\\User', 101),
(193, 'App\\Models\\User', 101),
(194, 'App\\Models\\User', 101),
(195, 'App\\Models\\User', 101),
(110, 'App\\Models\\User', 119),
(111, 'App\\Models\\User', 119),
(119, 'App\\Models\\User', 119),
(192, 'App\\Models\\User', 120),
(193, 'App\\Models\\User', 120),
(194, 'App\\Models\\User', 120),
(195, 'App\\Models\\User', 120),
(110, 'App\\Models\\User', 171),
(111, 'App\\Models\\User', 171),
(119, 'App\\Models\\User', 171),
(110, 'App\\Models\\User', 172),
(111, 'App\\Models\\User', 172),
(119, 'App\\Models\\User', 172),
(110, 'App\\Models\\User', 173),
(111, 'App\\Models\\User', 173),
(119, 'App\\Models\\User', 173);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 4),
(6, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 8),
(5, 'App\\Models\\User', 9),
(6, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 13),
(6, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 17),
(6, 'App\\Models\\User', 18),
(5, 'App\\Models\\User', 19),
(5, 'App\\Models\\User', 20),
(6, 'App\\Models\\User', 21),
(7, 'App\\Models\\User', 22),
(7, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 44),
(2, 'App\\Models\\User', 45),
(7, 'App\\Models\\User', 46),
(5, 'App\\Models\\User', 47),
(6, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 68),
(2, 'App\\Models\\User', 69),
(2, 'App\\Models\\User', 73),
(6, 'App\\Models\\User', 74),
(5, 'App\\Models\\User', 75),
(7, 'App\\Models\\User', 79),
(5, 'App\\Models\\User', 80),
(6, 'App\\Models\\User', 81),
(2, 'App\\Models\\User', 82),
(5, 'App\\Models\\User', 83),
(6, 'App\\Models\\User', 84),
(6, 'App\\Models\\User', 85),
(6, 'App\\Models\\User', 86),
(6, 'App\\Models\\User', 87),
(6, 'App\\Models\\User', 88),
(2, 'App\\Models\\User', 89),
(7, 'App\\Models\\User', 90),
(5, 'App\\Models\\User', 98),
(6, 'App\\Models\\User', 99),
(2, 'App\\Models\\User', 100),
(102, 'App\\Models\\User', 101),
(5, 'App\\Models\\User', 102),
(6, 'App\\Models\\User', 103),
(7, 'App\\Models\\User', 104),
(2, 'App\\Models\\User', 105),
(2, 'App\\Models\\User', 106),
(2, 'App\\Models\\User', 107),
(7, 'App\\Models\\User', 108),
(2, 'App\\Models\\User', 109),
(2, 'App\\Models\\User', 110),
(2, 'App\\Models\\User', 111),
(7, 'App\\Models\\User', 112),
(7, 'App\\Models\\User', 119),
(121, 'App\\Models\\User', 120),
(6, 'App\\Models\\User', 121),
(6, 'App\\Models\\User', 122),
(2, 'App\\Models\\User', 123),
(2, 'App\\Models\\User', 124),
(2, 'App\\Models\\User', 125),
(2, 'App\\Models\\User', 126),
(2, 'App\\Models\\User', 127),
(2, 'App\\Models\\User', 128),
(2, 'App\\Models\\User', 129),
(2, 'App\\Models\\User', 130),
(2, 'App\\Models\\User', 131),
(2, 'App\\Models\\User', 132),
(2, 'App\\Models\\User', 133),
(2, 'App\\Models\\User', 134),
(2, 'App\\Models\\User', 135),
(2, 'App\\Models\\User', 136),
(2, 'App\\Models\\User', 137),
(2, 'App\\Models\\User', 138),
(2, 'App\\Models\\User', 139),
(2, 'App\\Models\\User', 140),
(2, 'App\\Models\\User', 141),
(2, 'App\\Models\\User', 142),
(2, 'App\\Models\\User', 143),
(2, 'App\\Models\\User', 144),
(2, 'App\\Models\\User', 145),
(2, 'App\\Models\\User', 146),
(2, 'App\\Models\\User', 147),
(2, 'App\\Models\\User', 148),
(2, 'App\\Models\\User', 149),
(2, 'App\\Models\\User', 150),
(2, 'App\\Models\\User', 151),
(2, 'App\\Models\\User', 152),
(2, 'App\\Models\\User', 153),
(2, 'App\\Models\\User', 154),
(2, 'App\\Models\\User', 155),
(2, 'App\\Models\\User', 156),
(2, 'App\\Models\\User', 157),
(2, 'App\\Models\\User', 158),
(2, 'App\\Models\\User', 159),
(2, 'App\\Models\\User', 160),
(2, 'App\\Models\\User', 161),
(2, 'App\\Models\\User', 162),
(2, 'App\\Models\\User', 163),
(2, 'App\\Models\\User', 164),
(2, 'App\\Models\\User', 165),
(2, 'App\\Models\\User', 166),
(2, 'App\\Models\\User', 167),
(2, 'App\\Models\\User', 168),
(2, 'App\\Models\\User', 169),
(2, 'App\\Models\\User', 170),
(7, 'App\\Models\\User', 171),
(7, 'App\\Models\\User', 172),
(7, 'App\\Models\\User', 173),
(5, 'App\\Models\\User', 174),
(6, 'App\\Models\\User', 175),
(5, 'App\\Models\\User', 176),
(6, 'App\\Models\\User', 177),
(5, 'App\\Models\\User', 178),
(6, 'App\\Models\\User', 179),
(5, 'App\\Models\\User', 180),
(6, 'App\\Models\\User', 181),
(2, 'App\\Models\\User', 182),
(2, 'App\\Models\\User', 183),
(2, 'App\\Models\\User', 184),
(2, 'App\\Models\\User', 185),
(7, 'App\\Models\\User', 186),
(7, 'App\\Models\\User', 187),
(7, 'App\\Models\\User', 188),
(7, 'App\\Models\\User', 189),
(7, 'App\\Models\\User', 190),
(7, 'App\\Models\\User', 191),
(7, 'App\\Models\\User', 192),
(7, 'App\\Models\\User', 193),
(7, 'App\\Models\\User', 194),
(7, 'App\\Models\\User', 195),
(2, 'App\\Models\\User', 196),
(2, 'App\\Models\\User', 197),
(2, 'App\\Models\\User', 198),
(2, 'App\\Models\\User', 199),
(2, 'App\\Models\\User', 200),
(7, 'App\\Models\\User', 201),
(7, 'App\\Models\\User', 202),
(7, 'App\\Models\\User', 203),
(7, 'App\\Models\\User', 204),
(7, 'App\\Models\\User', 205),
(7, 'App\\Models\\User', 206),
(7, 'App\\Models\\User', 207),
(7, 'App\\Models\\User', 208),
(7, 'App\\Models\\User', 209),
(7, 'App\\Models\\User', 210),
(7, 'App\\Models\\User', 211),
(7, 'App\\Models\\User', 212),
(7, 'App\\Models\\User', 213),
(7, 'App\\Models\\User', 214),
(7, 'App\\Models\\User', 215),
(2, 'App\\Models\\User', 216),
(6, 'App\\Models\\User', 217),
(6, 'App\\Models\\User', 218),
(6, 'App\\Models\\User', 219),
(6, 'App\\Models\\User', 220),
(6, 'App\\Models\\User', 221),
(6, 'App\\Models\\User', 222);

-- --------------------------------------------------------

--
-- Table structure for table `online_exams`
--

CREATE TABLE `online_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_key` bigint NOT NULL,
  `duration` int NOT NULL COMMENT 'in minutes',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_exams`
--

INSERT INTO `online_exams` (`id`, `class_section_id`, `class_subject_id`, `title`, `exam_key`, `duration`, `start_date`, `end_date`, `session_year_id`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 10, 'Math Exam', 123, 2, '2024-06-28 12:20:00', '2024-06-30 12:21:00', 34, 29, '2024-06-28 16:51:22', '2024-06-28 16:53:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_questions`
--

CREATE TABLE `online_exam_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `question` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `last_edited_by` bigint UNSIGNED NOT NULL COMMENT 'teacher_user_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_exam_questions`
--

INSERT INTO `online_exam_questions` (`id`, `class_section_id`, `class_subject_id`, `question`, `image_url`, `note`, `school_id`, `last_edited_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 10, '&lt;p&gt;2+2 = ?&lt;/p&gt;', NULL, NULL, 29, 104, '2024-06-28 16:49:52', '2024-06-28 16:49:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_choices`
--

CREATE TABLE `online_exam_question_choices` (
  `id` bigint UNSIGNED NOT NULL,
  `online_exam_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `marks` int DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_options`
--

CREATE TABLE `online_exam_question_options` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `option` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_answer` tinyint NOT NULL COMMENT '1 - yes, 0 - no',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_exam_question_options`
--

INSERT INTO `online_exam_question_options` (`id`, `question_id`, `option`, `is_answer`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '&lt;p&gt;11&lt;/p&gt;', 0, 29, '2024-06-28 16:49:52', '2024-06-28 16:49:52', NULL),
(2, 1, '&lt;p&gt;22&lt;/p&gt;', 0, 29, '2024-06-28 16:49:52', '2024-06-28 16:49:52', NULL),
(3, 1, '&lt;p&gt;33&lt;/p&gt;', 0, 29, '2024-06-28 16:49:52', '2024-06-28 16:49:52', NULL),
(4, 1, '&lt;p&gt;4&lt;/p&gt;', 1, 29, '2024-06-28 16:49:52', '2024-06-28 16:49:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_student_answers`
--

CREATE TABLE `online_exam_student_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `online_exam_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `option_id` bigint UNSIGNED NOT NULL,
  `submitted_date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `optional_fees`
--

CREATE TABLE `optional_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `class_id` bigint UNSIGNED NOT NULL,
  `payment_transaction_id` bigint UNSIGNED DEFAULT NULL,
  `fees_class_id` bigint UNSIGNED DEFAULT NULL,
  `mode` enum('Cash','Cheque','Online') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `fees_paid_id` bigint UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `status` enum('Success','Pending','Failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_charge` double(8,4) NOT NULL DEFAULT '0.0000',
  `staff_charge` double(8,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Unpublished, 1 => Published',
  `is_trial` int NOT NULL DEFAULT '0',
  `highlight` tinyint NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `rank` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `tagline`, `student_charge`, `staff_charge`, `status`, `is_trial`, `highlight`, `rank`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Primary Education', 'Primary education refers to the first stage of formal schooling typically aimed at children aged between 5 and 12 years.', NULL, 1.7000, 0.0000, 1, 0, 0, 1, '2024-06-15 19:41:06', '2024-08-07 08:05:06', NULL),
(2, 'Secondary & High School Education', 'Secondary and high school education represents the pivotal years of formal schooling following primary education, typically spanning ages 12 to 18.', NULL, 5.0000, 0.0000, 1, 0, 1, 2, '2024-06-15 19:43:56', '2024-08-07 08:05:39', NULL),
(3, 'University Education', 'University education refers to the tertiary level of education that follows secondary or high school education. It typically spans undergraduate and postgraduate studies.', NULL, 8.5000, 0.0000, 1, 0, 0, 3, '2024-06-15 19:45:57', '2024-08-07 08:06:12', NULL),
(4, 'Trial Package', 'Try out our services', NULL, 0.0000, 0.0000, 1, 1, 0, -1, '2024-06-16 19:33:09', '2024-06-25 02:04:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_features`
--

CREATE TABLE `package_features` (
  `id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `feature_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_features`
--

INSERT INTO `package_features` (`id`, `package_id`, `feature_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(2, 1, 2, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(3, 1, 4, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(4, 1, 5, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(5, 1, 6, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(6, 1, 7, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(7, 1, 13, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(8, 1, 14, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(9, 1, 15, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(10, 1, 16, '2024-06-15 19:41:06', '2024-08-07 08:05:06'),
(11, 2, 1, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(12, 2, 2, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(13, 2, 4, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(14, 2, 5, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(15, 2, 6, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(16, 2, 7, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(17, 2, 8, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(18, 2, 9, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(19, 2, 10, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(20, 2, 11, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(21, 2, 12, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(22, 2, 13, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(23, 2, 14, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(24, 2, 15, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(25, 2, 16, '2024-06-15 19:43:56', '2024-08-07 08:05:39'),
(26, 3, 1, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(27, 3, 2, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(28, 3, 4, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(29, 3, 5, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(30, 3, 3, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(31, 3, 6, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(32, 3, 7, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(33, 3, 8, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(34, 3, 9, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(35, 3, 10, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(36, 3, 11, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(37, 3, 12, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(38, 3, 13, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(39, 3, 14, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(40, 3, 15, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(41, 3, 16, '2024-06-15 19:45:57', '2024-08-07 08:06:12'),
(99, 4, 1, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(100, 4, 2, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(101, 4, 4, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(102, 4, 5, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(103, 4, 3, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(104, 4, 6, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(105, 4, 7, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(106, 4, 8, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(107, 4, 9, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(108, 4, 10, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(109, 4, 11, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(110, 4, 12, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(111, 4, 13, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(112, 4, 14, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(113, 4, 15, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(114, 4, 16, '2024-06-16 19:33:09', '2024-08-09 22:15:20'),
(131, 1, 3, '2024-06-18 22:34:34', '2024-08-07 08:05:06'),
(132, 1, 8, '2024-06-18 22:34:34', '2024-08-07 08:05:06'),
(133, 1, 9, '2024-06-18 22:34:34', '2024-08-07 08:05:06'),
(134, 1, 10, '2024-06-18 22:34:34', '2024-08-07 08:05:06'),
(135, 1, 11, '2024-06-18 22:34:34', '2024-08-07 08:05:06'),
(136, 1, 12, '2024-06-18 22:34:34', '2024-08-07 08:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('romailbhatti226@gmail.com', '$2y$10$ebd4eSpp8pzKpUlaKr7SneIas97RKFx.UzakgAHz.HQqyIiPaRGHG', '2024-06-19 23:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `payment_configurations`
--

CREATE TABLE `payment_configurations` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webhook_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 - Disabled, 1 - Enabled',
  `school_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_configurations`
--

INSERT INTO `payment_configurations` (`id`, `payment_method`, `api_key`, `secret_key`, `webhook_secret_key`, `currency_code`, `status`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 'pk_live_51LDboYEkUXwVRuU31EMrqzHIMK0q9CiAFAEGDqKeX53vdFvv2BBQjpx8JLkRMibmOGAm1svvYUhyGIQSgNi71oIB00jgM2sslu', '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', 'whsec_bhiM3OL4KRU4WzKlK8YmV9k8KPlqA9oR', 'USD', 1, NULL, '2024-06-20 05:34:46', '2024-06-25 20:16:47'),
(2, 'Stripe', 'pk_live_51LDboYEkUXwVRuU31EMrqzHIMK0q9CiAFAEGDqKeX53vdFvv2BBQjpx8JLkRMibmOGAm1svvYUhyGIQSgNi71oIB00jgM2sslu', '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', 'whsec_bhiM3OL4KRU4WzKlK8YmV9k8KPlqA9oR', 'USD', 0, 6, '2024-06-20 14:44:28', '2024-06-22 23:55:13'),
(3, 'Stripe', '-', '-', '-', 'XAF', 0, 26, '2024-06-25 20:39:13', '2024-06-25 20:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'order_id / payment_intent_id',
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('failed','succeed','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(2, 'role-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(3, 'role-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(4, 'role-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(5, 'medium-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(6, 'medium-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(7, 'medium-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(8, 'medium-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(9, 'section-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(10, 'section-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(11, 'section-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(12, 'section-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(13, 'class-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(14, 'class-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(15, 'class-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(16, 'class-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(17, 'class-section-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(18, 'class-section-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(19, 'class-section-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(20, 'class-section-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(21, 'subject-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(22, 'subject-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(23, 'subject-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(24, 'subject-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(25, 'teacher-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(26, 'teacher-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(27, 'teacher-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(28, 'teacher-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(29, 'guardian-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(30, 'guardian-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(31, 'guardian-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(32, 'guardian-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(33, 'session-year-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(34, 'session-year-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(35, 'session-year-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(36, 'session-year-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(37, 'student-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(38, 'student-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(39, 'student-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(40, 'student-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(41, 'timetable-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(42, 'timetable-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(43, 'timetable-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(44, 'timetable-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(45, 'attendance-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(46, 'attendance-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(47, 'attendance-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(48, 'attendance-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(49, 'holiday-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(50, 'holiday-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(51, 'holiday-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(52, 'holiday-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(53, 'announcement-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(54, 'announcement-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(55, 'announcement-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(56, 'announcement-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(57, 'slider-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(58, 'slider-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(59, 'slider-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(60, 'slider-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(61, 'promote-student-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(62, 'promote-student-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(63, 'promote-student-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(64, 'promote-student-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(65, 'language-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(66, 'language-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(67, 'language-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(68, 'language-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(69, 'lesson-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(70, 'lesson-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(71, 'lesson-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(72, 'lesson-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(73, 'topic-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(74, 'topic-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(75, 'topic-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(76, 'topic-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(77, 'schools-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(78, 'schools-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(79, 'schools-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(80, 'schools-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(81, 'form-fields-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(82, 'form-fields-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(83, 'form-fields-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(84, 'form-fields-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(85, 'grade-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(86, 'grade-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(87, 'grade-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(88, 'grade-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(89, 'package-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(90, 'package-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(91, 'package-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(92, 'package-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(93, 'addons-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(94, 'addons-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(95, 'addons-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(96, 'addons-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(97, 'assignment-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(98, 'assignment-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(99, 'assignment-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(100, 'assignment-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(101, 'assignment-submission', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(102, 'exam-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(103, 'exam-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(104, 'exam-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(105, 'exam-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(106, 'exam-timetable-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(107, 'exam-timetable-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(108, 'exam-timetable-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(109, 'exam-timetable-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(110, 'exam-upload-marks', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(111, 'exam-result', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(112, 'system-setting-manage', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(113, 'fcm-setting-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(114, 'email-setting-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(115, 'privacy-policy', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(116, 'contact-us', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(117, 'about-us', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(118, 'terms-condition', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(119, 'class-teacher', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(120, 'student-reset-password', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(121, 'reset-password-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(122, 'student-change-password', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(123, 'update-admin-profile', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(124, 'fees-classes', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(125, 'fees-paid', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(126, 'fees-config', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(127, 'school-setting-manage', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(128, 'app-settings', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(129, 'subscription-view', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(130, 'online-exam-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(131, 'online-exam-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(132, 'online-exam-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(133, 'online-exam-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(134, 'online-exam-questions-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(135, 'online-exam-questions-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(136, 'online-exam-questions-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(137, 'online-exam-questions-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(138, 'fees-type-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(139, 'fees-type-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(140, 'fees-type-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(141, 'fees-type-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(142, 'fees-class-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(143, 'fees-class-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(144, 'fees-class-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(145, 'fees-class-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(146, 'staff-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(147, 'staff-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(148, 'staff-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(149, 'staff-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(150, 'expense-category-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(151, 'expense-category-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(152, 'expense-category-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(153, 'expense-category-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(154, 'expense-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(155, 'expense-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(156, 'expense-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(157, 'expense-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(158, 'semester-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(159, 'semester-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(160, 'semester-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(161, 'semester-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(162, 'payroll-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(163, 'payroll-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(164, 'payroll-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(165, 'payroll-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(166, 'stream-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(167, 'stream-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(168, 'stream-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(169, 'stream-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(170, 'shift-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(171, 'shift-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(172, 'shift-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(173, 'shift-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(174, 'faqs-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(175, 'faqs-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(176, 'faqs-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(177, 'faqs-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(178, 'online-exam-result-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(179, 'fcm-setting-manage', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(180, 'fees-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(181, 'fees-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(182, 'fees-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(183, 'fees-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(184, 'transfer-student-list', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(185, 'transfer-student-create', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(186, 'transfer-student-edit', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(187, 'transfer-student-delete', 'web', '2023-11-25 13:38:41', '2024-02-16 01:56:33'),
(188, 'guidance-list', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(189, 'guidance-create', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(190, 'guidance-edit', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(191, 'guidance-delete', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(192, 'leave-list', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(193, 'leave-create', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(194, 'leave-edit', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(195, 'leave-delete', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(196, 'approve-leave', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(197, 'front-site-setting', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(198, 'payment-settings', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(199, 'subscription-settings', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(200, 'subscription-change-bills', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33'),
(201, 'school-terms-condition', 'web', '2024-02-16 01:56:33', '2024-02-16 01:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'Kel', 'ded596dda7dc29bf802d81cbf1fc9a69d3023223002006e6efa4b7361343b935', '[\"*\"]', NULL, NULL, '2024-06-16 21:24:14', '2024-06-16 21:24:14'),
(2, 'App\\Models\\User', 4, 'Kel', 'ad4271353818b6e41fa5156e659163f7681892f70a32eed52d8c9913d9d8bf8b', '[\"*\"]', NULL, NULL, '2024-06-16 21:24:18', '2024-06-16 21:24:18'),
(3, 'App\\Models\\User', 4, 'Kel', 'd1757d0525f8031dac388cd6d7321152756640d04f032e70613568ea2a773772', '[\"*\"]', NULL, NULL, '2024-06-16 21:24:45', '2024-06-16 21:24:45'),
(4, 'App\\Models\\User', 7, 'Talha', '6a2a7eb5b4b9ec1cda100851ba828eb4d2a992bd24115c6ca0071f715fcee2e8', '[\"*\"]', NULL, NULL, '2024-06-17 23:55:10', '2024-06-17 23:55:10'),
(5, 'App\\Models\\User', 7, 'Talha', 'c87c2484acd106246c3625180e356a2d9d0a07dc4b38534bc7e36b6639bd4f37', '[\"*\"]', NULL, NULL, '2024-06-17 23:55:14', '2024-06-17 23:55:14'),
(6, 'App\\Models\\User', 7, 'Talha', 'bd342193ed0732d1ad90429de31d75d6dab1f2b499739916ea790a66d2f7dc74', '[\"*\"]', NULL, NULL, '2024-06-17 23:56:22', '2024-06-17 23:56:22'),
(7, 'App\\Models\\User', 7, 'Talha', 'cdf3902e111c66630b824ffb141ff6e366c53477264c424b528ce5ec45f4f88a', '[\"*\"]', NULL, NULL, '2024-06-17 23:56:28', '2024-06-17 23:56:28'),
(8, 'App\\Models\\User', 7, 'Talha', 'd37901101c9171550cfe13eb8a9f1d39a62e855c172c974f71ede9b3972aad8e', '[\"*\"]', NULL, NULL, '2024-06-18 00:02:43', '2024-06-18 00:02:43'),
(9, 'App\\Models\\User', 8, 'Saad', 'bfca1f9d3f4d0e86603ecff87980aa2f05079561eeff4ab1aa42c6259e4c4e56', '[\"*\"]', NULL, NULL, '2024-06-18 00:59:41', '2024-06-18 00:59:41'),
(10, 'App\\Models\\User', 8, 'Saad', '483986a13e32d25e36d334447ee92e3765ef5596b6702afe29da521376fb3fbd', '[\"*\"]', NULL, NULL, '2024-06-18 00:59:46', '2024-06-18 00:59:46'),
(11, 'App\\Models\\User', 7, 'Talha', '33dfd7b33a87d652be6443b84553e8164a570cf200cf7577faff1d05bd12a0cd', '[\"*\"]', NULL, NULL, '2024-06-18 05:21:25', '2024-06-18 05:21:25'),
(12, 'App\\Models\\User', 9, 'Talha', '83f42af8a92e30255eff49cb8ecfd154200a9e6b08243777f6c5f8ff6cc51e9c', '[\"*\"]', NULL, NULL, '2024-06-18 05:29:01', '2024-06-18 05:29:01'),
(13, 'App\\Models\\User', 9, 'Talha', 'efe4eb9a86805c65ab7bcd3e0e14d2471905be7a80495d521944fe11fe334746', '[\"*\"]', NULL, NULL, '2024-06-18 05:29:30', '2024-06-18 05:29:30'),
(14, 'App\\Models\\User', 9, 'Talha', 'b4660125ed68c6238285c09e6c0a09d97e4fb890d7d31a126e05bb6c5e66141f', '[\"*\"]', NULL, NULL, '2024-06-18 05:30:28', '2024-06-18 05:30:28'),
(15, 'App\\Models\\User', 13, 'Romail', '31d9f9fdd74d224a84788e415b07d10109ec78bcb3c9d7bdb74f49627ecf5012', '[\"*\"]', NULL, NULL, '2024-06-18 06:02:20', '2024-06-18 06:02:20'),
(16, 'App\\Models\\User', 13, 'Romail', '1681668092eb7083e216d30d5e903bb3bcd011e552911d4a32f3a85d47a499ac', '[\"*\"]', NULL, NULL, '2024-06-18 18:04:26', '2024-06-18 18:04:26'),
(17, 'App\\Models\\User', 13, 'Romail', '890265e1867b6f3724d40344b0f4c4fc1150280c3d11b9f1b16c59c07158061c', '[\"*\"]', NULL, NULL, '2024-06-18 21:44:46', '2024-06-18 21:44:46'),
(18, 'App\\Models\\User', 20, 'Talha', '394ed3d7c9e60515faeb753973b8f1ba9c4b27ad383c810a51f9adece2874830', '[\"*\"]', NULL, NULL, '2024-06-18 21:54:20', '2024-06-18 21:54:20'),
(19, 'App\\Models\\User', 20, 'Talha', '9072de25a874165aa1c8bde95551f15e626bf57ecd0c4a5e4b564147cde58fbc', '[\"*\"]', NULL, NULL, '2024-06-18 21:57:52', '2024-06-18 21:57:52'),
(29, 'App\\Models\\User', 21, 'Talha', '1c1101cf01777c2c74a4ba587e8dc91ec94c546958567e1bcec9508d967dbe92', '[\"*\"]', '2024-06-27 19:57:26', NULL, '2024-06-27 15:19:05', '2024-06-27 19:57:26'),
(32, 'App\\Models\\User', 103, 'Demo Student', 'e2714970a0a9d32e35050fdaef845abdcf9112c4cd71e8e146841c2a6cbe9ced', '[\"*\"]', '2024-06-27 21:20:35', NULL, '2024-06-27 21:19:21', '2024-06-27 21:20:35'),
(33, 'App\\Models\\User', 103, 'Demo Student', 'd2607c05c6b91533947147044569a6f9d3361776108d963b34db751cb4d11074', '[\"*\"]', '2024-06-27 21:29:06', NULL, '2024-06-27 21:28:11', '2024-06-27 21:29:06'),
(34, 'App\\Models\\User', 103, 'Demo Student', 'b64a71e6be91adcf271d7245f3614a35a749e700904e6060ac52a1d9cc13aaba', '[\"*\"]', '2024-06-27 21:48:07', NULL, '2024-06-27 21:30:26', '2024-06-27 21:48:07'),
(36, 'App\\Models\\User', 103, 'Demo Student', '4bf95581b3fdbb5eca7e1c98c7ec751d7ef5e62791a410a2986f9b40f5b7e3c3', '[\"*\"]', '2024-06-28 00:08:48', NULL, '2024-06-28 00:08:46', '2024-06-28 00:08:48'),
(37, 'App\\Models\\User', 103, 'Demo Student', '3d194fb576c4e889803b9475747eaf0a78ec0ebe8208508a77a045ea9080b7b8', '[\"*\"]', '2024-06-28 13:31:47', NULL, '2024-06-28 13:23:08', '2024-06-28 13:31:47'),
(41, 'App\\Models\\User', 103, 'Demo Student', 'bce2cfa75c9e6291a643dd48b6bbbb6b6a030681e855bac93ad18cd38e0d461d', '[\"*\"]', '2024-06-28 17:32:42', NULL, '2024-06-28 17:32:12', '2024-06-28 17:32:42'),
(44, 'App\\Models\\User', 102, 'Demo Parent', '60de7dfefd073fef941d0f48f73886bf4b304b379f1580fa0b57e50db510b0ad', '[\"*\"]', '2024-06-28 17:41:39', NULL, '2024-06-28 17:41:31', '2024-06-28 17:41:39'),
(46, 'App\\Models\\User', 103, 'Demo Student', '50ee634ad792784419bda71ce028529570a22b274a11745bb46494454407bea8', '[\"*\"]', '2024-07-02 19:28:39', NULL, '2024-07-02 19:13:38', '2024-07-02 19:28:39'),
(49, 'App\\Models\\User', 103, 'Demo Student', '87c2c4c1e9213254b1d4fbe6651e11f2178ccdfae75271a7502100086d78019a', '[\"*\"]', '2024-07-16 20:24:16', NULL, '2024-07-16 20:24:09', '2024-07-16 20:24:16'),
(50, 'App\\Models\\User', 103, 'Demo Student', '03722428806a29b8049ed92dd92242fcf82012bdc91f048cfc044bd991c36033', '[\"*\"]', '2024-07-16 20:41:32', NULL, '2024-07-16 20:41:17', '2024-07-16 20:41:32'),
(53, 'App\\Models\\User', 102, 'Demo Parent', '9bdf6dc9ff8a6fd4da2921cafcd714f5426b6c22bd6ab0aaf7be670d5fda28b3', '[\"*\"]', '2024-07-16 21:53:27', NULL, '2024-07-16 21:50:09', '2024-07-16 21:53:27'),
(54, 'App\\Models\\User', 103, 'Demo Student', 'c2da6e8369aa0c79c6ed9b0c04991f078cf38d8c9496c3ba4599f9b9e883b8a9', '[\"*\"]', '2024-07-17 04:48:43', NULL, '2024-07-17 04:43:40', '2024-07-17 04:48:43'),
(57, 'App\\Models\\User', 121, 'Joan', 'b385f6aa21077a1b750fac48c054a3c4ac9f26553894329d858cd0b14d2edb93', '[\"*\"]', '2024-12-02 01:21:27', NULL, '2024-08-21 19:19:54', '2024-12-02 01:21:27'),
(58, 'App\\Models\\User', 121, 'Joan', 'cdbcc41e61843f1c2f5f303323c9c900dd102a1242f819a3e3f1ed1de5e0aed0', '[\"*\"]', '2025-03-12 09:39:16', NULL, '2024-08-22 22:25:53', '2025-03-12 09:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `promote_students`
--

CREATE TABLE `promote_students` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `class_section_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `result` tinyint NOT NULL DEFAULT '1' COMMENT '1=>Pass,0=>fail',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=>continue,0=>leave',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promote_students`
--

INSERT INTO `promote_students` (`id`, `student_id`, `class_section_id`, `session_year_id`, `result`, `status`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 81, 9, 27, 1, 1, 26, '2024-06-25 18:24:59', '2024-06-25 18:24:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED DEFAULT NULL,
  `custom_role` tinyint(1) NOT NULL DEFAULT '1',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `school_id`, `custom_role`, `editable`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, 0, 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(2, 'School Admin', 'web', NULL, 0, 0, '2023-11-25 13:38:41', '2023-11-25 13:38:41'),
(4, 'Staff', 'web', NULL, 1, 1, '2024-06-15 20:42:46', '2024-06-15 20:42:46'),
(5, 'Guardian', 'web', 1, 0, 0, '2024-06-15 20:54:13', '2024-06-15 20:54:13'),
(6, 'Student', 'web', 1, 0, 0, '2024-06-15 20:54:13', '2024-06-15 20:54:13'),
(7, 'Teacher', 'web', 1, 0, 1, '2024-06-15 20:54:13', '2024-06-15 20:54:13'),
(8, 'Guardian', 'web', 2, 0, 0, '2024-06-17 23:46:05', '2024-06-17 23:46:05'),
(9, 'Student', 'web', 2, 0, 0, '2024-06-17 23:46:05', '2024-06-17 23:46:05'),
(10, 'Teacher', 'web', 2, 0, 1, '2024-06-17 23:46:05', '2024-06-17 23:46:05'),
(11, 'Guardian', 'web', 3, 0, 0, '2024-06-18 05:37:09', '2024-06-18 05:37:09'),
(12, 'Student', 'web', 3, 0, 0, '2024-06-18 05:37:09', '2024-06-18 05:37:09'),
(13, 'Teacher', 'web', 3, 0, 1, '2024-06-18 05:37:09', '2024-06-18 05:37:09'),
(14, 'Guardian', 'web', 4, 0, 0, '2024-06-18 05:55:21', '2024-06-18 05:55:21'),
(15, 'Student', 'web', 4, 0, 0, '2024-06-18 05:55:21', '2024-06-18 05:55:21'),
(16, 'Teacher', 'web', 4, 0, 1, '2024-06-18 05:55:21', '2024-06-18 05:55:21'),
(17, 'Guardian', 'web', 5, 0, 0, '2024-06-19 19:03:48', '2024-06-19 19:03:48'),
(18, 'Student', 'web', 5, 0, 0, '2024-06-19 19:03:48', '2024-06-19 19:03:48'),
(19, 'Teacher', 'web', 5, 0, 1, '2024-06-19 19:03:48', '2024-06-19 19:03:48'),
(20, 'Guardian', 'web', 6, 0, 0, '2024-06-19 20:09:56', '2024-06-19 20:09:56'),
(21, 'Student', 'web', 6, 0, 0, '2024-06-19 20:09:56', '2024-06-19 20:09:56'),
(22, 'Teacher', 'web', 6, 0, 1, '2024-06-19 20:09:56', '2024-06-19 20:09:56'),
(23, 'Guardian', 'web', 7, 0, 0, '2024-06-20 07:06:08', '2024-06-20 07:06:08'),
(24, 'Student', 'web', 7, 0, 0, '2024-06-20 07:06:08', '2024-06-20 07:06:08'),
(25, 'Teacher', 'web', 7, 0, 1, '2024-06-20 07:06:08', '2024-06-20 07:06:08'),
(68, 'Guardian', 'web', 22, 0, 0, '2024-06-24 06:00:23', '2024-06-24 06:00:23'),
(69, 'Student', 'web', 22, 0, 0, '2024-06-24 06:00:23', '2024-06-24 06:00:23'),
(70, 'Teacher', 'web', 22, 0, 1, '2024-06-24 06:00:23', '2024-06-24 06:00:23'),
(71, 'Guardian', 'web', 23, 0, 0, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(72, 'Student', 'web', 23, 0, 0, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(73, 'Teacher', 'web', 23, 0, 1, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(74, 'Guardian', 'web', 24, 0, 0, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(75, 'Student', 'web', 24, 0, 0, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(76, 'Teacher', 'web', 24, 0, 1, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(77, 'Guardian', 'web', 25, 0, 0, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(78, 'Student', 'web', 25, 0, 0, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(79, 'Teacher', 'web', 25, 0, 1, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(80, 'Guardian', 'web', 26, 0, 0, '2024-06-24 07:23:16', '2024-06-24 07:23:16'),
(81, 'Student', 'web', 26, 0, 0, '2024-06-24 07:23:16', '2024-06-24 07:23:16'),
(82, 'Teacher', 'web', 26, 0, 1, '2024-06-24 07:23:16', '2024-06-24 07:23:16'),
(83, 'Accountant', 'web', 5, 1, 1, '2024-06-24 19:52:49', '2024-06-24 19:52:49'),
(84, 'Guardian', 'web', 27, 0, 0, '2024-06-24 23:03:18', '2024-06-24 23:03:18'),
(85, 'Student', 'web', 27, 0, 0, '2024-06-24 23:03:18', '2024-06-24 23:03:18'),
(86, 'Teacher', 'web', 27, 0, 1, '2024-06-24 23:03:18', '2024-06-24 23:03:18'),
(87, 'Guardian', 'web', 28, 0, 0, '2024-06-25 00:18:18', '2024-06-25 00:18:18'),
(88, 'Student', 'web', 28, 0, 0, '2024-06-25 00:18:18', '2024-06-25 00:18:18'),
(89, 'Teacher', 'web', 28, 0, 1, '2024-06-25 00:18:18', '2024-06-25 00:18:18'),
(90, 'Guardian', 'web', 29, 0, 0, '2024-06-25 02:13:31', '2024-06-25 02:13:31'),
(91, 'Student', 'web', 29, 0, 0, '2024-06-25 02:13:31', '2024-06-25 02:13:31'),
(92, 'Teacher', 'web', 29, 0, 1, '2024-06-25 02:13:31', '2024-06-25 02:13:31'),
(93, 'Guardian', 'web', 30, 0, 0, '2024-06-25 14:24:46', '2024-06-25 14:24:46'),
(94, 'Student', 'web', 30, 0, 0, '2024-06-25 14:24:46', '2024-06-25 14:24:46'),
(95, 'Teacher', 'web', 30, 0, 1, '2024-06-25 14:24:46', '2024-06-25 14:24:46'),
(96, 'Guardian', 'web', 31, 0, 0, '2024-06-26 02:35:29', '2024-06-26 02:35:29'),
(97, 'Student', 'web', 31, 0, 0, '2024-06-26 02:35:29', '2024-06-26 02:35:29'),
(98, 'Teacher', 'web', 31, 0, 1, '2024-06-26 02:35:29', '2024-06-26 02:35:29'),
(99, 'Guardian', 'web', 32, 0, 0, '2024-06-27 00:51:56', '2024-06-27 00:51:56'),
(100, 'Student', 'web', 32, 0, 0, '2024-06-27 00:51:56', '2024-06-27 00:51:56'),
(101, 'Teacher', 'web', 32, 0, 1, '2024-06-27 00:51:56', '2024-06-27 00:51:56'),
(102, 'Admin', 'web', 32, 1, 1, '2024-06-27 01:47:57', '2024-06-27 01:47:57'),
(103, 'Guardian', 'web', 33, 0, 0, '2024-07-01 18:08:45', '2024-07-01 18:08:45'),
(104, 'Student', 'web', 33, 0, 0, '2024-07-01 18:08:45', '2024-07-01 18:08:45'),
(105, 'Teacher', 'web', 33, 0, 1, '2024-07-01 18:08:45', '2024-07-01 18:08:45'),
(106, 'Guardian', 'web', 34, 0, 0, '2024-07-01 18:43:55', '2024-07-01 18:43:55'),
(107, 'Student', 'web', 34, 0, 0, '2024-07-01 18:43:55', '2024-07-01 18:43:55'),
(108, 'Teacher', 'web', 34, 0, 1, '2024-07-01 18:43:55', '2024-07-01 18:43:55'),
(109, 'Guardian', 'web', 35, 0, 0, '2024-07-03 21:09:32', '2024-07-03 21:09:32'),
(110, 'Student', 'web', 35, 0, 0, '2024-07-03 21:09:32', '2024-07-03 21:09:32'),
(111, 'Teacher', 'web', 35, 0, 1, '2024-07-03 21:09:32', '2024-07-03 21:09:32'),
(112, 'Guardian', 'web', 36, 0, 0, '2024-07-04 16:11:51', '2024-07-04 16:11:51'),
(113, 'Student', 'web', 36, 0, 0, '2024-07-04 16:11:51', '2024-07-04 16:11:51'),
(114, 'Teacher', 'web', 36, 0, 1, '2024-07-04 16:11:51', '2024-07-04 16:11:51'),
(115, 'Guardian', 'web', 37, 0, 0, '2024-07-18 22:47:50', '2024-07-18 22:47:50'),
(116, 'Student', 'web', 37, 0, 0, '2024-07-18 22:47:50', '2024-07-18 22:47:50'),
(117, 'Teacher', 'web', 37, 0, 1, '2024-07-18 22:47:50', '2024-07-18 22:47:50'),
(118, 'Guardian', 'web', 38, 0, 0, '2024-07-20 07:26:22', '2024-07-20 07:26:22'),
(119, 'Student', 'web', 38, 0, 0, '2024-07-20 07:26:22', '2024-07-20 07:26:22'),
(120, 'Teacher', 'web', 38, 0, 1, '2024-07-20 07:26:22', '2024-07-20 07:26:22'),
(121, 'HR', 'web', 33, 1, 1, '2024-07-22 03:24:47', '2024-07-22 03:24:47'),
(122, 'School Administrator', 'web', 33, 1, 1, '2024-07-22 03:29:57', '2024-07-22 03:29:57'),
(123, 'Guardian', 'web', 39, 0, 0, '2024-07-23 00:30:36', '2024-07-23 00:30:36'),
(124, 'Student', 'web', 39, 0, 0, '2024-07-23 00:30:36', '2024-07-23 00:30:36'),
(125, 'Teacher', 'web', 39, 0, 1, '2024-07-23 00:30:36', '2024-07-23 00:30:36'),
(126, 'Guardian', 'web', 40, 0, 0, '2024-08-10 14:45:24', '2024-08-10 14:45:24'),
(127, 'Student', 'web', 40, 0, 0, '2024-08-10 14:45:24', '2024-08-10 14:45:24'),
(128, 'Teacher', 'web', 40, 0, 1, '2024-08-10 14:45:24', '2024-08-10 14:45:24'),
(129, 'Guardian', 'web', 41, 0, 0, '2024-09-08 22:32:52', '2024-09-08 22:32:52'),
(130, 'Student', 'web', 41, 0, 0, '2024-09-08 22:32:52', '2024-09-08 22:32:52'),
(131, 'Teacher', 'web', 41, 0, 1, '2024-09-08 22:32:52', '2024-09-08 22:32:52'),
(132, 'Guardian', 'web', 42, 0, 0, '2024-09-22 15:32:03', '2024-09-22 15:32:03'),
(133, 'Student', 'web', 42, 0, 0, '2024-09-22 15:32:03', '2024-09-22 15:32:03'),
(134, 'Teacher', 'web', 42, 0, 1, '2024-09-22 15:32:03', '2024-09-22 15:32:03'),
(135, 'Guardian', 'web', 43, 0, 0, '2024-09-25 21:58:58', '2024-09-25 21:58:58'),
(136, 'Student', 'web', 43, 0, 0, '2024-09-25 21:58:58', '2024-09-25 21:58:58'),
(137, 'Teacher', 'web', 43, 0, 1, '2024-09-25 21:58:58', '2024-09-25 21:58:58'),
(138, 'Guardian', 'web', 44, 0, 0, '2024-09-26 22:47:08', '2024-09-26 22:47:08'),
(139, 'Student', 'web', 44, 0, 0, '2024-09-26 22:47:08', '2024-09-26 22:47:08'),
(140, 'Teacher', 'web', 44, 0, 1, '2024-09-26 22:47:08', '2024-09-26 22:47:08'),
(141, 'Guardian', 'web', 45, 0, 0, '2024-09-27 06:35:16', '2024-09-27 06:35:16'),
(142, 'Student', 'web', 45, 0, 0, '2024-09-27 06:35:16', '2024-09-27 06:35:16'),
(143, 'Teacher', 'web', 45, 0, 1, '2024-09-27 06:35:16', '2024-09-27 06:35:16'),
(144, 'Guardian', 'web', 46, 0, 0, '2024-09-30 05:44:02', '2024-09-30 05:44:02'),
(145, 'Student', 'web', 46, 0, 0, '2024-09-30 05:44:02', '2024-09-30 05:44:02'),
(146, 'Teacher', 'web', 46, 0, 1, '2024-09-30 05:44:02', '2024-09-30 05:44:02'),
(147, 'Guardian', 'web', 47, 0, 0, '2024-09-30 06:36:03', '2024-09-30 06:36:03'),
(148, 'Student', 'web', 47, 0, 0, '2024-09-30 06:36:03', '2024-09-30 06:36:03'),
(149, 'Teacher', 'web', 47, 0, 1, '2024-09-30 06:36:03', '2024-09-30 06:36:03'),
(150, 'Guardian', 'web', 48, 0, 0, '2024-10-07 13:17:49', '2024-10-07 13:17:49'),
(151, 'Student', 'web', 48, 0, 0, '2024-10-07 13:17:49', '2024-10-07 13:17:49'),
(152, 'Teacher', 'web', 48, 0, 1, '2024-10-07 13:17:49', '2024-10-07 13:17:49'),
(153, 'Guardian', 'web', 49, 0, 0, '2024-10-13 02:26:48', '2024-10-13 02:26:48'),
(154, 'Student', 'web', 49, 0, 0, '2024-10-13 02:26:48', '2024-10-13 02:26:48'),
(155, 'Teacher', 'web', 49, 0, 1, '2024-10-13 02:26:48', '2024-10-13 02:26:48'),
(156, 'Guardian', 'web', 50, 0, 0, '2024-10-14 17:03:38', '2024-10-14 17:03:38'),
(157, 'Student', 'web', 50, 0, 0, '2024-10-14 17:03:38', '2024-10-14 17:03:38'),
(158, 'Teacher', 'web', 50, 0, 1, '2024-10-14 17:03:38', '2024-10-14 17:03:38'),
(159, 'Guardian', 'web', 51, 0, 0, '2024-10-15 22:36:48', '2024-10-15 22:36:48'),
(160, 'Student', 'web', 51, 0, 0, '2024-10-15 22:36:48', '2024-10-15 22:36:48'),
(161, 'Teacher', 'web', 51, 0, 1, '2024-10-15 22:36:48', '2024-10-15 22:36:48'),
(162, 'Guardian', 'web', 52, 0, 0, '2024-10-16 01:58:57', '2024-10-16 01:58:57'),
(163, 'Student', 'web', 52, 0, 0, '2024-10-16 01:58:57', '2024-10-16 01:58:57'),
(164, 'Teacher', 'web', 52, 0, 1, '2024-10-16 01:58:57', '2024-10-16 01:58:57'),
(165, 'Guardian', 'web', 53, 0, 0, '2024-10-16 15:26:32', '2024-10-16 15:26:32'),
(166, 'Student', 'web', 53, 0, 0, '2024-10-16 15:26:32', '2024-10-16 15:26:32'),
(167, 'Teacher', 'web', 53, 0, 1, '2024-10-16 15:26:32', '2024-10-16 15:26:32'),
(168, 'Guardian', 'web', 54, 0, 0, '2024-10-23 15:46:44', '2024-10-23 15:46:44'),
(169, 'Student', 'web', 54, 0, 0, '2024-10-23 15:46:44', '2024-10-23 15:46:44'),
(170, 'Teacher', 'web', 54, 0, 1, '2024-10-23 15:46:44', '2024-10-23 15:46:44'),
(171, 'Guardian', 'web', 55, 0, 0, '2024-10-28 06:56:53', '2024-10-28 06:56:53'),
(172, 'Student', 'web', 55, 0, 0, '2024-10-28 06:56:53', '2024-10-28 06:56:53'),
(173, 'Teacher', 'web', 55, 0, 1, '2024-10-28 06:56:53', '2024-10-28 06:56:53'),
(174, 'Guardian', 'web', 56, 0, 0, '2024-10-29 11:55:07', '2024-10-29 11:55:07'),
(175, 'Student', 'web', 56, 0, 0, '2024-10-29 11:55:07', '2024-10-29 11:55:07'),
(176, 'Teacher', 'web', 56, 0, 1, '2024-10-29 11:55:07', '2024-10-29 11:55:07'),
(177, 'Guardian', 'web', 57, 0, 0, '2024-11-09 12:02:15', '2024-11-09 12:02:15'),
(178, 'Student', 'web', 57, 0, 0, '2024-11-09 12:02:15', '2024-11-09 12:02:15'),
(179, 'Teacher', 'web', 57, 0, 1, '2024-11-09 12:02:15', '2024-11-09 12:02:15'),
(180, 'Guardian', 'web', 58, 0, 0, '2024-11-17 15:46:12', '2024-11-17 15:46:12'),
(181, 'Student', 'web', 58, 0, 0, '2024-11-17 15:46:12', '2024-11-17 15:46:12'),
(182, 'Teacher', 'web', 58, 0, 1, '2024-11-17 15:46:12', '2024-11-17 15:46:12'),
(183, 'Guardian', 'web', 59, 0, 0, '2024-11-30 10:07:02', '2024-11-30 10:07:02'),
(184, 'Student', 'web', 59, 0, 0, '2024-11-30 10:07:02', '2024-11-30 10:07:02'),
(185, 'Teacher', 'web', 59, 0, 1, '2024-11-30 10:07:02', '2024-11-30 10:07:02'),
(186, 'Guardian', 'web', 60, 0, 0, '2024-12-01 22:36:27', '2024-12-01 22:36:27'),
(187, 'Student', 'web', 60, 0, 0, '2024-12-01 22:36:27', '2024-12-01 22:36:27'),
(188, 'Teacher', 'web', 60, 0, 1, '2024-12-01 22:36:27', '2024-12-01 22:36:27'),
(189, 'Guardian', 'web', 61, 0, 0, '2024-12-03 22:13:35', '2024-12-03 22:13:35'),
(190, 'Student', 'web', 61, 0, 0, '2024-12-03 22:13:35', '2024-12-03 22:13:35'),
(191, 'Teacher', 'web', 61, 0, 1, '2024-12-03 22:13:35', '2024-12-03 22:13:35'),
(192, 'Guardian', 'web', 62, 0, 0, '2024-12-05 10:34:45', '2024-12-05 10:34:45'),
(193, 'Student', 'web', 62, 0, 0, '2024-12-05 10:34:45', '2024-12-05 10:34:45'),
(194, 'Teacher', 'web', 62, 0, 1, '2024-12-05 10:34:45', '2024-12-05 10:34:45'),
(195, 'Guardian', 'web', 63, 0, 0, '2024-12-16 11:15:23', '2024-12-16 11:15:23'),
(196, 'Student', 'web', 63, 0, 0, '2024-12-16 11:15:23', '2024-12-16 11:15:23'),
(197, 'Teacher', 'web', 63, 0, 1, '2024-12-16 11:15:23', '2024-12-16 11:15:23'),
(198, 'Guardian', 'web', 64, 0, 0, '2024-12-17 20:04:34', '2024-12-17 20:04:34'),
(199, 'Student', 'web', 64, 0, 0, '2024-12-17 20:04:34', '2024-12-17 20:04:34'),
(200, 'Teacher', 'web', 64, 0, 1, '2024-12-17 20:04:34', '2024-12-17 20:04:34'),
(201, 'Guardian', 'web', 65, 0, 0, '2024-12-21 07:23:40', '2024-12-21 07:23:40'),
(202, 'Student', 'web', 65, 0, 0, '2024-12-21 07:23:40', '2024-12-21 07:23:40'),
(203, 'Teacher', 'web', 65, 0, 1, '2024-12-21 07:23:40', '2024-12-21 07:23:40'),
(204, 'Guardian', 'web', 66, 0, 0, '2024-12-22 04:47:26', '2024-12-22 04:47:26'),
(205, 'Student', 'web', 66, 0, 0, '2024-12-22 04:47:26', '2024-12-22 04:47:26'),
(206, 'Teacher', 'web', 66, 0, 1, '2024-12-22 04:47:26', '2024-12-22 04:47:26'),
(207, 'Guardian', 'web', 67, 0, 0, '2024-12-26 09:17:14', '2024-12-26 09:17:14'),
(208, 'Student', 'web', 67, 0, 0, '2024-12-26 09:17:14', '2024-12-26 09:17:14'),
(209, 'Teacher', 'web', 67, 0, 1, '2024-12-26 09:17:14', '2024-12-26 09:17:14'),
(210, 'Guardian', 'web', 68, 0, 0, '2024-12-31 14:22:37', '2024-12-31 14:22:37'),
(211, 'Student', 'web', 68, 0, 0, '2024-12-31 14:22:37', '2024-12-31 14:22:37'),
(212, 'Teacher', 'web', 68, 0, 1, '2024-12-31 14:22:37', '2024-12-31 14:22:37'),
(213, 'Guardian', 'web', 69, 0, 0, '2025-01-01 10:23:08', '2025-01-01 10:23:08'),
(214, 'Student', 'web', 69, 0, 0, '2025-01-01 10:23:08', '2025-01-01 10:23:08'),
(215, 'Teacher', 'web', 69, 0, 1, '2025-01-01 10:23:08', '2025-01-01 10:23:08'),
(216, 'Guardian', 'web', 70, 0, 0, '2025-01-06 10:34:30', '2025-01-06 10:34:30'),
(217, 'Student', 'web', 70, 0, 0, '2025-01-06 10:34:30', '2025-01-06 10:34:30'),
(218, 'Teacher', 'web', 70, 0, 1, '2025-01-06 10:34:30', '2025-01-06 10:34:30'),
(219, 'Guardian', 'web', 71, 0, 0, '2025-01-16 19:06:55', '2025-01-16 19:06:55'),
(220, 'Student', 'web', 71, 0, 0, '2025-01-16 19:06:55', '2025-01-16 19:06:55'),
(221, 'Teacher', 'web', 71, 0, 1, '2025-01-16 19:06:55', '2025-01-16 19:06:55'),
(222, 'Guardian', 'web', 72, 0, 0, '2025-01-18 22:07:29', '2025-01-18 22:07:29'),
(223, 'Student', 'web', 72, 0, 0, '2025-01-18 22:07:29', '2025-01-18 22:07:29'),
(224, 'Teacher', 'web', 72, 0, 1, '2025-01-18 22:07:29', '2025-01-18 22:07:29'),
(225, 'Guardian', 'web', 73, 0, 0, '2025-01-20 22:40:09', '2025-01-20 22:40:09'),
(226, 'Student', 'web', 73, 0, 0, '2025-01-20 22:40:09', '2025-01-20 22:40:09'),
(227, 'Teacher', 'web', 73, 0, 1, '2025-01-20 22:40:09', '2025-01-20 22:40:09'),
(228, 'Guardian', 'web', 74, 0, 0, '2025-01-23 13:13:47', '2025-01-23 13:13:47'),
(229, 'Student', 'web', 74, 0, 0, '2025-01-23 13:13:47', '2025-01-23 13:13:47'),
(230, 'Teacher', 'web', 74, 0, 1, '2025-01-23 13:13:47', '2025-01-23 13:13:47'),
(231, 'Guardian', 'web', 75, 0, 0, '2025-01-25 00:36:25', '2025-01-25 00:36:25'),
(232, 'Student', 'web', 75, 0, 0, '2025-01-25 00:36:25', '2025-01-25 00:36:25'),
(233, 'Teacher', 'web', 75, 0, 1, '2025-01-25 00:36:25', '2025-01-25 00:36:25'),
(234, 'Guardian', 'web', 76, 0, 0, '2025-01-29 13:34:27', '2025-01-29 13:34:27'),
(235, 'Student', 'web', 76, 0, 0, '2025-01-29 13:34:27', '2025-01-29 13:34:27'),
(236, 'Teacher', 'web', 76, 0, 1, '2025-01-29 13:34:27', '2025-01-29 13:34:27'),
(237, 'Guardian', 'web', 77, 0, 0, '2025-01-31 10:57:52', '2025-01-31 10:57:52'),
(238, 'Student', 'web', 77, 0, 0, '2025-01-31 10:57:52', '2025-01-31 10:57:52'),
(239, 'Teacher', 'web', 77, 0, 1, '2025-01-31 10:57:52', '2025-01-31 10:57:52'),
(240, 'Guardian', 'web', 78, 0, 0, '2025-02-03 23:17:14', '2025-02-03 23:17:14'),
(241, 'Student', 'web', 78, 0, 0, '2025-02-03 23:17:14', '2025-02-03 23:17:14'),
(242, 'Teacher', 'web', 78, 0, 1, '2025-02-03 23:17:14', '2025-02-03 23:17:14'),
(243, 'Guardian', 'web', 79, 0, 0, '2025-02-06 08:00:21', '2025-02-06 08:00:21'),
(244, 'Student', 'web', 79, 0, 0, '2025-02-06 08:00:21', '2025-02-06 08:00:21'),
(245, 'Teacher', 'web', 79, 0, 1, '2025-02-06 08:00:21', '2025-02-06 08:00:21'),
(246, 'Guardian', 'web', 80, 0, 0, '2025-02-11 14:04:52', '2025-02-11 14:04:52'),
(247, 'Student', 'web', 80, 0, 0, '2025-02-11 14:04:52', '2025-02-11 14:04:52'),
(248, 'Teacher', 'web', 80, 0, 1, '2025-02-11 14:04:52', '2025-02-11 14:04:52'),
(249, 'Guardian', 'web', 81, 0, 0, '2025-02-12 09:55:58', '2025-02-12 09:55:58'),
(250, 'Student', 'web', 81, 0, 0, '2025-02-12 09:55:58', '2025-02-12 09:55:58'),
(251, 'Teacher', 'web', 81, 0, 1, '2025-02-12 09:55:58', '2025-02-12 09:55:58'),
(252, 'Guardian', 'web', 82, 0, 0, '2025-02-12 10:00:43', '2025-02-12 10:00:43'),
(253, 'Student', 'web', 82, 0, 0, '2025-02-12 10:00:43', '2025-02-12 10:00:43'),
(254, 'Teacher', 'web', 82, 0, 1, '2025-02-12 10:00:43', '2025-02-12 10:00:43'),
(255, 'Guardian', 'web', 83, 0, 0, '2025-02-14 04:46:24', '2025-02-14 04:46:24'),
(256, 'Student', 'web', 83, 0, 0, '2025-02-14 04:46:24', '2025-02-14 04:46:24'),
(257, 'Teacher', 'web', 83, 0, 1, '2025-02-14 04:46:24', '2025-02-14 04:46:24'),
(258, 'Guardian', 'web', 84, 0, 0, '2025-02-16 09:44:44', '2025-02-16 09:44:44'),
(259, 'Student', 'web', 84, 0, 0, '2025-02-16 09:44:44', '2025-02-16 09:44:44'),
(260, 'Teacher', 'web', 84, 0, 1, '2025-02-16 09:44:44', '2025-02-16 09:44:44'),
(261, 'Guardian', 'web', 85, 0, 0, '2025-02-16 13:17:46', '2025-02-16 13:17:46'),
(262, 'Student', 'web', 85, 0, 0, '2025-02-16 13:17:46', '2025-02-16 13:17:46'),
(263, 'Teacher', 'web', 85, 0, 1, '2025-02-16 13:17:46', '2025-02-16 13:17:46'),
(264, 'Guardian', 'web', 86, 0, 0, '2025-02-17 15:28:58', '2025-02-17 15:28:58'),
(265, 'Student', 'web', 86, 0, 0, '2025-02-17 15:28:58', '2025-02-17 15:28:58'),
(266, 'Teacher', 'web', 86, 0, 1, '2025-02-17 15:28:58', '2025-02-17 15:28:58'),
(267, 'Guardian', 'web', 87, 0, 0, '2025-03-02 10:56:19', '2025-03-02 10:56:19'),
(268, 'Student', 'web', 87, 0, 0, '2025-03-02 10:56:19', '2025-03-02 10:56:19'),
(269, 'Teacher', 'web', 87, 0, 1, '2025-03-02 10:56:19', '2025-03-02 10:56:19'),
(270, 'Guardian', 'web', 88, 0, 0, '2025-03-04 02:44:36', '2025-03-04 02:44:36'),
(271, 'Student', 'web', 88, 0, 0, '2025-03-04 02:44:36', '2025-03-04 02:44:36'),
(272, 'Teacher', 'web', 88, 0, 1, '2025-03-04 02:44:36', '2025-03-04 02:44:36'),
(273, 'Guardian', 'web', 89, 0, 0, '2025-03-04 13:09:48', '2025-03-04 13:09:48'),
(274, 'Student', 'web', 89, 0, 0, '2025-03-04 13:09:48', '2025-03-04 13:09:48'),
(275, 'Teacher', 'web', 89, 0, 1, '2025-03-04 13:09:48', '2025-03-04 13:09:48'),
(276, 'Guardian', 'web', 90, 0, 0, '2025-03-05 12:42:24', '2025-03-05 12:42:24'),
(277, 'Student', 'web', 90, 0, 0, '2025-03-05 12:42:24', '2025-03-05 12:42:24'),
(278, 'Teacher', 'web', 90, 0, 1, '2025-03-05 12:42:24', '2025-03-05 12:42:24'),
(279, 'Guardian', 'web', 91, 0, 0, '2025-03-09 17:08:43', '2025-03-09 17:08:43'),
(280, 'Student', 'web', 91, 0, 0, '2025-03-09 17:08:43', '2025-03-09 17:08:43'),
(281, 'Teacher', 'web', 91, 0, 1, '2025-03-09 17:08:43', '2025-03-09 17:08:43'),
(282, 'Guardian', 'web', 92, 0, 0, '2025-03-10 15:02:39', '2025-03-10 15:02:39'),
(283, 'Student', 'web', 92, 0, 0, '2025-03-10 15:02:39', '2025-03-10 15:02:39'),
(284, 'Teacher', 'web', 92, 0, 1, '2025-03-10 15:02:39', '2025-03-10 15:02:39'),
(285, 'Guardian', 'web', 93, 0, 0, '2025-03-13 00:57:53', '2025-03-13 00:57:53'),
(286, 'Student', 'web', 93, 0, 0, '2025-03-13 00:57:53', '2025-03-13 00:57:53'),
(287, 'Teacher', 'web', 93, 0, 1, '2025-03-13 00:57:53', '2025-03-13 00:57:53'),
(288, 'Guardian', 'web', 94, 0, 0, '2025-03-19 10:34:34', '2025-03-19 10:34:34'),
(289, 'Student', 'web', 94, 0, 0, '2025-03-19 10:34:34', '2025-03-19 10:34:34'),
(290, 'Teacher', 'web', 94, 0, 1, '2025-03-19 10:34:34', '2025-03-19 10:34:34'),
(291, 'Guardian', 'web', 95, 0, 0, '2025-03-20 00:19:07', '2025-03-20 00:19:07'),
(292, 'Student', 'web', 95, 0, 0, '2025-03-20 00:19:07', '2025-03-20 00:19:07'),
(293, 'Teacher', 'web', 95, 0, 1, '2025-03-20 00:19:07', '2025-03-20 00:19:07'),
(294, 'Guardian', 'web', 96, 0, 0, '2025-03-25 14:12:13', '2025-03-25 14:12:13'),
(295, 'Student', 'web', 96, 0, 0, '2025-03-25 14:12:13', '2025-03-25 14:12:13'),
(296, 'Teacher', 'web', 96, 0, 1, '2025-03-25 14:12:13', '2025-03-25 14:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(123, 1),
(128, 1),
(129, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(179, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(197, 1),
(199, 1),
(200, 1),
(201, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(109, 2),
(111, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(125, 2),
(126, 2),
(127, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(178, 2),
(180, 2),
(181, 2),
(182, 2),
(183, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(196, 2),
(1, 4),
(3, 4),
(65, 4),
(67, 4),
(77, 4),
(78, 4),
(79, 4),
(89, 4),
(93, 4),
(129, 4),
(146, 4),
(174, 4),
(176, 4),
(17, 7),
(37, 7),
(41, 7),
(49, 7),
(53, 7),
(54, 7),
(55, 7),
(56, 7),
(69, 7),
(70, 7),
(71, 7),
(72, 7),
(73, 7),
(74, 7),
(75, 7),
(76, 7),
(97, 7),
(98, 7),
(99, 7),
(100, 7),
(101, 7),
(130, 7),
(131, 7),
(132, 7),
(133, 7),
(134, 7),
(135, 7),
(136, 7),
(137, 7),
(178, 7),
(17, 10),
(37, 10),
(41, 10),
(49, 10),
(53, 10),
(54, 10),
(55, 10),
(56, 10),
(69, 10),
(70, 10),
(71, 10),
(72, 10),
(73, 10),
(74, 10),
(75, 10),
(76, 10),
(97, 10),
(98, 10),
(99, 10),
(100, 10),
(101, 10),
(130, 10),
(131, 10),
(132, 10),
(133, 10),
(134, 10),
(135, 10),
(136, 10),
(137, 10),
(178, 10),
(17, 13),
(37, 13),
(41, 13),
(49, 13),
(53, 13),
(54, 13),
(55, 13),
(56, 13),
(69, 13),
(70, 13),
(71, 13),
(72, 13),
(73, 13),
(74, 13),
(75, 13),
(76, 13),
(97, 13),
(98, 13),
(99, 13),
(100, 13),
(101, 13),
(130, 13),
(131, 13),
(132, 13),
(133, 13),
(134, 13),
(135, 13),
(136, 13),
(137, 13),
(178, 13),
(17, 16),
(37, 16),
(41, 16),
(49, 16),
(53, 16),
(54, 16),
(55, 16),
(56, 16),
(69, 16),
(70, 16),
(71, 16),
(72, 16),
(73, 16),
(74, 16),
(75, 16),
(76, 16),
(97, 16),
(98, 16),
(99, 16),
(100, 16),
(101, 16),
(130, 16),
(131, 16),
(132, 16),
(133, 16),
(134, 16),
(135, 16),
(136, 16),
(137, 16),
(178, 16),
(17, 19),
(37, 19),
(41, 19),
(49, 19),
(53, 19),
(54, 19),
(55, 19),
(56, 19),
(69, 19),
(70, 19),
(71, 19),
(72, 19),
(73, 19),
(74, 19),
(75, 19),
(76, 19),
(97, 19),
(98, 19),
(99, 19),
(100, 19),
(101, 19),
(130, 19),
(131, 19),
(132, 19),
(133, 19),
(134, 19),
(135, 19),
(136, 19),
(137, 19),
(178, 19),
(17, 22),
(37, 22),
(41, 22),
(49, 22),
(53, 22),
(54, 22),
(55, 22),
(56, 22),
(69, 22),
(70, 22),
(71, 22),
(72, 22),
(73, 22),
(74, 22),
(75, 22),
(76, 22),
(97, 22),
(98, 22),
(99, 22),
(100, 22),
(101, 22),
(130, 22),
(131, 22),
(132, 22),
(133, 22),
(134, 22),
(135, 22),
(136, 22),
(137, 22),
(178, 22),
(17, 25),
(37, 25),
(41, 25),
(49, 25),
(53, 25),
(54, 25),
(55, 25),
(56, 25),
(69, 25),
(70, 25),
(71, 25),
(72, 25),
(73, 25),
(74, 25),
(75, 25),
(76, 25),
(97, 25),
(98, 25),
(99, 25),
(100, 25),
(101, 25),
(130, 25),
(131, 25),
(132, 25),
(133, 25),
(134, 25),
(135, 25),
(136, 25),
(137, 25),
(178, 25),
(17, 70),
(37, 70),
(41, 70),
(49, 70),
(53, 70),
(54, 70),
(55, 70),
(56, 70),
(69, 70),
(70, 70),
(71, 70),
(72, 70),
(73, 70),
(74, 70),
(75, 70),
(76, 70),
(97, 70),
(98, 70),
(99, 70),
(100, 70),
(101, 70),
(130, 70),
(131, 70),
(132, 70),
(133, 70),
(134, 70),
(135, 70),
(136, 70),
(137, 70),
(178, 70),
(17, 73),
(37, 73),
(41, 73),
(49, 73),
(53, 73),
(54, 73),
(55, 73),
(56, 73),
(69, 73),
(70, 73),
(71, 73),
(72, 73),
(73, 73),
(74, 73),
(75, 73),
(76, 73),
(97, 73),
(98, 73),
(99, 73),
(100, 73),
(101, 73),
(130, 73),
(131, 73),
(132, 73),
(133, 73),
(134, 73),
(135, 73),
(136, 73),
(137, 73),
(178, 73),
(17, 76),
(37, 76),
(41, 76),
(49, 76),
(53, 76),
(54, 76),
(55, 76),
(56, 76),
(69, 76),
(70, 76),
(71, 76),
(72, 76),
(73, 76),
(74, 76),
(75, 76),
(76, 76),
(97, 76),
(98, 76),
(99, 76),
(100, 76),
(101, 76),
(130, 76),
(131, 76),
(132, 76),
(133, 76),
(134, 76),
(135, 76),
(136, 76),
(137, 76),
(178, 76),
(17, 79),
(37, 79),
(41, 79),
(49, 79),
(53, 79),
(54, 79),
(55, 79),
(56, 79),
(69, 79),
(70, 79),
(71, 79),
(72, 79),
(73, 79),
(74, 79),
(75, 79),
(76, 79),
(97, 79),
(98, 79),
(99, 79),
(100, 79),
(101, 79),
(130, 79),
(131, 79),
(132, 79),
(133, 79),
(134, 79),
(135, 79),
(136, 79),
(137, 79),
(178, 79),
(17, 82),
(37, 82),
(41, 82),
(49, 82),
(53, 82),
(54, 82),
(55, 82),
(56, 82),
(69, 82),
(70, 82),
(71, 82),
(72, 82),
(73, 82),
(74, 82),
(75, 82),
(76, 82),
(97, 82),
(98, 82),
(99, 82),
(100, 82),
(101, 82),
(130, 82),
(131, 82),
(132, 82),
(133, 82),
(134, 82),
(135, 82),
(136, 82),
(137, 82),
(178, 82),
(138, 83),
(139, 83),
(140, 83),
(141, 83),
(142, 83),
(143, 83),
(144, 83),
(145, 83),
(17, 86),
(37, 86),
(41, 86),
(49, 86),
(53, 86),
(54, 86),
(55, 86),
(56, 86),
(69, 86),
(70, 86),
(71, 86),
(72, 86),
(73, 86),
(74, 86),
(75, 86),
(76, 86),
(97, 86),
(98, 86),
(99, 86),
(100, 86),
(101, 86),
(130, 86),
(131, 86),
(132, 86),
(133, 86),
(134, 86),
(135, 86),
(136, 86),
(137, 86),
(178, 86),
(17, 89),
(37, 89),
(41, 89),
(49, 89),
(53, 89),
(54, 89),
(55, 89),
(56, 89),
(69, 89),
(70, 89),
(71, 89),
(72, 89),
(73, 89),
(74, 89),
(75, 89),
(76, 89),
(97, 89),
(98, 89),
(99, 89),
(100, 89),
(101, 89),
(130, 89),
(131, 89),
(132, 89),
(133, 89),
(134, 89),
(135, 89),
(136, 89),
(137, 89),
(178, 89),
(17, 92),
(37, 92),
(41, 92),
(49, 92),
(53, 92),
(54, 92),
(55, 92),
(56, 92),
(69, 92),
(70, 92),
(71, 92),
(72, 92),
(73, 92),
(74, 92),
(75, 92),
(76, 92),
(97, 92),
(98, 92),
(99, 92),
(100, 92),
(101, 92),
(130, 92),
(131, 92),
(132, 92),
(133, 92),
(134, 92),
(135, 92),
(136, 92),
(137, 92),
(178, 92),
(17, 95),
(37, 95),
(41, 95),
(49, 95),
(53, 95),
(54, 95),
(55, 95),
(56, 95),
(69, 95),
(70, 95),
(71, 95),
(72, 95),
(73, 95),
(74, 95),
(75, 95),
(76, 95),
(97, 95),
(98, 95),
(99, 95),
(100, 95),
(101, 95),
(130, 95),
(131, 95),
(132, 95),
(133, 95),
(134, 95),
(135, 95),
(136, 95),
(137, 95),
(178, 95),
(17, 98),
(37, 98),
(41, 98),
(49, 98),
(53, 98),
(54, 98),
(55, 98),
(56, 98),
(69, 98),
(70, 98),
(71, 98),
(72, 98),
(73, 98),
(74, 98),
(75, 98),
(76, 98),
(97, 98),
(98, 98),
(99, 98),
(100, 98),
(101, 98),
(130, 98),
(131, 98),
(132, 98),
(133, 98),
(134, 98),
(135, 98),
(136, 98),
(137, 98),
(178, 98),
(17, 101),
(37, 101),
(41, 101),
(49, 101),
(53, 101),
(54, 101),
(55, 101),
(56, 101),
(69, 101),
(70, 101),
(71, 101),
(72, 101),
(73, 101),
(74, 101),
(75, 101),
(76, 101),
(97, 101),
(98, 101),
(99, 101),
(100, 101),
(101, 101),
(130, 101),
(131, 101),
(132, 101),
(133, 101),
(134, 101),
(135, 101),
(136, 101),
(137, 101),
(178, 101),
(1, 102),
(2, 102),
(3, 102),
(4, 102),
(5, 102),
(6, 102),
(7, 102),
(8, 102),
(9, 102),
(10, 102),
(11, 102),
(12, 102),
(13, 102),
(14, 102),
(15, 102),
(16, 102),
(17, 102),
(18, 102),
(19, 102),
(20, 102),
(21, 102),
(22, 102),
(23, 102),
(24, 102),
(25, 102),
(26, 102),
(27, 102),
(28, 102),
(29, 102),
(30, 102),
(31, 102),
(32, 102),
(33, 102),
(34, 102),
(35, 102),
(36, 102),
(37, 102),
(38, 102),
(39, 102),
(40, 102),
(41, 102),
(42, 102),
(43, 102),
(44, 102),
(17, 105),
(37, 105),
(41, 105),
(49, 105),
(53, 105),
(54, 105),
(55, 105),
(56, 105),
(69, 105),
(70, 105),
(71, 105),
(72, 105),
(73, 105),
(74, 105),
(75, 105),
(76, 105),
(97, 105),
(98, 105),
(99, 105),
(100, 105),
(101, 105),
(130, 105),
(131, 105),
(132, 105),
(133, 105),
(134, 105),
(135, 105),
(136, 105),
(137, 105),
(178, 105),
(17, 108),
(37, 108),
(41, 108),
(49, 108),
(53, 108),
(54, 108),
(55, 108),
(56, 108),
(69, 108),
(70, 108),
(71, 108),
(72, 108),
(73, 108),
(74, 108),
(75, 108),
(76, 108),
(97, 108),
(98, 108),
(99, 108),
(100, 108),
(101, 108),
(130, 108),
(131, 108),
(132, 108),
(133, 108),
(134, 108),
(135, 108),
(136, 108),
(137, 108),
(178, 108),
(17, 111),
(37, 111),
(41, 111),
(49, 111),
(53, 111),
(54, 111),
(55, 111),
(56, 111),
(69, 111),
(70, 111),
(71, 111),
(72, 111),
(73, 111),
(74, 111),
(75, 111),
(76, 111),
(97, 111),
(98, 111),
(99, 111),
(100, 111),
(101, 111),
(130, 111),
(131, 111),
(132, 111),
(133, 111),
(134, 111),
(135, 111),
(136, 111),
(137, 111),
(178, 111),
(17, 114),
(37, 114),
(41, 114),
(49, 114),
(53, 114),
(54, 114),
(55, 114),
(56, 114),
(69, 114),
(70, 114),
(71, 114),
(72, 114),
(73, 114),
(74, 114),
(75, 114),
(76, 114),
(97, 114),
(98, 114),
(99, 114),
(100, 114),
(101, 114),
(130, 114),
(131, 114),
(132, 114),
(133, 114),
(134, 114),
(135, 114),
(136, 114),
(137, 114),
(178, 114),
(17, 117),
(37, 117),
(41, 117),
(49, 117),
(53, 117),
(54, 117),
(55, 117),
(56, 117),
(69, 117),
(70, 117),
(71, 117),
(72, 117),
(73, 117),
(74, 117),
(75, 117),
(76, 117),
(97, 117),
(98, 117),
(99, 117),
(100, 117),
(101, 117),
(130, 117),
(131, 117),
(132, 117),
(133, 117),
(134, 117),
(135, 117),
(136, 117),
(137, 117),
(178, 117),
(17, 120),
(37, 120),
(41, 120),
(49, 120),
(53, 120),
(54, 120),
(55, 120),
(56, 120),
(69, 120),
(70, 120),
(71, 120),
(72, 120),
(73, 120),
(74, 120),
(75, 120),
(76, 120),
(97, 120),
(98, 120),
(99, 120),
(100, 120),
(101, 120),
(130, 120),
(131, 120),
(132, 120),
(133, 120),
(134, 120),
(135, 120),
(136, 120),
(137, 120),
(178, 120),
(162, 121),
(163, 121),
(164, 121),
(165, 121),
(196, 121),
(5, 122),
(6, 122),
(7, 122),
(8, 122),
(9, 122),
(10, 122),
(11, 122),
(12, 122),
(13, 122),
(14, 122),
(15, 122),
(16, 122),
(17, 122),
(18, 122),
(19, 122),
(20, 122),
(21, 122),
(22, 122),
(23, 122),
(24, 122),
(25, 122),
(26, 122),
(27, 122),
(28, 122),
(29, 122),
(30, 122),
(31, 122),
(32, 122),
(33, 122),
(34, 122),
(35, 122),
(36, 122),
(37, 122),
(38, 122),
(39, 122),
(40, 122),
(41, 122),
(42, 122),
(43, 122),
(44, 122),
(45, 122),
(49, 122),
(50, 122),
(51, 122),
(52, 122),
(53, 122),
(54, 122),
(55, 122),
(56, 122),
(57, 122),
(58, 122),
(59, 122),
(60, 122),
(61, 122),
(62, 122),
(63, 122),
(64, 122),
(81, 122),
(82, 122),
(83, 122),
(84, 122),
(85, 122),
(86, 122),
(87, 122),
(88, 122),
(101, 122),
(102, 122),
(103, 122),
(104, 122),
(105, 122),
(106, 122),
(107, 122),
(109, 122),
(111, 122),
(120, 122),
(121, 122),
(122, 122),
(123, 122),
(125, 122),
(126, 122),
(127, 122),
(130, 122),
(131, 122),
(132, 122),
(133, 122),
(134, 122),
(135, 122),
(136, 122),
(137, 122),
(138, 122),
(139, 122),
(140, 122),
(141, 122),
(142, 122),
(143, 122),
(144, 122),
(145, 122),
(146, 122),
(147, 122),
(148, 122),
(149, 122),
(150, 122),
(151, 122),
(152, 122),
(153, 122),
(154, 122),
(155, 122),
(156, 122),
(157, 122),
(158, 122),
(159, 122),
(160, 122),
(161, 122),
(166, 122),
(167, 122),
(168, 122),
(169, 122),
(170, 122),
(171, 122),
(172, 122),
(173, 122),
(178, 122),
(180, 122),
(181, 122),
(182, 122),
(183, 122),
(184, 122),
(185, 122),
(186, 122),
(187, 122),
(196, 122),
(17, 125),
(37, 125),
(41, 125),
(49, 125),
(53, 125),
(54, 125),
(55, 125),
(56, 125),
(69, 125),
(70, 125),
(71, 125),
(72, 125),
(73, 125),
(74, 125),
(75, 125),
(76, 125),
(97, 125),
(98, 125),
(99, 125),
(100, 125),
(101, 125),
(130, 125),
(131, 125),
(132, 125),
(133, 125),
(134, 125),
(135, 125),
(136, 125),
(137, 125),
(178, 125),
(17, 128),
(37, 128),
(41, 128),
(49, 128),
(53, 128),
(54, 128),
(55, 128),
(56, 128),
(69, 128),
(70, 128),
(71, 128),
(72, 128),
(73, 128),
(74, 128),
(75, 128),
(76, 128),
(97, 128),
(98, 128),
(99, 128),
(100, 128),
(101, 128),
(130, 128),
(131, 128),
(132, 128),
(133, 128),
(134, 128),
(135, 128),
(136, 128),
(137, 128),
(178, 128),
(17, 131),
(37, 131),
(41, 131),
(49, 131),
(53, 131),
(54, 131),
(55, 131),
(56, 131),
(69, 131),
(70, 131),
(71, 131),
(72, 131),
(73, 131),
(74, 131),
(75, 131),
(76, 131),
(97, 131),
(98, 131),
(99, 131),
(100, 131),
(101, 131),
(130, 131),
(131, 131),
(132, 131),
(133, 131),
(134, 131),
(135, 131),
(136, 131),
(137, 131),
(178, 131),
(17, 134),
(37, 134),
(41, 134),
(49, 134),
(53, 134),
(54, 134),
(55, 134),
(56, 134),
(69, 134),
(70, 134),
(71, 134),
(72, 134),
(73, 134),
(74, 134),
(75, 134),
(76, 134),
(97, 134),
(98, 134),
(99, 134),
(100, 134),
(101, 134),
(130, 134),
(131, 134),
(132, 134),
(133, 134),
(134, 134),
(135, 134),
(136, 134),
(137, 134),
(178, 134),
(17, 137),
(37, 137),
(41, 137),
(49, 137),
(53, 137),
(54, 137),
(55, 137),
(56, 137),
(69, 137),
(70, 137),
(71, 137),
(72, 137),
(73, 137),
(74, 137),
(75, 137),
(76, 137),
(97, 137),
(98, 137),
(99, 137),
(100, 137),
(101, 137),
(130, 137),
(131, 137),
(132, 137),
(133, 137),
(134, 137),
(135, 137),
(136, 137),
(137, 137),
(178, 137),
(17, 140),
(37, 140),
(41, 140),
(49, 140),
(53, 140),
(54, 140),
(55, 140),
(56, 140),
(69, 140),
(70, 140),
(71, 140),
(72, 140),
(73, 140),
(74, 140),
(75, 140),
(76, 140),
(97, 140),
(98, 140),
(99, 140),
(100, 140),
(101, 140),
(130, 140),
(131, 140),
(132, 140),
(133, 140),
(134, 140),
(135, 140),
(136, 140),
(137, 140),
(178, 140),
(17, 143),
(37, 143),
(41, 143),
(49, 143),
(53, 143),
(54, 143),
(55, 143),
(56, 143),
(69, 143),
(70, 143),
(71, 143),
(72, 143),
(73, 143),
(74, 143),
(75, 143),
(76, 143),
(97, 143),
(98, 143),
(99, 143),
(100, 143),
(101, 143),
(130, 143),
(131, 143),
(132, 143),
(133, 143),
(134, 143),
(135, 143),
(136, 143),
(137, 143),
(178, 143),
(17, 146),
(37, 146),
(41, 146),
(49, 146),
(53, 146),
(54, 146),
(55, 146),
(56, 146),
(69, 146),
(70, 146),
(71, 146),
(72, 146),
(73, 146),
(74, 146),
(75, 146),
(76, 146),
(97, 146),
(98, 146),
(99, 146),
(100, 146),
(101, 146),
(130, 146),
(131, 146),
(132, 146),
(133, 146),
(134, 146),
(135, 146),
(136, 146),
(137, 146),
(178, 146),
(17, 149),
(37, 149),
(41, 149),
(49, 149),
(53, 149),
(54, 149),
(55, 149),
(56, 149),
(69, 149),
(70, 149),
(71, 149),
(72, 149),
(73, 149),
(74, 149),
(75, 149),
(76, 149),
(97, 149),
(98, 149),
(99, 149),
(100, 149),
(101, 149),
(130, 149),
(131, 149),
(132, 149),
(133, 149),
(134, 149),
(135, 149),
(136, 149),
(137, 149),
(178, 149),
(17, 152),
(37, 152),
(41, 152),
(49, 152),
(53, 152),
(54, 152),
(55, 152),
(56, 152),
(69, 152),
(70, 152),
(71, 152),
(72, 152),
(73, 152),
(74, 152),
(75, 152),
(76, 152),
(97, 152),
(98, 152),
(99, 152),
(100, 152),
(101, 152),
(130, 152),
(131, 152),
(132, 152),
(133, 152),
(134, 152),
(135, 152),
(136, 152),
(137, 152),
(178, 152),
(17, 155),
(37, 155),
(41, 155),
(49, 155),
(53, 155),
(54, 155),
(55, 155),
(56, 155),
(69, 155),
(70, 155),
(71, 155),
(72, 155),
(73, 155),
(74, 155),
(75, 155),
(76, 155),
(97, 155),
(98, 155),
(99, 155),
(100, 155),
(101, 155),
(130, 155),
(131, 155),
(132, 155),
(133, 155),
(134, 155),
(135, 155),
(136, 155),
(137, 155),
(178, 155),
(17, 158),
(37, 158),
(41, 158),
(49, 158),
(53, 158),
(54, 158),
(55, 158),
(56, 158),
(69, 158),
(70, 158),
(71, 158),
(72, 158),
(73, 158),
(74, 158),
(75, 158),
(76, 158),
(97, 158),
(98, 158),
(99, 158),
(100, 158),
(101, 158),
(130, 158),
(131, 158),
(132, 158),
(133, 158),
(134, 158),
(135, 158),
(136, 158),
(137, 158),
(178, 158),
(17, 161),
(37, 161),
(41, 161),
(49, 161),
(53, 161),
(54, 161),
(55, 161),
(56, 161),
(69, 161),
(70, 161),
(71, 161),
(72, 161),
(73, 161),
(74, 161),
(75, 161),
(76, 161),
(97, 161),
(98, 161),
(99, 161),
(100, 161),
(101, 161),
(130, 161),
(131, 161),
(132, 161),
(133, 161),
(134, 161),
(135, 161),
(136, 161),
(137, 161),
(178, 161),
(17, 164),
(37, 164),
(41, 164),
(49, 164),
(53, 164),
(54, 164),
(55, 164),
(56, 164),
(69, 164),
(70, 164),
(71, 164),
(72, 164),
(73, 164),
(74, 164),
(75, 164),
(76, 164),
(97, 164),
(98, 164),
(99, 164),
(100, 164),
(101, 164),
(130, 164),
(131, 164),
(132, 164),
(133, 164),
(134, 164),
(135, 164),
(136, 164),
(137, 164),
(178, 164),
(17, 167),
(37, 167),
(41, 167),
(49, 167),
(53, 167),
(54, 167),
(55, 167),
(56, 167),
(69, 167),
(70, 167),
(71, 167),
(72, 167),
(73, 167),
(74, 167),
(75, 167),
(76, 167),
(97, 167),
(98, 167),
(99, 167),
(100, 167),
(101, 167),
(130, 167),
(131, 167),
(132, 167),
(133, 167),
(134, 167),
(135, 167),
(136, 167),
(137, 167),
(178, 167),
(17, 170),
(37, 170),
(41, 170),
(49, 170),
(53, 170),
(54, 170),
(55, 170),
(56, 170),
(69, 170),
(70, 170),
(71, 170),
(72, 170),
(73, 170),
(74, 170),
(75, 170),
(76, 170),
(97, 170),
(98, 170),
(99, 170),
(100, 170),
(101, 170),
(130, 170),
(131, 170),
(132, 170),
(133, 170),
(134, 170),
(135, 170),
(136, 170),
(137, 170),
(178, 170),
(17, 173),
(37, 173),
(41, 173),
(49, 173),
(53, 173),
(54, 173),
(55, 173),
(56, 173),
(69, 173),
(70, 173),
(71, 173),
(72, 173),
(73, 173),
(74, 173),
(75, 173),
(76, 173),
(97, 173),
(98, 173),
(99, 173),
(100, 173),
(101, 173),
(130, 173),
(131, 173),
(132, 173),
(133, 173),
(134, 173),
(135, 173),
(136, 173),
(137, 173),
(178, 173),
(17, 176),
(37, 176),
(41, 176),
(49, 176),
(53, 176),
(54, 176),
(55, 176),
(56, 176),
(69, 176),
(70, 176),
(71, 176),
(72, 176),
(73, 176),
(74, 176),
(75, 176),
(76, 176),
(97, 176),
(98, 176),
(99, 176),
(100, 176),
(101, 176),
(130, 176),
(131, 176),
(132, 176),
(133, 176),
(134, 176),
(135, 176),
(136, 176),
(137, 176),
(178, 176),
(17, 179),
(37, 179),
(41, 179),
(49, 179),
(53, 179),
(54, 179),
(55, 179),
(56, 179),
(69, 179),
(70, 179),
(71, 179),
(72, 179),
(73, 179),
(74, 179),
(75, 179),
(76, 179),
(97, 179),
(98, 179),
(99, 179),
(100, 179),
(101, 179),
(130, 179),
(131, 179),
(132, 179),
(133, 179),
(134, 179),
(135, 179),
(136, 179),
(137, 179),
(178, 179),
(17, 182),
(37, 182),
(41, 182),
(49, 182),
(53, 182),
(54, 182),
(55, 182),
(56, 182),
(69, 182),
(70, 182),
(71, 182),
(72, 182),
(73, 182),
(74, 182),
(75, 182),
(76, 182),
(97, 182),
(98, 182),
(99, 182),
(100, 182),
(101, 182),
(130, 182),
(131, 182),
(132, 182),
(133, 182),
(134, 182),
(135, 182),
(136, 182),
(137, 182),
(178, 182),
(17, 185),
(37, 185),
(41, 185),
(49, 185),
(53, 185),
(54, 185),
(55, 185),
(56, 185),
(69, 185),
(70, 185),
(71, 185),
(72, 185),
(73, 185),
(74, 185),
(75, 185),
(76, 185),
(97, 185),
(98, 185),
(99, 185),
(100, 185),
(101, 185),
(130, 185),
(131, 185),
(132, 185),
(133, 185),
(134, 185),
(135, 185),
(136, 185),
(137, 185),
(178, 185),
(17, 188),
(37, 188),
(41, 188),
(49, 188),
(53, 188),
(54, 188),
(55, 188),
(56, 188),
(69, 188),
(70, 188),
(71, 188),
(72, 188),
(73, 188),
(74, 188),
(75, 188),
(76, 188),
(97, 188),
(98, 188),
(99, 188),
(100, 188),
(101, 188),
(130, 188),
(131, 188),
(132, 188),
(133, 188),
(134, 188),
(135, 188),
(136, 188),
(137, 188),
(178, 188),
(17, 191),
(37, 191),
(41, 191),
(49, 191),
(53, 191),
(54, 191),
(55, 191),
(56, 191),
(69, 191),
(70, 191),
(71, 191),
(72, 191),
(73, 191),
(74, 191),
(75, 191),
(76, 191),
(97, 191),
(98, 191),
(99, 191),
(100, 191),
(101, 191),
(130, 191),
(131, 191),
(132, 191),
(133, 191),
(134, 191),
(135, 191),
(136, 191),
(137, 191),
(178, 191),
(17, 194),
(37, 194),
(41, 194),
(49, 194),
(53, 194),
(54, 194),
(55, 194),
(56, 194),
(69, 194),
(70, 194),
(71, 194),
(72, 194),
(73, 194),
(74, 194),
(75, 194),
(76, 194),
(97, 194),
(98, 194),
(99, 194),
(100, 194),
(101, 194),
(130, 194),
(131, 194),
(132, 194),
(133, 194),
(134, 194),
(135, 194),
(136, 194),
(137, 194),
(178, 194),
(17, 197),
(37, 197),
(41, 197),
(49, 197),
(53, 197),
(54, 197),
(55, 197),
(56, 197),
(69, 197),
(70, 197),
(71, 197),
(72, 197),
(73, 197),
(74, 197),
(75, 197),
(76, 197),
(97, 197),
(98, 197),
(99, 197),
(100, 197),
(101, 197),
(130, 197),
(131, 197),
(132, 197),
(133, 197),
(134, 197),
(135, 197),
(136, 197),
(137, 197),
(178, 197),
(17, 200),
(37, 200),
(41, 200),
(49, 200),
(53, 200),
(54, 200),
(55, 200),
(56, 200),
(69, 200),
(70, 200),
(71, 200),
(72, 200),
(73, 200),
(74, 200),
(75, 200),
(76, 200),
(97, 200),
(98, 200),
(99, 200),
(100, 200),
(101, 200),
(130, 200),
(131, 200),
(132, 200),
(133, 200),
(134, 200),
(135, 200),
(136, 200),
(137, 200),
(178, 200),
(17, 203),
(37, 203),
(41, 203),
(49, 203),
(53, 203),
(54, 203),
(55, 203),
(56, 203),
(69, 203),
(70, 203),
(71, 203),
(72, 203),
(73, 203),
(74, 203),
(75, 203),
(76, 203),
(97, 203),
(98, 203),
(99, 203),
(100, 203),
(101, 203),
(130, 203),
(131, 203),
(132, 203),
(133, 203),
(134, 203),
(135, 203),
(136, 203),
(137, 203),
(178, 203),
(17, 206),
(37, 206),
(41, 206),
(49, 206),
(53, 206),
(54, 206),
(55, 206),
(56, 206),
(69, 206),
(70, 206),
(71, 206),
(72, 206),
(73, 206),
(74, 206),
(75, 206),
(76, 206),
(97, 206),
(98, 206),
(99, 206),
(100, 206),
(101, 206),
(130, 206),
(131, 206),
(132, 206),
(133, 206),
(134, 206),
(135, 206),
(136, 206),
(137, 206),
(178, 206),
(17, 209),
(37, 209),
(41, 209),
(49, 209),
(53, 209),
(54, 209),
(55, 209),
(56, 209),
(69, 209),
(70, 209),
(71, 209),
(72, 209),
(73, 209),
(74, 209),
(75, 209),
(76, 209),
(97, 209),
(98, 209),
(99, 209),
(100, 209),
(101, 209),
(130, 209),
(131, 209),
(132, 209),
(133, 209),
(134, 209),
(135, 209),
(136, 209),
(137, 209),
(178, 209),
(17, 212),
(37, 212),
(41, 212),
(49, 212),
(53, 212),
(54, 212),
(55, 212),
(56, 212),
(69, 212),
(70, 212),
(71, 212),
(72, 212),
(73, 212),
(74, 212),
(75, 212),
(76, 212),
(97, 212),
(98, 212),
(99, 212),
(100, 212),
(101, 212),
(130, 212),
(131, 212),
(132, 212),
(133, 212),
(134, 212),
(135, 212),
(136, 212),
(137, 212),
(178, 212),
(17, 215),
(37, 215),
(41, 215),
(49, 215),
(53, 215),
(54, 215),
(55, 215),
(56, 215),
(69, 215),
(70, 215),
(71, 215),
(72, 215),
(73, 215),
(74, 215),
(75, 215),
(76, 215),
(97, 215),
(98, 215),
(99, 215),
(100, 215),
(101, 215),
(130, 215),
(131, 215),
(132, 215),
(133, 215),
(134, 215),
(135, 215),
(136, 215),
(137, 215),
(178, 215),
(17, 218),
(37, 218),
(41, 218),
(49, 218),
(53, 218),
(54, 218),
(55, 218),
(56, 218),
(69, 218),
(70, 218),
(71, 218),
(72, 218),
(73, 218),
(74, 218),
(75, 218),
(76, 218),
(97, 218),
(98, 218),
(99, 218),
(100, 218),
(101, 218),
(130, 218),
(131, 218),
(132, 218),
(133, 218),
(134, 218),
(135, 218),
(136, 218),
(137, 218),
(178, 218),
(17, 221),
(37, 221),
(41, 221),
(49, 221),
(53, 221),
(54, 221),
(55, 221),
(56, 221),
(69, 221),
(70, 221),
(71, 221),
(72, 221),
(73, 221),
(74, 221),
(75, 221),
(76, 221),
(97, 221),
(98, 221),
(99, 221),
(100, 221),
(101, 221),
(130, 221),
(131, 221),
(132, 221),
(133, 221),
(134, 221),
(135, 221),
(136, 221),
(137, 221),
(178, 221),
(17, 224),
(37, 224),
(41, 224),
(49, 224),
(53, 224),
(54, 224),
(55, 224),
(56, 224),
(69, 224),
(70, 224),
(71, 224),
(72, 224),
(73, 224),
(74, 224),
(75, 224),
(76, 224),
(97, 224),
(98, 224),
(99, 224),
(100, 224),
(101, 224),
(130, 224),
(131, 224),
(132, 224),
(133, 224),
(134, 224),
(135, 224),
(136, 224),
(137, 224),
(178, 224),
(17, 227),
(37, 227),
(41, 227),
(49, 227),
(53, 227),
(54, 227),
(55, 227),
(56, 227),
(69, 227),
(70, 227),
(71, 227),
(72, 227),
(73, 227),
(74, 227),
(75, 227),
(76, 227),
(97, 227),
(98, 227),
(99, 227),
(100, 227),
(101, 227),
(130, 227),
(131, 227),
(132, 227),
(133, 227),
(134, 227),
(135, 227),
(136, 227),
(137, 227),
(178, 227),
(17, 230),
(37, 230),
(41, 230),
(49, 230),
(53, 230),
(54, 230),
(55, 230),
(56, 230),
(69, 230),
(70, 230),
(71, 230),
(72, 230),
(73, 230),
(74, 230),
(75, 230),
(76, 230),
(97, 230),
(98, 230),
(99, 230),
(100, 230),
(101, 230),
(130, 230),
(131, 230),
(132, 230),
(133, 230),
(134, 230),
(135, 230),
(136, 230),
(137, 230),
(178, 230),
(17, 233),
(37, 233),
(41, 233),
(49, 233),
(53, 233),
(54, 233),
(55, 233),
(56, 233),
(69, 233),
(70, 233),
(71, 233),
(72, 233),
(73, 233),
(74, 233),
(75, 233),
(76, 233),
(97, 233),
(98, 233),
(99, 233),
(100, 233),
(101, 233),
(130, 233),
(131, 233),
(132, 233),
(133, 233),
(134, 233),
(135, 233),
(136, 233),
(137, 233),
(178, 233),
(17, 236),
(37, 236),
(41, 236),
(49, 236),
(53, 236),
(54, 236),
(55, 236),
(56, 236),
(69, 236),
(70, 236),
(71, 236),
(72, 236),
(73, 236),
(74, 236),
(75, 236),
(76, 236),
(97, 236),
(98, 236),
(99, 236),
(100, 236),
(101, 236),
(130, 236),
(131, 236),
(132, 236),
(133, 236),
(134, 236),
(135, 236),
(136, 236),
(137, 236),
(178, 236),
(17, 239),
(37, 239),
(41, 239),
(49, 239),
(53, 239),
(54, 239),
(55, 239),
(56, 239),
(69, 239),
(70, 239),
(71, 239),
(72, 239),
(73, 239),
(74, 239),
(75, 239),
(76, 239),
(97, 239),
(98, 239),
(99, 239),
(100, 239),
(101, 239),
(130, 239),
(131, 239),
(132, 239),
(133, 239),
(134, 239),
(135, 239),
(136, 239),
(137, 239),
(178, 239),
(17, 242),
(37, 242),
(41, 242),
(49, 242),
(53, 242),
(54, 242),
(55, 242),
(56, 242),
(69, 242),
(70, 242),
(71, 242),
(72, 242),
(73, 242),
(74, 242),
(75, 242),
(76, 242),
(97, 242),
(98, 242),
(99, 242),
(100, 242),
(101, 242),
(130, 242),
(131, 242),
(132, 242),
(133, 242),
(134, 242),
(135, 242),
(136, 242),
(137, 242),
(178, 242),
(17, 245),
(37, 245),
(41, 245),
(49, 245),
(53, 245),
(54, 245),
(55, 245),
(56, 245),
(69, 245),
(70, 245),
(71, 245),
(72, 245),
(73, 245),
(74, 245),
(75, 245),
(76, 245),
(97, 245),
(98, 245),
(99, 245),
(100, 245),
(101, 245),
(130, 245),
(131, 245),
(132, 245),
(133, 245),
(134, 245),
(135, 245),
(136, 245),
(137, 245),
(178, 245),
(17, 248),
(37, 248),
(41, 248),
(49, 248),
(53, 248),
(54, 248),
(55, 248),
(56, 248),
(69, 248),
(70, 248),
(71, 248),
(72, 248),
(73, 248),
(74, 248),
(75, 248),
(76, 248),
(97, 248),
(98, 248),
(99, 248),
(100, 248),
(101, 248),
(130, 248),
(131, 248),
(132, 248),
(133, 248),
(134, 248),
(135, 248),
(136, 248),
(137, 248),
(178, 248),
(17, 251),
(37, 251),
(41, 251),
(49, 251),
(53, 251),
(54, 251),
(55, 251),
(56, 251),
(69, 251),
(70, 251),
(71, 251),
(72, 251),
(73, 251),
(74, 251),
(75, 251),
(76, 251),
(97, 251),
(98, 251),
(99, 251),
(100, 251),
(101, 251),
(130, 251),
(131, 251),
(132, 251),
(133, 251),
(134, 251),
(135, 251),
(136, 251),
(137, 251),
(178, 251),
(17, 254),
(37, 254),
(41, 254),
(49, 254),
(53, 254),
(54, 254),
(55, 254),
(56, 254),
(69, 254),
(70, 254),
(71, 254),
(72, 254),
(73, 254),
(74, 254),
(75, 254),
(76, 254),
(97, 254),
(98, 254),
(99, 254),
(100, 254),
(101, 254),
(130, 254),
(131, 254),
(132, 254),
(133, 254),
(134, 254),
(135, 254),
(136, 254),
(137, 254),
(178, 254),
(17, 257),
(37, 257),
(41, 257),
(49, 257),
(53, 257),
(54, 257),
(55, 257),
(56, 257),
(69, 257),
(70, 257),
(71, 257),
(72, 257),
(73, 257),
(74, 257),
(75, 257),
(76, 257),
(97, 257),
(98, 257),
(99, 257),
(100, 257),
(101, 257),
(130, 257),
(131, 257),
(132, 257),
(133, 257),
(134, 257),
(135, 257),
(136, 257),
(137, 257),
(178, 257),
(17, 260),
(37, 260),
(41, 260),
(49, 260),
(53, 260),
(54, 260),
(55, 260),
(56, 260),
(69, 260),
(70, 260),
(71, 260),
(72, 260),
(73, 260),
(74, 260),
(75, 260),
(76, 260),
(97, 260),
(98, 260),
(99, 260),
(100, 260),
(101, 260),
(130, 260),
(131, 260),
(132, 260),
(133, 260),
(134, 260),
(135, 260),
(136, 260),
(137, 260),
(178, 260),
(17, 263),
(37, 263),
(41, 263),
(49, 263),
(53, 263),
(54, 263),
(55, 263),
(56, 263),
(69, 263),
(70, 263),
(71, 263),
(72, 263),
(73, 263),
(74, 263),
(75, 263),
(76, 263),
(97, 263),
(98, 263),
(99, 263),
(100, 263),
(101, 263),
(130, 263),
(131, 263),
(132, 263),
(133, 263),
(134, 263),
(135, 263),
(136, 263),
(137, 263),
(178, 263),
(17, 266),
(37, 266),
(41, 266),
(49, 266),
(53, 266),
(54, 266),
(55, 266),
(56, 266),
(69, 266),
(70, 266),
(71, 266),
(72, 266),
(73, 266),
(74, 266),
(75, 266),
(76, 266),
(97, 266),
(98, 266),
(99, 266),
(100, 266),
(101, 266),
(130, 266),
(131, 266),
(132, 266),
(133, 266),
(134, 266),
(135, 266),
(136, 266),
(137, 266),
(178, 266),
(17, 269),
(37, 269),
(41, 269),
(49, 269),
(53, 269),
(54, 269),
(55, 269),
(56, 269),
(69, 269),
(70, 269),
(71, 269),
(72, 269),
(73, 269),
(74, 269),
(75, 269),
(76, 269),
(97, 269),
(98, 269),
(99, 269),
(100, 269),
(101, 269),
(130, 269),
(131, 269),
(132, 269),
(133, 269),
(134, 269),
(135, 269),
(136, 269),
(137, 269),
(178, 269),
(17, 272),
(37, 272),
(41, 272),
(49, 272),
(53, 272),
(54, 272),
(55, 272),
(56, 272),
(69, 272),
(70, 272),
(71, 272),
(72, 272),
(73, 272),
(74, 272),
(75, 272),
(76, 272),
(97, 272),
(98, 272),
(99, 272),
(100, 272),
(101, 272),
(130, 272),
(131, 272),
(132, 272),
(133, 272),
(134, 272),
(135, 272),
(136, 272),
(137, 272),
(178, 272),
(17, 275),
(37, 275),
(41, 275),
(49, 275),
(53, 275),
(54, 275),
(55, 275),
(56, 275),
(69, 275),
(70, 275),
(71, 275),
(72, 275),
(73, 275),
(74, 275),
(75, 275),
(76, 275),
(97, 275),
(98, 275),
(99, 275),
(100, 275),
(101, 275),
(130, 275),
(131, 275),
(132, 275),
(133, 275),
(134, 275),
(135, 275),
(136, 275),
(137, 275),
(178, 275),
(17, 278),
(37, 278),
(41, 278),
(49, 278),
(53, 278),
(54, 278),
(55, 278),
(56, 278),
(69, 278),
(70, 278),
(71, 278),
(72, 278),
(73, 278),
(74, 278),
(75, 278),
(76, 278),
(97, 278),
(98, 278),
(99, 278),
(100, 278),
(101, 278),
(130, 278),
(131, 278),
(132, 278),
(133, 278),
(134, 278),
(135, 278),
(136, 278),
(137, 278),
(178, 278),
(17, 281),
(37, 281),
(41, 281),
(49, 281),
(53, 281),
(54, 281),
(55, 281),
(56, 281),
(69, 281),
(70, 281),
(71, 281),
(72, 281),
(73, 281),
(74, 281),
(75, 281),
(76, 281),
(97, 281),
(98, 281),
(99, 281),
(100, 281),
(101, 281),
(130, 281),
(131, 281),
(132, 281),
(133, 281),
(134, 281),
(135, 281),
(136, 281),
(137, 281),
(178, 281),
(17, 284),
(37, 284),
(41, 284),
(49, 284),
(53, 284),
(54, 284),
(55, 284),
(56, 284),
(69, 284),
(70, 284),
(71, 284),
(72, 284),
(73, 284),
(74, 284),
(75, 284),
(76, 284),
(97, 284),
(98, 284),
(99, 284),
(100, 284),
(101, 284),
(130, 284),
(131, 284),
(132, 284),
(133, 284),
(134, 284),
(135, 284),
(136, 284),
(137, 284),
(178, 284),
(17, 287),
(37, 287),
(41, 287),
(49, 287),
(53, 287),
(54, 287),
(55, 287),
(56, 287),
(69, 287),
(70, 287),
(71, 287),
(72, 287),
(73, 287),
(74, 287),
(75, 287),
(76, 287),
(97, 287),
(98, 287),
(99, 287),
(100, 287),
(101, 287),
(130, 287),
(131, 287),
(132, 287),
(133, 287),
(134, 287),
(135, 287),
(136, 287),
(137, 287),
(178, 287),
(17, 290),
(37, 290),
(41, 290),
(49, 290),
(53, 290),
(54, 290),
(55, 290),
(56, 290),
(69, 290),
(70, 290),
(71, 290),
(72, 290),
(73, 290),
(74, 290),
(75, 290),
(76, 290),
(97, 290),
(98, 290),
(99, 290),
(100, 290),
(101, 290),
(130, 290),
(131, 290),
(132, 290),
(133, 290),
(134, 290),
(135, 290),
(136, 290),
(137, 290),
(178, 290),
(17, 293),
(37, 293),
(41, 293),
(49, 293),
(53, 293),
(54, 293),
(55, 293),
(56, 293),
(69, 293),
(70, 293),
(71, 293),
(72, 293),
(73, 293),
(74, 293),
(75, 293),
(76, 293),
(97, 293),
(98, 293),
(99, 293),
(100, 293),
(101, 293),
(130, 293),
(131, 293),
(132, 293),
(133, 293),
(134, 293),
(135, 293),
(136, 293),
(137, 293),
(178, 293),
(17, 296),
(37, 296),
(41, 296),
(49, 296),
(53, 296),
(54, 296),
(55, 296),
(56, 296),
(69, 296),
(70, 296),
(71, 296),
(72, 296),
(73, 296),
(74, 296),
(75, 296),
(76, 296),
(97, 296),
(98, 296),
(99, 296),
(100, 296),
(101, 296),
(130, 296),
(131, 296),
(132, 296),
(133, 296),
(134, 296),
(135, 296),
(136, 296),
(137, 296),
(178, 296);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL COMMENT 'user_id',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Deactivate, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `address`, `support_phone`, `support_email`, `tagline`, `logo`, `admin_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'International', '554 Rue Dro', '237657546330', 'support@taaply.com', 'Work Hard', 'school/666d7daac6b849.681391461718451626.png', 2, 1, '2024-06-15 20:54:13', '2024-06-19 19:58:13', '2024-06-19 19:58:13'),
(2, 'Good School', 'Miran-je Town\r\nKangni Wala bazar', '03010617687', 'talhaamir393@gmail.com', 'Love', 'no_image_available.jpg', 6, 1, '2024-06-17 23:46:05', '2024-06-18 05:33:03', '2024-06-18 05:33:03'),
(3, 'Talha Amir', 'Miran-je Town\r\nKangni Wala bazar', '03010617687', 'romailbhatti226@gmail.com', 'Good', 'school/6670976cedc545.961269571718654828.png', 11, 1, '2024-06-18 05:37:09', '2024-06-18 05:52:26', '2024-06-18 05:52:26'),
(4, 'Good School', 'Miran-je Town\r\nKangni Wala bazar', '03010617687', 'adminschool@gmail.com', 'Good', 'school/6672a36a239750.130138531718788970.png', 12, 1, '2024-06-18 05:55:21', '2024-06-25 00:28:38', '2024-06-25 00:28:38'),
(5, 'Delete this one', 'Rail, Bonaberi, Douala, Cameroon', '677024205', 'archangelschool2018@gmail.com', 'Primary School', 'no_image_available.jpg', 24, 1, '2024-06-19 19:03:48', '2024-07-31 22:46:34', '2024-07-31 22:46:34'),
(6, 'Test School', 'frrf', '65955541545', 'info@taaply.com', 'rfrf', 'no_image_available.jpg', 25, 1, '2024-06-19 20:09:55', '2024-06-25 00:28:30', '2024-06-25 00:28:30'),
(7, 'Erasmus School of Science', 'HEH', '682907698', 'leke.asong@gmail.com', 'Hi', 'no_image_available.jpg', 26, 1, '2024-06-20 07:06:08', '2024-06-25 00:29:24', '2024-06-25 00:29:24'),
(22, 'Dummy School', 'Xyz', '03421680442', 'husnaingeek@gmail.com', 'Dummy Tagline', 'school/667885dfa8a736.972212081719174623.png', 41, 1, '2024-06-24 06:00:23', '2024-06-27 19:14:09', '2024-06-27 19:14:09'),
(23, 'Husnain Ameen', 'Bahria town, Lahore', '1234567890', 'husnainameen862@gmail.com', 'Laboriosam facilis', 'school/6678906de526b0.480102961719177325.png', 42, 0, '2024-06-24 06:45:26', '2024-06-27 19:14:01', '2024-06-27 19:14:01'),
(24, 'Husnain Ameen', 'Bahria town, Lahore', '1234567889', 'husnainameen862+1@gmail.com', 'Eiusmod dolorum fugi', 'school/667890e0a4bff2.057526311719177440.png', 43, 0, '2024-06-24 06:47:20', '2024-06-27 19:13:50', '2024-06-27 19:13:50'),
(25, 'Husnain Ameen', 'Bahria town, Lahore', '1234567889', 'husnainameen862+2@gmail.com', 'Qui dolor ex recusan', 'school/667891c3e11939.285433821719177667.png', 44, 0, '2024-06-24 06:51:08', '2024-06-27 19:14:15', '2024-06-27 19:14:15'),
(26, 'Trial School', 'skej', '658928394', 'info@trial.com', 'he', 'no_image_available.jpg', 45, 1, '2024-06-24 07:23:16', '2024-06-27 19:13:43', '2024-06-27 19:13:43'),
(27, 'IUGET', 'Bonamoussadi', '678783846', 'mboujikodorimaine@gmail.com', 'Bien choisir c\'est déjà réussir', 'no_image_available.jpg', 68, 1, '2024-06-24 23:03:18', '2024-06-24 23:03:18', NULL),
(28, 'Random', 'r', '654789456', 'random@gmail.com', 'e', 'no_image_available.jpg', 69, 1, '2024-06-25 00:18:18', '2024-06-27 19:13:35', '2024-06-27 19:13:35'),
(29, 'Delete this one', 'romail@gmail.com', '1234567890', 'romail@gmail.com', 'romail@gmail.com', 'school/6679a2335d7f30.788559341719247411.PNG', 73, 1, '2024-06-25 02:13:31', '2024-07-31 22:44:59', '2024-07-31 22:44:59'),
(30, 'Hero', 'hero', '123', 'r@gmail.com', 'hero', 'school/667a4d96205ad1.489063471719291286.PNG', 82, 1, '2024-06-25 14:24:46', '2024-06-27 19:13:17', '2024-06-27 19:13:17'),
(31, 'Delete this one', 'Rue Bebey Elame', '657546330', 'taaplydouala@gmail.com', 'Educate, Learn, Succeed', 'no_image_available.jpg', 89, 1, '2024-06-26 02:35:29', '2024-07-31 22:45:07', '2024-07-31 22:45:07'),
(32, 'Archangels Bilingual Nursery and Primary School', 'Ndobo, Carrefour Sergio Polo, Bonaberi, Douala', '653544544', 'archangelschool@gmail.com', 'Discipline, Enlighten, Empower', 'no_image_available.jpg', 100, 1, '2024-06-27 00:51:56', '2024-06-27 00:51:56', NULL),
(33, 'Taaply Higher Education', '4903 June Dr', '657546330', 'g@g.com', 'Check', 'no_image_available.jpg', 105, 1, '2024-07-01 18:08:45', '2024-07-01 18:08:45', NULL),
(34, 'DDF', 'Cité des palmiers', '656329711', 'laurineyeumou@gmail.com', 'Réussir par la grâce de DIEU', 'no_image_available.jpg', 106, 1, '2024-07-01 18:43:55', '2024-07-01 18:43:55', NULL),
(35, 'Ip', 'Ok', '695438832', 'rh.professionnel@yahoo.fr', 'Ok', 'no_image_available.jpg', 107, 1, '2024-07-03 21:09:31', '2024-07-03 21:09:32', NULL),
(36, 'Taaply University', '4903 June Dr', '14803423232', 'support@taaply.com', 'Excellence Through Education', 'no_image_available.jpg', 109, 1, '2024-07-04 16:11:51', '2024-07-04 16:11:51', NULL),
(37, 'Taaply Congo', 'Poto poto Brazzaville', '067366521', 'support.congo@taaply.com', 'Go digital solutions', 'no_image_available.jpg', 110, 1, '2024-07-18 22:47:50', '2024-07-18 22:47:50', NULL),
(38, 'ANDRE MALRAUX', 'Abidjan, cocody, riviera attoban', '0708592565', 'jean.michel.tiapo@gmail.com', 'L\'école de l\'avenir', 'no_image_available.jpg', 111, 1, '2024-07-20 07:26:22', '2024-07-20 07:26:22', NULL),
(39, 'Groupe CEFOR', 'Deido grand moulin', '695767078', 'info@cefor.cm', 'École internationale de cuisine', 'no_image_available.jpg', 123, 1, '2024-07-23 00:30:36', '2024-07-23 00:30:36', NULL),
(40, 'Sf', 'Cvv', '44445555555555', 'dff@dff.com', 'Fc', 'no_image_available.jpg', 124, 1, '2024-08-10 14:45:24', '2024-08-10 14:45:24', NULL),
(41, 'TedIdofe', 'City', '86582536724', 'kayleighbpsteamship@gmail.com', 'Прывітанне, я хацеў даведацца Ваш прайс.', 'no_image_available.jpg', 125, 1, '2024-09-08 22:32:52', '2024-09-08 22:32:52', NULL),
(42, 'MasonIdofe', 'City', '84481696219', 'yjdisantoyjdissemin@gmail.com', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', 'no_image_available.jpg', 126, 1, '2024-09-22 15:32:02', '2024-09-22 15:32:03', NULL),
(43, 'WilliamGuift', 'Falmouth', '89433362127', 'eee666@rambler.ru', 'Very Short', 'no_image_available.jpg', 127, 1, '2024-09-25 21:58:58', '2024-09-25 21:58:58', NULL),
(44, 'gorridaGuift', 'Torrent', '88468941814', 'dmtest005@rambler.ru', 'Very Short', 'no_image_available.jpg', 128, 1, '2024-09-26 22:47:08', '2024-09-26 22:47:08', NULL),
(45, 'fernnostiGuift', 'Tallin', '84729187323', 'l2test004@rambler.ru', 'Very Long', 'no_image_available.jpg', 129, 1, '2024-09-27 06:35:16', '2024-09-27 06:35:16', NULL),
(46, 'Dianesob', 'Moscow', '85131913567', 'ivan337moscow@gmail.com', 'НПФ «Созидание»\r\n \r\n \r\nНадежный источник информации о пенсионных накоплениях. Мы предлагаем советы по выбору лучших НПФ и разъясняем правила начисления пенсий. Поспешите ухнать, как обеспечит', 'no_image_available.jpg', 130, 1, '2024-09-30 05:44:02', '2024-09-30 05:44:02', NULL),
(47, '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', 'Beijing', '88216139248', 'thomaskingial13@gmail.com', '<strong><a href=\"https://pr-site.com\">primer-8</a></strong>', 'no_image_available.jpg', 131, 1, '2024-09-30 06:36:03', '2024-09-30 06:36:03', NULL),
(48, 'RobertIdofe', 'Mtskheta', '89748798994', 'cmcleyva@gmail.com', 'Szia, meg akartam tudni az árát.', 'no_image_available.jpg', 132, 1, '2024-10-07 13:17:49', '2024-10-07 13:17:49', NULL),
(49, 'Joannemal', 'Moscow', '87612674586', 'ivan5443moscow@gmail.com', 'https://images.google.as/url?q=https://go-tango.ru/ \r\nhttps://images.google.off.ai/url?q=https://go-tango.ru/ \r\nhttps://images.google.com.ag/url?q=https://go-tango.ru/ \r\nhttps://images.google', 'no_image_available.jpg', 133, 1, '2024-10-13 02:26:48', '2024-10-13 02:26:48', NULL),
(50, 'TedIdofe', 'City', '83658814397', 'axobajigufo34@gmail.com', 'Ciao, volevo sapere il tuo prezzo.', 'no_image_available.jpg', 134, 1, '2024-10-14 17:03:38', '2024-10-14 17:03:38', NULL),
(51, 'MasonIdofe', 'City', '82422261466', 'yawiviseya67@gmail.com', 'Hi, I wanted to know your price.', 'no_image_available.jpg', 135, 1, '2024-10-15 22:36:48', '2024-10-15 22:36:48', NULL),
(52, 'MasonIdofe', 'City', '85964653985', 'ebojajuje04@gmail.com', 'Hi, I wanted to know your price.', 'no_image_available.jpg', 136, 1, '2024-10-16 01:58:57', '2024-10-16 01:58:57', NULL),
(53, 'MasonIdofe', 'City', '85796585198', 'duqotayowud23@gmail.com', 'Ciao, volevo sapere il tuo prezzo.', 'no_image_available.jpg', 137, 1, '2024-10-16 15:26:32', '2024-10-16 15:26:32', NULL),
(54, 'MasonIdofe', 'City', '81439788426', 'somasesokiyo31@gmail.com', 'Salam, qiymətinizi bilmək istədim.', 'no_image_available.jpg', 138, 1, '2024-10-23 15:46:44', '2024-10-23 15:46:44', NULL),
(55, 'DavidIdofe', 'Mtskheta', '85232285438', 'ibucezevuda439@gmail.com', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', 'no_image_available.jpg', 139, 1, '2024-10-28 06:56:53', '2024-10-28 06:56:53', NULL),
(56, 'Michealprell', 'Bamako', '81159813487', 'raymondUtitari@gmail.com', 'Hi! taaply.education \r\n \r\nDid you know that it is possible to send request appropriately legitimate way? \r\nWhen such proposals are sent, no personal data is used and messages are directed to ', 'no_image_available.jpg', 140, 1, '2024-10-29 11:55:07', '2024-10-29 11:55:07', NULL),
(57, 'Brianfuh', 'Garhoud', '85712653663', 'm.ega.st.o.p.l.a.y@gmail.com', '4AqH6px8UNDTUn2w8LUY', 'no_image_available.jpg', 141, 1, '2024-11-09 12:02:15', '2024-11-09 12:02:15', NULL),
(58, 'Rithy Olsg Ard', '1930 CAMINITO DEL PILAR', '+13232696924', 'zmabmbmbsiuj@dont-reply.me', 'I m scared shitless drops of the same good You', 'no_image_available.jpg', 142, 1, '2024-11-17 15:46:12', '2024-11-17 15:46:12', NULL),
(59, 'Aleks Plekhov', 'Bottegone', '85752199113', 'abc@eforum.top', 'Have you ever thought about what kind of gift can leave a lifelong impression on a child? Today, as 100 years ago, the true treasure in the world remains the book, and in modern life - the di', 'no_image_available.jpg', 143, 1, '2024-11-30 10:07:01', '2024-11-30 10:07:02', NULL),
(60, 'Mike Babcock', 'Albany', '81789464378', 'mikexxxx@gmail.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s ', 'no_image_available.jpg', 144, 1, '2024-12-01 22:36:27', '2024-12-01 22:36:27', NULL),
(61, 'Newton Poole', 'Klimmen', '85411527651', 'melaniefell51@gmail.com', 'Hello!! \r\nMy name is Newton Poole, I work as the Research and Procurement Pharmacist in a pharmaceutical company. I am writing to extend a business request to you.  I am looking for a trustwo', 'no_image_available.jpg', 145, 1, '2024-12-03 22:13:35', '2024-12-03 22:13:35', NULL),
(62, 'crypto7icede', 'New York', '85663986783', '777@zel.biz', 'I love that crypto transactions can be fast and low-cost.  \r\n<a href=https://t.me/cryptonetlake>https://t.me/cryptonetlake</a>', 'no_image_available.jpg', 146, 1, '2024-12-05 10:34:45', '2024-12-05 10:34:45', NULL),
(63, 'Maxence Breezee', '439 BEARDSLEY CIR', '+17302164053', 'bzrzsbmsejuj@dont-reply.me', 'It was whistling and the Great Patriotic near me by the dark smudge parted at', 'no_image_available.jpg', 147, 1, '2024-12-16 11:15:22', '2024-12-16 11:15:23', NULL),
(64, 'TedIdofe', 'City', '81413118639', 'moqagides18@gmail.com', 'Zdravo, htio sam znati vašu cijenu.', 'no_image_available.jpg', 148, 1, '2024-12-17 20:04:33', '2024-12-17 20:04:34', NULL),
(65, 'Andrzej Peitsalo', '5395 FOX HOLLOW CT', '+19839969018', 'bbsjeriemjuj@do-not-respond.me', 'The grunts having parted at the situation Does', 'no_image_available.jpg', 149, 1, '2024-12-21 07:23:40', '2024-12-21 07:23:40', NULL),
(66, 'JohnIdofe', 'City', '85743857311', 'arikerer278@gmail.com', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 'no_image_available.jpg', 150, 1, '2024-12-22 04:47:25', '2024-12-22 04:47:25', NULL),
(67, 'Nikhama Jochen', '77 riverview dr', '+17306157734', 'bamlsaelijuj@dont-reply.me', 'AKM suffers from the stream The most of the wire Thirty men were already on the hunger', 'no_image_available.jpg', 151, 1, '2024-12-26 09:17:14', '2024-12-26 09:17:14', NULL),
(68, 'Gafiyat Casci', '1942 Great Plains Way', '+17302163826', 'bleseamrbjuj@do-not-respond.me', 'Sanych s cattle was to you apparently the Railway Station the Christ', 'no_image_available.jpg', 152, 1, '2024-12-31 14:22:37', '2024-12-31 14:22:37', NULL),
(69, 'Mike Oscar Willems', 'Kaohsiung Municipality', '81235982359', 'info@professionalseocleanup.com', 'Improve your website`s ranks totally free \r\n \r\nMessage: \r\nHi there, \r\n \r\nWhile checking your taaply.education for its ranks, I have noticed that there are some toxic links pointing towards it', 'no_image_available.jpg', 153, 1, '2025-01-01 10:23:08', '2025-01-01 10:23:08', NULL),
(70, 'Jandell Arcineda', '3644 ALBION AVE', '+15056445794', 'rjaasiijjjuj@do-not-respond.me', 'Sanych somewhat fatherly lectured me something medieval wakes up at the', 'no_image_available.jpg', 154, 1, '2025-01-06 10:34:30', '2025-01-06 10:34:30', NULL),
(71, 'Mike Per Petitson', 'Kakamega', '88784973557', 'mike@monkeydigital.co', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepen', 'no_image_available.jpg', 155, 1, '2025-01-16 19:06:55', '2025-01-16 19:06:55', NULL),
(72, 'Mike Swen Weber', 'Willemstad', '89978497257', 'info@strictlydigital.net', 'Hi there \r\n \r\nHaving some bunch of links pointing to taaply.education could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the a', 'no_image_available.jpg', 156, 1, '2025-01-18 22:07:29', '2025-01-18 22:07:29', NULL),
(73, 'MARWIN BILINGUAL COLLEGE(MBC)', 'Nyalla', '621009082', 'info@mbc.cm', 'MBC', 'no_image_available.jpg', 157, 1, '2025-01-20 22:40:09', '2025-01-20 22:40:09', NULL),
(74, 'Mike Leon De Smet', 'Albany', '81285481532', 'info@speed-seo.net', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s ', 'no_image_available.jpg', 158, 1, '2025-01-23 13:13:47', '2025-01-23 13:13:47', NULL),
(75, 'Vaness Calb', '18611 N 22nd St Lot 32', '+15053799792', 'azmlemllajuj@dont-reply.me', 'I m also For Fyodor burst in the', 'no_image_available.jpg', 159, 1, '2025-01-25 00:36:25', '2025-01-25 00:36:25', NULL),
(76, 'Nakye Perellon', '6368 Westland Rd', '+17306068863', 'aiaabzzmmjuj@dont-reply.me', 'It means the running shooting hook and for the third one with my', 'no_image_available.jpg', 160, 1, '2025-01-29 13:34:27', '2025-01-29 13:34:27', NULL),
(77, 'Mendi Legree', '3562 WOODS WALK BLVD', '+14722411371', 'allblzlaijuj@dont-reply.me', 'Now I m depressed just some sensed the world bursts of nicotine plugs Go for', 'no_image_available.jpg', 161, 1, '2025-01-31 10:57:52', '2025-01-31 10:57:52', NULL),
(78, 'Luis Alves', 'Willemstad', '84728488897', 'intl.law7@aol.com', 'Dear Sir/Madam, \r\nIt is my utmost desire in engaging this moment to introduce to you myself as well our Firm. \r\nMy name is Luis Alves, a private investment Consultant. I\'m contacting you to i', 'no_image_available.jpg', 162, 1, '2025-02-03 23:17:14', '2025-02-03 23:17:14', NULL),
(79, 'Mike Sven-Erik Frangois', 'Boston', '89123254755', 'info@digitalxflow.com', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your web', 'no_image_available.jpg', 163, 1, '2025-02-06 08:00:21', '2025-02-06 08:00:21', NULL),
(80, 'Thomas Seligman', 'Le Mans', '83528655731', 'thomas.seligman@mail.com', 'Hello, \r\nI am Thomas Seligman, a financial consultant at Seligman Capital. I help companies raise funds to grow or maximize their value in a strategic sale. \r\nAt Seligman Capital, we have acc', 'no_image_available.jpg', 164, 1, '2025-02-11 14:04:52', '2025-02-11 14:04:52', NULL),
(81, 'Nicholas Doby', 'Kalamaria', '81388683979', 'dobyfinancial@sendnow.win', 'Greetings, Mr./Ms. \r\n \r\nI’m Nicholas Doby from an investment consultancy. We connect clients globally with low or no-interest loans to help achieve your goals. Whether for personal or busines', 'no_image_available.jpg', 165, 1, '2025-02-12 09:55:57', '2025-02-12 09:55:58', NULL),
(82, 'Yasuhiro Yamada', 'Ennis', '87683927449', 'rohtopharmaceutical@via.tokyo.jp', 'Greetings, Mr./Ms. \r\n \r\nWith all due respect. We are looking for a Spokesperson/Financial Coordinator for ROHTO Pharmaceutical Co., Ltd. based in the USA, Canada, or Europe. This part-time ro', 'no_image_available.jpg', 166, 1, '2025-02-12 10:00:43', '2025-02-12 10:00:43', NULL),
(83, 'Amandaflastec', 'Stung Treng', '81687966545', 'amandawemicets3@gmail.com', 'I’ve been waiting to feel your touch… ready? -  https://rb.gy/es66fc?rear', 'no_image_available.jpg', 167, 1, '2025-02-14 04:46:24', '2025-02-14 04:46:24', NULL),
(84, 'Mike Oscar Schmidt', 'Willemstad', '88755397324', 'check-message3323@gmail.com', 'Hello, \r\n \r\nThis is Mike Oakman\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site ', 'no_image_available.jpg', 168, 1, '2025-02-16 09:44:44', '2025-02-16 09:44:44', NULL),
(85, 'Mike Lars Johansson', 'Willemstad', '86872616959', 'check-message7819@gmail.com', 'Hi there \r\n \r\nHaving some bunch of links pointing to taaply.education could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the a', 'no_image_available.jpg', 169, 1, '2025-02-16 13:17:46', '2025-02-16 13:17:46', NULL),
(86, 'GeorgeIdofe', 'City', '87766947287', 'ocopesuq299@gmail.com', 'Hi, kam dashur të di çmimin tuaj', 'no_image_available.jpg', 170, 1, '2025-02-17 15:28:58', '2025-02-17 15:28:58', NULL),
(87, 'MyName', 'NtjQr FslZwm Hxp oFjsvXDO Yqhoh aQGKmt', '407', 'uppicqib@do-not-respond.me', 'uFBHZR tFkkcYR CcSZ VqVH', 'no_image_available.jpg', 182, 1, '2025-03-02 10:56:19', '2025-03-02 10:56:19', NULL),
(88, 'Ernestshigo', 'Arcatao', '88869169315', 'pr.ogon0809@gmail.com', 'Long, Buzzed', 'no_image_available.jpg', 183, 1, '2025-03-04 02:44:36', '2025-03-04 02:44:36', NULL),
(89, 'ThomasBoivy', 'Mariupol', '83384689122', 'progon0809@gmail.com', 'Long, Medium', 'no_image_available.jpg', 184, 1, '2025-03-04 13:09:48', '2025-03-04 13:09:48', NULL),
(90, 'FrancisowEst', 'Albany', '88672743921', 'nomin.momin+328n9@mail.ru', 'Nfwhdkjdwj rdqskwjfej wkdwodkwkifjejr okeowjrfiejfiej rowjedowkrfiejfi jrowkorwkjrfejfi jorkdworefoijfeijfowek okdwofjiejgierjfoe taaply.education', 'no_image_available.jpg', 185, 1, '2025-03-05 12:42:23', '2025-03-05 12:42:24', NULL),
(91, 'Mike Giinter Visser', 'Boston', '88882431551', 'info@digital-x-press.com', 'Greetings, \r\n \r\nI realize that many have difficulty understanding that SEO requires time and a methodical monthly approach. \r\n \r\nSadly, very few webmasters have the patience to witness the sl', 'no_image_available.jpg', 196, 1, '2025-03-09 17:08:42', '2025-03-09 17:08:43', NULL),
(92, '* * * Unlock Free Spins Today: https://www.itboo.kz/uploads/git9r5.php?9zmeb * * * hs=277e9cd2be265011b72039396bca3af6*', 'h2xpci', 'tqhve2', 'pazapz@mailbox.in.ua', 'k8e3h0', 'no_image_available.jpg', 197, 1, '2025-03-10 15:02:39', '2025-03-10 15:02:39', NULL),
(93, 'Williamlat', 'Mankon Bamenda', '83528962827', 'barb.oursundin@gmail.com', 'Long, Medium', 'no_image_available.jpg', 198, 1, '2025-03-13 00:57:53', '2025-03-13 00:57:53', NULL),
(94, 'ByKnIsk', 'USA', '86891979954', 'brosjonson@mail.ru', 'Help me get 1000 subscribers - https://t.me/+8YD4vOIJpnk4ZmVh \r\n \r\nIn my channel I share information about promotion, marketing, crypto and personal life. \r\n \r\nThank you, good person! \r\n \r\nHe', 'no_image_available.jpg', 199, 1, '2025-03-19 10:34:34', '2025-03-19 10:34:34', NULL),
(95, 'John', 'uqMGTP VNKz BDfKM', '68', 'tkexiekb@do-not-respond.me', 'hjMLZPHV AxRWeFRt BZT eIDdr zbs HoVPGCtL PSYjnLo', 'no_image_available.jpg', 200, 1, '2025-03-20 00:19:07', '2025-03-20 00:19:07', NULL),
(96, 'Kevin Barber', 'Hi Taaply,\r\n\r\nMost business owners pour money into marketing that doesn’t work. They run ads, post on social media, and hope for the best—only to be disappointed by the results. \r\n\r\nThe probl', '467586270', 'chinner.renato@yahoo.com', 'Hi Taaply,\r\n\r\nMost business owners pour money into marketing that doesn’t work. They run ads, post on social media, and hope for the best—only to be disappointed by the results. \r\n\r\nThe probl', 'no_image_available.jpg', 216, 1, '2025-03-25 14:12:13', '2025-03-25 14:12:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_settings`
--

CREATE TABLE `school_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'datatype like string , file etc',
  `school_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_settings`
--

INSERT INTO `school_settings` (`id`, `name`, `data`, `type`, `school_id`) VALUES
(1, 'school_name', 'Test School', 'string', 1),
(2, 'school_email', 'support@taaply.com', 'string', 1),
(3, 'school_phone', '657546330', 'number', 1),
(4, 'school_tagline', 'Test School', 'string', 1),
(5, 'school_address', '554 Rue Dro', 'string', 1),
(6, 'session_year', '1', 'number', 1),
(7, 'horizontal_logo', 'horizontal_logo.png', 'file', 1),
(8, 'vertical_logo', 'vertical_logo.png', 'file', 1),
(9, 'timetable_start_time', '09:00:00', 'time', 1),
(10, 'timetable_end_time', '18:00:00', 'time', 1),
(11, 'timetable_duration', '01:00:00', 'time', 1),
(12, 'auto_renewal_plan', '1', 'integer', 1),
(13, 'currency_code', 'INR', 'string', 1),
(14, 'currency_symbol', '₹', 'string', 1),
(15, 'school_name', 'Good School', 'string', 2),
(16, 'school_email', 'talhaamir393@gmail.com', 'string', 2),
(17, 'school_phone', '03010617687', 'number', 2),
(18, 'school_tagline', 'Good School', 'string', 2),
(19, 'school_address', 'Miran-je Town\r\nKangni Wala bazar', 'string', 2),
(20, 'session_year', '2', 'number', 2),
(21, 'horizontal_logo', 'horizontal_logo.png', 'file', 2),
(22, 'vertical_logo', 'vertical_logo.png', 'file', 2),
(23, 'timetable_start_time', '09:00:00', 'time', 2),
(24, 'timetable_end_time', '18:00:00', 'time', 2),
(25, 'timetable_duration', '01:00:00', 'time', 2),
(26, 'auto_renewal_plan', '1', 'integer', 2),
(27, 'currency_code', 'INR', 'string', 2),
(28, 'currency_symbol', '₹', 'string', 2),
(29, 'school_name', 'Talha Amir', 'string', 3),
(30, 'school_email', 'romailbhatti226@gmail.com', 'string', 3),
(31, 'school_phone', '03010617687', 'number', 3),
(32, 'school_tagline', 'Talha Amir', 'string', 3),
(33, 'school_address', 'Miran-je Town\r\nKangni Wala bazar', 'string', 3),
(34, 'session_year', '3', 'number', 3),
(35, 'horizontal_logo', 'horizontal_logo.png', 'file', 3),
(36, 'vertical_logo', 'vertical_logo.png', 'file', 3),
(37, 'timetable_start_time', '09:00:00', 'time', 3),
(38, 'timetable_end_time', '18:00:00', 'time', 3),
(39, 'timetable_duration', '01:00:00', 'time', 3),
(40, 'auto_renewal_plan', '1', 'integer', 3),
(41, 'currency_code', 'INR', 'string', 3),
(42, 'currency_symbol', '₹', 'string', 3),
(43, 'school_name', 'Good School', 'string', 4),
(44, 'school_email', 'adminschool@gmail.com', 'string', 4),
(45, 'school_phone', '03010617687', 'number', 4),
(46, 'school_tagline', 'Good School', 'string', 4),
(47, 'school_address', 'Miran-je Town\r\nKangni Wala bazar', 'string', 4),
(48, 'session_year', '4', 'number', 4),
(49, 'horizontal_logo', 'horizontal_logo.png', 'file', 4),
(50, 'vertical_logo', 'vertical_logo.png', 'file', 4),
(51, 'timetable_start_time', '09:00:00', 'time', 4),
(52, 'timetable_end_time', '18:00:00', 'time', 4),
(53, 'timetable_duration', '01:00:00', 'time', 4),
(54, 'auto_renewal_plan', '1', 'integer', 4),
(55, 'currency_code', 'INR', 'string', 4),
(56, 'currency_symbol', '₹', 'string', 4),
(60, 'school_name', 'Archangel School', 'string', 5),
(61, 'school_email', 'archangelschool2018@gmail.com', 'string', 5),
(62, 'school_phone', '677024205', 'number', 5),
(63, 'school_tagline', 'Archangel School', 'string', 5),
(64, 'school_address', 'Rail, Bonaberi, Douala, Cameroon', 'string', 5),
(65, 'session_year', '5', 'number', 5),
(66, 'horizontal_logo', 'horizontal_logo.png', 'file', 5),
(67, 'vertical_logo', 'vertical_logo.png', 'file', 5),
(68, 'timetable_start_time', '09:00:00', 'time', 5),
(69, 'timetable_end_time', '18:00:00', 'time', 5),
(70, 'timetable_duration', '01:00:00', 'time', 5),
(71, 'auto_renewal_plan', '1', 'integer', 5),
(72, 'currency_code', 'INR', 'string', 5),
(73, 'currency_symbol', '₹', 'string', 5),
(74, 'school_name', 'Test School', 'string', 6),
(75, 'school_email', 'info@taaply.com', 'string', 6),
(76, 'school_phone', '65955541545', 'number', 6),
(77, 'school_tagline', 'Test School', 'string', 6),
(78, 'school_address', 'frrf', 'string', 6),
(79, 'session_year', '6', 'number', 6),
(80, 'horizontal_logo', 'horizontal_logo.png', 'file', 6),
(81, 'vertical_logo', 'vertical_logo.png', 'file', 6),
(82, 'timetable_start_time', '09:00:00', 'time', 6),
(83, 'timetable_end_time', '18:00:00', 'time', 6),
(84, 'timetable_duration', '01:00:00', 'time', 6),
(85, 'auto_renewal_plan', '1', 'integer', 6),
(86, 'currency_code', 'USD', 'string', 6),
(87, 'currency_symbol', '₹', 'string', 6),
(88, 'school_name', 'Erasmus School of Science', 'string', 7),
(89, 'school_email', 'leke.asong@gmail.com', 'string', 7),
(90, 'school_phone', '682907698', 'number', 7),
(91, 'school_tagline', 'Erasmus School of Science', 'string', 7),
(92, 'school_address', 'HEH', 'string', 7),
(93, 'session_year', '7', 'number', 7),
(94, 'horizontal_logo', 'horizontal_logo.png', 'file', 7),
(95, 'vertical_logo', 'vertical_logo.png', 'file', 7),
(96, 'timetable_start_time', '09:00:00', 'time', 7),
(97, 'timetable_end_time', '18:00:00', 'time', 7),
(98, 'timetable_duration', '01:00:00', 'time', 7),
(99, 'auto_renewal_plan', '1', 'integer', 7),
(100, 'currency_code', 'INR', 'string', 7),
(101, 'currency_symbol', '₹', 'string', 7),
(301, 'school_name', 'Dummy School', 'string', 22),
(302, 'school_email', 'husnaingeek@gmail.com', 'string', 22),
(303, 'school_phone', '03421680442', 'number', 22),
(304, 'school_tagline', 'Dummy School', 'string', 22),
(305, 'school_address', 'Xyz', 'string', 22),
(306, 'session_year', '23', 'number', 22),
(307, 'horizontal_logo', 'horizontal_logo.png', 'file', 22),
(308, 'vertical_logo', 'vertical_logo.png', 'file', 22),
(309, 'timetable_start_time', '09:00:00', 'time', 22),
(310, 'timetable_end_time', '18:00:00', 'time', 22),
(311, 'timetable_duration', '01:00:00', 'time', 22),
(312, 'auto_renewal_plan', '1', 'integer', 22),
(313, 'currency_code', 'INR', 'string', 22),
(314, 'currency_symbol', '₹', 'string', 22),
(315, 'school_name', 'Husnain Ameen', 'string', 23),
(316, 'school_email', 'husnainameen862@gmail.com', 'string', 23),
(317, 'school_phone', '1234567890', 'number', 23),
(318, 'school_tagline', 'Husnain Ameen', 'string', 23),
(319, 'school_address', 'Bahria town, Lahore', 'string', 23),
(320, 'session_year', '24', 'number', 23),
(321, 'horizontal_logo', 'horizontal_logo.png', 'file', 23),
(322, 'vertical_logo', 'vertical_logo.png', 'file', 23),
(323, 'timetable_start_time', '09:00:00', 'time', 23),
(324, 'timetable_end_time', '18:00:00', 'time', 23),
(325, 'timetable_duration', '01:00:00', 'time', 23),
(326, 'auto_renewal_plan', '1', 'integer', 23),
(327, 'currency_code', 'INR', 'string', 23),
(328, 'currency_symbol', '₹', 'string', 23),
(329, 'school_name', 'Husnain Ameen', 'string', 24),
(330, 'school_email', 'husnainameen862+1@gmail.com', 'string', 24),
(331, 'school_phone', '1234567889', 'number', 24),
(332, 'school_tagline', 'Husnain Ameen', 'string', 24),
(333, 'school_address', 'Bahria town, Lahore', 'string', 24),
(334, 'session_year', '25', 'number', 24),
(335, 'horizontal_logo', 'horizontal_logo.png', 'file', 24),
(336, 'vertical_logo', 'vertical_logo.png', 'file', 24),
(337, 'timetable_start_time', '09:00:00', 'time', 24),
(338, 'timetable_end_time', '18:00:00', 'time', 24),
(339, 'timetable_duration', '01:00:00', 'time', 24),
(340, 'auto_renewal_plan', '1', 'integer', 24),
(341, 'currency_code', 'INR', 'string', 24),
(342, 'currency_symbol', '₹', 'string', 24),
(343, 'school_name', 'Husnain Ameen', 'string', 25),
(344, 'school_email', 'husnainameen862+2@gmail.com', 'string', 25),
(345, 'school_phone', '1234567889', 'number', 25),
(346, 'school_tagline', 'Husnain Ameen', 'string', 25),
(347, 'school_address', 'Bahria town, Lahore', 'string', 25),
(348, 'session_year', '26', 'number', 25),
(349, 'horizontal_logo', 'horizontal_logo.png', 'file', 25),
(350, 'vertical_logo', 'vertical_logo.png', 'file', 25),
(351, 'timetable_start_time', '09:00:00', 'time', 25),
(352, 'timetable_end_time', '18:00:00', 'time', 25),
(353, 'timetable_duration', '01:00:00', 'time', 25),
(354, 'auto_renewal_plan', '1', 'integer', 25),
(355, 'currency_code', 'INR', 'string', 25),
(356, 'currency_symbol', '₹', 'string', 25),
(357, 'school_name', 'Trial School', 'string', 26),
(358, 'school_email', 'info@trial.com', 'string', 26),
(359, 'school_phone', '658928394', 'number', 26),
(360, 'school_tagline', 'Trial School', 'string', 26),
(361, 'school_address', 'skej', 'string', 26),
(362, 'session_year', '27', 'number', 26),
(363, 'horizontal_logo', 'horizontal_logo.png', 'file', 26),
(364, 'vertical_logo', 'vertical_logo.png', 'file', 26),
(365, 'timetable_start_time', '09:00:00', 'time', 26),
(366, 'timetable_end_time', '18:00:00', 'time', 26),
(367, 'timetable_duration', '01:00:00', 'time', 26),
(368, 'auto_renewal_plan', '1', 'integer', 26),
(369, 'currency_code', 'XAF', 'string', 26),
(370, 'currency_symbol', 'XAF', 'string', 26),
(380, 'school_name', 'IUGET', 'string', 27),
(381, 'school_email', 'mboujikodorimaine@gmail.com', 'string', 27),
(382, 'school_phone', '678783846', 'number', 27),
(383, 'school_tagline', 'IUGET', 'string', 27),
(384, 'school_address', 'Bonamoussadi', 'string', 27),
(385, 'session_year', '29', 'number', 27),
(386, 'horizontal_logo', 'horizontal_logo.png', 'file', 27),
(387, 'vertical_logo', 'vertical_logo.png', 'file', 27),
(388, 'timetable_start_time', '09:00:00', 'time', 27),
(389, 'timetable_end_time', '18:00:00', 'time', 27),
(390, 'timetable_duration', '01:00:00', 'time', 27),
(391, 'auto_renewal_plan', '1', 'integer', 27),
(392, 'currency_code', 'INR', 'string', 27),
(393, 'currency_symbol', '₹', 'string', 27),
(394, 'school_name', 'Random', 'string', 28),
(395, 'school_email', 'random@gmail.com', 'string', 28),
(396, 'school_phone', '654789456', 'number', 28),
(397, 'school_tagline', 'Random', 'string', 28),
(398, 'school_address', 'r', 'string', 28),
(399, 'session_year', '31', 'number', 28),
(400, 'horizontal_logo', 'horizontal_logo.png', 'file', 28),
(401, 'vertical_logo', 'vertical_logo.png', 'file', 28),
(402, 'timetable_start_time', '09:00:00', 'time', 28),
(403, 'timetable_end_time', '18:00:00', 'time', 28),
(404, 'timetable_duration', '01:00:00', 'time', 28),
(405, 'auto_renewal_plan', '1', 'integer', 28),
(406, 'currency_code', 'INR', 'string', 28),
(407, 'currency_symbol', '₹', 'string', 28),
(408, 'school_name', 'Romail\'s School', 'string', 29),
(409, 'school_email', 'romail@gmail.com', 'string', 29),
(410, 'school_phone', '1234567890', 'number', 29),
(411, 'school_tagline', 'Romail\'s School', 'string', 29),
(412, 'school_address', 'romail@gmail.com', 'string', 29),
(413, 'session_year', '32', 'number', 29),
(414, 'horizontal_logo', 'horizontal_logo.png', 'file', 29),
(415, 'vertical_logo', 'vertical_logo.png', 'file', 29),
(416, 'timetable_start_time', '09:00:00', 'time', 29),
(417, 'timetable_end_time', '18:00:00', 'time', 29),
(418, 'timetable_duration', '01:00:00', 'time', 29),
(419, 'auto_renewal_plan', '1', 'integer', 29),
(420, 'currency_code', 'INR', 'string', 29),
(421, 'currency_symbol', '₹', 'string', 29),
(423, 'school_name', 'Hero', 'string', 30),
(424, 'school_email', 'r@gmail.com', 'string', 30),
(425, 'school_phone', '123', 'number', 30),
(426, 'school_tagline', 'Hero', 'string', 30),
(427, 'school_address', 'hero', 'string', 30),
(428, 'session_year', '33', 'number', 30),
(429, 'horizontal_logo', 'horizontal_logo.png', 'file', 30),
(430, 'vertical_logo', 'vertical_logo.png', 'file', 30),
(431, 'timetable_start_time', '09:00:00', 'time', 30),
(432, 'timetable_end_time', '18:00:00', 'time', 30),
(433, 'timetable_duration', '01:00:00', 'time', 30),
(434, 'auto_renewal_plan', '1', 'integer', 30),
(435, 'currency_code', 'INR', 'string', 30),
(436, 'currency_symbol', '₹', 'string', 30),
(441, 'school_name', 'Houston Community College', 'string', 31),
(442, 'school_email', 'taaplydouala@gmail.com', 'string', 31),
(443, 'school_phone', '657546330', 'number', 31),
(444, 'school_tagline', 'Houston Community College', 'string', 31),
(445, 'school_address', 'Rue Bebey Elame', 'string', 31),
(446, 'session_year', '36', 'number', 31),
(447, 'horizontal_logo', 'horizontal_logo.png', 'file', 31),
(448, 'vertical_logo', 'vertical_logo.png', 'file', 31),
(449, 'timetable_start_time', '09:00:00', 'time', 31),
(450, 'timetable_end_time', '18:00:00', 'time', 31),
(451, 'timetable_duration', '01:00:00', 'time', 31),
(452, 'auto_renewal_plan', '1', 'integer', 31),
(453, 'currency_code', 'INR', 'string', 31),
(454, 'currency_symbol', '₹', 'string', 31),
(455, 'school_name', 'Archangels Bilingual Nursery and Primary School', 'string', 32),
(456, 'school_email', 'archangelschool@gmail.com', 'string', 32),
(457, 'school_phone', '653544544', 'number', 32),
(458, 'school_tagline', 'Archangels Bilingual Nursery and Primary School', 'string', 32),
(459, 'school_address', 'Ndobo, Carrefour Sergio Polo, Bonaberi, Douala', 'string', 32),
(460, 'session_year', '37', 'number', 32),
(461, 'horizontal_logo', 'horizontal_logo.png', 'file', 32),
(462, 'vertical_logo', 'vertical_logo.png', 'file', 32),
(463, 'timetable_start_time', '08:00:00', 'time', 32),
(464, 'timetable_end_time', '14:30:00', 'time', 32),
(465, 'timetable_duration', '00:30:00', 'time', 32),
(466, 'auto_renewal_plan', '1', 'integer', 32),
(467, 'currency_code', 'INR', 'string', 32),
(468, 'currency_symbol', '₹', 'string', 32),
(472, 'school_name', 'Taaply Higher Education', 'string', 33),
(473, 'school_email', 'g@g.com', 'string', 33),
(474, 'school_phone', '657546330', 'number', 33),
(475, 'school_tagline', 'Taaply Higher Education', 'string', 33),
(476, 'school_address', '4903 June Dr', 'string', 33),
(477, 'session_year', '39', 'number', 33),
(478, 'horizontal_logo', 'horizontal_logo.png', 'file', 33),
(479, 'vertical_logo', 'vertical_logo.png', 'file', 33),
(480, 'timetable_start_time', '09:00:00', 'time', 33),
(481, 'timetable_end_time', '13:00:00', 'time', 33),
(482, 'timetable_duration', '00:30:00', 'time', 33),
(483, 'auto_renewal_plan', '0', 'integer', 33),
(484, 'currency_code', 'INR', 'string', 33),
(485, 'currency_symbol', '₹', 'string', 33),
(486, 'school_name', 'DDF', 'string', 34),
(487, 'school_email', 'laurineyeumou@gmail.com', 'string', 34),
(488, 'school_phone', '656329711', 'number', 34),
(489, 'school_tagline', 'DDF', 'string', 34),
(490, 'school_address', 'Cité des palmiers', 'string', 34),
(491, 'session_year', '41', 'number', 34),
(492, 'horizontal_logo', 'horizontal_logo.png', 'file', 34),
(493, 'vertical_logo', 'vertical_logo.png', 'file', 34),
(494, 'timetable_start_time', '09:00:00', 'time', 34),
(495, 'timetable_end_time', '18:00:00', 'time', 34),
(496, 'timetable_duration', '01:00:00', 'time', 34),
(497, 'auto_renewal_plan', '1', 'integer', 34),
(498, 'currency_code', 'INR', 'string', 34),
(499, 'currency_symbol', '₹', 'string', 34),
(500, 'school_name', 'Ip', 'string', 35),
(501, 'school_email', 'rh.professionnel@yahoo.fr', 'string', 35),
(502, 'school_phone', '695438832', 'number', 35),
(503, 'school_tagline', 'Ip', 'string', 35),
(504, 'school_address', 'Ok', 'string', 35),
(505, 'session_year', '43', 'number', 35),
(506, 'horizontal_logo', 'horizontal_logo.png', 'file', 35),
(507, 'vertical_logo', 'vertical_logo.png', 'file', 35),
(508, 'timetable_start_time', '09:00:00', 'time', 35),
(509, 'timetable_end_time', '18:00:00', 'time', 35),
(510, 'timetable_duration', '01:00:00', 'time', 35),
(511, 'auto_renewal_plan', '1', 'integer', 35),
(512, 'currency_code', 'INR', 'string', 35),
(513, 'currency_symbol', '₹', 'string', 35),
(514, 'school_name', 'Taaply University', 'string', 36),
(515, 'school_email', 'support@taaply.com', 'string', 36),
(516, 'school_phone', '14803423232', 'number', 36),
(517, 'school_tagline', 'Taaply University', 'string', 36),
(518, 'school_address', '4903 June Dr', 'string', 36),
(519, 'session_year', '44', 'number', 36),
(520, 'horizontal_logo', 'horizontal_logo.png', 'file', 36),
(521, 'vertical_logo', 'vertical_logo.png', 'file', 36),
(522, 'timetable_start_time', '09:00:00', 'time', 36),
(523, 'timetable_end_time', '18:00:00', 'time', 36),
(524, 'timetable_duration', '01:00:00', 'time', 36),
(525, 'auto_renewal_plan', '1', 'integer', 36),
(526, 'currency_code', 'INR', 'string', 36),
(527, 'currency_symbol', '₹', 'string', 36),
(528, 'school_name', 'Taaply Congo', 'string', 37),
(529, 'school_email', 'support.congo@taaply.com', 'string', 37),
(530, 'school_phone', '067366521', 'number', 37),
(531, 'school_tagline', 'Taaply Congo', 'string', 37),
(532, 'school_address', 'Poto poto Brazzaville', 'string', 37),
(533, 'session_year', '46', 'number', 37),
(534, 'horizontal_logo', 'horizontal_logo.png', 'file', 37),
(535, 'vertical_logo', 'vertical_logo.png', 'file', 37),
(536, 'timetable_start_time', '09:00:00', 'time', 37),
(537, 'timetable_end_time', '18:00:00', 'time', 37),
(538, 'timetable_duration', '01:00:00', 'time', 37),
(539, 'auto_renewal_plan', '1', 'integer', 37),
(540, 'currency_code', 'INR', 'string', 37),
(541, 'currency_symbol', '₹', 'string', 37),
(542, 'school_name', 'ANDRE MALRAUX', 'string', 38),
(543, 'school_email', 'jean.michel.tiapo@gmail.com', 'string', 38),
(544, 'school_phone', '0708592565', 'number', 38),
(545, 'school_tagline', 'ANDRE MALRAUX', 'string', 38),
(546, 'school_address', 'Abidjan, cocody, riviera attoban', 'string', 38),
(547, 'session_year', '47', 'number', 38),
(548, 'horizontal_logo', 'horizontal_logo.png', 'file', 38),
(549, 'vertical_logo', 'vertical_logo.png', 'file', 38),
(550, 'timetable_start_time', '09:00:00', 'time', 38),
(551, 'timetable_end_time', '18:00:00', 'time', 38),
(552, 'timetable_duration', '01:00:00', 'time', 38),
(553, 'auto_renewal_plan', '1', 'integer', 38),
(554, 'currency_code', 'INR', 'string', 38),
(555, 'currency_symbol', '₹', 'string', 38),
(559, 'school_name', 'Groupe CEFOR', 'string', 39),
(560, 'school_email', 'info@cefor.cm', 'string', 39),
(561, 'school_phone', '695767078', 'number', 39),
(562, 'school_tagline', 'Groupe CEFOR', 'string', 39),
(563, 'school_address', 'Deido grand moulin', 'string', 39),
(564, 'session_year', '49', 'number', 39),
(565, 'horizontal_logo', 'horizontal_logo.png', 'file', 39),
(566, 'vertical_logo', 'vertical_logo.png', 'file', 39),
(567, 'timetable_start_time', '09:00:00', 'time', 39),
(568, 'timetable_end_time', '18:00:00', 'time', 39),
(569, 'timetable_duration', '01:00:00', 'time', 39),
(570, 'auto_renewal_plan', '1', 'integer', 39),
(571, 'currency_code', 'INR', 'string', 39),
(572, 'currency_symbol', '₹', 'string', 39),
(574, 'school_name', 'Sf', 'string', 40),
(575, 'school_email', 'dff@dff.com', 'string', 40),
(576, 'school_phone', '44445555555555', 'number', 40),
(577, 'school_tagline', 'Sf', 'string', 40),
(578, 'school_address', 'Cvv', 'string', 40),
(579, 'session_year', '50', 'number', 40),
(580, 'horizontal_logo', 'horizontal_logo.png', 'file', 40),
(581, 'vertical_logo', 'vertical_logo.png', 'file', 40),
(582, 'timetable_start_time', '09:00:00', 'time', 40),
(583, 'timetable_end_time', '18:00:00', 'time', 40),
(584, 'timetable_duration', '01:00:00', 'time', 40),
(585, 'auto_renewal_plan', '1', 'integer', 40),
(586, 'currency_code', 'INR', 'string', 40),
(587, 'currency_symbol', '₹', 'string', 40),
(589, 'school_name', 'TedIdofe', 'string', 41),
(590, 'school_email', 'kayleighbpsteamship@gmail.com', 'string', 41),
(591, 'school_phone', '86582536724', 'number', 41),
(592, 'school_tagline', 'TedIdofe', 'string', 41),
(593, 'school_address', 'City', 'string', 41),
(594, 'session_year', '51', 'number', 41),
(595, 'horizontal_logo', 'horizontal_logo.png', 'file', 41),
(596, 'vertical_logo', 'vertical_logo.png', 'file', 41),
(597, 'timetable_start_time', '09:00:00', 'time', 41),
(598, 'timetable_end_time', '18:00:00', 'time', 41),
(599, 'timetable_duration', '01:00:00', 'time', 41),
(600, 'auto_renewal_plan', '1', 'integer', 41),
(601, 'currency_code', 'INR', 'string', 41),
(602, 'currency_symbol', '₹', 'string', 41),
(603, 'school_name', 'MasonIdofe', 'string', 42),
(604, 'school_email', 'yjdisantoyjdissemin@gmail.com', 'string', 42),
(605, 'school_phone', '84481696219', 'number', 42),
(606, 'school_tagline', 'MasonIdofe', 'string', 42),
(607, 'school_address', 'City', 'string', 42),
(608, 'session_year', '52', 'number', 42),
(609, 'horizontal_logo', 'horizontal_logo.png', 'file', 42),
(610, 'vertical_logo', 'vertical_logo.png', 'file', 42),
(611, 'timetable_start_time', '09:00:00', 'time', 42),
(612, 'timetable_end_time', '18:00:00', 'time', 42),
(613, 'timetable_duration', '01:00:00', 'time', 42),
(614, 'auto_renewal_plan', '1', 'integer', 42),
(615, 'currency_code', 'INR', 'string', 42),
(616, 'currency_symbol', '₹', 'string', 42),
(617, 'school_name', 'WilliamGuift', 'string', 43),
(618, 'school_email', 'eee666@rambler.ru', 'string', 43),
(619, 'school_phone', '89433362127', 'number', 43),
(620, 'school_tagline', 'WilliamGuift', 'string', 43),
(621, 'school_address', 'Falmouth', 'string', 43),
(622, 'session_year', '53', 'number', 43),
(623, 'horizontal_logo', 'horizontal_logo.png', 'file', 43),
(624, 'vertical_logo', 'vertical_logo.png', 'file', 43),
(625, 'timetable_start_time', '09:00:00', 'time', 43),
(626, 'timetable_end_time', '18:00:00', 'time', 43),
(627, 'timetable_duration', '01:00:00', 'time', 43),
(628, 'auto_renewal_plan', '1', 'integer', 43),
(629, 'currency_code', 'INR', 'string', 43),
(630, 'currency_symbol', '₹', 'string', 43),
(631, 'school_name', 'gorridaGuift', 'string', 44),
(632, 'school_email', 'dmtest005@rambler.ru', 'string', 44),
(633, 'school_phone', '88468941814', 'number', 44),
(634, 'school_tagline', 'gorridaGuift', 'string', 44),
(635, 'school_address', 'Torrent', 'string', 44),
(636, 'session_year', '54', 'number', 44),
(637, 'horizontal_logo', 'horizontal_logo.png', 'file', 44),
(638, 'vertical_logo', 'vertical_logo.png', 'file', 44),
(639, 'timetable_start_time', '09:00:00', 'time', 44),
(640, 'timetable_end_time', '18:00:00', 'time', 44),
(641, 'timetable_duration', '01:00:00', 'time', 44),
(642, 'auto_renewal_plan', '1', 'integer', 44),
(643, 'currency_code', 'INR', 'string', 44),
(644, 'currency_symbol', '₹', 'string', 44),
(645, 'school_name', 'fernnostiGuift', 'string', 45),
(646, 'school_email', 'l2test004@rambler.ru', 'string', 45),
(647, 'school_phone', '84729187323', 'number', 45),
(648, 'school_tagline', 'fernnostiGuift', 'string', 45),
(649, 'school_address', 'Tallin', 'string', 45),
(650, 'session_year', '55', 'number', 45),
(651, 'horizontal_logo', 'horizontal_logo.png', 'file', 45),
(652, 'vertical_logo', 'vertical_logo.png', 'file', 45),
(653, 'timetable_start_time', '09:00:00', 'time', 45),
(654, 'timetable_end_time', '18:00:00', 'time', 45),
(655, 'timetable_duration', '01:00:00', 'time', 45),
(656, 'auto_renewal_plan', '1', 'integer', 45),
(657, 'currency_code', 'INR', 'string', 45),
(658, 'currency_symbol', '₹', 'string', 45),
(659, 'school_name', 'Dianesob', 'string', 46),
(660, 'school_email', 'ivan337moscow@gmail.com', 'string', 46),
(661, 'school_phone', '85131913567', 'number', 46),
(662, 'school_tagline', 'Dianesob', 'string', 46),
(663, 'school_address', 'Moscow', 'string', 46),
(664, 'session_year', '56', 'number', 46),
(665, 'horizontal_logo', 'horizontal_logo.png', 'file', 46),
(666, 'vertical_logo', 'vertical_logo.png', 'file', 46),
(667, 'timetable_start_time', '09:00:00', 'time', 46),
(668, 'timetable_end_time', '18:00:00', 'time', 46),
(669, 'timetable_duration', '01:00:00', 'time', 46),
(670, 'auto_renewal_plan', '1', 'integer', 46),
(671, 'currency_code', 'INR', 'string', 46),
(672, 'currency_symbol', '₹', 'string', 46),
(673, 'school_name', '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', 'string', 47),
(674, 'school_email', 'thomaskingial13@gmail.com', 'string', 47),
(675, 'school_phone', '88216139248', 'number', 47),
(676, 'school_tagline', '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', 'string', 47),
(677, 'school_address', 'Beijing', 'string', 47),
(678, 'session_year', '57', 'number', 47),
(679, 'horizontal_logo', 'horizontal_logo.png', 'file', 47),
(680, 'vertical_logo', 'vertical_logo.png', 'file', 47),
(681, 'timetable_start_time', '09:00:00', 'time', 47),
(682, 'timetable_end_time', '18:00:00', 'time', 47),
(683, 'timetable_duration', '01:00:00', 'time', 47),
(684, 'auto_renewal_plan', '1', 'integer', 47),
(685, 'currency_code', 'INR', 'string', 47),
(686, 'currency_symbol', '₹', 'string', 47),
(687, 'school_name', 'RobertIdofe', 'string', 48),
(688, 'school_email', 'cmcleyva@gmail.com', 'string', 48),
(689, 'school_phone', '89748798994', 'number', 48),
(690, 'school_tagline', 'RobertIdofe', 'string', 48),
(691, 'school_address', 'Mtskheta', 'string', 48),
(692, 'session_year', '58', 'number', 48),
(693, 'horizontal_logo', 'horizontal_logo.png', 'file', 48),
(694, 'vertical_logo', 'vertical_logo.png', 'file', 48),
(695, 'timetable_start_time', '09:00:00', 'time', 48),
(696, 'timetable_end_time', '18:00:00', 'time', 48),
(697, 'timetable_duration', '01:00:00', 'time', 48),
(698, 'auto_renewal_plan', '1', 'integer', 48),
(699, 'currency_code', 'INR', 'string', 48),
(700, 'currency_symbol', '₹', 'string', 48),
(701, 'school_name', 'Joannemal', 'string', 49),
(702, 'school_email', 'ivan5443moscow@gmail.com', 'string', 49),
(703, 'school_phone', '87612674586', 'number', 49),
(704, 'school_tagline', 'Joannemal', 'string', 49),
(705, 'school_address', 'Moscow', 'string', 49),
(706, 'session_year', '59', 'number', 49),
(707, 'horizontal_logo', 'horizontal_logo.png', 'file', 49),
(708, 'vertical_logo', 'vertical_logo.png', 'file', 49),
(709, 'timetable_start_time', '09:00:00', 'time', 49),
(710, 'timetable_end_time', '18:00:00', 'time', 49),
(711, 'timetable_duration', '01:00:00', 'time', 49),
(712, 'auto_renewal_plan', '1', 'integer', 49),
(713, 'currency_code', 'INR', 'string', 49),
(714, 'currency_symbol', '₹', 'string', 49),
(715, 'school_name', 'TedIdofe', 'string', 50),
(716, 'school_email', 'axobajigufo34@gmail.com', 'string', 50),
(717, 'school_phone', '83658814397', 'number', 50),
(718, 'school_tagline', 'TedIdofe', 'string', 50),
(719, 'school_address', 'City', 'string', 50),
(720, 'session_year', '60', 'number', 50),
(721, 'horizontal_logo', 'horizontal_logo.png', 'file', 50),
(722, 'vertical_logo', 'vertical_logo.png', 'file', 50),
(723, 'timetable_start_time', '09:00:00', 'time', 50),
(724, 'timetable_end_time', '18:00:00', 'time', 50),
(725, 'timetable_duration', '01:00:00', 'time', 50),
(726, 'auto_renewal_plan', '1', 'integer', 50),
(727, 'currency_code', 'INR', 'string', 50),
(728, 'currency_symbol', '₹', 'string', 50),
(729, 'school_name', 'MasonIdofe', 'string', 51),
(730, 'school_email', 'yawiviseya67@gmail.com', 'string', 51),
(731, 'school_phone', '82422261466', 'number', 51),
(732, 'school_tagline', 'MasonIdofe', 'string', 51),
(733, 'school_address', 'City', 'string', 51),
(734, 'session_year', '61', 'number', 51),
(735, 'horizontal_logo', 'horizontal_logo.png', 'file', 51),
(736, 'vertical_logo', 'vertical_logo.png', 'file', 51),
(737, 'timetable_start_time', '09:00:00', 'time', 51),
(738, 'timetable_end_time', '18:00:00', 'time', 51),
(739, 'timetable_duration', '01:00:00', 'time', 51),
(740, 'auto_renewal_plan', '1', 'integer', 51),
(741, 'currency_code', 'INR', 'string', 51),
(742, 'currency_symbol', '₹', 'string', 51),
(743, 'school_name', 'MasonIdofe', 'string', 52),
(744, 'school_email', 'ebojajuje04@gmail.com', 'string', 52),
(745, 'school_phone', '85964653985', 'number', 52),
(746, 'school_tagline', 'MasonIdofe', 'string', 52),
(747, 'school_address', 'City', 'string', 52),
(748, 'session_year', '62', 'number', 52),
(749, 'horizontal_logo', 'horizontal_logo.png', 'file', 52),
(750, 'vertical_logo', 'vertical_logo.png', 'file', 52),
(751, 'timetable_start_time', '09:00:00', 'time', 52),
(752, 'timetable_end_time', '18:00:00', 'time', 52),
(753, 'timetable_duration', '01:00:00', 'time', 52),
(754, 'auto_renewal_plan', '1', 'integer', 52),
(755, 'currency_code', 'INR', 'string', 52),
(756, 'currency_symbol', '₹', 'string', 52),
(757, 'school_name', 'MasonIdofe', 'string', 53),
(758, 'school_email', 'duqotayowud23@gmail.com', 'string', 53),
(759, 'school_phone', '85796585198', 'number', 53),
(760, 'school_tagline', 'MasonIdofe', 'string', 53),
(761, 'school_address', 'City', 'string', 53),
(762, 'session_year', '63', 'number', 53),
(763, 'horizontal_logo', 'horizontal_logo.png', 'file', 53),
(764, 'vertical_logo', 'vertical_logo.png', 'file', 53),
(765, 'timetable_start_time', '09:00:00', 'time', 53),
(766, 'timetable_end_time', '18:00:00', 'time', 53),
(767, 'timetable_duration', '01:00:00', 'time', 53),
(768, 'auto_renewal_plan', '1', 'integer', 53),
(769, 'currency_code', 'INR', 'string', 53),
(770, 'currency_symbol', '₹', 'string', 53),
(771, 'school_name', 'MasonIdofe', 'string', 54),
(772, 'school_email', 'somasesokiyo31@gmail.com', 'string', 54),
(773, 'school_phone', '81439788426', 'number', 54),
(774, 'school_tagline', 'MasonIdofe', 'string', 54),
(775, 'school_address', 'City', 'string', 54),
(776, 'session_year', '64', 'number', 54),
(777, 'horizontal_logo', 'horizontal_logo.png', 'file', 54),
(778, 'vertical_logo', 'vertical_logo.png', 'file', 54),
(779, 'timetable_start_time', '09:00:00', 'time', 54),
(780, 'timetable_end_time', '18:00:00', 'time', 54),
(781, 'timetable_duration', '01:00:00', 'time', 54),
(782, 'auto_renewal_plan', '1', 'integer', 54),
(783, 'currency_code', 'INR', 'string', 54),
(784, 'currency_symbol', '₹', 'string', 54),
(785, 'school_name', 'DavidIdofe', 'string', 55),
(786, 'school_email', 'ibucezevuda439@gmail.com', 'string', 55),
(787, 'school_phone', '85232285438', 'number', 55),
(788, 'school_tagline', 'DavidIdofe', 'string', 55),
(789, 'school_address', 'Mtskheta', 'string', 55),
(790, 'session_year', '65', 'number', 55),
(791, 'horizontal_logo', 'horizontal_logo.png', 'file', 55),
(792, 'vertical_logo', 'vertical_logo.png', 'file', 55),
(793, 'timetable_start_time', '09:00:00', 'time', 55),
(794, 'timetable_end_time', '18:00:00', 'time', 55),
(795, 'timetable_duration', '01:00:00', 'time', 55),
(796, 'auto_renewal_plan', '1', 'integer', 55),
(797, 'currency_code', 'INR', 'string', 55),
(798, 'currency_symbol', '₹', 'string', 55),
(799, 'school_name', 'Michealprell', 'string', 56),
(800, 'school_email', 'raymondUtitari@gmail.com', 'string', 56),
(801, 'school_phone', '81159813487', 'number', 56),
(802, 'school_tagline', 'Michealprell', 'string', 56),
(803, 'school_address', 'Bamako', 'string', 56),
(804, 'session_year', '66', 'number', 56),
(805, 'horizontal_logo', 'horizontal_logo.png', 'file', 56),
(806, 'vertical_logo', 'vertical_logo.png', 'file', 56),
(807, 'timetable_start_time', '09:00:00', 'time', 56),
(808, 'timetable_end_time', '18:00:00', 'time', 56),
(809, 'timetable_duration', '01:00:00', 'time', 56),
(810, 'auto_renewal_plan', '1', 'integer', 56),
(811, 'currency_code', 'INR', 'string', 56),
(812, 'currency_symbol', '₹', 'string', 56),
(813, 'school_name', 'Brianfuh', 'string', 57),
(814, 'school_email', 'm.ega.st.o.p.l.a.y@gmail.com', 'string', 57),
(815, 'school_phone', '85712653663', 'number', 57),
(816, 'school_tagline', 'Brianfuh', 'string', 57),
(817, 'school_address', 'Garhoud', 'string', 57),
(818, 'session_year', '67', 'number', 57),
(819, 'horizontal_logo', 'horizontal_logo.png', 'file', 57),
(820, 'vertical_logo', 'vertical_logo.png', 'file', 57),
(821, 'timetable_start_time', '09:00:00', 'time', 57),
(822, 'timetable_end_time', '18:00:00', 'time', 57),
(823, 'timetable_duration', '01:00:00', 'time', 57),
(824, 'auto_renewal_plan', '1', 'integer', 57),
(825, 'currency_code', 'INR', 'string', 57),
(826, 'currency_symbol', '₹', 'string', 57),
(827, 'school_name', 'Rithy Olsg Ard', 'string', 58),
(828, 'school_email', 'zmabmbmbsiuj@dont-reply.me', 'string', 58),
(829, 'school_phone', '+13232696924', 'number', 58),
(830, 'school_tagline', 'Rithy Olsg Ard', 'string', 58),
(831, 'school_address', '1930 CAMINITO DEL PILAR', 'string', 58),
(832, 'session_year', '68', 'number', 58),
(833, 'horizontal_logo', 'horizontal_logo.png', 'file', 58),
(834, 'vertical_logo', 'vertical_logo.png', 'file', 58),
(835, 'timetable_start_time', '09:00:00', 'time', 58),
(836, 'timetable_end_time', '18:00:00', 'time', 58),
(837, 'timetable_duration', '01:00:00', 'time', 58),
(838, 'auto_renewal_plan', '1', 'integer', 58),
(839, 'currency_code', 'INR', 'string', 58),
(840, 'currency_symbol', '₹', 'string', 58),
(841, 'school_name', 'Aleks Plekhov', 'string', 59),
(842, 'school_email', 'abc@eforum.top', 'string', 59),
(843, 'school_phone', '85752199113', 'number', 59),
(844, 'school_tagline', 'Aleks Plekhov', 'string', 59),
(845, 'school_address', 'Bottegone', 'string', 59),
(846, 'session_year', '69', 'number', 59),
(847, 'horizontal_logo', 'horizontal_logo.png', 'file', 59),
(848, 'vertical_logo', 'vertical_logo.png', 'file', 59),
(849, 'timetable_start_time', '09:00:00', 'time', 59),
(850, 'timetable_end_time', '18:00:00', 'time', 59),
(851, 'timetable_duration', '01:00:00', 'time', 59),
(852, 'auto_renewal_plan', '1', 'integer', 59),
(853, 'currency_code', 'INR', 'string', 59),
(854, 'currency_symbol', '₹', 'string', 59),
(855, 'school_name', 'Mike Babcock', 'string', 60),
(856, 'school_email', 'mikexxxx@gmail.com', 'string', 60),
(857, 'school_phone', '81789464378', 'number', 60),
(858, 'school_tagline', 'Mike Babcock', 'string', 60),
(859, 'school_address', 'Albany', 'string', 60),
(860, 'session_year', '70', 'number', 60),
(861, 'horizontal_logo', 'horizontal_logo.png', 'file', 60),
(862, 'vertical_logo', 'vertical_logo.png', 'file', 60),
(863, 'timetable_start_time', '09:00:00', 'time', 60),
(864, 'timetable_end_time', '18:00:00', 'time', 60),
(865, 'timetable_duration', '01:00:00', 'time', 60),
(866, 'auto_renewal_plan', '1', 'integer', 60),
(867, 'currency_code', 'INR', 'string', 60),
(868, 'currency_symbol', '₹', 'string', 60),
(869, 'school_name', 'Newton Poole', 'string', 61),
(870, 'school_email', 'melaniefell51@gmail.com', 'string', 61),
(871, 'school_phone', '85411527651', 'number', 61),
(872, 'school_tagline', 'Newton Poole', 'string', 61),
(873, 'school_address', 'Klimmen', 'string', 61),
(874, 'session_year', '71', 'number', 61),
(875, 'horizontal_logo', 'horizontal_logo.png', 'file', 61),
(876, 'vertical_logo', 'vertical_logo.png', 'file', 61),
(877, 'timetable_start_time', '09:00:00', 'time', 61),
(878, 'timetable_end_time', '18:00:00', 'time', 61),
(879, 'timetable_duration', '01:00:00', 'time', 61),
(880, 'auto_renewal_plan', '1', 'integer', 61),
(881, 'currency_code', 'INR', 'string', 61),
(882, 'currency_symbol', '₹', 'string', 61),
(883, 'school_name', 'crypto7icede', 'string', 62),
(884, 'school_email', '777@zel.biz', 'string', 62),
(885, 'school_phone', '85663986783', 'number', 62),
(886, 'school_tagline', 'crypto7icede', 'string', 62),
(887, 'school_address', 'New York', 'string', 62),
(888, 'session_year', '72', 'number', 62),
(889, 'horizontal_logo', 'horizontal_logo.png', 'file', 62),
(890, 'vertical_logo', 'vertical_logo.png', 'file', 62),
(891, 'timetable_start_time', '09:00:00', 'time', 62),
(892, 'timetable_end_time', '18:00:00', 'time', 62),
(893, 'timetable_duration', '01:00:00', 'time', 62),
(894, 'auto_renewal_plan', '1', 'integer', 62),
(895, 'currency_code', 'INR', 'string', 62),
(896, 'currency_symbol', '₹', 'string', 62),
(897, 'school_name', 'Maxence Breezee', 'string', 63),
(898, 'school_email', 'bzrzsbmsejuj@dont-reply.me', 'string', 63),
(899, 'school_phone', '+17302164053', 'number', 63),
(900, 'school_tagline', 'Maxence Breezee', 'string', 63),
(901, 'school_address', '439 BEARDSLEY CIR', 'string', 63),
(902, 'session_year', '73', 'number', 63),
(903, 'horizontal_logo', 'horizontal_logo.png', 'file', 63),
(904, 'vertical_logo', 'vertical_logo.png', 'file', 63),
(905, 'timetable_start_time', '09:00:00', 'time', 63),
(906, 'timetable_end_time', '18:00:00', 'time', 63),
(907, 'timetable_duration', '01:00:00', 'time', 63),
(908, 'auto_renewal_plan', '1', 'integer', 63),
(909, 'currency_code', 'INR', 'string', 63),
(910, 'currency_symbol', '₹', 'string', 63),
(911, 'school_name', 'TedIdofe', 'string', 64),
(912, 'school_email', 'moqagides18@gmail.com', 'string', 64),
(913, 'school_phone', '81413118639', 'number', 64),
(914, 'school_tagline', 'TedIdofe', 'string', 64),
(915, 'school_address', 'City', 'string', 64),
(916, 'session_year', '74', 'number', 64),
(917, 'horizontal_logo', 'horizontal_logo.png', 'file', 64),
(918, 'vertical_logo', 'vertical_logo.png', 'file', 64),
(919, 'timetable_start_time', '09:00:00', 'time', 64),
(920, 'timetable_end_time', '18:00:00', 'time', 64),
(921, 'timetable_duration', '01:00:00', 'time', 64),
(922, 'auto_renewal_plan', '1', 'integer', 64),
(923, 'currency_code', 'INR', 'string', 64),
(924, 'currency_symbol', '₹', 'string', 64),
(925, 'school_name', 'Andrzej Peitsalo', 'string', 65),
(926, 'school_email', 'bbsjeriemjuj@do-not-respond.me', 'string', 65),
(927, 'school_phone', '+19839969018', 'number', 65),
(928, 'school_tagline', 'Andrzej Peitsalo', 'string', 65),
(929, 'school_address', '5395 FOX HOLLOW CT', 'string', 65),
(930, 'session_year', '75', 'number', 65),
(931, 'horizontal_logo', 'horizontal_logo.png', 'file', 65),
(932, 'vertical_logo', 'vertical_logo.png', 'file', 65),
(933, 'timetable_start_time', '09:00:00', 'time', 65),
(934, 'timetable_end_time', '18:00:00', 'time', 65),
(935, 'timetable_duration', '01:00:00', 'time', 65),
(936, 'auto_renewal_plan', '1', 'integer', 65),
(937, 'currency_code', 'INR', 'string', 65),
(938, 'currency_symbol', '₹', 'string', 65),
(939, 'school_name', 'JohnIdofe', 'string', 66),
(940, 'school_email', 'arikerer278@gmail.com', 'string', 66),
(941, 'school_phone', '85743857311', 'number', 66),
(942, 'school_tagline', 'JohnIdofe', 'string', 66),
(943, 'school_address', 'City', 'string', 66),
(944, 'session_year', '76', 'number', 66),
(945, 'horizontal_logo', 'horizontal_logo.png', 'file', 66),
(946, 'vertical_logo', 'vertical_logo.png', 'file', 66),
(947, 'timetable_start_time', '09:00:00', 'time', 66),
(948, 'timetable_end_time', '18:00:00', 'time', 66),
(949, 'timetable_duration', '01:00:00', 'time', 66),
(950, 'auto_renewal_plan', '1', 'integer', 66),
(951, 'currency_code', 'INR', 'string', 66),
(952, 'currency_symbol', '₹', 'string', 66),
(953, 'school_name', 'Nikhama Jochen', 'string', 67),
(954, 'school_email', 'bamlsaelijuj@dont-reply.me', 'string', 67),
(955, 'school_phone', '+17306157734', 'number', 67),
(956, 'school_tagline', 'Nikhama Jochen', 'string', 67),
(957, 'school_address', '77 riverview dr', 'string', 67),
(958, 'session_year', '77', 'number', 67),
(959, 'horizontal_logo', 'horizontal_logo.png', 'file', 67),
(960, 'vertical_logo', 'vertical_logo.png', 'file', 67),
(961, 'timetable_start_time', '09:00:00', 'time', 67),
(962, 'timetable_end_time', '18:00:00', 'time', 67),
(963, 'timetable_duration', '01:00:00', 'time', 67),
(964, 'auto_renewal_plan', '1', 'integer', 67),
(965, 'currency_code', 'INR', 'string', 67),
(966, 'currency_symbol', '₹', 'string', 67),
(967, 'school_name', 'Gafiyat Casci', 'string', 68),
(968, 'school_email', 'bleseamrbjuj@do-not-respond.me', 'string', 68),
(969, 'school_phone', '+17302163826', 'number', 68),
(970, 'school_tagline', 'Gafiyat Casci', 'string', 68),
(971, 'school_address', '1942 Great Plains Way', 'string', 68),
(972, 'session_year', '78', 'number', 68),
(973, 'horizontal_logo', 'horizontal_logo.png', 'file', 68),
(974, 'vertical_logo', 'vertical_logo.png', 'file', 68),
(975, 'timetable_start_time', '09:00:00', 'time', 68),
(976, 'timetable_end_time', '18:00:00', 'time', 68),
(977, 'timetable_duration', '01:00:00', 'time', 68),
(978, 'auto_renewal_plan', '1', 'integer', 68),
(979, 'currency_code', 'INR', 'string', 68),
(980, 'currency_symbol', '₹', 'string', 68),
(981, 'school_name', 'Mike Oscar Willems', 'string', 69),
(982, 'school_email', 'info@professionalseocleanup.com', 'string', 69),
(983, 'school_phone', '81235982359', 'number', 69),
(984, 'school_tagline', 'Mike Oscar Willems', 'string', 69),
(985, 'school_address', 'Kaohsiung Municipality', 'string', 69),
(986, 'session_year', '79', 'number', 69),
(987, 'horizontal_logo', 'horizontal_logo.png', 'file', 69),
(988, 'vertical_logo', 'vertical_logo.png', 'file', 69),
(989, 'timetable_start_time', '09:00:00', 'time', 69),
(990, 'timetable_end_time', '18:00:00', 'time', 69),
(991, 'timetable_duration', '01:00:00', 'time', 69),
(992, 'auto_renewal_plan', '1', 'integer', 69),
(993, 'currency_code', 'INR', 'string', 69),
(994, 'currency_symbol', '₹', 'string', 69),
(995, 'school_name', 'Jandell Arcineda', 'string', 70),
(996, 'school_email', 'rjaasiijjjuj@do-not-respond.me', 'string', 70),
(997, 'school_phone', '+15056445794', 'number', 70),
(998, 'school_tagline', 'Jandell Arcineda', 'string', 70),
(999, 'school_address', '3644 ALBION AVE', 'string', 70),
(1000, 'session_year', '80', 'number', 70),
(1001, 'horizontal_logo', 'horizontal_logo.png', 'file', 70),
(1002, 'vertical_logo', 'vertical_logo.png', 'file', 70),
(1003, 'timetable_start_time', '09:00:00', 'time', 70),
(1004, 'timetable_end_time', '18:00:00', 'time', 70),
(1005, 'timetable_duration', '01:00:00', 'time', 70),
(1006, 'auto_renewal_plan', '1', 'integer', 70),
(1007, 'currency_code', 'INR', 'string', 70),
(1008, 'currency_symbol', '₹', 'string', 70),
(1009, 'school_name', 'Mike Per Petitson', 'string', 71),
(1010, 'school_email', 'mike@monkeydigital.co', 'string', 71),
(1011, 'school_phone', '88784973557', 'number', 71),
(1012, 'school_tagline', 'Mike Per Petitson', 'string', 71),
(1013, 'school_address', 'Kakamega', 'string', 71),
(1014, 'session_year', '81', 'number', 71),
(1015, 'horizontal_logo', 'horizontal_logo.png', 'file', 71),
(1016, 'vertical_logo', 'vertical_logo.png', 'file', 71),
(1017, 'timetable_start_time', '09:00:00', 'time', 71),
(1018, 'timetable_end_time', '18:00:00', 'time', 71),
(1019, 'timetable_duration', '01:00:00', 'time', 71),
(1020, 'auto_renewal_plan', '1', 'integer', 71),
(1021, 'currency_code', 'INR', 'string', 71),
(1022, 'currency_symbol', '₹', 'string', 71),
(1023, 'school_name', 'Mike Swen Weber', 'string', 72),
(1024, 'school_email', 'info@strictlydigital.net', 'string', 72),
(1025, 'school_phone', '89978497257', 'number', 72),
(1026, 'school_tagline', 'Mike Swen Weber', 'string', 72),
(1027, 'school_address', 'Willemstad', 'string', 72),
(1028, 'session_year', '82', 'number', 72),
(1029, 'horizontal_logo', 'horizontal_logo.png', 'file', 72),
(1030, 'vertical_logo', 'vertical_logo.png', 'file', 72),
(1031, 'timetable_start_time', '09:00:00', 'time', 72),
(1032, 'timetable_end_time', '18:00:00', 'time', 72),
(1033, 'timetable_duration', '01:00:00', 'time', 72),
(1034, 'auto_renewal_plan', '1', 'integer', 72),
(1035, 'currency_code', 'INR', 'string', 72),
(1036, 'currency_symbol', '₹', 'string', 72),
(1037, 'school_name', 'MARWIN BILINGUAL COLLEGE(MBC)', 'string', 73),
(1038, 'school_email', 'info@mbc.cm', 'string', 73),
(1039, 'school_phone', '621009082', 'number', 73),
(1040, 'school_tagline', 'MARWIN BILINGUAL COLLEGE(MBC)', 'string', 73),
(1041, 'school_address', 'Nyalla', 'string', 73),
(1042, 'session_year', '83', 'number', 73),
(1043, 'horizontal_logo', 'horizontal_logo.png', 'file', 73),
(1044, 'vertical_logo', 'vertical_logo.png', 'file', 73),
(1045, 'timetable_start_time', '07:00:00', 'time', 73),
(1046, 'timetable_end_time', '15:55:00', 'time', 73),
(1047, 'timetable_duration', '01:00:00', 'time', 73),
(1048, 'auto_renewal_plan', '1', 'integer', 73),
(1049, 'currency_code', 'INR', 'string', 73),
(1050, 'currency_symbol', '₹', 'string', 73),
(1051, 'school_name', 'Mike Leon De Smet', 'string', 74),
(1052, 'school_email', 'info@speed-seo.net', 'string', 74),
(1053, 'school_phone', '81285481532', 'number', 74),
(1054, 'school_tagline', 'Mike Leon De Smet', 'string', 74),
(1055, 'school_address', 'Albany', 'string', 74),
(1056, 'session_year', '84', 'number', 74),
(1057, 'horizontal_logo', 'horizontal_logo.png', 'file', 74),
(1058, 'vertical_logo', 'vertical_logo.png', 'file', 74),
(1059, 'timetable_start_time', '09:00:00', 'time', 74),
(1060, 'timetable_end_time', '18:00:00', 'time', 74),
(1061, 'timetable_duration', '01:00:00', 'time', 74),
(1062, 'auto_renewal_plan', '1', 'integer', 74),
(1063, 'currency_code', 'INR', 'string', 74),
(1064, 'currency_symbol', '₹', 'string', 74),
(1065, 'school_name', 'Vaness Calb', 'string', 75),
(1066, 'school_email', 'azmlemllajuj@dont-reply.me', 'string', 75),
(1067, 'school_phone', '+15053799792', 'number', 75),
(1068, 'school_tagline', 'Vaness Calb', 'string', 75),
(1069, 'school_address', '18611 N 22nd St Lot 32', 'string', 75),
(1070, 'session_year', '85', 'number', 75),
(1071, 'horizontal_logo', 'horizontal_logo.png', 'file', 75),
(1072, 'vertical_logo', 'vertical_logo.png', 'file', 75),
(1073, 'timetable_start_time', '09:00:00', 'time', 75),
(1074, 'timetable_end_time', '18:00:00', 'time', 75),
(1075, 'timetable_duration', '01:00:00', 'time', 75),
(1076, 'auto_renewal_plan', '1', 'integer', 75),
(1077, 'currency_code', 'INR', 'string', 75),
(1078, 'currency_symbol', '₹', 'string', 75),
(1079, 'school_name', 'Nakye Perellon', 'string', 76),
(1080, 'school_email', 'aiaabzzmmjuj@dont-reply.me', 'string', 76),
(1081, 'school_phone', '+17306068863', 'number', 76),
(1082, 'school_tagline', 'Nakye Perellon', 'string', 76),
(1083, 'school_address', '6368 Westland Rd', 'string', 76),
(1084, 'session_year', '86', 'number', 76),
(1085, 'horizontal_logo', 'horizontal_logo.png', 'file', 76),
(1086, 'vertical_logo', 'vertical_logo.png', 'file', 76),
(1087, 'timetable_start_time', '09:00:00', 'time', 76),
(1088, 'timetable_end_time', '18:00:00', 'time', 76),
(1089, 'timetable_duration', '01:00:00', 'time', 76),
(1090, 'auto_renewal_plan', '1', 'integer', 76),
(1091, 'currency_code', 'INR', 'string', 76),
(1092, 'currency_symbol', '₹', 'string', 76),
(1093, 'school_name', 'Mendi Legree', 'string', 77),
(1094, 'school_email', 'allblzlaijuj@dont-reply.me', 'string', 77),
(1095, 'school_phone', '+14722411371', 'number', 77),
(1096, 'school_tagline', 'Mendi Legree', 'string', 77),
(1097, 'school_address', '3562 WOODS WALK BLVD', 'string', 77),
(1098, 'session_year', '87', 'number', 77),
(1099, 'horizontal_logo', 'horizontal_logo.png', 'file', 77),
(1100, 'vertical_logo', 'vertical_logo.png', 'file', 77),
(1101, 'timetable_start_time', '09:00:00', 'time', 77),
(1102, 'timetable_end_time', '18:00:00', 'time', 77),
(1103, 'timetable_duration', '01:00:00', 'time', 77),
(1104, 'auto_renewal_plan', '1', 'integer', 77),
(1105, 'currency_code', 'INR', 'string', 77),
(1106, 'currency_symbol', '₹', 'string', 77),
(1107, 'school_name', 'Luis Alves', 'string', 78),
(1108, 'school_email', 'intl.law7@aol.com', 'string', 78),
(1109, 'school_phone', '84728488897', 'number', 78),
(1110, 'school_tagline', 'Luis Alves', 'string', 78),
(1111, 'school_address', 'Willemstad', 'string', 78),
(1112, 'session_year', '88', 'number', 78),
(1113, 'horizontal_logo', 'horizontal_logo.png', 'file', 78),
(1114, 'vertical_logo', 'vertical_logo.png', 'file', 78),
(1115, 'timetable_start_time', '09:00:00', 'time', 78),
(1116, 'timetable_end_time', '18:00:00', 'time', 78),
(1117, 'timetable_duration', '01:00:00', 'time', 78),
(1118, 'auto_renewal_plan', '1', 'integer', 78),
(1119, 'currency_code', 'INR', 'string', 78),
(1120, 'currency_symbol', '₹', 'string', 78),
(1121, 'school_name', 'Mike Sven-Erik Frangois', 'string', 79),
(1122, 'school_email', 'info@digitalxflow.com', 'string', 79),
(1123, 'school_phone', '89123254755', 'number', 79),
(1124, 'school_tagline', 'Mike Sven-Erik Frangois', 'string', 79),
(1125, 'school_address', 'Boston', 'string', 79),
(1126, 'session_year', '89', 'number', 79),
(1127, 'horizontal_logo', 'horizontal_logo.png', 'file', 79),
(1128, 'vertical_logo', 'vertical_logo.png', 'file', 79),
(1129, 'timetable_start_time', '09:00:00', 'time', 79),
(1130, 'timetable_end_time', '18:00:00', 'time', 79),
(1131, 'timetable_duration', '01:00:00', 'time', 79),
(1132, 'auto_renewal_plan', '1', 'integer', 79),
(1133, 'currency_code', 'INR', 'string', 79),
(1134, 'currency_symbol', '₹', 'string', 79),
(1135, 'school_name', 'Thomas Seligman', 'string', 80),
(1136, 'school_email', 'thomas.seligman@mail.com', 'string', 80),
(1137, 'school_phone', '83528655731', 'number', 80),
(1138, 'school_tagline', 'Thomas Seligman', 'string', 80),
(1139, 'school_address', 'Le Mans', 'string', 80),
(1140, 'session_year', '90', 'number', 80),
(1141, 'horizontal_logo', 'horizontal_logo.png', 'file', 80),
(1142, 'vertical_logo', 'vertical_logo.png', 'file', 80),
(1143, 'timetable_start_time', '09:00:00', 'time', 80),
(1144, 'timetable_end_time', '18:00:00', 'time', 80),
(1145, 'timetable_duration', '01:00:00', 'time', 80),
(1146, 'auto_renewal_plan', '1', 'integer', 80),
(1147, 'currency_code', 'INR', 'string', 80),
(1148, 'currency_symbol', '₹', 'string', 80),
(1149, 'school_name', 'Nicholas Doby', 'string', 81),
(1150, 'school_email', 'dobyfinancial@sendnow.win', 'string', 81),
(1151, 'school_phone', '81388683979', 'number', 81),
(1152, 'school_tagline', 'Nicholas Doby', 'string', 81),
(1153, 'school_address', 'Kalamaria', 'string', 81),
(1154, 'session_year', '91', 'number', 81),
(1155, 'horizontal_logo', 'horizontal_logo.png', 'file', 81),
(1156, 'vertical_logo', 'vertical_logo.png', 'file', 81),
(1157, 'timetable_start_time', '09:00:00', 'time', 81),
(1158, 'timetable_end_time', '18:00:00', 'time', 81),
(1159, 'timetable_duration', '01:00:00', 'time', 81),
(1160, 'auto_renewal_plan', '1', 'integer', 81),
(1161, 'currency_code', 'INR', 'string', 81),
(1162, 'currency_symbol', '₹', 'string', 81),
(1163, 'school_name', 'Yasuhiro Yamada', 'string', 82),
(1164, 'school_email', 'rohtopharmaceutical@via.tokyo.jp', 'string', 82),
(1165, 'school_phone', '87683927449', 'number', 82),
(1166, 'school_tagline', 'Yasuhiro Yamada', 'string', 82),
(1167, 'school_address', 'Ennis', 'string', 82),
(1168, 'session_year', '92', 'number', 82),
(1169, 'horizontal_logo', 'horizontal_logo.png', 'file', 82),
(1170, 'vertical_logo', 'vertical_logo.png', 'file', 82),
(1171, 'timetable_start_time', '09:00:00', 'time', 82),
(1172, 'timetable_end_time', '18:00:00', 'time', 82),
(1173, 'timetable_duration', '01:00:00', 'time', 82),
(1174, 'auto_renewal_plan', '1', 'integer', 82),
(1175, 'currency_code', 'INR', 'string', 82),
(1176, 'currency_symbol', '₹', 'string', 82),
(1180, 'school_name', 'Amandaflastec', 'string', 83),
(1181, 'school_email', 'amandawemicets3@gmail.com', 'string', 83),
(1182, 'school_phone', '81687966545', 'number', 83),
(1183, 'school_tagline', 'Amandaflastec', 'string', 83),
(1184, 'school_address', 'Stung Treng', 'string', 83),
(1185, 'session_year', '93', 'number', 83),
(1186, 'horizontal_logo', 'horizontal_logo.png', 'file', 83),
(1187, 'vertical_logo', 'vertical_logo.png', 'file', 83),
(1188, 'timetable_start_time', '09:00:00', 'time', 83),
(1189, 'timetable_end_time', '18:00:00', 'time', 83),
(1190, 'timetable_duration', '01:00:00', 'time', 83),
(1191, 'auto_renewal_plan', '1', 'integer', 83),
(1192, 'currency_code', 'INR', 'string', 83),
(1193, 'currency_symbol', '₹', 'string', 83),
(1194, 'school_name', 'Mike Oscar Schmidt', 'string', 84),
(1195, 'school_email', 'check-message3323@gmail.com', 'string', 84),
(1196, 'school_phone', '88755397324', 'number', 84),
(1197, 'school_tagline', 'Mike Oscar Schmidt', 'string', 84),
(1198, 'school_address', 'Willemstad', 'string', 84),
(1199, 'session_year', '94', 'number', 84),
(1200, 'horizontal_logo', 'horizontal_logo.png', 'file', 84),
(1201, 'vertical_logo', 'vertical_logo.png', 'file', 84),
(1202, 'timetable_start_time', '09:00:00', 'time', 84),
(1203, 'timetable_end_time', '18:00:00', 'time', 84),
(1204, 'timetable_duration', '01:00:00', 'time', 84),
(1205, 'auto_renewal_plan', '1', 'integer', 84),
(1206, 'currency_code', 'INR', 'string', 84),
(1207, 'currency_symbol', '₹', 'string', 84),
(1208, 'school_name', 'Mike Lars Johansson', 'string', 85);
INSERT INTO `school_settings` (`id`, `name`, `data`, `type`, `school_id`) VALUES
(1209, 'school_email', 'check-message7819@gmail.com', 'string', 85),
(1210, 'school_phone', '86872616959', 'number', 85),
(1211, 'school_tagline', 'Mike Lars Johansson', 'string', 85),
(1212, 'school_address', 'Willemstad', 'string', 85),
(1213, 'session_year', '95', 'number', 85),
(1214, 'horizontal_logo', 'horizontal_logo.png', 'file', 85),
(1215, 'vertical_logo', 'vertical_logo.png', 'file', 85),
(1216, 'timetable_start_time', '09:00:00', 'time', 85),
(1217, 'timetable_end_time', '18:00:00', 'time', 85),
(1218, 'timetable_duration', '01:00:00', 'time', 85),
(1219, 'auto_renewal_plan', '1', 'integer', 85),
(1220, 'currency_code', 'INR', 'string', 85),
(1221, 'currency_symbol', '₹', 'string', 85),
(1222, 'school_name', 'GeorgeIdofe', 'string', 86),
(1223, 'school_email', 'ocopesuq299@gmail.com', 'string', 86),
(1224, 'school_phone', '87766947287', 'number', 86),
(1225, 'school_tagline', 'GeorgeIdofe', 'string', 86),
(1226, 'school_address', 'City', 'string', 86),
(1227, 'session_year', '96', 'number', 86),
(1228, 'horizontal_logo', 'horizontal_logo.png', 'file', 86),
(1229, 'vertical_logo', 'vertical_logo.png', 'file', 86),
(1230, 'timetable_start_time', '09:00:00', 'time', 86),
(1231, 'timetable_end_time', '18:00:00', 'time', 86),
(1232, 'timetable_duration', '01:00:00', 'time', 86),
(1233, 'auto_renewal_plan', '1', 'integer', 86),
(1234, 'currency_code', 'INR', 'string', 86),
(1235, 'currency_symbol', '₹', 'string', 86),
(1239, 'school_name', 'MyName', 'string', 87),
(1240, 'school_email', 'uppicqib@do-not-respond.me', 'string', 87),
(1241, 'school_phone', '407', 'number', 87),
(1242, 'school_tagline', 'MyName', 'string', 87),
(1243, 'school_address', 'NtjQr FslZwm Hxp oFjsvXDO Yqhoh aQGKmt', 'string', 87),
(1244, 'session_year', '97', 'number', 87),
(1245, 'horizontal_logo', 'horizontal_logo.png', 'file', 87),
(1246, 'vertical_logo', 'vertical_logo.png', 'file', 87),
(1247, 'timetable_start_time', '09:00:00', 'time', 87),
(1248, 'timetable_end_time', '18:00:00', 'time', 87),
(1249, 'timetable_duration', '01:00:00', 'time', 87),
(1250, 'auto_renewal_plan', '1', 'integer', 87),
(1251, 'currency_code', 'INR', 'string', 87),
(1252, 'currency_symbol', '₹', 'string', 87),
(1253, 'school_name', 'Ernestshigo', 'string', 88),
(1254, 'school_email', 'pr.ogon0809@gmail.com', 'string', 88),
(1255, 'school_phone', '88869169315', 'number', 88),
(1256, 'school_tagline', 'Ernestshigo', 'string', 88),
(1257, 'school_address', 'Arcatao', 'string', 88),
(1258, 'session_year', '98', 'number', 88),
(1259, 'horizontal_logo', 'horizontal_logo.png', 'file', 88),
(1260, 'vertical_logo', 'vertical_logo.png', 'file', 88),
(1261, 'timetable_start_time', '09:00:00', 'time', 88),
(1262, 'timetable_end_time', '18:00:00', 'time', 88),
(1263, 'timetable_duration', '01:00:00', 'time', 88),
(1264, 'auto_renewal_plan', '1', 'integer', 88),
(1265, 'currency_code', 'INR', 'string', 88),
(1266, 'currency_symbol', '₹', 'string', 88),
(1267, 'school_name', 'ThomasBoivy', 'string', 89),
(1268, 'school_email', 'progon0809@gmail.com', 'string', 89),
(1269, 'school_phone', '83384689122', 'number', 89),
(1270, 'school_tagline', 'ThomasBoivy', 'string', 89),
(1271, 'school_address', 'Mariupol', 'string', 89),
(1272, 'session_year', '99', 'number', 89),
(1273, 'horizontal_logo', 'horizontal_logo.png', 'file', 89),
(1274, 'vertical_logo', 'vertical_logo.png', 'file', 89),
(1275, 'timetable_start_time', '09:00:00', 'time', 89),
(1276, 'timetable_end_time', '18:00:00', 'time', 89),
(1277, 'timetable_duration', '01:00:00', 'time', 89),
(1278, 'auto_renewal_plan', '1', 'integer', 89),
(1279, 'currency_code', 'INR', 'string', 89),
(1280, 'currency_symbol', '₹', 'string', 89),
(1281, 'school_name', 'FrancisowEst', 'string', 90),
(1282, 'school_email', 'nomin.momin+328n9@mail.ru', 'string', 90),
(1283, 'school_phone', '88672743921', 'number', 90),
(1284, 'school_tagline', 'FrancisowEst', 'string', 90),
(1285, 'school_address', 'Albany', 'string', 90),
(1286, 'session_year', '100', 'number', 90),
(1287, 'horizontal_logo', 'horizontal_logo.png', 'file', 90),
(1288, 'vertical_logo', 'vertical_logo.png', 'file', 90),
(1289, 'timetable_start_time', '09:00:00', 'time', 90),
(1290, 'timetable_end_time', '18:00:00', 'time', 90),
(1291, 'timetable_duration', '01:00:00', 'time', 90),
(1292, 'auto_renewal_plan', '1', 'integer', 90),
(1293, 'currency_code', 'INR', 'string', 90),
(1294, 'currency_symbol', '₹', 'string', 90),
(1295, 'school_name', 'Mike Giinter Visser', 'string', 91),
(1296, 'school_email', 'info@digital-x-press.com', 'string', 91),
(1297, 'school_phone', '88882431551', 'number', 91),
(1298, 'school_tagline', 'Mike Giinter Visser', 'string', 91),
(1299, 'school_address', 'Boston', 'string', 91),
(1300, 'session_year', '101', 'number', 91),
(1301, 'horizontal_logo', 'horizontal_logo.png', 'file', 91),
(1302, 'vertical_logo', 'vertical_logo.png', 'file', 91),
(1303, 'timetable_start_time', '09:00:00', 'time', 91),
(1304, 'timetable_end_time', '18:00:00', 'time', 91),
(1305, 'timetable_duration', '01:00:00', 'time', 91),
(1306, 'auto_renewal_plan', '1', 'integer', 91),
(1307, 'currency_code', 'INR', 'string', 91),
(1308, 'currency_symbol', '₹', 'string', 91),
(1309, 'school_name', '* * * Unlock Free Spins Today: https://www.itboo.kz/uploads/git9r5.php?9zmeb * * * hs=277e9cd2be265011b72039396bca3af6*', 'string', 92),
(1310, 'school_email', 'pazapz@mailbox.in.ua', 'string', 92),
(1311, 'school_phone', 'tqhve2', 'number', 92),
(1312, 'school_tagline', '* * * Unlock Free Spins Today: https://www.itboo.kz/uploads/git9r5.php?9zmeb * * * hs=277e9cd2be265011b72039396bca3af6*', 'string', 92),
(1313, 'school_address', 'h2xpci', 'string', 92),
(1314, 'session_year', '102', 'number', 92),
(1315, 'horizontal_logo', 'horizontal_logo.png', 'file', 92),
(1316, 'vertical_logo', 'vertical_logo.png', 'file', 92),
(1317, 'timetable_start_time', '09:00:00', 'time', 92),
(1318, 'timetable_end_time', '18:00:00', 'time', 92),
(1319, 'timetable_duration', '01:00:00', 'time', 92),
(1320, 'auto_renewal_plan', '1', 'integer', 92),
(1321, 'currency_code', 'INR', 'string', 92),
(1322, 'currency_symbol', '₹', 'string', 92),
(1323, 'school_name', 'Williamlat', 'string', 93),
(1324, 'school_email', 'barb.oursundin@gmail.com', 'string', 93),
(1325, 'school_phone', '83528962827', 'number', 93),
(1326, 'school_tagline', 'Williamlat', 'string', 93),
(1327, 'school_address', 'Mankon Bamenda', 'string', 93),
(1328, 'session_year', '103', 'number', 93),
(1329, 'horizontal_logo', 'horizontal_logo.png', 'file', 93),
(1330, 'vertical_logo', 'vertical_logo.png', 'file', 93),
(1331, 'timetable_start_time', '09:00:00', 'time', 93),
(1332, 'timetable_end_time', '18:00:00', 'time', 93),
(1333, 'timetable_duration', '01:00:00', 'time', 93),
(1334, 'auto_renewal_plan', '1', 'integer', 93),
(1335, 'currency_code', 'INR', 'string', 93),
(1336, 'currency_symbol', '₹', 'string', 93),
(1337, 'school_name', 'ByKnIsk', 'string', 94),
(1338, 'school_email', 'brosjonson@mail.ru', 'string', 94),
(1339, 'school_phone', '86891979954', 'number', 94),
(1340, 'school_tagline', 'ByKnIsk', 'string', 94),
(1341, 'school_address', 'USA', 'string', 94),
(1342, 'session_year', '104', 'number', 94),
(1343, 'horizontal_logo', 'horizontal_logo.png', 'file', 94),
(1344, 'vertical_logo', 'vertical_logo.png', 'file', 94),
(1345, 'timetable_start_time', '09:00:00', 'time', 94),
(1346, 'timetable_end_time', '18:00:00', 'time', 94),
(1347, 'timetable_duration', '01:00:00', 'time', 94),
(1348, 'auto_renewal_plan', '1', 'integer', 94),
(1349, 'currency_code', 'INR', 'string', 94),
(1350, 'currency_symbol', '₹', 'string', 94),
(1351, 'school_name', 'John', 'string', 95),
(1352, 'school_email', 'tkexiekb@do-not-respond.me', 'string', 95),
(1353, 'school_phone', '68', 'number', 95),
(1354, 'school_tagline', 'John', 'string', 95),
(1355, 'school_address', 'uqMGTP VNKz BDfKM', 'string', 95),
(1356, 'session_year', '105', 'number', 95),
(1357, 'horizontal_logo', 'horizontal_logo.png', 'file', 95),
(1358, 'vertical_logo', 'vertical_logo.png', 'file', 95),
(1359, 'timetable_start_time', '09:00:00', 'time', 95),
(1360, 'timetable_end_time', '18:00:00', 'time', 95),
(1361, 'timetable_duration', '01:00:00', 'time', 95),
(1362, 'auto_renewal_plan', '1', 'integer', 95),
(1363, 'currency_code', 'INR', 'string', 95),
(1364, 'currency_symbol', '₹', 'string', 95),
(1365, 'school_name', 'Kevin Barber', 'string', 96),
(1366, 'school_email', 'chinner.renato@yahoo.com', 'string', 96),
(1367, 'school_phone', '467586270', 'number', 96),
(1368, 'school_tagline', 'Kevin Barber', 'string', 96),
(1369, 'school_address', 'Hi Taaply,\r\n\r\nMost business owners pour money into marketing that doesn’t work. They run ads, post on social media, and hope for the best—only to be disappointed by the results. \r\n\r\nThe probl', 'string', 96),
(1370, 'session_year', '106', 'number', 96),
(1371, 'horizontal_logo', 'horizontal_logo.png', 'file', 96),
(1372, 'vertical_logo', 'vertical_logo.png', 'file', 96),
(1373, 'timetable_start_time', '09:00:00', 'time', 96),
(1374, 'timetable_end_time', '18:00:00', 'time', 96),
(1375, 'timetable_duration', '01:00:00', 'time', 96),
(1376, 'auto_renewal_plan', '1', 'integer', 96),
(1377, 'currency_code', 'INR', 'string', 96),
(1378, 'currency_symbol', '₹', 'string', 96);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A', 1, '2024-06-16 21:14:07', '2024-06-16 21:14:07', NULL),
(2, 'Boys', 2, '2024-06-17 23:48:54', '2024-06-17 23:48:54', NULL),
(3, 'Girls', 4, '2024-06-18 05:58:39', '2024-06-18 05:58:39', NULL),
(4, '1', 26, '2024-06-24 07:38:10', '2024-06-24 07:50:18', '2024-06-24 07:50:18'),
(5, 'A', 26, '2024-06-24 07:50:09', '2024-06-24 07:50:09', NULL),
(6, 'B', 26, '2024-06-24 07:50:14', '2024-06-24 07:50:14', NULL),
(7, 'MobileApis', 29, '2024-06-25 18:09:36', '2024-06-25 18:09:36', NULL),
(8, 'A', 31, '2024-06-26 02:48:29', '2024-06-26 02:48:29', NULL),
(9, 'Nursery', 32, '2024-06-27 00:56:49', '2024-06-27 00:56:49', NULL),
(10, 'Primary', 32, '2024-06-27 00:56:57', '2024-06-27 00:56:57', NULL),
(11, 'Primary', 33, '2024-07-01 18:18:07', '2024-07-01 18:25:25', NULL),
(12, 'Nursery', 33, '2024-07-01 18:18:19', '2024-07-01 18:25:10', NULL),
(13, 'Computer Engineering', 36, '2024-07-04 16:14:58', '2024-07-04 17:58:00', NULL),
(14, 'International Business', 36, '2024-07-04 16:15:20', '2024-07-04 17:57:41', NULL),
(15, 'Engineering', 36, '2024-07-04 17:06:21', '2024-07-04 17:57:27', NULL),
(16, 'Secondary', 33, '2024-07-22 01:25:36', '2024-07-22 01:25:36', NULL),
(17, 'Highschool', 33, '2024-07-22 01:25:44', '2024-07-22 01:25:44', NULL),
(18, 'roni', 33, '2025-01-20 21:59:45', '2025-01-20 21:59:45', NULL),
(19, 'Secondary', 73, '2025-01-20 23:01:01', '2025-02-01 06:33:47', '2025-02-01 06:33:47'),
(20, 'ANGLOPHONE', 73, '2025-02-01 06:33:24', '2025-02-01 06:33:24', NULL),
(21, 'FRANCOPHONE', 73, '2025-02-01 06:33:35', '2025-02-01 06:33:35', NULL),
(22, 'MBEMBOUNG NGONVE GILBERT', 73, '2025-02-14 18:16:28', '2025-02-26 20:26:33', '2025-02-26 20:26:33'),
(23, 'Bilingue', 73, '2025-03-18 00:32:14', '2025-03-18 00:32:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_month` tinyint NOT NULL,
  `end_month` tinyint NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `start_month`, `end_month`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Semester 1', 1, 12, 4, '2024-06-18 23:54:02', '2024-06-18 23:54:02', NULL),
(2, '2024-2025', 9, 6, 26, '2024-06-24 07:55:34', '2024-06-24 07:55:34', NULL),
(3, 'First Term', 9, 12, 32, '2024-06-27 01:01:48', '2024-06-27 01:01:48', NULL),
(4, 'Second Term', 1, 3, 32, '2024-06-27 01:02:04', '2024-06-27 01:02:42', NULL),
(5, 'Third Term', 4, 5, 32, '2024-06-27 01:02:48', '2024-06-27 01:02:48', NULL),
(6, 'First Term', 9, 12, 33, '2024-07-01 18:33:45', '2024-07-01 18:33:45', NULL),
(7, 'Second Term', 1, 3, 33, '2024-07-01 18:34:08', '2024-07-01 18:34:08', NULL),
(8, '1st Semester', 9, 12, 36, '2024-07-04 17:55:28', '2024-07-04 17:55:28', NULL),
(9, '2nd Semester', 1, 3, 36, '2024-07-04 17:55:45', '2024-07-04 17:55:45', NULL),
(13, 'trimestre 2', 12, 4, 73, '2025-02-26 21:42:22', '2025-03-18 00:37:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_years`
--

CREATE TABLE `session_years` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_years`
--

INSERT INTO `session_years` (`id`, `name`, `default`, `start_date`, `end_date`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2022-23', 1, '2022-06-01', '2023-04-30', 1, '2024-06-15 20:54:13', '2024-06-15 20:54:13', NULL),
(2, '2022-23', 1, '2022-06-01', '2023-04-30', 2, '2024-06-17 23:46:05', '2024-06-17 23:46:05', NULL),
(3, '2022-23', 1, '2022-06-01', '2023-04-30', 3, '2024-06-18 05:37:09', '2024-06-18 05:37:09', NULL),
(4, '2022-23', 1, '2022-06-01', '2023-04-30', 4, '2024-06-18 05:55:21', '2024-06-18 05:55:21', NULL),
(5, '2022-23', 0, '2022-06-01', '2023-04-30', 5, '2024-06-19 19:03:48', '2024-06-21 22:43:07', NULL),
(6, '2022-23', 1, '2022-06-01', '2023-04-30', 6, '2024-06-19 20:09:56', '2024-06-19 20:09:56', NULL),
(7, '2022-23', 1, '2022-06-01', '2023-04-30', 7, '2024-06-20 07:06:08', '2024-06-20 07:06:08', NULL),
(8, '2024-2025', 1, '2024-09-01', '2025-05-31', 5, '2024-06-21 22:42:53', '2024-06-24 07:20:25', NULL),
(23, '2022-23', 1, '2022-06-01', '2023-04-30', 22, '2024-06-24 06:00:23', '2024-06-24 06:00:23', NULL),
(24, '2022-23', 1, '2022-06-01', '2023-04-30', 23, '2024-06-24 06:45:26', '2024-06-24 06:45:26', NULL),
(25, '2022-23', 1, '2022-06-01', '2023-04-30', 24, '2024-06-24 06:47:20', '2024-06-24 06:47:20', NULL),
(26, '2022-23', 1, '2022-06-01', '2023-04-30', 25, '2024-06-24 06:51:08', '2024-06-24 06:51:08', NULL),
(27, '2022-23', 0, '2022-06-01', '2023-04-30', 26, '2024-06-24 07:23:16', '2024-06-24 08:22:08', NULL),
(28, '2024-2025', 1, '2024-06-01', '2025-09-30', 26, '2024-06-24 08:21:50', '2024-06-24 08:22:08', NULL),
(29, '2023-24', 0, '2023-06-01', '2024-04-30', 27, '2024-06-24 23:03:18', '2024-06-25 19:12:42', NULL),
(30, '2024-25', 1, '2024-06-24', '2025-06-24', 27, '2024-06-25 00:05:49', '2024-06-25 00:05:55', NULL),
(31, '2022-23', 1, '2022-06-01', '2023-04-30', 28, '2024-06-25 00:18:18', '2024-06-25 00:18:18', NULL),
(32, '2022-23', 0, '2022-06-01', '2023-04-30', 29, '2024-06-25 02:13:31', '2024-06-25 18:48:57', NULL),
(33, '2022-23', 1, '2022-06-01', '2023-04-30', 30, '2024-06-25 14:24:46', '2024-06-25 14:24:46', NULL),
(34, '2024-2025', 1, '2024-06-25', '2025-06-25', 29, '2024-06-25 18:48:42', '2024-06-25 18:48:57', NULL),
(35, '2025-26', 0, '2025-09-01', '2026-06-30', 27, '2024-06-25 19:12:07', '2024-06-25 19:12:07', NULL),
(36, '2022-23', 1, '2022-06-01', '2023-04-30', 31, '2024-06-26 02:35:29', '2024-06-26 02:35:29', NULL),
(37, '2022-23', 0, '2022-06-01', '2023-04-30', 32, '2024-06-27 00:51:56', '2024-06-27 00:59:35', '2024-06-27 00:59:35'),
(38, '2024-25', 1, '2024-09-02', '2025-05-30', 32, '2024-06-27 00:58:46', '2024-06-27 00:58:57', NULL),
(39, '2022-23', 0, '2022-06-01', '2023-04-30', 33, '2024-07-01 18:08:45', '2024-07-01 18:13:58', '2024-07-01 18:13:58'),
(40, '2024-25', 1, '2024-09-01', '2025-06-30', 33, '2024-07-01 18:13:40', '2024-07-01 18:13:52', NULL),
(41, '2022-23', 1, '2022-06-01', '2023-04-30', 34, '2024-07-01 18:43:56', '2024-07-01 18:43:56', NULL),
(42, '2024-25', 0, '2024-09-02', '2025-06-30', 34, '2024-07-01 18:49:56', '2024-07-01 18:49:56', NULL),
(43, '2022-23', 1, '2022-06-01', '2023-04-30', 35, '2024-07-03 21:09:32', '2024-07-03 21:09:32', NULL),
(44, '2022-23', 0, '2022-06-01', '2023-04-30', 36, '2024-07-04 16:11:51', '2024-07-04 16:13:35', NULL),
(45, '2024-25', 1, '2024-09-01', '2025-05-31', 36, '2024-07-04 16:13:31', '2024-07-04 16:13:35', NULL),
(46, '2022-23', 1, '2022-06-01', '2023-04-30', 37, '2024-07-18 22:47:50', '2024-07-18 22:47:50', NULL),
(47, '2022-23', 1, '2022-06-01', '2023-04-30', 38, '2024-07-20 07:26:22', '2024-07-20 07:26:22', NULL),
(48, '2025-26', 0, '2025-09-01', '2026-06-30', 33, '2024-07-22 07:21:11', '2024-07-22 07:21:39', NULL),
(49, '2022-23', 1, '2022-06-01', '2023-04-30', 39, '2024-07-23 00:30:36', '2024-07-23 00:30:36', NULL),
(50, '2022-23', 1, '2022-06-01', '2023-04-30', 40, '2024-08-10 14:45:24', '2024-08-10 14:45:24', NULL),
(51, '2022-23', 1, '2022-06-01', '2023-04-30', 41, '2024-09-08 22:32:52', '2024-09-08 22:32:52', NULL),
(52, '2022-23', 1, '2022-06-01', '2023-04-30', 42, '2024-09-22 15:32:03', '2024-09-22 15:32:03', NULL),
(53, '2022-23', 1, '2022-06-01', '2023-04-30', 43, '2024-09-25 21:58:59', '2024-09-25 21:58:59', NULL),
(54, '2022-23', 1, '2022-06-01', '2023-04-30', 44, '2024-09-26 22:47:08', '2024-09-26 22:47:08', NULL),
(55, '2022-23', 1, '2022-06-01', '2023-04-30', 45, '2024-09-27 06:35:16', '2024-09-27 06:35:16', NULL),
(56, '2022-23', 1, '2022-06-01', '2023-04-30', 46, '2024-09-30 05:44:02', '2024-09-30 05:44:02', NULL),
(57, '2022-23', 1, '2022-06-01', '2023-04-30', 47, '2024-09-30 06:36:03', '2024-09-30 06:36:03', NULL),
(58, '2022-23', 1, '2022-06-01', '2023-04-30', 48, '2024-10-07 13:17:50', '2024-10-07 13:17:50', NULL),
(59, '2022-23', 1, '2022-06-01', '2023-04-30', 49, '2024-10-13 02:26:48', '2024-10-13 02:26:48', NULL),
(60, '2022-23', 1, '2022-06-01', '2023-04-30', 50, '2024-10-14 17:03:38', '2024-10-14 17:03:38', NULL),
(61, '2022-23', 1, '2022-06-01', '2023-04-30', 51, '2024-10-15 22:36:48', '2024-10-15 22:36:48', NULL),
(62, '2022-23', 1, '2022-06-01', '2023-04-30', 52, '2024-10-16 01:58:57', '2024-10-16 01:58:57', NULL),
(63, '2022-23', 1, '2022-06-01', '2023-04-30', 53, '2024-10-16 15:26:32', '2024-10-16 15:26:32', NULL),
(64, '2022-23', 1, '2022-06-01', '2023-04-30', 54, '2024-10-23 15:46:44', '2024-10-23 15:46:44', NULL),
(65, '2022-23', 1, '2022-06-01', '2023-04-30', 55, '2024-10-28 06:56:53', '2024-10-28 06:56:53', NULL),
(66, '2022-23', 1, '2022-06-01', '2023-04-30', 56, '2024-10-29 11:55:07', '2024-10-29 11:55:07', NULL),
(67, '2022-23', 1, '2022-06-01', '2023-04-30', 57, '2024-11-09 12:02:15', '2024-11-09 12:02:15', NULL),
(68, '2022-23', 1, '2022-06-01', '2023-04-30', 58, '2024-11-17 15:46:12', '2024-11-17 15:46:12', NULL),
(69, '2022-23', 1, '2022-06-01', '2023-04-30', 59, '2024-11-30 10:07:02', '2024-11-30 10:07:02', NULL),
(70, '2022-23', 1, '2022-06-01', '2023-04-30', 60, '2024-12-01 22:36:27', '2024-12-01 22:36:27', NULL),
(71, '2022-23', 1, '2022-06-01', '2023-04-30', 61, '2024-12-03 22:13:35', '2024-12-03 22:13:35', NULL),
(72, '2022-23', 1, '2022-06-01', '2023-04-30', 62, '2024-12-05 10:34:46', '2024-12-05 10:34:46', NULL),
(73, '2022-23', 1, '2022-06-01', '2023-04-30', 63, '2024-12-16 11:15:23', '2024-12-16 11:15:23', NULL),
(74, '2022-23', 1, '2022-06-01', '2023-04-30', 64, '2024-12-17 20:04:34', '2024-12-17 20:04:34', NULL),
(75, '2022-23', 1, '2022-06-01', '2023-04-30', 65, '2024-12-21 07:23:41', '2024-12-21 07:23:41', NULL),
(76, '2022-23', 1, '2022-06-01', '2023-04-30', 66, '2024-12-22 04:47:26', '2024-12-22 04:47:26', NULL),
(77, '2022-23', 1, '2022-06-01', '2023-04-30', 67, '2024-12-26 09:17:14', '2024-12-26 09:17:14', NULL),
(78, '2022-23', 1, '2022-06-01', '2023-04-30', 68, '2024-12-31 14:22:37', '2024-12-31 14:22:37', NULL),
(79, '2022-23', 1, '2022-06-01', '2023-04-30', 69, '2025-01-01 10:23:08', '2025-01-01 10:23:08', NULL),
(80, '2022-23', 1, '2022-06-01', '2023-04-30', 70, '2025-01-06 10:34:30', '2025-01-06 10:34:30', NULL),
(81, '2022-23', 1, '2022-06-01', '2023-04-30', 71, '2025-01-16 19:06:56', '2025-01-16 19:06:56', NULL),
(82, '2022-23', 1, '2022-06-01', '2023-04-30', 72, '2025-01-18 22:07:29', '2025-01-18 22:07:29', NULL),
(83, '2024-25', 1, '2024-09-09', '2025-06-06', 73, '2025-01-20 22:40:09', '2025-02-26 22:03:16', NULL),
(84, '2022-23', 1, '2022-06-01', '2023-04-30', 74, '2025-01-23 13:13:48', '2025-01-23 13:13:48', NULL),
(85, '2022-23', 1, '2022-06-01', '2023-04-30', 75, '2025-01-25 00:36:25', '2025-01-25 00:36:25', NULL),
(86, '2022-23', 1, '2022-06-01', '2023-04-30', 76, '2025-01-29 13:34:28', '2025-01-29 13:34:28', NULL),
(87, '2022-23', 1, '2022-06-01', '2023-04-30', 77, '2025-01-31 10:57:52', '2025-01-31 10:57:52', NULL),
(88, '2022-23', 1, '2022-06-01', '2023-04-30', 78, '2025-02-03 23:17:14', '2025-02-03 23:17:14', NULL),
(89, '2022-23', 1, '2022-06-01', '2023-04-30', 79, '2025-02-06 08:00:22', '2025-02-06 08:00:22', NULL),
(90, '2022-23', 1, '2022-06-01', '2023-04-30', 80, '2025-02-11 14:04:52', '2025-02-11 14:04:52', NULL),
(91, '2022-23', 1, '2022-06-01', '2023-04-30', 81, '2025-02-12 09:55:58', '2025-02-12 09:55:58', NULL),
(92, '2022-23', 1, '2022-06-01', '2023-04-30', 82, '2025-02-12 10:00:43', '2025-02-12 10:00:43', NULL),
(93, '2022-23', 1, '2022-06-01', '2023-04-30', 83, '2025-02-14 04:46:24', '2025-02-14 04:46:24', NULL),
(94, '2022-23', 1, '2022-06-01', '2023-04-30', 84, '2025-02-16 09:44:44', '2025-02-16 09:44:44', NULL),
(95, '2022-23', 1, '2022-06-01', '2023-04-30', 85, '2025-02-16 13:17:46', '2025-02-16 13:17:46', NULL),
(96, '2022-23', 1, '2022-06-01', '2023-04-30', 86, '2025-02-17 15:28:58', '2025-02-17 15:28:58', NULL),
(97, '2022-23', 1, '2022-06-01', '2023-04-30', 87, '2025-03-02 10:56:19', '2025-03-02 10:56:19', NULL),
(98, '2022-23', 1, '2022-06-01', '2023-04-30', 88, '2025-03-04 02:44:36', '2025-03-04 02:44:36', NULL),
(99, '2022-23', 1, '2022-06-01', '2023-04-30', 89, '2025-03-04 13:09:49', '2025-03-04 13:09:49', NULL),
(100, '2022-23', 1, '2022-06-01', '2023-04-30', 90, '2025-03-05 12:42:24', '2025-03-05 12:42:24', NULL),
(101, '2022-23', 1, '2022-06-01', '2023-04-30', 91, '2025-03-09 17:08:43', '2025-03-09 17:08:43', NULL),
(102, '2022-23', 1, '2022-06-01', '2023-04-30', 92, '2025-03-10 15:02:39', '2025-03-10 15:02:39', NULL),
(103, '2022-23', 1, '2022-06-01', '2023-04-30', 93, '2025-03-13 00:57:53', '2025-03-13 00:57:53', NULL),
(104, '2022-23', 1, '2022-06-01', '2023-04-30', 94, '2025-03-19 10:34:35', '2025-03-19 10:34:35', NULL),
(105, '2022-23', 1, '2022-06-01', '2023-04-30', 95, '2025-03-20 00:19:07', '2025-03-20 00:19:07', NULL),
(106, '2022-23', 1, '2022-06-01', '2023-04-30', 96, '2025-03-25 14:12:13', '2025-03-25 14:12:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `name`, `start_time`, `end_time`, `status`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Morning', '09:00:00', '14:00:00', 1, 4, '2024-06-18 22:14:22', '2024-06-18 22:14:22', NULL),
(2, 'Teaching', '09:00:00', '10:00:00', 1, 26, '2024-06-24 21:53:55', '2024-06-24 21:54:43', '2024-06-24 21:54:43'),
(3, 'Morning Class', '08:00:00', '15:00:00', 1, 26, '2024-06-24 21:54:16', '2024-06-25 18:18:57', NULL),
(4, 'Evening Class', '17:00:00', '19:00:00', 1, 26, '2024-06-25 18:18:45', '2024-06-25 18:19:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `link`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'sliders/667d40d83c2cb4.050569381719484632.jpg', NULL, 29, '2024-06-27 20:05:40', '2024-06-27 20:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `qualification` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `user_id`, `qualification`, `salary`, `created_at`, `updated_at`) VALUES
(1, 3, 'Phd Pharmacy', 100, '2024-06-16 21:16:46', '2024-06-16 21:16:46'),
(2, 22, 'Masters', 600000, '2024-06-18 22:11:17', '2024-06-18 22:11:17'),
(3, 23, 'Bachelors', 124566, '2024-06-18 23:49:19', '2024-06-18 23:49:19'),
(4, 46, 'BSC', 100, '2024-06-24 07:44:19', '2024-06-24 07:44:19'),
(5, 79, 'BSC Maths', 1000, '2024-06-25 07:15:24', '2024-06-25 07:15:24'),
(6, 90, 'MA Economics', 150000, '2024-06-26 02:59:24', '2024-06-26 02:59:24'),
(7, 101, NULL, 0, '2024-06-27 01:50:27', '2024-06-27 01:50:27'),
(8, 104, 'MS Physics', 2000, '2024-06-28 16:29:37', '2024-06-28 16:29:37'),
(9, 108, 'Gestionnaire RH', 21000, '2024-07-04 00:44:00', '2024-07-04 00:44:00'),
(10, 112, 'Licence', 200000, '2024-07-20 07:58:32', '2024-07-20 07:58:32'),
(11, 119, 'MA in Economics', 150000, '2024-07-22 03:17:05', '2024-07-22 03:17:05'),
(12, 120, NULL, 300000, '2024-07-22 03:41:47', '2024-07-22 03:41:47'),
(13, 171, 'Langue et Culture National', 150000, '2025-02-26 20:10:05', '2025-02-26 20:10:05'),
(14, 172, 'Histoire -Geographie -ECM', 150000, '2025-02-26 20:12:04', '2025-02-26 20:12:04'),
(15, 173, 'Musique', 150000, '2025-02-26 20:14:03', '2025-02-26 20:14:03'),
(16, 186, 'TRAVAIL MANUEL', 100000, '2025-03-07 20:13:08', '2025-03-07 20:13:08'),
(17, 187, 'ANGLAIS', 100000, '2025-03-07 20:31:12', '2025-03-07 20:31:12'),
(18, 188, 'SVTEEHB', 100000, '2025-03-07 20:33:39', '2025-03-07 20:33:39'),
(19, 189, 'ANGLAIS/FRENCH', 100000, '2025-03-07 20:36:05', '2025-03-07 20:36:05'),
(20, 190, 'ALLEMAND', 100000, '2025-03-07 20:38:24', '2025-03-07 20:38:24'),
(21, 191, 'PCT', 100000, '2025-03-07 20:40:11', '2025-03-07 20:40:11'),
(22, 192, 'ESPAGNOL', 100000, '2025-03-07 20:42:42', '2025-03-07 20:42:42'),
(23, 193, 'ORIENTATION/EVA', 100000, '2025-03-07 20:49:45', '2025-03-07 20:49:45'),
(24, 194, 'MATHEMATIQUES', 100000, '2025-03-07 20:53:43', '2025-03-07 20:53:43'),
(25, 195, 'HISTOIRE-GEOGRAPHIE-ECM', 100000, '2025-03-07 21:04:18', '2025-03-07 21:04:18'),
(26, 201, 'INFORMATIQUE', 100000, '2025-03-20 22:32:13', '2025-03-20 22:32:13'),
(27, 202, 'ESF', 100000, '2025-03-20 22:35:08', '2025-03-20 22:35:08'),
(28, 203, 'FRANÇAIS', 100000, '2025-03-20 22:54:26', '2025-03-20 22:54:26'),
(29, 204, 'FRANÇAIS', 10000, '2025-03-20 23:47:43', '2025-03-20 23:47:43'),
(30, 205, 'FRANÇAIS', 100000, '2025-03-20 23:54:20', '2025-03-20 23:54:20'),
(31, 206, 'HISTOIRE-GEOGRAPHIE-ECM', 100000, '2025-03-20 23:59:06', '2025-03-20 23:59:06'),
(32, 207, 'EPS', 100000, '2025-03-21 00:13:02', '2025-03-21 00:13:02'),
(33, 208, 'ECONOMICS AND COMMERCE', 100000, '2025-03-21 18:22:58', '2025-03-21 18:22:58'),
(34, 209, 'NATIONAL LANGAGE AND CULTURE', 100000, '2025-03-23 00:19:22', '2025-03-23 00:19:22'),
(35, 210, 'COMPUTER SCIENCE', 100000, '2025-03-23 00:23:47', '2025-03-23 00:23:47'),
(36, 211, 'MANUAL LABOUR', 100000, '2025-03-23 00:26:47', '2025-03-23 00:26:47'),
(37, 212, 'LITERATURE IN ENGLISH', 100000, '2025-03-23 00:29:42', '2025-03-23 00:29:42'),
(38, 213, 'PHYSICS', 100000, '2025-03-23 00:35:33', '2025-03-23 00:35:33'),
(39, 214, 'CITIZENSHIP', 100000, '2025-03-24 20:22:44', '2025-03-24 20:22:44'),
(40, 215, 'BIOLOGY-CHEMISTRY', 100000, '2025-03-24 20:33:01', '2025-03-24 20:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `staff_support_schools`
--

CREATE TABLE `staff_support_schools` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`id`, `name`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Good', 4, '2024-06-18 22:13:48', '2024-06-18 22:13:48', NULL),
(2, 'Science', 26, '2024-06-24 21:52:28', '2024-06-24 21:52:28', NULL),
(3, 'Arts', 26, '2024-06-24 21:52:32', '2024-06-24 21:52:32', NULL),
(4, 'Arts', 33, '2024-07-01 18:34:35', '2024-07-01 18:34:35', NULL),
(5, 'Science', 33, '2024-07-01 18:34:42', '2024-07-01 18:34:42', NULL),
(6, 'Masters', 36, '2024-07-04 17:56:06', '2024-07-04 17:56:06', NULL),
(7, 'Bachelors', 36, '2024-07-04 17:56:13', '2024-07-04 17:56:13', NULL),
(8, 'Section A', 33, '2024-07-22 01:44:37', '2024-07-22 01:45:08', NULL),
(9, 'Section B', 33, '2024-07-22 01:44:41', '2024-07-22 01:44:51', NULL),
(10, 'SERIE SIENTIFIQUE', 73, '2025-02-01 06:39:34', '2025-02-01 06:39:34', NULL),
(11, 'SERIE LITTERAIRE', 73, '2025-02-01 06:39:58', '2025-02-01 06:39:58', NULL),
(12, 'GENERALE', 73, '2025-02-01 06:41:05', '2025-02-01 06:41:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `admission_no` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_number` int DEFAULT NULL,
  `admission_date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `guardian_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `class_section_id`, `admission_no`, `roll_number`, `admission_date`, `school_id`, `guardian_id`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 1, '2022-2311', 1, '2024-06-16', 1, 4, 1, '2024-06-16 21:20:41', '2024-06-16 21:20:41', NULL),
(2, 8, 2, '2022-2321', 1, '2024-06-17', 2, 7, 2, '2024-06-17 23:54:14', '2024-06-17 23:54:14', NULL),
(3, 10, 2, '2022-2323', 2, '2024-06-18', 2, 9, 2, '2024-06-18 05:27:25', '2024-06-18 05:27:25', NULL),
(4, 14, 3, '2022-2341', 1, '2024-06-18', 4, 13, 4, '2024-06-18 06:01:17', '2024-06-18 06:01:17', NULL),
(5, 18, 3, '2022-2345', 2, '2024-06-18', 4, 19, 4, '2024-06-18 21:47:47', '2024-06-18 21:50:31', NULL),
(6, 21, 3, '2022-2346', 3, '2024-06-18', 4, 20, 4, '2024-06-18 21:52:53', '2024-06-18 21:52:53', NULL),
(7, 48, 5, '2022-23261', 1, '2024-12-12', 26, 47, 27, '2024-06-24 08:16:25', '2024-06-24 08:16:25', NULL),
(8, 50, 5, '2024-2025268', 2, '2024-06-23', 26, 49, 28, '2024-06-24 08:24:18', '2024-06-24 08:24:18', NULL),
(9, 74, 7, '2024-2025269', 1, '2024-12-12', 26, 47, 28, '2024-06-25 07:01:28', '2024-06-25 07:01:28', NULL),
(10, 76, 7, '2024-20252610', 2, '2024-12-06', 26, 75, 28, '2024-06-25 07:01:29', '2024-06-25 07:01:29', NULL),
(11, 77, 7, '2024-20252611', 3, '2024-12-12', 26, 47, 28, '2024-06-25 07:02:11', '2024-06-25 07:02:11', NULL),
(12, 78, 7, '2024-20252612', 4, '2024-12-06', 26, 75, 28, '2024-06-25 07:02:12', '2024-06-25 07:02:12', NULL),
(13, 81, 9, '2024-20252613', 1, '2024-06-24', 26, 80, 27, '2024-06-25 07:23:53', '2024-06-25 18:24:59', NULL),
(14, 84, 8, '2024-20252614', 1, '2024-06-25', 26, 83, 28, '2024-06-25 18:08:37', '2024-06-25 18:08:37', NULL),
(15, 85, 10, '2024-20252615', 1, '2024-12-12', 26, 47, 28, '2024-06-25 18:09:27', '2024-06-25 18:09:27', NULL),
(16, 86, 10, '2024-20252616', 2, '2024-12-06', 26, 75, 28, '2024-06-25 18:09:28', '2024-06-25 18:09:28', NULL),
(17, 87, 12, '2024-20252617', 1, '2024-12-12', 26, 47, 27, '2024-06-25 18:11:55', '2024-06-25 18:44:33', NULL),
(18, 88, 12, '2024-20252618', 2, '2024-12-06', 26, 75, 28, '2024-06-25 18:11:56', '2024-06-25 18:11:56', NULL),
(19, 99, 14, '2022-23311', 1, '2024-06-26', 31, 98, 36, '2024-06-26 16:47:38', '2024-06-26 16:47:38', NULL),
(20, 103, 13, '2024-2025291', 1, '2024-06-27', 29, 102, 34, '2024-06-27 19:55:22', '2024-06-27 19:55:22', NULL),
(21, 121, 43, '2024-25331', 2, '2024-07-21', 33, 98, 40, '2024-07-22 04:28:32', '2024-07-22 07:16:11', NULL),
(22, 122, 43, '2024-253322', 1, '2024-07-21', 33, 98, 40, '2024-07-22 04:32:48', '2024-07-22 07:16:11', NULL),
(23, 175, 53, '2022-23731', 1, '2025-02-26', 73, 174, 83, '2025-02-26 21:01:55', '2025-02-26 21:01:55', NULL),
(24, 177, 53, '2022-237324', 2, '2025-02-18', 73, 176, 83, '2025-02-26 21:03:56', '2025-02-26 21:03:56', NULL),
(25, 179, 53, '2022-237325', 3, '2025-02-26', 73, 178, 83, '2025-02-26 21:06:42', '2025-02-26 21:06:42', NULL),
(26, 181, 53, '2022-237326', 4, '2025-02-26', 73, 180, 83, '2025-02-26 21:09:29', '2025-02-26 21:09:29', NULL),
(27, 217, 55, '2024-257327', 1, '2025-03-17', 73, 47, 83, '2025-03-26 21:55:29', '2025-03-26 21:55:29', NULL),
(28, 218, 55, '2024-257328', 2, '2025-03-17', 73, 47, 83, '2025-03-26 21:55:30', '2025-03-26 21:55:30', NULL),
(29, 219, 55, '2024-257329', 3, '2025-03-17', 73, 47, 83, '2025-03-26 21:55:31', '2025-03-26 21:55:31', NULL),
(30, 220, 55, '2024-257330', 4, '2025-03-17', 73, 47, 83, '2025-03-26 21:55:31', '2025-03-26 21:55:31', NULL),
(31, 221, 55, '2024-257331', 5, '2025-03-17', 73, 47, 83, '2025-03-26 21:55:32', '2025-03-26 21:55:32', NULL),
(32, 222, 55, '2024-257332', 6, '2025-03-17', 73, 47, 83, '2025-03-26 21:55:33', '2025-03-26 21:55:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_online_exam_statuses`
--

CREATE TABLE `student_online_exam_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `online_exam_id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL COMMENT '1 - in progress 2 - completed',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` bigint UNSIGNED NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Theory / Practical',
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `bg_color`, `image`, `medium_id`, `type`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Islamiyat', '123', '#ffff00', 'subject/66717f94435567.156818871718714260.png', 3, 'Theory', 4, '2024-06-18 22:07:40', '2024-06-18 22:07:40', NULL),
(2, 'Science', NULL, '#ff0000', 'subject/66719f4a12c7e7.384178521718722378.png', 3, 'Theory', 4, '2024-06-18 23:44:51', '2024-06-19 00:22:58', NULL),
(3, 'Chemistry', '10203', '#ce1313', 'subject/6678a0aa1e9db6.134474091719181482.jpeg', 4, 'Theory', 26, '2024-06-24 07:54:42', '2024-06-24 07:54:55', NULL),
(4, 'Geography', '7484844', '#4b00ff', 'subject/667964b3dd4938.211060861719231667.jpg', 4, 'Theory', 26, '2024-06-24 21:49:51', '2024-06-24 21:51:07', NULL),
(5, 'Biology', '101', '#05c883', 'subject/667afc1248bae1.276774451719335954.jpeg', 7, 'Theory', 31, '2024-06-26 02:49:14', '2024-06-26 02:49:14', NULL),
(6, 'Mathematics', NULL, '#005ecb', 'subject/667c36164d79a1.261265141719416342.png', 8, 'Theory', 32, '2024-06-27 01:09:03', '2024-06-27 01:09:03', NULL),
(7, 'Mathematics', 'Mathematics', '#ffff00', 'subject/667d41daad56e4.965022301719484890.jpg', 6, 'Theory', 29, '2024-06-27 20:11:30', '2024-06-27 20:14:15', NULL),
(8, 'Chemistry', 'Chemistry', '#a05ade', 'subject/667d43674d71c2.811213641719485287.png', 6, 'Theory', 29, '2024-06-27 20:18:07', '2024-06-27 20:18:07', NULL),
(9, 'Biology', 'BioLogy', '#de2d2c', 'subject/667d4445bfd444.332428221719485509.png', 6, 'Theory', 29, '2024-06-27 20:21:49', '2024-06-27 20:21:49', NULL),
(10, 'Chemistry', '101', '#0a95cc', 'subject/669d7f96794414.206894281721597846.jpg', 10, 'Theory', 33, '2024-07-01 18:30:43', '2024-07-22 07:07:26', NULL),
(11, 'Geography', '102', '#e92fe3', 'subject/668270a0134127.250109921719824544.jpg', 10, 'Theory', 33, '2024-07-01 18:32:24', '2024-07-01 18:32:24', NULL),
(12, 'Economics', NULL, '#0f982a', 'subject/66865289796d95.376952191720078985.jpg', 12, 'Theory', 36, '2024-07-04 16:16:21', '2024-07-04 17:13:05', NULL),
(13, 'Econometrics', NULL, '#7800c3', 'subject/66865211c0f755.006362541720078865.png', 12, 'Theory', 36, '2024-07-04 17:08:42', '2024-07-04 17:11:05', NULL),
(14, 'History', NULL, '#ff0000', 'subject/668651d87b3809.305213471720078808.png', 12, 'Theory', 36, '2024-07-04 17:10:08', '2024-07-04 17:10:08', NULL),
(15, 'Biology', '103', '#049e42', 'subject/669d7f52cd1658.478344091721597778.png', 10, 'Theory', 33, '2024-07-22 07:06:19', '2024-07-22 07:09:40', NULL),
(16, 'English Literature', '104', '#ffe256', 'subject/669d80041b6d43.351750091721597956.jpg', 10, 'Theory', 33, '2024-07-22 07:09:16', '2024-07-22 07:09:33', NULL),
(17, 'English language', 'EN-1', '#1596e6', 'subject/67bee75d4951b3.770475351740564317.jpeg', 14, 'Theory', 73, '2025-01-20 23:03:36', '2025-02-26 20:35:17', NULL),
(18, 'FRANCAIS', 'FR', '#eb0000', 'subject/67bee730d94319.886734571740564272.png', 14, 'Theory', 73, '2025-02-01 06:36:15', '2025-02-26 20:34:32', NULL),
(19, 'Langue et Culture Nationale', 'LCN', '#32d2d0', 'subject/67bee665133c83.390103631740564069.jpeg', 14, 'Theory', 73, '2025-02-26 20:31:09', '2025-02-26 20:31:09', NULL),
(20, 'Mathematique', 'MATHS', '#08d137', 'subject/67bee6c6143ef5.536260451740564166.jpeg', 14, 'Theory', 73, '2025-02-26 20:32:46', '2025-02-26 20:32:46', NULL),
(21, 'Physique - Chimie et technologie', 'PCT', '#f8ff2d', 'subject/67bee6f5db7c12.270485681740564213.jpeg', 14, 'Theory', 73, '2025-02-26 20:33:33', '2025-02-26 20:33:33', NULL),
(22, 'informatique', 'INFO', '#59c600', 'subject/67bef9bbee5c28.087633101740569019.jpeg', 14, 'Practical', 73, '2025-02-26 21:53:39', '2025-02-26 21:53:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_teachers`
--

INSERT INTO `subject_teachers` (`id`, `class_section_id`, `subject_id`, `teacher_id`, `class_subject_id`, `school_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 1, 22, 1, 4, '2024-06-18 23:45:51', '2024-06-18 23:45:51', NULL),
(2, 3, 2, 23, 3, 4, '2024-06-19 00:01:02', '2024-06-19 00:01:02', NULL),
(3, 12, 3, 46, 9, 26, '2024-06-24 22:20:37', '2024-06-24 22:20:37', NULL),
(4, 11, 3, 46, 9, 26, '2024-06-24 22:21:36', '2024-06-24 22:21:36', NULL),
(5, 10, 3, 46, 7, 26, '2024-06-24 22:21:54', '2024-06-24 22:21:54', NULL),
(6, 10, 4, 46, 8, 26, '2024-06-24 22:21:54', '2024-06-24 22:21:54', NULL),
(7, 9, 3, 46, 7, 26, '2024-06-24 22:22:17', '2024-06-24 22:22:17', NULL),
(8, 9, 4, 46, 8, 26, '2024-06-24 22:22:17', '2024-06-24 22:22:17', NULL),
(9, 8, 3, 46, 5, 26, '2024-06-24 22:22:31', '2024-06-24 22:22:31', NULL),
(10, 8, 4, 46, 6, 26, '2024-06-24 22:22:31', '2024-06-24 22:22:31', NULL),
(11, 7, 3, 46, 5, 26, '2024-06-24 22:22:43', '2024-06-24 22:22:43', NULL),
(12, 7, 4, 46, 6, 26, '2024-06-24 22:22:43', '2024-06-24 22:22:43', NULL),
(13, 13, 7, 104, 10, 29, '2024-06-28 16:34:13', '2024-07-17 00:54:29', NULL),
(14, 13, 8, 104, 11, 29, '2024-06-28 16:34:13', '2024-07-17 00:54:29', NULL),
(15, 13, 9, 104, 12, 29, '2024-06-28 16:34:13', '2024-07-17 00:54:29', NULL),
(19, 43, 11, 119, 14, 33, '2024-07-22 07:17:09', '2024-07-22 07:17:09', NULL),
(20, 43, 16, 119, 16, 33, '2024-07-22 07:17:09', '2024-07-22 07:17:09', NULL),
(21, 44, 11, 119, 18, 33, '2024-07-22 07:17:34', '2024-07-22 07:17:34', NULL),
(22, 44, 16, 119, 20, 33, '2024-07-22 07:17:34', '2024-07-22 07:17:34', NULL),
(23, 45, 11, 119, 22, 33, '2024-07-22 07:18:05', '2024-07-22 07:18:31', NULL),
(24, 45, 16, 119, 24, 33, '2024-07-22 07:18:05', '2024-07-22 07:18:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_charge` double(8,4) NOT NULL,
  `staff_charge` double(8,4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `billing_cycle` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `school_id`, `package_id`, `name`, `student_charge`, `staff_charge`, `start_date`, `end_date`, `billing_cycle`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 'Trial Package', 0.0000, 0.0000, '2024-06-18', '2024-07-02', 365, '2024-06-18 05:37:09', '2024-06-18 05:37:09'),
(2, 4, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-18', '2025-06-17', 365, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(3, 23, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(4, 24, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(5, 25, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(6, 22, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-24', '2024-06-24', 30, '2024-06-24 07:01:27', '2024-06-24 07:01:39'),
(7, 22, 2, 'Secondary & High School Education', 1.0000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(8, 5, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(9, 26, 2, 'Secondary & High School Education', 1.0000, 0.0000, '2024-06-24', '2024-06-24', 30, '2024-06-24 07:24:09', '2024-06-24 07:24:37'),
(10, 26, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(11, 29, 4, 'Trial Package', 0.0000, 0.0000, '2024-06-24', '2024-06-24', 30, '2024-06-25 02:16:15', '2024-06-25 02:17:01'),
(12, 29, 2, 'Secondary & High School Education', 1.0000, 0.0000, '2024-06-24', '2024-06-24', 30, '2024-06-25 02:17:01', '2024-06-25 02:17:28'),
(13, 29, 3, 'University Education', 2.0000, 0.0000, '2024-06-24', '2024-07-23', 30, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(14, 29, 3, 'University Education', 2.0000, 0.0000, '2024-07-24', '2024-08-22', 30, '2024-06-25 02:23:27', '2024-06-25 02:23:27'),
(15, 27, 4, 'Trial Package', 0.0000, 0.0000, '2024-06-25', '2024-07-09', 30, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(16, 30, 4, 'Trial Package', 0.0000, 0.0000, '2024-06-25', '2024-07-09', 30, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(17, 28, 4, 'Trial Package', 0.0000, 0.0000, '2024-06-25', '2024-07-09', 30, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(18, 31, 4, 'Trial Package', 0.0000, 0.0000, '2024-06-25', '2024-07-09', 30, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(19, 32, 1, 'Primary Education', 0.5000, 0.0000, '2024-06-26', '2024-07-25', 30, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(20, 33, 4, 'Trial Package', 0.0000, 0.0000, '2024-07-01', '2024-07-15', 30, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(21, 34, 4, 'Trial Package', 0.0000, 0.0000, '2024-07-01', '2024-07-15', 30, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(22, 36, 3, 'University Education', 2.0000, 0.0000, '2024-07-04', '2024-08-02', 30, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(23, 33, 3, 'University Education', 2.0000, 0.0000, '2024-07-20', '2024-08-18', 30, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(24, 37, 3, 'University Education', 2.0000, 0.0000, '2024-07-23', '2024-08-21', 30, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(25, 33, 3, 'University Education', 8.5000, 0.0000, '2024-08-19', '2024-08-22', 30, '2024-08-09 22:09:19', '2024-08-22 22:31:12'),
(26, 33, 2, 'Secondary & High School Education', 5.0000, 0.0000, '2024-08-22', '2025-08-21', 365, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(27, 73, 2, 'Secondary & High School Education', 5.0000, 0.0000, '2025-01-29', '2026-01-28', 365, '2025-01-29 19:02:12', '2025-01-29 19:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_bills`
--

CREATE TABLE `subscription_bills` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,4) NOT NULL,
  `total_student` bigint NOT NULL,
  `total_staff` bigint NOT NULL,
  `payment_transaction_id` bigint UNSIGNED DEFAULT NULL,
  `due_date` date NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_bills`
--

INSERT INTO `subscription_bills` (`id`, `subscription_id`, `description`, `amount`, `total_student`, `total_staff`, `payment_transaction_id`, `due_date`, `school_id`, `created_at`, `updated_at`) VALUES
(6, 6, NULL, 0.0000, 0, 0, NULL, '2024-06-26', 22, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(7, 9, NULL, 0.0000, 0, 0, NULL, '2024-06-26', 26, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(8, 11, NULL, 0.0000, 0, 0, NULL, '2024-07-04', 29, '2024-06-25 02:17:01', '2024-06-25 02:17:01'),
(9, 12, NULL, 0.0000, 0, 0, NULL, '2024-07-04', 29, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(10, 25, NULL, 2.2666, 2, 2, NULL, '2025-05-14', 33, '2024-08-22 22:31:12', '2025-01-17 20:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_features`
--

CREATE TABLE `subscription_features` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `feature_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_features`
--

INSERT INTO `subscription_features` (`id`, `subscription_id`, `feature_id`, `created_at`, `updated_at`) VALUES
(17, 2, 1, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(18, 2, 2, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(19, 2, 4, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(20, 2, 5, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(21, 2, 6, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(22, 2, 7, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(23, 2, 13, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(24, 2, 14, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(25, 2, 15, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(26, 2, 16, '2024-06-18 22:27:25', '2024-06-18 22:27:25'),
(43, 3, 1, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(44, 3, 2, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(45, 3, 3, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(46, 3, 4, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(47, 3, 5, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(48, 3, 6, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(49, 3, 7, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(50, 3, 8, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(51, 3, 9, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(52, 3, 10, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(53, 3, 11, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(54, 3, 12, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(55, 3, 13, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(56, 3, 14, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(57, 3, 15, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(58, 3, 16, '2024-06-24 06:45:26', '2024-06-24 06:45:26'),
(59, 4, 1, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(60, 4, 2, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(61, 4, 3, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(62, 4, 4, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(63, 4, 5, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(64, 4, 6, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(65, 4, 7, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(66, 4, 8, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(67, 4, 9, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(68, 4, 10, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(69, 4, 11, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(70, 4, 12, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(71, 4, 13, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(72, 4, 14, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(73, 4, 15, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(74, 4, 16, '2024-06-24 06:47:20', '2024-06-24 06:47:20'),
(75, 5, 1, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(76, 5, 2, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(77, 5, 3, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(78, 5, 4, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(79, 5, 5, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(80, 5, 6, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(81, 5, 7, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(82, 5, 8, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(83, 5, 9, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(84, 5, 10, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(85, 5, 11, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(86, 5, 12, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(87, 5, 13, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(88, 5, 14, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(89, 5, 15, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(90, 5, 16, '2024-06-24 06:51:08', '2024-06-24 06:51:08'),
(107, 7, 1, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(108, 7, 2, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(109, 7, 4, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(110, 7, 5, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(111, 7, 6, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(112, 7, 7, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(113, 7, 8, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(114, 7, 9, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(115, 7, 10, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(116, 7, 11, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(117, 7, 12, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(118, 7, 13, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(119, 7, 14, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(120, 7, 15, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(121, 7, 16, '2024-06-24 07:01:39', '2024-06-24 07:01:39'),
(122, 8, 1, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(123, 8, 2, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(124, 8, 3, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(125, 8, 4, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(126, 8, 5, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(127, 8, 6, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(128, 8, 7, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(129, 8, 8, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(130, 8, 9, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(131, 8, 10, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(132, 8, 11, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(133, 8, 12, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(134, 8, 13, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(135, 8, 14, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(136, 8, 15, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(137, 8, 16, '2024-06-24 07:17:26', '2024-06-24 07:17:26'),
(153, 10, 1, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(154, 10, 2, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(155, 10, 3, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(156, 10, 4, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(157, 10, 5, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(158, 10, 6, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(159, 10, 7, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(160, 10, 8, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(161, 10, 9, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(162, 10, 10, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(163, 10, 11, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(164, 10, 12, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(165, 10, 13, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(166, 10, 14, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(167, 10, 15, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(168, 10, 16, '2024-06-24 07:24:37', '2024-06-24 07:24:37'),
(169, 1, 1, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(170, 1, 2, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(171, 1, 4, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(172, 1, 5, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(173, 1, 3, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(174, 1, 6, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(175, 1, 7, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(176, 1, 8, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(177, 1, 9, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(178, 1, 10, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(179, 1, 11, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(180, 1, 12, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(181, 1, 13, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(182, 1, 14, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(183, 1, 15, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(184, 1, 16, '2024-06-25 02:04:26', '2024-06-25 02:04:26'),
(216, 13, 1, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(217, 13, 2, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(218, 13, 3, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(219, 13, 4, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(220, 13, 5, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(221, 13, 6, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(222, 13, 7, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(223, 13, 8, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(224, 13, 9, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(225, 13, 10, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(226, 13, 11, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(227, 13, 12, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(228, 13, 13, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(229, 13, 14, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(230, 13, 15, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(231, 13, 16, '2024-06-25 02:17:28', '2024-06-25 02:17:28'),
(232, 15, 1, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(233, 15, 2, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(234, 15, 3, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(235, 15, 4, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(236, 15, 5, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(237, 15, 6, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(238, 15, 7, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(239, 15, 8, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(240, 15, 9, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(241, 15, 10, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(242, 15, 11, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(243, 15, 12, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(244, 15, 13, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(245, 15, 14, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(246, 15, 15, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(247, 15, 16, '2024-06-25 06:31:05', '2024-06-25 06:31:05'),
(248, 16, 1, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(249, 16, 2, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(250, 16, 3, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(251, 16, 4, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(252, 16, 5, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(253, 16, 6, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(254, 16, 7, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(255, 16, 8, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(256, 16, 9, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(257, 16, 10, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(258, 16, 11, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(259, 16, 12, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(260, 16, 13, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(261, 16, 14, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(262, 16, 15, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(263, 16, 16, '2024-06-25 14:27:36', '2024-06-25 14:27:36'),
(264, 17, 1, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(265, 17, 2, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(266, 17, 3, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(267, 17, 4, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(268, 17, 5, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(269, 17, 6, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(270, 17, 7, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(271, 17, 8, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(272, 17, 9, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(273, 17, 10, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(274, 17, 11, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(275, 17, 12, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(276, 17, 13, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(277, 17, 14, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(278, 17, 15, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(279, 17, 16, '2024-06-25 17:54:31', '2024-06-25 17:54:31'),
(280, 18, 1, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(281, 18, 2, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(282, 18, 3, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(283, 18, 4, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(284, 18, 5, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(285, 18, 6, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(286, 18, 7, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(287, 18, 8, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(288, 18, 9, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(289, 18, 10, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(290, 18, 11, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(291, 18, 12, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(292, 18, 13, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(293, 18, 14, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(294, 18, 15, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(295, 18, 16, '2024-06-26 02:36:14', '2024-06-26 02:36:14'),
(296, 19, 1, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(297, 19, 2, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(298, 19, 3, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(299, 19, 4, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(300, 19, 5, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(301, 19, 6, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(302, 19, 7, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(303, 19, 8, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(304, 19, 9, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(305, 19, 10, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(306, 19, 11, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(307, 19, 12, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(308, 19, 13, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(309, 19, 14, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(310, 19, 15, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(311, 19, 16, '2024-06-27 00:53:02', '2024-06-27 00:53:02'),
(312, 20, 1, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(313, 20, 2, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(314, 20, 3, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(315, 20, 4, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(316, 20, 5, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(317, 20, 6, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(318, 20, 7, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(319, 20, 8, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(320, 20, 9, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(321, 20, 10, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(322, 20, 11, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(323, 20, 12, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(324, 20, 13, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(325, 20, 14, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(326, 20, 15, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(327, 20, 16, '2024-07-01 18:09:58', '2024-07-01 18:09:58'),
(328, 21, 1, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(329, 21, 2, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(330, 21, 3, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(331, 21, 4, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(332, 21, 5, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(333, 21, 6, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(334, 21, 7, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(335, 21, 8, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(336, 21, 9, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(337, 21, 10, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(338, 21, 11, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(339, 21, 12, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(340, 21, 13, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(341, 21, 14, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(342, 21, 15, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(343, 21, 16, '2024-07-01 18:46:05', '2024-07-01 18:46:05'),
(344, 22, 1, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(345, 22, 2, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(346, 22, 3, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(347, 22, 4, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(348, 22, 5, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(349, 22, 6, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(350, 22, 7, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(351, 22, 8, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(352, 22, 9, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(353, 22, 10, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(354, 22, 11, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(355, 22, 12, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(356, 22, 13, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(357, 22, 14, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(358, 22, 15, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(359, 22, 16, '2024-07-04 16:14:02', '2024-07-04 16:14:02'),
(360, 23, 1, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(361, 23, 2, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(362, 23, 3, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(363, 23, 4, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(364, 23, 5, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(365, 23, 6, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(366, 23, 7, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(367, 23, 8, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(368, 23, 9, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(369, 23, 10, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(370, 23, 11, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(371, 23, 12, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(372, 23, 13, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(373, 23, 14, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(374, 23, 15, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(375, 23, 16, '2024-07-20 23:08:43', '2024-07-20 23:08:43'),
(376, 24, 1, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(377, 24, 2, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(378, 24, 3, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(379, 24, 4, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(380, 24, 5, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(381, 24, 6, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(382, 24, 7, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(383, 24, 8, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(384, 24, 9, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(385, 24, 10, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(386, 24, 11, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(387, 24, 12, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(388, 24, 13, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(389, 24, 14, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(390, 24, 15, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(391, 24, 16, '2024-07-23 22:47:12', '2024-07-23 22:47:12'),
(392, 26, 1, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(393, 26, 2, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(394, 26, 4, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(395, 26, 5, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(396, 26, 6, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(397, 26, 7, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(398, 26, 8, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(399, 26, 9, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(400, 26, 10, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(401, 26, 11, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(402, 26, 12, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(403, 26, 13, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(404, 26, 14, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(405, 26, 15, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(406, 26, 16, '2024-08-22 22:31:12', '2024-08-22 22:31:12'),
(407, 27, 1, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(408, 27, 2, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(409, 27, 4, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(410, 27, 5, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(411, 27, 6, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(412, 27, 7, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(413, 27, 8, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(414, 27, 9, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(415, 27, 10, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(416, 27, 11, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(417, 27, 12, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(418, 27, 13, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(419, 27, 14, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(420, 27, 15, '2025-01-29 19:02:12', '2025-01-29 19:02:12'),
(421, 27, 16, '2025-01-29 19:02:12', '2025-01-29 19:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'datatype like string , file etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `data`, `type`) VALUES
(1, 'time_zone', 'Africa/Douala', 'string'),
(2, 'date_format', 'd/m/Y', 'date'),
(3, 'time_format', 'h:i A', 'time'),
(4, 'theme_color', '#0094ff', 'string'),
(5, 'session_year', '1', 'string'),
(6, 'system_version', '1.1.1', 'string'),
(7, 'email_verified', '1', 'string'),
(8, 'subscription_alert', '7', 'integer'),
(9, 'currency_code', 'USD', 'string'),
(10, 'currency_symbol', '$', 'string'),
(11, 'additional_billing_days', '10', 'integer'),
(12, 'system_name', 'Taaply SALMS', 'string'),
(13, 'address', 'Immuebles des Amities, Door #514, Rue Drouot, Akwa, Douala, Cameroon', 'string'),
(14, 'billing_cycle_in_days', '365', 'integer'),
(15, 'current_plan_expiry_warning_days', '10', 'integer'),
(16, 'favicon', '//6672aabb441b71.388863131718790843.png', 'file'),
(17, 'tag_line', 'Organize. Educate. Succeed.', 'string'),
(18, 'mobile', '237657546330', 'string'),
(19, 'login_page_logo', '//6672aabb699170.026192751718790843.png', 'file'),
(29, 'horizontal_logo', '//6672aaba97c0d7.979449231718790842.png', 'file'),
(64, 'front_site_theme_color', '#d7edfc', 'text'),
(65, 'primary_color', '#0094ff', 'text'),
(66, 'secondary_color', '#245a7f', 'text'),
(67, 'short_description', '', 'text'),
(68, 'facebook', 'https://facebook.com/taaplyfamily', 'text'),
(69, 'instagram', 'https://instagram.com/taaplyfamily', 'text'),
(70, 'linkedin', 'https://linkedin.com/company/taaplyfamily', 'text'),
(71, 'footer_text', '<p class=\"MsoNormal\">&copy;&nbsp;2024 Taaply&trade; All Rights Reserved.</p>', 'text'),
(80, 'mail_mailer', 'smtp', 'string'),
(81, 'mail_host', 'mail.taaply.education', 'string'),
(82, 'mail_port', '465', 'string'),
(83, 'mail_username', 'edu@taaply.education', 'string'),
(84, 'mail_password', 'edu@taaply.education', 'string'),
(85, 'mail_encryption', 'tls', 'string'),
(86, 'mail_send_from', 'edu@taaply.education', 'string'),
(118, 'about_us', '&lt;p&gt;Taaply SALMS (School and Learning Management System) is a cutting-edge platform designed to streamline educational administration and enhance the learning experience. Our system offers comprehensive features such as attendance tracking, grade management, assignment handling, and integrated communication tools. The user-friendly interface ensures easy navigation for educators, students, and parents alike. With robust security measures and seamless integration with other educational tools, Taaply SALMS is your all-in-one solution for efficient and effective school management. Experience the future of education with Taaply SALMS.&lt;/p&gt;', 'string'),
(119, 'terms_condition', '&lt;h2&gt;Taaply SALMS Terms and Conditions&lt;/h2&gt;\n&lt;h3&gt;1. Introduction&lt;/h3&gt;\n&lt;p&gt;Welcome to Taaply SALMS (School and Learning Management System). These Terms and Conditions (&quot;Terms&quot;) govern your use of our website and services. By accessing or using Taaply SALMS, you agree to comply with and be bound by these Terms. If you do not agree with any part of these Terms, you must not use our services.&lt;/p&gt;\n&lt;h3&gt;2. Use of Services&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;2.1 Eligibility&lt;/strong&gt;&lt;br&gt;You must be at least 18 years old or have the consent of a legal guardian to use Taaply SALMS.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;2.2 User Accounts&lt;/strong&gt;&lt;br&gt;To access certain features, you may need to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;2.3 Acceptable Use&lt;/strong&gt;&lt;br&gt;You agree to use Taaply SALMS only for lawful purposes and in a way that does not infringe the rights of, restrict, or inhibit anyone else&#039;s use and enjoyment of the service. Prohibited behavior includes but is not limited to:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Unauthorized access to other accounts&lt;/li&gt;\n&lt;li&gt;Distributing malware or other harmful software&lt;/li&gt;\n&lt;li&gt;Engaging in fraudulent activities&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h3&gt;3. Intellectual Property&lt;/h3&gt;\n&lt;p&gt;All content, trademarks, and data on this website, including but not limited to software, databases, text, graphics, icons, and hyperlinks are the property of or licensed to Taaply and are protected by law. You may not reproduce, distribute, or otherwise use any content without our prior written consent.&lt;/p&gt;\n&lt;h3&gt;4. Privacy&lt;/h3&gt;\n&lt;p&gt;Your privacy is important to us. Our &lt;a href=&quot;../page/privacy-policy&quot;&gt;https://taaply.education/page/privacy&lt;/a&gt; explains how we collect, use, and protect your personal information. By using Taaply SALMS, you agree to the terms of our Privacy Policy.&lt;/p&gt;\n&lt;h3&gt;5. Limitation of Liability&lt;/h3&gt;\n&lt;p&gt;To the fullest extent permitted by law, Taaply shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Your use or inability to use the service&lt;/li&gt;\n&lt;li&gt;Any unauthorized access to or use of our servers and/or any personal information stored therein&lt;/li&gt;\n&lt;li&gt;Any interruption or cessation of transmission to or from the service&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h3&gt;6. Modifications to the Service and Prices&lt;/h3&gt;\n&lt;p&gt;Taaply reserves the right to modify or discontinue, temporarily or permanently, the service (or any part thereof) with or without notice. Prices for all services are subject to change with notice. Taaply shall not be liable to you or to any third party for any modification, price change, suspension, or discontinuance of the service.&lt;/p&gt;\n&lt;h3&gt;7. Termination&lt;/h3&gt;\n&lt;p&gt;We may terminate or suspend your account and bar access to Taaply SALMS immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of the Terms.&lt;/p&gt;\n&lt;h3&gt;8. Governing Law&lt;/h3&gt;\n&lt;p&gt;These Terms shall be governed and construed in accordance with the laws of USA, Texas, without regard to its conflict of law provisions. Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights.&lt;/p&gt;\n&lt;h3&gt;9. Changes to Terms&lt;/h3&gt;\n&lt;p&gt;We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days&#039; notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.&lt;/p&gt;\n&lt;h3&gt;10. Contact Us&lt;/h3&gt;\n&lt;p&gt;If you have any questions about these Terms, please contact us at support@taaply.education.&lt;/p&gt;', 'string'),
(122, 'privacy_policy', '&lt;h2&gt;Taaply SALMS Privacy Policy&lt;/h2&gt;\n&lt;p&gt;Effective Date: 5/15/2024&lt;/p&gt;\n&lt;p&gt;Taaply SALMS (School and Learning Management System) respects your privacy and is committed to protecting the personal information you share with us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website or use our services.&lt;/p&gt;\n&lt;h3&gt;Information We Collect&lt;/h3&gt;\n&lt;h4&gt;1. Personal Information&lt;/h4&gt;\n&lt;p&gt;We may collect personal information that you provide to us directly, such as:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Name&lt;/li&gt;\n&lt;li&gt;Email address&lt;/li&gt;\n&lt;li&gt;Contact information&lt;/li&gt;\n&lt;li&gt;User-generated content (e.g., messages, posts)&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h4&gt;2. Usage Data&lt;/h4&gt;\n&lt;p&gt;We automatically collect certain information about your device and usage of Taaply SALMS, including:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;IP address&lt;/li&gt;\n&lt;li&gt;Browser type&lt;/li&gt;\n&lt;li&gt;Pages visited&lt;/li&gt;\n&lt;li&gt;Date and time of visits&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h4&gt;3. Cookies and Tracking Technologies&lt;/h4&gt;\n&lt;p&gt;We use cookies and similar tracking technologies to enhance your user experience and analyze usage patterns. You can control cookies through your browser settings, but please note that disabling cookies may affect certain features of Taaply SALMS.&lt;/p&gt;\n&lt;h3&gt;How We Use Your Information&lt;/h3&gt;\n&lt;p&gt;We may use the information we collect for the following purposes:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;To provide and maintain Taaply SALMS services&lt;/li&gt;\n&lt;li&gt;To improve our services and develop new features&lt;/li&gt;\n&lt;li&gt;To communicate with you, including sending administrative messages and updates&lt;/li&gt;\n&lt;li&gt;To personalize your experience and deliver relevant content&lt;/li&gt;\n&lt;li&gt;To analyze usage trends and gather demographic information&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h3&gt;Sharing Your Information&lt;/h3&gt;\n&lt;p&gt;We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this Privacy Policy or required by law.&lt;/p&gt;\n&lt;h3&gt;Data Security&lt;/h3&gt;\n&lt;p&gt;We implement reasonable security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.&lt;/p&gt;\n&lt;h3&gt;Your Choices and Rights&lt;/h3&gt;\n&lt;p&gt;You have the right to:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Access and update your personal information&lt;/li&gt;\n&lt;li&gt;Object to the processing of your information&lt;/li&gt;\n&lt;li&gt;Request deletion of your information, subject to legal requirements&lt;/li&gt;\n&lt;li&gt;Opt-out of receiving promotional communications&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h3&gt;Children&#039;s Privacy&lt;/h3&gt;\n&lt;p&gt;Taaply SALMS is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe that your child has provided us with personal information, please contact us so that we can delete the information.&lt;/p&gt;\n&lt;h3&gt;Changes to This Privacy Policy&lt;/h3&gt;\n&lt;p&gt;We may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We will notify you of any changes by posting the new policy on this page with a revised effective date.&lt;/p&gt;\n&lt;h3&gt;Contact Us&lt;/h3&gt;\n&lt;p&gt;If you have any questions about this Privacy Policy or our privacy practices, please contact us at support&lt;a rel=&quot;noreferrer&quot;&gt;@taaply.education&lt;/a&gt;.&lt;/p&gt;', 'string'),
(124, 'school_terms_condition', '&lt;h2&gt;Taaply SALMS School Terms &amp;amp; Conditions&lt;/h2&gt;\n&lt;p&gt;Effective Date: 6/15/2024&lt;/p&gt;\n&lt;p&gt;These Terms &amp;amp; Conditions (&quot;Terms&quot;) govern the use of Taaply SALMS (School and Learning Management System) by educational institutions (&quot;Schools&quot;). By using Taaply SALMS, Schools agree to comply with and be bound by these Terms. If you do not agree with any part of these Terms, you must not use Taaply SALMS.&lt;/p&gt;\n&lt;h3&gt;1. Use of Taaply SALMS&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;1.1 License&lt;/strong&gt;&lt;br&gt;Taaply grants Schools a non-exclusive, non-transferable license to use Taaply SALMS solely for educational purposes and in accordance with these Terms.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;1.2 Access and Accounts&lt;/strong&gt;&lt;br&gt;Schools are responsible for managing access to Taaply SALMS within their institution. Administrators appointed by the School will manage user accounts and permissions.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;1.3 Acceptable Use&lt;/strong&gt;&lt;br&gt;Schools agree to use Taaply SALMS in compliance with all applicable laws and regulations. Prohibited activities include but are not limited to:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Unauthorized access to other School accounts&lt;/li&gt;\n&lt;li&gt;Distribution of malware or other harmful software&lt;/li&gt;\n&lt;li&gt;Engaging in fraudulent activities&lt;/li&gt;\n&lt;/ul&gt;\n&lt;h3&gt;2. Data Ownership and Protection&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;2.1 Data Ownership&lt;/strong&gt;&lt;br&gt;Schools retain ownership of all data uploaded or input into Taaply SALMS, including student records, grades, and administrative information.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;2.2 Data Protection&lt;/strong&gt;&lt;br&gt;Taaply implements reasonable security measures to protect School data from unauthorized access, alteration, or disclosure. Schools are responsible for maintaining the confidentiality of their login information and for all activities that occur under their accounts.&lt;/p&gt;\n&lt;h3&gt;3. Service Availability and Support&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;3.1 Availability&lt;/strong&gt;&lt;br&gt;Taaply endeavors to provide continuous access to Taaply SALMS but does not guarantee uninterrupted service. Maintenance and updates may occasionally result in temporary disruptions.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;3.2 Support&lt;/strong&gt;&lt;br&gt;Taaply provides technical support to Schools regarding the use of Taaply SALMS. Support inquiries should be directed to &lt;a rel=&quot;noreferrer&quot;&gt;support@taaply.education&lt;/a&gt;.&lt;/p&gt;\n&lt;h3&gt;4. Privacy&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;4.1 Data Privacy&lt;/strong&gt;&lt;br&gt;Taaply respects the privacy of School data and complies with applicable data protection laws and regulations. Our &lt;a href=&quot;../page/privacy-policy&quot;&gt;Privacy Policy&lt;/a&gt;&amp;nbsp;details how we collect, use, and protect personal information.&lt;/p&gt;\n&lt;h3&gt;5. Fees and Payment&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;5.1 Fees&lt;/strong&gt;&lt;br&gt;The use of Taaply SALMS may be subject to fees as agreed upon between Taaply and the School. Fees are payable in accordance with the terms set forth in the agreement.&lt;/p&gt;\n&lt;h3&gt;6. Termination&lt;/h3&gt;\n&lt;p&gt;&lt;strong&gt;6.1 Termination by School&lt;/strong&gt;&lt;br&gt;Schools may terminate their use of Taaply SALMS at any time by providing written notice to Taaply. Any fees paid are non-refundable.&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;6.2 Termination by Taaply&lt;/strong&gt;&lt;br&gt;Taaply reserves the right to suspend or terminate access to Taaply SALMS if Schools violate these Terms or for other valid reasons, upon notice.&lt;/p&gt;\n&lt;h3&gt;7. Changes to Terms&lt;/h3&gt;\n&lt;p&gt;Taaply may update these Terms from time to time. Schools will be notified of any material changes, and continued use of Taaply SALMS after such changes constitutes acceptance of the updated Terms.&lt;/p&gt;\n&lt;h3&gt;8. Governing Law&lt;/h3&gt;\n&lt;p&gt;These Terms shall be governed by and construed in accordance with the laws of USA, Texas, without regard to its conflict of law provisions.&lt;/p&gt;\n&lt;h3&gt;9. Contact Us&lt;/h3&gt;\n&lt;p&gt;If you have any questions about these Terms &amp;amp; Conditions or the use of Taaply SALMS, please contact us at &lt;a rel=&quot;noreferrer&quot;&gt;support@taaply.education&lt;/a&gt;.&lt;/p&gt;', 'string'),
(126, 'contact_us', '&lt;p&gt;Have questions or need assistance? Feel free to reach out to us!&lt;/p&gt;\n&lt;p&gt;Our team is here to help and will respond to your inquiry as soon as possible.&lt;/p&gt;', 'string'),
(215, 'trial_days', '30', 'text'),
(216, 'student_limit', '30', 'text'),
(217, 'staff_limit', '30', 'text'),
(243, 'vertical_logo', '//6672aabb1c09d8.560596851718790843.png', 'file');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint UNSIGNED NOT NULL,
  `subject_teacher_id` bigint UNSIGNED DEFAULT NULL,
  `class_section_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Lecture','Break') COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_id` bigint UNSIGNED DEFAULT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`id`, `subject_teacher_id`, `class_section_id`, `subject_id`, `start_time`, `end_time`, `note`, `day`, `type`, `semester_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 4, '2024-06-18 22:28:20', '2024-06-18 23:45:51'),
(2, 1, 4, 1, '09:00:00', '10:00:00', NULL, 'Tuesday', 'Lecture', NULL, 4, '2024-06-18 22:28:23', '2024-06-18 23:45:51'),
(3, 1, 4, 1, '09:00:00', '10:00:00', NULL, 'Wednesday', 'Lecture', NULL, 4, '2024-06-18 22:28:25', '2024-06-18 23:45:51'),
(4, 1, 4, 1, '09:00:00', '10:00:00', NULL, 'Thursday', 'Lecture', NULL, 4, '2024-06-18 22:28:27', '2024-06-18 23:45:51'),
(5, 1, 4, 1, '09:00:00', '10:00:00', NULL, 'Friday', 'Lecture', NULL, 4, '2024-06-18 22:28:29', '2024-06-18 23:45:51'),
(6, 1, 4, 1, '09:00:00', '10:00:00', NULL, 'Saturday', 'Lecture', NULL, 4, '2024-06-18 22:28:34', '2024-06-18 23:45:51'),
(11, 2, 3, 2, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', 1, 4, '2024-06-19 00:03:29', '2024-06-19 00:03:29'),
(12, 2, 3, 2, '09:00:00', '10:00:00', NULL, 'Tuesday', 'Lecture', 1, 4, '2024-06-19 00:03:31', '2024-06-19 00:03:31'),
(13, 2, 3, 2, '09:00:00', '10:00:00', NULL, 'Wednesday', 'Lecture', 1, 4, '2024-06-19 00:03:34', '2024-06-19 00:03:34'),
(14, 2, 3, 2, '09:00:00', '10:00:00', NULL, 'Thursday', 'Lecture', 1, 4, '2024-06-19 00:03:35', '2024-06-19 00:03:35'),
(15, 2, 3, 2, '09:00:00', '10:00:00', NULL, 'Friday', 'Lecture', 1, 4, '2024-06-19 00:03:37', '2024-06-19 00:03:37'),
(16, 2, 3, 2, '09:00:00', '10:00:00', NULL, 'Saturday', 'Lecture', 1, 4, '2024-06-19 00:03:39', '2024-06-19 00:03:39'),
(17, 3, 12, 3, '09:00:00', '10:00:00', NULL, 'Tuesday', 'Lecture', NULL, 26, '2024-06-24 23:02:37', '2024-06-24 23:02:37'),
(18, NULL, 12, NULL, '10:00:00', '10:30:00', 'Break', 'Tuesday', 'Break', NULL, 26, '2024-06-24 23:02:46', '2024-06-24 23:02:46'),
(20, 3, 12, 3, '09:00:00', '10:00:00', NULL, 'Wednesday', 'Lecture', NULL, 26, '2024-06-24 23:02:59', '2024-06-24 23:02:59'),
(21, 3, 12, 3, '10:00:00', '11:00:00', NULL, 'Thursday', 'Lecture', NULL, 26, '2024-06-24 23:03:00', '2024-06-24 23:03:00'),
(22, 3, 12, 3, '11:00:00', '12:00:00', NULL, 'Friday', 'Lecture', NULL, 26, '2024-06-24 23:03:04', '2024-06-24 23:03:04'),
(24, NULL, 12, NULL, '10:00:00', '10:30:00', 'Break', 'Wednesday', 'Break', NULL, 26, '2024-06-24 23:03:19', '2024-06-24 23:03:19'),
(25, NULL, 12, NULL, '11:00:00', '11:30:00', 'Break', 'Thursday', 'Break', NULL, 26, '2024-06-24 23:03:21', '2024-06-24 23:03:21'),
(26, NULL, 12, NULL, '12:00:00', '12:30:00', 'Break', 'Friday', 'Break', NULL, 26, '2024-06-24 23:03:24', '2024-06-24 23:03:24'),
(27, 12, 7, 4, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 26, '2024-06-24 23:03:46', '2024-06-24 23:03:46'),
(28, 11, 7, 3, '10:00:00', '11:00:00', NULL, 'Tuesday', 'Lecture', NULL, 26, '2024-06-24 23:03:47', '2024-06-24 23:03:47'),
(29, 12, 7, 4, '11:00:00', '12:00:00', NULL, 'Wednesday', 'Lecture', NULL, 26, '2024-06-24 23:03:49', '2024-06-24 23:03:49'),
(30, 11, 7, 3, '12:00:00', '13:00:00', NULL, 'Thursday', 'Lecture', NULL, 26, '2024-06-24 23:03:51', '2024-06-24 23:03:51'),
(31, 12, 7, 4, '13:00:00', '14:00:00', NULL, 'Friday', 'Lecture', NULL, 26, '2024-06-24 23:03:53', '2024-06-24 23:03:53'),
(32, NULL, 7, NULL, '10:00:00', '10:30:00', 'Break', 'Monday', 'Break', NULL, 26, '2024-06-24 23:03:56', '2024-06-24 23:03:56'),
(33, NULL, 7, NULL, '11:00:00', '11:30:00', 'Break', 'Tuesday', 'Break', NULL, 26, '2024-06-24 23:03:57', '2024-06-24 23:03:57'),
(34, NULL, 7, NULL, '12:00:00', '12:30:00', 'Break', 'Wednesday', 'Break', NULL, 26, '2024-06-24 23:03:58', '2024-06-24 23:03:58'),
(35, NULL, 7, NULL, '13:00:00', '13:30:00', 'Break', 'Thursday', 'Break', NULL, 26, '2024-06-24 23:04:00', '2024-06-24 23:04:00'),
(36, NULL, 7, NULL, '14:00:00', '14:30:00', 'Break', 'Friday', 'Break', NULL, 26, '2024-06-24 23:04:06', '2024-06-24 23:04:06'),
(37, 9, 8, 3, '11:00:00', '12:00:00', NULL, 'Monday', 'Lecture', NULL, 26, '2024-06-24 23:04:38', '2024-06-24 23:09:01'),
(38, 10, 8, 4, '10:00:00', '11:00:00', NULL, 'Tuesday', 'Lecture', NULL, 26, '2024-06-24 23:04:39', '2024-06-24 23:04:39'),
(39, 9, 8, 3, '11:00:00', '12:00:00', NULL, 'Wednesday', 'Lecture', NULL, 26, '2024-06-24 23:04:41', '2024-06-24 23:04:41'),
(40, 10, 8, 4, '12:00:00', '13:00:00', NULL, 'Thursday', 'Lecture', NULL, 26, '2024-06-24 23:04:43', '2024-06-24 23:04:43'),
(41, 9, 8, 3, '13:00:00', '14:00:00', NULL, 'Friday', 'Lecture', NULL, 26, '2024-06-24 23:04:44', '2024-06-24 23:04:44'),
(42, NULL, 8, NULL, '12:00:00', '12:30:00', 'Break', 'Monday', 'Break', NULL, 26, '2024-06-24 23:04:46', '2024-06-24 23:09:03'),
(43, NULL, 8, NULL, '11:00:00', '11:30:00', 'Break', 'Tuesday', 'Break', NULL, 26, '2024-06-24 23:04:47', '2024-06-24 23:04:47'),
(44, NULL, 8, NULL, '12:00:00', '12:30:00', 'Break', 'Wednesday', 'Break', NULL, 26, '2024-06-24 23:04:49', '2024-06-24 23:04:49'),
(45, NULL, 8, NULL, '14:00:00', '14:30:00', 'Break', 'Friday', 'Break', NULL, 26, '2024-06-24 23:04:54', '2024-06-24 23:04:54'),
(46, NULL, 8, NULL, '13:00:00', '13:30:00', 'Break', 'Thursday', 'Break', NULL, 26, '2024-06-24 23:04:54', '2024-06-24 23:04:54'),
(47, 7, 9, 3, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 26, '2024-06-24 23:05:58', '2024-06-24 23:05:58'),
(48, NULL, 9, NULL, '10:00:00', '10:30:00', 'Break', 'Monday', 'Break', NULL, 26, '2024-06-24 23:06:03', '2024-06-24 23:06:03'),
(49, 7, 9, 3, '10:00:00', '11:00:00', NULL, 'Tuesday', 'Lecture', NULL, 26, '2024-06-24 23:06:04', '2024-06-24 23:06:04'),
(50, 8, 9, 4, '11:00:00', '12:00:00', NULL, 'Wednesday', 'Lecture', NULL, 26, '2024-06-24 23:06:06', '2024-06-24 23:06:06'),
(51, 7, 9, 3, '12:00:00', '13:00:00', NULL, 'Thursday', 'Lecture', NULL, 26, '2024-06-24 23:06:10', '2024-06-24 23:06:10'),
(52, NULL, 9, NULL, '11:00:00', '11:30:00', 'Break', 'Tuesday', 'Break', NULL, 26, '2024-06-24 23:06:12', '2024-06-24 23:06:12'),
(53, NULL, 9, NULL, '12:00:00', '12:30:00', 'Break', 'Wednesday', 'Break', NULL, 26, '2024-06-24 23:06:13', '2024-06-24 23:06:13'),
(54, NULL, 9, NULL, '13:00:00', '13:30:00', 'Break', 'Thursday', 'Break', NULL, 26, '2024-06-24 23:06:15', '2024-06-24 23:06:15'),
(55, 4, 11, 3, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 26, '2024-06-25 21:07:40', '2024-06-25 21:07:40'),
(56, NULL, 11, NULL, '10:00:00', '10:30:00', 'Break', 'Monday', 'Break', NULL, 26, '2024-06-25 21:07:42', '2024-06-25 21:07:42'),
(59, 4, 11, 3, '11:00:00', '12:00:00', NULL, 'Monday', 'Lecture', NULL, 26, '2024-06-25 21:08:39', '2024-06-25 21:08:39'),
(61, 13, 13, 7, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 29, '2024-06-28 17:03:56', '2024-06-28 17:03:56'),
(62, NULL, 13, NULL, '11:00:00', '11:30:00', 'Break', 'Monday', 'Break', NULL, 29, '2024-06-28 17:03:58', '2024-06-28 17:04:08'),
(63, 14, 13, 8, '10:00:00', '11:00:00', NULL, 'Monday', 'Lecture', NULL, 29, '2024-06-28 17:04:04', '2024-06-28 17:04:04'),
(64, 14, 13, 8, '10:00:00', '11:00:00', NULL, 'Tuesday', 'Lecture', NULL, 29, '2024-06-28 17:04:15', '2024-06-28 17:04:15'),
(65, 15, 13, 9, '12:00:00', '13:00:00', NULL, 'Monday', 'Lecture', NULL, 29, '2024-06-28 17:04:21', '2024-06-28 17:04:21'),
(66, 13, 13, 7, '09:00:00', '10:00:00', NULL, 'Wednesday', 'Lecture', NULL, 29, '2024-06-28 17:04:29', '2024-06-28 17:04:29'),
(67, 15, 13, 9, '11:00:00', '12:00:00', NULL, 'Wednesday', 'Lecture', NULL, 29, '2024-06-28 17:04:30', '2024-06-28 17:04:30'),
(68, 14, 13, 8, '12:00:00', '13:00:00', NULL, 'Wednesday', 'Lecture', NULL, 29, '2024-06-28 17:04:35', '2024-06-28 17:04:35'),
(69, 13, 13, 7, '09:00:00', '10:00:00', NULL, 'Friday', 'Lecture', NULL, 29, '2024-06-28 17:09:16', '2024-06-28 17:09:16'),
(70, 14, 13, 8, '10:00:00', '11:00:00', NULL, 'Friday', 'Lecture', NULL, 29, '2024-06-28 17:09:18', '2024-06-28 17:09:18'),
(71, NULL, 13, NULL, '11:00:00', '11:30:00', 'Break', 'Friday', 'Break', NULL, 29, '2024-06-28 17:09:24', '2024-06-28 17:09:24'),
(72, 15, 13, 9, '12:00:00', '13:00:00', NULL, 'Friday', 'Lecture', NULL, 29, '2024-06-28 17:09:24', '2024-06-28 17:09:24'),
(73, 15, 13, 9, '12:00:00', '13:00:00', NULL, 'Thursday', 'Lecture', NULL, 29, '2024-06-28 17:09:33', '2024-06-28 17:09:33'),
(74, NULL, 13, NULL, '11:00:00', '11:30:00', 'Break', 'Thursday', 'Break', NULL, 29, '2024-06-28 17:09:33', '2024-06-28 17:09:33'),
(75, NULL, 51, 10, '09:00:00', '09:30:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:33:25', '2024-07-22 07:33:25'),
(76, NULL, 51, 11, '09:30:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:33:31', '2024-07-22 07:33:31'),
(77, NULL, 51, NULL, '10:00:00', '10:30:00', 'Break', 'Monday', 'Break', NULL, 33, '2024-07-22 07:33:41', '2024-07-22 07:33:41'),
(78, NULL, 51, 16, '10:30:00', '11:00:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:33:47', '2024-07-22 07:33:47'),
(79, NULL, 51, 15, '11:00:00', '11:30:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:34:04', '2024-07-22 07:34:04'),
(81, NULL, 51, 10, '09:00:00', '09:30:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:34:29', '2024-07-22 07:34:29'),
(82, NULL, 51, 10, '09:00:00', '09:30:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:34:30', '2024-07-22 07:34:30'),
(83, NULL, 51, 10, '09:00:00', '09:30:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:34:32', '2024-07-22 07:34:32'),
(84, NULL, 51, 10, '09:00:00', '09:30:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:34:34', '2024-07-22 07:34:34'),
(85, NULL, 51, 11, '09:30:00', '10:00:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:34:36', '2024-07-22 07:34:36'),
(86, NULL, 51, 11, '09:30:00', '10:00:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:34:38', '2024-07-22 07:34:38'),
(87, NULL, 51, 11, '09:30:00', '10:00:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:34:39', '2024-07-22 07:34:39'),
(88, NULL, 51, 11, '09:30:00', '10:00:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:34:41', '2024-07-22 07:34:41'),
(89, NULL, 51, NULL, '10:00:00', '10:30:00', 'Break', 'Tuesday', 'Break', NULL, 33, '2024-07-22 07:34:44', '2024-07-22 07:34:44'),
(90, NULL, 51, NULL, '10:00:00', '10:30:00', 'Break', 'Wednesday', 'Break', NULL, 33, '2024-07-22 07:34:46', '2024-07-22 07:34:46'),
(91, NULL, 51, NULL, '10:00:00', '10:30:00', 'Break', 'Thursday', 'Break', NULL, 33, '2024-07-22 07:34:47', '2024-07-22 07:34:47'),
(92, NULL, 51, NULL, '10:00:00', '10:30:00', 'Break', 'Friday', 'Break', NULL, 33, '2024-07-22 07:34:49', '2024-07-22 07:34:49'),
(93, NULL, 51, 16, '10:30:00', '11:00:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:34:52', '2024-07-22 07:34:52'),
(94, NULL, 51, 16, '10:30:00', '11:00:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:34:54', '2024-07-22 07:34:54'),
(95, NULL, 51, 16, '10:30:00', '11:00:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:34:57', '2024-07-22 07:34:57'),
(96, NULL, 51, 16, '10:30:00', '11:00:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:34:59', '2024-07-22 07:34:59'),
(97, NULL, 51, 15, '11:00:00', '11:30:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:35:02', '2024-07-22 07:35:02'),
(98, NULL, 51, 15, '11:00:00', '11:30:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:35:04', '2024-07-22 07:35:04'),
(99, NULL, 51, 15, '11:00:00', '11:30:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:35:07', '2024-07-22 07:35:07'),
(100, NULL, 51, 15, '11:00:00', '11:30:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:35:09', '2024-07-22 07:35:09'),
(105, 19, 43, 11, '09:00:00', '09:30:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:36:32', '2024-07-22 07:36:32'),
(106, 19, 43, 11, '09:00:00', '09:30:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:36:34', '2024-07-22 07:36:34'),
(107, 19, 43, 11, '09:00:00', '09:30:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:36:35', '2024-07-22 07:36:35'),
(108, 19, 43, 11, '09:00:00', '09:30:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:36:38', '2024-07-22 07:36:38'),
(109, 19, 43, 11, '09:00:00', '09:30:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:36:40', '2024-07-22 07:36:40'),
(110, 20, 43, 16, '09:30:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:36:41', '2024-07-22 07:36:41'),
(111, 20, 43, 16, '09:30:00', '10:00:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:36:44', '2024-07-22 07:36:44'),
(112, 20, 43, 16, '09:30:00', '10:00:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:36:45', '2024-07-22 07:36:45'),
(113, 20, 43, 16, '09:30:00', '10:00:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:36:47', '2024-07-22 07:36:47'),
(114, 20, 43, 16, '09:30:00', '10:00:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:36:49', '2024-07-22 07:36:49'),
(115, NULL, 43, NULL, '10:00:00', '10:30:00', 'Break', 'Monday', 'Break', NULL, 33, '2024-07-22 07:36:53', '2024-07-22 07:36:53'),
(116, NULL, 43, NULL, '10:00:00', '10:30:00', 'Break', 'Wednesday', 'Break', NULL, 33, '2024-07-22 07:36:55', '2024-07-22 07:36:55'),
(117, NULL, 43, NULL, '10:00:00', '10:30:00', 'Break', 'Tuesday', 'Break', NULL, 33, '2024-07-22 07:36:57', '2024-07-22 07:36:57'),
(118, NULL, 43, NULL, '10:00:00', '10:30:00', 'Break', 'Thursday', 'Break', NULL, 33, '2024-07-22 07:36:58', '2024-07-22 07:36:58'),
(119, NULL, 43, NULL, '10:00:00', '10:30:00', 'Break', 'Friday', 'Break', NULL, 33, '2024-07-22 07:36:59', '2024-07-22 07:36:59'),
(120, NULL, 43, 15, '10:30:00', '11:00:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:37:04', '2024-07-22 07:37:04'),
(121, NULL, 43, 15, '10:30:00', '11:00:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:37:05', '2024-07-22 07:37:05'),
(122, NULL, 43, 15, '10:30:00', '11:00:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:37:07', '2024-07-22 07:37:07'),
(123, NULL, 43, 15, '10:30:00', '11:00:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:37:10', '2024-07-22 07:37:10'),
(124, NULL, 43, 15, '10:30:00', '11:00:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:37:15', '2024-07-22 07:37:15'),
(125, NULL, 43, 10, '11:00:00', '11:30:00', NULL, 'Monday', 'Lecture', NULL, 33, '2024-07-22 07:37:18', '2024-07-22 07:37:18'),
(126, NULL, 43, 10, '11:00:00', '11:30:00', NULL, 'Tuesday', 'Lecture', NULL, 33, '2024-07-22 07:37:21', '2024-07-22 07:37:21'),
(127, NULL, 43, 10, '11:00:00', '11:30:00', NULL, 'Wednesday', 'Lecture', NULL, 33, '2024-07-22 07:37:23', '2024-07-22 07:37:23'),
(128, NULL, 43, 10, '11:00:00', '11:30:00', NULL, 'Thursday', 'Lecture', NULL, 33, '2024-07-22 07:37:26', '2024-07-22 07:37:26'),
(129, NULL, 43, 10, '11:00:00', '11:30:00', NULL, 'Friday', 'Lecture', NULL, 33, '2024-07-22 07:37:28', '2024-07-22 07:37:28'),
(132, NULL, 57, 17, '07:00:00', '08:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 21:56:59', '2025-02-26 21:56:59'),
(133, NULL, 57, 19, '07:00:00', '08:00:00', NULL, 'Tuesday', 'Lecture', NULL, 73, '2025-02-26 21:57:03', '2025-02-26 21:57:03'),
(134, NULL, 57, 21, '07:00:00', '08:00:00', NULL, 'Wednesday', 'Lecture', NULL, 73, '2025-02-26 21:57:05', '2025-02-26 21:57:05'),
(135, NULL, 57, NULL, '09:00:00', '09:30:00', 'Break', 'Monday', 'Break', NULL, 73, '2025-02-26 21:57:14', '2025-02-26 21:57:14'),
(136, NULL, 57, 19, '08:00:00', '09:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 21:57:17', '2025-02-26 21:57:17'),
(137, NULL, 57, 17, '08:00:00', '09:00:00', NULL, 'Tuesday', 'Lecture', NULL, 73, '2025-02-26 21:57:19', '2025-02-26 21:57:19'),
(138, NULL, 57, 21, '08:00:00', '09:00:00', NULL, 'Wednesday', 'Lecture', NULL, 73, '2025-02-26 21:57:22', '2025-02-26 21:57:22'),
(139, NULL, 57, NULL, '09:00:00', '09:30:00', 'Break', 'Tuesday', 'Break', NULL, 73, '2025-02-26 21:57:24', '2025-02-26 21:57:24'),
(140, NULL, 57, NULL, '09:00:00', '09:30:00', 'Break', 'Wednesday', 'Break', NULL, 73, '2025-02-26 21:57:28', '2025-02-26 21:57:28'),
(141, NULL, 53, 17, '07:00:00', '08:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 22:07:05', '2025-02-26 22:07:05'),
(142, NULL, 53, 17, '08:00:00', '09:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 22:07:10', '2025-02-26 22:07:10'),
(143, NULL, 53, 22, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 22:07:19', '2025-02-26 22:07:19'),
(144, NULL, 53, NULL, '10:00:00', '10:30:00', 'Break', 'Monday', 'Break', NULL, 73, '2025-02-26 22:07:21', '2025-02-26 22:07:21'),
(145, NULL, 53, 21, '11:00:00', '12:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 22:07:32', '2025-02-26 22:07:32'),
(147, NULL, 53, 18, '12:00:00', '13:00:00', NULL, 'Monday', 'Lecture', NULL, 73, '2025-02-26 22:08:21', '2025-02-26 22:08:21'),
(153, NULL, 58, 22, '10:00:00', '11:00:00', NULL, 'Monday', 'Lecture', 13, 73, '2025-03-18 00:50:15', '2025-03-18 00:50:15'),
(155, NULL, 58, 21, '09:00:00', '10:00:00', NULL, 'Monday', 'Lecture', 13, 73, '2025-03-18 00:51:08', '2025-03-18 00:51:08'),
(158, NULL, 58, 17, '07:00:00', '08:00:00', NULL, 'Wednesday', 'Lecture', 13, 73, '2025-03-18 00:54:40', '2025-03-18 00:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `reset_request` tinyint NOT NULL DEFAULT '0',
  `fcm_id` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `mobile`, `email`, `password`, `gender`, `image`, `dob`, `current_address`, `permanent_address`, `occupation`, `status`, `reset_request`, `fcm_id`, `school_id`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Taaply', 'Admin', NULL, 'admin@taaply.com', '$2y$10$d1YCzVNMciw7tBBOFCMsoOLqWWv3coxlQ64sGJJz8dDPxuVjKqabi', 'male', 'user/669b9ff05994e2.901259901721475056.png', '1970-01-01', 'Rue Drouot, Akwa, Douala', 'Rue Drouot, Akwa, Douala', NULL, 1, 0, NULL, NULL, NULL, NULL, '2023-11-25 13:38:41', '2024-09-02 20:59:42', NULL),
(2, 'Kel', 'Jones', '657546330', 'support@taaply.com', '$2y$10$TOAVNdfQFyJK7cuerkbJiuuyQ.fZxX1ibX9JO1a23QwaSgGZAjO0e', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL, NULL, '2024-06-15 20:54:13', '2024-06-15 20:54:13', NULL),
(3, 'Sandrine', 'Ndome', '237657368220', 'vipturnup@gmail.com', '$2y$10$BpkMGCySM8kPwOLHkg8VZec8Gqn59Ne/jD4GZ/4VjwNQxpoSZ5H1.', 'female', NULL, '1972-09-03', 'Drouot', 'Drouot', NULL, 1, 0, NULL, 1, NULL, NULL, '2024-06-16 21:16:46', '2024-06-16 21:17:16', NULL),
(4, 'Kel', 'Njifor', '237848030404', 'lekel.asong@gmail.com', '$2y$10$RUBicuD0Wz0Wt5paqFxIdOaFDZ/U1xBGc7WBmBDexOYnsqik8GUBO', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, 'fvh7peR_Qe2SkzqbQPphMA:APA91bFYnWhbTFsj5iZxb7Ro7bTbfsWsMDXf-_4Trwe2Rwmy4GDDuRjSNeGc2U4QjPkfge6zz0944FysEklU-feW6_PUBDsEquLc7TTWZ84_wK5I0Fz9ZrKBvb9Sxwibx4K3C1wFHn7-', NULL, NULL, NULL, '2024-06-16 21:20:41', '2024-06-16 21:36:31', NULL),
(5, 'Greyson', 'Njifor', NULL, '2022-2311', '$2y$10$U1ayPWZ.lhfGS3Trjo6p6uJFJM.06wIqrEGS3tdsYeoT8Q9XvNkR6', 'male', NULL, '1982-11-11', 'rue dor', 'rue dor', NULL, 1, 0, NULL, 1, NULL, NULL, '2024-06-16 21:20:41', '2024-06-16 21:36:31', NULL),
(6, 'Talha', 'Amir', '03010617687', 'talhaamir1005@gmail.com', '$2y$10$YxhbJQ6FY0jJayj1kFk5du9muG/R1z/6iVCPwHhyKGbh6gpnOSomC', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 2, NULL, NULL, '2024-06-17 23:46:05', '2024-06-17 23:46:05', NULL),
(7, 'Talha', 'Amir', '03010617687', 'talhaamir393@gmail.com', '$2y$10$r9Gd.jgOjnSZra3S93kpMO4gj.VucehpGVLCDT4qsMQUQc7iLT5wS', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, 'dRfW34T4RoeRqHhLERPe1u:APA91bEvFnc3RCAfPA6E4VB_sv07BkCEvXntbchSWdgXl2aWXNZapNKmvtCctOyvyR4KlL6a4xmjtAfw5hOHrHTHcNtIWcJz0KdqeDUkamc2FXL3Z6LxS0vLYul5rWt06XOfNuv31Ssu', 2, NULL, NULL, '2024-06-17 23:54:14', '2024-06-17 23:55:10', NULL),
(8, 'Saad', 'Amir', NULL, '2022-2321', '$2y$10$zRNG0BmzQ3gBWvBqHZs8jOS7SNO38tpt4o6KeNPtNcFXNSL6hSk.q', 'male', NULL, '2019-06-19', 'Miran-je Town\r\nKangni Wala bazar', 'Miran-je Town\r\nKangni Wala bazar', NULL, 1, 0, 'egtTjPNZRpqKr_t1VoIECp:APA91bGisQ5CCu7n79RGmvVBMX9egqReuUh7qLpF3ckoh-pV-q60VUwFVdviXfmvglIcmjvmBgjRtbMOKPhIhJwHr5nc8useBVszi8IkXDB7hVRuPlVe49WqQKCbAbBy93EkKPwtYYtz', 2, NULL, NULL, '2024-06-17 23:54:14', '2024-06-18 00:59:41', NULL),
(9, 'Talha', 'Amir', '03010617687', 'romailbhatti226@gmail.com', '$2y$10$KIAsqRazlBxM8WzVAH7LsuaLYVdg5oIs50gQd.9FLO2t05pN0EU22', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, 'dRfW34T4RoeRqHhLERPe1u:APA91bEvFnc3RCAfPA6E4VB_sv07BkCEvXntbchSWdgXl2aWXNZapNKmvtCctOyvyR4KlL6a4xmjtAfw5hOHrHTHcNtIWcJz0KdqeDUkamc2FXL3Z6LxS0vLYul5rWt06XOfNuv31Ssu', 2, NULL, NULL, '2024-06-18 05:27:25', '2024-06-18 05:29:01', NULL),
(10, 'Student 2', 'Good', NULL, '2022-2323', '$2y$10$RmlwxeexpqSb1VmfF6JzmOYznKVxl.QiHMXCgM22u13GBwOcfjX4a', 'male', NULL, '2019-07-17', 'Miran-je Town', 'Miran-je Town\r\nKangni Wala bazar', NULL, 0, 0, NULL, 2, NULL, NULL, '2024-06-18 05:27:25', '2024-06-18 05:27:25', '1970-01-01 06:00:00'),
(11, 'Talha', 'Amir', '03010617687', 'talhaamirfreelance001@gmail.com', '$2y$10$/trbHRyyIcwxYVHS3oVHXuU.bcjBoaPqfF9qthOreGKA1UxyeXk2e', NULL, 'user/6670976d773229.715333841718654829.png', NULL, NULL, NULL, NULL, 1, 0, NULL, 3, NULL, NULL, '2024-06-18 05:37:09', '2024-06-18 05:37:09', NULL),
(12, 'Talha1', 'Amir', '03010617687', 'admin@gmail.com', '$2y$10$L3dEV2HmSd9/5q3Atkyb5euIu3IkLWbN0GQXNx0B4si8PmE4.nddK', NULL, 'user/66709bb13779e8.587318481718655921.png', NULL, NULL, NULL, NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 05:55:21', '2024-06-18 05:55:21', NULL),
(13, 'Romail', 'Bhatti', '123456789', 'romailbhatti06.1999@gmail.com', '$2y$10$7KdKwKw6lGsruqdvwrKHTu9KvWdI5hVhArc3BrqewgROO2gZGTLNu', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, 'dRfW34T4RoeRqHhLERPe1u:APA91bEvFnc3RCAfPA6E4VB_sv07BkCEvXntbchSWdgXl2aWXNZapNKmvtCctOyvyR4KlL6a4xmjtAfw5hOHrHTHcNtIWcJz0KdqeDUkamc2FXL3Z6LxS0vLYul5rWt06XOfNuv31Ssu', 4, NULL, NULL, '2024-06-18 06:01:17', '2024-06-18 06:02:20', NULL),
(14, 'Good', 'Boy', NULL, '2022-2341', '$2y$10$NoLxT9tZOtXH65PnEW9zcOkzXuxz5h3vhip8U6TQ9opzuBVHpQbmu', 'male', NULL, '2019-12-27', 'Go went gone', 'go went gone', NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 06:01:17', '2024-06-18 18:03:43', NULL),
(17, 'Talha', 'Amir', '123456789', 'mughalsonsweightscrap123@gmail.co', '$2y$10$tNFl8Dg3cSxBbZ6t3cfYaO1xUipc8vbljY/h0na9qMT/1AO8Fq1sS', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 21:47:47', '2024-06-18 21:47:47', NULL),
(18, 'Good', 'Girl', NULL, '2022-2345', '$2y$10$mqiNnweo.lYePB4SLG/K2uKYKQrzeKQ8wWTpl/eqldvPglMTj4oK.', 'male', NULL, '2016-07-29', 'Miran-je Town', 'Miran-je Town\r\nKangni Wala bazar', NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 21:47:47', '2024-06-18 21:51:18', NULL),
(19, 'Talha', 'Amir', '123456789', 'mughalsonsweightscrap123@gmail.com', '$2y$10$aFM41uj3tZcCviHqDlTWl.SWD2Xyl6rZqjhRHXBR/QZ7Z03PAqxoO', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 21:50:31', '2024-06-18 21:50:31', NULL),
(20, 'Talha', 'Amir', '123456789', 'akshotara47@gmail.com', '$2y$10$a1Xja4j0I7Ymu.YdwoIz/uo5wsZOwj1zMGM8WiLPGdTfrJgw0Eo/u', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, '', 4, NULL, NULL, '2024-06-18 21:52:53', '2024-06-18 22:04:52', NULL),
(21, 'Talha', 'Amir', NULL, '2022-2346', '$2y$10$8AP4kvBS8X.BYOlJrqk8VeRdMO9dFReGsiA1KN295rBhBvFXOG8Qy', 'male', NULL, '2010-06-16', 'Miran-je Town\r\nKangni Wala bazar', 'Miran-je Town\r\nKangni Wala bazar', NULL, 1, 0, '', 4, NULL, NULL, '2024-06-18 21:52:53', '2024-07-16 20:18:01', NULL),
(22, 'Romail', 'Bhatti', '1234567890', 'techchamppk@gmail.com', '$2y$10$DUssGWpSeCth7Rd1SI5SfesnzG9PU3uUWUBGsC3vwRznxDBa9/mNu', 'male', NULL, '1999-07-30', 'Miran-je Town\r\nKangni Wala bazar', 'Miran-je Town\r\nKangni Wala bazar', NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 22:11:17', '2024-06-18 22:11:28', NULL),
(23, 'Talha', 'Amir', '1234567890', 'admin1@gmail.com', '$2y$10$lBgMwFdbUnoQbWQfiBk3TuMVCeiQSBuugKSnMj0oMJ/MCMIA3arN2', 'male', NULL, '2024-06-06', 'Miran-je Town\r\nKangni Wala bazar', 'Miran-je Town\r\nKangni Wala bazar', NULL, 1, 0, NULL, 4, NULL, NULL, '2024-06-18 23:49:19', '2024-06-18 23:49:19', NULL),
(24, 'Arch', 'Angel', '677024205', 'archangelschool2018@gmail.com', '$2y$10$rutwKV/B6R9f0oEq3kbPvuftW38mjhns2o7DkqdgTKRxQSfF/bHa2', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 5, NULL, NULL, '2024-06-19 19:03:48', '2024-06-19 19:03:48', NULL),
(25, 'fr', 'fw', '1234567890', 'info@taaply.com', '$2y$10$VgA7MVvjAhkRUxthgJiqwOkKnBuiX/rIzXbV2Ahl/m.kVKYh9IMEq', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 6, 'rGXfiNPNoesMZJOlKux3O5bKa7bD9fzUfDQzkUKSm7RpZz1yFqYla6b9QLHY', NULL, '2024-06-19 20:09:55', '2024-06-19 23:53:09', NULL),
(26, 'Kwel', 'J', '83849494093', 'leke.asong@gmail.com', '$2y$10$hIG2getqzLssa/olDzdTiufgcl8PJXlV4vxUF433ZNugLN4CLM7ka', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 7, NULL, NULL, '2024-06-20 07:06:08', '2024-06-20 07:06:08', NULL),
(41, 'Husnain', 'Ameen', '03101770974', 'husnainameen862@gmail.com', '$2y$10$lN//LIhOlgCVHQj04dX0euoQlsLHBiLfczghvxB.P6XnAPEoUQ4rS', NULL, 'user/667885dfd0e450.495592881719174623.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 22, NULL, NULL, '2024-06-24 06:00:23', '2024-06-24 06:00:23', NULL),
(42, 'Mechelle', 'Cooper', '1234567890', 'husnaingeek@gmail.com', '$2y$10$rWmhGOXd/kC/7EhYMsYFq.A2IiGs0Dc1DzeVsWuyU4z18CdHNNSUq', NULL, 'user/6678906e207647.829910451719177326.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 23, NULL, NULL, '2024-06-24 06:45:26', '2024-06-24 06:45:26', NULL),
(43, 'Paki', 'House', '1234567890', 'husnaingeek+1@gmail.com', '$2y$10$mq8u2dPINWhnaQehOAYpiueK3wtZfqYwyYJmZkV0z5zuET84mxqfW', NULL, 'user/667890e0d2ace2.067478841719177440.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 24, NULL, NULL, '2024-06-24 06:47:20', '2024-06-24 06:47:20', NULL),
(44, 'Ian', 'Ameen', '1234567890', 'husnaingeek+2@gmail.com', '$2y$10$uvUt4nNvxG74DFlvdAKiQuD.jAmf.bpBqu1Diub4C5f.rdTT9z.qG', NULL, 'user/667891c41cc811.668418951719177668.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 25, NULL, NULL, '2024-06-24 06:51:08', '2024-06-24 06:51:08', NULL),
(45, 'dur', 'eje', '658928394', 'info@trial.com', '$2y$10$XtQknc4YUYGD8h5GL1.NE.WPryTcK8nxaehBbpK12CvL1L4x939DG', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-24 07:23:16', '2024-06-24 07:23:16', NULL),
(46, 'San', 'Jose', '7465748472', 'san@gmai.com', '$2y$10$c0DTNA3hRpUBE3O38Wt.J.1DAQ6GB3Evv3.W8WZa4TUS1sF1q1OpO', 'male', NULL, '2024-06-16', '4903 June Dr', '4903 June Dr', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-24 07:44:19', '2024-06-24 07:44:19', NULL),
(47, ' DZEAKOU NATH', 'david', '123456789', 'guaridan@example.com', '$2y$10$gSEmwTzjx7Mlx8N6EE9diu4T6SNeUSbbPvJMsEC7XSqr5WoLzuC7C', 'male / female', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2024-06-24 08:16:25', '2025-03-26 21:55:33', NULL),
(48, 'Sam', 'Jones', '1234567899', '2022-23261', '$2y$10$S9o0riW.6bzhDxXNhaiMK.R3fvFtHhR15I35L/Byhg0aNGPqesEw6', 'male', NULL, '2020-12-06', 'hyundai st', 'hyundai st', NULL, 0, 0, NULL, 26, NULL, NULL, '2024-06-24 08:16:25', '2024-06-24 08:16:25', '1970-01-01 06:00:00'),
(49, 'Jim', 'Joe', '39595040', 'ee@ym.com', '$2y$10$WOPPGuq8ffK302/vEWkoIujztQhPi02kgNbWcPFmRomAP2qXfo0SG', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-24 08:24:18', '2024-06-24 08:24:18', NULL),
(50, 'Sean', 'Jones', NULL, '2024-2025268', '$2y$10$Ptjpy52gZIZr6AFI5AGXn.O3HbwV1MXdKqYrsIok7xyW8vhtnMYrm', 'male', NULL, '2022-02-01', 'ej', 'ej', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-24 08:24:18', '2024-06-25 18:06:42', NULL),
(68, 'Dorimaine', 'mboujiko', '678783846', 'mboujikodorimaine@gmail.com', '$2y$10$Us5HCNfiXEpmtJum2gUIAeteIOPHiJmwXudKGin2sP/VznsLX1p7.', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 27, NULL, NULL, '2024-06-24 23:03:18', '2024-06-24 23:03:18', NULL),
(69, 'er', 'er', '654789456', 'random@gmail.com', '$2y$10$NFz3qUrXvIerlLw3z.7qoeNrsCygA3sQKf9j/k0aXiNgxkfAmgcQy', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 28, NULL, NULL, '2024-06-25 00:18:18', '2024-06-25 00:18:18', NULL),
(73, 'Romail', 'Bhatti', '1234567890', 'romail@gmail.com', '$2y$10$dcGLxtyDRv9490cHfFVVTefcD3e8444zHbXcjHGnJ/KsxcWaVVS4m', NULL, 'user/6679a23371db70.759006841719247411.PNG', NULL, NULL, NULL, NULL, 1, 0, NULL, 29, NULL, NULL, '2024-06-25 02:13:31', '2024-06-25 02:13:31', NULL),
(74, 'Don', 'Draper', '1234567899', '2024-2025269', '$2y$10$p6h5h9drm9Y9XYdBkWtCEukf8NV717mOrCsXoHqTtXR23ijoyZYiW', 'male', NULL, '2020-12-06', 'hyundai st', 'hyundai st', NULL, 0, 0, NULL, 26, NULL, NULL, '2024-06-25 07:01:28', '2024-06-25 18:44:05', '2024-06-25 18:44:05'),
(75, 'Edmond', 'Baker', '294859303', 'garda@gmail.com', '$2y$10$bjwDt6XD3X1LBIDODcP7y.fy5UXaO9tHATP19a91VeaO4STSHQSeO', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2024-06-25 07:01:29', '2024-06-25 07:02:12', NULL),
(76, 'Sandra', 'Baker', '39484939', '2024-20252610', '$2y$10$x1xygB.EIIwZwbzyi1L.9erbxS8g58wi1KAtau0CN4pR7YBgIXBJy', 'female', NULL, '2020-04-04', 'sandar rd', 'sander rd', NULL, 0, 0, NULL, 26, NULL, NULL, '2024-06-25 07:01:29', '2024-06-25 18:44:05', '2024-06-25 18:44:05'),
(77, 'Don', 'Draper', '1234567899', '2024-20252611', '$2y$10$IXoh1XrqQxj7CQ.3uz09luNS3ILDMdPbSZ6T11yf6Q6EJsQY.lITu', 'male', NULL, '2020-12-06', 'hyundai st', 'hyundai st', NULL, 0, 0, NULL, 26, NULL, NULL, '2024-06-25 07:02:11', '2024-06-25 18:44:05', '2024-06-25 18:44:05'),
(78, 'Sandra', 'Baker', '39484939', '2024-20252612', '$2y$10$r8bnvrMPstZwCoSBfyrv1OQWu4JkqCetW9EhKgS5lVObQDNM1a6pm', 'female', NULL, '2020-04-04', 'sandar rd', 'sander rd', NULL, 0, 0, NULL, 26, NULL, NULL, '2024-06-25 07:02:12', '2024-06-25 18:44:05', '2024-06-25 18:44:05'),
(79, 'Bridget', 'Jones', '37465848988', 'hp@tp.com', '$2y$10$N5yaACuqxSUCPbV0IbCxJe7rFkavCu8Bx6d7HrRImtZH5UpiudZae', 'male', NULL, '1992-12-10', '2454 W Campbell Ave', '2454 W Campbell Ave\r\nApt 212', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 07:15:24', '2024-06-25 07:15:24', NULL),
(80, 'Ben', 'Pey', '3485894393', 'jones@tamtam.cm', '$2y$10$TlkvaETt4K04eB9aYxMpXuUC4e1R6nFSO7C6bS7AQ5I4mfVkEh3fW', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 07:23:53', '2024-06-25 07:23:53', NULL),
(81, 'Ben', 'Peyechu', '4802803003', '2024-20252613', '$2y$10$L4Fm6SIYSrJOCkso1rNOF.5t5590Pf479qjAf4r9Sajq7sq/MqI92', 'male', NULL, '2014-10-19', '2454 W Campbell Ave', '2454 W Campbell Ave\r\nApt 212', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 07:23:53', '2024-06-25 18:06:42', NULL),
(82, 'hey', 'hey', '123', 'r@gmail.com', '$2y$10$XKgE69l0YvSPGjgbpUHq3uDz4BjufF05iJzYAmEZRVZU186oEjxgC', NULL, 'user/667a4d963297e2.339263331719291286.PNG', NULL, NULL, NULL, NULL, 1, 0, NULL, 30, NULL, NULL, '2024-06-25 14:24:46', '2024-06-25 14:24:46', NULL),
(83, 'Denver', 'Jones', '73646737', 'denver@mile.com', '$2y$10$kUqfDdc25wCu0crw9fHreeH7Bj0ypsMz9Kw2.QlNSruxiglu/bVxa', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 18:08:37', '2024-06-25 18:08:37', NULL),
(84, 'Denver', 'Mike', '4802803003', '2024-20252614', '$2y$10$0DKaYLyRm3Blw8UjqTVjpORGt3oqQSwTfxi4GSty3E.Rk4uTcs7Uu', 'male', NULL, '2019-10-10', '2454 W Campbell Ave', '2454 W Campbell Ave\r\nApt 212', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 18:08:37', '2024-06-25 18:08:37', NULL),
(85, 'Don', 'Draper', '1234567899', '2024-20252615', '$2y$10$.p5l1EofhKQwuAunfzIcjuasKdrt4Ti7rPPMWV/nClG3xf.HEmGb6', 'male', NULL, '2020-12-06', 'hyundai st', 'hyundai st', NULL, 0, 0, NULL, 26, NULL, NULL, '2024-06-25 18:09:27', '2024-06-25 18:44:05', '2024-06-25 18:44:05'),
(86, 'Sandra', 'Baker', '39484939', '2024-20252616', '$2y$10$U.GyPqwFPhzku.USx7csYOUAtQ4SAbWTSjzbwquHEfKJionK8R5Tq', 'female', NULL, '2020-04-04', 'sandar rd', 'sander rd', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 18:09:28', '2024-06-25 18:10:57', NULL),
(87, 'Don', 'Draper', '1234567899', '2024-20252617', '$2y$10$XVZusocCnUBZ7Dcir1Kg8eJ2/r3pdJQwYkcrJ.WSM2dKjVkw5u.gO', 'male', NULL, '2020-12-06', 'hyundai st', 'hyundai st', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 18:11:55', '2024-06-25 18:12:11', NULL),
(88, 'Edith', 'Ndole', '39484939', '2024-20252618', '$2y$10$DDVFi0tOa7LWApEd/wrjxub2b2CsXiA.bAif5J7c8PMcDKxOFD.yy', 'female', NULL, '2020-04-04', 'sandar rd', 'sander rd', NULL, 1, 0, NULL, 26, NULL, NULL, '2024-06-25 18:11:56', '2024-06-25 18:42:46', NULL),
(89, 'Kel', 'Jones', '237657546330', 'taaplydouala@gmail.com', '$2y$10$hcRL76BFlMxuQkWpnAedXOwf.xC2Ww4AXxzpgIbV33zmgJlDYwz46', 'female', 'user/667afad2085361.360623631719335634.jpg', '1970-01-01', 'Rue Drout, Akwa, Douala', 'Rue Drout, Akwa, Douala', NULL, 1, 0, NULL, 31, NULL, NULL, '2024-06-26 02:35:29', '2024-06-26 02:43:54', NULL),
(90, 'Ebenezer', 'Jones', '237682907698', 'bosstaaply@gmail.com', '$2y$10$qFVxbzdwLcSfmWWM28fdqeyYETM8E2vwRNizohdlPYAX8KHmDYQ2q', 'male', 'user/667afe74c49609.676925181719336564.jpg', '1982-01-01', '2454 W Campbell Ave', '2454 W Campbell Ave\r\nApt 212', NULL, 1, 0, NULL, 31, NULL, NULL, '2024-06-26 02:59:24', '2024-06-26 02:59:24', NULL),
(98, 'Leks', 'Mr', '657546330', 'lekel.asonganyi@gmail.com', '$2y$10$NTwQfv2Ie7B5dFJefHOarON0mSlZi5dqNCUlpzBCe2M50JYTAcr5O', 'male', 'guardian/667bc092062681.552697121719386258.jpg', NULL, NULL, NULL, NULL, 1, 0, '', NULL, NULL, NULL, '2024-06-26 16:47:38', '2024-07-22 04:28:32', NULL),
(99, 'Samuel', 'Njobo', NULL, '2022-23311', '$2y$10$Z2cK5.ARBdQciF.9TpPO2.3lf4XEyv1U9pn4qQlafH7eUamT.OBra', 'male', 'user/667bc09232d001.160787101719386258.jpg', '1989-12-10', '230 Uro St', '340 Dane Dr', NULL, 1, 0, '', 31, NULL, NULL, '2024-06-26 16:47:38', '2024-06-27 07:18:05', NULL),
(100, 'Lydia', 'Mbeng', '677024205', 'mbenglydia15@gmail.com', '$2y$10$4iyMh3mjoq4kKWHen8JAie8SSiUsNzG6OdT94ec4N8Rufcocvv6li', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 32, NULL, NULL, '2024-06-27 00:51:56', '2024-06-27 00:51:56', NULL),
(101, 'Alice', 'Ngujede', '237697338833', 'gentlealice@gmail.com', '$2y$10$HY3EFkQt.9jME/16aD.QWOgK5LfSLAREhiikHLC8BgGly3rqqCAEu', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 32, NULL, NULL, '2024-06-27 01:50:27', '2024-06-27 01:50:27', NULL),
(102, 'Demo Parent', '1', '1234567890', 'ericluboya@gmail.com', '$2y$10$CvOLElJuadijyqHe535X8eGJgQisFr29C9vb34lNQWaNXoljX2xl6', 'male', 'guardian/667d3e124165a5.285287391719483922.png', NULL, NULL, NULL, NULL, 1, 0, 'cMOTqAWNT9KpTXlkXXBwYy:APA91bF1UXoYliP-mlIPJjkYrIbRoEBN7JpsoRtV407uSiEUOczsEPnW6i4loiQCj05Y0I8TLwXdomGZNYHLnlG3PsgQJJj0YIdQtINvHkXpv0X-gEUlW6HEnUHCmgArV8moGVgJhzRH', 29, NULL, NULL, '2024-06-27 19:55:22', '2024-07-16 21:50:09', NULL),
(103, 'Demo Student', '1', '1234567890', '2024-2025291', '$2y$10$qdyOMidvU4k2FGnmCEClmO2UEi5e7s0BiidlXs5trxICyj2gfwia2', 'male', 'user/667d3e1280c399.146570071719483922.png', '2024-06-27', 'XYZ', 'XYZ', NULL, 1, 0, 'fg9zpau4RQaNhipg7M4-ql:APA91bFjdUryEVsqxnXzaW8CBsl2kDkk-DSvlhffpxz99-6vxaY_81fBGQigpoe65730IN6Qqs7S9mo3-E6jmYlGA7sZ4RSj74Qt8QVSPwNKOJ3_BvXCcdPmLXe0otmwhM1wP9U3I5oE', 29, NULL, NULL, '2024-06-27 19:55:22', '2024-07-17 04:43:40', NULL),
(104, 'Teacher', 'John', '1234567890', 'demo@techchampglobal.com', '$2y$10$vmv8eDkVpk2XXBqjXE5vwe7R8X1R0mHH93ynlU3l99y2esbCkK9aa', 'male', NULL, '2024-06-28', 'xyz', 'xyz', NULL, 1, 0, NULL, 29, NULL, NULL, '2024-06-28 16:29:37', '2024-06-28 16:30:18', NULL),
(105, 'Jenny', 'Ndifor', '657546330000', 'g@g.com', '$2y$10$1tBCzbdMgVKY69uZT2BbLOYsyUWct9IH5eG4AZjXKFOTWmvZ1D/Ay', 'female', 'user/669d2f381a8669.462209031721577272.jpeg', '1970-01-01', 'Rue Drouot, Akwa', 'Rue Drouot, Akwa', NULL, 1, 0, NULL, 33, NULL, NULL, '2024-07-01 18:08:45', '2024-07-22 01:24:32', NULL),
(106, 'Laurine', 'Kawala', '656329711', 'laurineyeumou@gmail.com', '$2y$10$DJspLBeMkcYSXqWULOG/AO7a/FPCafL2kbJ4SqZ20HZkt0Of405cO', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 34, NULL, NULL, '2024-07-01 18:43:55', '2024-07-01 18:43:55', NULL),
(107, 'Guy', 'Gg', '695438832', 'rh.professionnel@yahoo.fr', '$2y$10$ehwwXZr6qhRMBWFMnRTib.9ey0HFRBVnyNh1.EKU53O9Wiuq23dEC', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 35, NULL, NULL, '2024-07-03 21:09:32', '2024-07-03 21:09:32', NULL),
(108, 'Dorimaine', 'Mboujiko', '237678783846', 'dorimaine.mboujiko@iuget.org', '$2y$10$H8YVkiKB3vg77/uMWC1Kbu1Nil4tm0i0ADb/laeyD3G3cMjSlm.LC', 'female', NULL, '2020-08-19', 'Bonamoussadi', 'Bonamoussadi', NULL, 1, 0, NULL, 27, NULL, NULL, '2024-07-04 00:44:00', '2024-07-04 00:44:00', NULL),
(109, 'Joseph', 'Barner', '657546330', 'jo@taaply.com', '$2y$10$k2jD7hO25tch6nScCOD0A.JDZKaaByN4fcU1Be6sPx0tuno7leOfS', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 36, NULL, NULL, '2024-07-04 16:11:51', '2024-07-04 16:11:51', NULL),
(110, 'Desire', 'MBA', '067223169', 'kemlemo2011@gmail.com', '$2y$10$36Rja/S5A1/h7PEieZqd5eaBs0WQ5q07EvjF0ijTKjytWZJSCl68i', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 37, NULL, NULL, '2024-07-18 22:47:50', '2024-07-18 22:47:50', NULL),
(111, 'Jean Michel', 'TIAPO', '0708592565', 'jean.michel.tiapo@gmail.com', '$2y$10$OIo4hJA/QYuIS5jnMZJ.iubuxG57vXCtrjw4c8wIzoWlsTexNx/Wm', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 38, NULL, NULL, '2024-07-20 07:26:22', '2024-07-20 07:26:22', NULL),
(112, 'Desire', 'MBA', '00242067223169', 'sandrinejoy557@gmail.com', '$2y$10$s7u7njjvXz3JDq3F7q6ydem.dyNohApGAQVBP.VMI.HMwIwCliB7C', 'male', 'user/669ae8903ae6f6.378990931721428112.jpg', '2024-07-17', 'Moungali', 'Moungali', NULL, 1, 0, NULL, 37, NULL, NULL, '2024-07-20 07:58:32', '2024-07-22 05:02:51', NULL),
(119, 'Andy', 'Gazra', '6738493921', 'gazrabrosshop@gmail.com', '$2y$10$FYvgY901QwIJwStpmpKhOup7bKqcvIjpEnu/RNP9wEeEbYpHBd1JC', 'male', 'user/669d499925c306.883518631721584025.jpg', '1981-12-02', 'Rue Bebey Elame, Akwa, Douala', 'Rue Bebey Elame, Akwa, Douala', NULL, 1, 0, NULL, 33, NULL, NULL, '2024-07-22 03:17:05', '2024-07-22 03:17:05', NULL),
(120, 'Fidelis', 'Nchomba', '6834930023', 'asonganyigroup@gmail.com', '$2y$10$Qd9Z8WGST63uWaV6Fg2BrOtyjFDDxAvv4VQj9c81zGmCeeGA6QZmq', NULL, 'user/669d4f63739c14.605486861721585507.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 33, NULL, NULL, '2024-07-22 03:41:47', '2024-07-22 03:41:47', NULL),
(121, 'Joan', 'Masango', NULL, '2024-25331', '$2y$10$sw55BSLRiiZkgKwUqOO7O.hQSM/ic/wttdI6bB2w4.lLF0XzQ8IlS', 'female', 'user/669eb352b72808.774523151721676626.jpg', '2013-08-10', 'Bonaberi, Douala', 'Bonaberi, Douala', NULL, 1, 0, 'dhuWDEd6lUtXizMhyEeWAN:APA91bFNUufzSPz4EsVHyKdU8V9v0BGWzGJRAYxYCHkIv6TbhoKIYGbqqmY3MBbDaebbuhB-xyFrl2kN4NvTvzeGN7TWJem6ixmivnkKDAu9tgCEIjim0vchfuvItvt7yGPUVBQ6f6bc', 33, NULL, NULL, '2024-07-22 04:28:32', '2024-08-22 22:25:53', NULL),
(122, 'Jill', 'Marcson', NULL, '2024-253322', '$2y$10$r0xq12M8GBDWHuOjeQG0CeGjZiyl0pcwXps/qlDRW1Wz1sK105b4.', 'female', NULL, '2014-01-20', 'Sadi, Douala', 'Sadi, Douala', NULL, 1, 0, NULL, 33, NULL, NULL, '2024-07-22 04:32:48', '2024-07-22 04:32:48', NULL),
(123, 'Jean Paul', 'NKOUONDE MPEL', '695767078', 'jnkouonde@gmail.com', '$2y$10$7zsj9bUdH1FI74k5ML2yv.3ajRO9E444MYjA9VVLluOi2xr44X0PC', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 39, NULL, NULL, '2024-07-23 00:30:36', '2024-07-23 00:30:36', NULL),
(124, 'Fhj', 'Fg', '25653578', 'asdfg@bb.com', '$2y$10$NsyAQxl8ry5L2hcTzhtEUuO0KYGovnSq5k4GfuOVdwCLXuZXfvkH.', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 40, NULL, NULL, '2024-08-10 14:45:24', '2024-08-10 14:45:24', NULL),
(125, 'TedIdofe', 'TedIdofe', 'kayleighbpsteamship@gmail.com', 'kayleighbpsteamship@gmail.com', '$2y$10$VQS309T50hBnAJ15E/GewuOw.m3/qFtx6nK8RIOmzLkFTiqYX5s/2', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 41, NULL, NULL, '2024-09-08 22:32:52', '2024-09-08 22:32:52', NULL),
(126, 'MasonIdofe', 'MasonIdofe', 'yjdisantoyjdissemin@gmail.com', 'yjdisantoyjdissemin@gmail.com', '$2y$10$hVjKSmZkrl8gpjOwR8doRuvbozMoK.S1CUV7iKkN1hl5w7A4mwGOe', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 42, NULL, NULL, '2024-09-22 15:32:03', '2024-09-22 15:32:03', NULL),
(127, 'WilliamGuift', 'WilliamGuift', 'eee666@rambler.ru', 'eee666@rambler.ru', '$2y$10$MmOXW5vA3YDo3iZF4ZrUZ.yx5FwaEQnqJ2S4EkaxW4qgoQqneB.1u', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 43, NULL, NULL, '2024-09-25 21:58:58', '2024-09-25 21:58:58', NULL),
(128, 'gorridaGuift', 'gorridaGuift', 'dmtest005@rambler.ru', 'dmtest005@rambler.ru', '$2y$10$eke/w9wH14Lk.ge8TOlKveqoyy9d7gLOi/fTcfGeE6YbIcugxloKm', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 44, NULL, NULL, '2024-09-26 22:47:08', '2024-09-26 22:47:08', NULL),
(129, 'fernnostiGuift', 'fernnostiGuift', 'l2test004@rambler.ru', 'l2test004@rambler.ru', '$2y$10$1YUHj0wO7m3SnK3QSE2pNOImO9ZCS1ius3.M2ajnu3scIB9PIw7gm', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 45, NULL, NULL, '2024-09-27 06:35:16', '2024-09-27 06:35:16', NULL),
(130, 'Dianesob', 'Dianesob', 'ivan337moscow@gmail.com', 'ivan337moscow@gmail.com', '$2y$10$q72ZHcquaG5WifvtPBhbXumUHnUWV8nFqQ26SzUyjLESiJl.Hlq1W', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 46, NULL, NULL, '2024-09-30 05:44:02', '2024-09-30 05:44:02', NULL),
(131, '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', '<strong><a href=\"https://pr-site.com\">primer-5</a></strong>', 'thomaskingial13@gmail.com', '$2y$10$itgv4gXCY4WYU8ugOdZaBedxYV6wfzWP65iLvsotCuPNN15q4fJIK', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 47, NULL, NULL, '2024-09-30 06:36:03', '2024-09-30 06:36:03', NULL),
(132, 'RobertIdofe', 'RobertIdofe', 'cmcleyva@gmail.com', 'cmcleyva@gmail.com', '$2y$10$OROm75oWPkfWc1n1IRCfVe2fEBfEVxfhTURjoGfbzuvSvTaKL8tMK', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 48, NULL, NULL, '2024-10-07 13:17:49', '2024-10-07 13:17:49', NULL),
(133, 'Joannemal', 'Joannemal', 'ivan5443moscow@gmail.com', 'ivan5443moscow@gmail.com', '$2y$10$jC/9dQ6hFqTZz1/sYEg0Zegq3kq.T8X133PCxh2dAiyQpyptN1a16', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 49, NULL, NULL, '2024-10-13 02:26:48', '2024-10-13 02:26:48', NULL),
(134, 'TedIdofe', 'TedIdofe', 'axobajigufo34@gmail.com', 'axobajigufo34@gmail.com', '$2y$10$bPIBxAkRNTC72dRzKl19Aud/b4J9siQvNPn/Jtx6H7eVBb/1jJKES', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 50, NULL, NULL, '2024-10-14 17:03:38', '2024-10-14 17:03:38', NULL),
(135, 'MasonIdofe', 'MasonIdofe', 'yawiviseya67@gmail.com', 'yawiviseya67@gmail.com', '$2y$10$EyxnccLPp1lcaWCC1Rxb0ugnnKvaaG9z3CaU1li55LLSIicyq561e', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 51, NULL, NULL, '2024-10-15 22:36:48', '2024-10-15 22:36:48', NULL),
(136, 'MasonIdofe', 'MasonIdofe', 'ebojajuje04@gmail.com', 'ebojajuje04@gmail.com', '$2y$10$2boQhRcSBtFOweHHg83FZ.JYFUOZR.9K2e.b3ajqIAjBpdmZ98TXq', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 52, NULL, NULL, '2024-10-16 01:58:57', '2024-10-16 01:58:57', NULL),
(137, 'MasonIdofe', 'MasonIdofe', 'duqotayowud23@gmail.com', 'duqotayowud23@gmail.com', '$2y$10$/49pM1.XLsFnr3FbCrjeQOktnV1gaV8edCoVkRa20phhW9xq.MePK', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 53, NULL, NULL, '2024-10-16 15:26:32', '2024-10-16 15:26:32', NULL),
(138, 'MasonIdofe', 'MasonIdofe', 'somasesokiyo31@gmail.com', 'somasesokiyo31@gmail.com', '$2y$10$X7B6d6AzZnYG6lzAgT4yfuZB8qZD/aqFSu6vGzEsYRxsxsyes4xXu', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 54, NULL, NULL, '2024-10-23 15:46:44', '2024-10-23 15:46:44', NULL),
(139, 'DavidIdofe', 'DavidIdofe', 'ibucezevuda439@gmail.com', 'ibucezevuda439@gmail.com', '$2y$10$QzcHr4CTjjXoAhc4MbXVe.MZ7CStWeBedj/ZdItUC00lYsDRvB2wC', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 55, NULL, NULL, '2024-10-28 06:56:53', '2024-10-28 06:56:53', NULL),
(140, 'Michealprell', 'Michealprell', 'raymondUtitari@gmail.com', 'raymondUtitari@gmail.com', '$2y$10$VGANItp1uw5QMEkK3eRjoOmIiaHEkTsD7i0x1Hk/pWTA1HbAEFYqK', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 56, NULL, NULL, '2024-10-29 11:55:07', '2024-10-29 11:55:07', NULL),
(141, 'Brianfuh', 'Brianfuh', 'm.ega.st.o.p.l.a.y@gmail.com', 'm.ega.st.o.p.l.a.y@gmail.com', '$2y$10$dffPbP9ryzQnFy8PuSyjUO0JpVvYJ5/SvL0StRAzxs.PGgg7DUnIW', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 57, NULL, NULL, '2024-11-09 12:02:15', '2024-11-09 12:02:15', NULL),
(142, 'Rithy', 'Olsg Ard', 'I m scared shitless drops of the same good You', 'zmabmbmbsiuj@dont-reply.me', '$2y$10$Gv66tiYauxPlLj9IMcYzQeTzCQ5.foHUxXuOqXl7klUFa4yTl9jBS', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 58, NULL, NULL, '2024-11-17 15:46:12', '2024-11-17 15:46:12', NULL),
(143, 'Aleks Plekhov', 'Aleks Plekhov', 'abc@eforum.top', 'abc@eforum.top', '$2y$10$0mENGHMT1VVCnrUs8ab5xewJFF08uKZdyDMnu6YTNIp7tQ9JTGira', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 59, NULL, NULL, '2024-11-30 10:07:02', '2024-11-30 10:07:02', NULL),
(144, 'Mike Babcock', 'Mike Babcock', 'mikexxxx@gmail.com', 'mikexxxx@gmail.com', '$2y$10$9dddbzBBioylEwBUnKxfBuxh6CeEyj4r6FppnrrDw8E6J7eETDMoS', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 60, NULL, NULL, '2024-12-01 22:36:27', '2024-12-01 22:36:27', NULL),
(145, 'Newton Poole', 'Newton Poole', 'melaniefell51@gmail.com', 'melaniefell51@gmail.com', '$2y$10$ewu9Erbz52HFDu9ihN/f/uiPzsV.uATF4bqzSZiGKCHDrp64DmmWi', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 61, NULL, NULL, '2024-12-03 22:13:35', '2024-12-03 22:13:35', NULL),
(146, 'crypto7icede', 'crypto7icede', '777@zel.biz', '777@zel.biz', '$2y$10$PiWYSRYJjYj18xrzAZtdkONh7.qzLU5.YueBz1Jb3iOpCOgH6ZCjy', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 62, NULL, NULL, '2024-12-05 10:34:45', '2024-12-05 10:34:45', NULL),
(147, 'Maxence', 'Breezee', 'It was whistling and the Great Patriotic near me by the dark smudge parted at', 'bzrzsbmsejuj@dont-reply.me', '$2y$10$XaZ/rpNWNm6jQs0KZqXmBO2u4Kr9Hf903Q5pnyID0r9ujeYTNU2q.', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 63, NULL, NULL, '2024-12-16 11:15:22', '2024-12-16 11:15:22', NULL),
(148, 'TedIdofe', 'TedIdofe', 'moqagides18@gmail.com', 'moqagides18@gmail.com', '$2y$10$ON04j3EYJhWxFp.bglFIzuhw3ifkFiNP90f3JfGzgSDs5jOTQl2gK', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 64, NULL, NULL, '2024-12-17 20:04:34', '2024-12-17 20:04:34', NULL),
(149, 'Andrzej', 'Peitsalo', 'The grunts having parted at the situation Does', 'bbsjeriemjuj@do-not-respond.me', '$2y$10$U2WmZhVQQoFgVnEF5y83XOgEJTTM2bgobP35fHjM0V9ftS4BcR9.C', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 65, NULL, NULL, '2024-12-21 07:23:40', '2024-12-21 07:23:40', NULL),
(150, 'JohnIdofe', 'JohnIdofe', 'arikerer278@gmail.com', 'arikerer278@gmail.com', '$2y$10$usfX0sxeqykdRnB1JL9MDesNKZowFOT8QF7vcTRHcH.XuOZpkeqey', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 66, NULL, NULL, '2024-12-22 04:47:25', '2024-12-22 04:47:25', NULL),
(151, 'Nikhama', 'Jochen', 'AKM suffers from the stream The most of the wire Thirty men were already on the hunger', 'bamlsaelijuj@dont-reply.me', '$2y$10$FHmmLgceIHnTbf8ZSiEfZulSqZjfJ.5lC77d8BRru312kaZ9sP4I2', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 67, NULL, NULL, '2024-12-26 09:17:14', '2024-12-26 09:17:14', NULL),
(152, 'Gafiyat', 'Casci', 'Sanych s cattle was to you apparently the Railway Station the Christ', 'bleseamrbjuj@do-not-respond.me', '$2y$10$/DJZsjgFbMr58RijYufxXuvr60rdhGqph2H.dGWx/LndvudNpNCPO', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 68, NULL, NULL, '2024-12-31 14:22:37', '2024-12-31 14:22:37', NULL),
(153, 'Mike Oscar Willems', 'Mike Oscar Willems', 'info@professionalseocleanup.com', 'info@professionalseocleanup.com', '$2y$10$lGd59HbE4eemsmCMAbWYMusMI9JVYA1RCmsZ53g65CcH2LyzZQ8D2', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 69, NULL, NULL, '2025-01-01 10:23:08', '2025-01-01 10:23:08', NULL),
(154, 'Jandell', 'Arcineda', 'Sanych somewhat fatherly lectured me something medieval wakes up at the', 'rjaasiijjjuj@do-not-respond.me', '$2y$10$K0wUOHmT7zhW7FVrZMN2IOu3kKKn5gHKwrnT6HRsEJ/MlzJqUs0Ii', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 70, NULL, NULL, '2025-01-06 10:34:30', '2025-01-06 10:34:30', NULL),
(155, 'Mike Per Petitson', 'Mike Per Petitson', 'mike@monkeydigital.co', 'mike@monkeydigital.co', '$2y$10$dV4WkvO2X1WOmEZ.SzZRtODWIWfdSWCTFi22FBXImWf.j54aE8tk6', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 71, NULL, NULL, '2025-01-16 19:06:55', '2025-01-16 19:06:55', NULL),
(156, 'Mike Swen Weber', 'Mike Swen Weber', 'info@strictlydigital.net', 'info@strictlydigital.net', '$2y$10$zL4WEg3ErVEQlSsfUjNmw.ytRZGsV5i7CDzRzSqu.lu7LvYdH999i', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 72, NULL, NULL, '2025-01-18 22:07:29', '2025-01-18 22:07:29', NULL),
(157, 'Yero', 'Oumar', '621009082', 'info@mbc.cm', '$2y$10$dpSmzJPb5nfNnWULUteELOLPQLgB1ZjhyN6S1zqT7Avp8Mu4C8ZNa', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 73, NULL, NULL, '2025-01-20 22:40:09', '2025-01-20 22:40:09', NULL),
(158, 'Mike Leon De Smet', 'Mike Leon De Smet', 'info@speed-seo.net', 'info@speed-seo.net', '$2y$10$GcpujsshUDLcd4UbsdRAaOoj6/GiRXV1tlF69.rZ2fJONhkyq8nma', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 74, NULL, NULL, '2025-01-23 13:13:47', '2025-01-23 13:13:47', NULL),
(159, 'Vaness', 'Calb', 'I m also For Fyodor burst in the', 'azmlemllajuj@dont-reply.me', '$2y$10$1oqzslfMsqptncpwRkwsEe8wsaskCCFZmZTMJ2BxAjDFi42WLMbEe', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 75, NULL, NULL, '2025-01-25 00:36:25', '2025-01-25 00:36:25', NULL),
(160, 'Nakye', 'Perellon', 'It means the running shooting hook and for the third one with my', 'aiaabzzmmjuj@dont-reply.me', '$2y$10$aNLIZQcyVGnlsKCKid/Efeyb84oCFiM.bHEiQNA2odiYoWlASD/Be', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 76, NULL, NULL, '2025-01-29 13:34:27', '2025-01-29 13:34:27', NULL),
(161, 'Mendi', 'Legree', 'Now I m depressed just some sensed the world bursts of nicotine plugs Go for', 'allblzlaijuj@dont-reply.me', '$2y$10$OqQGVHElULGsPTlT3.cz0.gGZEy5tsQ.O3YkvsVO8kJUOW5tL/dMS', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 77, NULL, NULL, '2025-01-31 10:57:52', '2025-01-31 10:57:52', NULL),
(162, 'Luis Alves', 'Luis Alves', 'intl.law7@aol.com', 'intl.law7@aol.com', '$2y$10$W/bcHJ7qaoxQzRn2SKy6ru2qjeRBYzL.7/awtWsyW5VeqrQTULtK.', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 78, NULL, NULL, '2025-02-03 23:17:14', '2025-02-03 23:17:14', NULL),
(163, 'Mike Sven-Erik Frangois', 'Mike Sven-Erik Frangois', 'info@digitalxflow.com', 'info@digitalxflow.com', '$2y$10$c9OOb0SY.1JsoDPCMaNvX.mwUqjkW9TpcD7kCzra5D2ryDF2iAYHO', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 79, NULL, NULL, '2025-02-06 08:00:21', '2025-02-06 08:00:21', NULL),
(164, 'Thomas Seligman', 'Thomas Seligman', 'thomas.seligman@mail.com', 'thomas.seligman@mail.com', '$2y$10$sAQT2TLrkpUTKw6pUPC2HeD611udyVeyp0jlGfm55HTUwVPRHSysq', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 80, NULL, NULL, '2025-02-11 14:04:52', '2025-02-11 14:04:52', NULL),
(165, 'Nicholas Doby', 'Nicholas Doby', 'dobyfinancial@sendnow.win', 'dobyfinancial@sendnow.win', '$2y$10$jR2DP0wlnt03/o4xy1RqHumcCsVTmvQ6DxSD4Q8CfhUmGi3C1OCcy', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 81, NULL, NULL, '2025-02-12 09:55:57', '2025-02-12 09:55:57', NULL),
(166, 'Yasuhiro Yamada', 'Yasuhiro Yamada', 'rohtopharmaceutical@via.tokyo.jp', 'rohtopharmaceutical@via.tokyo.jp', '$2y$10$N9bL1XbKluR7h.xj0XEmCuL8MOAooLBI6KuIzTbFX09ZVMP//Uvfe', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 82, NULL, NULL, '2025-02-12 10:00:43', '2025-02-12 10:00:43', NULL),
(167, 'Amandaflastec', 'Amandaflastec', 'amandawemicets3@gmail.com', 'amandawemicets3@gmail.com', '$2y$10$GDPII2KFAHOKEga4bv0j3O8O2cj3tsxNAM0EyXw0SqCnn9/CbIKyS', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 83, NULL, NULL, '2025-02-14 04:46:24', '2025-02-14 04:46:24', NULL),
(168, 'Mike Oscar Schmidt', 'Mike Oscar Schmidt', 'check-message3323@gmail.com', 'check-message3323@gmail.com', '$2y$10$.9BPw.aBw1bxQO/H8kF8UeSLOEiVZq7EWWd7FWzsNkATq9osI7G9m', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 84, NULL, NULL, '2025-02-16 09:44:44', '2025-02-16 09:44:44', NULL),
(169, 'Mike Lars Johansson', 'Mike Lars Johansson', 'check-message7819@gmail.com', 'check-message7819@gmail.com', '$2y$10$6UkRbVmUMXeglLYj1iG1Ne7XgecyWP0OmBYYLJ.xhZmvsMo6ePDmS', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 85, NULL, NULL, '2025-02-16 13:17:46', '2025-02-16 13:17:46', NULL),
(170, 'GeorgeIdofe', 'GeorgeIdofe', 'ocopesuq299@gmail.com', 'ocopesuq299@gmail.com', '$2y$10$XTb4HzaqxaylK50JsWEMRuZvSrYW9zfG4mkPOS7BgCmbiKhcHWj2C', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 86, NULL, NULL, '2025-02-17 15:28:58', '2025-02-17 15:28:58', NULL),
(171, 'Leticia', 'Diffo MADAH', '237697955823', 'info@diffo.com', '$2y$10$vCr1YNdMPbx8XF1mV0zdfu.TT9bzJaN/t3xkajhBe4oXBOdg.iGU.', 'female', NULL, '1999-05-19', 'Bepanda', 'Bepanda', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 20:10:05', '2025-02-26 20:10:05', NULL),
(172, 'Fritz', 'Kamegne', '237693149355', 'info@Kamegne.com', '$2y$10$/HjmPlBtK3b5vBOeBxkjOeEWNSLXzPNGXRtse6SY5qLuTXU561u3G', 'male', NULL, '1993-10-18', 'Bepanda', 'Bepanda', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 20:12:04', '2025-02-26 20:12:04', NULL),
(173, 'Christelle Flore', 'Kemayou Ngassa', '237679150942', 'info@Kemayou.com', '$2y$10$7Fjg.BeI8DXBqBdveJE6hO7gn60AGI7NyvlY6Zpp6dlfoVXzJ8Ojm', 'female', NULL, '1986-02-02', 'Bepanda', 'Bepanda', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 20:14:03', '2025-02-26 20:14:03', NULL),
(174, 'MIREILLE GABRIELLA', 'ASSOMO ASSIGA', '697955823', 'assomo@info.cm', '$2y$10$NljcNZGjEc2AWmMuqphZDuSQeqLVqwF12eJhZydhXyNSQK//ObB2C', 'female', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:01:54', '2025-02-26 21:01:54', NULL),
(175, 'MIREILLE GABRIELLA', 'ASSOMO ASSIGA', '697955823', '2022-23731', '$2y$10$APJIgz9.csHMxapGXDl1Zu8TVWhsgkQdBVMpguz1/GyWvKSH7sGZa', 'female', NULL, '2019-02-13', 'Bepanda', 'Bepanda', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:01:55', '2025-02-26 21:01:55', NULL),
(176, 'Leticia', 'Diffo MADAH', '697955823', 'mirelle@info.com', '$2y$10$oU56pFtM2wmJav3F4A.uQOBFk7rL5hF0NwsR7qm2rwSZMNOvQtndO', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:03:56', '2025-02-26 21:03:56', NULL),
(177, 'MIREILLE GABRIELLA', 'ASSOMO ASSIGA', '697955823', '2022-237324', '$2y$10$HQXYQpO5inn6vC.J/baJ9./wOsiHRd1CpOOHkmjk61.oEwT9GqBfq', 'female', NULL, '2019-02-13', 'Bepanda', 'Bepanda', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:03:56', '2025-02-26 21:03:56', NULL),
(178, 'ETOKA NJOOH', 'NJOOH', '67005500', 'etoka@info.cm', '$2y$10$Kr388zFGdHJnDjKvup0jk.CamifN9uizfi9r10YgIs/YzcJFNOV9S', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:06:42', '2025-02-26 21:06:42', NULL),
(179, 'ETOKA NJOOH', 'ALISKA DUBOISE', NULL, '2022-237325', '$2y$10$iaI/xBxQnwWX1ZDMSQ2mFOi43.GHMCOHqvvSAAeubU6EhCOP/9EJm', 'male', NULL, '2023-06-20', 'nyalla', 'akwa', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:06:42', '2025-02-26 21:06:42', NULL),
(180, 'yando', 'jean', '699879963', 'yando@info.cm', '$2y$10$6qhzer30OZYsPQA0GJ88vODxqUP1NVcLlQZPLrgw3MJfcaxgJv.BG', 'male', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:09:29', '2025-02-26 21:09:29', NULL),
(181, 'TANKOUA YANDO', 'ARTHUR', '678895265', '2022-237326', '$2y$10$wAmwlICDGp/3FPN7O1mCbu7kbDjwTfLZDMtAHGLt3eyzbYRFTOHGG', 'male', NULL, '2009-07-15', 'total Kolbong', 'total Kolbong', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-02-26 21:09:29', '2025-02-26 21:09:29', NULL),
(182, 'MyName', 'Hello', '46', 'uppicqib@do-not-respond.me', '$2y$10$F4IyUpCj8Bc8kMyolrSSEu9kgPPR31WlXYuXkgGoQCZLVaE63IKMG', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 87, NULL, NULL, '2025-03-02 10:56:19', '2025-03-02 10:56:19', NULL),
(183, 'Ernestshigo', 'Ernestshigo', 'pr.ogon0809@gmail.com', 'pr.ogon0809@gmail.com', '$2y$10$KB4oxAidSGb8VRWasPASu.rIDVHj4ywNwD45lw/stf4L/XnWeea8G', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 88, NULL, NULL, '2025-03-04 02:44:36', '2025-03-04 02:44:36', NULL),
(184, 'ThomasBoivy', 'ThomasBoivy', 'progon0809@gmail.com', 'progon0809@gmail.com', '$2y$10$Vkht7T430gWYDc.MdzmuRuQkhtKz3BYkRkvTYcrJwKPwDae2g5r3S', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 89, NULL, NULL, '2025-03-04 13:09:48', '2025-03-04 13:09:48', NULL),
(185, 'FrancisowEst', 'FrancisowEst', 'nomin.momin+328n9@mail.ru', 'nomin.momin+328n9@mail.ru', '$2y$10$2EcQGVFm35O93/63IdIEO.bvjSq6M/CDuQN8sprTYVT/MkJ2e7BlK', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 90, NULL, NULL, '2025-03-05 12:42:24', '2025-03-05 12:42:24', NULL),
(186, 'FILS LUDOVIC', 'ESSOMBA', '237656686430', 'info@essomba.com', '$2y$10$Fw6ihoHVaOgNjGTDsSc8uOsq28Z9aynnbspvbWWQk.wrx0qKHR4LC', 'male', NULL, '1995-01-01', 'NYALLA', 'NYALLA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:13:08', '2025-03-07 20:13:08', NULL),
(187, 'GERVAIS', 'KENNE', '237678864341', 'info@kenne.com', '$2y$10$GiOvBgdSA.8ktToY5z9ojuXa6iAvnykd5bKU03IXvX8GKQcEpPFkO', 'male', NULL, '1992-04-19', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:31:12', '2025-03-07 20:31:12', NULL),
(188, 'MARIE MICHELLE', 'GWETH', '237698684666', 'info@gwethmarie.com', '$2y$10$9sIaTWwTuUXS32mNNI8BNOEQnYzjoqOFE7XbmWRpxEjnEktFgupWq', 'female', NULL, '1992-04-30', 'NYALLA', 'NYALLA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:33:39', '2025-03-07 20:33:39', NULL),
(189, 'MARIE SANDRINE', 'KONI OMENGUE', '237695674975', 'info@koniomengue.com', '$2y$10$F6.YdUEJCTYy7d6ZLfZJ4.s90rDKQJNpi0eiCUZJ87oEVAKp/iDze', 'female', NULL, '1989-05-15', 'NYALLA', 'NYALLA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:36:05', '2025-03-07 20:36:05', NULL),
(190, 'CARINE', 'MOUKAM  MBOUYA', '237691317245', 'info@moukammbouya.com', '$2y$10$cP/2r7XSqQVN0gpRKRQBLen5KD1DPUpyiCo4asaYpEATLK7tFFhte', 'female', NULL, '1993-08-02', 'NYALLA', 'NYALLA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:38:24', '2025-03-07 20:38:24', NULL),
(191, 'Elise Evelyne RENEE', 'NGO BAYIHA', '237699354773', 'info@ngobayiha.com', '$2y$10$q0jV1ayAqlBIdFs.bw6NWeklPWsfDll6LlvBmJR.vjhsewO/XnPC6', 'female', NULL, '1981-02-16', 'NYALLA', 'NYALLA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:40:11', '2025-03-07 20:40:11', NULL),
(192, 'MISPA', 'NGO MBOM', '237692947582', 'info@ngombom.com', '$2y$10$e3/8vFNz5uuOFdHmAjn5/.0BVdZPEkgPD2mZQvq5d5w7242uTTGNi', 'female', NULL, '1996-05-24', 'NDOGBONG', 'NDOGBONG', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:42:42', '2025-03-07 20:42:42', NULL),
(193, 'EMILIENNE NICOLE', 'NGO TJILHA EPSE AKONO', '237699373475', 'info@ngotjilha.com', '$2y$10$oialnEGDDiZ6pDWqf.tvG.lKyi/295LoeyN3XLKx4.i3oxz8pytSC', 'female', NULL, '1983-10-14', 'NYALLA', 'NYALLA', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-07 20:49:45', '2025-03-07 20:49:45', '1970-01-01 06:00:00'),
(194, 'AUDRY', 'NGUIMATSIA TSOFACK', '237694200992', 'info@nguimatsia', '$2y$10$0Ro89olsM3jSR58A/1BYXeZwHzeZjDGkJcFi67yr5yFAbo8jRbHrK', 'male', NULL, '1988-06-23', 'NDOGBONG', 'NDOGBONG', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 20:53:43', '2025-03-07 20:53:43', NULL),
(195, 'JOSEPHINE', 'NLEND BILLONG', '237698771369', 'info@nlendbillong.com', '$2y$10$dejSzKhc1/vsAfat/XGXbOZqyRJt4d.cj02ib6QOYJ8BY80sTFne.', 'female', NULL, '1985-06-17', 'NYALLA', 'NYALLA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-07 21:04:18', '2025-03-07 21:04:18', NULL),
(196, 'Mike Giinter Visser', 'Mike Giinter Visser', 'info@digital-x-press.com', 'info@digital-x-press.com', '$2y$10$p9HrtPqQTB.5c/fmnfLPUu56htOX3c.t9e1.WQF9Y3x/yBeDMpWdi', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 91, NULL, NULL, '2025-03-09 17:08:43', '2025-03-09 17:08:43', NULL),
(197, 'yhyjmh', 'envsbs', 'aro88c', 'pazapz@mailbox.in.ua', '$2y$10$8qAhGr1SwjcYBqd0JXhBIuq1YM4xGIzcyxfs98yfWjKS2rAw0X9/6', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 92, NULL, NULL, '2025-03-10 15:02:39', '2025-03-10 15:02:39', NULL),
(198, 'Williamlat', 'Williamlat', 'barb.oursundin@gmail.com', 'barb.oursundin@gmail.com', '$2y$10$xc83ggePBrdj5JoAAyd58u36H9pJ3WtBlct59/.FvV2pJa7yCULsC', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 93, NULL, NULL, '2025-03-13 00:57:53', '2025-03-13 00:57:53', NULL),
(199, 'ByKnIsk', 'ByKnIsk', 'brosjonson@mail.ru', 'brosjonson@mail.ru', '$2y$10$ORzyweuV7oNps7eMgaflK.w.n93im7LjNNa3Ayycx3ii71xIm6ZGu', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 94, NULL, NULL, '2025-03-19 10:34:34', '2025-03-19 10:34:34', NULL),
(200, 'MyName', 'TestUser', '489', 'tkexiekb@do-not-respond.me', '$2y$10$C9.8eRGFuxrlYmptBcKfF.UUFvHuFWKWRjGZDO06hm0mSUlzIyFzy', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 95, NULL, NULL, '2025-03-20 00:19:07', '2025-03-20 00:19:07', NULL),
(201, 'ADRIAN', 'PROSIPEGOKO NSIPANKO', '237699043859', 'info@prosipengoko.com', '$2y$10$iflcomBOPieP6nVVRhrgg.fer0YxBYvk4RANRIVI67Bgtm7pqCgSq', 'male', NULL, '2001-01-20', 'BEPANDA', 'BEPANDA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-20 22:32:13', '2025-03-20 22:32:13', NULL),
(202, 'YVETTE', 'SEUNKEP DJIEPTI', '237676015216', 'info@seunkep.com', '$2y$10$Jlk09HDoquW9xOmzCvJY3e47WfBqz8Ikj0X3OqdnXpbEeh7LjV/Ua', 'male', NULL, '1983-07-19', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-20 22:35:08', '2025-03-20 22:35:08', NULL),
(203, 'NGUEING SOME', 'SUZANNE', '237694686460', 'info@ngeingsome.com', '$2y$10$w1ykWQwY4ZyGPgMnQLFT3ePfgelj7aJpHp4nR3hrBlKGR06XRlLaC', 'female', NULL, '1986-05-12', 'BONAMOUSSADI', 'BONAMOUSSADI', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-20 22:54:26', '2025-03-20 22:54:26', NULL),
(204, 'NGUEING SOME', 'SUZANNE', '237694686460', 'info@ngueingsome.com', '$2y$10$cyGJ4Ny.teNrqntA0WEmcOxVYhQGNpHbyNERs95JgzX7lsgu5tRtS', 'female', NULL, '1986-05-12', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-20 23:47:43', '2025-03-20 23:47:43', NULL),
(205, 'TAKOU SOH', 'JACQUES MITTERAND', '237697637739', 'info@takousoh.com', '$2y$10$FUzwoO0SGgk7z71y/bEwH.BvRn8J5njhmu90jqUP9Mg5akf/ZlnZm', 'male', NULL, '2025-03-20', 'BEPANDA', 'BEPANDA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-20 23:54:20', '2025-03-20 23:54:20', NULL),
(206, 'TCHEUBEU', 'LANDRY', '237690317583', 'info@tcheubeu.com', '$2y$10$DsNRB1iN6KCI1OeUqPafRuEnDUipTnvagBigl7N1uyboX.uNPMZ3i', 'male', NULL, '1991-06-19', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-20 23:59:06', '2025-03-20 23:59:06', NULL),
(207, 'MAYO DIBOMA', 'TED GUY JUNIOR', '237675544583', 'info@mayodiboma.com', '$2y$10$qZcndUvTRyElmosNUWr9cuQIfCsesvoCUqUhuCtlgQhvhIXyUZKCS', 'male', NULL, '1979-03-05', 'KOTTO', 'KOTTO', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-21 00:13:02', '2025-03-21 00:13:02', NULL),
(208, 'SYLVIE', 'ARREY', '237678472579', 'info@arreysylvie.com', '$2y$10$ZWEpUY9NmWt0reFkXqzBS.TXgGBljCXo3gTD5eXY1oAVzV5tMZQv2', 'female', NULL, '1990-05-28', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-21 18:22:58', '2025-03-21 18:22:58', NULL),
(209, 'N', 'BADAWE MBOUDMO', '237677042586', 'info@badawe.com', '$2y$10$mVTnRgVbDQYVTaKmm.7Y5eeRZlJtB0R1WgR0v7tMhki6avLa3bSxK', 'male', NULL, '1998-05-05', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-23 00:19:22', '2025-03-23 00:19:22', NULL),
(210, 'ARNOLD', 'BIATU TIETOUFOR', '237682244242', 'info@biatuarnold.com', '$2y$10$9b7nRpXeeRsGIpmKGhkBce3r8GM1M32sJNraNM7Gm82.2h0e0zQHy', 'male', NULL, '1999-02-18', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-23 00:23:47', '2025-03-23 00:23:47', NULL),
(211, 'DERIC', 'NNAM MOTSO', '237658126871', 'info@nnammotso.com', '$2y$10$AuX.DaZexXBez9z0lF32m.2wBQiDypVGE7UYNmzkKvCW5ijK9AZim', 'male', NULL, '1997-08-12', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-23 00:26:47', '2025-03-23 00:26:47', NULL),
(212, 'EMILIA', 'LIKOWO NJIE', '237678821082', 'info@emilianjie.com', '$2y$10$qUhx4V261V.AufcbrBIPzuGfHXV7e2XT6OhNP7QyR31BjOWWVHn3K', 'female', NULL, '1979-03-02', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-23 00:29:42', '2025-03-23 00:29:42', NULL),
(213, 'IGNATIUS', 'NKWANGO', '237670237815', 'info@nkwango.com', '$2y$10$AvrlxiGNpESbkQAs8iCi4O1d0x1WU29zn3Di7WXI3Aa0CRXRQK12C', 'male', NULL, '1989-02-17', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-23 00:35:33', '2025-03-23 00:35:33', NULL),
(214, 'GRACE MBOH', 'INJURH', '237675375524', 'info@injurhgrace.com', '$2y$10$TTcCbCFdQufGNpWNJ90BkuyhD9FtSiI.KppC/nniubFcS6lO/1ef6', 'female', NULL, '1983-06-13', 'YASSA', 'YASSA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-24 20:22:44', '2025-03-24 20:22:44', NULL),
(215, 'VALENTINE F', 'JUNGONG', '237675952991', 'info@jungong.com', '$2y$10$xcig4Ij5ExbJ5qQjyZc6N.Fy9B7xQhh7FUUbxBd8RC8rGL/kBNftu', 'male', NULL, '1988-10-06', 'BEPANDA', 'BEPANDA', NULL, 1, 0, NULL, 73, NULL, NULL, '2025-03-24 20:33:01', '2025-03-24 20:33:01', NULL),
(216, 'Kevin', 'Barber', '86', 'renato.chinner37@gmail.com', '$2y$10$FEzsuwtfWSO/YnFO3UvRTeV9xK4Rp9FsUrA.nNsSPnl8nUz8GVlAW', NULL, 'dummy_logo.jpg', NULL, NULL, NULL, NULL, 1, 0, NULL, 96, NULL, NULL, '2025-03-25 14:12:13', '2025-03-25 14:12:13', NULL),
(217, ' IMBIL', 'URIEL DARREN', '1234567899', '2024-257327', '$2y$10$BHqlHYDGoveHduvYGZux4.77KNOlUtE0Wwa2Ftm79jHeMv6VcQtSC', 'male', NULL, '2003-03-17', 'Douala', 'Akwa', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-26 21:55:29', '2025-03-26 21:55:29', '1970-01-01 06:00:00'),
(218, 'TANKOUA YANDO', ' ARTHUR', '1234567899', '2024-257328', '$2y$10$XftOGMy2CEzlZ5PTcInw8ekdlrj9KfP5y0Qs/8UCuo0YtXj9jn41u', 'male', NULL, '2007-03-17', 'Douala', 'Bonaberie', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-26 21:55:30', '2025-03-26 21:55:30', '1970-01-01 06:00:00'),
(219, 'NGO\'O BI POM ', 'FRANCK GABRIEL ROLAND', '1234567899', '2024-257329', '$2y$10$Z8JDdxOhBKGpjJoEv7jb6.5ZlTT3Gw8Q/L8MkcSShw.otZ7YvNC6W', 'Female', NULL, '2007-03-17', 'Douala', 'Bonaberie', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-26 21:55:31', '2025-03-26 21:55:31', '1970-01-01 06:00:00'),
(220, 'SOM MONG ', 'PAUL DAVID', '1234567899', '2024-257330', '$2y$10$xq1WMxXiRPiDDyj.Jw4wqOU.hdDMAX6qtiaLlZWic7GCpErkjcXuW', 'Male', NULL, '2001-03-17', 'Douala', 'Bonamoussadi', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-26 21:55:31', '2025-03-26 21:55:31', '1970-01-01 06:00:00'),
(221, 'NGA ONDOA ', 'MARIE JOSEPH SAMUEL', '1234567899', '2024-257331', '$2y$10$XYKQakL.XlnfHZYLMadwyu/yPpfhWoyM41HCLn2gy6ilAShGf/WxO', 'Female', NULL, '2006-03-17', 'Douala', 'yassa', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-26 21:55:32', '2025-03-26 21:55:32', '1970-01-01 06:00:00'),
(222, 'BINYOM MANGUELLE DZEAKOU NATH', ' DZEAKOU NATH', '1234567899', '2024-257332', '$2y$10$./Sb3FD2PCHddZImSanmX.0viRchXmx0xG6Zq9rVo9g.qXUstGhFO', 'Female', NULL, '2011-03-17', 'Douala', 'Nyalla', NULL, 0, 0, NULL, 73, NULL, NULL, '2025-03-26 21:55:33', '2025-03-26 21:55:33', '1970-01-01 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_status_for_next_cycles`
--

CREATE TABLE `user_status_for_next_cycles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `school_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `academic_calendars_school_id_foreign` (`school_id`),
  ADD KEY `academic_calendars_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `addons_feature_id_unique` (`feature_id`);

--
-- Indexes for table `addon_subscriptions`
--
ALTER TABLE `addon_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_subscriptions_school_id_foreign` (`school_id`),
  ADD KEY `addon_subscriptions_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_school_id_foreign` (`school_id`),
  ADD KEY `announcements_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `announcement_classes`
--
ALTER TABLE `announcement_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_columns` (`announcement_id`,`class_section_id`,`school_id`),
  ADD KEY `announcement_classes_school_id_foreign` (`school_id`),
  ADD KEY `announcement_classes_announcement_id_index` (`announcement_id`),
  ADD KEY `announcement_classes_class_section_id_index` (`class_section_id`),
  ADD KEY `announcement_classes_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_school_id_foreign` (`school_id`),
  ADD KEY `assignments_class_section_id_foreign` (`class_section_id`),
  ADD KEY `assignments_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `assignments_session_year_id_foreign` (`session_year_id`),
  ADD KEY `assignments_created_by_foreign` (`created_by`),
  ADD KEY `assignments_edited_by_foreign` (`edited_by`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_submissions_assignment_id_foreign` (`assignment_id`),
  ADD KEY `assignment_submissions_school_id_foreign` (`school_id`),
  ADD KEY `assignment_submissions_student_id_foreign` (`student_id`),
  ADD KEY `assignment_submissions_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_school_id_foreign` (`school_id`),
  ADD KEY `attendances_class_section_id_foreign` (`class_section_id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`),
  ADD KEY `attendances_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_school_id_foreign` (`school_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_school_id_foreign` (`school_id`),
  ADD KEY `classes_medium_id_foreign` (`medium_id`),
  ADD KEY `classes_shift_id_foreign` (`shift_id`),
  ADD KEY `classes_stream_id_foreign` (`stream_id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`class_id`,`section_id`,`medium_id`),
  ADD KEY `class_sections_school_id_foreign` (`school_id`),
  ADD KEY `class_sections_section_id_foreign` (`section_id`),
  ADD KEY `class_sections_medium_id_foreign` (`medium_id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`class_id`,`subject_id`,`virtual_semester_id`),
  ADD KEY `class_subjects_elective_subject_group_id_foreign` (`elective_subject_group_id`),
  ADD KEY `class_subjects_school_id_foreign` (`school_id`),
  ADD KEY `class_subjects_subject_id_foreign` (`subject_id`),
  ADD KEY `class_subjects_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`class_section_id`,`teacher_id`),
  ADD KEY `class_teachers_school_id_foreign` (`school_id`),
  ADD KEY `class_teachers_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `compulsory_fees`
--
ALTER TABLE `compulsory_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compulsory_fees_student_id_foreign` (`student_id`),
  ADD KEY `compulsory_fees_payment_transaction_id_foreign` (`payment_transaction_id`),
  ADD KEY `compulsory_fees_installment_id_foreign` (`installment_id`),
  ADD KEY `compulsory_fees_fees_paid_id_foreign` (`fees_paid_id`),
  ADD KEY `compulsory_fees_school_id_foreign` (`school_id`);

--
-- Indexes for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elective_subject_groups_school_id_foreign` (`school_id`),
  ADD KEY `elective_subject_groups_class_id_foreign` (`class_id`),
  ADD KEY `elective_subject_groups_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_school_id_foreign` (`school_id`),
  ADD KEY `exams_class_id_foreign` (`class_id`),
  ADD KEY `exams_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_marks_school_id_foreign` (`school_id`),
  ADD KEY `exam_marks_exam_timetable_id_foreign` (`exam_timetable_id`),
  ADD KEY `exam_marks_student_id_foreign` (`student_id`),
  ADD KEY `exam_marks_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `exam_marks_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_results_school_id_foreign` (`school_id`),
  ADD KEY `exam_results_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_results_class_section_id_foreign` (`class_section_id`),
  ADD KEY `exam_results_student_id_foreign` (`student_id`),
  ADD KEY `exam_results_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_timetables_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_timetables_school_id_foreign` (`school_id`),
  ADD KEY `exam_timetables_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `exam_timetables_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_unique_records` (`staff_id`,`month`,`year`),
  ADD KEY `expenses_school_id_foreign` (`school_id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`),
  ADD KEY `expenses_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_school_id_foreign` (`school_id`);

--
-- Indexes for table `extra_student_datas`
--
ALTER TABLE `extra_student_datas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_student_datas_form_field_id_foreign` (`form_field_id`),
  ADD KEY `extra_student_datas_school_id_foreign` (`school_id`),
  ADD KEY `extra_student_datas_student_id_foreign` (`student_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_class_id_foreign` (`class_id`),
  ADD KEY `fees_school_id_foreign` (`school_id`),
  ADD KEY `fees_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `fees_advance`
--
ALTER TABLE `fees_advance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_advance_compulsory_fee_id_foreign` (`compulsory_fee_id`),
  ADD KEY `fees_advance_student_id_foreign` (`student_id`),
  ADD KEY `fees_advance_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `fees_class_types`
--
ALTER TABLE `fees_class_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`class_id`,`fees_type_id`,`school_id`,`fees_id`),
  ADD KEY `fees_class_types_fees_id_foreign` (`fees_id`),
  ADD KEY `fees_class_types_fees_type_id_foreign` (`fees_type_id`),
  ADD KEY `fees_class_types_school_id_foreign` (`school_id`);

--
-- Indexes for table `fees_installments`
--
ALTER TABLE `fees_installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_installments_fees_id_foreign` (`fees_id`),
  ADD KEY `fees_installments_session_year_id_foreign` (`session_year_id`),
  ADD KEY `fees_installments_school_id_foreign` (`school_id`);

--
-- Indexes for table `fees_paids`
--
ALTER TABLE `fees_paids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`student_id`,`fees_id`,`school_id`),
  ADD KEY `fees_paids_fees_id_foreign` (`fees_id`),
  ADD KEY `fees_paids_school_id_foreign` (`school_id`);

--
-- Indexes for table `fees_types`
--
ALTER TABLE `fees_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_types_school_id_foreign` (`school_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_modal_type_modal_id_index` (`modal_type`,`modal_id`),
  ADD KEY `files_school_id_foreign` (`school_id`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`school_id`),
  ADD KEY `form_fields_school_id_foreign` (`school_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_school_id_foreign` (`school_id`);

--
-- Indexes for table `guidances`
--
ALTER TABLE `guidances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_school_id_foreign` (`school_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`),
  ADD KEY `leaves_school_id_foreign` (`school_id`),
  ADD KEY `leaves_leave_master_id_foreign` (`leave_master_id`);

--
-- Indexes for table `leave_details`
--
ALTER TABLE `leave_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_details_leave_id_foreign` (`leave_id`),
  ADD KEY `leave_details_school_id_foreign` (`school_id`);

--
-- Indexes for table `leave_masters`
--
ALTER TABLE `leave_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_masters_session_year_id_foreign` (`session_year_id`),
  ADD KEY `leave_masters_school_id_foreign` (`school_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_school_id_foreign` (`school_id`),
  ADD KEY `lessons_class_section_id_foreign` (`class_section_id`),
  ADD KEY `lessons_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_topics_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_topics_school_id_foreign` (`school_id`);

--
-- Indexes for table `mediums`
--
ALTER TABLE `mediums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mediums_school_id_foreign` (`school_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exams_school_id_foreign` (`school_id`),
  ADD KEY `online_exams_class_section_id_foreign` (`class_section_id`),
  ADD KEY `online_exams_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `online_exams_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_questions_school_id_foreign` (`school_id`),
  ADD KEY `online_exam_questions_class_section_id_foreign` (`class_section_id`),
  ADD KEY `online_exam_questions_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `online_exam_questions_last_edited_by_foreign` (`last_edited_by`);

--
-- Indexes for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_choices_school_id_foreign` (`school_id`),
  ADD KEY `online_exam_question_choices_online_exam_id_foreign` (`online_exam_id`),
  ADD KEY `online_exam_question_choices_question_id_foreign` (`question_id`);

--
-- Indexes for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_options_question_id_foreign` (`question_id`),
  ADD KEY `online_exam_question_options_school_id_foreign` (`school_id`);

--
-- Indexes for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_student_answers_school_id_foreign` (`school_id`),
  ADD KEY `online_exam_student_answers_student_id_foreign` (`student_id`),
  ADD KEY `online_exam_student_answers_online_exam_id_foreign` (`online_exam_id`),
  ADD KEY `online_exam_student_answers_question_id_foreign` (`question_id`),
  ADD KEY `online_exam_student_answers_option_id_foreign` (`option_id`);

--
-- Indexes for table `optional_fees`
--
ALTER TABLE `optional_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `optional_fees_student_id_foreign` (`student_id`),
  ADD KEY `optional_fees_class_id_foreign` (`class_id`),
  ADD KEY `optional_fees_payment_transaction_id_foreign` (`payment_transaction_id`),
  ADD KEY `optional_fees_fees_class_id_foreign` (`fees_class_id`),
  ADD KEY `optional_fees_fees_paid_id_foreign` (`fees_paid_id`),
  ADD KEY `optional_fees_school_id_foreign` (`school_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_features`
--
ALTER TABLE `package_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`package_id`,`feature_id`),
  ADD KEY `package_features_package_id_index` (`package_id`),
  ADD KEY `package_features_feature_id_index` (`feature_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_configurations`
--
ALTER TABLE `payment_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_configurations_school_id_foreign` (`school_id`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_transactions_user_id_foreign` (`user_id`),
  ADD KEY `payment_transactions_school_id_foreign` (`school_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `promote_students`
--
ALTER TABLE `promote_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_columns` (`student_id`,`class_section_id`,`session_year_id`),
  ADD KEY `promote_students_school_id_foreign` (`school_id`),
  ADD KEY `promote_students_class_section_id_foreign` (`class_section_id`),
  ADD KEY `promote_students_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_school_id_unique` (`name`,`guard_name`,`school_id`),
  ADD KEY `roles_school_id_foreign` (`school_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schools_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `school_settings`
--
ALTER TABLE `school_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_settings_name_school_id_unique` (`name`,`school_id`),
  ADD KEY `school_settings_school_id_foreign` (`school_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_school_id_foreign` (`school_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semesters_school_id_foreign` (`school_id`);

--
-- Indexes for table `session_years`
--
ALTER TABLE `session_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_years_name_school_id_unique` (`name`,`school_id`),
  ADD KEY `session_years_school_id_foreign` (`school_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shifts_school_id_foreign` (`school_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_school_id_foreign` (`school_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staffs_user_id_foreign` (`user_id`);

--
-- Indexes for table `staff_support_schools`
--
ALTER TABLE `staff_support_schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_school` (`user_id`,`school_id`),
  ADD KEY `staff_support_schools_school_id_foreign` (`school_id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `streams_school_id_foreign` (`school_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_school_id_foreign` (`school_id`),
  ADD KEY `students_user_id_foreign` (`user_id`),
  ADD KEY `students_class_section_id_foreign` (`class_section_id`),
  ADD KEY `students_guardian_id_foreign` (`guardian_id`),
  ADD KEY `students_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_online_exam_statuses_school_id_foreign` (`school_id`),
  ADD KEY `student_online_exam_statuses_student_id_foreign` (`student_id`),
  ADD KEY `student_online_exam_statuses_online_exam_id_foreign` (`online_exam_id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_subjects_school_id_foreign` (`school_id`),
  ADD KEY `student_subjects_student_id_foreign` (`student_id`),
  ADD KEY `student_subjects_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `student_subjects_class_section_id_foreign` (`class_section_id`),
  ADD KEY `student_subjects_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_school_id_foreign` (`school_id`),
  ADD KEY `subjects_medium_id_foreign` (`medium_id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`class_section_id`,`class_subject_id`,`teacher_id`),
  ADD KEY `subject_teachers_school_id_foreign` (`school_id`),
  ADD KEY `subject_teachers_subject_id_foreign` (`subject_id`),
  ADD KEY `subject_teachers_teacher_id_foreign` (`teacher_id`),
  ADD KEY `subject_teachers_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_package_id_foreign` (`package_id`),
  ADD KEY `subscriptions_school_id_foreign` (`school_id`);

--
-- Indexes for table `subscription_bills`
--
ALTER TABLE `subscription_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_bill` (`subscription_id`,`school_id`),
  ADD KEY `subscription_bills_school_id_foreign` (`school_id`),
  ADD KEY `subscription_bills_payment_transaction_id_foreign` (`payment_transaction_id`);

--
-- Indexes for table `subscription_features`
--
ALTER TABLE `subscription_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`subscription_id`,`feature_id`),
  ADD KEY `subscription_features_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_name_unique` (`name`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetables_subject_teacher_id_foreign` (`subject_teacher_id`),
  ADD KEY `timetables_school_id_foreign` (`school_id`),
  ADD KEY `timetables_class_section_id_foreign` (`class_section_id`),
  ADD KEY `timetables_subject_id_foreign` (`subject_id`),
  ADD KEY `timetables_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_school_id_foreign` (`school_id`);

--
-- Indexes for table `user_status_for_next_cycles`
--
ALTER TABLE `user_status_for_next_cycles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_status_for_next_cycles_user_id_unique` (`user_id`),
  ADD KEY `user_status_for_next_cycles_school_id_foreign` (`school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `addon_subscriptions`
--
ALTER TABLE `addon_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `announcement_classes`
--
ALTER TABLE `announcement_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `class_teachers`
--
ALTER TABLE `class_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `compulsory_fees`
--
ALTER TABLE `compulsory_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `extra_student_datas`
--
ALTER TABLE `extra_student_datas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `fees_advance`
--
ALTER TABLE `fees_advance`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_class_types`
--
ALTER TABLE `fees_class_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fees_installments`
--
ALTER TABLE `fees_installments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fees_paids`
--
ALTER TABLE `fees_paids`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fees_types`
--
ALTER TABLE `fees_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `guidances`
--
ALTER TABLE `guidances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_details`
--
ALTER TABLE `leave_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_masters`
--
ALTER TABLE `leave_masters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mediums`
--
ALTER TABLE `mediums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `online_exams`
--
ALTER TABLE `online_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `optional_fees`
--
ALTER TABLE `optional_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package_features`
--
ALTER TABLE `package_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `payment_configurations`
--
ALTER TABLE `payment_configurations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `promote_students`
--
ALTER TABLE `promote_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `school_settings`
--
ALTER TABLE `school_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1379;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `session_years`
--
ALTER TABLE `session_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `staff_support_schools`
--
ALTER TABLE `staff_support_schools`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subscription_bills`
--
ALTER TABLE `subscription_bills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subscription_features`
--
ALTER TABLE `subscription_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `user_status_for_next_cycles`
--
ALTER TABLE `user_status_for_next_cycles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD CONSTRAINT `academic_calendars_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `academic_calendars_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `addons`
--
ALTER TABLE `addons`
  ADD CONSTRAINT `addons_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`);

--
-- Constraints for table `addon_subscriptions`
--
ALTER TABLE `addon_subscriptions`
  ADD CONSTRAINT `addon_subscriptions_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_subscriptions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `announcement_classes`
--
ALTER TABLE `announcement_classes`
  ADD CONSTRAINT `announcement_classes_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_classes_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `announcement_classes_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `announcement_classes_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `assignments_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `assignments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `assignments_edited_by_foreign` FOREIGN KEY (`edited_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `assignments_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD CONSTRAINT `assignment_submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `assignment_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `attendances_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`),
  ADD CONSTRAINT `classes_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classes_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`),
  ADD CONSTRAINT `classes_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`);

--
-- Constraints for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD CONSTRAINT `class_sections_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_sections_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`),
  ADD CONSTRAINT `class_sections_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_sections_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD CONSTRAINT `class_subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_subjects_elective_subject_group_id_foreign` FOREIGN KEY (`elective_subject_group_id`) REFERENCES `elective_subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_subjects_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `class_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD CONSTRAINT `class_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `class_teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `compulsory_fees`
--
ALTER TABLE `compulsory_fees`
  ADD CONSTRAINT `compulsory_fees_fees_paid_id_foreign` FOREIGN KEY (`fees_paid_id`) REFERENCES `fees_paids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compulsory_fees_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `fees_installments` (`id`),
  ADD CONSTRAINT `compulsory_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compulsory_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compulsory_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD CONSTRAINT `elective_subject_groups_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `elective_subject_groups_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elective_subject_groups_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `exams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD CONSTRAINT `exam_marks_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `exam_marks_exam_timetable_id_foreign` FOREIGN KEY (`exam_timetable_id`) REFERENCES `exam_timetables` (`id`),
  ADD CONSTRAINT `exam_marks_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `exam_marks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `exam_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `exam_results_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `exam_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD CONSTRAINT `exam_timetables_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `exam_timetables_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_timetables_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_timetables_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `expenses_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `expenses_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`);

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `extra_student_datas`
--
ALTER TABLE `extra_student_datas`
  ADD CONSTRAINT `extra_student_datas_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `extra_student_datas_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `extra_student_datas_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_advance`
--
ALTER TABLE `fees_advance`
  ADD CONSTRAINT `fees_advance_compulsory_fee_id_foreign` FOREIGN KEY (`compulsory_fee_id`) REFERENCES `compulsory_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_advance_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_advance_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_class_types`
--
ALTER TABLE `fees_class_types`
  ADD CONSTRAINT `fees_class_types_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_class_types_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_class_types_fees_type_id_foreign` FOREIGN KEY (`fees_type_id`) REFERENCES `fees_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_class_types_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_installments`
--
ALTER TABLE `fees_installments`
  ADD CONSTRAINT `fees_installments_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_installments_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_installments_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_paids`
--
ALTER TABLE `fees_paids`
  ADD CONSTRAINT `fees_paids_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_paids_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_paids_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_types`
--
ALTER TABLE `fees_types`
  ADD CONSTRAINT `fees_types_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_leave_master_id_foreign` FOREIGN KEY (`leave_master_id`) REFERENCES `leave_masters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_details`
--
ALTER TABLE `leave_details`
  ADD CONSTRAINT `leave_details_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_details_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_masters`
--
ALTER TABLE `leave_masters`
  ADD CONSTRAINT `leave_masters_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_masters_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `lessons_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `lessons_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD CONSTRAINT `lesson_topics_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_topics_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mediums`
--
ALTER TABLE `mediums`
  ADD CONSTRAINT `mediums_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD CONSTRAINT `online_exams_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `online_exams_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `online_exams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD CONSTRAINT `online_exam_questions_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `online_exam_questions_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `online_exam_questions_last_edited_by_foreign` FOREIGN KEY (`last_edited_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `online_exam_questions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD CONSTRAINT `online_exam_question_choices_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`),
  ADD CONSTRAINT `online_exam_question_choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`),
  ADD CONSTRAINT `online_exam_question_choices_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD CONSTRAINT `online_exam_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_question_options_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD CONSTRAINT `online_exam_student_answers_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`),
  ADD CONSTRAINT `online_exam_student_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `online_exam_question_options` (`id`),
  ADD CONSTRAINT `online_exam_student_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_question_choices` (`id`),
  ADD CONSTRAINT `online_exam_student_answers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `optional_fees`
--
ALTER TABLE `optional_fees`
  ADD CONSTRAINT `optional_fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_fees_class_id_foreign` FOREIGN KEY (`fees_class_id`) REFERENCES `fees_class_types` (`id`),
  ADD CONSTRAINT `optional_fees_fees_paid_id_foreign` FOREIGN KEY (`fees_paid_id`) REFERENCES `fees_paids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_features`
--
ALTER TABLE `package_features`
  ADD CONSTRAINT `package_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`),
  ADD CONSTRAINT `package_features_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Constraints for table `payment_configurations`
--
ALTER TABLE `payment_configurations`
  ADD CONSTRAINT `payment_configurations_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD CONSTRAINT `payment_transactions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promote_students`
--
ALTER TABLE `promote_students`
  ADD CONSTRAINT `promote_students_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `promote_students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promote_students_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `promote_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schools`
--
ALTER TABLE `schools`
  ADD CONSTRAINT `schools_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `school_settings`
--
ALTER TABLE `school_settings`
  ADD CONSTRAINT `school_settings_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `semesters_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `session_years`
--
ALTER TABLE `session_years`
  ADD CONSTRAINT `session_years_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `staff_support_schools`
--
ALTER TABLE `staff_support_schools`
  ADD CONSTRAINT `staff_support_schools_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_support_schools_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `streams`
--
ALTER TABLE `streams`
  ADD CONSTRAINT `streams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `students_guardian_id_foreign` FOREIGN KEY (`guardian_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD CONSTRAINT `student_online_exam_statuses_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`),
  ADD CONSTRAINT `student_online_exam_statuses_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_online_exam_statuses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD CONSTRAINT `student_subjects_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `student_subjects_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `student_subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subjects_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `student_subjects_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`),
  ADD CONSTRAINT `subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD CONSTRAINT `subject_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `subject_teachers_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `subject_teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_teachers_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `subject_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  ADD CONSTRAINT `subscriptions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_bills`
--
ALTER TABLE `subscription_bills`
  ADD CONSTRAINT `subscription_bills_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`),
  ADD CONSTRAINT `subscription_bills_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscription_bills_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Constraints for table `subscription_features`
--
ALTER TABLE `subscription_features`
  ADD CONSTRAINT `subscription_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`),
  ADD CONSTRAINT `subscription_features_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Constraints for table `timetables`
--
ALTER TABLE `timetables`
  ADD CONSTRAINT `timetables_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `timetables_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetables_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `timetables_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `timetables_subject_teacher_id_foreign` FOREIGN KEY (`subject_teacher_id`) REFERENCES `subject_teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_status_for_next_cycles`
--
ALTER TABLE `user_status_for_next_cycles`
  ADD CONSTRAINT `user_status_for_next_cycles_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_status_for_next_cycles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
