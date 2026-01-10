-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2026 at 02:16 PM
-- Server version: 8.4.6-6
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newyear`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('super_admin','support') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'super_admin',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'UTC',
  `language` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password_hash`, `role`, `last_login`, `created_at`, `name`, `phone`, `avatar_url`, `timezone`, `language`) VALUES
(1, 'harrymailbox11@gmail.com', '$2b$10$04mau1Vw5w3aL/2w2K5L9OwweZtALHUEJ1vfJO84cSNbadWUaFCJO', 'super_admin', '2026-01-10 10:42:51', '2025-12-28 23:15:37', 'Harry', '+919602003790', '/uploads/avatars/avatar_1_1767964915454_Gemini_Generated_Image_1e70xm1e70xm1e70_(1).png', 'IST', 'en'),
(2, 'harshdeepkumaryadav@gmail.com', '$2b$10$OM8oXp1ypiLnSsNdrMgczOtrWAd9kuCNQxSDPLUVQdXv34k3L.lRi', 'super_admin', '2026-01-09 15:19:08', '2025-12-28 23:55:43', 'Harshdeep', NULL, '/uploads/avatars/avatar_2_1767971969765_ChatGPT_Image_Jan_7,_2026,_01_56_13_AM.png', 'UTC', 'en'),
(4, 'admin@gmail.com', 'admin123', 'super_admin', NULL, '2026-01-10 08:06:42', NULL, NULL, NULL, 'UTC', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

CREATE TABLE `admin_activity_log` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `action_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `action_description` text COLLATE utf8mb4_general_ci,
  `entity_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_activity_log`
--

INSERT INTO `admin_activity_log` (`id`, `admin_id`, `action_type`, `action_description`, `entity_type`, `entity_id`, `ip_address`, `created_at`) VALUES
(1, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:05:25'),
(2, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:05:26'),
(3, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:05:33'),
(4, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:06:20'),
(5, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:06:21'),
(6, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:06:21'),
(7, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:06:30'),
(8, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:06:36'),
(9, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:06:41'),
(10, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 11:33:57'),
(11, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:33:57'),
(12, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:33:59'),
(13, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:34:00'),
(14, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:34:00'),
(15, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 11:53:48'),
(16, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:53:48'),
(17, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:53:50'),
(18, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:25'),
(19, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:25'),
(20, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:26'),
(21, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:40'),
(22, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:40'),
(23, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:48'),
(24, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:48'),
(25, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 11:58:49'),
(26, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:01:03'),
(27, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 12:04:11'),
(28, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:04:11'),
(29, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:04:11'),
(30, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 12:09:09'),
(31, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:09:09'),
(32, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:17:07'),
(33, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 12:21:22'),
(34, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:21:22'),
(35, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 12:21:28'),
(36, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:21:28'),
(37, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 12:26:05'),
(38, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:26:05'),
(39, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 12:35:29'),
(40, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 12:35:29'),
(41, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:02:09'),
(42, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:02:09'),
(43, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:02:42'),
(44, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:02:42'),
(45, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:06:01'),
(46, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:06:01'),
(47, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:09:48'),
(48, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:09:48'),
(49, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:14:24'),
(50, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:14:24'),
(51, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:17:19'),
(52, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:17:19'),
(53, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:21:47'),
(54, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:21:47'),
(55, 1, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 13:21:55'),
(56, 1, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 13:21:55'),
(57, 1, 'csv_import', 'Imported 0 leads from CSV', NULL, NULL, '49.43.33.216', '2026-01-09 13:38:33'),
(58, 1, 'csv_import', 'Imported 0 leads from CSV', NULL, NULL, '49.43.33.216', '2026-01-09 13:39:03'),
(59, 1, 'csv_import', 'Imported 5 leads from CSV', NULL, NULL, '49.43.33.216', '2026-01-09 13:47:46'),
(60, 1, 'csv_import', 'Imported 5 leads from CSV', NULL, NULL, '49.43.33.216', '2026-01-09 13:50:59'),
(61, 2, 'update_avatar', 'Uploaded new profile picture', NULL, NULL, '49.43.33.216', '2026-01-09 15:19:29'),
(62, 2, 'update_profile', 'Updated profile information', NULL, NULL, '49.43.33.216', '2026-01-09 15:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_logs`
--

CREATE TABLE `admin_activity_logs` (
  `id` int NOT NULL,
  `admin_id` int DEFAULT NULL,
  `action_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `action_description` text COLLATE utf8mb4_general_ci,
  `entity_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_activity_logs`
--

INSERT INTO `admin_activity_logs` (`id`, `admin_id`, `action_type`, `action_description`, `entity_type`, `entity_id`, `created_at`, `ip_address`) VALUES
(1, 1, 'lead_assignment', 'Test: Assigned lead to Harry', 'customer', 1, '2026-01-05 15:33:43', NULL),
(2, 1, 'lead_assignment', 'Test: Assigned lead to Harry', 'customer', 1, '2026-01-05 16:05:01', NULL),
(3, 1, 'lead_assignment', 'Test: Assigned lead to Harry', 'customer', 1, '2026-01-05 16:21:30', NULL),
(4, 1, 'lead_update', 'Updated lead: stage to \'proposal_sent\'', 'customer', 32, '2026-01-05 16:29:08', NULL),
(5, 1, 'lead_assignment', 'Assigned lead to Harry', 'customer', 17, '2026-01-05 16:29:09', NULL),
(6, 1, 'lead_update', 'Updated lead: owner to \'Harry\'', 'customer', 17, '2026-01-05 16:29:09', NULL),
(7, 1, 'lead_update', 'Updated lead: score to \'warm\'', 'customer', 17, '2026-01-05 16:29:12', NULL),
(8, 1, 'order_update', 'Updated order status to \'new_lead\' via Kanban', 'order', 6, '2026-01-05 16:29:29', NULL),
(9, 1, 'order_update', 'Updated order status to \'new_lead\' via Kanban', 'order', 5, '2026-01-05 16:29:32', NULL),
(10, 1, 'order_update', 'Updated order status to \'payment_failed\' via Kanban', 'order', 3, '2026-01-05 16:29:38', NULL),
(11, 1, 'order_update', 'Updated order #19 (Customer: Debug User) to \'new_lead\' via Kanban', 'order', 19, '2026-01-05 16:33:49', NULL),
(12, 1, 'order_update', 'Updated order #9 (Customer: Harish Kumar) to \'initiated\' via Kanban', 'order', 9, '2026-01-05 16:34:05', NULL),
(13, 1, 'lead_update', 'Updated lead \"test form\": stage to \'contacted\'', 'customer', 32, '2026-01-05 16:35:01', NULL),
(14, 1, 'interaction_created', 'Added system_event: Updated stage to contacted', 'customer', 32, '2026-01-05 16:35:02', NULL),
(15, 1, 'order_update', 'Updated order #7 (Customer: Harish Kumar) to \'payment_failed\' via Kanban', 'order', 7, '2026-01-05 16:41:30', NULL),
(16, 1, 'order_update', 'Updated order #17 (Customer: Harish Kumar) to \'new_lead\' via Kanban', 'order', 17, '2026-01-05 16:41:31', NULL),
(17, 1, 'page_update', 'Updated landing page \"AI Launch System (Dummy)\"', 'landing_page', 2, '2026-01-05 17:31:22', NULL),
(18, 1, 'page_update', 'Updated landing page \"AI Launch System (Dummy)\"', 'landing_page', 2, '2026-01-05 17:31:40', NULL),
(19, 1, 'page_update', 'Updated landing page \"AI Launch System (Dummy)\"', 'landing_page', 2, '2026-01-05 17:32:41', NULL),
(20, 1, 'page_update', 'Updated landing page \"AI Launch System (Dummy)\"', 'landing_page', 2, '2026-01-05 17:42:18', NULL),
(21, 1, 'page_update', 'Updated landing page \"New Year Launch (5k)\"', 'landing_page', 3, '2026-01-05 18:47:44', NULL),
(22, 1, 'page_duplicate', 'Duplicated page \"AI Launch System (Dummy)\" as \"Copy of AI Launch System (Dummy)\"', 'landing_page', 5, '2026-01-05 19:41:23', NULL),
(23, 1, 'page_duplicate', 'Duplicated page \"Copy of AI Launch System (Dummy)\" as \"Copy of Copy of AI Launch System (Dummy)\"', 'landing_page', 6, '2026-01-05 19:41:37', NULL),
(24, 1, 'page_delete', 'Deleted landing page #6', 'landing_page', 6, '2026-01-05 19:41:42', NULL),
(25, 1, 'page_update', 'Updated landing page \"Copy of AI Launch System (Dummy)\"', 'landing_page', 5, '2026-01-05 19:42:04', NULL),
(26, 1, 'page_update', 'Updated landing page \"Copy of AI Launch System (Dummy)\"', 'landing_page', 5, '2026-01-05 20:04:12', NULL),
(27, 1, 'page_update', 'Updated landing page \"Lifetime Agency (12k)\"', 'landing_page', 4, '2026-01-05 22:12:51', NULL),
(28, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to 9876543213', 'customer', 38, '2026-01-05 22:20:30', NULL),
(29, 1, 'lead_update', 'Updated lead \"finaltestt\": score to \'hot\'', 'customer', 39, '2026-01-05 22:21:37', NULL),
(30, 1, 'lead_assignment', 'Assigned lead to Harry', 'customer', 37, '2026-01-05 22:21:47', NULL),
(31, 1, 'lead_update', 'Updated lead \"Charlie Hustle\": owner to \'Harry\'', 'customer', 37, '2026-01-05 22:21:47', NULL),
(32, 1, 'page_duplicate', 'Duplicated page \"New Year Launch (5k)\" as \"Copy of New Year Launch (5k)\"', 'landing_page', 7, '2026-01-05 22:24:33', NULL),
(33, 1, 'page_delete', 'Deleted landing page #7', 'landing_page', 7, '2026-01-05 22:24:52', NULL),
(34, 1, 'user_created', 'Created new team member: test (test@support.com)', 'admin', NULL, '2026-01-05 22:27:55', NULL),
(35, 1, 'page_update', 'Updated landing page \"New Year Launch (5k)\"', 'landing_page', 3, '2026-01-06 07:14:19', NULL),
(36, 2, 'page_duplicate', 'Duplicated page \"New Year Launch (5k)\" as \"Copy of New Year Launch (5k)\"', 'landing_page', 8, '2026-01-06 07:41:44', NULL),
(37, 2, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-06 07:43:16', NULL),
(38, 2, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-06 07:43:41', NULL),
(39, 2, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-06 07:44:25', NULL),
(40, 2, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-06 07:44:34', NULL),
(41, 2, 'lead_update', 'Updated lead \"Ashraf Khan\": score to \'warm\'', 'customer', 57, '2026-01-07 08:09:54', NULL),
(42, 2, 'deal_create', 'Created manual deal: Rs. 5000 for Ashraf Khan', 'order', 30, '2026-01-07 08:27:12', NULL),
(43, 2, 'proposal_create', 'Created Proposal: Ecom website (Rs. 5000) for Ashraf Khan', 'order', 31, '2026-01-07 08:29:05', NULL),
(44, 2, 'page_update', 'Updated landing page \"New Year Launch (5k)\"', 'landing_page', 3, '2026-01-07 11:28:10', NULL),
(45, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-07 11:32:39', NULL),
(46, 1, 'page_update', 'Updated landing page \"Lifetime Agency (12k)\"', 'landing_page', 4, '2026-01-07 11:33:01', NULL),
(47, 1, 'page_delete', 'Deleted landing page #5', 'landing_page', 5, '2026-01-07 11:33:25', NULL),
(48, 2, 'lead_update', 'Updated lead \"Ashraf Khan\": stage to \'lost\'', 'customer', 57, '2026-01-07 17:36:22', NULL),
(49, 2, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 57, '2026-01-07 17:36:22', NULL),
(50, 2, 'interaction_created', 'Added internal_note: He is a not interested, he was joking - (bad lead)', 'customer', 57, '2026-01-07 17:36:57', NULL),
(51, 2, 'lead_update', 'Updated lead \"Ashraf Khan\": score to \'cold\'', 'customer', 57, '2026-01-07 17:40:22', NULL),
(52, 2, 'interaction_created', 'Added internal_note: Aman didn\'t picked the call - Need followup\n', 'customer', 58, '2026-01-07 17:41:33', NULL),
(53, 2, 'task_create', 'Created task \"Call him and follow-up tomorrow\" for Aman Chaurasia', 'task', 9, '2026-01-07 17:42:21', NULL),
(54, 2, 'interaction_created', 'Added internal_note: Not interested - he can\'t remember he filled form.', 'customer', 59, '2026-01-07 17:44:29', NULL),
(55, 2, 'lead_update', 'Updated lead \"Karan Singh\": stage to \'lost\'', 'customer', 59, '2026-01-07 17:44:53', NULL),
(56, 2, 'interaction_created', 'Added internal_note: He want\'s a store - have send the Demo sites - Fol...', 'customer', 60, '2026-01-07 17:47:33', NULL),
(57, 2, 'task_create', 'Created task \"Followup required tomorrow\" for Ajit Kumar', 'task', 10, '2026-01-07 17:48:53', NULL),
(58, 2, 'lead_update', 'Updated lead \"Ajit Kumar\": stage to \'proposal_sent\'', 'customer', 60, '2026-01-07 17:49:08', NULL),
(59, 2, 'deal_update', 'Updated deal #31: status to \'initiated\'', 'order', 31, '2026-01-07 17:49:23', NULL),
(60, 2, 'interaction_created', 'Added system_event: Updated Deal #31 status to initiated', 'customer', 57, '2026-01-07 17:49:23', NULL),
(61, 2, 'deal_update', 'Updated deal #31: status to \'paid\'', 'order', 31, '2026-01-07 17:49:38', NULL),
(62, 2, 'interaction_created', 'Added system_event: Updated Deal #31 status to paid', 'customer', 57, '2026-01-07 17:49:38', NULL),
(63, 2, 'deal_update', 'Updated deal #31: status to \'initiated\'', 'order', 31, '2026-01-07 17:49:39', NULL),
(64, 2, 'interaction_created', 'Added system_event: Updated Deal #31 status to initiated', 'customer', 57, '2026-01-07 17:49:39', NULL),
(65, 2, 'interaction_created', 'Added internal_note: \"subah mai phone karege sir\" - follow up required\n', 'customer', 61, '2026-01-07 17:53:47', NULL),
(66, 2, 'task_create', 'Created task \"sent the Demo | Follow-up required\" for Sunil Manjhi', 'task', 11, '2026-01-07 17:54:16', NULL),
(67, 2, 'interaction_created', 'Added internal_note: Sent him the Demo stores.\n', 'customer', 61, '2026-01-07 17:54:31', NULL),
(68, 2, 'interaction_created', 'Added internal_note: \"abhi baat nahi ker sakta sir suabh kerna\" - Demo ...', 'customer', 62, '2026-01-07 18:00:40', NULL),
(69, 2, 'task_create', 'Created task \"Followup required\" for Shashi Chandel Crazyheart', 'task', 12, '2026-01-07 18:00:54', NULL),
(70, 2, 'lead_update', 'Updated lead \"Shashi Chandel Crazyheart\": stage to \'proposal_sent\'', 'customer', 62, '2026-01-07 18:01:35', NULL),
(71, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": stage to \'proposal_sent\'', 'customer', 61, '2026-01-07 18:01:38', NULL),
(72, 2, 'interaction_created', 'Added internal_note: She didn\'t picked up, followup required', 'customer', 63, '2026-01-07 18:04:55', NULL),
(73, 2, 'task_create', 'Created task \"Didn\'t pickedup follow up required\" for Gorthan Singh', 'task', 13, '2026-01-07 18:05:12', NULL),
(74, 2, 'interaction_created', 'Added internal_note: Not interested', 'customer', 64, '2026-01-07 18:06:24', NULL),
(75, 2, 'lead_update', 'Updated lead \"Golu Yadav Mukhiya\": stage to \'lost\'', 'customer', 64, '2026-01-07 18:07:56', NULL),
(76, 1, 'interaction_created', 'Added internal_note: test', 'customer', 51, '2026-01-07 20:51:11', NULL),
(77, 1, 'task_update', 'Updated task #9: status to \'done\'', 'task', 9, '2026-01-07 21:00:03', NULL),
(78, 1, 'task_update', 'Updated task #9: status to \'open\'', 'task', 9, '2026-01-07 21:00:06', NULL),
(79, 1, 'task_update', 'Updated task #9: status to \'done\'', 'task', 9, '2026-01-07 21:00:07', NULL),
(80, 1, 'task_update', 'Updated task #9: status to \'open\'', 'task', 9, '2026-01-07 21:00:17', NULL),
(81, 1, 'task_update', 'Updated task #13: priority to \'high\'', 'task', 13, '2026-01-07 21:10:34', NULL),
(82, 1, 'task_update', 'Updated task #13: priority to \'high\'', 'task', 13, '2026-01-07 21:10:37', NULL),
(83, 1, 'task_update', 'Updated task #13: priority to \'medium\'', 'task', 13, '2026-01-07 21:10:40', NULL),
(84, 1, 'task_update', 'Updated task #13: status to \'done\'', 'task', 13, '2026-01-07 21:11:13', NULL),
(85, 1, 'task_update', 'Updated task #13: status to \'open\'', 'task', 13, '2026-01-07 21:11:14', NULL),
(86, 1, 'task_update', 'Updated task #13: priority to \'high\'', 'task', 13, '2026-01-07 21:17:15', NULL),
(87, 1, 'task_update', 'Updated task #13: priority to \'medium\'', 'task', 13, '2026-01-07 21:17:17', NULL),
(88, 1, 'task_delete', 'Deleted task \"Setup Server for Alice\"', 'task', 14, '2026-01-07 21:32:56', NULL),
(89, 1, 'task_delete', 'Deleted task \"Follow up with Charlie\"', 'task', 15, '2026-01-07 21:33:01', NULL),
(90, 1, 'task_create', 'Created task \"test\" for Shashi Chandel Crazyheart', 'task', 16, '2026-01-07 21:43:32', NULL),
(91, 1, 'task_delete', 'Deleted task \"test\"', 'task', 16, '2026-01-07 21:44:03', NULL),
(92, 1, 'task_create', 'Created task \"kaisa ba\" for Sameer Ahmed', 'task', 17, '2026-01-07 21:46:14', NULL),
(93, 1, 'task_update', 'Updated task #17: status to \'in_progress\'', 'task', 17, '2026-01-07 21:46:35', NULL),
(94, 1, 'task_update', 'Updated task #17: status to \'in_progress\'', 'task', 17, '2026-01-07 21:46:42', NULL),
(95, 1, 'task_update', 'Updated task #17: priority to \'high\'', 'task', 17, '2026-01-07 21:46:46', NULL),
(96, 1, 'task_delete', 'Deleted task \"kaisa ba\"', 'task', 17, '2026-01-07 21:46:55', NULL),
(97, 1, 'task_create', 'Created task \"test task\" for Sameer Ahmed', 'task', 18, '2026-01-07 21:47:46', NULL),
(98, 1, 'task_update', 'Updated task #13: status to \'in_progress\' ', 'task', 13, '2026-01-07 21:56:12', NULL),
(99, 1, 'task_update', 'Updated task #13: status to \'done\' ', 'task', 13, '2026-01-07 21:56:14', NULL),
(100, 1, 'task_update', 'Updated task #13: status to \'open\' ', 'task', 13, '2026-01-07 21:56:15', NULL),
(101, 1, 'task_create', 'Created task \"test2\" for Sameer Ahmed', 'task', 19, '2026-01-07 21:57:00', NULL),
(102, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 65, '2026-01-07 21:58:32', NULL),
(103, 1, 'lead_update', 'Updated lead \"Sameer Ahmed\": owner to \'Harshdeep\'', 'customer', 65, '2026-01-07 21:58:32', NULL),
(104, 1, 'task_update', 'Updated task #13: status to \'in_progress\' ', 'task', 13, '2026-01-07 22:19:51', NULL),
(105, 1, 'task_update', 'Updated task #13: status to \'open\' ', 'task', 13, '2026-01-07 22:19:58', NULL),
(106, 1, 'task_update', 'Updated task #13: status to \'in_progress\' ', 'task', 13, '2026-01-07 22:21:24', NULL),
(107, 1, 'task_update', 'Updated task #13: status to \'open\' ', 'task', 13, '2026-01-07 22:21:36', NULL),
(108, 1, 'task_update', 'Updated task #13: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:38:03\' ', 'task', 13, '2026-01-07 22:38:03', NULL),
(109, 1, 'task_update', 'Updated task #13: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:38:08\' ', 'task', 13, '2026-01-07 22:38:08', NULL),
(110, 1, 'task_update', 'Updated task #13: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:38:17\' ', 'task', 13, '2026-01-07 22:38:17', NULL),
(111, 1, 'task_update', 'Updated task #12: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:38:20\' ', 'task', 12, '2026-01-07 22:38:20', NULL),
(112, 1, 'task_update', 'Updated task #12: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:38:26\' ', 'task', 12, '2026-01-07 22:38:26', NULL),
(113, 1, 'task_update', 'Updated task #13: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:38:28\' ', 'task', 13, '2026-01-07 22:38:28', NULL),
(114, 1, 'task_update', 'Updated task #13: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:43:22\' ', 'task', 13, '2026-01-07 22:43:22', NULL),
(115, 1, 'task_update', 'Updated task #13: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 22:43:28\' ', 'task', 13, '2026-01-07 22:43:28', NULL),
(116, 1, 'task_delete', 'Deleted task \"test task\"', 'task', 18, '2026-01-07 22:43:52', NULL),
(117, 1, 'task_delete', 'Deleted task \"test2\"', 'task', 19, '2026-01-07 22:43:55', NULL),
(118, 2, 'task_update', 'Updated task #12: status to \'in_progress\', status_changed_by to \'2\', status_changed_at to \'2026-01-07 23:22:53\' ', 'task', 12, '2026-01-07 23:22:53', NULL),
(119, 2, 'task_update', 'Updated task #12: status to \'open\', status_changed_by to \'2\', status_changed_at to \'2026-01-07 23:22:59\' ', 'task', 12, '2026-01-07 23:22:59', NULL),
(120, 1, 'page_delete', 'Deleted landing page #2', 'landing_page', 2, '2026-01-07 23:26:32', NULL),
(121, 1, 'page_delete', 'Deleted landing page #1', 'landing_page', 1, '2026-01-07 23:26:35', NULL),
(122, 1, 'task_update', 'Updated task #12: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 23:34:12\' ', 'task', 12, '2026-01-07 23:34:12', NULL),
(123, 1, 'task_update', 'Updated task #12: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-07 23:34:17\' ', 'task', 12, '2026-01-07 23:34:17', NULL),
(124, 1, 'task_update', 'Updated task #12: status to \'done\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:14:37\' ', 'task', 12, '2026-01-08 06:14:38', NULL),
(125, 1, 'task_update', 'Updated task #12: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:14:40\' ', 'task', 12, '2026-01-08 06:14:40', NULL),
(126, 1, 'task_update', 'Updated task #20: assigned_to to \'1\' ', 'task', 20, '2026-01-08 06:18:56', NULL),
(127, 1, 'task_update', 'Updated task #13: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:19:19\' ', 'task', 13, '2026-01-08 06:19:19', NULL),
(128, 1, 'task_update', 'Updated task #13: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:19:32\' ', 'task', 13, '2026-01-08 06:19:32', NULL),
(129, 1, 'task_update', 'Updated task #13: status to \'done\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:19:34\' ', 'task', 13, '2026-01-08 06:19:34', NULL),
(130, 1, 'task_update', 'Updated task #13: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:19:43\' ', 'task', 13, '2026-01-08 06:19:43', NULL),
(131, 1, 'task_update', 'Updated task #13: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:37:35\' ', 'task', 13, '2026-01-08 06:37:35', NULL),
(132, 1, 'task_update', 'Updated task #13: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 06:37:42\' ', 'task', 13, '2026-01-08 06:37:42', NULL),
(133, 1, 'task_create', 'Created task \"hello\" for Unknown', 'task', 22, '2026-01-08 07:04:36', NULL),
(134, 2, 'lead_update', 'Updated lead \"Sameer Ahmed\": stage to \'proposal_sent\'', 'customer', 65, '2026-01-08 09:45:24', NULL),
(135, 2, 'interaction_created', 'Added internal_note: called again didn\'t pickup\n', 'customer', 63, '2026-01-08 09:46:57', NULL),
(136, 2, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 64, '2026-01-08 09:47:18', NULL),
(137, 2, 'lead_update', 'Updated lead \"Golu Yadav Mukhiya\": owner to \'Harshdeep\'', 'customer', 64, '2026-01-08 09:47:18', NULL),
(138, 2, 'lead_assignment', 'Assigned lead to unassigned', 'customer', 64, '2026-01-08 09:47:23', NULL),
(139, 2, 'lead_update', 'Updated lead \"Golu Yadav Mukhiya\": owner to \'unassigned\'', 'customer', 64, '2026-01-08 09:47:23', NULL),
(140, 2, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 63, '2026-01-08 09:47:26', NULL),
(141, 2, 'lead_update', 'Updated lead \"Gorthan Singh\": owner to \'Harshdeep\'', 'customer', 63, '2026-01-08 09:47:26', NULL),
(142, 2, 'interaction_created', 'Added internal_note: Called but didn\'t picked-up', 'customer', 62, '2026-01-08 09:48:53', NULL),
(143, 2, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 62, '2026-01-08 09:49:10', NULL),
(144, 2, 'lead_update', 'Updated lead \"Shashi Chandel Crazyheart\": owner to \'Harshdeep\'', 'customer', 62, '2026-01-08 09:49:10', NULL),
(145, 2, 'interaction_created', 'Added internal_note: called-picked up- but network problem 2 times', 'customer', 61, '2026-01-08 09:53:50', NULL),
(146, 2, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 61, '2026-01-08 09:54:10', NULL),
(147, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": owner to \'Harshdeep\'', 'customer', 61, '2026-01-08 09:54:10', NULL),
(148, 2, 'interaction_created', 'Added internal_note: Didn\'t pickeup again.', 'customer', 58, '2026-01-08 09:55:29', NULL),
(149, 2, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 58, '2026-01-08 09:59:07', NULL),
(150, 2, 'lead_update', 'Updated lead \"Aman Chaurasia\": owner to \'Harshdeep\'', 'customer', 58, '2026-01-08 09:59:07', NULL),
(151, 2, 'interaction_created', 'Added internal_note: He miss understood, he was talking about bank acco...', 'customer', 60, '2026-01-08 10:04:18', NULL),
(152, 2, 'lead_update', 'Updated lead \"Ajit Kumar\": stage to \'lost\'', 'customer', 60, '2026-01-08 10:04:31', NULL),
(153, 2, 'interaction_created', 'Added internal_note: yesterday Demo sites sent - meeting at3p, - didn\'t...', 'customer', 65, '2026-01-08 10:06:58', NULL),
(154, 1, 'task_update', 'Updated task #20: status to \'done\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 10:10:06\' ', 'task', 20, '2026-01-08 10:10:06', NULL),
(155, 1, 'task_update', 'Updated task #20: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 10:10:10\' ', 'task', 20, '2026-01-08 10:10:10', NULL),
(156, 2, 'task_update', 'Updated task #9: status to \'done\', status_changed_by to \'2\', status_changed_at to \'2026-01-08 10:13:10\' ', 'task', 9, '2026-01-08 10:13:10', NULL),
(157, 2, 'task_update', 'Updated task #10: status to \'done\', status_changed_by to \'2\', status_changed_at to \'2026-01-08 10:13:11\' ', 'task', 10, '2026-01-08 10:13:11', NULL),
(158, 2, 'task_update', 'Updated task #10: status to \'open\', status_changed_by to \'2\', status_changed_at to \'2026-01-08 10:13:19\' ', 'task', 10, '2026-01-08 10:13:19', NULL),
(159, 1, 'task_update', 'Updated task #21: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-08 10:13:32\' ', 'task', 21, '2026-01-08 10:13:32', NULL),
(160, 2, 'task_update', 'Updated task #9: status to \'open\', status_changed_by to \'2\', status_changed_at to \'2026-01-08 10:14:13\' ', 'task', 9, '2026-01-08 10:14:13', NULL),
(161, 1, 'task_update', 'Updated task #9: assigned_to to \'2\' ', 'task', 9, '2026-01-08 10:14:29', NULL),
(162, 1, 'task_update', 'Updated task #21: assigned_to to \'2\' ', 'task', 21, '2026-01-08 10:14:35', NULL),
(163, 1, 'task_update', 'Updated task #13: assigned_to to \'2\' ', 'task', 13, '2026-01-08 10:14:38', NULL),
(164, 1, 'task_update', 'Updated task #13: assigned_to to \'1\' ', 'task', 13, '2026-01-08 10:14:40', NULL),
(165, 2, 'deal_create', 'Created manual deal: Rs. 15000 for Shashi Chandel Crazyheart', 'order', 46, '2026-01-08 11:58:06', NULL),
(166, 2, 'deal_update', 'Updated deal #46: status to \'paid\'', 'order', 46, '2026-01-08 11:58:09', NULL),
(167, 2, 'interaction_created', 'Added system_event: Updated Deal #46 status to paid', 'customer', 62, '2026-01-08 11:58:09', NULL),
(168, 2, 'deal_update', 'Updated deal #46: status to \'processing\'', 'order', 46, '2026-01-08 11:58:10', NULL),
(169, 2, 'interaction_created', 'Added system_event: Updated Deal #46 status to processing', 'customer', 62, '2026-01-08 11:58:10', NULL),
(170, 2, 'deal_update', 'Updated deal #46: status to \'delivered\'', 'order', 46, '2026-01-08 11:58:11', NULL),
(171, 2, 'interaction_created', 'Added system_event: Updated Deal #46 status to delivered', 'customer', 62, '2026-01-08 11:58:11', NULL),
(172, 1, 'task_update', 'Updated task #13: priority to \'low\' ', 'task', 13, '2026-01-08 14:49:38', NULL),
(173, 1, 'task_update', 'Updated task #13: priority to \'medium\' ', 'task', 13, '2026-01-08 14:49:39', NULL),
(174, 1, 'task_update', 'Updated task #13: priority to \'high\' ', 'task', 13, '2026-01-08 14:49:40', NULL),
(175, 1, 'task_update', 'Updated task #13: priority to \'low\' ', 'task', 13, '2026-01-08 14:49:42', NULL),
(176, 1, 'task_update', 'Updated task #13: priority to \'medium\' ', 'task', 13, '2026-01-08 14:49:44', NULL),
(177, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 15:58:05', NULL),
(178, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 16:07:14', NULL),
(179, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 16:09:34', NULL),
(180, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 16:10:25', NULL),
(181, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 16:10:42', NULL),
(182, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 16:11:03', NULL),
(183, 1, 'page_update', 'Updated landing page \"New Year Launch (5k without price)\"', 'landing_page', 8, '2026-01-08 16:12:18', NULL),
(184, 2, 'deal_update', 'Updated deal #46: status to \'initiated\'', 'order', 46, '2026-01-09 07:41:49', NULL),
(185, 2, 'interaction_created', 'Added system_event: Updated Deal #46 status to initiated', 'customer', 62, '2026-01-09 07:41:49', NULL),
(186, 1, 'task_update', 'Updated task #13: assigned_to to \'2\' ', 'task', 13, '2026-01-09 07:56:46', NULL),
(187, 1, 'task_update', 'Updated task #12: assigned_to to \'1\' ', 'task', 12, '2026-01-09 07:56:53', NULL),
(188, 1, 'task_update', 'Updated task #13: priority to \'low\' ', 'task', 13, '2026-01-09 07:57:16', NULL),
(189, 1, 'task_update', 'Updated task #13: priority to \'medium\' ', 'task', 13, '2026-01-09 07:57:22', NULL),
(190, 1, 'task_update', 'Updated task #21: status to \'done\', status_changed_by to \'1\', status_changed_at to \'2026-01-09 08:03:57\' ', 'task', 21, '2026-01-09 08:03:57', NULL),
(191, 1, 'task_update', 'Updated task #21: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-09 08:03:59\' ', 'task', 21, '2026-01-09 08:03:59', NULL),
(192, 1, 'task_update', 'Updated task #21: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-09 08:04:05\' ', 'task', 21, '2026-01-09 08:04:05', NULL),
(193, 1, 'task_delete', 'Deleted task \"hello\"', 'task', 22, '2026-01-09 08:05:16', NULL),
(194, 1, 'task_delete', 'Deleted task \"Setup Server for Alice\"', 'task', 20, '2026-01-09 08:05:27', NULL),
(195, 1, 'task_update', 'Updated task #12: status to \'open\', status_changed_by to \'1\', status_changed_at to \'2026-01-09 08:05:40\' ', 'task', 12, '2026-01-09 08:05:40', NULL),
(196, 1, 'task_update', 'Updated task #11: assigned_to to \'2\' ', 'task', 11, '2026-01-09 08:05:52', NULL),
(197, 1, 'task_update', 'Updated task #10: assigned_to to \'2\' ', 'task', 10, '2026-01-09 08:05:54', NULL),
(198, 1, 'task_update', 'Updated task #12: assigned_to to \'2\' ', 'task', 12, '2026-01-09 08:05:57', NULL),
(199, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 64, '2026-01-09 08:13:17', NULL),
(200, 1, 'lead_update', 'Updated lead \"Golu Yadav Mukhiya\": owner to \'Harshdeep\'', 'customer', 64, '2026-01-09 08:13:17', NULL),
(201, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 60, '2026-01-09 08:13:20', NULL),
(202, 1, 'lead_update', 'Updated lead \"Ajit Kumar\": owner to \'Harshdeep\'', 'customer', 60, '2026-01-09 08:13:20', NULL),
(203, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 59, '2026-01-09 08:13:21', NULL),
(204, 1, 'lead_update', 'Updated lead \"Karan Singh\": owner to \'Harshdeep\'', 'customer', 59, '2026-01-09 08:13:21', NULL),
(205, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 57, '2026-01-09 08:13:23', NULL),
(206, 1, 'lead_update', 'Updated lead \"Ashraf Khan\": owner to \'Harshdeep\'', 'customer', 57, '2026-01-09 08:13:23', NULL),
(207, 1, 'task_update', 'Updated task #21: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-09 08:15:19\' ', 'task', 21, '2026-01-09 08:15:19', NULL),
(208, 2, 'interaction_created', 'Added internal_note: no incoming on her - mail sent', 'customer', 97, '2026-01-09 08:31:00', NULL),
(209, 1, 'task_update', 'Updated task #13: assigned_to to \'1\' ', 'task', 13, '2026-01-09 09:23:59', NULL),
(210, 1, 'task_update', 'Updated task #13: assigned_to to \'2\' ', 'task', 13, '2026-01-09 09:24:01', NULL),
(211, 1, 'task_comment', 'Added comment on task #21', 'task', 21, '2026-01-09 09:26:06', NULL),
(212, 1, 'task_update', 'Updated task #21: assigned_to to \'1\' ', 'task', 21, '2026-01-09 09:26:12', NULL),
(213, 1, 'task_update', 'Updated task #21: description to \'He abandoned cart..\' ', 'task', 21, '2026-01-09 09:26:16', NULL),
(214, 1, 'task_update', 'Updated task #21: assigned_to to \'2\' ', 'task', 21, '2026-01-09 09:27:00', NULL),
(215, 1, 'task_update', 'Updated task #21: assigned_to to \'2\' ', 'task', 21, '2026-01-09 09:27:07', NULL),
(216, 1, 'task_comment', 'Added comment on task #13', 'task', 13, '2026-01-09 09:27:35', NULL),
(217, 1, 'task_delete', 'Deleted task \"Setup Server for Alice\"', 'task', 23, '2026-01-09 10:29:46', NULL),
(218, 1, 'task_delete', 'Deleted task \"Follow up with Charlie\"', 'task', 24, '2026-01-09 10:29:55', NULL),
(219, 1, 'task_delete', 'Deleted task \"Follow up with Charlie\"', 'task', 21, '2026-01-09 10:30:07', NULL),
(220, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 97, '2026-01-09 10:31:44', NULL),
(221, 1, 'lead_update', 'Updated lead \"Mamta Raj\": owner to \'Harshdeep\'', 'customer', 97, '2026-01-09 10:31:44', NULL),
(222, 1, 'task_update', 'Updated task #13: status to \'in_progress\', status_changed_by to \'1\', status_changed_at to \'2026-01-09 10:41:05\' ', 'task', 13, '2026-01-09 10:41:05', NULL),
(223, 1, 'lead_update', 'Updated lead \"Mamta Raj\": stage to \'negotiation\'', 'customer', 97, '2026-01-09 11:17:45', NULL),
(224, 1, 'lead_update', 'Updated lead \"Mamta Raj\": stage to \'follow_up_required\'', 'customer', 97, '2026-01-09 11:19:56', NULL),
(225, 1, 'task_comment', 'Added comment on task #13', 'task', 13, '2026-01-09 11:22:29', NULL),
(226, 1, 'lead_update', 'Updated lead \"Mamta Raj\": stage to \'follow_up_done\'', 'customer', 97, '2026-01-09 11:33:07', NULL),
(227, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_done', 'customer', 97, '2026-01-09 11:33:07', NULL),
(228, 1, 'lead_update', 'Updated lead \"Mamta Raj\": stage to \'follow_up_required\'', 'customer', 97, '2026-01-09 11:33:13', NULL),
(229, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 97, '2026-01-09 11:33:13', NULL),
(230, 1, 'task_update', 'Updated task #12: assigned_to to \'1\' ', 'task', 12, '2026-01-09 11:43:54', NULL),
(231, 1, 'task_update', 'Updated task #12: assigned_to to \'2\' ', 'task', 12, '2026-01-09 11:43:58', NULL),
(232, 1, 'task_update', 'Updated task #13: assigned_to to \'1\' ', 'task', 13, '2026-01-09 11:48:18', NULL),
(233, 1, 'task_update', 'Updated task #13: assigned_to to \'2\' ', 'task', 13, '2026-01-09 11:48:26', NULL),
(234, 1, 'task_update', 'Updated task #13: assigned_to to \'1\' ', 'task', 13, '2026-01-09 11:52:16', NULL),
(235, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 103, '2026-01-09 13:49:34', NULL),
(236, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 104, '2026-01-09 13:49:38', NULL),
(237, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 105, '2026-01-09 13:49:41', NULL),
(238, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 106, '2026-01-09 13:49:43', NULL),
(239, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 107, '2026-01-09 13:49:47', NULL),
(240, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 108, '2026-01-09 13:52:07', NULL),
(241, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 109, '2026-01-09 13:52:09', NULL),
(242, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 110, '2026-01-09 13:52:12', NULL),
(243, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 111, '2026-01-09 13:52:14', NULL),
(244, 1, 'lead_delete', 'Deleted lead \"3-change- (3)\"', 'customer', 112, '2026-01-09 13:52:18', NULL),
(245, 1, 'csv_import', 'Imported 5 leads from CSV (10 total rows, 5 skipped, 0 failed)', NULL, NULL, '2026-01-09 13:55:26', NULL),
(246, 1, 'csv_import', 'Imported 1 leads from CSV (11 total rows, 10 skipped, 0 failed)', NULL, NULL, '2026-01-09 13:55:56', NULL),
(247, 1, 'csv_import', 'Imported 0 leads from CSV (3 total rows, 3 skipped, 0 failed)', NULL, NULL, '2026-01-09 14:04:37', NULL),
(248, 1, 'csv_import', 'Imported 5 leads from CSV (10 total rows, 5 skipped, 0 failed)', NULL, NULL, '2026-01-09 14:04:43', NULL),
(249, 1, 'csv_import', 'Imported 1 leads from CSV (11 total rows, 10 skipped, 0 failed)', NULL, NULL, '2026-01-09 14:04:50', NULL),
(250, 2, 'order_update', 'Updated order #30 (Customer: Ashraf Khan) to \'payment_failed\' via Kanban', 'order', 30, '2026-01-09 14:20:08', NULL),
(251, 1, 'task_comment', 'Added comment on task #13', 'task', 13, '2026-01-09 15:17:04', NULL),
(252, 2, 'interaction_created', 'Added system_event: Updated Deal #30 status to draft', 'customer', 57, '2026-01-09 15:51:39', NULL),
(253, 2, 'lead_update', 'Updated lead \"Aman Chaurasia\": stage to \'follow_up_required\'', 'customer', 58, '2026-01-09 16:01:18', NULL),
(254, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": stage to \'follow_up_required\'', 'customer', 61, '2026-01-09 16:02:26', NULL),
(255, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": stage to \'follow_up_required\'', 'customer', 61, '2026-01-09 16:02:48', NULL),
(256, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": stage to \'follow_up_required\'', 'customer', 61, '2026-01-09 16:03:07', NULL),
(257, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": stage to \'follow_up_required\'', 'customer', 61, '2026-01-09 16:03:21', NULL),
(258, 2, 'lead_update', 'Updated lead \"Shashi Chandel Crazyheart\": stage to \'follow_up_required\'', 'customer', 62, '2026-01-09 16:03:58', NULL),
(259, 2, 'lead_update', 'Updated lead \"Gorthan Singh\": stage to \'follow_up_required\'', 'customer', 63, '2026-01-09 16:04:15', NULL),
(260, 2, 'interaction_created', 'Added internal_note: He told he won\'t be able to join today as well - s...', 'customer', 65, '2026-01-09 16:04:54', NULL),
(261, 2, 'lead_update', 'Updated lead \"Sameer Ahmed\": score to \'hot\'', 'customer', 65, '2026-01-09 16:05:18', NULL),
(262, 2, 'lead_update', 'Updated lead \"Sameer Ahmed\": stage to \'follow_up_required\'', 'customer', 65, '2026-01-09 16:05:20', NULL),
(263, 2, 'interaction_created', 'Added internal_note: he didn\'t picked up', 'customer', 119, '2026-01-09 17:25:23', NULL),
(264, 2, 'lead_update', 'Updated lead \"Asif Alam\": stage to \'follow_up_required\'', 'customer', 119, '2026-01-09 17:25:43', NULL),
(265, 2, 'interaction_created', 'Added internal_note: picked up but not talking 30sec - background voice', 'customer', 120, '2026-01-09 17:27:37', NULL),
(266, 2, 'lead_update', 'Updated lead \"mannu Soni\": stage to \'lost\'', 'customer', 120, '2026-01-09 17:27:54', NULL),
(267, 2, 'interaction_created', 'Added internal_note: retail store in patna - have sent demo - follow up...', 'customer', 121, '2026-01-09 17:29:10', NULL),
(268, 2, 'lead_update', 'Updated lead \"chandanji\": stage to \'follow_up_required\'', 'customer', 121, '2026-01-09 17:29:18', NULL),
(269, 2, 'interaction_created', 'Added internal_note: she didn\'t pick-up', 'customer', 97, '2026-01-09 17:29:54', NULL),
(270, 2, 'interaction_created', 'Added internal_note: Demo sent - followup call tromorrow', 'customer', 122, '2026-01-09 17:30:36', NULL),
(271, 2, 'lead_update', 'Updated lead \"Shivam Kumar\": stage to \'follow_up_required\'', 'customer', 122, '2026-01-09 17:30:42', NULL),
(272, 2, 'interaction_created', 'Added internal_note: She denied she filled the form. ', 'customer', 123, '2026-01-09 17:32:25', NULL),
(273, 2, 'interaction_created', 'Added internal_note: sent Demo', 'customer', 123, '2026-01-09 17:32:41', NULL),
(274, 2, 'lead_update', 'Updated lead \"kiran mukesh gofane\": stage to \'proposal_sent\'', 'customer', 123, '2026-01-09 17:32:55', NULL),
(275, 2, 'interaction_created', 'Added internal_note: Demo sent - Followup tomorrow', 'customer', 124, '2026-01-09 17:33:32', NULL),
(276, 1, 'csv_import', 'Imported 4 leads from CSV (15 total rows, 11 skipped, 0 failed)', NULL, NULL, '2026-01-09 21:45:23', NULL),
(277, 1, 'csv_import', 'Imported 0 leads, Enriched 11 leads (15 total rows, 4 skipped, 0 failed)', NULL, NULL, '2026-01-09 21:54:00', NULL),
(278, 1, 'csv_import', 'Imported 0 leads, Enriched 3 leads (3 total rows, 0 skipped, 0 failed)', NULL, NULL, '2026-01-09 21:54:14', NULL),
(279, 2, 'interaction_created', 'Added internal_note: bhadva call hi nahi utha raha hai - Demo sent on w...', 'customer', 58, '2026-01-10 07:21:47', NULL),
(280, 1, 'csv_import', 'Imported 6 leads, Enriched 1 leads (22 total rows, 15 skipped, 0 failed)', NULL, NULL, '2026-01-10 07:59:01', NULL),
(281, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to 7099210704', 'customer', 129, '2026-01-10 08:11:08', NULL),
(282, 1, 'lead_update', 'Updated lead \"Aynui Hoaqe\": score to \'cold\'', 'customer', 129, '2026-01-10 08:13:01', NULL),
(283, 1, 'interaction_created', 'Added system_event: Updated score to cold', 'customer', 129, '2026-01-10 08:13:01', NULL),
(284, 1, 'interaction_created', 'Added internal_note: he have webiste, i ask for the requirement but it ...', 'customer', 129, '2026-01-10 08:14:33', NULL),
(285, 1, 'interaction_created', 'Added internal_note: And black list my contact number 🥹', 'customer', 129, '2026-01-10 08:15:20', NULL),
(286, 1, 'lead_update', 'Updated lead \"Aynui Hoaqe\": stage to \'contacted\'', 'customer', 129, '2026-01-10 08:15:41', NULL),
(287, 1, 'interaction_created', 'Added system_event: Updated stage to contacted', 'customer', 129, '2026-01-10 08:15:41', NULL),
(288, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +917297896821', 'customer', 135, '2026-01-10 08:16:08', NULL),
(289, 1, 'lead_update', 'Updated lead \"Dinesh Kumar\": stage to \'contacted\'', 'customer', 135, '2026-01-10 08:17:31', NULL),
(290, 1, 'interaction_created', 'Added system_event: Updated stage to contacted', 'customer', 135, '2026-01-10 08:17:31', NULL),
(291, 1, 'interaction_created', 'Added internal_note: number is not in the network area followup needs\n', 'customer', 135, '2026-01-10 08:18:13', NULL),
(292, 1, 'lead_update', 'Updated lead \"Dinesh Kumar\": stage to \'follow_up_required\'', 'customer', 135, '2026-01-10 08:18:16', NULL),
(293, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 135, '2026-01-10 08:18:16', NULL),
(294, 1, 'lead_assignment', 'Assigned lead to Harry', 'customer', 129, '2026-01-10 08:18:26', NULL),
(295, 1, 'lead_update', 'Updated lead \"Aynui Hoaqe\": owner to \'Harry\'', 'customer', 129, '2026-01-10 08:18:26', NULL),
(296, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +917291009329', 'customer', 134, '2026-01-10 08:19:20', NULL),
(297, 1, 'interaction_created', 'Added internal_note: bc naam sunte hi cut kr diya ', 'customer', 134, '2026-01-10 08:20:04', NULL),
(298, 1, 'lead_update', 'Updated lead \"Lalit L K\": stage to \'lost\'', 'customer', 134, '2026-01-10 08:20:18', NULL),
(299, 1, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 134, '2026-01-10 08:20:18', NULL),
(300, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +917995268026', 'customer', 133, '2026-01-10 08:21:00', NULL),
(301, 1, 'interaction_created', 'Added internal_note: call did not picked up.\n', 'customer', 133, '2026-01-10 08:22:00', NULL),
(302, 1, 'lead_update', 'Updated lead \"Surya Molleti\": stage to \'follow_up_required\'', 'customer', 133, '2026-01-10 08:22:03', NULL),
(303, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 133, '2026-01-10 08:22:03', NULL),
(304, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +918928314312', 'customer', 132, '2026-01-10 08:22:30', NULL),
(305, 1, 'interaction_created', 'Added internal_note: Sala merko bolata hai 30000 mahina kamata hu, mera...', 'customer', 132, '2026-01-10 08:27:01', NULL),
(306, 1, 'lead_update', 'Updated lead \"Manoj Shah\": stage to \'lost\'', 'customer', 132, '2026-01-10 08:27:26', NULL),
(307, 1, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 132, '2026-01-10 08:27:26', NULL),
(308, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +919523896348', 'customer', 131, '2026-01-10 08:28:03', NULL),
(309, 1, 'interaction_created', 'Added internal_note: bhai yh kon log hai inhe pta nahi hai website hotu...', 'customer', 131, '2026-01-10 08:29:20', NULL),
(310, 1, 'lead_update', 'Updated lead \"Usha Das\": stage to \'lost\'', 'customer', 131, '2026-01-10 08:29:25', NULL),
(311, 1, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 131, '2026-01-10 08:29:25', NULL),
(312, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +919638973438', 'customer', 130, '2026-01-10 08:29:50', NULL),
(313, 1, 'lead_update', 'Updated lead \"Chetan Prajapati\": stage to \'contacted\'', 'customer', 130, '2026-01-10 08:31:13', NULL),
(314, 1, 'interaction_created', 'Added system_event: Updated stage to contacted', 'customer', 130, '2026-01-10 08:31:13', NULL),
(315, 1, 'lead_update', 'Updated lead \"Chetan Prajapati\": stage to \'follow_up_required\'', 'customer', 130, '2026-01-10 08:37:18', NULL),
(316, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 130, '2026-01-10 08:37:18', NULL),
(317, 1, 'interaction_created', 'Added internal_note: ask me to leave massage on the whats app, he have ...', 'customer', 130, '2026-01-10 08:38:26', NULL),
(318, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +919667277316', 'customer', 128, '2026-01-10 08:39:14', NULL),
(319, 1, 'interaction_created', 'Added internal_note: number is out of network leave with whatsapp massg...', 'customer', 128, '2026-01-10 08:40:37', NULL),
(320, 1, 'interaction_created', 'Added whatsapp_msg: Opened WhatsApp chat with Himanshu Sharma', 'customer', 128, '2026-01-10 08:40:45', NULL),
(321, 1, 'lead_update', 'Updated lead \"Himanshu Sharma\": stage to \'follow_up_required\'', 'customer', 128, '2026-01-10 08:47:30', NULL),
(322, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 128, '2026-01-10 08:47:30', NULL),
(323, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +917607553305', 'customer', 127, '2026-01-10 08:48:02', NULL),
(324, 1, 'interaction_created', 'Added internal_note: Kob bhara form? Koha bhara form? Konsi Website? Ha...', 'customer', 127, '2026-01-10 08:51:01', NULL),
(325, 1, 'lead_update', 'Updated lead \"Hari Singh\": stage to \'lost\'', 'customer', 127, '2026-01-10 08:51:16', NULL),
(326, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +917054599398', 'customer', 126, '2026-01-10 08:51:39', NULL),
(327, 1, 'lead_update', 'Updated lead \"Amar Kumar\": stage to \'follow_up_required\'', 'customer', 126, '2026-01-10 08:51:55', NULL),
(328, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 126, '2026-01-10 08:51:55', NULL),
(329, 1, 'interaction_created', 'Added internal_note: number is out of network', 'customer', 126, '2026-01-10 08:52:08', NULL),
(330, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +919918745493', 'customer', 125, '2026-01-10 08:52:19', NULL),
(331, 1, 'interaction_created', 'Added internal_note: Number is swiched off', 'customer', 125, '2026-01-10 08:52:43', NULL),
(332, 1, 'lead_update', 'Updated lead \"Anita Debi9918745493\": stage to \'follow_up_required\'', 'customer', 125, '2026-01-10 08:52:46', NULL),
(333, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 125, '2026-01-10 08:52:46', NULL),
(334, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +918882147510', 'customer', 124, '2026-01-10 08:52:59', NULL),
(335, 1, 'lead_update', 'Updated lead \"Sidak Arora\": stage to \'follow_up_required\'', 'customer', 124, '2026-01-10 08:53:16', NULL),
(336, 1, 'interaction_created', 'Added system_event: Updated stage to follow_up_required', 'customer', 124, '2026-01-10 08:53:16', NULL),
(337, 1, 'csv_import', 'Imported 0 leads, Enriched 15 leads (22 total rows, 7 skipped, 0 failed)', NULL, NULL, '2026-01-10 09:00:05', NULL),
(338, 1, 'lead_update', 'Updated lead \"Aynui Hoaqe\": stage to \'lost\'', 'customer', 129, '2026-01-10 09:00:44', NULL),
(339, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 124, '2026-01-10 09:02:01', NULL),
(340, 1, 'lead_update', 'Updated lead \"Sidak Arora\": owner to \'Harshdeep\'', 'customer', 124, '2026-01-10 09:02:01', NULL),
(341, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 123, '2026-01-10 09:02:05', NULL),
(342, 1, 'lead_update', 'Updated lead \"kiran mukesh gofane\": owner to \'Harshdeep\'', 'customer', 123, '2026-01-10 09:02:05', NULL),
(343, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 102, '2026-01-10 09:02:08', NULL),
(344, 1, 'lead_update', 'Updated lead \"Omprakash Rana\": owner to \'Harshdeep\'', 'customer', 102, '2026-01-10 09:02:08', NULL),
(345, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 122, '2026-01-10 09:02:10', NULL),
(346, 1, 'lead_update', 'Updated lead \"Shivam Kumar\": owner to \'Harshdeep\'', 'customer', 122, '2026-01-10 09:02:10', NULL),
(347, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 121, '2026-01-10 09:02:12', NULL),
(348, 1, 'lead_update', 'Updated lead \"chandanji\": owner to \'Harshdeep\'', 'customer', 121, '2026-01-10 09:02:12', NULL),
(349, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 120, '2026-01-10 09:02:13', NULL),
(350, 1, 'lead_update', 'Updated lead \"mannu Soni\": owner to \'Harshdeep\'', 'customer', 120, '2026-01-10 09:02:13', NULL),
(351, 1, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 119, '2026-01-10 09:02:14', NULL),
(352, 1, 'lead_update', 'Updated lead \"Asif Alam\": owner to \'Harshdeep\'', 'customer', 119, '2026-01-10 09:02:14', NULL),
(353, 2, 'task_update', 'Updated task #12: status to \'in_progress\', status_changed_by to \'2\', status_changed_at to \'2026-01-10 09:09:46\' ', 'task', 12, '2026-01-10 09:09:46', NULL),
(354, 2, 'task_update', 'Updated task #12: status to \'open\', status_changed_by to \'2\', status_changed_at to \'2026-01-10 09:09:48\' ', 'task', 12, '2026-01-10 09:09:48', NULL),
(355, 1, 'task_update', 'Updated task #13: assigned_to to \'2\' ', 'task', 13, '2026-01-10 09:09:48', NULL),
(356, 2, 'order_update', 'Updated order #30 (Customer: Ashraf Khan) to \'initiated\' via Kanban', 'order', 30, '2026-01-10 09:10:04', NULL),
(357, 2, 'order_update', 'Updated order #30 (Customer: Ashraf Khan) to \'payment_failed\' via Kanban', 'order', 30, '2026-01-10 09:10:06', NULL),
(358, 2, 'task_update', 'Updated task #11: status to \'done\', status_changed_by to \'2\', status_changed_at to \'2026-01-10 09:11:13\' ', 'task', 11, '2026-01-10 09:11:13', NULL),
(359, 2, 'task_update', 'Updated task #10: status to \'done\', status_changed_by to \'2\', status_changed_at to \'2026-01-10 09:11:14\' ', 'task', 10, '2026-01-10 09:11:14', NULL),
(360, 2, 'task_update', 'Updated task #9: status to \'done\', status_changed_by to \'2\', status_changed_at to \'2026-01-10 09:11:16\' ', 'task', 9, '2026-01-10 09:11:16', NULL),
(361, 1, 'task_update', 'Updated task #12: status to \'done\', status_changed_by to \'1\', status_changed_at to \'2026-01-10 09:12:33\' ', 'task', 12, '2026-01-10 09:12:33', NULL),
(362, 1, 'task_update', 'Updated task #13: status to \'done\', status_changed_by to \'1\', status_changed_at to \'2026-01-10 09:12:34\' ', 'task', 13, '2026-01-10 09:12:34', NULL),
(363, 1, 'interaction_created', 'Added internal_note: ask to call back on 5:30 pm', 'customer', 128, '2026-01-10 10:33:40', NULL),
(364, 2, 'interaction_created', 'Added whatsapp_msg: Opened WhatsApp chat with Aman Chaurasia', 'customer', 58, '2026-01-10 10:48:23', NULL),
(365, 2, 'interaction_created', 'Added whatsapp_msg: Opened WhatsApp chat with Aman Chaurasia', 'customer', 58, '2026-01-10 10:48:37', NULL),
(366, 2, 'lead_update', 'Updated lead \"Aman Chaurasia\": stage to \'contacted\'', 'customer', 58, '2026-01-10 10:50:26', NULL),
(367, 2, 'lead_update', 'Updated lead \"Aman Chaurasia\": stage to \'lost\'', 'customer', 58, '2026-01-10 10:50:31', NULL),
(368, 2, 'lead_update', 'Updated lead \"Sunil Manjhi\": stage to \'lost\'', 'customer', 61, '2026-01-10 10:52:16', NULL),
(369, 2, 'interaction_created', 'Added internal_note: Baat hui - he said bla bla bla - abhi nahi 2 month...', 'customer', 61, '2026-01-10 10:56:49', NULL),
(370, 2, 'interaction_created', 'Added internal_note: Blocked me', 'customer', 63, '2026-01-10 10:58:57', NULL),
(371, 2, 'lead_update', 'Updated lead \"Shashi Chandel Crazyheart\": stage to \'lost\'', 'customer', 62, '2026-01-10 10:59:10', NULL),
(372, 2, 'lead_update', 'Updated lead \"Gorthan Singh\": stage to \'lost\'', 'customer', 63, '2026-01-10 10:59:19', NULL),
(373, 2, 'interaction_created', 'Added internal_note: Blocked me', 'customer', 63, '2026-01-10 10:59:26', NULL),
(374, 2, 'interaction_created', 'Added internal_note: I called - he\'ll call back', 'customer', 65, '2026-01-10 11:03:13', NULL),
(375, 2, 'interaction_created', 'Added internal_note: Tried 3 times - no response/time out', 'customer', 119, '2026-01-10 11:04:59', NULL),
(376, 2, 'lead_update', 'Updated lead \"Asif Alam\": stage to \'lost\'', 'customer', 119, '2026-01-10 11:05:34', NULL),
(377, 2, 'interaction_created', 'Added internal_note: call didn\'t pick up', 'customer', 121, '2026-01-10 11:07:11', NULL),
(378, 2, 'lead_update', 'Updated lead \"chandanji\": score to \'warm\'', 'customer', 121, '2026-01-10 11:07:19', NULL),
(379, 2, 'interaction_created', 'Added whatsapp_msg: Opened WhatsApp chat with Mamta Raj', 'customer', 97, '2026-01-10 11:08:11', NULL),
(380, 2, 'lead_update', 'Updated lead \"Mamta Raj\": stage to \'lost\'', 'customer', 97, '2026-01-10 11:08:34', NULL),
(381, 2, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 97, '2026-01-10 11:08:34', NULL),
(382, 2, 'interaction_created', 'Added internal_note: Call not connected - sent whatsapp', 'customer', 97, '2026-01-10 11:09:07', NULL),
(383, 2, 'interaction_created', 'Added internal_note: Phone switched off - mail sent from harshdeep@flip...', 'customer', 122, '2026-01-10 11:13:29', NULL),
(384, 2, 'lead_update', 'Updated lead \"Shivam Kumar\": stage to \'lost\'', 'customer', 122, '2026-01-10 11:13:42', NULL),
(385, 1, 'csv_import', 'Imported 0 leads, Enriched 22 leads (22 total rows, 0 skipped, 0 failed)', NULL, NULL, '2026-01-10 11:14:54', NULL),
(386, 2, 'interaction_created', 'Added internal_note: he submitted from the LP but on call he said he di...', 'customer', 102, '2026-01-10 11:15:59', NULL),
(387, 2, 'lead_update', 'Updated lead \"Omprakash Rana\": score to \'cold\'', 'customer', 102, '2026-01-10 11:16:15', NULL),
(388, 2, 'lead_update', 'Updated lead \"Omprakash Rana\": stage to \'lost\'', 'customer', 102, '2026-01-10 11:16:17', NULL);
INSERT INTO `admin_activity_logs` (`id`, `admin_id`, `action_type`, `action_description`, `entity_type`, `entity_id`, `created_at`, `ip_address`) VALUES
(389, 2, 'lead_update', 'Updated lead \"kiran mukesh gofane\": stage to \'lost\'', 'customer', 123, '2026-01-10 11:16:36', NULL),
(390, 1, 'csv_import', 'Imported 1 leads, Enriched 0 leads (23 total rows, 22 skipped, 0 failed)', NULL, NULL, '2026-01-10 11:16:42', NULL),
(391, 1, 'interaction_created', 'Added call_log: Outgoing call initiated to +917602203301', 'customer', 137, '2026-01-10 11:18:03', NULL),
(392, 1, 'lead_update', 'Updated lead \"Puja queen\": notes to \'h\'', 'customer', 137, '2026-01-10 11:18:25', NULL),
(393, 1, 'lead_update', 'Updated lead \"Puja queen\": notes to \'hh\'', 'customer', 137, '2026-01-10 11:18:25', NULL),
(394, 1, 'interaction_created', 'Added system_event: Updated notes to h', 'customer', 137, '2026-01-10 11:18:25', NULL),
(395, 1, 'interaction_created', 'Added system_event: Updated notes to hh', 'customer', 137, '2026-01-10 11:18:25', NULL),
(396, 1, 'lead_update', 'Updated lead \"Puja queen\": stage to \'lost\'', 'customer', 137, '2026-01-10 11:19:18', NULL),
(397, 1, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 137, '2026-01-10 11:19:18', NULL),
(398, 1, 'interaction_created', 'Added internal_note: filled the form by mistake', 'customer', 137, '2026-01-10 11:19:32', NULL),
(399, 1, 'lead_delete', 'Deleted lead \"test\"', 'customer', 136, '2026-01-10 11:19:47', NULL),
(400, 2, 'interaction_created', 'Added internal_note: I called - he said koi requirement nahi hai.', 'customer', 124, '2026-01-10 11:20:34', NULL),
(401, 2, 'lead_update', 'Updated lead \"Sidak Arora\": stage to \'lost\'', 'customer', 124, '2026-01-10 11:20:43', NULL),
(402, 2, 'interaction_created', 'Added internal_note: I also called- switchoff - Demo sent on whatsapp', 'customer', 125, '2026-01-10 11:23:19', NULL),
(403, 2, 'lead_update', 'Updated lead \"Anita Debi9918745493\": stage to \'lost\'', 'customer', 125, '2026-01-10 11:23:38', NULL),
(404, 2, 'interaction_created', 'Added whatsapp_msg: Opened WhatsApp chat with Anita Debi9918745493', 'customer', 125, '2026-01-10 11:25:11', NULL),
(405, 2, 'interaction_created', 'Added call_log: Outgoing call initiated to +917054599398', 'customer', 126, '2026-01-10 11:27:25', NULL),
(406, 2, 'interaction_created', 'Added internal_note: no incoming on him - sent demo on whatsapp', 'customer', 126, '2026-01-10 11:28:33', NULL),
(407, 2, 'interaction_created', 'Added whatsapp_msg: Opened WhatsApp chat with Amar Kumar', 'customer', 126, '2026-01-10 11:28:35', NULL),
(408, 2, 'lead_update', 'Updated lead \"Amar Kumar\": stage to \'lost\'', 'customer', 126, '2026-01-10 11:29:36', NULL),
(409, 2, 'lead_assignment', 'Assigned lead to Harshdeep', 'customer', 128, '2026-01-10 11:31:07', NULL),
(410, 2, 'lead_update', 'Updated lead \"Himanshu Sharma\": owner to \'Harshdeep\'', 'customer', 128, '2026-01-10 11:31:07', NULL),
(411, 1, 'lead_update', 'Updated lead \"Puja queen\": notes to \'hhj\'', 'customer', 137, '2026-01-10 11:34:15', NULL),
(412, 1, 'interaction_created', 'Added system_event: Updated notes to hhj', 'customer', 137, '2026-01-10 11:34:15', NULL),
(413, 2, 'interaction_created', 'Added internal_note: positive response - interested - clothing brand, e...', 'customer', 133, '2026-01-10 11:54:00', NULL),
(414, 2, 'lead_update', 'Updated lead \"Surya Molleti\": score to \'hot\'', 'customer', 133, '2026-01-10 11:54:05', NULL),
(415, 2, 'interaction_created', 'Added system_event: Updated score to hot', 'customer', 133, '2026-01-10 11:54:05', NULL),
(416, 2, 'interaction_created', 'Added internal_note: i called again - cut the call', 'customer', 134, '2026-01-10 11:56:08', NULL),
(417, 2, 'interaction_created', 'Added internal_note: he denied filling form.', 'customer', 135, '2026-01-10 12:01:07', NULL),
(418, 2, 'lead_update', 'Updated lead \"Dinesh Kumar\": stage to \'lost\'', 'customer', 135, '2026-01-10 12:01:15', NULL),
(419, 2, 'interaction_created', 'Added system_event: Updated stage to lost', 'customer', 135, '2026-01-10 12:01:15', NULL),
(420, 1, 'interaction_created', 'Added internal_note: did not pickedup the call', 'customer', 128, '2026-01-10 12:04:30', NULL),
(421, 2, 'interaction_created', 'Added internal_note: call busy', 'customer', 129, '2026-01-10 12:05:45', NULL),
(422, 1, 'interaction_created', 'Added internal_note: leave a massge on whats app\n', 'customer', 128, '2026-01-10 12:07:23', NULL),
(423, 1, 'csv_import', 'Imported 1 leads, Enriched 0 leads (24 total rows, 23 skipped, 0 failed)', NULL, NULL, '2026-01-10 12:16:23', NULL),
(424, 2, 'deal_create', 'Created manual deal: Rs. 100000 for yadaw sarkar  cg', 'order', 52, '2026-01-10 12:28:38', NULL),
(425, 2, 'deal_update', 'Updated deal #52: status to \'paid\'', 'order', 52, '2026-01-10 12:28:41', NULL),
(426, 2, 'interaction_created', 'Added system_event: Updated Deal #52 status to paid', 'customer', 138, '2026-01-10 12:28:41', NULL),
(427, 2, 'deal_update', 'Updated deal #52: status to \'processing\'', 'order', 52, '2026-01-10 12:28:42', NULL),
(428, 2, 'interaction_created', 'Added system_event: Updated Deal #52 status to processing', 'customer', 138, '2026-01-10 12:28:42', NULL),
(429, 2, 'deal_update', 'Updated deal #52: status to \'delivered\'', 'order', 52, '2026-01-10 12:28:43', NULL),
(430, 2, 'interaction_created', 'Added system_event: Updated Deal #52 status to delivered', 'customer', 138, '2026-01-10 12:28:43', NULL),
(431, 2, 'task_create', 'Created task \"follow-up on this lead\" for yadaw sarkar  cg', 'task', 25, '2026-01-10 12:29:11', NULL),
(432, 1, 'interaction_created', 'Added system_event: Updated Deal #52 status to getting_ready', 'customer', 138, '2026-01-10 12:43:56', NULL),
(433, 1, 'interaction_created', 'Added system_event: Updated Deal #52 status to draft', 'customer', 138, '2026-01-10 12:44:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_history`
--

CREATE TABLE `admin_login_history` (
  `id` int NOT NULL,
  `admin_id` int DEFAULT NULL,
  `email_attempted` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `failure_reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_logs`
--

CREATE TABLE `admin_login_logs` (
  `id` int NOT NULL,
  `admin_id` int DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_general_ci,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `success` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_login_logs`
--

INSERT INTO `admin_login_logs` (`id`, `admin_id`, `ip_address`, `user_agent`, `login_time`, `success`) VALUES
(1, 1, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-29 12:59:58', 1),
(2, 1, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-29 13:38:21', 1),
(3, 2, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-29 13:40:03', 1),
(4, 1, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-29 13:40:43', 1),
(5, 2, '43.249.228.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-29 17:23:10', 1),
(6, 2, '43.249.228.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-29 17:25:12', 1),
(7, 2, '103.58.97.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-31 10:23:42', 1),
(8, 2, '103.58.97.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2025-12-31 10:23:58', 1),
(9, 1, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-02 15:16:14', 1),
(10, 1, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-02 15:16:18', 1),
(11, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-05 14:54:03', 1),
(12, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-05 14:54:10', 1),
(14, 1, '49.43.32.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-05 22:28:25', 1),
(15, 2, '43.249.228.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-06 07:41:30', 1),
(16, 2, '43.249.228.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-06 07:41:33', 1),
(17, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-07 05:46:33', 1),
(18, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-07 05:46:39', 1),
(19, 2, '43.249.228.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-07 07:56:47', 1),
(20, 2, '43.249.228.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-07 07:56:50', 1),
(21, 2, '49.34.98.5', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2026-01-07 10:53:28', 1),
(22, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-07 21:23:42', 1),
(23, 1, '49.43.33.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2026-01-07 23:25:07', 1),
(24, 1, '49.34.120.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2026-01-08 05:00:41', 1),
(25, 2, '43.249.228.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-08 09:42:58', 1),
(26, 2, '106.216.103.19', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '2026-01-08 14:25:10', 1),
(27, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-09 07:56:05', 1),
(28, 1, '49.43.33.216', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '2026-01-09 12:57:45', 1),
(29, 1, '49.43.33.216', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', '2026-01-09 13:01:07', 1),
(30, 2, '43.249.228.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-09 13:11:44', 1),
(31, 2, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-09 15:19:08', 1),
(32, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-09 15:20:10', 1),
(33, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-09 15:20:15', 1),
(34, 1, '49.34.111.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2026-01-09 15:49:43', 1),
(35, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-09 23:25:57', 1),
(36, 1, '49.43.33.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '2026-01-10 10:42:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_preferences`
--

CREATE TABLE `admin_preferences` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `theme` enum('light','dark','system') COLLATE utf8mb4_general_ci DEFAULT 'system',
  `notify_email` tinyint(1) DEFAULT '1',
  `notify_in_app` tinyint(1) DEFAULT '1',
  `default_view` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'dashboard',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_preferences`
--

INSERT INTO `admin_preferences` (`id`, `admin_id`, `theme`, `notify_email`, `notify_in_app`, `default_view`, `updated_at`) VALUES
(1, 1, 'system', 1, 1, 'dashboard', '2026-01-09 11:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `admin_sessions`
--

CREATE TABLE `admin_sessions` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `token_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_reads`
--

CREATE TABLE `comment_reads` (
  `id` int NOT NULL,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `seen_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_reads`
--

INSERT INTO `comment_reads` (`id`, `comment_id`, `user_id`, `seen_at`) VALUES
(1, 2, 1, '2026-01-10 11:56:14'),
(2, 3, 1, '2026-01-10 11:56:14'),
(5, 4, 1, '2026-01-10 11:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_general_ci,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT '0.00',
  `ltv` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `source` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'Website',
  `campaign_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stage` enum('new','contacted','qualified','proposal_sent','negotiation','won','lost','follow_up_required','follow_up_done') COLLATE utf8mb4_general_ci DEFAULT 'new',
  `score` enum('hot','warm','cold') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'cold',
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `owner` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'unassigned',
  `facebook_lead_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ad_data` json DEFAULT NULL,
  `fb_lead_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fb_created_time` datetime DEFAULT NULL,
  `ad_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ad_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adset_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adset_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `form_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `form_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_organic` tinyint(1) DEFAULT '0',
  `platform` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fb_lead_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `whatsapp`, `notes`, `location`, `budget`, `ltv`, `created_at`, `updated_at`, `source`, `campaign_name`, `stage`, `score`, `tags`, `owner`, `facebook_lead_id`, `ad_data`, `fb_lead_id`, `fb_created_time`, `ad_id`, `ad_name`, `adset_id`, `adset_name`, `campaign_id`, `form_id`, `form_name`, `is_organic`, `platform`, `fb_lead_status`) VALUES
(57, 'Ashraf Khan', 'nishawahidun191@gmail.com', '+91 8604108325', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 08:09:48', '2026-01-10 11:14:53', 'manual', '07 Jan | ABO | 5k offer (without Price) | Testing - Copy', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:1519446929163105', NULL, 'ag:120242047880770664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242047880460664', NULL, NULL, 0, 'ig', NULL),
(58, 'Aman Chaurasia', 'abhishekchaurasia4599@gmail.com', '+917355611574', NULL, NULL, 'Varanasi', 0.00, 0.00, '2026-01-07 17:39:04', '2026-01-10 11:14:53', 'manual', '07 Jan | ABO | 5k offer (without Price) | Testing - Copy', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:1400004021498106', NULL, 'ag:120242047880770664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242047880460664', NULL, NULL, 0, 'ig', NULL),
(59, 'Karan Singh', 'karans84419@gmail.com', '+918690279732', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 17:39:31', '2026-01-10 11:14:53', 'manual', '07 Jan | ABO | 5k offer (without Price) | Testing - Copy', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:1602082634150564', NULL, 'ag:120242047880770664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242047880460664', NULL, NULL, 0, 'ig', NULL),
(60, 'Ajit Kumar', 'ajitkumar066855@gmail.com', '+919235066855', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 17:40:00', '2026-01-10 11:14:53', 'manual', '07 Jan | ABO | 5k offer (without Price) | Testing - Copy', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:889724066944138', NULL, 'ag:120242047880770664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242047880460664', NULL, NULL, 0, 'ig', NULL),
(61, 'Sunil Manjhi', 'mkumart2000k@gmail.com', '+919142272391', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 17:51:22', '2026-01-10 10:52:16', 'manual', '07 Jan | ABO | 5k offer | Testing - 01 - Copy', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(62, 'Shashi Chandel Crazyheart', 'crazyhearts216@gmail.com', '+919882929275', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 17:52:03', '2026-01-10 10:59:10', 'manual', '07 Jan | ABO | 5k offer | Testing - 01 - Copy', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(63, 'Gorthan Singh', 'goradhanasinhasinha@gmail.com', '+918302106108', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 18:03:47', '2026-01-10 10:59:19', 'manual', NULL, 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(64, 'Golu Yadav Mukhiya', 'goluyadav19052000@gmail.com', '+916261699193', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 18:04:14', '2026-01-09 08:13:17', 'manual', NULL, 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(65, 'Sameer Ahmed', 'zikrathereem437@gmail.com', '+918143690449', NULL, NULL, NULL, 0.00, 0.00, '2026-01-07 18:36:32', '2026-01-09 21:54:14', 'manual', '07 Jan | ABO | 5k offer | Testing - 01 - Copy', 'follow_up_required', 'hot', NULL, 'Harshdeep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(97, 'Mamta Raj', 'mamtaraj7870@gmail.com', '+917991176184', NULL, NULL, 'São Paulo', 0.00, 0.00, '2026-01-09 08:29:19', '2026-01-10 11:14:53', 'manual', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:906197991848236', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(102, 'Omprakash Rana', 'orana6109@gmail.com', '9817188489', NULL, 'Ranaop', NULL, 0.00, 0.00, '2026-01-09 12:48:14', '2026-01-10 11:16:17', 'newyearonly:sticky', NULL, 'lost', 'cold', '[\"booking_form\"]', 'Harshdeep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(119, 'Asif Alam', 'alamasif33773@gmail.com', '+917079247669', NULL, NULL, NULL, 0.00, 0.00, '2026-01-09 06:25:45', '2026-01-10 11:14:53', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:1043821867917771', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(120, 'mannu Soni', 'nareshkutta00@gmail.com', '+918595319284', NULL, NULL, 'Noida', 0.00, 0.00, '2026-01-09 07:03:32', '2026-01-10 11:14:53', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:2422872168184757', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(121, 'chandanji', 'chandankumarram8328@gmail.com', '+919381031796', NULL, NULL, '2456', 0.00, 0.00, '2026-01-09 07:08:36', '2026-01-10 11:14:53', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'follow_up_required', 'warm', NULL, 'Harshdeep', NULL, NULL, 'l:880482654917336', NULL, 'ag:120242126464620664', '3-change- (3)', NULL, '(IF) Ad Set-01', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(122, 'Shivam Kumar', 'sk7544303@gmail.com', '+917307516430', NULL, NULL, NULL, 0.00, 0.00, '2026-01-09 12:47:22', '2026-01-10 11:14:53', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:866873902817248', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'fb', NULL),
(123, 'kiran mukesh gofane', 'kirangophane7@gmail.com', '+919307875627', NULL, NULL, 'Amravati', 0.00, 0.00, '2026-01-09 13:02:53', '2026-01-10 11:16:36', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:34359880933611446', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(124, 'Sidak Arora', 'decaveindia@gmail.com', '+918882147510', NULL, NULL, 'Noida', 0.00, 0.00, '2026-01-09 13:45:27', '2026-01-10 11:20:43', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:1343759614176911', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(125, 'Anita Debi9918745493', 'debia2927@gmail.com', '+919918745493', NULL, NULL, 'Ayushkumar', 0.00, 0.00, '2026-01-09 15:16:14', '2026-01-10 11:23:38', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:4135441023344790', NULL, 'ag:120242130270740664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(126, 'Amar Kumar', 'a33858118@gmail.com', '+917054599398', NULL, NULL, 'Aman Kumar', 0.00, 0.00, '2026-01-09 15:43:25', '2026-01-10 11:29:36', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:1571270504063092', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(127, 'Hari Singh', 'h14994294@gmail.com', '+917607553305', NULL, NULL, 'Surname', 0.00, 0.00, '2026-01-09 16:09:14', '2026-01-10 11:14:54', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:1175692331274261', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(128, 'Himanshu Sharma', 'himanshuhero10@gmail.com', '+919667277316', NULL, NULL, 'Delhi', 0.00, 0.00, '2026-01-09 17:46:07', '2026-01-10 11:31:07', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'follow_up_required', 'cold', NULL, 'Harshdeep', NULL, NULL, 'l:1409187743935795', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(129, 'Aynui Hoaqe', 'hoqueaynal88625@gmail.com', '7099210704', NULL, 'Aynui Hoaqe', 'Assam', 0.00, 0.00, '2026-01-10 07:06:21', '2026-01-10 11:14:54', 'newyearonly:sticky', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', '[\"booking_form\"]', 'Harry', NULL, NULL, 'l:774331118268115', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'fb', NULL),
(130, 'Chetan Prajapati', 'ikp91000@gmail.com', '+919638973438', NULL, NULL, 'Nvs', 0.00, 0.00, '2026-01-10 03:47:52', '2026-01-10 11:14:54', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'follow_up_required', 'cold', NULL, 'Harry', NULL, NULL, 'l:752536464572568', NULL, 'ag:120242130270740664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(131, 'Usha Das', 'ushadas517121@gmail.com', '+919523896348', NULL, NULL, 'Ranchi jharkhand', 0.00, 0.00, '2026-01-10 03:55:12', '2026-01-10 11:14:54', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:1407675300953593', NULL, 'ag:120242130270740664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(132, 'Manoj Shah', 'manajsaha633@gmail.com', '+918928314312', NULL, NULL, NULL, 0.00, 0.00, '2026-01-10 04:35:56', '2026-01-10 11:14:54', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:1219843450250651', NULL, 'ag:120242130270740664', '3-change- (3)', NULL, '(IF) Ad Set-02', 'c:120242126464130664', NULL, NULL, 0, 'fb', NULL),
(133, 'Surya Molleti', 'shivamolleti0942@gmail.com', '+917995268026', NULL, NULL, 'Hyderabad', 0.00, 0.00, '2026-01-10 05:44:03', '2026-01-10 11:54:05', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'follow_up_required', 'hot', NULL, 'Harry', NULL, NULL, 'l:862289873101705', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(134, 'Lalit L K', 'lalitlk160@gmail.com', '+917291009329', NULL, NULL, 'Ghaziabad', 0.00, 0.00, '2026-01-10 06:09:12', '2026-01-10 11:14:54', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:1142367127976705', NULL, 'ag:120242126464620664', '3-change- (3)', NULL, '(IF) Ad Set-01', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(135, 'Dinesh Kumar', 'minadineshkumar2005@gmail.com', '+917297896821', NULL, NULL, NULL, 0.00, 0.00, '2026-01-10 06:50:38', '2026-01-10 12:01:15', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:1262684299085849', NULL, 'ag:120242130270800664', '3-change- (3)', NULL, '(IF) Ad Set-03', 'c:120242126464130664', NULL, NULL, 0, 'ig', NULL),
(137, 'Puja queen', 'laxmipal355@gmail.com', '+917602203301', NULL, 'hhj', 'Krishnanagar', 0.00, 0.00, '2026-01-10 11:03:39', '2026-01-10 11:34:15', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'lost', 'cold', NULL, 'Harry', NULL, NULL, 'l:2364636927304711', '2026-01-10 11:03:39', 'ag:120242130270800664', '3-change- (3)', 'as:120242130270850664', '(IF) Ad Set-03', 'c:120242126464130664', 'f:1502498430841002', 'E-com FHM Form (5K Offer without price)', 0, 'ig', 'CREATED'),
(138, 'yadaw sarkar  cg', 'ramavtary283@gmail.com', '+917389374397', NULL, NULL, 'Baloda', 0.00, 0.00, '2026-01-10 12:05:11', '2026-01-10 12:16:23', 'csv_import', '09 Jan | CBO| 5k offer (without Price) | Testing - 01', 'new', 'cold', NULL, 'Harry', NULL, NULL, 'l:1395677825361755', '2026-01-10 12:05:11', 'ag:120242130270800664', '3-change- (3)', 'as:120242130270850664', '(IF) Ad Set-03', 'c:120242126464130664', 'f:1502498430841002', 'E-com FHM Form (5K Offer without price)', 0, 'ig', 'CREATED');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL COMMENT 'Sender',
  `smtp_account_id` int DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'draft' COMMENT 'draft, queued, sent, failed, bounced',
  `recipient_to` json NOT NULL COMMENT 'Array of {name, email}',
  `recipient_cc` json DEFAULT NULL,
  `recipient_bcc` json DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `body_html` longtext COLLATE utf8mb4_general_ci,
  `body_text` longtext COLLATE utf8mb4_general_ci,
  `headers_json` json DEFAULT NULL COMMENT 'Message-ID, etc.',
  `related_task_id` int DEFAULT NULL,
  `error_message` text COLLATE utf8mb4_general_ci,
  `sent_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `direction` enum('inbound','outbound') COLLATE utf8mb4_general_ci DEFAULT 'outbound',
  `message_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `in_reply_to` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `folder` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'SENT',
  `is_read` tinyint(1) DEFAULT '1',
  `from_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `from_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `customer_id`, `user_id`, `smtp_account_id`, `status`, `recipient_to`, `recipient_cc`, `recipient_bcc`, `subject`, `body_html`, `body_text`, `headers_json`, `related_task_id`, `error_message`, `sent_at`, `received_at`, `created_at`, `updated_at`, `direction`, `message_id`, `in_reply_to`, `folder`, `is_read`, `from_name`, `from_address`) VALUES
(1, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'test', '<p>how are you</p>', 'how are you', NULL, NULL, 'Credential decryption failed', NULL, NULL, '2026-01-09 23:38:17', '2026-01-10 00:19:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(2, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'test', '<p>ghfgh</p>', 'ghfgh', NULL, NULL, 'Credential decryption failed', NULL, NULL, '2026-01-09 23:38:59', '2026-01-10 00:19:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(3, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'sdv', '<p>dsvsd</p>', 'dsvsd', NULL, NULL, 'Credential decryption failed', NULL, NULL, '2026-01-09 23:42:09', '2026-01-10 00:19:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(4, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'testt', '<p>dgb</p>', 'dgb', NULL, NULL, 'Credential decryption failed', NULL, NULL, '2026-01-10 00:06:09', '2026-01-10 00:19:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(5, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'check', '<p>howareyou</p>', 'howareyou', NULL, NULL, 'Credential decryption failed', NULL, NULL, '2026-01-10 00:11:26', '2026-01-10 00:19:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(6, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'check check', '<p>hi</p>', 'hi', NULL, NULL, 'Credential decryption failed', NULL, NULL, '2026-01-10 00:15:36', '2026-01-10 00:19:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(7, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'checkkkkk', '<p>hello</p>', 'hello', '{\"ehlo\": [\"PIPELINING\", \"SIZE 104857600\", \"ETRN\", \"AUTH PLAIN LOGIN\", \"AUTH=PLAIN LOGIN\", \"ENHANCEDSTATUSCODES\", \"8BITMIME\", \"DSN\"], \"accepted\": [\"harrymailbox11@gmail.com\"], \"envelope\": {\"to\": [\"harrymailbox11@gmail.com\"], \"from\": \"noreply@connectharish.online\"}, \"rejected\": [], \"response\": \"250 2.0.0 Ok: queued as C76762C0908\", \"messageId\": \"<3b190426-5137-3d79-e453-2e6cbb239f5d@connectharish.online>\", \"messageSize\": 587, \"messageTime\": 291, \"envelopeTime\": 39}', NULL, 'Malformed communication packet.', '2026-01-10 00:29:18', NULL, '2026-01-10 00:29:10', '2026-01-10 00:29:18', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(8, NULL, 1, 1, 'failed', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'hihi', '<p>jjj</p>', 'jjj', '{\"ehlo\": [\"PIPELINING\", \"SIZE 104857600\", \"ETRN\", \"AUTH PLAIN LOGIN\", \"AUTH=PLAIN LOGIN\", \"ENHANCEDSTATUSCODES\", \"8BITMIME\", \"DSN\"], \"accepted\": [\"harrymailbox11@gmail.com\"], \"envelope\": {\"to\": [\"harrymailbox11@gmail.com\"], \"from\": \"noreply@connectharish.online\"}, \"rejected\": [], \"response\": \"250 2.0.0 Ok: queued as 7AEBF2C13D6\", \"messageId\": \"<2144a827-238c-57a7-0f55-8a5f1852341b@connectharish.online>\", \"messageSize\": 578, \"messageTime\": 89, \"envelopeTime\": 52}', NULL, 'Malformed communication packet.', '2026-01-10 00:31:26', NULL, '2026-01-10 00:31:22', '2026-01-10 00:31:26', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(9, NULL, 1, 1, 'sent', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'chhhca', '<p>acas</p>', 'acas', '{\"ehlo\": [\"PIPELINING\", \"SIZE 104857600\", \"ETRN\", \"AUTH PLAIN LOGIN\", \"AUTH=PLAIN LOGIN\", \"ENHANCEDSTATUSCODES\", \"8BITMIME\", \"DSN\"], \"accepted\": [\"harrymailbox11@gmail.com\"], \"envelope\": {\"to\": [\"harrymailbox11@gmail.com\"], \"from\": \"noreply@connectharish.online\"}, \"rejected\": [], \"response\": \"250 2.0.0 Ok: queued as C2FD82C090F\", \"messageId\": \"<59cd0392-2ddd-fbf5-00ef-36f7152b416f@connectharish.online>\", \"messageSize\": 582, \"messageTime\": 596, \"envelopeTime\": 367}', NULL, NULL, '2026-01-10 00:38:20', NULL, '2026-01-10 00:38:19', '2026-01-10 00:38:20', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(10, NULL, 1, 3, 'sent', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'ceckkk', '<p>devsd</p>', 'devsd', '{\"ehlo\": [\"PIPELINING\", \"SIZE 48811212\", \"ETRN\", \"AUTH PLAIN LOGIN\", \"ENHANCEDSTATUSCODES\", \"8BITMIME\", \"DSN\", \"CHUNKING\"], \"accepted\": [\"harrymailbox11@gmail.com\"], \"envelope\": {\"to\": [\"harrymailbox11@gmail.com\"], \"from\": \"test@fliphatmedia.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 Ok: queued as 4dp0Js4rxkz41gp\", \"messageId\": \"<c74609a5-84ea-f13c-7c79-405da64fc9ac@fliphatmedia.com>\", \"messageSize\": 579, \"messageTime\": 255, \"envelopeTime\": 444}', NULL, NULL, '2026-01-10 00:44:30', NULL, '2026-01-10 00:44:28', '2026-01-10 00:44:30', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(11, NULL, 1, 3, 'queued', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'fgvbfd', '<p>fdb fd</p>', 'fdb fd', NULL, NULL, NULL, NULL, NULL, '2026-01-10 01:10:51', '2026-01-10 01:10:51', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(12, NULL, 1, 3, 'queued', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'sdfvdf', '<p>dfvdf</p>', 'dfvdf', NULL, NULL, NULL, NULL, NULL, '2026-01-10 01:12:15', '2026-01-10 01:12:15', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL),
(13, NULL, NULL, 3, 'received', '[]', NULL, NULL, 'Get started with business email', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <title></title>\n    <meta name=\"format-detection\" content=\"telephone=no\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n    <meta content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes\" name=\"viewport\">\n    \n\n    <style type=\"text/css\">\n      /* reset */\n      * {margin-top:0px;margin-bottom:0px;padding:0px;border:none;outline:none;-webkit-text-size-adjust: none;}\n      body {margin:0 !important;padding:0 !important;width: 100% !important;-webkit-text-size-adjust: 100% !important;-ms-text-size-adjust: 100% !important;-webkit-font-smoothing: antialiased !important;}\n      img {border:0 !important;display: block !important;outline: none !important;}\n      table {border-collapse: collapse;mso-table-lspace:0px;mso-table-rspace: 0px;}\n      td {border-collapse:collapse;mso-line-height-rule:exactly;}\n      .ftr a {color:#555555;}\n      .ExternalClass {width: 100%;line-height: 100%;}\n      a[x-apple-data-detectors] {color: inherit !important;text-decoration: none !important;font-size: inherit !important;font-family: inherit !important;font-weight: inherit !important;line-height: inherit !important;}\n      .purple_image {display: none !important;}\n      /* @font-face CUSTOM FONTS HERE */\n            \n    @media only screen and (max-width:640px){\n      .hide_e {display: none !important;}\n      .show_e {display: block !important; width: auto !important; overflow: visible !important; float: none !important; max-height: inherit !important; line-height: inherit !important;}\n      .mobile_img_early, .mobile_img_e {width: 100% !important; height: auto !important;}\n      .w100pc_early, .w100pc_e {width: 100% !important;}\n      .mobile_cta_early, .mobile_cta_e {width: 80% !important;max-width: 80% !important;}\n    }\n\n    @media only screen and (max-width:520px){\n            .purple_image {display: none !important;}\n            .w100pc, .width_100percent {width: 100% !important;}\n      .mobile_img {width: 100% !important; height: auto !important;}\n      .prod_img {width: 80% !important; height: auto !important;}\n      .art_img {width: 100% !important; height: auto !important;}\n      .hide {display: none !important;}\n      .show {display: block !important; width: auto !important; overflow: visible !important; float: none !important; max-height: inherit !important; line-height: inherit !important;}\n      .bg_mobile {background-size: auto 100% !important;}\n      .maxWidth_none {max-width: none !important;}\n      .width_auto, .w_auto {width:  auto !important;}\n      .height_auto, .h_auto {height:  auto !important;}\n      .ptb20px, .paddingtopbottom_20 {padding-top: 20px !important;padding-bottom: 20px !important;}\n      .blockSides, .paddingsides_block {width: 20px !important;}\n      .textSides {width: 14px !important;}\n      .alternateTextBoxPadding {display: none !important;}\n      .w20px, .width_20 {width: 20px !important;}\n      .w30px, .width_30 {width: 30px !important;}\n      .h10px, .height_10 {height: 10px !important;}\n      .h20px, .height_20 {height: 20px !important;}\n      .h30px, .height_30 {height: 30px !important;}\n      .h40px, .height_40 {height: 40px !important;}\n      .h50px, .height_50 {height: 50px !important;}\n      .txt_12 {font-size: 12px !important; line-height: 16px !important;}\n      .txt_14 {font-size: 14px !important; line-height: 18px !important;}\n      .txt_16 {font-size: 16px !important; line-height: 20px !important;}\n      .txt_18 {font-size: 18px !important; line-height: 22px !important;}\n      .txt_20 {font-size: 20px !important; line-height: 24px !important;}\n      .txt_24 {font-size: 24px !important; line-height: 28px !important;}\n      .txt_28 {font-size: 28px !important; line-height: 32px !important;}\n      .txt_32 {font-size: 32px !important; line-height: 36px !important;}\n      .mobile_hide, .hide {display: none !important;mso-hide: all;}\n      .mobile_center {display: block; margin-left: auto; margin-right: auto;}\n      .mobile_comp_table {padding:5px 11px 5px 11px !important; font-size: 12px !important; line-height: 16px !important;}\n      .mobile_block_disp, .block {display:block !important;}\n      .min_width_mobile {min-width:100% !important;}\n    }\n    @import url(\'https://fonts.googleapis.com/css2?family=DM+Sans:opsz@9..40&family=Poppins&display=swap\');\n    \n    </style>\n\n    <!--[if mso]>\n    <style type=\"text/css\">\n      body, table, td, a, span {font-family: Arial,sans-serif !important;}\n      .nav {font-family: Arial,sans-serif !important;}\n      .hed {font-family: Arial,sans-serif !important;}\n      .ttl {font-family: Arial,sans-serif !important;}\n      .cta {font-family: Arial,sans-serif !important;}\n      .ftr {font-family: Arial,sans-serif !important;}\n      li {text-indent: -1em;}\n    </style>\n    <![endif]-->\n    <!--[if gte mso 9]>\n      <xml>\n      <o:OfficeDocumentSettings>\n      <o:AllowPNG/>\n      <o:PixelsPerInch>96</o:PixelsPerInch>\n      </o:OfficeDocumentSettings>\n      </xml>\n    <![endif]-->\n\n\n\n  </head>\n\n  <body marginwidth=\"0\" marginheight=\"0\" style=\"margin-top:0;margin-bottom:0;padding-top:0;padding-bottom:0;width:100% !important;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;-webkit-font-smoothing:antialiased;background-color:#f4f5ff;\" offset=\"0\" topmargin=\"0\" leftmargin=\"0\">\n    \n\n      \n    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#f4f5ff;\">\n      <tr>\n        <td align=\"center\" valign=\"top\">\n            <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n            <tr><td align=\"center\" valign=\"top\" style=\"font-family:sans-serif;color:#f4f5ff;font-size:1px;line-height:1px;display:none;\">Welcome to Hostinger Email!</td></tr>\n          </table>\n            <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n            <tr>\n              <td align=\"center\" valign=\"top\">\n                <div style=\"display: none; max-height: 0px; overflow: hidden;\">&#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847; &#8199; &#65279; &#847;</div>\n              </td>\n            </tr> \n          </table>\n        </td>\n      </tr>\n    </table>\n\n  <div>\n  </div>\n\n\n  <!-- ===== BLOCK: Header Logo===== --><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" bgcolor=\"#f4f5ff\"><tr><td align=\"center\" valign=\"top\"><table width=\"640\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:640px;\" class=\"w100pc_e\"><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><td width=\"20\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#fafbff\"><tr><td height=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"40\" class=\"blockSides\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\"><a href=\"https://hostinger.com\n\" target=\"_blank\" data-crdl-key=\"B1 Header Logo\" data-crdl-tags=\"header-logo\"><img src=\"https://ci4.googleusercontent.com/proxy/AdlP0pdiMnNGs9klmnggkVb3Lbp4Ylx3cQeIigXRqnL9XT8qibDYdGd3Z-BN6wcrvbdA8UMIPIoRydZTLvBbBjaDmeQk4gNVHMan2b3s23_WaBx8aUMxveG1IcoKhSwIg4kkj9dPchjj04E_7gZxboqmv_NBFdTz6X-xqSiwgBgqiiLLz0qeAEGavnk=s0-d-e1-ft#https://iiizsw.stripocdn.email/content/guids/CABINET_54a8087598d4843b18da83e147c9fc7d/images/hostingerlogotypeprimary.png\" width=\"140\" border=\"0\" style=\"width:140px;max-width:140px;height:auto;display:block;\" alt=\"Hostinger\" class=\"mobile_img_e\" /></a></td><td class=\"mobile_hide\" align=\"right\" valign=\"top\" style=\"Margin:0;font-family:roboto,helvetica,arial,sans-serif;line-height:21px;color:#673de6;font-size:14px;font-weight:bold;\">Three. Two. Online</td></tr></table></td><td width=\"40\" class=\"blockSides\">&nbsp;</td></tr></table></td></tr><tr><td height=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table></td><td width=\"20\">&nbsp;</td></table></td></tr></table></td></tr></table><!-- end of BLOCK: Header Logo-->  \n\n\n\n  <div>\n    <div data-crdl-tags=\"sculpt-block-headline-body-button-hostinger\"><!-- ===== BLOCK: Headline-Body-Button ===== --><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"background-color:#f4f5ff;\"><tr><td align=\"center\" valign=\"top\"><table width=\"640\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:640px;\" class=\"w100pc_e\"><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#fafbff;\"><tr><td height=\"40\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"80\" class=\"blockSides\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\" style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:32px;line-height:30px;font-weight:bold;font-style:normal;letter-spacing:normal;color:#2F1C6A;\" class=\"txt_24\"><span class=\"hed\">Get started with business email</span></td></tr><tr><td height=\"24\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\" style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:18px;line-height:24px;font-weight:400;font-style:normal;letter-spacing:normal;color:#2F1C6A;\" class=\"richTextLinks txt_18\">Send yourself a test email to check that your new email address works as it should.</td></tr>                            </table></td><td width=\"80\" class=\"blockSides\">&nbsp;</td></tr></table></td></tr><tr><td height=\"12\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table></td><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></table></td></tr></table></td></tr></table><!-- end of BLOCK: Headline-Body-Button --></div><div data-crdl-tags=\"sculpt-block-headline-hostinger\"><!-- ===== BLOCK: Headline ===== --><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"background-color:#f4f5ff\"><tr><td align=\"center\" valign=\"top\"><table width=\"640\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:640px;\" class=\"w100pc_e\"><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#fafbff\"><tr><td height=\"12\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"80\" class=\"blockSides\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\" style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:22px;line-height:30px;font-weight:700;font-style:normal;color:#2F1C6A;\" class=\"txt_24\"><span class=\"hed\">Click Compose in your email app</span></td></tr></table></td><td width=\"80\" class=\"blockSides\">&nbsp;</td></tr></table></td></tr><tr><td height=\"40\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table></td><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></table></td></tr></table></td></tr></table><!-- end of BLOCK: Headline --></div><div data-crdl-tags=\"sculpt-block-image-hostinger\"><!-- ===== BLOCK: Image ===== --><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"background-color:#f4f5ff\"><tr><td align=\"center\" valign=\"top\"><table width=\"640\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:640px;\" class=\"w100pc_e\"><tr><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#fafbff\"><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"100%\" align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\"><img src=\"https://iiizsw.stripocdn.email/content/guids/CABINET_fd419513847235998cf9608db723167f/images/planboost.png\" width=\"600\" border=\"0\" style=\"width:600px;max-width:600px;height:auto;display:block;\" alt=\"\" class=\"mobile_img_e\"></td></tr></table></td></tr></table></td></tr></table></td><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table></td></tr></table><!-- end of BLOCK: Image --></div><div data-crdl-tags=\"sculpt-block-headline-body-button-hostinger\"><!-- ===== BLOCK: Headline-Body-Button ===== --><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"background-color:#f4f5ff;\"><tr><td align=\"center\" valign=\"top\"><table width=\"640\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:640px;\" class=\"w100pc_e\"><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#fafbff;\"><tr><td height=\"40\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"80\" class=\"blockSides\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\" style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:32px;line-height:36px;font-weight:bold;font-style:normal;letter-spacing:normal;color:#2F1C6A;\" class=\"txt_24\"><span class=\"hed\">Hostinger email works everywhere you do</span></td></tr><tr><td height=\"24\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\" style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:18px;line-height:24px;font-weight:400;font-style:normal;letter-spacing:normal;color:#2F1C6A;\" class=\"richTextLinks txt_18\">Outlook, Gmail, Apple Mail or Thunderbird. <br/>Smartphone or laptop. Windows or Mac. <br/>Set up your email on all devices and apps you use daily.</td></tr><tr><td height=\"24\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr><tr><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\"><table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"mobile_cta\"><tr><td align=\"center\" style=\"background-color:#673de6;border-radius:6px;mso-padding-alt:15px 25px 15px 25px;mso-border-alt:2px solid #673de6;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;\" class=\"w100pc\"><a href=\"https://support.hostinger.com/en/articles/4305847-set-up-hostinger-email-on-your-applications-and-devices\" target=\"_blank\" style=\"padding: 15px 25px 15px 25px;border:solid 2px #673de6;mso-padding-alt:15px 25px 15px 25px;mso-border-alt:none;border-radius:6px;font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:16px;line-height:17px;font-weight:bold;font-style:normal;letter-spacing:normal;display:block;text-decoration:none;color:#fffffe;\" data-crdl-key=\"B5 HBB Button: Connect apps & devices\" data-crdl-tags=\"headline-body-button\" class=\"txt_14\"><span style=\"text-decoration: none; color:#fffffe;\" class=\"cta\">Connect apps & devices</span></a></td></tr></table></td></tr></table></td></tr>                            </table></td><td width=\"80\" class=\"blockSides\">&nbsp;</td></tr></table></td></tr><tr><td height=\"40\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table></td><td width=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></table></td></tr></table></td></tr></table><!-- end of BLOCK: Headline-Body-Button --></div>\n    \n    \n    \n    \n  </div>    \n\n\n\n\n<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" bgcolor=\"#f4f5ff\"><tr><td align=\"center\" valign=\"top\"><table width=\"640\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:640px;\" class=\"w100pc_e\"><tr><td width=\"20\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#f4f5ff\"><tr><td width=\"30\" class=\"blockSides\">&nbsp;</td><td align=\"center\" valign=\"top\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td height=\"20\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\" valign=\"top\"><a href=\"https://hostinger.com\n\" target=\"_blank\" data-crdl-key=\"B1 Header Logo\" data-crdl-tags=\"header-logo\"><img src=\"https://ci4.googleusercontent.com/proxy/jYO-lXkBsZDpdhA8Im0oxLdqq_p3askhXe_kQzGmXlHhnnaz5JTE0Ic7akM8b6M4OEjVBGwkJFa5QKyb6hTLzDH-GXOJdqg9zMBuYfD_xCJiml7gQsvT4qoGyaSyHvMBrVHDgXDG0u8JDXUHjKaI6jHiSr-g5_ylGbFPGbnS7zoi6Xwb=s0-d-e1-ft#https://iiizsw.stripocdn.email/content/guids/CABINET_044056145dca2e4f00069c0c446e083c/images/4431612948434682.png\" width=\"147\" border=\"0\" style=\"width:147px;max-width:147px;height:auto;display:block;\" alt=\"Hostinger\" class=\"mobile_img_e\" /></a></td></tr></table><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td height=\"10\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><tr><td style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:12px;line-height:14px;mso-line-height-rule:exactly;font-weight:400;color:#555555;\">You have received this email because you are registered at Hostinger, to ensure the implementation of our Terms of Service and (or) for other legitimate matters.<br><br></td></tr><td align=\"left\" valign=\"top\" style=\"font-family:\'DM Sans\', sans-serif, -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\';font-size:12px;line-height:14px;mso-line-height-rule:exactly;font-weight:400;color:#555555;\" class=\"ftr\"><a href=\"https://hostinger.com\n/privacy\" target=\"_blank\" data-crdl-key=\"Footer: Privacy Policy\"><span style=\"color:#555555;text-decoration:underline;display:inline-block;\">Privacy Policy</span></a><br><br>© 2004–2025  Hostinger International Ltd.</td></tr></table><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td height=\"40\" style=\"line-height:1px;font-size:1px;\">&nbsp;</td></tr></table></td><td width=\"30\" class=\"blockSides\">&nbsp;</td></tr></table></td><td width=\"20\">&nbsp;</td></tr></table></td></tr></table>\n\n\n</body>\n</html>\n', 'Welcome to Hostinger Email!\n\n  ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏  \n﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿\n͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏\n  ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏  \n﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿ ͏   ﻿\n͏   ﻿ ͏   ﻿ ͏   ﻿ ͏\n\n\n\n \n\n \n\n \n\nHostinger\n[https://ci4.googleusercontent.com/proxy/AdlP0pdiMnNGs9klmnggkVb3Lbp4Ylx3cQeIigXRqnL9XT8qibDYdGd3Z-BN6wcrvbdA8UMIPIoRydZTLvBbBjaDmeQk4gNVHMan2b3s23_WaBx8aUMxveG1IcoKhSwIg4kkj9dPchjj04E_7gZxboqmv_NBFdTz6X-xqSiwgBgqiiLLz0qeAEGavnk=s0-d-e1-ft#https://iiizsw.stripocdn.email/content/guids/CABINET_54a8087598d4843b18da83e147c9fc7d/images/hostingerlogotypeprimary.png]https://hostinger.com\nThree. Two. Online\n\n \n\n \n\n \n\n \n\n \n\n \n\nGet started with business email Send yourself a test email to check that your\nnew email address works as it should.\n\n \n\n \n\n \n\n \n\n \n\n \n\nClick Compose in your email app\n\n \n\n \n\n \n\n \n\n[https://iiizsw.stripocdn.email/content/guids/CABINET_fd419513847235998cf9608db723167f/images/planboost.png]\n\n \n\n \n\n \n\n \n\nHostinger email works everywhere you do Outlook, Gmail, Apple Mail or\nThunderbird.\nSmartphone or laptop. Windows or Mac.\nSet up your email on all devices and apps you use daily. \n\nConnect apps & devices\n[https://support.hostinger.com/en/articles/4305847-set-up-hostinger-email-on-your-applications-and-devices]\n\n \n\n \n\n \n\n \n\n \n\n \n\nHostinger\n[https://ci4.googleusercontent.com/proxy/jYO-lXkBsZDpdhA8Im0oxLdqq_p3askhXe_kQzGmXlHhnnaz5JTE0Ic7akM8b6M4OEjVBGwkJFa5QKyb6hTLzDH-GXOJdqg9zMBuYfD_xCJiml7gQsvT4qoGyaSyHvMBrVHDgXDG0u8JDXUHjKaI6jHiSr-g5_ylGbFPGbnS7zoi6Xwb=s0-d-e1-ft#https://iiizsw.stripocdn.email/content/guids/CABINET_044056145dca2e4f00069c0c446e083c/images/4431612948434682.png]https://hostinger.com\n\n \n\nYou have received this email because you are registered at Hostinger, to ensure\nthe implementation of our Terms of Service and (or) for other legitimate\nmatters.\n\nPrivacy Policy [https://hostinger.com /privacy]\n\n© 2004–2025 Hostinger International Ltd.\n\n \n\n \n\n ', '{}', NULL, NULL, NULL, '2026-01-10 13:04:22', '2026-01-10 13:04:22', '2026-01-10 13:04:22', 'inbound', '<1768005767918103065.f5f12387-a297-487a-a908-74ed3655833d@email.hostinger.com>', NULL, 'INBOX', 0, 'Hostinger', 'team@email.hostinger.com'),
(14, NULL, 1, 3, 'queued', '[{\"email\": \"harrymailbox11@gmail.com\"}]', '[]', '[]', 'tezt', '<p>rehuig</p>', 'rehuig', NULL, NULL, NULL, NULL, NULL, '2026-01-10 13:14:35', '2026-01-10 13:14:35', 'outbound', NULL, NULL, 'SENT', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_attachments`
--

CREATE TABLE `email_attachments` (
  `id` int NOT NULL,
  `email_id` int NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `file_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_bounces`
--

CREATE TABLE `email_bounces` (
  `id` int NOT NULL,
  `email_id` int DEFAULT NULL,
  `recipient` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `bounce_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'hard, soft, complaint',
  `reason` text COLLATE utf8mb4_general_ci,
  `provider_response` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_send_jobs`
--

CREATE TABLE `email_send_jobs` (
  `id` int NOT NULL,
  `email_id` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt_count` bigint DEFAULT '0',
  `last_error` text COLLATE utf8mb4_unicode_ci,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_send_jobs`
--

INSERT INTO `email_send_jobs` (`id`, `email_id`, `status`, `attempt_count`, `last_error`, `started_at`, `finished_at`, `created_at`) VALUES
(1, 0, '@failed', 0, 'Credential decryption failed', NULL, '2026-01-10 00:19:18', '2026-01-10 00:19:18'),
(2, 0, '@failed', 1, 'Credential decryption failed', NULL, '2026-01-10 00:19:19', '2026-01-10 00:19:19'),
(3, 0, '@failed', 2, 'Credential decryption failed', NULL, '2026-01-10 00:19:21', '2026-01-10 00:19:21'),
(4, 9, 'completed', 0, NULL, NULL, '2026-01-10 00:38:20', '2026-01-10 00:38:20'),
(5, 10, 'completed', 0, NULL, NULL, '2026-01-10 00:44:30', '2026-01-10 00:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `body_html` longtext COLLATE utf8mb4_general_ci,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_tracking_events`
--

CREATE TABLE `email_tracking_events` (
  `id` int NOT NULL,
  `email_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'open, click',
  `url` varchar(2048) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'For clicks',
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `file_url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `file_type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'link',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `customer_id`, `uploaded_by`, `file_name`, `file_url`, `file_type`, `created_at`) VALUES
(1, 57, 1, 'Proposal: Ecom website', '/proposals/31', 'proposal', '2026-01-07 08:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `interactions`
--

CREATE TABLE `interactions` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `type` enum('call_log','email_sent','whatsapp_msg','internal_note','system_event') COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `sentiment` enum('positive','neutral','negative') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'neutral',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interactions`
--

INSERT INTO `interactions` (`id`, `customer_id`, `order_id`, `type`, `content`, `sentiment`, `created_by`, `created_at`) VALUES
(144, 57, 30, 'system_event', 'Manual deal created: ₹5000', 'neutral', NULL, '2026-01-07 08:27:12'),
(150, 57, NULL, 'system_event', 'Updated stage to lost', 'neutral', 2, '2026-01-07 17:36:22'),
(151, 57, NULL, 'internal_note', 'He is a not interested, he was joking - (bad lead)', 'neutral', 2, '2026-01-07 17:36:57'),
(152, 58, NULL, 'internal_note', 'Aman didn\'t picked the call - Need followup\n', 'neutral', 2, '2026-01-07 17:41:33'),
(153, 59, NULL, 'internal_note', 'Not interested - he can\'t remember he filled form.', 'neutral', 2, '2026-01-07 17:44:29'),
(154, 60, NULL, 'internal_note', 'He want\'s a store - have send the Demo sites - Follow up required.', 'neutral', 2, '2026-01-07 17:47:33'),
(155, 57, NULL, 'system_event', 'Updated Deal #31 status to initiated', 'neutral', 2, '2026-01-07 17:49:23'),
(156, 57, NULL, 'system_event', 'Updated Deal #31 status to paid', 'neutral', 2, '2026-01-07 17:49:38'),
(157, 57, NULL, 'system_event', 'Updated Deal #31 status to initiated', 'neutral', 2, '2026-01-07 17:49:39'),
(158, 61, NULL, 'internal_note', '\"subah mai phone karege sir\" - follow up required\n', 'neutral', 2, '2026-01-07 17:53:47'),
(159, 61, NULL, 'internal_note', 'Sent him the Demo stores.\n', 'neutral', 2, '2026-01-07 17:54:31'),
(160, 62, NULL, 'internal_note', '\"abhi baat nahi ker sakta sir suabh kerna\" - Demo sent - followup required', 'neutral', 2, '2026-01-07 18:00:40'),
(161, 63, NULL, 'internal_note', 'She didn\'t picked up, followup required', 'neutral', 2, '2026-01-07 18:04:55'),
(162, 64, NULL, 'internal_note', 'Not interested', 'neutral', 2, '2026-01-07 18:06:24'),
(166, 65, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-07 21:58:32'),
(169, 63, NULL, 'internal_note', 'called again didn\'t pickup\n', 'neutral', 2, '2026-01-08 09:46:57'),
(170, 64, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 2, '2026-01-08 09:47:18'),
(171, 64, NULL, 'system_event', 'Assigned lead to unassigned', 'neutral', 2, '2026-01-08 09:47:23'),
(172, 63, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 2, '2026-01-08 09:47:26'),
(173, 62, NULL, 'internal_note', 'Called but didn\'t picked-up', 'neutral', 2, '2026-01-08 09:48:53'),
(174, 62, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 2, '2026-01-08 09:49:10'),
(175, 61, NULL, 'internal_note', 'called-picked up- but network problem 2 times', 'neutral', 2, '2026-01-08 09:53:50'),
(176, 61, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 2, '2026-01-08 09:54:10'),
(177, 58, NULL, 'internal_note', 'Didn\'t pickeup again.', 'neutral', 2, '2026-01-08 09:55:29'),
(178, 58, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 2, '2026-01-08 09:59:07'),
(179, 60, NULL, 'internal_note', 'He miss understood, he was talking about bank account.. wtf bc', 'neutral', 2, '2026-01-08 10:04:18'),
(180, 65, NULL, 'internal_note', 'yesterday Demo sites sent - meeting at3p, - didn\'t come for meeting - didn\'t picked up calls', 'neutral', 2, '2026-01-08 10:06:58'),
(181, 62, NULL, 'system_event', 'Manual deal created: ₹15000', 'neutral', NULL, '2026-01-08 11:58:06'),
(182, 62, NULL, 'system_event', 'Updated Deal #46 status to paid', 'neutral', 2, '2026-01-08 11:58:09'),
(183, 62, NULL, 'system_event', 'Updated Deal #46 status to processing', 'neutral', 2, '2026-01-08 11:58:10'),
(184, 62, NULL, 'system_event', 'Updated Deal #46 status to delivered', 'neutral', 2, '2026-01-08 11:58:11'),
(185, 62, NULL, 'system_event', 'Updated Deal #46 status to initiated', 'neutral', 2, '2026-01-09 07:41:49'),
(186, 64, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-09 08:13:17'),
(187, 60, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-09 08:13:20'),
(188, 59, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-09 08:13:21'),
(189, 57, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-09 08:13:23'),
(190, 97, NULL, 'internal_note', 'no incoming on her - mail sent', 'neutral', 2, '2026-01-09 08:31:00'),
(193, 97, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-09 10:31:44'),
(194, 97, NULL, 'system_event', 'Updated stage to follow_up_done', 'neutral', 1, '2026-01-09 11:33:07'),
(195, 97, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-09 11:33:13'),
(196, 102, NULL, 'system_event', '{\"source\":\"newyearonly:sticky\",\"action\":\"form_submitted\",\"name\":\"Omprakash Rana\",\"email\":\"orana6109@gmail.com\",\"phone\":\"9817188489\",\"store\":\"Ranaop\",\"type\":\"book\"}', 'neutral', NULL, '2026-01-09 12:48:14'),
(197, 119, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 06:25:45'),
(198, 120, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 07:03:32'),
(199, 121, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 07:08:36'),
(200, 122, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 12:47:22'),
(201, 123, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 13:02:53'),
(202, 124, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 13:45:27'),
(203, 57, 30, 'system_event', 'Order status updated to payment_failed ', 'neutral', NULL, '2026-01-09 14:20:08'),
(204, 57, NULL, 'system_event', 'Updated Deal #30 status to draft', 'neutral', 2, '2026-01-09 15:51:39'),
(205, 65, NULL, 'internal_note', 'He told he won\'t be able to join today as well - sent him the Payment and the process.', 'neutral', 2, '2026-01-09 16:04:54'),
(206, 119, NULL, 'internal_note', 'he didn\'t picked up', 'neutral', 2, '2026-01-09 17:25:23'),
(207, 120, NULL, 'internal_note', 'picked up but not talking 30sec - background voice', 'neutral', 2, '2026-01-09 17:27:37'),
(208, 121, NULL, 'internal_note', 'retail store in patna - have sent demo - follow up tom.', 'neutral', 2, '2026-01-09 17:29:10'),
(209, 97, NULL, 'internal_note', 'she didn\'t pick-up', 'neutral', 2, '2026-01-09 17:29:54'),
(210, 122, NULL, 'internal_note', 'Demo sent - followup call tromorrow', 'neutral', 2, '2026-01-09 17:30:36'),
(211, 123, NULL, 'internal_note', 'She denied she filled the form. ', 'neutral', 2, '2026-01-09 17:32:25'),
(212, 123, NULL, 'internal_note', 'sent Demo', 'neutral', 2, '2026-01-09 17:32:41'),
(213, 124, NULL, 'internal_note', 'Demo sent - Followup tomorrow', 'neutral', 2, '2026-01-09 17:33:32'),
(214, 125, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 15:16:14'),
(215, 126, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 15:43:25'),
(216, 127, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 16:09:14'),
(217, 128, NULL, 'system_event', 'Lead submitted via form', 'neutral', 1, '2026-01-09 17:46:07'),
(218, 57, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(219, 58, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(220, 59, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(221, 60, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(222, 97, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(223, 119, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(224, 120, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(225, 121, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(226, 122, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(227, 123, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(228, 124, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:00'),
(229, 62, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:14'),
(230, 61, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:14'),
(231, 65, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-09 21:54:14'),
(232, 129, NULL, 'system_event', '{\"source\":\"newyearonly:sticky\",\"action\":\"form_submitted\",\"name\":\"Aynui Hoaqe\",\"email\":\"hoqueaynal88625@gmail.com\",\"phone\":\"7099210704\",\"store\":\"Aynui Hoaqe\",\"type\":\"book\"}', 'neutral', NULL, '2026-01-10 07:06:21'),
(233, 58, NULL, 'internal_note', 'bhadva call hi nahi utha raha hai - Demo sent on whatsapp\n', 'neutral', 2, '2026-01-10 07:21:47'),
(234, 130, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 03:47:52'),
(235, 131, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 03:55:12'),
(236, 132, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 04:35:56'),
(237, 133, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 05:44:03'),
(238, 134, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 06:09:12'),
(239, 135, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 06:50:38'),
(240, 129, NULL, 'system_event', 'Lead enriched via import: Added Campaign', 'neutral', 1, '2026-01-10 07:59:01'),
(241, 129, NULL, 'call_log', 'Outgoing call initiated to 7099210704', 'neutral', 1, '2026-01-10 08:11:08'),
(242, 129, NULL, 'system_event', 'Updated score to cold', 'neutral', 1, '2026-01-10 08:13:01'),
(243, 129, NULL, 'internal_note', 'he have webiste, i ask for the requirement but it cuts the call\n', 'neutral', 1, '2026-01-10 08:14:33'),
(244, 129, NULL, 'internal_note', 'And black list my contact number 🥹', 'neutral', 1, '2026-01-10 08:15:20'),
(245, 129, NULL, 'system_event', 'Updated stage to contacted', 'neutral', 1, '2026-01-10 08:15:41'),
(246, 135, NULL, 'call_log', 'Outgoing call initiated to +917297896821', 'neutral', 1, '2026-01-10 08:16:08'),
(247, 135, NULL, 'system_event', 'Updated stage to contacted', 'neutral', 1, '2026-01-10 08:17:31'),
(248, 135, NULL, 'internal_note', 'number is not in the network area followup needs\n', 'neutral', 1, '2026-01-10 08:18:13'),
(249, 135, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:18:16'),
(250, 129, NULL, 'system_event', 'Assigned lead to Harry', 'neutral', 1, '2026-01-10 08:18:26'),
(251, 134, NULL, 'call_log', 'Outgoing call initiated to +917291009329', 'neutral', 1, '2026-01-10 08:19:20'),
(252, 134, NULL, 'internal_note', 'bc naam sunte hi cut kr diya ', 'neutral', 1, '2026-01-10 08:20:04'),
(253, 134, NULL, 'system_event', 'Updated stage to lost', 'neutral', 1, '2026-01-10 08:20:18'),
(254, 133, NULL, 'call_log', 'Outgoing call initiated to +917995268026', 'neutral', 1, '2026-01-10 08:21:00'),
(255, 133, NULL, 'internal_note', 'call did not picked up.\n', 'neutral', 1, '2026-01-10 08:22:00'),
(256, 133, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:22:03'),
(257, 132, NULL, 'call_log', 'Outgoing call initiated to +918928314312', 'neutral', 1, '2026-01-10 08:22:30'),
(258, 132, NULL, 'internal_note', 'Sala merko bolata hai 30000 mahina kamata hu, mera koi business nahi hai, but aap merko bolo me kaha pesa dalu 7-8 hazar rupe ki merko waps mile😂', 'neutral', 1, '2026-01-10 08:27:01'),
(259, 132, NULL, 'system_event', 'Updated stage to lost', 'neutral', 1, '2026-01-10 08:27:26'),
(260, 131, NULL, 'call_log', 'Outgoing call initiated to +919523896348', 'neutral', 1, '2026-01-10 08:28:03'),
(261, 131, NULL, 'internal_note', 'bhai yh kon log hai inhe pta nahi hai website hotu kya hai', 'neutral', 1, '2026-01-10 08:29:20'),
(262, 131, NULL, 'system_event', 'Updated stage to lost', 'neutral', 1, '2026-01-10 08:29:25'),
(263, 130, NULL, 'call_log', 'Outgoing call initiated to +919638973438', 'neutral', 1, '2026-01-10 08:29:50'),
(264, 130, NULL, 'system_event', 'Updated stage to contacted', 'neutral', 1, '2026-01-10 08:31:13'),
(265, 130, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:37:18'),
(266, 130, NULL, 'internal_note', 'ask me to leave massage on the whats app, he have e-com business(got to know from whatsapp profile). can be a good lead waiting for the reply\n', 'neutral', 1, '2026-01-10 08:38:26'),
(267, 128, NULL, 'call_log', 'Outgoing call initiated to +919667277316', 'neutral', 1, '2026-01-10 08:39:14'),
(268, 128, NULL, 'internal_note', 'number is out of network leave with whatsapp massge', 'neutral', 1, '2026-01-10 08:40:37'),
(269, 128, NULL, 'whatsapp_msg', 'Opened WhatsApp chat with Himanshu Sharma', 'neutral', 1, '2026-01-10 08:40:45'),
(270, 128, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:47:30'),
(271, 127, NULL, 'call_log', 'Outgoing call initiated to +917607553305', 'neutral', 1, '2026-01-10 08:48:02'),
(272, 127, NULL, 'internal_note', 'Kob bhara form? Koha bhara form? Konsi Website? Hame nau banwani... thank you', 'neutral', 1, '2026-01-10 08:51:01'),
(273, 126, NULL, 'call_log', 'Outgoing call initiated to +917054599398', 'neutral', 1, '2026-01-10 08:51:39'),
(274, 126, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:51:55'),
(275, 126, NULL, 'internal_note', 'number is out of network', 'neutral', 1, '2026-01-10 08:52:08'),
(276, 125, NULL, 'call_log', 'Outgoing call initiated to +919918745493', 'neutral', 1, '2026-01-10 08:52:19'),
(277, 125, NULL, 'internal_note', 'Number is swiched off', 'neutral', 1, '2026-01-10 08:52:43'),
(278, 125, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:52:46'),
(279, 124, NULL, 'call_log', 'Outgoing call initiated to +918882147510', 'neutral', 1, '2026-01-10 08:52:59'),
(280, 124, NULL, 'system_event', 'Updated stage to follow_up_required', 'neutral', 1, '2026-01-10 08:53:16'),
(281, 58, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(282, 97, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(283, 120, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(284, 121, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(285, 123, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(286, 124, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(287, 125, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(288, 126, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(289, 127, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(290, 128, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(291, 130, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(292, 131, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(293, 133, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(294, 134, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(295, 129, NULL, 'system_event', 'Lead enriched via import: Added Location', 'neutral', 1, '2026-01-10 09:00:05'),
(296, 124, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:01'),
(297, 123, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:05'),
(298, 102, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:08'),
(299, 122, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:10'),
(300, 121, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:12'),
(301, 120, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:13'),
(302, 119, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 1, '2026-01-10 09:02:14'),
(303, 57, 30, 'system_event', 'Order status updated to initiated ', 'neutral', NULL, '2026-01-10 09:10:04'),
(304, 57, 30, 'system_event', 'Order status updated to payment_failed ', 'neutral', NULL, '2026-01-10 09:10:06'),
(305, 128, NULL, 'internal_note', 'ask to call back on 5:30 pm', 'neutral', 1, '2026-01-10 10:33:40'),
(306, 58, NULL, 'whatsapp_msg', 'Opened WhatsApp chat with Aman Chaurasia', 'neutral', 2, '2026-01-10 10:48:23'),
(307, 58, NULL, 'whatsapp_msg', 'Opened WhatsApp chat with Aman Chaurasia', 'neutral', 2, '2026-01-10 10:48:37'),
(308, 61, NULL, 'internal_note', 'Baat hui - he said bla bla bla - abhi nahi 2 month baad new phone lega toh kervayega (he has my contact no.)', 'neutral', 2, '2026-01-10 10:56:49'),
(309, 63, NULL, 'internal_note', 'Blocked me', 'neutral', 2, '2026-01-10 10:58:57'),
(310, 63, NULL, 'internal_note', 'Blocked me', 'neutral', 2, '2026-01-10 10:59:26'),
(311, 65, NULL, 'internal_note', 'I called - he\'ll call back', 'neutral', 2, '2026-01-10 11:03:13'),
(312, 119, NULL, 'internal_note', 'Tried 3 times - no response/time out', 'neutral', 2, '2026-01-10 11:04:59'),
(313, 121, NULL, 'internal_note', 'call didn\'t pick up', 'neutral', 2, '2026-01-10 11:07:11'),
(314, 97, NULL, 'whatsapp_msg', 'Opened WhatsApp chat with Mamta Raj', 'neutral', 2, '2026-01-10 11:08:11'),
(315, 97, NULL, 'system_event', 'Updated stage to lost', 'neutral', 2, '2026-01-10 11:08:34'),
(316, 97, NULL, 'internal_note', 'Call not connected - sent whatsapp', 'neutral', 2, '2026-01-10 11:09:07'),
(317, 122, NULL, 'internal_note', 'Phone switched off - mail sent from harshdeep@fliphat...', 'neutral', 2, '2026-01-10 11:13:29'),
(318, 57, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(319, 58, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(320, 59, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(321, 60, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(322, 97, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(323, 119, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(324, 120, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(325, 121, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:53'),
(326, 122, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(327, 123, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(328, 124, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(329, 125, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(330, 126, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(331, 127, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(332, 128, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(333, 130, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(334, 131, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(335, 132, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(336, 133, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(337, 134, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(338, 135, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(339, 129, NULL, 'system_event', 'Lead enriched via import: Added ', 'neutral', 1, '2026-01-10 11:14:54'),
(340, 102, NULL, 'internal_note', 'he submitted from the LP but on call he said he didn\'t put any enquiry', 'neutral', 2, '2026-01-10 11:15:59'),
(341, 137, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 11:03:39'),
(342, 137, NULL, 'call_log', 'Outgoing call initiated to +917602203301', 'neutral', 1, '2026-01-10 11:18:03'),
(343, 137, NULL, 'system_event', 'Updated notes to h', 'neutral', 1, '2026-01-10 11:18:25'),
(344, 137, NULL, 'system_event', 'Updated notes to hh', 'neutral', 1, '2026-01-10 11:18:25'),
(345, 137, NULL, 'system_event', 'Updated stage to lost', 'neutral', 1, '2026-01-10 11:19:18'),
(346, 137, NULL, 'internal_note', 'filled the form by mistake', 'neutral', 1, '2026-01-10 11:19:32'),
(347, 124, NULL, 'internal_note', 'I called - he said koi requirement nahi hai.', 'neutral', 2, '2026-01-10 11:20:34'),
(348, 125, NULL, 'internal_note', 'I also called- switchoff - Demo sent on whatsapp', 'neutral', 2, '2026-01-10 11:23:19'),
(349, 125, NULL, 'whatsapp_msg', 'Opened WhatsApp chat with Anita Debi9918745493', 'neutral', 2, '2026-01-10 11:25:11'),
(350, 126, NULL, 'call_log', 'Outgoing call initiated to +917054599398', 'neutral', 2, '2026-01-10 11:27:25'),
(351, 126, NULL, 'internal_note', 'no incoming on him - sent demo on whatsapp', 'neutral', 2, '2026-01-10 11:28:33'),
(352, 126, NULL, 'whatsapp_msg', 'Opened WhatsApp chat with Amar Kumar', 'neutral', 2, '2026-01-10 11:28:35'),
(353, 128, NULL, 'system_event', 'Assigned lead to Harshdeep', 'neutral', 2, '2026-01-10 11:31:07'),
(354, 137, NULL, 'system_event', 'Updated notes to hhj', 'neutral', 1, '2026-01-10 11:34:15'),
(355, 133, NULL, 'internal_note', 'positive response - interested - clothing brand, existing store - meeting tomorrow', 'neutral', 2, '2026-01-10 11:54:00'),
(356, 133, NULL, 'system_event', 'Updated score to hot', 'neutral', 2, '2026-01-10 11:54:05'),
(357, 134, NULL, 'internal_note', 'i called again - cut the call', 'neutral', 2, '2026-01-10 11:56:08'),
(358, 135, NULL, 'internal_note', 'he denied filling form.', 'neutral', 2, '2026-01-10 12:01:07'),
(359, 135, NULL, 'system_event', 'Updated stage to lost', 'neutral', 2, '2026-01-10 12:01:15'),
(360, 128, NULL, 'internal_note', 'did not pickedup the call', 'neutral', 1, '2026-01-10 12:04:30'),
(361, 129, NULL, 'internal_note', 'call busy', 'neutral', 2, '2026-01-10 12:05:45'),
(362, 128, NULL, 'internal_note', 'leave a massge on whats app\n', 'neutral', 1, '2026-01-10 12:07:23'),
(363, 138, NULL, 'system_event', 'Lead submitted via form (Campaign: 09 Jan | CBO| 5k offer (without Price) | Testing - 01)', 'neutral', 1, '2026-01-10 12:05:11'),
(364, 138, 52, 'system_event', 'Manual deal created: ₹100000', 'neutral', NULL, '2026-01-10 12:28:38'),
(365, 138, NULL, 'system_event', 'Updated Deal #52 status to paid', 'neutral', 2, '2026-01-10 12:28:41'),
(366, 138, NULL, 'system_event', 'Updated Deal #52 status to processing', 'neutral', 2, '2026-01-10 12:28:42'),
(367, 138, NULL, 'system_event', 'Updated Deal #52 status to delivered', 'neutral', 2, '2026-01-10 12:28:43'),
(368, 138, NULL, 'system_event', 'Updated Deal #52 status to getting_ready', 'neutral', 1, '2026-01-10 12:43:56'),
(369, 138, NULL, 'system_event', 'Updated Deal #52 status to draft', 'neutral', 1, '2026-01-10 12:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `page_views` int DEFAULT '0',
  `conversions` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `landing_pages`
--

INSERT INTO `landing_pages` (`id`, `slug`, `name`, `is_active`, `content`, `page_views`, `conversions`, `created_at`, `updated_at`) VALUES
(3, 'newyearonly', 'New Year Launch (5k)', 1, '{\"settings\":{\"theme_color\":\"red\",\"dark_mode\":true,\"show_timer\":true,\"timer_end_date\":\"2026-01-15T00:00:00Z\"},\"integrations\":{\"google_analytics_id\":\"\",\"facebook_pixel_id\":\" 4444452462449435\",\"custom_head_script\":\"\"},\"cta_configuration\":{\"primary_mode\":\"lead_form\",\"modes\":{\"razorpay_api\":{\"enabled\":true,\"amount\":4999,\"success_url\":\"\",\"button_text\":\"Get Instant Access\"},\"payment_link\":{\"enabled\":false,\"url\":\"\",\"open_in_new_tab\":true,\"button_text\":\"Get Instant Access\"},\"booking\":{\"enabled\":false,\"provider\":\"calendly\",\"url\":\"\",\"button_text\":\"Book a Strategy Call\"},\"lead_form\":{\"enabled\":false,\"button_text\":\"Get Instant Access\"}}},\"hero\":{\"announcement_badge\":\"FLASH SALE LIVE\",\"headline\":\"Transform Your Website in 24 Hours\",\"subheadline\":\"The only offer you need to launch your own profitable e-commerce brand from scratch. Professional guidance, complete setup, and a scalable system included.\",\"video_type\":\"hosted\",\"video_src\":\"/Videos/5k LP.mp4\",\"thumbnail_src\":\"/Photos/5k-video-cover.jpg\",\"cta_text\":\"Get Instant Access\"},\"pricing\":{\"sale_price\":5000,\"original_price\":15000,\"payment_link\":\"https://rzp.io/rzp/UXqxhqx6\",\"title\":\"Limited Time Offer\",\"description\":\"Founder Kickstarter Offer\",\"button_text\":\"Buy Now\",\"features\":[\"Complete e-commerce website\",\"Admin dashboard included\",\"Payment gateway integration\",\"Free hosting for 1st year\",\"Basic SEO setup\",\"Email automation setup\"]},\"features_config\":{\"headline\":\"Get more value from your tools\",\"subheadline\":\"Connect your tools, connect your teams. With everything included, your ecommerce journey is just a click away.\"},\"problem_section\":{\"enabled\":true,\"title\":\"Does This Sound Like You?\",\"subtitle\":\"Sounds familiar?\",\"cards\":[{\"title\":\"CHAOTIC SALES\",\"heading\":\"Relying on Instagram, WhatsApp & random ads for sales?\",\"text\":\"No real system. No control. Just juggling DMs, posts, and hoping today converts better than yesterday.\",\"img\":\"/Photos/Overwhelmed entrepreneur amidst digital chaos.png\"},{\"title\":\"SUBSCRIPTION FATIGUE\",\"heading\":\"Tired of monthly platform fees eating your profit?\",\"text\":\"Paying every month for your own store — and still feeling like you don’t really own it.\",\"img\":\"/Photos/Facing financial stress and overdue bills.png\"},{\"title\":\"LOCKED & LIMITED\",\"heading\":\"Stuck with “upgrade required” and limited control?\",\"text\":\"Want to customize, scale, or grow — but the platform keeps saying no unless you pay more.\",\"img\":\"/Photos/Tech trouble and upgrade frustration.png\"}]},\"live_demos\":{\"enabled\":true,\"title\":\"Experience the Power\",\"description\":\"Don\'t just take our word for it. Explore the live store and the powerful admin panel behind it.\",\"items\":[{\"title\":\"Live Demo Store\",\"subtitle\":\"Customer Experience\",\"desc\":\"See how your customers will browse and buy from your brand.\",\"video\":\"/Videos/webpreview.mp4\",\"link\":\"https://demo.fliphatmedia.com/\",\"action\":\"Visit Store\",\"icon\":\"ShoppingBag\",\"color\":\"from-red-600/20 to-orange-600/20\"},{\"title\":\"Admin Dashboard\",\"subtitle\":\"Business Control\",\"desc\":\"Control everything from products and orders to payments.\",\"video\":\"/Videos/dashpreview.mp4\",\"link\":\"https://demo.fliphatmedia.com/admin\",\"action\":\"Try Admin Panel\",\"icon\":\"LayoutDashboard\",\"color\":\"from-red-600/20 to-orange-600/20\"}]},\"order_flow\":{\"enabled\":true,\"title\":\"Experience the Seamless Buying Flow\",\"subtitle\":\"Your customers get a world-class shopping experience from product to payment.\",\"items\":[{\"title\":\"Browse Products\",\"desc\":\"Your customers browse your beautiful store.\",\"image\":\"/Photos/Orderflow01.png\",\"icon\":\"ShoppingBag\"},{\"title\":\"Add to Cart\",\"desc\":\"Seamless one-click add to cart experience.\",\"image\":\"/Photos/Orderflow02.png\",\"icon\":\"ShoppingCart\"},{\"title\":\"Checkout\",\"desc\":\"Simple checkout page optimized for conversions.\",\"image\":\"/Photos/Orderflow04.png\",\"icon\":\"CreditCard\"}]},\"comparison_table\":{\"enabled\":true,\"badge\":\"Don\'t Get Trapped by Subscriptions\",\"title\":\"Compare & Save\",\"subtitle\":\"See exactly how much you save by switching to the founder-friendly model.\",\"rows\":[{\"name\":\"Setup Cost\",\"fliphat\":\"One-time Payment\",\"shopify\":\"Monthly Subscription\",\"description\":\"Pay once and own your store forever vs renting it every month.\"},{\"name\":\"Monthly Fees\",\"fliphat\":\"₹ 0 / month\",\"shopify\":\"₹ 1,994 / month +\",\"description\":\"Save ~₹24,000 every year in platform fees alone.\"},{\"name\":\"Transaction Fees\",\"fliphat\":\"0% Commission\",\"shopify\":\"2.0% per sale\",\"description\":\"Keep 100% of your hard-earned revenue.\"}]},\"setup_process\":{\"enabled\":true,\"badge\":\"Fast Track\",\"title\":\"From Idea to Brand in 24 Hours\",\"subtitle\":\"We\'ve optimized the launch process. No drag-and-drop headaches. Just results.\",\"items\":[{\"step\":\"01\",\"title\":\"Share Requirements\",\"desc\":\"Fill a structured form with your product details, colors, and vision. Takes 5 mins.\",\"icon\":\"ClipboardList\"},{\"step\":\"02\",\"title\":\"We Develop\",\"desc\":\"Our pro team builds your store, sets up payments, and configures shipping.\",\"icon\":\"Code2\"},{\"step\":\"03\",\"title\":\"Launch & Train\",\"desc\":\"Handover in 24 hours. We give you a 1:1 training session to manage your empire.\",\"icon\":\"Rocket\"}]},\"marquee\":{\"enabled\":true,\"text\":\"FOUNDER KICKSTARTER OFFER ₹ 5000 ONLY\"},\"features\":[{\"title\":\"Your Own Website\",\"description\":\"A professional, mobile-responsive e-commerce store with your own domain included.\",\"icon\":\"Laptop\"},{\"title\":\"User-Friendly Dashboard\",\"description\":\"All your data in one place. Intuitive interface to view sales, inventory and customer insights.\",\"icon\":\"BarChart\"},{\"title\":\"Real-Time Insights\",\"description\":\"Stay up to date with instant analytics. React quickly to trends and optimize your sales.\",\"icon\":\"Zap\"},{\"title\":\"Marketing Tools\",\"description\":\"Email automation, discount codes, and abandoned cart recovery tools built right in.\",\"icon\":\"Rocket\"}],\"testimonials\":[{\"name\":\"Rajesh S.\",\"role\":\"Founder, UrbanKicks Delhi\",\"content\":\"I was paying ₹2000/month just for Shopify. With FliphatMedia, I paid once and now I own my store completely. The UPI integration is flawless for my customers.\",\"location\":\"New Delhi\",\"initials\":\"RS\"},{\"name\":\"Priya Patel\",\"role\":\"Owner, EthnicWeave\",\"content\":\"My saree business needed a premium website. The team helped me setup everything in 24 hours. My sales have increased by 40% since launching.\",\"location\":\"Ahmedabad\",\"initials\":\"PP\"},{\"name\":\"Amit Verma\",\"role\":\"CEO, TechGadgets Hub\",\"content\":\"The admin dashboard is actually better than what I used before. I can track my inventory and fulfill orders from my phone. Highly recommended.\",\"location\":\"Mumbai\",\"initials\":\"AV\"},{\"name\":\"Sneha Reddy\",\"role\":\"Co-founder, OrganicLife\",\"content\":\"Finally a platform that understands Indian e-commerce. The shipping integration with Shiprocket was a lifesaver for our delivery process.\",\"location\":\"Bangalore\",\"initials\":\"SR\"},{\"name\":\"Vikram Malhotra\",\"role\":\"Director, VMFitness\",\"content\":\"Zero monthly fees is a game changer. I used that extra money to run more ads. The site speed is blazing fast even with 500+ products.\",\"location\":\"Gurgaon\",\"initials\":\"VM\"},{\"name\":\"Anjali Gupta\",\"role\":\"Owner, DecorDreams\",\"content\":\"I was skeptical about the \'one-time cost\' but it\'s real. No hidden fees. The support team is very helpful and they speak Hindi too!\",\"location\":\"Pune\",\"initials\":\"AG\"}],\"faq\":[{\"question\":\"Is this really a one-time payment?\",\"answer\":\"Yes! Unlike Shopify or Wix, you don\'t pay us monthly platform fees. You own the code and the store. The only recurring cost after 1 year is standard hosting (approx ₹3k/year).\"},{\"question\":\"Do I need technical knowledge?\",\"answer\":\"Zero. We set up everything for you. You get a simple admin panel (like Amazon seller dashboard) to add products and view orders.\"},{\"question\":\"How long until I go live?\",\"answer\":\"Once you share your product details and requirements, we guarantee your store will be ready for launch within 24 hours.\"}]}', 147, 0, '2026-01-06 00:14:37', '2026-01-10 12:17:20'),
(4, 'lifetimeoffer', 'Lifetime Agency (12k)', 1, '{\"settings\":{\"theme_color\":\"red\",\"dark_mode\":true,\"show_timer\":true,\"timer_end_date\":\"2026-01-15T00:00:00Z\"},\"integrations\":{\"google_analytics_id\":\"\",\"facebook_pixel_id\":\"\",\"custom_head_script\":\"\"},\"cta_configuration\":{\"primary_mode\":\"lead_form\",\"modes\":{\"razorpay_api\":{\"enabled\":true,\"amount\":4999,\"success_url\":\"\",\"button_text\":\"Get Instant Access\"},\"payment_link\":{\"enabled\":false,\"url\":\"\",\"open_in_new_tab\":true,\"button_text\":\"Get Instant Access\"},\"booking\":{\"enabled\":false,\"provider\":\"calendly\",\"url\":\"\",\"button_text\":\"Book a Strategy Call\"},\"lead_form\":{\"enabled\":false,\"button_text\":\"Get Instant Access\"}}},\"hero\":{\"announcement_badge\":\"PREMIUM OFFER\",\"headline\":\"Transform Your Website in 24 Hours\",\"subheadline\":\"The only offer you need to launch your own profitable e-commerce brand from scratch. Professional guidance, complete setup, and a scalable system included.\",\"video_type\":\"hosted\",\"video_src\":\"/Videos/12k LP.mp4\",\"thumbnail_src\":\"/Photos/12k-video-cover.jpg\",\"cta_text\":\"Get Instant Access\"},\"pricing\":{\"sale_price\":12000,\"original_price\":36000,\"payment_link\":\"https://rzp.io/rzp/UXqxhqx6\",\"title\":\"Exclusive Lifetime Deal\",\"description\":\"Everything You Need to Scale\",\"button_text\":\"Get Access Now\",\"features\":[\"Complete e-commerce website\",\"Admin dashboard included\",\"Payment gateway integration\",\"Free hosting for 1st year\",\"Basic SEO setup\",\"Email automation setup\"]},\"features_config\":{\"headline\":\"Get more value from your tools\",\"subheadline\":\"Connect your tools, connect your teams. With everything included, your ecommerce journey is just a click away.\"},\"problem_section\":{\"enabled\":true,\"title\":\"Does This Sound Like You?\",\"subtitle\":\"Sounds familiar?\",\"cards\":[{\"title\":\"CHAOTIC SALES\",\"heading\":\"Relying on Instagram, WhatsApp & random ads for sales?\",\"text\":\"No real system. No control. Just juggling DMs, posts, and hoping today converts better than yesterday.\",\"img\":\"/Photos/Overwhelmed entrepreneur amidst digital chaos.png\"},{\"title\":\"SUBSCRIPTION FATIGUE\",\"heading\":\"Tired of monthly platform fees eating your profit?\",\"text\":\"Paying every month for your own store — and still feeling like you don’t really own it.\",\"img\":\"/Photos/Facing financial stress and overdue bills.png\"},{\"title\":\"LOCKED & LIMITED\",\"heading\":\"Stuck with “upgrade required” and limited control?\",\"text\":\"Want to customize, scale, or grow — but the platform keeps saying no unless you pay more.\",\"img\":\"/Photos/Tech trouble and upgrade frustration.png\"}]},\"live_demos\":{\"enabled\":true,\"title\":\"Experience the Power\",\"description\":\"Don\'t just take our word for it. Explore the live store and the powerful admin panel behind it.\",\"items\":[{\"title\":\"Live Demo Store\",\"subtitle\":\"Customer Experience\",\"desc\":\"See how your customers will browse and buy from your brand.\",\"video\":\"/Videos/webpreview.mp4\",\"link\":\"https://demo.fliphatmedia.com/\",\"action\":\"Visit Store\",\"icon\":\"ShoppingBag\",\"color\":\"from-red-600/20 to-orange-600/20\"},{\"title\":\"Admin Dashboard\",\"subtitle\":\"Business Control\",\"desc\":\"Control everything from products and orders to payments.\",\"video\":\"/Videos/dashpreview.mp4\",\"link\":\"https://demo.fliphatmedia.com/admin\",\"action\":\"Try Admin Panel\",\"icon\":\"LayoutDashboard\",\"color\":\"from-red-600/20 to-orange-600/20\"}]},\"order_flow\":{\"enabled\":true,\"title\":\"Experience the Seamless Buying Flow\",\"subtitle\":\"Your customers get a world-class shopping experience from product to payment.\",\"items\":[{\"title\":\"Browse Products\",\"desc\":\"Your customers browse your beautiful store.\",\"image\":\"/Photos/Orderflow01.png\",\"icon\":\"ShoppingBag\"},{\"title\":\"Add to Cart\",\"desc\":\"Seamless one-click add to cart experience.\",\"image\":\"/Photos/Orderflow02.png\",\"icon\":\"ShoppingCart\"},{\"title\":\"Checkout\",\"desc\":\"Simple checkout page optimized for conversions.\",\"image\":\"/Photos/Orderflow04.png\",\"icon\":\"CreditCard\"}]},\"comparison_table\":{\"enabled\":true,\"badge\":\"Don\'t Get Trapped by Subscriptions\",\"title\":\"Compare & Save\",\"subtitle\":\"See exactly how much you save by switching to the founder-friendly model.\",\"rows\":[{\"name\":\"Setup Cost\",\"fliphat\":\"One-time Payment\",\"shopify\":\"Monthly Subscription\",\"description\":\"Pay once and own your store forever vs renting it every month.\"},{\"name\":\"Monthly Fees\",\"fliphat\":\"₹ 0 / month\",\"shopify\":\"₹ 1,994 / month +\",\"description\":\"Save ~₹24,000 every year in platform fees alone.\"},{\"name\":\"Transaction Fees\",\"fliphat\":\"0% Commission\",\"shopify\":\"2.0% per sale\",\"description\":\"Keep 100% of your hard-earned revenue.\"}]},\"setup_process\":{\"enabled\":true,\"badge\":\"Fast Track\",\"title\":\"From Idea to Brand in 24 Hours\",\"subtitle\":\"We\'ve optimized the launch process. No drag-and-drop headaches. Just results.\",\"items\":[{\"step\":\"01\",\"title\":\"Share Requirements\",\"desc\":\"Fill a structured form with your product details, colors, and vision. Takes 5 mins.\",\"icon\":\"ClipboardList\"},{\"step\":\"02\",\"title\":\"We Develop\",\"desc\":\"Our pro team builds your store, sets up payments, and configures shipping.\",\"icon\":\"Code2\"},{\"step\":\"03\",\"title\":\"Launch & Train\",\"desc\":\"Handover in 24 hours. We give you a 1:1 training session to manage your empire.\",\"icon\":\"Rocket\"}]},\"marquee\":{\"enabled\":true,\"text\":\"LIFETIME ACCESS OFFER ₹ 12000 ONLY\"},\"features\":[{\"title\":\"Your Own Website\",\"description\":\"A professional, mobile-responsive e-commerce store with your own domain included.\",\"icon\":\"Laptop\"},{\"title\":\"User-Friendly Dashboard\",\"description\":\"All your data in one place. Intuitive interface to view sales, inventory and customer insights.\",\"icon\":\"BarChart\"},{\"title\":\"Real-Time Insights\",\"description\":\"Stay up to date with instant analytics. React quickly to trends and optimize your sales.\",\"icon\":\"Zap\"},{\"title\":\"Marketing Tools\",\"description\":\"Email automation, discount codes, and abandoned cart recovery tools built right in.\",\"icon\":\"Rocket\"}],\"testimonials\":[{\"name\":\"Rajesh S.\",\"role\":\"Founder, UrbanKicks Delhi\",\"content\":\"I was paying ₹2000/month just for Shopify. With FliphatMedia, I paid once and now I own my store completely. The UPI integration is flawless for my customers.\",\"location\":\"New Delhi\",\"initials\":\"RS\"},{\"name\":\"Priya Patel\",\"role\":\"Owner, EthnicWeave\",\"content\":\"My saree business needed a premium website. The team helped me setup everything in 24 hours. My sales have increased by 40% since launching.\",\"location\":\"Ahmedabad\",\"initials\":\"PP\"},{\"name\":\"Amit Verma\",\"role\":\"CEO, TechGadgets Hub\",\"content\":\"The admin dashboard is actually better than what I used before. I can track my inventory and fulfill orders from my phone. Highly recommended.\",\"location\":\"Mumbai\",\"initials\":\"AV\"},{\"name\":\"Sneha Reddy\",\"role\":\"Co-founder, OrganicLife\",\"content\":\"Finally a platform that understands Indian e-commerce. The shipping integration with Shiprocket was a lifesaver for our delivery process.\",\"location\":\"Bangalore\",\"initials\":\"SR\"},{\"name\":\"Vikram Malhotra\",\"role\":\"Director, VMFitness\",\"content\":\"Zero monthly fees is a game changer. I used that extra money to run more ads. The site speed is blazing fast even with 500+ products.\",\"location\":\"Gurgaon\",\"initials\":\"VM\"},{\"name\":\"Anjali Gupta\",\"role\":\"Owner, DecorDreams\",\"content\":\"I was skeptical about the \'one-time cost\' but it\'s real. No hidden fees. The support team is very helpful and they speak Hindi too!\",\"location\":\"Pune\",\"initials\":\"AG\"}],\"faq\":[{\"question\":\"Is this really a one-time payment?\",\"answer\":\"Yes! Unlike Shopify or Wix, you don\'t pay us monthly platform fees. You own the code and the store. The only recurring cost after 1 year is standard hosting (approx ₹3k/year).\"},{\"question\":\"Do I need technical knowledge?\",\"answer\":\"Zero. We set up everything for you. You get a simple admin panel (like Amazon seller dashboard) to add products and view orders.\"},{\"question\":\"How long until I go live?\",\"answer\":\"Once you share your product details and requirements, we guarantee your store will be ready for launch within 24 hours.\"}]}', 64, 0, '2026-01-06 00:14:37', '2026-01-10 05:31:48'),
(8, 'ecomnewyear', 'New Year Launch (5k without price)', 1, '{\"settings\":{\"theme_color\":\"red\",\"dark_mode\":true,\"show_timer\":true,\"timer_end_date\":\"2026-01-15T00:00:00Z\"},\"integrations\":{\"google_analytics_id\":\"\",\"facebook_pixel_id\":\"4444452462449435\",\"custom_head_script\":\"\"},\"cta_configuration\":{\"primary_mode\":\"lead_form\",\"modes\":{\"razorpay_api\":{\"enabled\":true,\"amount\":4999,\"success_url\":\"\",\"button_text\":\"Get Instant Access\"},\"payment_link\":{\"enabled\":false,\"url\":\"\",\"open_in_new_tab\":true,\"button_text\":\"Get Instant Access\"},\"booking\":{\"enabled\":false,\"provider\":\"calendly\",\"url\":\"\",\"button_text\":\"Book a Strategy Call\"},\"lead_form\":{\"enabled\":false,\"button_text\":\"Get Instant Access\"}}},\"hero\":{\"announcement_badge\":\"FLASH SALE LIVE\",\"headline\":\"Transform Your Webiste in 24 Hours\",\"subheadline\":\"The only offer you need to launch your own profitable e-commerce brand from scratch. Professional guidance, complete setup, and a scalable system included.\",\"video_type\":\"hosted\",\"video_src\":\"/Videos/5k LP.mp4\",\"thumbnail_src\":\"/Photos/5k-video-cover.jpg\",\"cta_text\":\"Get Instant Access\"},\"pricing\":{\"sale_price\":5000,\"original_price\":15000,\"payment_link\":\"https://rzp.io/rzp/UXqxhqx6\",\"title\":\"Limited Time Offer\",\"description\":\"Founder Kickstarter Offer\",\"button_text\":\"Buy Now\",\"features\":[\"Complete e-commerce website\",\"Admin dashboard included\",\"Payment gateway integration\",\"Free hosting for 1st year\",\"Basic SEO setup\",\"Email automation setup\"]},\"features_config\":{\"headline\":\"Get more value from your tools\",\"subheadline\":\"Connect your tools, connect your teams. With everything included, your ecommerce journey is just a click away.\"},\"problem_section\":{\"enabled\":true,\"title\":\"Does This Sound Like You?\",\"subtitle\":\"Sounds familiar?\",\"cards\":[{\"title\":\"CHAOTIC SALES\",\"heading\":\"Relying on Instagram, WhatsApp & random ads for sales?\",\"text\":\"No real system. No control. Just juggling DMs, posts, and hoping today converts better than yesterday.\",\"img\":\"/Photos/Overwhelmed entrepreneur amidst digital chaos.png\"},{\"title\":\"SUBSCRIPTION FATIGUE\",\"heading\":\"Tired of monthly platform fees eating your profit?\",\"text\":\"Paying every month for your own store — and still feeling like you don’t really own it.\",\"img\":\"/Photos/Facing financial stress and overdue bills.png\"},{\"title\":\"LOCKED & LIMITED\",\"heading\":\"Stuck with “upgrade required” and limited control?\",\"text\":\"Want to customize, scale, or grow — but the platform keeps saying no unless you pay more.\",\"img\":\"/Photos/Tech trouble and upgrade frustration.png\"}]},\"live_demos\":{\"enabled\":true,\"title\":\"Experience the Power\",\"description\":\"Don\'t just take our word for it. Explore the live store and the powerful admin panel behind it.\",\"items\":[{\"title\":\"Live Demo Store\",\"subtitle\":\"Customer Experience\",\"desc\":\"See how your customers will browse and buy from your brand.\",\"video\":\"/Videos/webpreview.mp4\",\"link\":\"https://demo.fliphatmedia.com/\",\"action\":\"Visit Store\",\"icon\":\"ShoppingBag\",\"color\":\"from-red-600/20 to-orange-600/20\"},{\"title\":\"Admin Dashboard\",\"subtitle\":\"Business Control\",\"desc\":\"Control everything from products and orders to payments.\",\"video\":\"/Videos/dashpreview.mp4\",\"link\":\"https://demo.fliphatmedia.com/admin\",\"action\":\"Try Admin Panel\",\"icon\":\"LayoutDashboard\",\"color\":\"from-red-600/20 to-orange-600/20\"}]},\"order_flow\":{\"enabled\":true,\"title\":\"Experience the Seamless Buying Flow\",\"subtitle\":\"Your customers get a world-class shopping experience from product to payment.\",\"items\":[{\"title\":\"Browse Products\",\"desc\":\"Your customers browse your beautiful store.\",\"image\":\"/Photos/Orderflow01.png\",\"icon\":\"ShoppingBag\"},{\"title\":\"Add to Cart\",\"desc\":\"Seamless one-click add to cart experience.\",\"image\":\"/Photos/Orderflow02.png\",\"icon\":\"ShoppingCart\"},{\"title\":\"Checkout\",\"desc\":\"Simple checkout page optimized for conversions.\",\"image\":\"/Photos/Orderflow04.png\",\"icon\":\"CreditCard\"}]},\"comparison_table\":{\"enabled\":true,\"badge\":\"Don\'t Get Trapped by Subscriptions\",\"title\":\"Compare & Save\",\"subtitle\":\"See exactly how much you save by switching to the founder-friendly model.\",\"rows\":[{\"name\":\"Setup Cost\",\"fliphat\":\"One-time Payment\",\"shopify\":\"Monthly Subscription\",\"description\":\"Pay once and own your store forever vs renting it every month.\"},{\"name\":\"Monthly Fees\",\"fliphat\":\"₹ 0 / month\",\"shopify\":\"₹ 1,994 / month +\",\"description\":\"Save ~₹24,000 every year in platform fees alone.\"},{\"name\":\"Transaction Fees\",\"fliphat\":\"0% Commission\",\"shopify\":\"2.0% per sale\",\"description\":\"Keep 100% of your hard-earned revenue.\"}]},\"setup_process\":{\"enabled\":true,\"badge\":\"Fast Track\",\"title\":\"From Idea to Brand in 24 Hours\",\"subtitle\":\"We\'ve optimized the launch process. No drag-and-drop headaches. Just results.\",\"items\":[{\"step\":\"01\",\"title\":\"Share Requirements\",\"desc\":\"Fill a structured form with your product details, colors, and vision. Takes 5 mins.\",\"icon\":\"ClipboardList\"},{\"step\":\"02\",\"title\":\"We Develop\",\"desc\":\"Our pro team builds your store, sets up payments, and configures shipping.\",\"icon\":\"Code2\"},{\"step\":\"03\",\"title\":\"Launch & Train\",\"desc\":\"Handover in 24 hours. We give you a 1:1 training session to manage your empire.\",\"icon\":\"Rocket\"}]},\"marquee\":{\"enabled\":true,\"text\":\"FOUNDER KICKSTARTER OFFER ₹ 5000 ONLY\"},\"features\":[{\"title\":\"Your Own Website\",\"description\":\"A professional, mobile-responsive e-commerce store with your own domain included.\",\"icon\":\"Laptop\"},{\"title\":\"User-Friendly Dashboard\",\"description\":\"All your data in one place. Intuitive interface to view sales, inventory and customer insights.\",\"icon\":\"BarChart\"},{\"title\":\"Real-Time Insights\",\"description\":\"Stay up to date with instant analytics. React quickly to trends and optimize your sales.\",\"icon\":\"Zap\"},{\"title\":\"Marketing Tools\",\"description\":\"Email automation, discount codes, and abandoned cart recovery tools built right in.\",\"icon\":\"Rocket\"}],\"testimonials\":[{\"name\":\"Rajesh S.\",\"role\":\"Founder, UrbanKicks Delhi\",\"content\":\"I was paying ₹2000/month just for Shopify. With FliphatMedia, I paid once and now I own my store completely. The UPI integration is flawless for my customers.\",\"location\":\"New Delhi\",\"initials\":\"RS\"},{\"name\":\"Priya Patel\",\"role\":\"Owner, EthnicWeave\",\"content\":\"My saree business needed a premium website. The team helped me setup everything in 24 hours. My sales have increased by 40% since launching.\",\"location\":\"Ahmedabad\",\"initials\":\"PP\"},{\"name\":\"Amit Verma\",\"role\":\"CEO, TechGadgets Hub\",\"content\":\"The admin dashboard is actually better than what I used before. I can track my inventory and fulfill orders from my phone. Highly recommended.\",\"location\":\"Mumbai\",\"initials\":\"AV\"},{\"name\":\"Sneha Reddy\",\"role\":\"Co-founder, OrganicLife\",\"content\":\"Finally a platform that understands Indian e-commerce. The shipping integration with Shiprocket was a lifesaver for our delivery process.\",\"location\":\"Bangalore\",\"initials\":\"SR\"},{\"name\":\"Vikram Malhotra\",\"role\":\"Director, VMFitness\",\"content\":\"Zero monthly fees is a game changer. I used that extra money to run more ads. The site speed is blazing fast even with 500+ products.\",\"location\":\"Gurgaon\",\"initials\":\"VM\"},{\"name\":\"Anjali Gupta\",\"role\":\"Owner, DecorDreams\",\"content\":\"I was skeptical about the \'one-time cost\' but it\'s real. No hidden fees. The support team is very helpful and they speak Hindi too!\",\"location\":\"Pune\",\"initials\":\"AG\"}],\"faq\":[{\"question\":\"Is this really a one-time payment?\",\"answer\":\"Yes! Unlike Shopify or Wix, you don\'t pay us monthly platform fees. You own the code and the store. The only recurring cost after 1 year is standard hosting (approx ₹3k/year).\"},{\"question\":\"Do I need technical knowledge?\",\"answer\":\"Zero. We set up everything for you. You get a simple admin panel (like Amazon seller dashboard) to add products and view orders.\"},{\"question\":\"How long until I go live?\",\"answer\":\"Once you share your product details and requirements, we guarantee your store will be ready for launch within 24 hours.\"}]}', 91, 0, '2026-01-06 07:41:44', '2026-01-10 05:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `lead_reads`
--

CREATE TABLE `lead_reads` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `lead_id` int NOT NULL,
  `last_read_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_reads`
--

INSERT INTO `lead_reads` (`id`, `admin_id`, `lead_id`, `last_read_at`) VALUES
(1, 1, 123, '2026-01-10 11:16:21'),
(2, 1, 129, '2026-01-10 12:05:45'),
(12, 1, 135, '2026-01-10 12:01:15'),
(18, 1, 134, '2026-01-10 11:56:08'),
(23, 1, 133, '2026-01-10 11:54:05'),
(29, 1, 132, '2026-01-10 09:35:40'),
(35, 1, 131, '2026-01-10 11:32:49'),
(40, 1, 130, '2026-01-10 11:30:43'),
(48, 1, 128, '2026-01-10 12:07:23'),
(55, 1, 127, '2026-01-10 11:29:40'),
(59, 1, 126, '2026-01-10 11:28:35'),
(64, 1, 125, '2026-01-10 11:25:45'),
(69, 1, 124, '2026-01-10 11:20:34'),
(80, 1, 62, '2026-01-10 10:56:56'),
(88, 1, 58, '2026-01-10 10:48:37'),
(91, 1, 59, '2026-01-10 10:50:40'),
(92, 1, 61, '2026-01-10 10:56:49'),
(98, 1, 63, '2026-01-10 10:59:26'),
(102, 1, 65, '2026-01-10 11:03:13'),
(104, 1, 119, '2026-01-10 11:04:59'),
(107, 1, 121, '2026-01-10 11:07:11'),
(110, 1, 97, '2026-01-10 11:09:07'),
(115, 1, 122, '2026-01-10 11:13:29'),
(118, 1, 102, '2026-01-10 11:15:59'),
(124, 1, 137, '2026-01-10 12:06:06'),
(170, 1, 138, '2026-01-10 12:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `lead_scores`
--

CREATE TABLE `lead_scores` (
  `id` int NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'gray',
  `emoji` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '',
  `display_order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_scores`
--

INSERT INTO `lead_scores` (`id`, `value`, `label`, `color`, `emoji`, `display_order`, `is_active`, `created_at`) VALUES
(1, 'hot', 'HOT', 'red', '🔥', 1, 1, '2026-01-09 11:29:42'),
(2, 'warm', 'WARM', 'yellow', '🌤️', 2, 1, '2026-01-09 11:29:42'),
(3, 'cold', 'COLD', 'gray', '❄️', 3, 1, '2026-01-09 11:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `lead_stages`
--

CREATE TABLE `lead_stages` (
  `id` int NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'gray',
  `display_order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_stages`
--

INSERT INTO `lead_stages` (`id`, `value`, `label`, `color`, `display_order`, `is_active`, `created_at`) VALUES
(1, 'new', 'New Lead', 'gray', 1, 1, '2026-01-09 11:25:16'),
(2, 'follow_up_required', 'Follow Up Req.', 'amber', 2, 1, '2026-01-09 11:25:16'),
(3, 'follow_up_done', 'Follow Up Done', 'blue', 3, 1, '2026-01-09 11:25:16'),
(4, 'qualified', 'Qualified', 'emerald', 4, 1, '2026-01-09 11:25:16'),
(5, 'contacted', 'Contacted', 'blue', 5, 1, '2026-01-09 11:25:16'),
(6, 'proposal_sent', 'Proposed', 'purple', 6, 1, '2026-01-09 11:25:16'),
(7, 'negotiation', 'Negotiating', 'orange', 7, 1, '2026-01-09 11:25:16'),
(8, 'won', 'Won 💰', 'green', 8, 1, '2026-01-09 11:25:16'),
(9, 'lost', 'Lost', 'gray', 9, 1, '2026-01-09 11:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` enum('task_assigned','comment_added','mention','task_status_change','due_date_approaching') COLLATE utf8mb4_general_ci NOT NULL,
  `reference_id` int NOT NULL,
  `related_entity_id` int DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('new_lead','initiated','payment_failed','paid','onboarding_pending','processing','delivered','cancelled') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'initiated',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `source` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'Website',
  `customer_id` int DEFAULT NULL,
  `razorpay_order_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoice_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proposal_status` enum('draft','sent','accepted','declined') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'draft',
  `due_date` datetime DEFAULT NULL,
  `razorpay_payment_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'INR',
  `payment_mode` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `onboarding_status` enum('pending','completed') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `amount`, `status`, `created_at`, `updated_at`, `source`, `customer_id`, `razorpay_order_id`, `invoice_url`, `proposal_status`, `due_date`, `razorpay_payment_id`, `currency`, `payment_mode`, `onboarding_status`) VALUES
(30, 5000.00, 'payment_failed', '2026-01-07 08:27:12', '2026-01-10 09:10:06', 'Website', 57, 'MANUAL_1767774432807', NULL, 'draft', NULL, NULL, 'INR', NULL, 'pending'),
(52, 100000.00, 'delivered', '2026-01-10 12:28:38', '2026-01-10 12:28:43', 'Website', 138, 'MANUAL_1768048118846', NULL, 'draft', NULL, NULL, 'INR', NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `project_submissions`
--

CREATE TABLE `project_submissions` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `brand_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assets_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `raw_data_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `submission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `setting_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `setting_value` text COLLATE utf8mb4_general_ci,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'FliphatMedia', 'Site name', '2026-01-05 18:09:02', '2026-01-05 18:09:02'),
(2, 'offer_end_date', '2026-12-31T23:59', 'Lifetime Offer (12k) end date', '2026-01-05 18:09:02', '2026-01-05 18:09:02'),
(3, 'newyear_offer_date', '2026-01-31T23:59', 'New Year Offer (5k) end date', '2026-01-05 18:09:02', '2026-01-05 18:09:02'),
(4, 'razorpay_key_id', 'harrymailbox11@gmail.com', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01'),
(5, 'razorpay_key_secret', 'FlipHat2025!', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01'),
(6, 'facebook_pixel_id', '', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01'),
(7, 'google_analytics_id', '', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01'),
(8, 'facebook_page_id', '712903961911804', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01'),
(9, 'facebook_access_token', 'EAAUSQvCCJAkBQTZAQUIweAUaWq1KkQBvux051N5ollt2j0VgFs9GiZBqcesgnfw0IArdktCrd8UckZBPWvvAyIZBKx0D1wHGXisHy8ipNB1lZACcuFNWOkN7quoaXxWhHmD7rWV6JAx7QfpsGwnTnikiV6sbZCpZB6AYw1C3ZCEOQnTKtHznzYrwo1u1PnAZBhtlZA', NULL, '2026-01-06 09:08:01', '2026-01-06 11:43:47'),
(10, 'facebook_app_secret', '59133f5665b8306821b360ff85c2837e', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01'),
(11, 'webhook_verify_token', 'fliphat2025', NULL, '2026-01-06 09:08:01', '2026-01-06 09:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int NOT NULL,
  `setting_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `setting_value` text COLLATE utf8mb4_general_ci,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `setting_key`, `setting_value`, `description`, `updated_at`, `created_at`) VALUES
(1, 'razorpay_key_id', '', 'Razorpay API Key ID', '2026-01-05 17:45:12', '2026-01-05 17:45:12'),
(2, 'razorpay_key_secret', '', 'Razorpay API Key Secret', '2026-01-05 17:45:12', '2026-01-05 17:45:12'),
(3, 'google_analytics_id', '', 'Google Analytics Measurement ID', '2026-01-05 17:49:58', '2026-01-05 17:49:58'),
(4, 'facebook_pixel_id', '', 'Facebook Pixel ID', '2026-01-05 17:49:58', '2026-01-05 17:49:58'),
(5, 'site_name', 'FliphatMedia', 'Site Name', '2026-01-05 17:49:58', '2026-01-05 17:49:58'),
(6, 'support_email', '', 'Support Email Address', '2026-01-05 17:49:58', '2026-01-05 17:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_accounts`
--

CREATE TABLE `smtp_accounts` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'gmail, outlook, sendgrid, mailgun, ses, custom_smtp',
  `host` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `imap_host` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `port` int NOT NULL,
  `imap_port` int DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `imap_user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `encrypted_password` text COLLATE utf8mb4_general_ci NOT NULL,
  `imap_encrypted_password` text COLLATE utf8mb4_general_ci,
  `oauth_refresh_token` text COLLATE utf8mb4_general_ci,
  `oauth_access_token` text COLLATE utf8mb4_general_ci,
  `oauth_expires_at` datetime DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dkim_selector` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dkim_private_key` text COLLATE utf8mb4_general_ci COMMENT 'Encrypted',
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  `region` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_synced_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smtp_accounts`
--

INSERT INTO `smtp_accounts` (`id`, `name`, `provider`, `host`, `imap_host`, `port`, `imap_port`, `username`, `imap_user`, `encrypted_password`, `imap_encrypted_password`, `oauth_refresh_token`, `oauth_access_token`, `oauth_expires_at`, `from_email`, `from_name`, `dkim_selector`, `dkim_private_key`, `created_by`, `created_at`, `updated_at`, `is_active`, `region`, `last_synced_at`) VALUES
(1, 'test', 'custom', 'mail.connectharish.online', NULL, 587, NULL, 'noreply@connectharish.online', NULL, '603f2c478636a8bb77f11a6a3e85e574:d8f448b350455b3a3ba03a4fdc4f9b32', NULL, NULL, NULL, NULL, 'noreply@connectharish.online', 'test', NULL, NULL, 1, '2026-01-09 23:31:47', '2026-01-10 00:28:48', 1, NULL, NULL),
(3, 'Test', 'custom', 'smtp.hostinger.com', ' imap.hostinger.com', 465, 993, 'test@fliphatmedia.com', 'test@fliphatmedia.com', 'ea135973c09046ad9197cd086237ac09:1d8d96630540a0ccc2f289f0bf0ac4e1', NULL, NULL, NULL, NULL, 'test@fliphatmedia.com', 'Test Email', NULL, NULL, 1, '2026-01-10 00:44:14', '2026-01-10 13:08:33', 1, NULL, '2026-01-10 13:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `description`, `updated_at`) VALUES
('', 'offer_end_date', '2026-01-01T01:00', 'End date for New Year Offer (5k)', '2026-01-05 20:49:32.000'),
('03b7cec5-796c-4fe8-97d7-dc078fe95120', 'razorpay_key_id', 'harrymailbox11@gmail.com', NULL, '2026-01-06 11:08:20.058'),
('4671c35d-1ed9-463a-9ed4-4c0dd1aa53eb', 'facebook_app_secret', '59133f5665b8306821b360ff85c2837e', NULL, '2026-01-06 11:08:20.071'),
('5b3b79bf-ea4a-11f0-8a4c-cc28aa18b10c', 'newyear_offer_date', '2026-01-20T00:00', 'End date for New Year Offer (5k)', '2026-01-05 20:52:32.000'),
('7fabc4de-2e0b-428d-8b0a-04a1d8e5b66e', 'google_analytics_id', '', NULL, '2026-01-06 11:08:20.066'),
('92f977d5-84f6-4e4e-9a60-191c6d94044b', 'facebook_page_id', '712903961911804', NULL, '2026-01-06 11:08:20.068'),
('992ad26e-0969-4192-b370-a64977b3a063', 'webhook_verify_token', 'fliphat2025', NULL, '2026-01-06 11:08:20.072'),
('a6a55d85-6789-410d-8e01-09216dbf638a', 'facebook_pixel_id', '', NULL, '2026-01-06 11:08:20.064'),
('b03a8e7e-1fe9-4a35-b216-6fa7bd55d61c', 'razorpay_key_secret', 'FlipHat2025!', NULL, '2026-01-06 11:08:20.060'),
('db3b98e0-ae33-4f9b-a523-38cc61017080', 'facebook_access_token', 'EAAUSQvCCJAkBQRVPfEmPKZCUkbZBDB4kvdnjDNwKRpBz9WDH0ZBI9qucnxEfq7dJiAp46sFgkkoTE7ssPbXSEu56v1ZCcz9dtIZCPCNkRUTpOYr5ztkGoHwFhMNs9yQtMBy94yng2nZAtk4rLjqPtl59hyGc3wPiM7rBNLR4JgdpzZABCXasXnZCmcqAQpoK5T3O', NULL, '2026-01-06 11:08:20.069'),
('f900d6e1-bf49-4607-8e85-d580a38ca71a', 'site_name', 'FliphatMedia', NULL, '2026-01-06 11:08:20.057');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `related_order_id` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `due_date` timestamp NULL DEFAULT NULL,
  `status` enum('open','in_progress','done') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'open',
  `priority` enum('high','medium','low') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `status_changed_by` int DEFAULT NULL,
  `status_changed_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `related_order_id`, `assigned_to`, `title`, `description`, `due_date`, `status`, `priority`, `created_at`, `customer_id`, `created_by`, `status_changed_by`, `status_changed_at`, `deleted_at`, `updated_at`) VALUES
(9, NULL, 2, 'Call him and follow-up tomorrow', NULL, '2026-01-08 11:16:00', 'done', 'medium', '2026-01-07 17:42:21', 58, 2, 2, '2026-01-10 09:11:16', NULL, '2026-01-10 09:11:16'),
(10, NULL, 2, 'Followup required tomorrow', NULL, '2026-01-08 00:00:00', 'done', 'medium', '2026-01-07 17:48:53', 60, 2, 2, '2026-01-10 09:11:14', NULL, '2026-01-10 09:11:14'),
(11, NULL, 2, 'sent the Demo | Follow-up required', NULL, '2026-01-08 00:00:00', 'done', 'medium', '2026-01-07 17:54:16', 61, 2, 2, '2026-01-10 09:11:13', NULL, '2026-01-10 09:11:13'),
(12, NULL, 2, 'Followup required', NULL, '2026-01-08 00:00:00', 'done', 'medium', '2026-01-07 18:00:54', 62, 2, 1, '2026-01-10 09:12:33', NULL, '2026-01-10 09:12:33'),
(13, NULL, 2, 'Didn\'t pickedup follow up required', NULL, '2026-01-08 00:00:00', 'done', 'medium', '2026-01-07 18:05:12', 63, 2, 1, '2026-01-10 09:12:34', NULL, '2026-01-10 09:12:34'),
(25, NULL, NULL, 'follow-up on this lead', NULL, '2026-01-15 00:00:00', 'open', 'medium', '2026-01-10 12:29:11', 138, 2, NULL, NULL, NULL, '2026-01-10 12:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `task_assignees`
--

CREATE TABLE `task_assignees` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `user_id` int NOT NULL,
  `assigned_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_attachments`
--

CREATE TABLE `task_attachments` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `storage_path` varchar(512) COLLATE utf8mb4_general_ci NOT NULL,
  `file_size` int DEFAULT '0',
  `mime_type` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `uploaded_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `author_id` int NOT NULL,
  `body` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `edited_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_comments`
--

INSERT INTO `task_comments` (`id`, `task_id`, `author_id`, `body`, `created_at`, `edited_at`) VALUES
(2, 13, 1, 'hi', '2026-01-09 09:27:35', NULL),
(3, 13, 1, 'lead is not responding', '2026-01-09 11:22:29', NULL),
(4, 13, 1, 'test', '2026-01-09 15:17:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

CREATE TABLE `task_history` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `changed_by` int DEFAULT NULL,
  `change_type` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `field_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_general_ci,
  `new_value` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_history`
--

INSERT INTO `task_history` (`id`, `task_id`, `changed_by`, `change_type`, `field_name`, `old_value`, `new_value`, `created_at`) VALUES
(2, 13, 1, 'comment_added', NULL, NULL, 'hi', '2026-01-09 09:27:35'),
(3, 13, 1, 'comment_added', NULL, NULL, 'lead is not responding', '2026-01-09 11:22:29'),
(4, 13, 1, 'comment_added', NULL, NULL, 'test ', '2026-01-09 15:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `task_reads`
--

CREATE TABLE `task_reads` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `user_id` int NOT NULL,
  `last_seen_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_reads`
--

INSERT INTO `task_reads` (`id`, `task_id`, `user_id`, `last_seen_at`, `created_at`) VALUES
(1, 13, 1, '2026-01-10 11:56:14', '2026-01-09 15:15:19'),
(2, 12, 1, '2026-01-10 09:11:14', '2026-01-09 15:15:57'),
(5, 12, 2, '2026-01-10 09:11:23', '2026-01-09 15:23:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_key` (`email`);

--
-- Indexes for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `admin_login_history`
--
ALTER TABLE `admin_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `admin_preferences`
--
ALTER TABLE `admin_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indexes for table `admin_sessions`
--
ALTER TABLE `admin_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `comment_reads`
--
ALTER TABLE `comment_reads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_comment_read` (`comment_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_key` (`email`),
  ADD UNIQUE KEY `facebook_lead_id` (`facebook_lead_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smtp_account_id` (`smtp_account_id`),
  ADD KEY `idx_direction_folder` (`direction`,`folder`),
  ADD KEY `idx_message_id` (`message_id`);

--
-- Indexes for table `email_attachments`
--
ALTER TABLE `email_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `email_bounces`
--
ALTER TABLE `email_bounces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_send_jobs`
--
ALTER TABLE `email_send_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_tracking_events`
--
ALTER TABLE `email_tracking_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `interactions`
--
ALTER TABLE `interactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`);

--
-- Indexes for table `lead_reads`
--
ALTER TABLE `lead_reads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_read` (`admin_id`,`lead_id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `lead_scores`
--
ALTER TABLE `lead_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`);

--
-- Indexes for table `lead_stages`
--
ALTER TABLE `lead_stages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_user_unread` (`user_id`,`is_read`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_customer` (`customer_id`);

--
-- Indexes for table `project_submissions`
--
ALTER TABLE `project_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `smtp_accounts`
--
ALTER TABLE `smtp_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_key_key` (`key`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_order_id` (`related_order_id`),
  ADD KEY `tasks_customer_id_fkey` (`customer_id`);

--
-- Indexes for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_task_user` (`task_id`,`user_id`);

--
-- Indexes for table `task_attachments`
--
ALTER TABLE `task_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_attachments_task` (`task_id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comments_task` (`task_id`);

--
-- Indexes for table `task_history`
--
ALTER TABLE `task_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_history_task` (`task_id`),
  ADD KEY `idx_history_type` (`change_type`);

--
-- Indexes for table `task_reads`
--
ALTER TABLE `task_reads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_task_read` (`task_id`,`user_id`),
  ADD KEY `idx_task_reads_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT for table `admin_login_history`
--
ALTER TABLE `admin_login_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `admin_preferences`
--
ALTER TABLE `admin_preferences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_sessions`
--
ALTER TABLE `admin_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_reads`
--
ALTER TABLE `comment_reads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_attachments`
--
ALTER TABLE `email_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_bounces`
--
ALTER TABLE `email_bounces`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_send_jobs`
--
ALTER TABLE `email_send_jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_tracking_events`
--
ALTER TABLE `email_tracking_events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interactions`
--
ALTER TABLE `interactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_reads`
--
ALTER TABLE `lead_reads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `lead_scores`
--
ALTER TABLE `lead_scores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lead_stages`
--
ALTER TABLE `lead_stages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `project_submissions`
--
ALTER TABLE `project_submissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `smtp_accounts`
--
ALTER TABLE `smtp_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `task_assignees`
--
ALTER TABLE `task_assignees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_attachments`
--
ALTER TABLE `task_attachments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task_history`
--
ALTER TABLE `task_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task_reads`
--
ALTER TABLE `task_reads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  ADD CONSTRAINT `admin_activity_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD CONSTRAINT `admin_activity_logs_admin_id_fkey` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD CONSTRAINT `admin_login_logs_admin_id_fkey` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_preferences`
--
ALTER TABLE `admin_preferences`
  ADD CONSTRAINT `admin_preferences_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_sessions`
--
ALTER TABLE `admin_sessions`
  ADD CONSTRAINT `admin_sessions_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_reads`
--
ALTER TABLE `comment_reads`
  ADD CONSTRAINT `comment_reads_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `task_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_reads_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`smtp_account_id`) REFERENCES `smtp_accounts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `email_attachments`
--
ALTER TABLE `email_attachments`
  ADD CONSTRAINT `email_attachments_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_tracking_events`
--
ALTER TABLE `email_tracking_events`
  ADD CONSTRAINT `email_tracking_events_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `interactions`
--
ALTER TABLE `interactions`
  ADD CONSTRAINT `interactions_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interactions_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_reads`
--
ALTER TABLE `lead_reads`
  ADD CONSTRAINT `lead_reads_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_reads_ibfk_2` FOREIGN KEY (`lead_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_submissions`
--
ALTER TABLE `project_submissions`
  ADD CONSTRAINT `project_submissions_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_related_order_id_fkey` FOREIGN KEY (`related_order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD CONSTRAINT `task_assignees_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_attachments`
--
ALTER TABLE `task_attachments`
  ADD CONSTRAINT `task_attachments_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_reads`
--
ALTER TABLE `task_reads`
  ADD CONSTRAINT `task_reads_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_reads_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
