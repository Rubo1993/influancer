-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 16 2020 г., 12:28
-- Версия сервера: 5.7.30-0ubuntu0.18.04.1
-- Версия PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `influencer`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(41, 'action_scheduler/migration_hook', 'complete', '2020-06-26 12:28:58', '2020-06-26 12:28:58', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1593174538;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1593174538;}', 1, 1, '2020-06-26 12:29:50', '2020-06-26 12:29:50', 0, NULL),
(42, 'action_scheduler/migration_hook', 'complete', '2020-06-26 12:30:50', '2020-06-26 12:30:50', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1593174650;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1593174650;}', 1, 1, '2020-06-26 12:31:01', '2020-06-26 12:31:01', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 41, 'action created', '2020-06-26 12:27:58', '2020-06-26 12:27:58'),
(2, 41, 'action started via WP Cron', '2020-06-26 12:29:50', '2020-06-26 12:29:50'),
(3, 41, 'action complete via WP Cron', '2020-06-26 12:29:50', '2020-06-26 12:29:50'),
(4, 42, 'action created', '2020-06-26 12:29:50', '2020-06-26 12:29:50'),
(5, 42, 'action started via WP Cron', '2020-06-26 12:31:01', '2020-06-26 12:31:01'),
(6, 42, 'action complete via WP Cron', '2020-06-26 12:31:01', '2020-06-26 12:31:01');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-06-22 09:38:30', '2020-06-22 09:38:30', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_mondula_form_wizards`
--

DROP TABLE IF EXISTS `wp_mondula_form_wizards`;
CREATE TABLE `wp_mondula_form_wizards` (
  `id` mediumint(9) NOT NULL,
  `json` mediumtext NOT NULL,
  `version` varchar(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `wp_mondula_form_wizards`
--

INSERT INTO `wp_mondula_form_wizards` (`id`, `json`, `version`, `date`) VALUES
(1, '{\"title\":\"My Multi Step Form\",\"steps\":[{\"title\":\"Step_1\",\"headline\":\"\",\"copy_text\":\"\",\"parts\":[{\"title\":\"Registration\",\"blocks\":[{\"type\":\"paragraph\",\"text\":\"\"},{\"type\":\"email\",\"label\":\"ssssssssss\",\"required\":\"false\"}]}]},{\"title\":\"Step_2\",\"headline\":\"\",\"copy_text\":\"\",\"parts\":[{\"title\":\"Step_2\",\"blocks\":[]}]}],\"settings\":{\"thankyou\":\"\",\"to\":\"sport-199368@mail.ru\",\"frommail\":\"sport-199368@mail.ru\",\"fromname\":\"\",\"subject\":\"Registration\",\"header\":\"sport-199368@mail.ru\",\"headers\":\"\",\"replyto\":\"no-reply\"}}', '1.5.6', '2020-06-24 14:41:09');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://influencer.ghost-services.com', 'yes'),
(2, 'home', 'http://influencer.ghost-services.com', 'yes'),
(3, 'blogname', 'Influencer', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'robert.azizbekyan@yandex.ru', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=14&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:23:\"loco-translate/loco.php\";i:1;s:29:\"wp-mail-smtp/wp_mail_smtp.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:92:\"/home/ghost12/apache/influencer.ghost-services.com/wp-content/themes/influencer_gh/style.css\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'influencer_gh', 'yes'),
(41, 'stylesheet', 'influencer_gh', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'pending', 'yes'),
(48, 'db_version', '47018', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:3:{i:2;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&ndash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '14', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1608370709', 'yes'),
(94, 'initial_db_version', '47018', 'yes'),
(95, 'wp_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"loco_admin\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:10:\"translator\";a:2:{s:4:\"name\";s:10:\"Translator\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:10:\"loco_admin\";b:1;}}s:7:\"pending\";a:2:{s:4:\"name\";s:7:\"Pending\";s:12:\"capabilities\";a:0:{}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:8:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:8:\"search-2\";i:3;s:14:\"recent-posts-2\";i:4;s:17:\"recent-comments-2\";i:5;s:10:\"archives-2\";i:6;s:12:\"categories-2\";i:7;s:6:\"meta-2\";}s:14:\"footer-connect\";a:1:{i:0;s:16:\"social_link_gh-3\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'cron', 'a:7:{i:1594650718;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1594651110;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1594676310;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1594719510;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1594719517;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1594719518;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'recovery_keys', 'a:0:{}', 'yes'),
(118, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1592821571;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(129, 'can_compress_scripts', '0', 'no'),
(154, 'theme_mods_influencer', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(155, 'current_theme', 'Influencer', 'yes'),
(156, 'theme_mods_influencer_gh', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:11:\"header-menu\";i:2;s:11:\"footer-menu\";i:3;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(157, 'theme_switched', '', 'yes'),
(165, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(166, 'recently_activated', 'a:4:{s:39:\"multi-step-form/mondula-form-wizard.php\";i:1593009978;s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";i:1593009208;s:36:\"contact-form-7/wp-contact-form-7.php\";i:1593009199;s:25:\"wp-user-frontend/wpuf.php\";i:1593008944;}', 'yes'),
(173, 'fs_active_plugins', 'O:8:\"stdClass\":3:{s:7:\"plugins\";a:1:{s:41:\"contact-form-7-multi-step-module/freemius\";O:8:\"stdClass\":4:{s:7:\"version\";s:5:\"2.3.1\";s:4:\"type\";s:6:\"plugin\";s:9:\"timestamp\";i:1593009211;s:11:\"plugin_path\";s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";}}s:7:\"abspath\";s:51:\"/home/ghost12/apache/influencer.ghost-services.com/\";s:6:\"newest\";O:8:\"stdClass\":5:{s:11:\"plugin_path\";s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";s:8:\"sdk_path\";s:41:\"contact-form-7-multi-step-module/freemius\";s:7:\"version\";s:5:\"2.3.1\";s:13:\"in_activation\";b:1;s:9:\"timestamp\";i:1593009211;}}', 'yes'),
(174, 'fs_debug_mode', '', 'yes'),
(175, 'fs_accounts', 'a:6:{s:21:\"id_slug_type_path_map\";a:1:{i:1614;a:3:{s:4:\"slug\";s:32:\"contact-form-7-multi-step-module\";s:4:\"type\";s:6:\"plugin\";s:4:\"path\";s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";}}s:11:\"plugin_data\";a:1:{s:32:\"contact-form-7-multi-step-module\";a:17:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";}s:20:\"is_network_activated\";b:0;s:17:\"install_timestamp\";i:1592850449;s:17:\"was_plugin_loaded\";b:1;s:21:\"is_plugin_new_install\";b:0;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:5:\"2.3.1\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:5:\"4.0.2\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:9:\"localhost\";s:9:\"server_ip\";s:3:\"::1\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1592850449;s:7:\"version\";s:5:\"4.0.2\";}s:15:\"prev_is_premium\";b:0;s:12:\"is_anonymous\";a:3:{s:2:\"is\";b:1;s:9:\"timestamp\";i:1592850460;s:7:\"version\";s:5:\"4.0.2\";}s:16:\"uninstall_reason\";O:8:\"stdClass\":3:{s:2:\"id\";s:2:\"15\";s:4:\"info\";s:0:\"\";s:12:\"is_anonymous\";b:0;}}}s:13:\"file_slug_map\";a:1:{s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";s:32:\"contact-form-7-multi-step-module\";}s:7:\"plugins\";a:1:{s:32:\"contact-form-7-multi-step-module\";O:9:\"FS_Plugin\":23:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:31:\"Contact Form 7 Multi-Step Forms\";s:4:\"slug\";s:32:\"contact-form-7-multi-step-module\";s:12:\"premium_slug\";s:40:\"contact-form-7-multi-step-module-premium\";s:4:\"type\";s:6:\"plugin\";s:20:\"affiliate_moderation\";b:0;s:19:\"is_wp_org_compliant\";b:1;s:22:\"premium_releases_count\";N;s:4:\"file\";s:69:\"contact-form-7-multi-step-module/contact-form-7-multi-step-module.php\";s:7:\"version\";s:5:\"4.0.2\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:14:\"premium_suffix\";s:3:\"Pro\";s:7:\"is_live\";b:1;s:9:\"bundle_id\";N;s:17:\"bundle_public_key\";N;s:10:\"public_key\";s:32:\"pk_b445061ad8b540f6a89c2c4f4df19\";s:10:\"secret_key\";N;s:2:\"id\";s:4:\"1614\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:9:\"unique_id\";s:32:\"9080eeb86c1b78aad69fb4873ff63b79\";s:13:\"admin_notices\";a:1:{s:32:\"contact-form-7-multi-step-module\";a:0:{}}}', 'yes'),
(176, 'fs_gdpr', 'a:1:{s:2:\"u1\";a:1:{s:8:\"required\";b:0;}}', 'yes'),
(177, 'fs_api_cache', 'a:0:{}', 'no'),
(207, '_transient_health-check-site-status-result', '{\"good\":7,\"recommended\":8,\"critical\":2}', 'yes'),
(225, 'wpuf_installed', '1592986629', 'yes'),
(228, 'wpuf_version', '3.3.1', 'yes'),
(229, 'widget_wpuf_login_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(231, 'wpuf_expiry_posts_last_cleaned', 'June 24, 2020 8:17 am', 'yes'),
(232, 'wpuf_general', 'a:0:{}', 'yes'),
(233, 'wpuf_frontend_posting', 'a:0:{}', 'yes'),
(234, 'wpuf_dashboard', 'a:0:{}', 'yes'),
(235, 'wpuf_my_account', 'a:0:{}', 'yes'),
(236, 'wpuf_profile', 'a:0:{}', 'yes'),
(237, 'wpuf_payment', 'a:0:{}', 'yes'),
(238, 'wpuf_mails', 'a:0:{}', 'yes'),
(239, 'wpuf_privacy', 'a:0:{}', 'yes'),
(250, 'wpuf_whats_new', 'a:1:{s:5:\"3.3.1\";b:1;}', 'yes'),
(251, 'wp-user-frontend_allow_tracking', 'no', 'yes'),
(253, 'wpuf_address_options', 'a:7:{s:12:\"show_address\";b:0;s:7:\"country\";b:0;s:5:\"state\";b:0;s:9:\"address_1\";b:0;s:9:\"address_2\";b:0;s:4:\"city\";b:0;s:3:\"zip\";b:0;}', 'yes'),
(267, 'mondula_form_wizard_version', '1.5.6', 'yes'),
(269, 'fw_settings_email', '', 'yes'),
(270, 'fw_settings_styling', '', 'yes'),
(271, 'fw_settings_captcha', '', 'yes'),
(272, 'fw_settings_plus', '', 'yes'),
(325, 'loco_recent', 'a:4:{s:1:\"c\";s:21:\"Loco_data_RecentItems\";s:1:\"v\";i:0;s:1:\"d\";a:1:{s:6:\"bundle\";a:1:{s:19:\"theme.influencer_gh\";i:1593122032;}}s:1:\"t\";i:1593122032;}', 'no'),
(330, 'WPLANG', 'ru_RU', 'yes'),
(335, 'recovery_mode_email_last_sent', '1593537983', 'yes'),
(348, 'widget_social_link_gh', 'a:2:{i:3;a:2:{s:5:\"title\";s:7:\"CONNECT\";s:4:\"text\";s:16:\"Let us be social\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(369, 'wp_mail_smtp_initial_version', '2.1.1', 'no'),
(370, 'wp_mail_smtp_version', '2.1.1', 'no'),
(371, 'wp_mail_smtp', 'a:8:{s:4:\"mail\";a:6:{s:10:\"from_email\";s:27:\"robert.azizbekyan@yandex.ru\";s:9:\"from_name\";s:10:\"Influencer\";s:6:\"mailer\";s:4:\"smtp\";s:11:\"return_path\";b:0;s:16:\"from_email_force\";b:1;s:15:\"from_name_force\";b:0;}s:4:\"smtp\";a:7:{s:7:\"autotls\";b:1;s:4:\"auth\";b:1;s:4:\"host\";s:14:\"smtp.yandex.ru\";s:10:\"encryption\";s:3:\"ssl\";s:4:\"port\";i:465;s:4:\"user\";s:27:\"robert.azizbekyan@yandex.ru\";s:4:\"pass\";s:6:\"199368\";}s:7:\"smtpcom\";a:2:{s:7:\"api_key\";s:0:\"\";s:7:\"channel\";s:0:\"\";}s:11:\"pepipostapi\";a:1:{s:7:\"api_key\";s:0:\"\";}s:10:\"sendinblue\";a:1:{s:7:\"api_key\";s:0:\"\";}s:7:\"mailgun\";a:3:{s:7:\"api_key\";s:0:\"\";s:6:\"domain\";s:0:\"\";s:6:\"region\";s:2:\"US\";}s:8:\"sendgrid\";a:1:{s:7:\"api_key\";s:0:\"\";}s:5:\"gmail\";a:2:{s:9:\"client_id\";s:0:\"\";s:13:\"client_secret\";s:0:\"\";}}', 'no'),
(372, 'wp_mail_smtp_activated_time', '1593174477', 'no'),
(373, 'action_scheduler_hybrid_store_demarkation', '40', 'yes'),
(374, 'schema-ActionScheduler_StoreSchema', '3.0.1593174478', 'yes'),
(375, 'schema-ActionScheduler_LoggerSchema', '2.0.1593174478', 'yes'),
(379, 'wp_mail_smtp_migration_version', '2', 'yes'),
(380, 'wp_mail_smtp_review_notice', 'a:2:{s:4:\"time\";i:1593174478;s:9:\"dismissed\";b:0;}', 'yes'),
(381, 'action_scheduler_lock_async-request-runner', '1594650725', 'yes'),
(383, 'action_scheduler_migration_status', 'complete', 'yes'),
(402, 'wp_mail_smtp_debug', 'a:0:{}', 'no'),
(430, 'new_admin_email', 'robert.azizbekyan@yandex.ru', 'yes'),
(1190, '_fields_tik_option', 'a:7:{s:12:\"header_title\";s:40:\"The New Standard In Influencer Marketing\";s:11:\"header_text\";s:89:\"A smart tool for selecting and advertising with opinion leaders on Instagram and YouTube.\";s:7:\"blogers\";a:5:{s:8:\"bloger_1\";s:2:\"67\";s:8:\"bloger_2\";s:2:\"66\";s:8:\"bloger_3\";s:2:\"65\";s:8:\"bloger_4\";s:2:\"64\";s:8:\"bloger_5\";s:2:\"63\";}s:4:\"logo\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"phone_icon\";s:0:\"\";s:6:\"social\";a:4:{i:0;a:2:{s:3:\"url\";a:3:{s:3:\"url\";s:13:\"http://fb.com\";s:4:\"text\";s:8:\"facebook\";s:6:\"target\";s:0:\"\";}s:4:\"icon\";s:13:\"fa-facebook-f\";}i:1;a:2:{s:3:\"url\";a:3:{s:3:\"url\";s:20:\"https://twitter.com/\";s:4:\"text\";s:7:\"twitter\";s:6:\"target\";s:0:\"\";}s:4:\"icon\";s:10:\"fa-twitter\";}i:2;a:2:{s:3:\"url\";a:3:{s:3:\"url\";s:26:\"https://www.instagram.com/\";s:4:\"text\";s:9:\"instagram\";s:6:\"target\";s:0:\"\";}s:4:\"icon\";s:12:\"fa-instagram\";}i:3;a:2:{s:3:\"url\";a:3:{s:3:\"url\";s:24:\"https://www.linkedin.com\";s:4:\"text\";s:8:\"linkedin\";s:6:\"target\";s:0:\"\";}s:4:\"icon\";s:11:\"fa-linkedin\";}}}', 'yes'),
(1510, '_site_transient_timeout_theme_roots', '1594650562', 'no'),
(1511, '_site_transient_theme_roots', 'a:1:{s:13:\"influencer_gh\";s:7:\"/themes\";}', 'no'),
(1513, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.4.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1594648768;s:15:\"version_checked\";s:5:\"5.4.2\";s:12:\"translations\";a:0:{}}', 'no'),
(1514, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1594648768;s:7:\"checked\";a:1:{s:13:\"influencer_gh\";s:5:\"1.0.1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(1515, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1594648769;s:7:\"checked\";a:2:{s:23:\"loco-translate/loco.php\";s:5:\"2.4.0\";s:29:\"wp-mail-smtp/wp_mail_smtp.php\";s:5:\"2.1.1\";}s:8:\"response\";a:1:{s:29:\"wp-mail-smtp/wp_mail_smtp.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:26:\"w.org/plugins/wp-mail-smtp\";s:4:\"slug\";s:12:\"wp-mail-smtp\";s:6:\"plugin\";s:29:\"wp-mail-smtp/wp_mail_smtp.php\";s:11:\"new_version\";s:5:\"2.2.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/wp-mail-smtp/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wp-mail-smtp.2.2.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wp-mail-smtp/assets/icon-256x256.png?rev=1755440\";s:2:\"1x\";s:65:\"https://ps.w.org/wp-mail-smtp/assets/icon-128x128.png?rev=1755440\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/wp-mail-smtp/assets/banner-1544x500.png?rev=2120094\";s:2:\"1x\";s:67:\"https://ps.w.org/wp-mail-smtp/assets/banner-772x250.png?rev=2120094\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:5:\"5.5.0\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:23:\"loco-translate/loco.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/loco-translate\";s:4:\"slug\";s:14:\"loco-translate\";s:6:\"plugin\";s:23:\"loco-translate/loco.php\";s:11:\"new_version\";s:5:\"2.4.0\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/loco-translate/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/loco-translate.2.4.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/loco-translate/assets/icon-256x256.png?rev=1000676\";s:2:\"1x\";s:67:\"https://ps.w.org/loco-translate/assets/icon-128x128.png?rev=1000676\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:68:\"https://ps.w.org/loco-translate/assets/banner-772x250.jpg?rev=745046\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(1516, '_site_transient_timeout_php_check_8445f3f6d5c32e543da408dfa7e06e48', '1595253570', 'no'),
(1517, '_site_transient_php_check_8445f3f6d5c32e543da408dfa7e06e48', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(20, 14, '_edit_last', '1'),
(21, 14, '_edit_lock', '1593548495:1'),
(22, 14, 'header_title', 'The New Standard In Influencer Marketing'),
(23, 14, 'header_text', 'A smart tool for selecting and advertising with opinion leaders on Instagram and YouTube.'),
(24, 14, 'service_title', ''),
(25, 14, 'service_text', ''),
(26, 14, 'feature_title', ''),
(27, 14, 'feature_text', ''),
(28, 14, 'feature_items', 'a:1:{i:0;a:3:{s:5:\"title\";s:0:\"\";s:4:\"icon\";s:0:\"\";s:4:\"text\";s:0:\"\";}}'),
(29, 14, 'our_works_title', ''),
(30, 14, 'our_works_text', ''),
(31, 14, 'our_works_button', 'a:3:{s:3:\"url\";s:0:\"\";s:4:\"text\";s:0:\"\";s:6:\"target\";s:0:\"\";}'),
(32, 16, '_wp_attached_file', '2020/06/sirusho.jpg'),
(33, 16, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:19:\"2020/06/sirusho.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"sirusho-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"sirusho-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(34, 14, 'header_user_itm', 'a:16:{s:16:\"itm_1_like_count\";s:5:\"10369\";s:19:\"itm_1_comment_count\";s:3:\"369\";s:11:\"itm_1_image\";s:2:\"16\";s:13:\"itm_2_percent\";s:5:\" 230%\";s:18:\"itm_2_payback_text\";s:19:\"payback advertising\";s:11:\"itm_2_image\";s:2:\"17\";s:16:\"itm_3_like_count\";s:5:\"10369\";s:19:\"itm_3_comment_count\";s:3:\"369\";s:11:\"itm_3_image\";s:2:\"18\";s:13:\"itm_4_percent\";s:4:\"430%\";s:18:\"itm_4_payback_text\";s:19:\"payback advertising\";s:11:\"itm_4_image\";s:2:\"19\";s:13:\"itm_5_percent\";s:4:\"830%\";s:18:\"itm_5_payback_text\";s:19:\"payback advertising\";s:16:\"itm_5_view_count\";s:6:\"10 369\";s:11:\"itm_5_image\";s:2:\"20\";}'),
(35, 17, '_wp_attached_file', '2020/06/nazeni.jpg'),
(36, 17, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:18:\"2020/06/nazeni.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"nazeni-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"nazeni-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(37, 18, '_wp_attached_file', '2020/06/arpi.jpg'),
(38, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:320;s:6:\"height\";i:320;s:4:\"file\";s:16:\"2020/06/arpi.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"arpi-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"arpi-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(39, 19, '_wp_attached_file', '2020/06/luiza.jpg'),
(40, 19, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:320;s:6:\"height\";i:320;s:4:\"file\";s:17:\"2020/06/luiza.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"luiza-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"luiza-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(41, 20, '_wp_attached_file', '2020/06/lili.jpg'),
(42, 20, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:240;s:6:\"height\";i:240;s:4:\"file\";s:16:\"2020/06/lili.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"lili-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(43, 21, '_menu_item_type', 'post_type'),
(44, 21, '_menu_item_menu_item_parent', '0'),
(45, 21, '_menu_item_object_id', '14'),
(46, 21, '_menu_item_object', 'page'),
(47, 21, '_menu_item_target', ''),
(48, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(49, 21, '_menu_item_xfn', ''),
(50, 21, '_menu_item_url', ''),
(51, 21, '_menu_item_orphaned', '1592848025'),
(52, 22, '_menu_item_type', 'post_type'),
(53, 22, '_menu_item_menu_item_parent', '0'),
(54, 22, '_menu_item_object_id', '2'),
(55, 22, '_menu_item_object', 'page'),
(56, 22, '_menu_item_target', ''),
(57, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(58, 22, '_menu_item_xfn', ''),
(59, 22, '_menu_item_url', ''),
(60, 22, '_menu_item_orphaned', '1592848025'),
(61, 23, '_menu_item_type', 'post_type'),
(62, 23, '_menu_item_menu_item_parent', '0'),
(63, 23, '_menu_item_object_id', '14'),
(64, 23, '_menu_item_object', 'page'),
(65, 23, '_menu_item_target', ''),
(66, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(67, 23, '_menu_item_xfn', ''),
(68, 23, '_menu_item_url', ''),
(70, 24, '_menu_item_type', 'post_type'),
(71, 24, '_menu_item_menu_item_parent', '0'),
(72, 24, '_menu_item_object_id', '2'),
(73, 24, '_menu_item_object', 'page'),
(74, 24, '_menu_item_target', ''),
(75, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(76, 24, '_menu_item_xfn', ''),
(77, 24, '_menu_item_url', ''),
(78, 24, '_menu_item_orphaned', '1592848028'),
(99, 14, 'software', 'a:2:{i:0;a:5:{s:13:\"software_icon\";s:20:\"fas fa-search-dollar\";s:17:\"software_menu_itm\";s:5:\"Finds\";s:19:\"software_desc_title\";s:23:\"Discover any influencer\";s:20:\"software_description\";s:244:\"With the smartest influencer search engine on the market, you can easily discover influencers by category and location.  Advanced search filters allow you to focus by influence tier, social channel, audience demographics, niche topics and more.\";s:12:\"software_img\";s:2:\"28\";}i:1;a:5:{s:13:\"software_icon\";s:16:\"fas fa-diagnoses\";s:17:\"software_menu_itm\";s:8:\" Analyze\";s:19:\"software_desc_title\";s:19:\"Influencer Research\";s:20:\"software_description\";s:234:\"Get all the insights you need to make sure you are partnering with the right people.\r\n\r\nVet any user with instant access to influencer analytics, audience demographics, top content and more to see if they fit your influencer strategy.\";s:12:\"software_img\";s:2:\"29\";}}'),
(100, 28, '_wp_attached_file', '2020/06/find.png'),
(101, 28, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1790;s:6:\"height\";i:1160;s:4:\"file\";s:16:\"2020/06/find.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"find-300x194.png\";s:5:\"width\";i:300;s:6:\"height\";i:194;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:17:\"find-1024x664.png\";s:5:\"width\";i:1024;s:6:\"height\";i:664;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"find-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"find-768x498.png\";s:5:\"width\";i:768;s:6:\"height\";i:498;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:17:\"find-1536x995.png\";s:5:\"width\";i:1536;s:6:\"height\";i:995;s:9:\"mime-type\";s:9:\"image/png\";}s:3:\"big\";a:4:{s:4:\"file\";s:17:\"find-1055x684.png\";s:5:\"width\";i:1055;s:6:\"height\";i:684;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(102, 29, '_wp_attached_file', '2020/06/2.png'),
(103, 29, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1792;s:6:\"height\";i:1162;s:4:\"file\";s:13:\"2020/06/2.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:13:\"2-300x195.png\";s:5:\"width\";i:300;s:6:\"height\";i:195;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:14:\"2-1024x664.png\";s:5:\"width\";i:1024;s:6:\"height\";i:664;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:13:\"2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:13:\"2-768x498.png\";s:5:\"width\";i:768;s:6:\"height\";i:498;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:14:\"2-1536x996.png\";s:5:\"width\";i:1536;s:6:\"height\";i:996;s:9:\"mime-type\";s:9:\"image/png\";}s:3:\"big\";a:4:{s:4:\"file\";s:14:\"2-1055x684.png\";s:5:\"width\";i:1055;s:6:\"height\";i:684;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(104, 30, '_wp_attached_file', '2020/06/autopay.png'),
(105, 30, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:840;s:6:\"height\";i:612;s:4:\"file\";s:19:\"2020/06/autopay.png\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"autopay-300x219.png\";s:5:\"width\";i:300;s:6:\"height\";i:219;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"autopay-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"autopay-768x560.png\";s:5:\"width\";i:768;s:6:\"height\";i:560;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(106, 14, 'auto_pay_img', '80'),
(107, 14, 'auto_pay_title', ' Payout Automation'),
(108, 14, 'auto_pay_text', 'Make a deposit to your personal account, pay bills for advertising with bloggers with one click and monthly receive all the necessary legally closing documents.'),
(109, 14, 'software_title', 'Influencer Marketing Software'),
(110, 14, 'secure_transactions_title', ' Secure transactions'),
(111, 14, 'secure_transactions_itms', 'a:3:{i:0;a:2:{s:24:\"secure_transactions_icon\";s:21:\"fas fa-file-signature\";s:24:\"secure_transactions_name\";s:19:\"Secure transactions\";}i:1;a:2:{s:24:\"secure_transactions_icon\";s:11:\"fas fa-sync\";s:24:\"secure_transactions_name\";s:19:\"Payment reservation\";}i:2;a:2:{s:24:\"secure_transactions_icon\";s:17:\"fas fa-user-check\";s:24:\"secure_transactions_name\";s:20:\"Job payment / refund\";}}'),
(112, 14, 'secure_transactions_text', 'Transfer money to bloggers for advertising through the platform. The blogger will receive the transferred amount only after he places your ad. Do not waste time and money on dishonest performers.'),
(113, 14, 'demo_part_title', 'Is Everything Influencer ?'),
(114, 14, 'demo_part_text', 'One of our product specialists will be happy to guide you through the platform.'),
(115, 31, 'wpuf_form_settings', 'a:25:{s:9:\"post_type\";s:4:\"post\";s:11:\"post_status\";s:7:\"publish\";s:11:\"post_format\";s:1:\"0\";s:11:\"default_cat\";s:2:\"-1\";s:10:\"guest_post\";s:5:\"false\";s:13:\"guest_details\";s:4:\"true\";s:10:\"name_label\";s:4:\"Name\";s:11:\"email_label\";s:5:\"Email\";s:16:\"message_restrict\";s:68:\"This page is restricted. Please Log in / Register to view this page.\";s:11:\"redirect_to\";s:4:\"post\";s:7:\"message\";s:10:\"Post saved\";s:7:\"page_id\";s:0:\"\";s:3:\"url\";s:0:\"\";s:14:\"comment_status\";s:4:\"open\";s:11:\"submit_text\";s:6:\"Submit\";s:18:\"submit_button_cond\";a:3:{s:16:\"condition_status\";s:2:\"no\";s:10:\"cond_logic\";s:3:\"any\";s:10:\"conditions\";a:1:{i:0;a:3:{s:4:\"name\";s:0:\"\";s:8:\"operator\";s:1:\"=\";s:6:\"option\";s:0:\"\";}}}s:10:\"draft_post\";s:5:\"false\";s:16:\"edit_post_status\";s:7:\"publish\";s:16:\"edit_redirect_to\";s:4:\"same\";s:14:\"update_message\";s:25:\"Post updated successfully\";s:12:\"edit_page_id\";s:0:\"\";s:8:\"edit_url\";s:0:\"\";s:12:\"subscription\";s:10:\"- Select -\";s:11:\"update_text\";s:6:\"Update\";s:12:\"notification\";a:8:{s:3:\"new\";s:2:\"on\";s:6:\"new_to\";s:13:\"admin@mail.ru\";s:11:\"new_subject\";s:16:\"New post created\";s:8:\"new_body\";s:222:\"Hi Admin, \r\n\r\nA new post has been created in your site %sitename% (%siteurl%). \r\n\r\nHere is the details: \r\nPost Title: %post_title% \r\nContent: %post_content% \r\nAuthor: %author% \r\nPost URL: %permalink% \r\nEdit URL: %editlink%\";s:4:\"edit\";s:3:\"off\";s:7:\"edit_to\";s:13:\"admin@mail.ru\";s:12:\"edit_subject\";s:22:\"A post has been edited\";s:9:\"edit_body\";s:199:\"Hi Admin, \r\n\r\nThe post \"%post_title%\" has been updated. \r\n\r\nHere is the details: \r\nPost Title: %post_title% \r\nContent: %post_content% \r\nAuthor: %author% \r\nPost URL: %permalink% \r\nEdit URL: %editlink%\";}}'),
(116, 31, 'wpuf_form_version', '3.3.1'),
(117, 32, 'wpuf_form_settings', 'a:43:{s:9:\"post_type\";s:4:\"post\";s:11:\"post_status\";s:7:\"publish\";s:11:\"post_format\";s:1:\"0\";s:11:\"redirect_to\";s:4:\"post\";s:7:\"message\";s:10:\"Post saved\";s:7:\"page_id\";s:2:\"14\";s:3:\"url\";s:0:\"\";s:14:\"comment_status\";s:4:\"open\";s:11:\"submit_text\";s:6:\"Submit\";s:10:\"draft_post\";s:5:\"false\";s:13:\"form_template\";s:0:\"\";s:16:\"edit_post_status\";s:7:\"publish\";s:16:\"edit_redirect_to\";s:4:\"same\";s:14:\"update_message\";s:25:\"Post updated successfully\";s:12:\"edit_page_id\";s:2:\"14\";s:8:\"edit_url\";s:0:\"\";s:12:\"subscription\";s:10:\"- Select -\";s:11:\"update_text\";s:6:\"Update\";s:14:\"lock_edit_post\";s:0:\"\";s:10:\"guest_post\";s:5:\"false\";s:13:\"guest_details\";s:4:\"true\";s:10:\"name_label\";s:4:\"Name\";s:11:\"email_label\";s:5:\"Email\";s:9:\"role_base\";s:5:\"false\";s:5:\"roles\";a:1:{i:0;s:13:\"administrator\";}s:16:\"message_restrict\";s:68:\"This page is restricted. Please Log in / Register to view this page.\";s:13:\"schedule_form\";s:5:\"false\";s:14:\"schedule_start\";s:0:\"\";s:12:\"schedule_end\";s:0:\"\";s:20:\"form_pending_message\";s:28:\"Form submission not started.\";s:20:\"form_expired_message\";s:24:\"Submission date expired.\";s:13:\"limit_entries\";s:5:\"false\";s:12:\"limit_number\";s:3:\"100\";s:13:\"limit_message\";s:30:\"Form submission limit exceeded\";s:15:\"payment_options\";s:5:\"false\";s:19:\"force_pack_purchase\";s:5:\"false\";s:19:\"fallback_ppp_enable\";s:5:\"false\";s:17:\"fallback_ppp_cost\";s:1:\"1\";s:19:\"enable_pay_per_post\";s:5:\"false\";s:17:\"pay_per_post_cost\";s:1:\"2\";s:14:\"label_position\";s:4:\"left\";s:13:\"use_theme_css\";s:16:\"wpuf-theme-style\";s:12:\"notification\";a:5:{s:3:\"new\";s:2:\"on\";s:6:\"new_to\";s:13:\"admin@mail.ru\";s:11:\"new_subject\";s:16:\"New post created\";s:8:\"new_body\";s:222:\"Hi Admin, \r\n\r\nA new post has been created in your site %sitename% (%siteurl%). \r\n\r\nHere is the details: \r\nPost Title: %post_title% \r\nContent: %post_content% \r\nAuthor: %author% \r\nPost URL: %permalink% \r\nEdit URL: %editlink%\";s:4:\"edit\";s:3:\"off\";}}'),
(118, 32, 'wpuf_form_version', '3.3.1'),
(119, 32, 'notifications', 'a:0:{}'),
(120, 32, 'integrations', 'a:0:{}'),
(121, 35, '_edit_last', '1'),
(122, 35, '_edit_lock', '1593205564:1'),
(123, 36, '_edit_last', '1'),
(124, 36, '_wp_page_template', 'templates/pricing.php'),
(125, 36, '_edit_lock', '1593556325:1'),
(126, 40, '_menu_item_type', 'post_type'),
(127, 40, '_menu_item_menu_item_parent', '0'),
(128, 40, '_menu_item_object_id', '36'),
(129, 40, '_menu_item_object', 'page'),
(130, 40, '_menu_item_target', ''),
(131, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(132, 40, '_menu_item_xfn', ''),
(133, 40, '_menu_item_url', ''),
(135, 41, '_edit_last', '1'),
(136, 41, 'tariff_tokens', '100'),
(137, 41, 'tariff_tokens_title', 'tokens'),
(138, 41, 'tariff_item_description', 'Get the first results.'),
(139, 41, 'event_room', ''),
(140, 41, '_edit_lock', '1593209123:1'),
(141, 42, '_edit_last', '1'),
(142, 42, 'tariff_tokens', '200'),
(143, 42, 'tariff_tokens_title', 'tokens'),
(144, 42, 'tariff_item_description', 'Get the first results.'),
(145, 42, 'event_room', ''),
(146, 42, '_edit_lock', '1593209131:1'),
(147, 43, '_edit_last', '1'),
(148, 43, 'tariff_tokens', '400'),
(149, 43, 'tariff_tokens_title', 'tokens'),
(150, 43, 'tariff_item_description', 'Get the first results.'),
(151, 43, 'event_room', ''),
(152, 43, '_edit_lock', '1593209144:1'),
(153, 44, '_edit_last', '1'),
(154, 44, 'tariff_tokens', '800'),
(155, 44, 'tariff_tokens_title', 'tokens'),
(156, 44, 'tariff_item_description', 'Get the first results.'),
(157, 44, 'event_room', ''),
(158, 44, '_edit_lock', '1593209408:1'),
(159, 35, '_wp_trash_meta_status', 'draft'),
(160, 35, '_wp_trash_meta_time', '1593205718'),
(161, 35, '_wp_desired_post_slug', ''),
(162, 36, 'tariffs_part_title', 'Join the best advertisers'),
(163, 46, '_wp_attached_file', '2020/06/flash.svg'),
(164, 44, 'tariffs_tokens_img', '46'),
(165, 43, 'tariffs_tokens_img', '46'),
(166, 42, 'tariffs_tokens_img', '46'),
(167, 41, 'tariffs_tokens_img', '46'),
(168, 41, '1_token_cost', '5 $ '),
(169, 42, '1_token_cost', '4 $ '),
(170, 43, '1_token_cost', '3 $ '),
(171, 44, '1_token_cost', '2 $ '),
(172, 42, 'the_cost_text', 'The cost of 1 token'),
(173, 41, 'the_cost_text', 'The cost of 1 token'),
(174, 43, 'the_cost_text', 'The cost of 1 token'),
(175, 44, 'the_cost_text', 'The cost of 1 token'),
(176, 44, 'tariff_tokens_count', '800'),
(177, 43, 'tariff_tokens_count', '400'),
(178, 42, 'tariff_tokens_count', '200'),
(179, 41, 'tariff_tokens_count', '100'),
(180, 44, 'price_from', '2'),
(181, 44, 'price_to', '80 $'),
(182, 43, 'price_from', '3'),
(183, 43, 'price_to', '100  $ '),
(184, 42, 'price_to', '120 $'),
(185, 41, 'price_to', '150 $'),
(186, 41, 'tariffs_item_desc', 'Invitation Cost\r\n1 blogger\r\n\r\nOn average, you can invite 20\r\nbloggers to collaborate'),
(187, 42, 'tariffs_item_desc', 'Invitation Cost\r\n1 blogger\r\n\r\nOn average, you can invite <b>20 </b>bloggers to collaborate'),
(188, 43, 'tariffs_item_desc', 'Invitation Cost\r\n1 blogger\r\n\r\nOn average, you can invite <b>20 </b>bloggers to collaborate'),
(189, 44, 'tariffs_item_desc', 'Invitation Cost\r\n1 blogger\r\n\r\nOn average, you can invite <b>20 </b>bloggers to collaborate'),
(190, 44, 'tariffs_cost', '99 $'),
(191, 43, 'tariffs_cost', '99 $'),
(192, 42, 'tariffs_cost', '99 $'),
(193, 41, 'tariffs_cost', '99 $'),
(194, 41, 'tariffs_economy', '+20%'),
(195, 42, 'tariffs_economy', '+20%'),
(196, 43, 'tariffs_economy', '+20%'),
(197, 44, 'tariffs_economy', '+20%'),
(198, 36, 'tariffs_tokens_card', 'a:3:{i:0;a:3:{s:16:\"tariffs_card_img\";s:2:\"47\";s:18:\"tariffs_card_title\";s:33:\"Tokens open access tothe platform\";s:17:\"tariffs_card_text\";s:123:\"Tokens are the internal currency of the GetBlogger platform. They are needed to invite Your chosen bloggers to collaborate.\";}i:1;a:3:{s:16:\"tariffs_card_img\";s:2:\"49\";s:18:\"tariffs_card_title\";s:34:\"Tokens open access to the platform\";s:17:\"tariffs_card_text\";s:123:\"Tokens are the internal currency of the GetBlogger platform. They are needed to invite Your chosen bloggers to collaborate.\";}i:2;a:3:{s:16:\"tariffs_card_img\";s:2:\"48\";s:18:\"tariffs_card_title\";s:34:\"Tokens open access to the platform\";s:17:\"tariffs_card_text\";s:123:\"Tokens are the internal currency of the GetBlogger platform. They are needed to invite Your chosen bloggers to collaborate.\";}}'),
(199, 47, '_wp_attached_file', '2020/06/savings.svg'),
(200, 48, '_wp_attached_file', '2020/06/fire.svg'),
(201, 49, '_wp_attached_file', '2020/06/checkmark.svg'),
(202, 51, '_edit_lock', '1593557077:1'),
(203, 51, '_edit_last', '1'),
(204, 51, '_wp_page_template', 'templates/blogger.php'),
(205, 53, '_wp_attached_file', '2020/06/free_access.svg'),
(206, 54, '_wp_attached_file', '2020/06/payment_guarantee.svg'),
(207, 55, '_wp_attached_file', '2020/06/reliable_channel.svg'),
(208, 51, 'you_will_get_title', 'You will get'),
(209, 51, 'you_will_get_items', 'a:3:{i:0;a:3:{s:7:\"itm_img\";s:2:\"72\";s:10:\"item_title\";s:11:\"Free access\";s:9:\"item_text\";s:48:\"Access to the platform for bloggers is 100% free\";}i:1;a:3:{s:7:\"itm_img\";s:2:\"73\";s:10:\"item_title\";s:33:\"Reliable channel regular earnings\";s:9:\"item_text\";s:39:\"Without intermediaries and\r\ncommissions\";}i:2;a:3:{s:7:\"itm_img\";s:2:\"74\";s:10:\"item_title\";s:26:\"Complete payment guarantee\";s:9:\"item_text\";s:69:\"Secure payments and guarantee of payment for advertising publications\";}}'),
(210, 56, '_menu_item_type', 'post_type'),
(211, 56, '_menu_item_menu_item_parent', '0'),
(212, 56, '_menu_item_object_id', '51'),
(213, 56, '_menu_item_object', 'page'),
(214, 56, '_menu_item_target', ''),
(215, 56, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(216, 56, '_menu_item_xfn', ''),
(217, 56, '_menu_item_url', ''),
(219, 57, '_wp_attached_file', '2020/06/how-it-works-01.png'),
(220, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:354;s:6:\"height\";i:144;s:4:\"file\";s:27:\"2020/06/how-it-works-01.png\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"how-it-works-01-300x122.png\";s:5:\"width\";i:300;s:6:\"height\";i:122;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"how-it-works-01-150x144.png\";s:5:\"width\";i:150;s:6:\"height\";i:144;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(221, 58, '_wp_attached_file', '2020/06/how_it_works.svg'),
(222, 51, 'how_it_works_title', 'How it works?'),
(223, 51, 'how_it_works_items', 'a:6:{i:0;a:2:{s:8:\"itm_icon\";s:14:\"fa-user-circle\";s:10:\"item_title\";s:23:\"Sign up on the platform\";}i:1;a:2:{s:8:\"itm_icon\";s:12:\"fa-share-alt\";s:10:\"item_title\";s:48:\" Link your social media accounts to the platform\";}i:2;a:2:{s:8:\"itm_icon\";s:12:\"fa-handshake\";s:10:\"item_title\";s:72:\"Get offers of cooperation directly from the best advertisers in Armenian\";}i:3;a:2:{s:8:\"itm_icon\";s:13:\"fa-mobile-alt\";s:10:\"item_title\";s:87:\"Agree on the details and terms of cooperation in a convenient messenger on the platform\";}i:4;a:2:{s:8:\"itm_icon\";s:13:\"fa-chart-area\";s:10:\"item_title\";s:45:\"Perform quality work and increase your rating\";}i:5;a:2:{s:8:\"itm_icon\";s:18:\"fa-money-check-alt\";s:10:\"item_title\";s:56:\"Issue invoices with one click and get guaranteed payment\";}}'),
(227, 62, '_edit_lock', '1593445274:1'),
(228, 62, '_edit_last', '1'),
(229, 62, 'header_user_itm', 'a:4:{s:14:\"itm_like_count\";s:0:\"\";s:17:\"itm_comment_count\";s:0:\"\";s:11:\"itm_percent\";s:0:\"\";s:16:\"itm_payback_text\";s:0:\"\";}'),
(230, 62, '_wp_trash_meta_status', 'publish'),
(231, 62, '_wp_trash_meta_time', '1593445421'),
(232, 62, '_wp_desired_post_slug', '62'),
(233, 63, '_edit_lock', '1593463942:1'),
(234, 63, '_edit_last', '1'),
(235, 63, '_thumbnail_id', '17'),
(236, 63, 'header_user_itm', 'a:10:{s:7:\"country\";s:8:\" Armenia\";s:4:\"city\";s:7:\"Yerevan\";s:4:\"year\";s:2:\"37\";s:9:\"followers\";s:5:\"65750\";s:8:\"coverage\";s:0:\"\";s:14:\"itm_like_count\";s:0:\"\";s:17:\"itm_comment_count\";s:0:\"\";s:11:\"itm_percent\";s:4:\"830%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";s:19:\"bloggers_view_count\";s:5:\"10369\";}'),
(237, 64, '_edit_lock', '1593462054:1'),
(238, 64, '_edit_last', '1'),
(239, 64, '_thumbnail_id', '19'),
(240, 64, 'header_user_itm', 'a:4:{s:14:\"itm_like_count\";s:0:\"\";s:17:\"itm_comment_count\";s:0:\"\";s:11:\"itm_percent\";s:4:\"430%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";}'),
(241, 65, '_edit_lock', '1593462017:1'),
(242, 65, '_edit_last', '1'),
(243, 65, '_thumbnail_id', '20'),
(244, 65, 'header_user_itm', 'a:4:{s:14:\"itm_like_count\";s:5:\"10369\";s:17:\"itm_comment_count\";s:3:\"369\";s:11:\"itm_percent\";s:0:\"\";s:16:\"itm_payback_text\";s:0:\"\";}'),
(245, 66, '_edit_lock', '1593461968:1'),
(246, 66, '_edit_last', '1'),
(247, 66, '_thumbnail_id', '16'),
(248, 66, 'header_user_itm', 'a:4:{s:14:\"itm_like_count\";s:2:\"50\";s:17:\"itm_comment_count\";s:2:\"60\";s:11:\"itm_percent\";s:4:\"200%\";s:16:\"itm_payback_text\";s:19:\"payback advertising\";}'),
(249, 14, '_wp_page_template', 'default'),
(250, 14, 'blogers', 'a:5:{s:8:\"bloger_1\";s:2:\"66\";s:8:\"bloger_2\";s:2:\"65\";s:8:\"bloger_3\";s:2:\"64\";s:8:\"bloger_4\";s:2:\"63\";s:8:\"bloger_5\";s:2:\"67\";}'),
(251, 36, 'feel_the_difference_title', 'Feel the difference'),
(252, 36, 'ddddddddddd', 'Feel the difference'),
(253, 67, '_edit_lock', '1593461907:1'),
(254, 67, '_edit_last', '1'),
(255, 68, '_wp_attached_file', '2020/06/наташ.jpg'),
(256, 68, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:740;s:6:\"height\";i:493;s:4:\"file\";s:22:\"2020/06/наташ.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"наташ-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"наташ-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(257, 67, '_thumbnail_id', '68'),
(258, 67, 'header_user_itm', 'a:4:{s:14:\"itm_like_count\";s:2:\"50\";s:17:\"itm_comment_count\";s:3:\"800\";s:11:\"itm_percent\";s:4:\"200%\";s:16:\"itm_payback_text\";s:19:\"payback advertising\";}'),
(259, 36, 'blogers_p', '63'),
(260, 67, 'user_itm', 'a:10:{s:7:\"country\";s:6:\"Rossia\";s:4:\"city\";s:6:\"Moskva\";s:4:\"year\";s:2:\"32\";s:9:\"followers\";s:4:\"3602\";s:8:\"coverage\";s:3:\"250\";s:14:\"itm_like_count\";s:4:\"2300\";s:17:\"itm_comment_count\";s:3:\"500\";s:11:\"itm_percent\";s:4:\"250%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";s:19:\"bloggers_view_count\";s:0:\"\";}'),
(261, 66, 'user_itm', 'a:10:{s:7:\"country\";s:7:\"Armenia\";s:4:\"city\";s:6:\"Erevan\";s:4:\"year\";s:2:\"31\";s:9:\"followers\";s:4:\"2300\";s:8:\"coverage\";s:3:\"210\";s:14:\"itm_like_count\";s:4:\"2500\";s:17:\"itm_comment_count\";s:2:\"20\";s:11:\"itm_percent\";s:4:\"250%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";s:19:\"bloggers_view_count\";s:4:\"2500\";}'),
(262, 65, 'user_itm', 'a:10:{s:7:\"country\";s:7:\"Armenia\";s:4:\"city\";s:6:\"Erevan\";s:4:\"year\";s:2:\"35\";s:9:\"followers\";s:4:\"3600\";s:8:\"coverage\";s:4:\"2350\";s:14:\"itm_like_count\";s:4:\"2541\";s:17:\"itm_comment_count\";s:2:\"10\";s:11:\"itm_percent\";s:4:\"800%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";s:19:\"bloggers_view_count\";s:3:\"230\";}'),
(263, 64, 'user_itm', 'a:10:{s:7:\"country\";s:7:\"Armenia\";s:4:\"city\";s:6:\"Erevan\";s:4:\"year\";s:2:\"48\";s:9:\"followers\";s:4:\"5023\";s:8:\"coverage\";s:4:\"3521\";s:14:\"itm_like_count\";s:4:\"2800\";s:17:\"itm_comment_count\";s:3:\"235\";s:11:\"itm_percent\";s:4:\"280%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";s:19:\"bloggers_view_count\";s:3:\"250\";}'),
(264, 63, 'user_itm', 'a:13:{s:7:\"country\";s:7:\"Armenia\";s:4:\"city\";s:6:\"Erevan\";s:4:\"year\";s:2:\"37\";s:9:\"followers\";s:4:\"8000\";s:8:\"coverage\";s:5:\"42458\";s:14:\"itm_like_count\";s:3:\"890\";s:17:\"itm_comment_count\";s:2:\"20\";s:11:\"itm_percent\";s:4:\"290%\";s:16:\"itm_payback_text\";s:23:\"payback advertising\r\n\r\n\";s:19:\"bloggers_view_count\";s:3:\"203\";s:21:\"directly__card__price\";s:6:\"1300 $\";s:19:\"agency__card__price\";s:6:\"2600 $\";s:23:\"influencer__card__price\";s:5:\"800 $\";}'),
(265, 36, 'difference_footer_message', 'By working on the platform, you save up to 30% on advertising with bloggers                '),
(266, 36, 'tarriff_message_title', 'Tokens cannot pay for advertising from bloggers.'),
(267, 36, 'tarriff_message_text', 'You pay the advertising separately for the blogger,                 without commission and intermediaries.'),
(268, 69, '_menu_item_type', 'post_type'),
(269, 69, '_menu_item_menu_item_parent', '0'),
(270, 69, '_menu_item_object_id', '14'),
(271, 69, '_menu_item_object', 'page'),
(272, 69, '_menu_item_target', ''),
(273, 69, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(274, 69, '_menu_item_xfn', ''),
(275, 69, '_menu_item_url', ''),
(277, 70, '_menu_item_type', 'post_type'),
(278, 70, '_menu_item_menu_item_parent', '0'),
(279, 70, '_menu_item_object_id', '51'),
(280, 70, '_menu_item_object', 'page'),
(281, 70, '_menu_item_target', ''),
(282, 70, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(283, 70, '_menu_item_xfn', ''),
(284, 70, '_menu_item_url', ''),
(286, 71, '_menu_item_type', 'post_type'),
(287, 71, '_menu_item_menu_item_parent', '0'),
(288, 71, '_menu_item_object_id', '36'),
(289, 71, '_menu_item_object', 'page'),
(290, 71, '_menu_item_target', ''),
(291, 71, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(292, 71, '_menu_item_xfn', ''),
(293, 71, '_menu_item_url', ''),
(295, 51, 'register_if_title', 'Register if ...'),
(296, 51, 'register_if_items', 'a:4:{i:0;a:2:{s:7:\"itm_img\";s:2:\"75\";s:10:\"item_title\";s:32:\"You blog on Instagram or YouTube\";}i:1;a:2:{s:7:\"itm_img\";s:2:\"76\";s:10:\"item_title\";s:41:\"Over 50% of your subscribers from Armenia\";}i:2;a:2:{s:7:\"itm_img\";s:2:\"77\";s:10:\"item_title\";s:28:\" You publish quality content\";}i:3;a:2:{s:7:\"itm_img\";s:2:\"78\";s:10:\"item_title\";s:40:\"You have more than 1500 real subscribers\";}}'),
(297, 72, '_wp_attached_file', '2020/06/door.svg'),
(298, 73, '_wp_attached_file', '2020/06/get.svg'),
(299, 74, '_wp_attached_file', '2020/06/credit.svg'),
(300, 75, '_wp_attached_file', '2020/06/group.svg'),
(301, 76, '_wp_attached_file', '2020/06/church.svg'),
(302, 77, '_wp_attached_file', '2020/06/content.svg'),
(303, 78, '_wp_attached_file', '2020/06/team.svg'),
(304, 80, '_wp_attached_file', '2020/06/autopay.jpg'),
(305, 80, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:626;s:6:\"height\";i:447;s:4:\"file\";s:19:\"2020/06/autopay.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"autopay-300x214.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:214;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"autopay-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-06-22 09:38:30', '2020-06-22 09:38:30', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-06-22 09:38:30', '2020-06-22 09:38:30', '', 0, 'http://influencer.ghost-services.com/?p=1', 0, 'post', '', 1),
(2, 1, '2020-06-22 09:38:30', '2020-06-22 09:38:30', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://influencer.ghost-services.com/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-06-22 09:38:30', '2020-06-22 09:38:30', '', 0, 'http://influencer.ghost-services.com/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-06-22 09:38:30', '2020-06-22 09:38:30', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://influencer.ghost-services.com.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-06-22 09:38:30', '2020-06-22 09:38:30', '', 0, 'http://influencer.ghost-services.com/?page_id=3', 0, 'page', '', 0),
(14, 1, '2020-06-22 14:40:48', '2020-06-22 14:40:48', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2020-06-30 20:23:57', '2020-06-30 20:23:57', '', 0, 'http://influencer.ghost-services.com/?page_id=14', 0, 'page', '', 0),
(15, 1, '2020-06-22 14:40:48', '2020-06-22 14:40:48', '', 'Home', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2020-06-22 14:40:48', '2020-06-22 14:40:48', '', 14, 'http://influencer.ghost-services.com/2020/06/22/14-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2020-06-22 17:14:20', '2020-06-22 17:14:20', '', 'sirusho', '', 'inherit', 'open', 'closed', '', 'sirusho', '', '', '2020-06-22 17:14:20', '2020-06-22 17:14:20', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/sirusho.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 1, '2020-06-22 17:25:14', '2020-06-22 17:25:14', '', 'nazeni', '', 'inherit', 'open', 'closed', '', 'nazeni', '', '', '2020-06-22 17:25:14', '2020-06-22 17:25:14', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/nazeni.jpg', 0, 'attachment', 'image/jpeg', 0),
(18, 1, '2020-06-22 17:25:38', '2020-06-22 17:25:38', '', 'arpi', '', 'inherit', 'open', 'closed', '', 'arpi', '', '', '2020-06-22 17:25:38', '2020-06-22 17:25:38', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/arpi.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2020-06-22 17:25:54', '2020-06-22 17:25:54', '', 'luiza', '', 'inherit', 'open', 'closed', '', 'luiza', '', '', '2020-06-22 17:25:54', '2020-06-22 17:25:54', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/luiza.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2020-06-22 17:26:09', '2020-06-22 17:26:09', '', 'lili', '', 'inherit', 'open', 'closed', '', 'lili', '', '', '2020-06-22 17:26:09', '2020-06-22 17:26:09', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/lili.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2020-06-22 17:47:04', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-22 17:47:04', '0000-00-00 00:00:00', '', 0, 'http://influencer.ghost-services.com/?p=21', 1, 'nav_menu_item', '', 0),
(22, 1, '2020-06-22 17:47:05', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-22 17:47:05', '0000-00-00 00:00:00', '', 0, 'http://influencer.ghost-services.com/?p=22', 1, 'nav_menu_item', '', 0),
(23, 1, '2020-06-22 17:48:08', '2020-06-22 17:48:08', ' ', '', '', 'publish', 'closed', 'closed', '', '23', '', '', '2020-06-30 13:44:23', '2020-06-30 13:44:23', '', 0, 'http://influencer.ghost-services.com/?p=23', 1, 'nav_menu_item', '', 0),
(24, 1, '2020-06-22 17:47:08', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2020-06-22 17:47:08', '0000-00-00 00:00:00', '', 0, 'http://influencer.ghost-services.com/?p=24', 1, 'nav_menu_item', '', 0),
(28, 1, '2020-06-22 21:33:20', '2020-06-22 21:33:20', '', 'find', '', 'inherit', 'open', 'closed', '', 'find', '', '', '2020-06-22 21:33:20', '2020-06-22 21:33:20', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/find.png', 0, 'attachment', 'image/png', 0),
(29, 1, '2020-06-22 21:37:39', '2020-06-22 21:37:39', '', '2', '', 'inherit', 'open', 'closed', '', '2', '', '', '2020-06-22 21:37:39', '2020-06-22 21:37:39', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/2.png', 0, 'attachment', 'image/png', 0),
(30, 1, '2020-06-22 22:15:04', '2020-06-22 22:15:04', '', 'autopay', '', 'inherit', 'open', 'closed', '', 'autopay', '', '', '2020-06-22 22:15:04', '2020-06-22 22:15:04', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/autopay.png', 0, 'attachment', 'image/png', 0),
(31, 1, '2020-06-24 08:18:10', '2020-06-24 08:18:10', '', 'Sample Form', '', 'publish', 'closed', 'closed', '', 'sample-form', '', '', '2020-06-24 08:18:10', '2020-06-24 08:18:10', '', 0, 'http://influencer.ghost-services.com/wpuf_forms/sample-form/', 0, 'wpuf_forms', '', 0),
(32, 1, '2020-06-24 14:24:37', '2020-06-24 14:24:37', '', 'Sample Form', '', 'publish', 'closed', 'closed', '', 'sample-form-2', '', '', '2020-06-24 14:27:09', '2020-06-24 14:27:09', '', 0, 'http://influencer.ghost-services.com/wpuf_forms/sample-form-2/', 0, 'wpuf_forms', '', 0),
(33, 1, '2020-06-24 14:27:09', '2020-06-24 14:27:09', 'a:15:{s:8:\"template\";s:10:\"post_title\";s:4:\"name\";s:10:\"post_title\";s:5:\"label\";s:10:\"Post Title\";s:8:\"required\";s:2:\"no\";s:5:\"width\";s:5:\"large\";s:3:\"css\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"size\";i:40;s:4:\"help\";s:0:\"\";s:7:\"is_meta\";s:2:\"no\";s:9:\"wpuf_cond\";a:5:{s:16:\"condition_status\";s:2:\"no\";s:10:\"cond_field\";a:0:{}s:13:\"cond_operator\";a:1:{i:0;s:1:\"=\";}s:11:\"cond_option\";a:1:{i:0;s:10:\"- select -\";}s:10:\"cond_logic\";s:3:\"all\";}s:15:\"wpuf_visibility\";a:2:{s:8:\"selected\";s:8:\"everyone\";s:7:\"choices\";a:0:{}}s:10:\"input_type\";s:4:\"text\";s:16:\"word_restriction\";s:0:\"\";}', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2020-06-24 14:27:09', '2020-06-24 14:27:09', '', 32, 'http://influencer.ghost-services.com/wpuf_input/33/', 0, 'wpuf_input', '', 0),
(34, 1, '2020-06-24 14:27:09', '2020-06-24 14:27:09', 'a:17:{s:8:\"template\";s:12:\"post_excerpt\";s:4:\"name\";s:12:\"post_excerpt\";s:5:\"label\";s:12:\"Post Excerpt\";s:8:\"required\";s:2:\"no\";s:5:\"width\";s:5:\"large\";s:3:\"css\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"default\";s:0:\"\";s:4:\"size\";i:40;s:4:\"help\";s:0:\"\";s:7:\"is_meta\";s:2:\"no\";s:9:\"wpuf_cond\";a:5:{s:16:\"condition_status\";s:2:\"no\";s:10:\"cond_field\";a:0:{}s:13:\"cond_operator\";a:1:{i:0;s:1:\"=\";}s:11:\"cond_option\";a:1:{i:0;s:10:\"- select -\";}s:10:\"cond_logic\";s:3:\"all\";}s:15:\"wpuf_visibility\";a:2:{s:8:\"selected\";s:8:\"everyone\";s:7:\"choices\";a:0:{}}s:10:\"input_type\";s:8:\"textarea\";s:4:\"rows\";i:5;s:4:\"cols\";i:25;s:4:\"rich\";s:2:\"no\";}', '', '', 'publish', 'closed', 'closed', '', '34', '', '', '2020-06-24 14:27:09', '2020-06-24 14:27:09', '', 32, 'http://influencer.ghost-services.com/wpuf_input/34/', 1, 'wpuf_input', '', 0),
(35, 1, '2020-06-26 21:08:38', '2020-06-26 21:08:38', '', 'Pricing', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2020-06-26 21:08:38', '2020-06-26 21:08:38', '', 0, 'http://influencer.ghost-services.com/?page_id=35', 0, 'page', '', 0),
(36, 1, '2020-06-26 08:34:41', '2020-06-26 08:34:41', '', 'Pricing', '', 'publish', 'closed', 'closed', '', 'pricing', '', '', '2020-06-29 21:07:56', '2020-06-29 21:07:56', '', 0, 'http://influencer.ghost-services.com/?page_id=36', 0, 'page', '', 0),
(37, 1, '2020-06-26 08:34:41', '2020-06-26 08:34:41', '', 'Pricing', '', 'inherit', 'closed', 'closed', '', '36-revision-v1', '', '', '2020-06-26 08:34:41', '2020-06-26 08:34:41', '', 36, 'http://influencer.ghost-services.com/2020/06/26/36-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2020-06-26 14:18:11', '2020-06-26 14:18:11', ' ', '', '', 'publish', 'closed', 'closed', '', '40', '', '', '2020-06-30 13:44:23', '2020-06-30 13:44:23', '', 0, 'http://influencer.ghost-services.com/?p=40', 2, 'nav_menu_item', '', 0),
(41, 1, '2020-06-26 14:54:43', '2020-06-26 14:54:43', '', 'BASE', '', 'publish', 'open', 'closed', '', 'base', '', '', '2020-06-26 22:06:56', '2020-06-26 22:06:56', '', 0, 'http://influencer.ghost-services.com/?post_type=tariffs&#038;p=41', 0, 'tariffs', '', 0),
(42, 1, '2020-06-26 14:54:48', '2020-06-26 14:54:48', '', 'OPTIMAL', '', 'publish', 'open', 'closed', '', 'optimal', '', '', '2020-06-26 22:07:54', '2020-06-26 22:07:54', '', 0, 'http://influencer.ghost-services.com/?post_type=tariffs&#038;p=42', 0, 'tariffs', '', 0),
(43, 1, '2020-06-26 14:54:57', '2020-06-26 14:54:57', '', 'ADVANCED', '', 'publish', 'open', 'closed', '', 'advanced', '', '', '2020-06-26 22:08:08', '2020-06-26 22:08:08', '', 0, 'http://influencer.ghost-services.com/?post_type=tariffs&#038;p=43', 0, 'tariffs', '', 0),
(44, 1, '2020-06-26 14:55:04', '2020-06-26 14:55:04', '', 'PROFESSIONAL', '', 'publish', 'open', 'closed', '', 'professional', '', '', '2020-06-26 22:08:16', '2020-06-26 22:08:16', '', 0, 'http://influencer.ghost-services.com/?post_type=tariffs&#038;p=44', 0, 'tariffs', '', 0),
(45, 1, '2020-06-26 21:08:38', '2020-06-26 21:08:38', '', 'Pricing', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-06-26 21:08:38', '2020-06-26 21:08:38', '', 35, 'http://influencer.ghost-services.com/2020/06/26/35-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2020-06-26 21:24:34', '2020-06-26 21:24:34', '', 'flash', '', 'inherit', 'open', 'closed', '', 'flash', '', '', '2020-06-26 21:24:34', '2020-06-26 21:24:34', '', 44, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/flash.svg', 0, 'attachment', 'image/svg+xml', 0),
(47, 1, '2020-06-26 22:14:44', '2020-06-26 22:14:44', '', 'savings', '', 'inherit', 'open', 'closed', '', 'savings', '', '', '2020-06-26 22:14:44', '2020-06-26 22:14:44', '', 36, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/savings.svg', 0, 'attachment', 'image/svg+xml', 0),
(48, 1, '2020-06-26 22:14:53', '2020-06-26 22:14:53', '', 'fire', '', 'inherit', 'open', 'closed', '', 'fire', '', '', '2020-06-26 22:14:53', '2020-06-26 22:14:53', '', 36, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/fire.svg', 0, 'attachment', 'image/svg+xml', 0),
(49, 1, '2020-06-26 22:14:53', '2020-06-26 22:14:53', '', 'checkmark', '', 'inherit', 'open', 'closed', '', 'checkmark', '', '', '2020-06-26 22:14:53', '2020-06-26 22:14:53', '', 36, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/checkmark.svg', 0, 'attachment', 'image/svg+xml', 0),
(51, 1, '2020-06-29 09:22:09', '2020-06-29 09:22:09', 'handshake', 'Blogger', '', 'publish', 'closed', 'closed', '', 'blogger', '', '', '2020-06-30 19:45:01', '2020-06-30 19:45:01', '', 0, 'http://influencer.ghost-services.com/?page_id=51', 0, 'page', '', 0),
(52, 1, '2020-06-29 09:22:09', '2020-06-29 09:22:09', '', 'Blogger', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2020-06-29 09:22:09', '2020-06-29 09:22:09', '', 51, 'http://influencer.ghost-services.com/2020/06/29/51-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2020-06-29 09:54:11', '2020-06-29 09:54:11', '', 'free_access', '', 'inherit', 'open', 'closed', '', 'free_access', '', '', '2020-06-29 09:54:11', '2020-06-29 09:54:11', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/free_access.svg', 0, 'attachment', 'image/svg+xml', 0),
(54, 1, '2020-06-29 09:54:11', '2020-06-29 09:54:11', '', 'payment_guarantee', '', 'inherit', 'open', 'closed', '', 'payment_guarantee', '', '', '2020-06-29 09:54:11', '2020-06-29 09:54:11', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/payment_guarantee.svg', 0, 'attachment', 'image/svg+xml', 0),
(55, 1, '2020-06-29 09:54:12', '2020-06-29 09:54:12', '', 'reliable_channel', '', 'inherit', 'open', 'closed', '', 'reliable_channel', '', '', '2020-06-29 09:54:12', '2020-06-29 09:54:12', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/reliable_channel.svg', 0, 'attachment', 'image/svg+xml', 0),
(56, 1, '2020-06-29 10:08:27', '2020-06-29 10:08:27', ' ', '', '', 'publish', 'closed', 'closed', '', '56', '', '', '2020-06-30 13:44:23', '2020-06-30 13:44:23', '', 0, 'http://influencer.ghost-services.com/?p=56', 3, 'nav_menu_item', '', 0),
(57, 1, '2020-06-29 10:25:51', '2020-06-29 10:25:51', '', 'how-it-works-01', '', 'inherit', 'open', 'closed', '', 'how-it-works-01', '', '', '2020-06-29 10:25:51', '2020-06-29 10:25:51', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/how-it-works-01.png', 0, 'attachment', 'image/png', 0),
(58, 1, '2020-06-29 10:27:11', '2020-06-29 10:27:11', '', 'how_it_works', '', 'inherit', 'open', 'closed', '', 'how_it_works', '', '', '2020-06-29 10:27:11', '2020-06-29 10:27:11', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/how_it_works.svg', 0, 'attachment', 'image/svg+xml', 0),
(62, 1, '2020-06-29 15:36:17', '2020-06-29 15:36:17', '', '', '', 'trash', 'open', 'closed', '', '62__trashed', '', '', '2020-06-29 15:43:41', '2020-06-29 15:43:41', '', 0, 'http://influencer.ghost-services.com/?post_type=bloggers&#038;p=62', 0, 'bloggers', '', 0),
(63, 1, '2020-06-29 15:45:03', '2020-06-29 15:45:03', '', 'Nazeni', '', 'publish', 'open', 'closed', '', 'nazeni', '', '', '2020-06-29 20:49:24', '2020-06-29 20:49:24', '', 0, 'http://influencer.ghost-services.com/?post_type=bloggers&#038;p=63', 0, 'bloggers', '', 0),
(64, 1, '2020-06-29 15:46:24', '2020-06-29 15:46:24', '', 'Luiza', '', 'publish', 'open', 'closed', '', 'luiza', '', '', '2020-06-29 20:23:13', '2020-06-29 20:23:13', '', 0, 'http://influencer.ghost-services.com/?post_type=bloggers&#038;p=64', 0, 'bloggers', '', 0),
(65, 1, '2020-06-29 15:46:36', '2020-06-29 15:46:36', '', 'Lili', '', 'publish', 'open', 'closed', '', 'lili', '', '', '2020-06-29 20:22:35', '2020-06-29 20:22:35', '', 0, 'http://influencer.ghost-services.com/?post_type=bloggers&#038;p=65', 0, 'bloggers', '', 0),
(66, 1, '2020-06-29 15:46:50', '2020-06-29 15:46:50', '', 'Sirusho', '', 'publish', 'open', 'closed', '', 'sirusho', '', '', '2020-06-29 20:21:48', '2020-06-29 20:21:48', '', 0, 'http://influencer.ghost-services.com/?post_type=bloggers&#038;p=66', 0, 'bloggers', '', 0),
(67, 1, '2020-06-29 19:10:24', '2020-06-29 19:10:24', '', 'Natasha', '', 'publish', 'open', 'closed', '', 'natasha', '', '', '2020-06-29 20:20:50', '2020-06-29 20:20:50', '', 0, 'http://influencer.ghost-services.com/?post_type=bloggers&#038;p=67', 0, 'bloggers', '', 0),
(68, 1, '2020-06-29 19:10:22', '2020-06-29 19:10:22', '', 'наташ', '', 'inherit', 'open', 'closed', '', 'natash', '', '', '2020-06-29 19:10:22', '2020-06-29 19:10:22', '', 67, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/наташ.jpg', 0, 'attachment', 'image/jpeg', 0),
(69, 1, '2020-06-30 13:44:43', '2020-06-30 13:44:43', ' ', '', '', 'publish', 'closed', 'closed', '', '69', '', '', '2020-06-30 13:47:37', '2020-06-30 13:47:37', '', 0, 'http://influencer.ghost-services.com/?p=69', 1, 'nav_menu_item', '', 0),
(70, 1, '2020-06-30 13:44:43', '2020-06-30 13:44:43', ' ', '', '', 'publish', 'closed', 'closed', '', '70', '', '', '2020-06-30 13:47:37', '2020-06-30 13:47:37', '', 0, 'http://influencer.ghost-services.com/?p=70', 2, 'nav_menu_item', '', 0),
(71, 1, '2020-06-30 13:44:43', '2020-06-30 13:44:43', ' ', '', '', 'publish', 'closed', 'closed', '', '71', '', '', '2020-06-30 13:47:37', '2020-06-30 13:47:37', '', 0, 'http://influencer.ghost-services.com/?p=71', 3, 'nav_menu_item', '', 0),
(72, 1, '2020-06-30 17:35:31', '2020-06-30 17:35:31', '', 'door', '', 'inherit', 'open', 'closed', '', 'door', '', '', '2020-06-30 17:35:31', '2020-06-30 17:35:31', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/door.svg', 0, 'attachment', 'image/svg+xml', 0),
(73, 1, '2020-06-30 17:35:45', '2020-06-30 17:35:45', '', 'get', '', 'inherit', 'open', 'closed', '', 'get', '', '', '2020-06-30 17:35:45', '2020-06-30 17:35:45', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/get.svg', 0, 'attachment', 'image/svg+xml', 0),
(74, 1, '2020-06-30 17:35:56', '2020-06-30 17:35:56', '', 'credit', '', 'inherit', 'open', 'closed', '', 'credit', '', '', '2020-06-30 17:35:56', '2020-06-30 17:35:56', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/credit.svg', 0, 'attachment', 'image/svg+xml', 0),
(75, 1, '2020-06-30 17:56:01', '2020-06-30 17:56:01', '', 'group', '', 'inherit', 'open', 'closed', '', 'group', '', '', '2020-06-30 17:56:01', '2020-06-30 17:56:01', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/group.svg', 0, 'attachment', 'image/svg+xml', 0),
(76, 1, '2020-06-30 17:56:21', '2020-06-30 17:56:21', '', 'church', '', 'inherit', 'open', 'closed', '', 'church', '', '', '2020-06-30 17:56:21', '2020-06-30 17:56:21', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/church.svg', 0, 'attachment', 'image/svg+xml', 0),
(77, 1, '2020-06-30 17:56:30', '2020-06-30 17:56:30', '', 'content', '', 'inherit', 'open', 'closed', '', 'content', '', '', '2020-06-30 17:56:30', '2020-06-30 17:56:30', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/content.svg', 0, 'attachment', 'image/svg+xml', 0),
(78, 1, '2020-06-30 17:56:39', '2020-06-30 17:56:39', '', 'team', '', 'inherit', 'open', 'closed', '', 'team', '', '', '2020-06-30 17:56:39', '2020-06-30 17:56:39', '', 51, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/team.svg', 0, 'attachment', 'image/svg+xml', 0),
(79, 1, '2020-06-30 19:43:29', '2020-06-30 19:43:29', 'handshake', 'Blogger', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2020-06-30 19:43:29', '2020-06-30 19:43:29', '', 51, 'http://influencer.ghost-services.com/2020/06/30/51-revision-v1/', 0, 'revision', '', 0),
(80, 1, '2020-06-30 20:23:54', '2020-06-30 20:23:54', '', 'autopay', '', 'inherit', 'open', 'closed', '', 'autopay-2', '', '', '2020-06-30 20:23:54', '2020-06-30 20:23:54', '', 14, 'http://influencer.ghost-services.com/wp-content/uploads/2020/06/autopay.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Header menu', 'header-menu', 0),
(3, 'Footer menu', 'footer-menu', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(23, 2, 0),
(40, 2, 0),
(56, 2, 0),
(69, 3, 0),
(70, 3, 0),
(71, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 3),
(3, 3, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"6b1c493e778b6942b6bc045e68d178e257a1ca20ca6ef3ac5b3e5eea47f8f9fa\";a:4:{s:10:\"expiration\";i:1593595266;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593422466;}s:64:\"ca56ba750b2f396d746fa2d9b2fcd82398fa46053c72a944fd88537840527cf7\";a:4:{s:10:\"expiration\";i:1593693190;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36\";s:5:\"login\";i:1593520390;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '50'),
(18, 1, 'wp_user-settings', 'libraryContent=browse&editor=html'),
(19, 1, 'wp_user-settings-time', '1593208654'),
(20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(137, 1, 'meta-box-order_tariffs', 'a:3:{s:4:\"side\";s:36:\"submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:43:\"tariffs_fields_tik,commentstatusdiv,slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(138, 1, 'screen_layout_tariffs', '2'),
(379, 1, 'nav_menu_recently_edited', '3'),
(815, 1, 'meta-box-order_bloggers', 'a:3:{s:4:\"side\";s:36:\"submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:56:\"bloggers_fields_tik,commentstatusdiv,slugdiv,commentsdiv\";s:8:\"advanced\";s:0:\"\";}'),
(816, 1, 'screen_layout_bloggers', '2'),
(817, 1, 'closedpostboxes_bloggers', 'a:1:{i:0;s:16:\"commentstatusdiv\";}'),
(818, 1, 'metaboxhidden_bloggers', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(819, 1, 'closedpostboxes_page', 'a:1:{i:0;s:10:\"postcustom\";}'),
(820, 1, 'metaboxhidden_page', 'a:4:{i:0;s:16:\"commentstatusdiv\";i:1;s:11:\"commentsdiv\";i:2;s:7:\"slugdiv\";i:3;s:9:\"authordiv\";}'),
(821, 1, 'meta-box-order_page', 'a:3:{s:4:\"side\";s:36:\"submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:46:\"commentstatusdiv,commentsdiv,slugdiv,authordiv\";s:8:\"advanced\";s:18:\"pricing_fields_tik\";}'),
(822, 1, 'screen_layout_page', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B62GQcfxfDfcK48n6uIMwRSrHboLxl/', 'admin', 'admin@mail.ru', 'http://influencer.ghost-services.com', '2020-06-22 09:38:29', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_wpmailsmtp_tasks_meta`
--

DROP TABLE IF EXISTS `wp_wpmailsmtp_tasks_meta`;
CREATE TABLE `wp_wpmailsmtp_tasks_meta` (
  `id` bigint(20) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_wpuf_subscribers`
--

DROP TABLE IF EXISTS `wp_wpuf_subscribers`;
CREATE TABLE `wp_wpuf_subscribers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subscribtion_id` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subscribtion_status` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `starts_from` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expire` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_wpuf_transaction`
--

DROP TABLE IF EXISTS `wp_wpuf_transaction`;
CREATE TABLE `wp_wpuf_transaction` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending_payment',
  `subtotal` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `tax` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `cost` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `post_id` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pack_id` bigint(20) DEFAULT NULL,
  `payer_first_name` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payer_last_name` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payer_email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payer_address` longtext COLLATE utf8mb4_unicode_520_ci,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Индексы таблицы `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Индексы таблицы `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Индексы таблицы `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Индексы таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `wp_mondula_form_wizards`
--
ALTER TABLE `wp_mondula_form_wizards`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Индексы таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Индексы таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Индексы таблицы `wp_wpmailsmtp_tasks_meta`
--
ALTER TABLE `wp_wpmailsmtp_tasks_meta`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wp_wpuf_subscribers`
--
ALTER TABLE `wp_wpuf_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `wp_wpuf_transaction`
--
ALTER TABLE `wp_wpuf_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `pack_id` (`pack_id`),
  ADD KEY `payer_email` (`payer_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT для таблицы `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_mondula_form_wizards`
--
ALTER TABLE `wp_mondula_form_wizards`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1519;
--
-- AUTO_INCREMENT для таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;
--
-- AUTO_INCREMENT для таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT для таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=823;
--
-- AUTO_INCREMENT для таблицы `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `wp_wpmailsmtp_tasks_meta`
--
ALTER TABLE `wp_wpmailsmtp_tasks_meta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_wpuf_subscribers`
--
ALTER TABLE `wp_wpuf_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `wp_wpuf_transaction`
--
ALTER TABLE `wp_wpuf_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
