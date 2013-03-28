# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.54)
# Database: 20MileInt
# Generation Time: 2013-03-28 15:11:09 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table exp_accessories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_accessories`;

CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(50) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`)
VALUES
	(1,'Expressionengine_info_acc','1|5','addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|addons|admin_content|admin_system|content_edit|content_files_modal|content_files|content_publish|content|design|homepage|members|myaccount|tools_communicate|tools_data|tools_logs|tools_utilities|tools','1.0'),
	(2,'Structure_acc','1|5','addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|addons|admin_content|admin_system|content_edit|content_files_modal|content_files|content_publish|content|design|homepage|members|myaccount|tools_communicate|tools_data|tools_logs|tools_utilities|tools','3.3.8');

/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;

INSERT INTO `exp_actions` (`action_id`, `class`, `method`)
VALUES
	(1,'Email','send_email'),
	(2,'Safecracker','submit_entry'),
	(3,'Safecracker','combo_loader'),
	(4,'Search','do_search'),
	(5,'Channel','insert_new_entry'),
	(6,'Channel','filemanager_endpoint'),
	(7,'Channel','smiley_pop'),
	(8,'Member','registration_form'),
	(9,'Member','register_member'),
	(10,'Member','activate_member'),
	(11,'Member','member_login'),
	(12,'Member','member_logout'),
	(13,'Member','retrieve_password'),
	(14,'Member','reset_password'),
	(15,'Member','send_member_email'),
	(16,'Member','update_un_pw'),
	(17,'Member','member_search'),
	(18,'Member','member_delete'),
	(19,'Rte','get_js'),
	(20,'Freeform','save_form'),
	(21,'Playa_mcp','filter_entries'),
	(22,'Structure','ajax_move_set_data'),
	(23,'Assets_mcp','upload_file'),
	(24,'Assets_mcp','get_files_view_by_folders'),
	(25,'Assets_mcp','get_props'),
	(26,'Assets_mcp','save_props'),
	(27,'Assets_mcp','get_ordered_files_view'),
	(28,'Assets_mcp','get_session_id'),
	(29,'Assets_mcp','start_index'),
	(30,'Assets_mcp','perform_index'),
	(31,'Assets_mcp','finish_index'),
	(32,'Assets_mcp','get_s3_buckets'),
	(33,'Assets_mcp','move_folder'),
	(34,'Assets_mcp','rename_folder'),
	(35,'Assets_mcp','create_folder'),
	(36,'Assets_mcp','delete_folder'),
	(37,'Assets_mcp','view_file'),
	(38,'Assets_mcp','move_file'),
	(39,'Assets_mcp','delete_file'),
	(40,'Assets_mcp','view_thumbnail'),
	(41,'Assets_mcp','build_sheet'),
	(42,'Assets_mcp','get_selected_files'),
	(43,'Super_search','save_search'),
	(51,'Profile','register_action'),
	(52,'Profile','edit_action'),
	(53,'Profile','set_active_profile_action'),
	(54,'Profile','login_action'),
	(55,'Profile','logout_action'),
	(56,'Profile','forgot_password_action'),
	(57,'Profile','reset_password_action'),
	(58,'Profile','activation_action'),
	(59,'Safeharbor','communicate'),
	(60,'Safeharbor','_backup_cron'),
	(61,'Tag','insert_tags'),
	(62,'Tag','ajax'),
	(63,'Tag','tag_js'),
	(64,'Tag','subscribe'),
	(65,'Tag','unsubscribe');

/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_assets_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_assets_files`;

CREATE TABLE `exp_assets_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned NOT NULL,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `source_id` int(10) unsigned DEFAULT NULL,
  `filedir_id` int(4) unsigned DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` int(10) unsigned DEFAULT NULL,
  `alt_text` tinytext,
  `caption` tinytext,
  `author` tinytext,
  `desc` text,
  `location` tinytext,
  `keywords` text,
  `date_modified` int(10) unsigned DEFAULT NULL,
  `kind` varchar(5) DEFAULT NULL,
  `width` int(2) DEFAULT NULL,
  `height` int(2) DEFAULT NULL,
  `size` int(3) DEFAULT NULL,
  `search_keywords` text,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `unq_folder_id__file_name` (`folder_id`,`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;

INSERT INTO `exp_assets_files` (`file_id`, `folder_id`, `source_type`, `source_id`, `filedir_id`, `file_name`, `title`, `date`, `alt_text`, `caption`, `author`, `desc`, `location`, `keywords`, `date_modified`, `kind`, `width`, `height`, `size`, `search_keywords`)
VALUES
	(1,1,'ee',NULL,2,'dave-fravel-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476274,'image',437,656,77709,'dave-fravel-c.jpg'),
	(2,1,'ee',NULL,2,'dave-fravel-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476273,'image',255,316,18533,'dave-fravel-bw.jpg'),
	(3,1,'ee',NULL,2,'amy-reddington-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476269,'image',255,316,21177,'amy-reddington-bw.jpg'),
	(4,1,'ee',NULL,2,'amy-reddington-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476270,'image',437,656,80783,'amy-reddington-c.jpg'),
	(5,1,'ee',NULL,2,'chris-obrien-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476270,'image',255,316,23939,'chris-obrien-bw.jpg'),
	(6,1,'ee',NULL,2,'chris-obrien-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476271,'image',437,656,90119,'chris-obrien-c.jpg'),
	(7,1,'ee',NULL,2,'dave-fontes-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476272,'image',255,316,19917,'dave-fontes-bw.jpg'),
	(8,1,'ee',NULL,2,'dave-fontes-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476272,'image',437,656,75420,'dave-fontes-c.jpg'),
	(9,1,'ee',NULL,2,'emily-obrien-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476274,'image',255,316,20765,'emily-obrien-bw.jpg'),
	(10,1,'ee',NULL,2,'emily-obrien-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476275,'image',437,656,76684,'emily-obrien-c.jpg'),
	(11,1,'ee',NULL,2,'rodrigo-passos-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476275,'image',255,316,21010,'rodrigo-passos-bw.jpg'),
	(12,1,'ee',NULL,2,'rodrigo-passos-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476276,'image',437,656,79479,'rodrigo-passos-c.jpg'),
	(13,1,'ee',NULL,2,'sue-malomo-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476276,'image',255,316,26792,'sue-malomo-bw.jpg'),
	(14,1,'ee',NULL,2,'sue-malomo-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476277,'image',437,656,88412,'sue-malomo-c.jpg'),
	(15,1,'ee',NULL,2,'tim-merrill-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476278,'image',255,316,17438,'tim-merrill-bw.jpg'),
	(16,1,'ee',NULL,2,'tim-merrill-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476279,'image',437,656,69183,'tim-merrill-c.jpg'),
	(17,2,'ee',NULL,3,'BBC_large_home_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476309,'image',1218,994,301801,'BBC_large_home_full2.jpg'),
	(18,2,'ee',NULL,3,'BBC_large_home_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476310,'image',1218,864,219139,'BBC_large_home_full3.jpg'),
	(19,6,'ee',NULL,1,'BBC_large_home_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476309,'image',1218,994,301801,'BBC_large_home_full2.jpg'),
	(20,4,'ee',NULL,1,'index.html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476291,'html',NULL,NULL,114,'index.html'),
	(21,6,'ee',NULL,1,'BBC_large_home_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476310,'image',1218,864,219139,'BBC_large_home_full3.jpg'),
	(22,1,'ee',NULL,2,'index.html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476275,'html',NULL,NULL,114,'index.html'),
	(23,9,'ee',NULL,5,'bbc_mobile_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476321,'image',385,712,71157,'bbc_mobile_1.jpg'),
	(24,9,'ee',NULL,5,'bbc_mobile2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476322,'image',385,712,68058,'bbc_mobile2.jpg'),
	(25,3,'ee',NULL,4,'BBC_tablet_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476335,'image',746,979,123732,'BBC_tablet_full3.jpg'),
	(26,3,'ee',NULL,4,'BBC_tablet_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476334,'image',746,1083,212076,'BBC_tablet_full2.jpg'),
	(27,1,'ee',NULL,2,'amy-reddington-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476270,'image',482,604,164462,'amy-reddington-bw@2x.png'),
	(28,1,'ee',NULL,2,'chris-obrien-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476271,'image',482,604,169066,'chris-obrien-bw@2x.png'),
	(29,1,'ee',NULL,2,'dave-fontes-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476272,'image',482,604,164422,'dave-fontes-bw@2x.png'),
	(30,1,'ee',NULL,2,'dave-fravel-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476273,'image',482,604,160239,'dave-fravel-bw@2x.png'),
	(31,1,'ee',NULL,2,'emily-obrien-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476274,'image',482,604,166324,'emily-obrien-bw@2x.png'),
	(32,1,'ee',NULL,2,'rodrigo-passos-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476276,'image',482,604,162692,'rodrigo-passos-bw@2x.png'),
	(33,1,'ee',NULL,2,'sue-malomo-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476277,'image',482,604,185311,'sue-malomo-bw@2x.png'),
	(34,1,'ee',NULL,2,'tim-merrill-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476278,'image',482,604,165847,'tim-merrill-bw@2x.png'),
	(35,4,'ee',NULL,1,'tims-headshot.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476338,'image',592,479,405527,'tims-headshot.png'),
	(36,4,'ee',NULL,1,'time-tracking.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476337,'image',211,144,7340,'time-tracking.png'),
	(37,4,'ee',NULL,1,'new-features.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476291,'image',394,58,11733,'new-features.png'),
	(38,2,'ee',NULL,3,'Lanes_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476315,'image',1218,994,169588,'Lanes_large_home_full.jpg'),
	(39,3,'ee',NULL,4,'Lanes_tablet_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476336,'image',414,600,56964,'Lanes_tablet_home_full.jpg'),
	(40,9,'ee',NULL,5,'Lanes_mobile_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476322,'image',385,1000,93426,'Lanes_mobile_home_full.jpg'),
	(41,2,'ee',NULL,3,'BI_large_home_full.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476311,'image',1505,1172,190722,'BI_large_home_full.gif'),
	(42,6,'ee',NULL,1,'Lanes_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476315,'image',1218,994,169588,'Lanes_large_home_full.jpg'),
	(43,6,'ee',NULL,1,'BI_large_home_full.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476311,'image',1505,1172,190722,'BI_large_home_full.gif'),
	(44,7,'ee',NULL,1,'bbc_mobile_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476321,'image',385,712,71157,'bbc_mobile_1.jpg'),
	(45,7,'ee',NULL,1,'bbc_mobile2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476322,'image',385,712,68058,'bbc_mobile2.jpg'),
	(46,8,'ee',NULL,1,'Lanes_tablet_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476336,'image',414,600,56964,'Lanes_tablet_home_full.jpg'),
	(47,8,'ee',NULL,1,'BBC_tablet_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476335,'image',746,979,123732,'BBC_tablet_full3.jpg'),
	(48,8,'ee',NULL,1,'BBC_tablet_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476334,'image',746,1083,212076,'BBC_tablet_full2.jpg'),
	(49,7,'ee',NULL,1,'Lanes_mobile_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476322,'image',385,1000,93426,'Lanes_mobile_home_full.jpg'),
	(52,2,'ee',NULL,3,'BI_large_home_full-2.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476310,'image',1505,1172,190722,'BI_large_home_full-2.gif'),
	(53,6,'ee',NULL,1,'BI_large_home_full-2.gif',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476310,'image',1505,1172,190722,'BI_large_home_full-2.gif'),
	(55,2,'ee',NULL,3,'EMBA_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476314,'image',1200,814,103559,'EMBA_large_home_full.jpg'),
	(56,2,'ee',NULL,3,'EMBA_large_blog_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476314,'image',1200,814,111897,'EMBA_large_blog_full.jpg'),
	(57,2,'ee',NULL,3,'CCFTA_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476311,'image',1200,803,80214,'CCFTA_large_home_full.jpg'),
	(58,2,'ee',NULL,3,'CCFTA_large_home_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476312,'image',1200,833,93293,'CCFTA_large_home_full2.jpg'),
	(61,2,'ee',NULL,3,'CCHC_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476313,'image',1200,814,82504,'CCHC_large_home_full.jpg'),
	(62,3,'ee',NULL,4,'Lanes_tablet_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476337,'image',482,600,61314,'Lanes_tablet_home.jpg'),
	(63,9,'ee',NULL,5,'CCHC_mobile_home.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476322,'image',344,600,91370,'CCHC_mobile_home.png'),
	(64,9,'ee',NULL,5,'Lanes_mobile_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476323,'image',344,600,56304,'Lanes_mobile_home.jpg'),
	(65,2,'ee',NULL,3,'Lanes_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476315,'image',1054,600,118457,'Lanes_desktop_home.jpg'),
	(66,2,'ee',NULL,3,'CCHC_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476312,'image',1054,600,108469,'CCHC_desktop_home.jpg'),
	(67,2,'ee',NULL,3,'BBC_desktop_home_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476308,'image',1054,600,163877,'BBC_desktop_home_1.jpg'),
	(68,2,'ee',NULL,3,'BBC_desktop_home_2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476308,'image',1054,600,137901,'BBC_desktop_home_2.jpg'),
	(69,3,'ee',NULL,4,'BBC_tablet_home_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476335,'image',482,600,87197,'BBC_tablet_home_1.jpg'),
	(70,3,'ee',NULL,4,'BBC_tablet_home_2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476336,'image',482,600,69595,'BBC_tablet_home_2.jpg'),
	(71,2,'ee',NULL,3,'EMBA_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476313,'image',1054,600,131444,'EMBA_desktop_home.jpg'),
	(72,6,'ee',NULL,1,'BBC_desktop_home_2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476308,'image',1054,600,137901,'BBC_desktop_home_2.jpg'),
	(73,6,'ee',NULL,1,'BBC_desktop_home_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476308,'image',1054,600,163877,'BBC_desktop_home_1.jpg'),
	(74,6,'ee',NULL,1,'CCFTA_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476311,'image',1200,803,80214,'CCFTA_large_home_full.jpg'),
	(75,6,'ee',NULL,1,'CCFTA_large_home_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476312,'image',1200,833,93293,'CCFTA_large_home_full2.jpg'),
	(76,6,'ee',NULL,1,'CCHC_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476312,'image',1054,600,108469,'CCHC_desktop_home.jpg'),
	(77,6,'ee',NULL,1,'EMBA_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476313,'image',1054,600,131444,'EMBA_desktop_home.jpg'),
	(78,6,'ee',NULL,1,'EMBA_large_blog_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476314,'image',1200,814,111897,'EMBA_large_blog_full.jpg'),
	(79,6,'ee',NULL,1,'EMBA_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476314,'image',1200,814,103559,'EMBA_large_home_full.jpg'),
	(80,6,'ee',NULL,1,'CCHC_large_home_full.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476313,'image',1200,814,82504,'CCHC_large_home_full.jpg'),
	(81,7,'ee',NULL,1,'CCHC_mobile_home.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476322,'image',344,600,91370,'CCHC_mobile_home.png'),
	(82,7,'ee',NULL,1,'Lanes_mobile_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476323,'image',344,600,56304,'Lanes_mobile_home.jpg'),
	(83,6,'ee',NULL,1,'Lanes_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476315,'image',1054,600,118457,'Lanes_desktop_home.jpg'),
	(84,8,'ee',NULL,1,'BBC_tablet_home_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476335,'image',482,600,87197,'BBC_tablet_home_1.jpg'),
	(85,8,'ee',NULL,1,'Lanes_tablet_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476337,'image',482,600,61314,'Lanes_tablet_home.jpg'),
	(86,8,'ee',NULL,1,'BBC_tablet_home_2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364476336,'image',482,600,69595,'BBC_tablet_home_2.jpg'),
	(87,2,'ee',NULL,3,'Bradford_desktop_home.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364480624,'image',1054,600,118182,'Bradford_desktop_home.jpg');

/*!40000 ALTER TABLE `exp_assets_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_assets_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_assets_folders`;

CREATE TABLE `exp_assets_folders` (
  `folder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `folder_name` varchar(255) NOT NULL,
  `full_path` varchar(255) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  `filedir_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `unq_source_type__source_id__filedir_id__parent_id__folder_name` (`source_type`,`source_id`,`filedir_id`,`parent_id`,`folder_name`),
  UNIQUE KEY `unq_source_type__source_id__filedir_id__full_path` (`source_type`,`source_id`,`filedir_id`,`full_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;

INSERT INTO `exp_assets_folders` (`folder_id`, `source_type`, `folder_name`, `full_path`, `parent_id`, `source_id`, `filedir_id`)
VALUES
	(1,'ee','Member Photos','',NULL,NULL,2),
	(2,'ee','Result Desktop Images','',NULL,NULL,3),
	(3,'ee','Result Tablet Images','',NULL,NULL,4),
	(4,'ee','Main Image Uploads','',NULL,NULL,1),
	(5,'ee','result_images','result_images/',4,NULL,1),
	(6,'ee','desktop','result_images/desktop/',5,NULL,1),
	(7,'ee','mobile','result_images/mobile/',5,NULL,1),
	(8,'ee','tablet','result_images/tablet/',5,NULL,1),
	(9,'ee','Result Mobile Images','',NULL,NULL,5);

/*!40000 ALTER TABLE `exp_assets_folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_assets_index_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_assets_index_data`;

CREATE TABLE `exp_assets_index_data` (
  `session_id` char(36) DEFAULT NULL,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `source_id` int(10) unsigned DEFAULT NULL,
  `offset` int(10) unsigned DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  `type` enum('file','folder') DEFAULT NULL,
  `record_id` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `unq__session_id__source_type__source_id__offset` (`session_id`,`source_type`,`source_id`,`offset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_assets_selections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_assets_selections`;

CREATE TABLE `exp_assets_selections` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `col_id` int(6) unsigned DEFAULT NULL,
  `row_id` int(10) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `sort_order` int(4) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  KEY `file_id` (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `col_id` (`col_id`),
  KEY `row_id` (`row_id`),
  KEY `var_id` (`var_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_assets_selections` WRITE;
/*!40000 ALTER TABLE `exp_assets_selections` DISABLE KEYS */;

INSERT INTO `exp_assets_selections` (`file_id`, `entry_id`, `field_id`, `col_id`, `row_id`, `var_id`, `sort_order`, `is_draft`)
VALUES
	(66,27,17,NULL,NULL,NULL,0,0),
	(61,27,17,NULL,NULL,NULL,1,0),
	(63,27,19,NULL,NULL,NULL,0,0),
	(58,26,17,NULL,NULL,NULL,0,0),
	(67,19,17,NULL,NULL,NULL,0,0),
	(68,19,17,NULL,NULL,NULL,1,0),
	(69,19,18,NULL,NULL,NULL,0,0),
	(70,19,18,NULL,NULL,NULL,1,0),
	(24,19,19,NULL,NULL,NULL,0,0),
	(23,19,19,NULL,NULL,NULL,1,0),
	(71,25,17,NULL,NULL,NULL,0,0),
	(87,24,17,NULL,NULL,NULL,0,0),
	(65,20,17,NULL,NULL,NULL,0,0),
	(62,20,18,NULL,NULL,NULL,0,0),
	(64,20,19,NULL,NULL,NULL,0,0);

/*!40000 ALTER TABLE `exp_assets_selections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_assets_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_assets_sources`;

CREATE TABLE `exp_assets_sources` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 's3',
  `name` varchar(255) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  PRIMARY KEY (`source_id`),
  UNIQUE KEY `unq_source_type__source_id` (`source_type`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_captcha
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`)
VALUES
	(1,1,1,0,'Identity Design','identity-design','Your business should tell a story. We work with you to bring that story to life. Through a logo, tagline, typography, color palette, imagery and content strategy, our team of creative professionals will work with you to help you find your online voice and identity.','0',1),
	(2,1,1,0,'Online Marketing','online-marketing','A website is one component of your online marketing. If it\'s going to work for you, it needs regular attention. We\'ll help you evaluate the success of your website and guide you through the multiple options for online marketing. Whether it\'s a Google Adwords campaign, monthly executive summaries or media buys, we\'re here to help you reach the full potential of your online investment.','0',2),
	(3,1,1,0,'Web Design','web-design','We don\'t present you with three templates and tell you to pick the one you like the best (or the one you don\'t like the least). Our creative process is thorough. We get to know you and your brand. We learn about your business, your customers, your competition and your goals and create a web design that meets not only your needs, but the needs of your visitors, too.','0',3),
	(4,1,1,0,'Web Development','web-development','Our team of developers and technical professionals are here to support your web projects. We\'ve completed hundreds of successful implementations. We have proven, stable processes that we\'ve honed through 250 website implementations over the past five years. We take a creative, outside-the-box approach to craft solutions that meet your needs.','0',4);

/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` varchar(40) DEFAULT 'none',
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`, `field_id_1`, `field_ft_1`)
VALUES
	(1,1,1,'<ul>\n   <li>Logos</li>\n   <li>Identity Systems</li>\n   <li>Brand Development</li>\n   <li>Brand Guidelines</li>\n   <li>Stationary</li>\n</ul>','none'),
	(2,1,1,'<ul>\n<li>Analytics</li>\n<li>Campaign Management</li>\n<li>Email Marketing</li>\n<li>A/B Testing</li>\n<li>Executive Summaries</li>\n</ul>','none'),
	(3,1,1,'<ul>\n   <li>Analysis/Discovery</li>\n<li>Content Strategy</li>\n<li>Prototyping</li>\n<li>Usability</li>\n<li>Mobile/Desktop/Tablet</li>\n</ul>','none'),
	(4,1,1,'<ul>\n   <li>CMS</li>\n<li>E-Commerce</li>\n<li>Custom Applications</li>\n<li>Support</li>\n<li>Hosting</li>\n</ul>','none');

/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;

INSERT INTO `exp_category_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_type`, `field_list_items`, `field_maxl`, `field_ta_rows`, `field_default_fmt`, `field_show_fmt`, `field_text_direction`, `field_required`, `field_order`)
VALUES
	(1,1,1,'topics','Topics','textarea','',128,6,'none','y','ltr','y',2);

/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`)
VALUES
	(1,1,'Expertise','a',0,'all','','');

/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;

INSERT INTO `exp_category_posts` (`entry_id`, `cat_id`)
VALUES
	(16,1),
	(17,4),
	(18,4),
	(19,3),
	(19,4),
	(20,3),
	(20,4),
	(23,3),
	(23,4),
	(24,2),
	(24,3),
	(24,4),
	(25,4),
	(26,3),
	(26,4),
	(27,4);

/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` text,
  `field_ft_11` tinytext,
  `field_id_12` text,
  `field_ft_12` tinytext,
  `field_id_13` text,
  `field_ft_13` tinytext,
  `field_id_14` text,
  `field_ft_14` tinytext,
  `field_id_15` text,
  `field_ft_15` tinytext,
  `field_id_16` text,
  `field_ft_16` tinytext,
  `field_id_17` text,
  `field_ft_17` tinytext,
  `field_id_18` text,
  `field_ft_18` tinytext,
  `field_id_19` text,
  `field_ft_19` tinytext,
  `field_id_20` text,
  `field_ft_20` tinytext,
  `field_id_21` text,
  `field_ft_21` tinytext,
  `field_id_22` text,
  `field_ft_22` tinytext,
  `field_id_23` text,
  `field_ft_23` tinytext,
  `field_id_24` int(10) DEFAULT '0',
  `field_dt_24` varchar(8) DEFAULT NULL,
  `field_ft_24` tinytext,
  `field_id_25` text,
  `field_ft_25` tinytext,
  `field_id_26` text,
  `field_ft_26` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`, `field_id_13`, `field_ft_13`, `field_id_14`, `field_ft_14`, `field_id_15`, `field_ft_15`, `field_id_16`, `field_ft_16`, `field_id_17`, `field_ft_17`, `field_id_18`, `field_ft_18`, `field_id_19`, `field_ft_19`, `field_id_20`, `field_ft_20`, `field_id_21`, `field_ft_21`, `field_id_22`, `field_ft_22`, `field_id_23`, `field_ft_23`, `field_id_24`, `field_dt_24`, `field_ft_24`, `field_id_25`, `field_ft_25`, `field_id_26`, `field_ft_26`)
VALUES
	(1,1,3,'',NULL,'',NULL,'<p>\n	Dave started 20Mile Interactive in a home office under his stairs in 2007 after 15 years of working for large software companies. When he&#39;s not meeting with clients or brainstorming with the 20Mile team, Dave can be found hanging out with his three kids, sitting on Sandy Neck Beach, running through the Trail of Tears in Barnstable or tasting the latest beers @ the Hyannis BBC.</p>',NULL,'{filedir_2}dave-fravel-c.jpg','none','{filedir_2}dave-fravel-bw@2x.png','none','President','none','74BDE8','xhtml','dfravel','none','in/dfravel','none','Caitlin, Keely and Colin - they keep me constantly entertained (and they can hunt for food and firewood while I relax)','none','A tie between <a href=\"http://capecodbeer.com/brewery/bitter-end-imperial-ipa/\" target=\"_blank\">Cape Cod Beer Bitter End Imperial IPA</a> and <a href=\"http://www.firestonebeer.com/beers/products/double-jack-w\" target=\"_blank\">Firestone Double Jack IPA</a>','none','<a href=\"http://52tiger.net/\" target=\"_blank\">52Tiger.net</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(2,1,3,'',NULL,'',NULL,'<p>\n	Rodrigo was the very first hire and has been with 20Mile since 2010. He started programming on BASIC back in Brazil early in the 90&#39;s, and since then moved through many languages and enviroments, but he settled with web technologies for the past 14 years. He still strives to be on the edge, participating and contributing code to various open source initiatives. In his spare time, Rodrigo enjoys obsessing over different hobbies, from side projects to juice diets.</p>','none','{filedir_2}rodrigo-passos-c.jpg','none','{filedir_2}rodrigo-passos-bw@2x.png','none','Senior Web Developer','none','F05921','xhtml','webrgp','none','in/rgpassos/','none','A laptop with a satelite internet connection.','none','Bailey\'s with coffee','none','<a href=\"http://net.tutsplus.com/\" target=\"_blank\">TutsPlus.com</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(3,1,3,'',NULL,'',NULL,'<p>\n	Since his start with LendingTree in 1997, Tim has designed web experiences with global interactive agencies for Fortune 500 organizations, and led creative and user experience teams for several Internet startups. In 2007 he founded his own design agency, Wonderwheel Creative, which merged with 20Mile in 2012. When Tim isn&rsquo;t staring at a Mac, he&rsquo;s happiest exploring the forests, rivers and beaches of New England with his wife and two children.</p>','none','{filedir_2}tim-merrill-c.jpg','none','{filedir_2}tim-merrill-bw@2x.png','none','Creative Director','none','A5CD38','xhtml','timeril','none','in/timmerrill','none','A gigantic sketchbook; a surfboard (I don\'t know how to surf (yet)); Plenty of rum for tropical drinks','none','Saphire and tonic.','none','<a href=\"http://underconsideration.com/brandnew/\" target=\"_blank\">UnderConsideration.com/brandnew/</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(4,1,3,'',NULL,'',NULL,'<p>\n	Sue joined the 20Mile team after realizing that she&#39;d rather be a developer than business owner/accountant/designer/developer and she&#39;s never been happier. When she&#39;s not working, she&#39;d prefer to be outdoors - whether camping, hiking, kayaking, walking the beach, or running (which she started reluctantly 2 years ago at the insistence of Dave). Her three boys and a border collie keep her busy but in down time she&#39;s been known to make pretty good chocolate chip cookies.</p>','none','{filedir_2}sue-malomo-c.jpg','none','{filedir_2}sue-malomo-bw@2x.png','none','Project Manager','none','EDECE8','xhtml','20MileSue','none','in/suemalomo/','none','My kids (and dog); my iPhone;  ','none','Cape Cod Beer\'s Bitter End Imperial IPA','none','<a href=\"http://www.diy.org\">DIY</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(5,1,3,'',NULL,'',NULL,'<p>\n	David Fontes built his first website when text browsers were the norm, Mosaic was a new kid on the block, and Internet Explorer wasn&rsquo;t even the kernel of an idea of the terrible terrible browser it would eventually become. Web development was a &ldquo;side gig&rdquo; for several years of assorted jobs including teaching coastal ecology, managing a shorebird preserve, and building custom staircases. In the late 90&rsquo;s he moved to Cape Cod, got a full-time job with a web design company, and now spends much less time on the beach than he did before moving to the Cape. He joined 20 Mile in 2010.</p>','none','{filedir_2}dave-fontes-c.jpg','none','{filedir_2}dave-fontes-bw@2x.png','none','Senior Web Developer','none','F05921','xhtml','','none','pub/david-fontes/12/193/297/','none','SAS Survival Handbook; A big cast-iron cook pot; Amy Adams (if she’s not available, then a fishing pole);','none','Duchesse de Bourgogne (Flemish Red Ale)','none','<a href=\"http://www.thisiscolossal.com/\" target=\"_blank\">Colossal</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(6,1,3,'',NULL,'',NULL,'<p>\n	Amy has been a Project Manager with 20Mile for just about a year. She comes to us with over 15 years of Event Management and Operations experience.&nbsp; Her areas of expertise are in client relations, project management, and problem solving. She is able to react quickly and decisively under pressure and manage multiple projects simultaneously. Amy has 4 year old twin boys and in her spare time enjoys cooking and baking.</p>','none','{filedir_2}amy-reddington-c.jpg','none','{filedir_2}amy-reddington-bw@2x.png','none','Project Manager','none','EDECE8','xhtml','asreddington','none','/pub/amy-reddington/3/53a/41a/','none','My kids; My phone; Coffee;','none','Wine','none','<a href=\"http://chef-in-training.com/\" target=\"_blank\">Chef In Training</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(7,1,3,'',NULL,'',NULL,'<p>\n	Chris is a multi-disciplinary designer who crafts beautiful, usable web experiences with a keen eye for details and a strong sense of purpose and utility. He approaches projects with strategic, creative thinking and a passion for finding the best design solutions.</p>','none','{filedir_2}chris-obrien-c.jpg','none','{filedir_2}chris-obrien-bw@2x.png','none','Director of UX','none','A5CD38','xhtml','cod','none','in/chriskevinobrien/','none','My iPhone; An acoustic guitar; A keg of Mayflower IPA','none','See #3 above','none','<a href=\"http://alistapart.com/\" target=\"_blank\">A List Apart</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(8,1,3,'',NULL,'',NULL,'<p>\n	Emily joined 20Mile in January 2012 and handles all the bookkeeping and administrative responsibilities that keep the lights on and allows the rest of the team to focus on designing and developing websites. When she&#39;s not cursing out Quickbooks, Emily is relaxing at home with her family.</p>','none','{filedir_2}emily-obrien-c.jpg','none','{filedir_2}emily-obrien-bw@2x.png','none','Office Manager','none','EDECE8','xhtml','','none','','none','My bed, my family, and ear plugs.','none','Cabernet Sauvignon','none','<a href=\"http://www.onegoodthingbyjillee.com/\" target=\"_blank\">One Good Thing by Jillee</a>','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(9,1,3,NULL,NULL,NULL,NULL,NULL,'none',NULL,'none',NULL,'none',NULL,'none','','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(10,1,1,'<p>\n	This is the home page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(11,1,1,'<p>Through brand strategy, creative design, technical expertise and online marketing we&#39;re by your side helping to tell your story and craft beautiful experiences for your website visitors.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(12,1,1,'','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(13,1,1,'<p>\n	With 15+ years of web design and development experience, there isn&#39;t much that we haven&#39;t done. We&#39;re at our best when we&#39;re working as your partner to deliver creative solutions for your challenges.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(14,1,1,'<p>\n	Journal page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(15,1,1,'<p>\n	Interested in working together?</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(16,1,2,'',NULL,'<p>\n	I&#39;m amazed Tim is still talking to me. I&#39;m even more amazed that he didn&#39;t punch me in the face and quit at least 4 times over the past month. Poor Tim.He had no idea what he was getting himself into when he raised his hand during a meeting and took on the challenge of telling the 20Mile story.&nbsp;</p>\n<!--read_more-->\n<p>\n	&nbsp;</p>\n<p>\n	When this was a company of one providing database and web development services the story was simple --&gt; Hi. I&#39;m Dave. I&#39;m a nice guy. Here&#39;s my rate. Here&#39;s what I can do for you. Here&#39;s when I can start. Here&#39;s how long the project will take.</p>\n<p>\n	Now that we&#39;ve grown as a company and our services have expanded, we have a new story to tell. 20Mile is no longer me sitting in my 6x8 home office under the stairs. 20Mile is now eight people (and growing) providing brand, design, development and marketing services for over 100 clients.</p>\n<p>\n	Tim was confident. He tells stories for a living. He&#39;s been doing this for almost 15 years and knew he was up to the challenge of telling our story.</p>\n<p>\n	This brings me back to Tim and the challenge of creating a design that will tell our story. One suggestion was a name change. 20Mile doesn&#39;t provide the foundation for a great story. Tim offered at least 20 reasonable choices (and at least that many unreasonable ones). He created logos for one possible name. Every day or two I&#39;d get an IM from him with a new suggestion. My problem was that</p>\n<p>\n	We are a partner, collaborator, cheerleader, mentor, thinker and listener. We don&#39;t walk into a client (or prospect) and tell them what to do. We listen first. We ask questions. We get to know them, understand their challenges, their business goals, where they&#39;ve been and where they want to go. We guide, suggest, advise, counsel and, when necessary, lead.&nbsp;</p>\n<p>\n	Our strength is in our expertise and our ability to build relationships - both with our clients and their audience. We&#39;re not here to sprint to a finish line, put up a site and disappear. We&#39;re here for the long-term, to help our clients develop and nurture their online identities - to help them tell their stories in a way that will connect with their audience.</p>\n<p>\n	In those days, when people asked me \"Why 20Mile?\" I could explain that the name came to me when I was training for marathons. The 20 mile run was one of the best and worst ways to spend a Sunday morning. I&#39;d head out with a couple friends and we&#39;d keep putting one foot in front of the other for three hours. We&#39;d talk about everything. We&#39;d push and pull each other.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'We are a partner, collaborator, cheerleader, mentor, thinker and listener.','none','20mile\nbusiness\nstories','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(17,1,2,'',NULL,'<p>\n	20Mile Interactive is seeking motivated, self-directed web developers to join our growing team at our Osterville, Cape Cod, Massachusetts office. If you&#39;re interested in this position, please contact Dave Fravel at anytime - 508-419-7439 or use our <a href=\"/contact\">contact page</a>.</p>\n<!--read_more-->\n<h3>\n	Who We Are</h3>\n<p>\n	We are a five year old web design and development firm with offices on Cape Cod and soon to be in Boston. We have over 100 active clients and have implemented over 200 websites. We specialize in modern web design (especially responsive), content management systems and e-commerce implementations.</p>\n<h3>\n	Position Expectations</h3>\n<p>\n	We realize that modern web development encompasses a wide variety of skills and to expect a single individual to be great at all of them is ridiculous. With this in mind, we&rsquo;d love to talk with you if you have any of the following skills. We&rsquo;ve divided these into what we consider Front End Development and Back End Development.</p>\n<h3>\n	Front End Developer Skills</h3>\n<ul>\n	<li>\n		An expert level of HTML/CSS (no Dreamweaver or other WYSIWYG applications, please)</li>\n	<li>\n		Fluency in HTML5 / CSS3</li>\n	<li>\n		Experience in writing Javascript, and in particular JQuery</li>\n	<li>\n		Experience with Responsive Web Design</li>\n	<li>\n		Content Management Systems:\n		<ul>\n			<li>\n				ExpressionEngine</li>\n			<li>\n				WordPress</li>\n			<li>\n				Drupal</li>\n		</ul>\n	</li>\n	<li>\n		Photoshop or Fireworks skills</li>\n	<li>\n		Well-versed in modern web standards and best practices</li>\n	<li>\n		A solid understanding of grids in web design and how to implement them systematically</li>\n	<li>\n		Experience with testing and developing across multiple browsers while maintaining a consistent experience</li>\n	<li>\n		Ability to define and maintain complex and well crafted stylesheets</li>\n	<li>\n		Experience with Git</li>\n	<li>\n		Able to work well individually and collaborate with a team</li>\n	<li>\n		A hatred of the letters I and E</li>\n</ul>\n<h3>\n	Back End Developer Skills</h3>\n<ul>\n	<li>\n		Experience in a LAMP-based architecture</li>\n	<li>\n		Object-oriented PHP</li>\n	<li>\n		PHP Frameworks such as CodeIgniter and Laravel</li>\n	<li>\n		Strong MySQL/Database knowledge - you should understand normalization, joins, query optimization, views, stored procedures and triggers (or at least appreciate that the database is more than a dumping ground for your data - it can actually do some things, too)</li>\n	<li>\n		Experience with Git</li>\n	<li>\n		Experience with API consumption</li>\n	<li>\n		Web service integration using technologies such as XML, SOAP and REST</li>\n	<li>\n		Content Management Systems:\n<ul>	\n\n<li>\n		ExpressionEngine</li>\n	<li>\n		WordPress</li>\n	<li>\n		Drupal</li>\n\n</ul>\n</li>\n	<li>\n		Able to work well individually and collaborate with a team</li>\n</ul>\n<h3>\n	Client Interaction Expectations</h3>\n<p>\n	We have full-time Project and Client Managers that manage the majority of the client interaction, but the web developer is occasionally called upon to speak directly with a client to help guide them through the development process.</p>\n<h3>\n	Internal Interaction</h3>\n<p>\n	Communicate daily with design and project management team to move projects forward<br />\n	Weekly meetings with the project team to manage priorities and set goals for the next week.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'We specialize in modern web design (especially responsive), content management systems and e-commerce implementations.','none','20mile\njobs','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(18,1,2,'',NULL,'<p>\n	I hear this question all the time: \"How can I use git in my ExpressionEngine projects?\" or \"How can I version control my database?\". The short answer is you can&#39;t (a better short answer would be \"I don&#39;t know\"). But the longer anwser is you can, if you are willing to do some pre-project setup and follow some conventions.</p>\n<p>\n	Here is what we have been experimenting at 20MileInteractive:</p>\n<!--read_more-->\n<p>\n	<em>This guide will assume that you are working locally, using MAMP.</em></p>\n<h3>\n	Step 1: Setup a git repo</h3>\n<p>\n	Once you have installed your lincensed copy of ExpressionEngine in your local machine, add a directory named DBSchema to the root of the site. Jump in the terminal and initialize a git repository in it:</p>\n<pre>\ncd ~/projects/new-ee-website&#10;git init&#10;</pre>\n<h3>\n	Step 2: Create and enable hook</h3>\n<p>\n	After initializing your repo, go to the hidden <code>.git</code> directory, where you are going to find a <code>hooks</code> directory. In there create a new file named <code>pre-commit</code> , and make it executable:</p>\n<pre>\ncd .git/hooks/&#10;touch pre-commit&#10;chmod +x pre-commit&#10;</pre>\n<h3>\n	Step 3: Add bash script to hook file</h3>\n<p>\n	Then edit the newly created <code>pre-commit</code> file and add the following code:</p>\n<pre>\n#!/bin/bash&#10;DBUSER=\"db_username\"&#10;DBPASS=\"db_password\"&#10;DB=\"db_name\"&#10;SCHEMAPATH=\"DBSchema\"&#10;&#10;/Applications/MAMP/Library/bin/mysqldump -u $DBUSER -p$DBPASS $DB &gt; $SCHEMAPATH/$DB.sql&#10;git add $SCHEMAPATH/$DB.sql&#10;exit 0&#10;</pre>\n<p>\n	That&#39;s it! What its happening is that we told git that before every commit, run a mysqldump of the database and add it to the stage to be commited.</p>\n<p>\n	Note: I would recommend using this only on development, when working in teams before turning over for content or to the client.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'The longer anwser is you can, if you are willing to do some pre-project setup and follow some conventions.','none','expressionengine\ngit','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),
	(19,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>It\'s no secret that the 20Mile team enjoys an occasional (daily) beer so when the British Beer Company decided it was time for a redesign we were happy to log plenty of hours at the Hyannis local performing brand research. To be certain of our findings, we also spent a lot of time at the Sandwich, Cedarville and Plymouth locals.</p>\n<p>The initial launch of the site in December 2012 was a straightforward responsive website. Since that time, we\'ve implemented e-commerce, a separate Late Night & Events section and are currently at work on an integration with their POS system for a Loyalty program. Each step of the way we\'ve performed all the required onsite brand research. It\'s a tough job, but we\'re happy to do it.</p>','xhtml','BBC_desktop_home_1.jpg\nBBC_desktop_home_2.jpg','none','BBC_tablet_home_1.jpg\nBBC_tablet_home_2.jpg','none','bbc_mobile_1.jpg\nbbc_mobile2.jpg','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'','none'),
	(20,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>In the Spring of 2012 our friends at Bobby Byrnes reached out and shared the news that they were planning a new business in Mashpee Commons - the Lanes Bowl and Bistro. To say that we were excited about this is a huge understatement. A restaurant, 10 lanes of bowling, a bar, entertainment, bocce and an outdoor patio in a part of Mashpee Commons that\'s been an eyesore for years?? We couldn\'t decide what was more exciting - becoming paying customers or designing their new website.</p>\n<p>We had worked with Jeff and his team on the original Bobby Byrnes site and knew what they liked. The 20Mile team partnered with Jeff and Kathy to create a responsive site that has the feel of the restaurant - warm, cozy and inviting.</p>','xhtml','Lanes_desktop_home.jpg','none','Lanes_tablet_home.jpg','none','Lanes_mobile_home.jpg','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'[23] [the-lanes-bowl-bistro] The Lanes Bowl & Bistro','none'),
	(21,1,2,'',NULL,'<p>\n	We&rsquo;re approaching our one-year anniversary with <a href=\"http://www.teamworkpm.net/index.cfm\" target=\"_blank\">TeamworkPM</a>. Switching from Basecamp Classic to Teamwork was one of the hardest decisions that we made, but not a day goes by that we&rsquo;re not grateful for the stability that Teamwork brings to our project management.</p>\n<!--read_more-->\n<h3>\n	The Reason for the Switch - New Basecamp</h3>\n<p>\n	We couldn&rsquo;t wait to get our hands on the New Basecamp. We loved the simplicity of Basecamp Classic, but the interface had grown stale, and the lack of new features was a source of frustration. When we received the notification that New Basecamp was available on our account we closed our eyes and dived right in &hellip; only to discover there was no water in the pool.</p>\n<p>\n	We stared in disbelief at the completely new interface, missing features (what happened to private messages and notebooks?!) and lack of a product roadmap. We felt lost and disappointed. We decided it was time for a change.</p>\n<p>\n	A quick search for \"<a href=\"https://www.google.com/search?hl=en&amp;as_q=alternatives+to+basecamp&amp;as_epq=&amp;as_oq=&amp;as_eq=&amp;as_nlo=&amp;as_nhi=&amp;lr=&amp;cr=&amp;as_qdr=all&amp;as_sitesearch=&amp;as_occt=any&amp;safe=images&amp;tbs=&amp;as_filetype=&amp;as_rights=\" target=\"_blank\">alternatives to basecamp</a>\" lead us to thousands of SEO-heavy top 10 blog posts complete with referral links for us to try out the latest/greatest Basecamp killer.</p>\n<p>\n	We asked the same question on Twitter and were bombarded with salespeople and marketing interns pointing us to their demo sites. We looked at as many as we could stand. We asked friends and colleagues. We even considered writing our own.</p>\n<p>\n	Almost lost in the noise, was a tweet from an Ireland-based company - Teamwork Project Manager. After checking out <a href=\"http://www.teamworkpm.net/index.cfm\" target=\"_blank\">their site</a> and getting a feel for the company, we decided to try it out on a couple of projects.</p>\n<p>\n	We were instantly smitten. After a couple of months we knew we had found our new PM system. It took us awhile to take the official leap and move all 140 of our projects to Teamwork, but we haven&rsquo;t second-guessed the decision once.</p>\n<h3>\n	What we love about it</h3>\n<p>\n	<strong>Constant innovation</strong> - each month there&#39;s something new - not necessarily revolutionary change, but graceful evolution within the platform. Every month we receive their newsletter explaining the new features - this month it was <a href=\"http://engineroom.teamworkpm.net/real-time-updates-for-tasks/\" target=\"_blank\">Real-Time Updates</a>, something that comes in very handy when a few of us are powering through the last-minute tasks prior to launching a new site.</p>\n<p>\n	<strong>They listen to us -</strong>&nbsp;We noticed our clients were asking us to reset their password. We mentioned something through Teamwork Support about this and within a day a nice friendly notice was on every email message through Teamwork. You can thank us for the PS at the bottom of the each Teamwork email (well, technically you can thank the great development team at Teamwork, but we&#39;d like to think we had something to do with it).</p>\n<p>\n	<img alt=\"Password Reminder Feature\" src=\"/images/uploads/new-features.png\" title=\"They actually listen to us\" /></p>\n<p>\n	<strong>Familiar Interface</strong> - It was close enough to Basecamp Classic that our existing clients weren&#39;t overwhelmed. This was a huge plus for us. We had a hard enough time finding our way around New Basecamp. The thought of training 100 clients where messages, tasks and files were now located was overwhelming.</p>\n<p>\n	<strong>Granular Privacy</strong> - When New Basecamp launched, it didn&#39;t have privacy enabled on anything. We had hundreds of private writeboards for internal use only - our perceptions about the project, server information, code samples &hellip; We had private messages and task lists. None of those would work in the New Basecamp. In Teamwork, privacy can be set on a per-item (individual task, message, file, etc) and per-person basis. We have total control over who can see what and when.</p>\n<p>\n	<strong>Templates</strong> - In Teamwork, we have about 25 different templates set up for our standard task lists, message and file categories. These save us a ton of time and ensure that we&rsquo;re consistent across our projects.</p>\n<p>\n	<strong>Time Tracking</strong> - Teamwork allows users to track time on a project (either general time tracking or specific to a task). Tracking time against specific tasks makes more sense than jumping over to Freshbooks to log time on a project as we&rsquo;re in Teamwork every day reviewing and completing the tasks. Tasks can be assigned an estimated time for completion so you can very easily compare your estimates vs actual time spent per task, as well as a running total of time per task list. There&rsquo;s a built-in timer so you can start/end while you work on the task for better accuracy.</p>\n<p>\n	<img alt=\"Time Tracking\" src=\"/images/uploads/time-tracking.png\" title=\"A part of the job - we need to track out time\" /></p>\n<p>\n	<strong>Third-Party Integration</strong> - Rather than attempt to be all things to all people, the TeamworkPM team recognize that &ldquo;No app is an island&rdquo; and have built a great API and a handful of third-party integrations, with more on the horizon. Here are some of our favorites that have made our lives easier.</p>\n<ul>\n	<li>\n		<strong>Google Drive</strong> - We use Google Apps for our domain so we are regular users of Google Docs. Being able to take notes during a meeting with Google Docs and link it directly into the project in Teamwork is a great timesaver and a feature enjoyed by both us and our clients.</li>\n	<li>\n		<strong>Import from Basecamp</strong> - this was obviously a very welcome feature to users switching from Basecamp. While not 100% perfect (we had to manually copy over Writeboards into Notebooks), this got us up and running in Teamwork with 100+ projects in about a day.</li>\n	<li>\n		<strong>Project-based calendars</strong> - Once you&rsquo;ve added in the milestones for a project, you can view the schedule and export it to iCal or Google Calendar via the iCal Feed link at the bottom of the left column. Other options include downloading a PDF or Excel spreadsheet of the calendar.</li>\n	<li>\n		<strong>Billing</strong> - While not a true third-party integration, from the &ldquo;Billing&rdquo; tab, you can see users&rsquo; tracked time and create an invoice to send over to Freshbooks, assigned to a client. Since Freshbooks charges per-user per-month, this will end up saving us approximately $40/month as we can reduce the number of accounts in Freshbooks and have designers and developers track time in Teamwork. The billing tab shows each user&rsquo;s logged time and the project summary.</li>\n</ul>\n<p>\n	<strong>A Roadmap</strong> - yes, they <a href=\"http://www.teamworkpm.net/roadmap\" target=\"_blank\">have one</a> and it&rsquo;s regularly updated.</p>\n<p>\n	<strong>Most importantly - the people at Teamwork</strong> - They are some of the friendliest, most accessible people we&rsquo;ve worked with. If we&rsquo;re going to spend $149/month for a service I&rsquo;d like to actually like the company I&rsquo;m paying. It&rsquo;s very easy to like the people at Teamwork. Their personalities shine through on <a href=\"https://twitter.com/teamworkpm\" target=\"_blank\">Twitter</a> and <a href=\"http://engineroom.teamworkpm.net/\" target=\"_blank\">blog posts</a>. We were Basecamp customers for over five years and never heard from a member of the 37Signals team (and didn&rsquo;t expect to). We&rsquo;ve heard directly (either via email or twitter) from Teamwork over 20 times in less than a year. They take an active interest in us, our experience with the system and always seem to be pushing to make this a better product and a better platform.</p>\n<p>\n	Speaking of the people at Teamwork - I&rsquo;d like to send a special thank you note to <a href=\"https://twitter.com/samkidd\" target=\"_blank\">Sam Kidd</a> who helped nudge the launch of this site with his occasional check-ins.</p>\n<p>\n	&nbsp;</p>\n<p>\n	* <strong>Disclaimer</strong> - We are not writing these posts for referral points or credits for these products. We are purposefully NOT including referral links in these posts. We&rsquo;re only writing about the tools we use and love in the hope that you&rsquo;ll benefit from them. If you&rsquo;d like to try out TeamworkPM, you can <a href=\"http://www.teamworkpm.net/signup/?plan=free\" target=\"_blank\">do so for free here</a>.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'They are some of the friendliest, most accessible people we’ve worked with.','none','project management\ntools','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL),
	(22,1,2,'',NULL,'<p>\n	I love when all of us are together in one office. The creative energy flows and the camaraderie that comes from working together for years shines through. There are jokes about unicorns, receding hairlines, expanding waistlines and Justin Bieber fan club memberships (and those are only the ones directed at Tim).</p>\n<!--read_more-->\n<p>\n	&nbsp;</p>\n<p>\n	Unfortunately, the reality is that we&#39;re all together only once a month. There&#39;s always someone on the road, working from home or at a client&#39;s office. Because of the collaborative approach we take with projects, we need to make sure that our internal communication is solid.</p>\n<p>\n	Over the past five years, we&#39;ve tried a number of methods to keep each other informed. I think we&#39;ve discovered the right mix of tools over the past few months:</p>\n<h3>\n	Google Apps including Hangouts and Chat</h3>\n<p>\n	It has everything we need: mail, calendar, documents, spreadsheets, collaboration, video chat (hangouts) and one-on-one chat sessions. Throw in Boomerang for Mail and Boomerang for Calendar and it&#39;s the application where I spend 95% of my time.</p>\n<p>\n	There is some overlap with our other tools, but for a great all-in-one solution to build our business on, I can&#39;t imagine another product that matches the value for the price of <a href=\"http://www.google.com/intl/en/enterprise/apps/business/\" target=\"_blank\">Google Apps for Business</a>.</p>\n<h3>\n	TeamworkPM</h3>\n<p>\n	I wrote a long, <a href=\"{page_21}\">detailed post</a> on why we love <a href=\"http://teamworkpm.net\" target=\"_blank\">TeamworkPM</a>. I&#39;m amazed when I come across a design studio that doesn&#39;t use any type of project management software. Nearly everything about a project and client relationship makes its way into Teamwork. We also use the integration feature between Google and Teamwork to import documents and spreadsheets from our Google Drive account.</p>\n<h3>\n	HipChat</h3>\n<p>\n	Tim works from his house in Bolton - about 100 miles away from the Cape. We decided to invest some money in a tool that would enable simple group chats and file sharing. Since we moved away from Basecamp, Campfire was no longer an option for us (well, maybe it was, but I wanted to stay away from 37Signals products). We found <a href=\"http://hipchat.com\" target=\"_blank\">HipChat</a> and it does everything we need for $2/user per month:</p>\n<ul>\n	<li>\n		group chat</li>\n	<li>\n		one-on-one chats</li>\n	<li>\n		file sharing</li>\n	<li>\n		history of chat sessions</li>\n</ul>\n<p>\n	It&#39;s always open on our desktops and has a great mobile version (which I used last week while going through the car wash).</p>\n<p>\n	I&#39;d love to say that all of our group chats are professional, but the reality is that we spend most of our time uploading pictures of trapper keepers and unicorns. We talk about our weekend plans and suggest new bio pictures for Tim. This is my favorite:</p>\n<p>\n	<img alt=\"Tim\'s Poppin Tags\" src=\"/images/uploads/tims-headshot.png\" title=\"Tim\'s Poppin Tags Grandpa Style\" /></p>\n<h3>\n	FuzeMeeting</h3>\n<p>\n	After using GoToMeeting for 5+ years for virtual meetings, we made the switch to FuzeBox last month. It&#39;s not a perfect solution for us, but after trying out a number of competitors (webex, goto meeting, joinme and free screen sharing) we decided that <a href=\"http://fuzebox.com\" target=\"_blank\">Fuze</a> was the best option.</p>\n<p>\n	We love the file and screen sharing options and the video and audio quality is better than anything we&#39;ve used before. Some of the account management options could be easier to use and we&#39;ve had issues with phantom &ldquo;audio only meetings&rdquo; showing up in our list of meetings, but based on what we&#39;ve seen, they&#39;ll be the TeamworkPM of video conferencing.</p>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n<p>\n	* <strong>Disclaimer</strong> - We are not writing these posts for referral points or credits for these products. We are purposefully NOT including referral links in these posts. We&#39;re only writing about the tools we use and love in the hope that you&#39;ll benefit from them. If you&#39;d like to try out any of the applications we use, here are their direct links:</p>\n<ul>\n	<li>\n		<a href=\"http://hipchat.com\" target=\"_blank\">HipChat</a></li>\n	<li>\n		<a href=\"http://teamworkpm.net\" target=\"_blank\">TeamworkPM</a></li>\n	<li>\n		<a href=\"http://www.google.com/intl/en/enterprise/apps/business/\" target=\"_blank\">Google Apps</a></li>\n	<li>\n		<a href=\"https://www.fuzebox.com/\" target=\"_blank\">FuzeBox</a></li>\n</ul>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'Over the past five years, we\'ve tried a number of methods to keep each other informed. I think we\'ve discovered the right mix of tools over the past few months.','none','collaboration\ncommunication\ntools','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL),
	(23,1,5,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'Case Study: The Lanes Bowl & Bistro','none','','none','<p>\n	Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nulla vitae elit libero, a pharetra augue. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br />\n	Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nulla vitae elit libero, a pharetra augue. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>','none','http://lanesbowlandbistro.com/','none',1358004664,'UM5','none','1','none','',NULL),
	(24,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>On the corner of Main Street and Cross is the Bradford Inn - one of the prettiest hotels in Chatham with 9 individual houses on the property and walking access to almost everything Chatham has to offer.</p>\n<p>When Shane Coughlin and his team at the Bradford approached us last year for a site redesign we set out to learn more about the people that stay with them. In general terms, the customers tended to be married couples visiting for getaway weekends without the kids. <!-- In most cases, the wife was making the arrangements. --> The problem with the old site was the lack of photography and dark, uninviting design. With some help from a favorite consultant of ours, <a href=\"http://vervaine.com/\" title=\"Ali and the Vervaine team\" target=\"_blank\">Ali Parker</a>, we got to work on implementing a brighter design that would showcase the beauty of the Inn.</p>\n\n<p>Coming up in 2013 - a conversion to a responsive site</p>','xhtml','Bradford_desktop_home.jpg','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'','none'),
	(25,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>We continue to enjoy a successful partnership with the Marketing Team at EPS Communications. Dan Segal and his team provide the creative direction, designs and marketing goals for a project and we support them with the development and technical implementation.&nbsp;</p>\n<p>Over the past three years we’ve launched 8 separate websites for the MIT MBA programs including the <a href=\"http://emba.mit.edu/admissions/tuition-and-expenses/\" title=\"EMBA Program\" target=\"_blank\">$145,000, two-year Executive MBA program</a>. The site includes integration with our custom lead management application, a multi-author blog, a video blog and A/B testing on the lead forms.&nbsp;</p>\n\n<p><span>Coming up in late 2013 - a mobile version of the site, registration and attendance tracking.</span></p>','xhtml','EMBA_desktop_home.jpg','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'','none'),
	(26,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>We\'re truly blessed on the Cape to have the Cotuit Center for the Arts. Every day they offer something for the community - educational classes for all ages, world-class performances, art showings, movie nights and concerts. We\'re honored to be a Patron Level Sponsor for this amazing organization.&nbsp;</p>\n<p>When we started our discussion with them about a new site, they were in the beginning stage of a <a href=\"https://www.blackbaud.com/ticketing/altru-ticketing-software\" title=\"Altru\" target=\"_blank\">Blackbaud Altru</a> implementation and wanted to integrate the ticket buying process into the site. We worked with David and Daniel at the Center along with the technical team at Blackbaud to connect the two sites and make purchasing tickets a seamless transaction.&nbsp;</p>\n\n<p>Coming up in 2013 - a mobile version of the site.&nbsp;</p>','xhtml','CCFTA_large_home_full2.jpg','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'','none'),
	(27,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>With over 1,500 pages of content, the Intranet, integrations with a job opportunity site, physician finder, medical library and Brightcove video hosting, the Cape Cod Healthcare website is one of the most complex that we maintain. We\'ve worked with the CCHC marketing team for nearly four years and three redesigns (now onto the fourth) to meet the healthcare education needs of the Cape Cod community. As the largest healthcare provider on the Cape, CCHC takes its responsibility to educate, inform and provide great care to our community very seriously. &nbsp;</p>\n<p>Coming up in 2013 - a new, responsive design.</p>','xhtml','CCHC_large_home_full.jpg\nCCHC_desktop_home.jpg','none','','none','CCHC_mobile_home.png','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'','none');

/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_entries_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'channel',
  `field_related_id` int(6) unsigned NOT NULL DEFAULT '0',
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL DEFAULT '0',
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`)
VALUES
	(1,1,1,'page_content','Page Content','','wygwam','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(2,1,2,'journal_content','Journal Content','','wygwam','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(4,1,3,'team_bio','Team Bio','','wygwam','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(5,1,3,'profile_photo','Profile Photo','Full photo for profile detail page','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(6,1,3,'profile_headshot','Profile Headshot','Headshot for thumbnail','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(7,1,3,'job_title','Job Title','','text','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','y','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(8,1,3,'profile_group_color','Group Color','','pt_dropdown','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',5,'any','YTo3OntzOjc6Im9wdGlvbnMiO2E6NTp7czo2OiI3NEJERTgiO3M6OToiT3duZXJzaGlwIjtzOjY6IkVERUNFOCI7czoxNToiUHJvamVjdCBNYW5hZ2VyIjtzOjY6IkE1Q0QzOCI7czoxNzoiRGVzaWduZXIvQ3JlYXRpdmUiO3M6NjoiRjA1OTIxIjtzOjExOiJEZXZlbG9wbWVudCI7czo2OiJGRkZGRkYiO3M6NjoiT2ZmaWNlIjt9czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(9,1,3,'profile_twitter','Twitter','','text','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(10,1,3,'profile_linkedin','Linkedin','','text','','0',0,0,'channel',2,'title','desc',0,6,250,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(11,1,3,'profile_first_question','First Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(12,1,3,'profile_second_question','Second Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',9,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(13,1,3,'profile_third_question','Third Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',10,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(14,1,2,'journal_blockquote','Blockquote','','text','','0',0,0,'channel',2,'title','desc',0,6,250,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(15,1,2,'journal_tags','Tags','','tag','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',3,'any','YToxMDp7czo4OiJhbGxfb3BlbiI7czoyOiJubyI7czoxMjoic3VnZ2VzdF9mcm9tIjtzOjU6Imdyb3VwIjtzOjk6InRhZ19ncm91cCI7czoxOiIxIjtzOjEzOiJ0b3BfdGFnX2xpbWl0IjtzOjE6IjMiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(16,1,4,'result_description','Description','','rte','','0',0,0,'channel',2,'title','desc',0,10,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjI0OiJydGVfZmllbGRfdGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJydGVfdGFfcm93cyI7czoyOiIxMCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(17,1,4,'result_desktop_images','Desktop Images','','assets','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZTozIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJsYXJnZSI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToieSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(18,1,4,'result_tablet_images','Tablet Images','','assets','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZTo0Ijt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJsYXJnZSI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToieSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(19,1,4,'result_mobile_images','Mobile Images','','assets','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZTo1Ijt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJsYXJnZSI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToieSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(20,1,5,'case_study_tag_line','Tag Line','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(21,1,5,'case_study_case_title','Case Title','This is the title in orange, bellow the screens.','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(22,1,5,'case_study_content','Content','','wygwam','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(23,1,5,'case_study_url','URL','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(24,1,5,'case_study_launch_date','Launch Date','','date','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(25,1,5,'case_study_fact_sheet','Fact Sheet','','matrix','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',6,'any','YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6MTp7aTowO2k6NDt9fQ=='),
	(26,1,4,'case_study','Case Study','','playa','','0',0,0,'channel',5,'title','desc',0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMjp7czo1OiJtdWx0aSI7czoxOiJuIjtzOjc6ImV4cGlyZWQiO3M6MToibiI7czo2OiJmdXR1cmUiO3M6MToieSI7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI1Ijt9czo3OiJvcmRlcmJ5IjtzOjU6InRpdGxlIjtzOjQ6InNvcnQiO3M6MzoiQVNDIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');

/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_member_groups`;

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_channel_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`)
VALUES
	(1,1,3,2,0,0,'173.162.198.217','Dave Fravel','dfravel','open','y',0,0,0,0,'n','n',1359839619,'n','2013','02','02',0,0,20130326143140,NULL,0),
	(2,1,3,3,0,0,'173.162.198.217','Rodrigo Passos','rpassos','open','y',0,0,0,0,'n','n',1359839892,'n','2013','02','02',0,0,20130327204713,NULL,0),
	(3,1,3,4,0,0,'173.162.198.217','Tim Merrill','tmerrill','open','y',0,0,0,0,'n','n',1359840032,'n','2013','02','02',0,0,20130326134233,NULL,0),
	(4,1,3,5,0,0,'173.162.198.217','Sue Malomo','smalomo','open','y',0,0,0,0,'n','n',1359841496,'n','2013','02','02',0,0,20130327194857,NULL,0),
	(5,1,3,6,0,0,'173.162.198.217','David Fontes','dfontes','open','y',0,0,0,0,'n','n',1359841538,'n','2013','02','02',0,0,20130327191639,NULL,0),
	(6,1,3,7,0,0,'173.162.198.217','Amy Reddington','areddington','open','y',0,0,0,0,'n','n',1359841551,'n','2013','02','02',0,0,20130326133852,NULL,0),
	(7,1,3,8,0,0,'173.162.198.217','Chris OBrien','cobrien','open','y',0,0,0,0,'n','n',1359841597,'n','2013','02','02',0,0,20130326141238,NULL,0),
	(8,1,3,9,0,0,'173.162.198.217','Emily OBrien','eobrien','open','y',0,0,0,0,'n','n',1359841602,'n','2013','02','02',0,0,20130327200043,NULL,0),
	(9,1,3,1,0,0,'71.233.247.104','Admin','admin','open','y',0,0,0,0,'y','n',1359854848,'n','2013','02','02',0,0,20130202202728,NULL,0),
	(10,1,1,1,0,NULL,'127.0.0.1','Home','home','open','y',0,0,0,0,'n','n',1363018914,'n','2013','03','11',0,0,20130312141855,0,0),
	(11,1,1,1,0,NULL,'173.162.198.217','Expertise','expertise','open','y',0,0,0,0,'n','n',1363018915,'n','2013','03','11',0,0,20130327142156,0,0),
	(12,1,1,1,0,NULL,'66.31.214.179','Results','results','open','y',0,0,0,0,'n','n',1363018999,'n','2013','03','11',0,0,20130326174820,0,0),
	(13,1,1,1,0,NULL,'173.162.198.217','Team','team','open','y',0,0,0,0,'n','n',1363019506,'n','2013','03','11',0,0,20130327200947,0,0),
	(14,1,1,1,0,NULL,'127.0.0.1','Journal','journal','open','y',0,0,0,0,'n','n',1363019561,'n','2013','03','11',0,0,20130312170442,0,0),
	(15,1,1,1,0,NULL,'173.162.198.217','Contact','contact','open','y',0,0,0,0,'n','n',1363019558,'n','2013','03','11',0,0,20130326190939,0,0),
	(16,1,2,2,0,NULL,'127.0.0.1','The Story Behind 20Mile','the-story-behind-20mile','closed','y',0,0,0,0,'n','n',1363189277,'n','2013','03','13',0,0,20130326161919,0,0),
	(17,1,2,2,0,NULL,'173.162.198.217','We’re Hiring - Web Developer','were-hiring-web-developer','open','y',0,0,0,0,'n','n',1363008562,'n','2013','03','11',0,0,20130326141123,0,0),
	(18,1,2,3,0,NULL,'173.162.198.217','ExpressionEngine and Git: Using Git Hooks to Track Database Changes','expressionengine-and-git-using-git-hooks-to-track-database-changes','open','y',0,0,0,0,'n','n',1362844141,'n','2013','03','09',0,0,20130325195702,0,0),
	(19,1,4,1,0,NULL,'173.162.198.217','British Beer Company','british-beer-company','open','y',0,0,0,0,'n','n',1364413246,'n','2013','03','27',0,0,20130327204747,0,0),
	(20,1,4,1,0,NULL,'173.162.198.217','The Lanes Bowl & Bistro','the-lanes-bowl-bistro','open','y',0,0,0,0,'n','n',1364303737,'n','2013','03','26',0,0,20130328142538,0,0),
	(21,1,2,2,0,NULL,'173.162.198.217','Why we use TeamworkPM','why-we-use-teamworkpm','open','y',0,0,0,0,'n','n',1364310052,'n','2013','03','26',0,0,20130326233653,0,0),
	(22,1,2,2,0,NULL,'173.162.198.217','How We Manage Internal Communication','how-we-manage-internal-communication','open','y',0,0,0,0,'n','n',1364314967,'n','2013','03','26',0,0,20130326231048,0,0),
	(23,1,5,1,0,NULL,'173.162.198.217','The Lanes Bowl & Bistro','the-lanes-bowl-bistro','open','y',0,0,0,0,'n','n',1364394664,'n','2013','03','27',0,0,20130327144405,0,0),
	(24,1,4,1,0,NULL,'173.162.198.217','Bradford Inn','bradford-inn','open','y',0,0,0,0,'n','n',1364397241,'n','2013','03','27',0,0,20130328142502,0,0),
	(25,1,4,1,0,NULL,'173.162.198.217','MIT Executive MBA Program','mit-executive-mba-program','open','y',0,0,0,0,'n','n',1364247802,'n','2013','03','25',0,0,20130327205023,0,0),
	(26,1,4,1,0,NULL,'173.162.198.217','Cotuit Center for the Arts','cotuit-center-for-the-arts','open','y',0,0,0,0,'n','n',1364334109,'n','2013','03','26',0,0,20130327204550,0,0),
	(27,1,4,1,0,NULL,'173.162.198.217','Cape Cod Healthcare','cape-cod-healthcare','open','y',0,0,0,0,'n','n',1362173389,'n','2013','03','01',0,0,20130327204550,0,0);

/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`)
VALUES
	(1,1,'pages','Pages','http://20mile.20miletech.net/','','en',6,0,1363019561,0,'',1,'open',1,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,'','','y','','n',10,'','',0),
	(2,1,'journal','Journal','http://20mile.20miletech.net/',NULL,'en',4,0,1364314967,0,'1',1,'open',2,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),
	(3,1,'team_profiles','Team Profiles','http://20mile.20miletech.net/',NULL,'en',9,0,1359854848,0,'',1,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),
	(4,1,'results','Results','http://20mile/',NULL,'en',6,0,1364413246,0,'1',1,'open',4,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),
	(5,1,'case_study','Case Study','http://20mile/',NULL,'en',1,0,1364394664,0,'1',1,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0);

/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`)
VALUES
	(1,1,1,'admin','173.162.198.217',1359648945,'Logged in'),
	(2,1,1,'admin','173.162.198.217',1359648970,'Logged in'),
	(3,1,1,'admin','173.162.198.217',1359734790,'Logged in'),
	(4,1,1,'admin','173.162.198.217',1359735087,'Channel Created:&nbsp;&nbsp;pages'),
	(5,1,1,'admin','173.162.198.217',1359735134,'Field Group Created:&nbsp;Pages Fields'),
	(6,1,1,'admin','173.162.198.217',1359735209,'Field Group Created:&nbsp;Journal Fields'),
	(7,1,1,'admin','173.162.198.217',1359837983,'Logged in'),
	(8,1,1,'admin','173.162.198.217',1359838028,'Channel Created:&nbsp;&nbsp;Journal'),
	(9,1,1,'admin','173.162.198.217',1359839333,'Channel Created:&nbsp;&nbsp;Team Profiles'),
	(10,1,1,'admin','173.162.198.217',1359839353,'Field Group Created:&nbsp;Team Profile fields'),
	(11,1,1,'admin','173.162.198.217',1359839594,'Member profile created:&nbsp;&nbsp;dfravel'),
	(12,1,1,'admin','173.162.198.217',1359839975,'Member profile created:&nbsp;&nbsp;rpassos'),
	(13,1,1,'admin','173.162.198.217',1359840014,'Member profile created:&nbsp;&nbsp;tmerrill'),
	(14,1,1,'admin','173.162.198.217',1359841487,'Member profile created:&nbsp;&nbsp;smalomo'),
	(15,1,1,'admin','173.162.198.217',1359841521,'Member profile created:&nbsp;&nbsp;dfontes'),
	(16,1,1,'admin','173.162.198.217',1359841547,'Member profile created:&nbsp;&nbsp;areddington'),
	(17,1,1,'admin','173.162.198.217',1359841576,'Member profile created:&nbsp;&nbsp;cobrien'),
	(18,1,1,'admin','173.162.198.217',1359841601,'Member profile created:&nbsp;&nbsp;eobrien'),
	(19,1,1,'admin','71.233.247.104',1359854822,'Logged in'),
	(20,1,1,'admin','173.162.198.217',1362667443,'Logged in'),
	(21,1,1,'admin','127.0.0.1',1363017873,'Logged in'),
	(22,1,1,'admin','127.0.0.1',1363094883,'Logged in'),
	(23,1,1,'admin','127.0.0.1',1363095655,'Category Group Created:&nbsp;&nbsp;Expertise'),
	(24,1,1,'admin','127.0.0.1',1363105848,'Logged in'),
	(25,1,1,'admin','127.0.0.1',1363107940,'Field Group Created:&nbsp;Result Fields'),
	(26,1,1,'admin','127.0.0.1',1363107953,'Channel Created:&nbsp;&nbsp;Results'),
	(27,1,1,'admin','127.0.0.1',1363115952,'Logged out'),
	(28,1,1,'admin','127.0.0.1',1363116401,'Logged in'),
	(29,1,1,'admin','127.0.0.1',1363183093,'Logged in'),
	(30,1,1,'admin','127.0.0.1',1363194693,'Logged in'),
	(31,1,1,'admin','127.0.0.1',1363265884,'Logged in'),
	(32,1,1,'admin','127.0.0.1',1363279944,'Field Group Created:&nbsp;Case Study Fields'),
	(33,1,1,'admin','127.0.0.1',1363280203,'Channel Created:&nbsp;&nbsp;Case Study'),
	(34,1,1,'admin','127.0.0.1',1363355314,'Logged in'),
	(35,1,1,'admin','127.0.0.1',1363363461,'Logged in'),
	(36,1,1,'admin','127.0.0.1',1364228001,'Logged in'),
	(37,1,1,'admin','173.162.198.217',1364239914,'Logged in'),
	(38,1,1,'admin','173.162.198.217',1364303716,'Logged in'),
	(39,1,1,'admin','173.162.198.217',1364305308,'Logged in'),
	(40,1,1,'admin','66.31.214.179',1364319877,'Logged in'),
	(41,1,1,'admin','173.162.198.217',1364324331,'Logged in'),
	(42,1,1,'admin','173.162.198.217',1364325225,'Logged out'),
	(43,1,1,'admin','76.118.147.155',1364336288,'Logged in'),
	(44,1,2,'dfravel','173.162.198.217',1364387500,'Logged in'),
	(45,1,1,'admin','173.162.198.217',1364392160,'Logged in'),
	(46,1,1,'admin','173.162.198.217',1364392689,'Logged in'),
	(47,1,1,'admin','173.162.198.217',1364398404,'Logged in'),
	(48,1,2,'dfravel','173.162.198.217',1364401230,'Logged out'),
	(49,1,2,'dfravel','173.162.198.217',1364402855,'Logged in'),
	(50,1,1,'admin','173.162.198.217',1364408413,'Logged in'),
	(51,1,1,'admin','173.162.198.217',1364414286,'Logged in'),
	(52,1,1,'admin','173.162.198.217',1364477547,'Logged in'),
	(53,1,1,'admin','173.162.198.217',1364480522,'Logged in');

/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_search_index`;

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_detours
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_detours`;

CREATE TABLE `exp_detours` (
  `detour_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_url` varchar(250) DEFAULT NULL,
  `new_url` varchar(250) DEFAULT '',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `detour_method` int(3) unsigned DEFAULT '301',
  `site_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`detour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_detours_hits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_detours_hits`;

CREATE TABLE `exp_detours_hits` (
  `hit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detour_id` int(10) unsigned DEFAULT NULL,
  `hit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`hit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_developer_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_developer_log`;

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache_mg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_email_console_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_email_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_tracker`;

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_entry_ping_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_ping_status`;

CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_entry_versioning
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`)
VALUES
	(1,'Safecracker_ext','form_declaration_modify_data','form_declaration_modify_data','',10,'2.1','y'),
	(2,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0','y'),
	(3,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0','y'),
	(4,'Rte_ext','publish_form_entry_data','publish_form_entry_data','',10,'1.0','y'),
	(5,'Matrix_ext','channel_entries_tagdata','channel_entries_tagdata','',10,'2.5.3','y'),
	(6,'Playa_ext','channel_entries_tagdata','channel_entries_tagdata','',9,'4.3.3','y'),
	(7,'Structure_ext','entry_submission_redirect','entry_submission_redirect','',10,'3.3.8','y'),
	(8,'Structure_ext','cp_member_login','cp_member_login','',10,'3.3.8','y'),
	(9,'Structure_ext','sessions_start','sessions_start','',10,'3.3.8','y'),
	(10,'Structure_ext','channel_module_create_pagination','channel_module_create_pagination','',9,'3.3.8','y'),
	(11,'Structure_ext','wygwam_config','wygwam_config','',10,'3.3.8','y'),
	(12,'Structure_ext','core_template_route','core_template_route','',10,'3.3.8','y'),
	(13,'Structure_ext','entry_submission_end','entry_submission_end','',10,'3.3.8','y'),
	(14,'Structure_ext','safecracker_submit_entry_end','safecracker_submit_entry_end','',10,'3.3.8','y'),
	(16,'Assets_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.0.3','y'),
	(17,'Assets_ext','file_after_save','file_after_save','',9,'2.0.3','y'),
	(18,'Assets_ext','files_after_delete','files_after_delete','',8,'2.0.3','y'),
	(19,'Detour_pro_ext','sessions_start','sessions_start','b:0;',1,'1.3.2','y'),
	(20,'Super_search_ext','entry_submission_absolute_end','entry_submission_absolute_end','',10,'2.0.5','y'),
	(21,'Super_search_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.0.5','y'),
	(22,'Super_search_ext','refresh_cache_from_template','edit_template_end','',10,'2.0.5','y'),
	(23,'Super_search_ext','refresh_cache_from_weblog','submit_new_entry_end','',10,'2.0.5','y'),
	(24,'Super_search_ext','refresh_cache_from_weblog','entry_submission_end','',10,'2.0.5','y'),
	(25,'Super_search_ext','refresh_cache_from_category','publish_admin_update_category','',10,'2.0.5','y'),
	(26,'Super_search_ext','sessions_end_processor','sessions_end','',10,'2.0.5','y'),
	(27,'Super_search_ext','super_search_alter_search_check_group','super_search_alter_search','',5,'2.0.5','y'),
	(28,'Super_search_ext','super_search_alter_search_multiselect','super_search_alter_search','',6,'2.0.5','y'),
	(29,'Super_search_ext','super_search_alter_search_playa','super_search_alter_search','',7,'2.0.5','y'),
	(30,'Super_search_ext','super_search_alter_search_relationship','super_search_alter_search','',4,'2.0.5','y'),
	(31,'Super_search_ext','super_search_extra_basic_fields_tag','super_search_extra_basic_fields','',5,'2.0.5','y'),
	(32,'Super_search_ext','super_search_alter_ids_tag','super_search_alter_ids','',5,'2.0.5','y'),
	(33,'Super_search_ext','super_search_do_search_and_array_playa','super_search_do_search_and_array','',5,'2.0.5','y'),
	(37,'Profile_ext','member_member_register','member_member_register','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(38,'Profile_ext','cp_members_member_create','cp_members_member_create','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(39,'Profile_ext','cp_js_end','cp_js_end','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(40,'Profile_ext','entry_submission_start','entry_submission_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(41,'Profile_ext','safecracker_entry_form_tagdata_start','safecracker_entry_form_tagdata_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(42,'Profile_ext','safecracker_submit_entry_start','safecracker_submit_entry_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(43,'Profile_ext','safecracker_submit_entry_end','safecracker_submit_entry_end','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(44,'Profile_ext','publish_form_entry_data','publish_form_entry_data','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),
	(45,'Profile_ext','entry_submission_redirect','entry_submission_redirect','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',1,'1.0.7','y'),
	(46,'Tag_ext','delete_entries_start','delete_entries_start','',4,'4.2.1','y'),
	(47,'Tag_ext','sessions_end','sessions_end','',4,'4.2.1','y'),
	(48,'Tag_ext','entry_submission_end','entry_submission_end','',4,'4.2.1','y'),
	(49,'Tag_ext','cp_js_end','cp_js_end','',4,'4.2.1','y'),
	(50,'Freebie_ext','Freebie_ext','sessions_start','a:7:{s:9:\"to_ignore\";s:6:\"filter\";s:13:\"ignore_beyond\";s:6:\"filter\";s:14:\"break_category\";s:2:\"no\";s:14:\"remove_numbers\";s:2:\"no\";s:23:\"always_parse_pagination\";s:2:\"no\";s:12:\"always_parse\";s:0:\"\";s:13:\"cache_cleared\";s:3:\"yes\";}',10,'0.2','y');

/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_formatting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_formatting`;

CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`)
VALUES
	(1,1,'none'),
	(2,1,'br'),
	(3,1,'xhtml'),
	(4,2,'none'),
	(5,2,'br'),
	(6,2,'xhtml'),
	(10,4,'none'),
	(11,4,'br'),
	(12,4,'xhtml'),
	(13,5,'none'),
	(14,5,'br'),
	(15,5,'xhtml'),
	(16,6,'none'),
	(17,6,'br'),
	(18,6,'xhtml'),
	(19,7,'none'),
	(20,7,'br'),
	(21,7,'xhtml'),
	(22,8,'none'),
	(23,8,'br'),
	(24,8,'xhtml'),
	(25,9,'none'),
	(26,9,'br'),
	(27,9,'xhtml'),
	(28,10,'none'),
	(29,10,'br'),
	(30,10,'xhtml'),
	(31,11,'none'),
	(32,11,'br'),
	(33,11,'xhtml'),
	(34,12,'none'),
	(35,12,'br'),
	(36,12,'xhtml'),
	(37,13,'none'),
	(38,13,'br'),
	(39,13,'xhtml'),
	(40,14,'none'),
	(41,14,'br'),
	(42,14,'xhtml'),
	(43,15,'none'),
	(44,15,'br'),
	(45,15,'xhtml'),
	(46,16,'none'),
	(47,16,'br'),
	(48,16,'xhtml'),
	(49,17,'none'),
	(50,17,'br'),
	(51,17,'xhtml'),
	(52,18,'none'),
	(53,18,'br'),
	(54,18,'xhtml'),
	(55,19,'none'),
	(56,19,'br'),
	(57,19,'xhtml'),
	(58,20,'none'),
	(59,20,'br'),
	(60,20,'xhtml'),
	(61,21,'none'),
	(62,21,'br'),
	(63,21,'xhtml'),
	(64,22,'none'),
	(65,22,'br'),
	(66,22,'xhtml'),
	(67,23,'none'),
	(68,23,'br'),
	(69,23,'xhtml'),
	(70,24,'none'),
	(71,24,'br'),
	(72,24,'xhtml'),
	(73,25,'none'),
	(74,25,'br'),
	(75,25,'xhtml'),
	(76,26,'none'),
	(77,26,'br'),
	(78,26,'xhtml');

/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`)
VALUES
	(1,1,'Pages Fields'),
	(2,1,'Journal Fields'),
	(3,1,'Team Profile fields'),
	(4,1,'Result Fields'),
	(5,1,'Case Study Fields');

/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`)
VALUES
	(1,'select','1.0','YTowOnt9','n'),
	(2,'text','1.0','YTowOnt9','n'),
	(3,'textarea','1.0','YTowOnt9','n'),
	(4,'date','1.0','YTowOnt9','n'),
	(5,'file','1.0','YTowOnt9','n'),
	(6,'multi_select','1.0','YTowOnt9','n'),
	(7,'checkboxes','1.0','YTowOnt9','n'),
	(8,'radio','1.0','YTowOnt9','n'),
	(9,'rel','1.0','YTowOnt9','n'),
	(10,'rte','1.0','YTowOnt9','n'),
	(11,'freeform','4.0.10','YTowOnt9','n'),
	(12,'matrix','2.5.2','YTowOnt9','y'),
	(13,'playa','4.3.3','YTowOnt9','y'),
	(14,'structure','3.3.8','YTowOnt9','n'),
	(15,'wygwam','2.7','YTowOnt9','y'),
	(16,'assets','2.0.3','YTowOnt9','y'),
	(18,'pt_dropdown','1.0.3','YTowOnt9','n'),
	(19,'tag','4.0.2','YTowOnt9','n');

/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_categories`;

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_file_dimensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_dimensions`;

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;

INSERT INTO `exp_file_dimensions` (`id`, `site_id`, `upload_location_id`, `title`, `short_name`, `resize_type`, `width`, `height`, `watermark_id`)
VALUES
	(2,1,5,'thumb','thumb','constrain',31,54,0),
	(3,1,3,'thumb','thumb','constrain',355,202,0),
	(4,1,4,'thumb','thumb','constrain',90,112,0),
	(5,1,4,'full','full','constrain',482,600,0),
	(6,1,3,'full','full','none',1054,600,0),
	(7,1,5,'full','full','none',344,600,0);

/*!40000 ALTER TABLE `exp_file_dimensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_watermarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_watermarks`;

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_files`;

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`)
VALUES
	(1,1,'dave-fravel-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-c.jpg','image/jpeg','dave-fravel-c.jpg',77709,NULL,NULL,NULL,1,1363118776,1,1364477615,'656 437'),
	(2,1,'dave-fravel-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-bw.jpg','image/jpeg','dave-fravel-bw.jpg',18533,NULL,NULL,NULL,1,1363118788,1,1364477614,'316 255'),
	(3,1,'amy-reddington-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-bw.jpg','image/jpeg','amy-reddington-bw.jpg',21177,NULL,NULL,NULL,1,1362155165,1,1364477614,'316 255'),
	(4,1,'amy-reddington-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-c.jpg','image/jpeg','amy-reddington-c.jpg',80783,NULL,NULL,NULL,1,1362157353,1,1364477614,'656 437'),
	(5,1,'chris-obrien-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-bw.jpg','image/jpeg','chris-obrien-bw.jpg',23939,NULL,NULL,NULL,1,1362155161,1,1364477614,'316 255'),
	(6,1,'chris-obrien-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-c.jpg','image/jpeg','chris-obrien-c.jpg',90119,NULL,NULL,NULL,1,1362157351,1,1364477614,'656 437'),
	(7,1,'dave-fontes-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-bw.jpg','image/jpeg','dave-fontes-bw.jpg',19917,NULL,NULL,NULL,1,1362157307,1,1364477614,'316 255'),
	(8,1,'dave-fontes-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-c.jpg','image/jpeg','dave-fontes-c.jpg',75420,NULL,NULL,NULL,1,1362157349,1,1364477614,'656 437'),
	(9,1,'emily-obrien-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-bw.jpg','image/jpeg','emily-obrien-bw.jpg',20765,NULL,NULL,NULL,1,1362155156,1,1364477615,'316 255'),
	(10,1,'emily-obrien-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-c.jpg','image/jpeg','emily-obrien-c.jpg',76684,NULL,NULL,NULL,1,1362157344,1,1364477615,'656 437'),
	(11,1,'rodrigo-passos-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-bw.jpg','image/jpeg','rodrigo-passos-bw.jpg',21010,NULL,NULL,NULL,1,1362155154,1,1364477615,'316 255'),
	(12,1,'rodrigo-passos-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-c.jpg','image/jpeg','rodrigo-passos-c.jpg',79479,NULL,NULL,NULL,1,1362157342,1,1364477615,'656 437'),
	(13,1,'sue-malomo-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-bw.jpg','image/jpeg','sue-malomo-bw.jpg',26792,NULL,NULL,NULL,1,1362155152,1,1364477615,'316 255'),
	(14,1,'sue-malomo-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-c.jpg','image/jpeg','sue-malomo-c.jpg',88412,NULL,NULL,NULL,1,1362157339,1,1364477615,'656 437'),
	(15,1,'tim-merrill-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-bw.jpg','image/jpeg','tim-merrill-bw.jpg',17438,NULL,NULL,NULL,1,1362155150,1,1364477615,'316 255'),
	(16,1,'tim-merrill-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-c.jpg','image/jpeg','tim-merrill-c.jpg',69183,NULL,NULL,NULL,1,1362157338,1,1364477615,'656 437'),
	(17,1,'BBC_large_home_full2.jpg',3,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/desktop/BBC_large_home_full2.jpg','image/jpeg','BBC_large_home_full2.jpg',301801,NULL,NULL,NULL,1,1363285825,1,1364477619,'994 1218'),
	(18,1,'BBC_large_home_full3.jpg',3,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/desktop/BBC_large_home_full3.jpg','image/jpeg','BBC_large_home_full3.jpg',219139,NULL,NULL,NULL,1,1363289060,1,1364477619,'864 1218'),
	(19,1,'bbc_mobile_1.jpg',5,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/mobile/bbc_mobile_1.jpg','image/jpeg','bbc_mobile_1.jpg',71157,NULL,NULL,NULL,1,1363289222,1,1364477626,'712 385'),
	(20,1,'bbc_mobile2.jpg',5,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/mobile/bbc_mobile2.jpg','image/jpeg','bbc_mobile2.jpg',68058,NULL,NULL,NULL,1,1363289222,1,1364477626,'712 385'),
	(21,1,'BBC_tablet_full3.jpg',4,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/tablet/BBC_tablet_full3.jpg','image/jpeg','BBC_tablet_full3.jpg',123732,NULL,NULL,NULL,1,1363289228,1,1364477630,'979 746'),
	(22,1,'BBC_tablet_full2.jpg',4,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/tablet/BBC_tablet_full2.jpg','image/jpeg','BBC_tablet_full2.jpg',212076,NULL,NULL,NULL,1,1363289228,1,1364477630,'1083 746'),
	(23,1,'amy-reddington-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-bw@2x.png','image/png','amy-reddington-bw@2x.png',164462,NULL,NULL,NULL,1,1364219818,1,1364477614,'604 482'),
	(24,1,'chris-obrien-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-bw@2x.png','image/png','chris-obrien-bw@2x.png',169066,NULL,NULL,NULL,1,1364220066,1,1364477614,'604 482'),
	(25,1,'dave-fontes-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-bw@2x.png','image/png','dave-fontes-bw@2x.png',164422,NULL,NULL,NULL,1,1364219962,1,1364477614,'604 482'),
	(26,1,'dave-fravel-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-bw@2x.png','image/png','dave-fravel-bw@2x.png',160239,NULL,NULL,NULL,1,1364219982,1,1364477615,'604 482'),
	(27,1,'emily-obrien-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-bw@2x.png','image/png','emily-obrien-bw@2x.png',166324,NULL,NULL,NULL,1,1364219901,1,1364477615,'604 482'),
	(28,1,'rodrigo-passos-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-bw@2x.png','image/png','rodrigo-passos-bw@2x.png',162692,NULL,NULL,NULL,1,1364219866,1,1364477615,'604 482'),
	(29,1,'sue-malomo-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-bw@2x.png','image/png','sue-malomo-bw@2x.png',185311,NULL,NULL,NULL,1,1364219943,1,1364477615,'604 482'),
	(30,1,'tim-merrill-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-bw@2x.png','image/png','tim-merrill-bw@2x.png',165847,NULL,NULL,NULL,1,1364219921,1,1364477615,'604 482'),
	(31,1,'tims-headshot.png',1,'/var/www/vhosts/20miletech.net/20mile/images/uploads/tims-headshot.png','image/png','tims-headshot.png',405527,NULL,NULL,NULL,1,1364324536,1,1364477612,'479 592'),
	(32,1,'time-tracking.png',1,'/var/www/vhosts/20miletech.net/20mile/images/uploads/time-tracking.png','image/png','time-tracking.png',7340,NULL,NULL,NULL,1,1364339333,1,1364477612,'144 211'),
	(33,1,'new-features.png',1,'/var/www/vhosts/20miletech.net/20mile/images/uploads/new-features.png','image/png','new-features.png',11733,NULL,NULL,NULL,1,1364339366,1,1364477612,'58 394'),
	(34,1,'Lanes_large_home_full.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/Lanes_large_home_full.jpg','image/jpeg','Lanes_large_home_full.jpg',169588,'','','',1,1364393339,1,1364477621,'994 1218'),
	(35,1,'Lanes_tablet_home_full.jpg',4,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/tablet/Lanes_tablet_home_full.jpg','image/jpeg','Lanes_tablet_home_full.jpg',56964,'','','',1,1364393797,1,1364477630,'600 414'),
	(36,1,'Lanes_mobile_home_full.jpg',5,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/mobile/Lanes_mobile_home_full.jpg','image/jpeg','Lanes_mobile_home_full.jpg',93426,'','','',1,1364394161,1,1364477626,'1000 385'),
	(38,1,'index.html',1,'/var/www/vhosts/20miletech.net/20mile/images/uploads/index.html','text/html','index.html',114,NULL,NULL,NULL,1,1364232843,1,1364232843,' '),
	(39,1,'BI_large_home_full-2.gif',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/BI_large_home_full-2.gif','image/gif','BI_large_home_full-2.gif',190722,NULL,NULL,NULL,1,1364399161,1,1364477619,'1172 1505'),
	(40,1,'BI_large_home_full_1.gif',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/BI_large_home_full.gif','image/gif','BI_large_home_full.gif',190722,NULL,NULL,NULL,1,1364399513,1,1364477619,'1172 1505'),
	(43,1,'CCFTA_large_home_full.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/CCFTA_large_home_full.jpg','image/jpeg','CCFTA_large_home_full.jpg',80214,NULL,NULL,NULL,1,1364400691,1,1364477619,'803 1200'),
	(44,1,'CCFTA_large_home_full2.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/CCFTA_large_home_full2.jpg','image/jpeg','CCFTA_large_home_full2.jpg',93293,NULL,NULL,NULL,1,1364400778,1,1364477619,'833 1200'),
	(45,1,'EMBA_large_blog_full_1.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/EMBA_large_blog_full.jpg','image/jpeg','EMBA_large_blog_full.jpg',111897,NULL,NULL,NULL,1,1364400981,1,1364477621,'814 1200'),
	(46,1,'EMBA_large_home_full_1.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/EMBA_large_home_full.jpg','image/jpeg','EMBA_large_home_full.jpg',103559,NULL,NULL,NULL,1,1364400981,1,1364477621,'814 1200'),
	(47,1,'CCHC_large_home_full.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/CCHC_large_home_full.jpg','image/jpeg','CCHC_large_home_full.jpg',82504,NULL,NULL,NULL,1,1364401340,1,1364477619,'814 1200'),
	(48,1,'Lanes_tablet_home.jpg',4,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/tablet/Lanes_tablet_home.jpg','image/jpeg','Lanes_tablet_home.jpg',61314,NULL,NULL,NULL,1,1364414686,1,1364477630,'600 482'),
	(49,1,'CCHC_mobile_home.png',5,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/mobile/CCHC_mobile_home.png','image/png','CCHC_mobile_home.png',91370,NULL,NULL,NULL,1,1364415000,1,1364477626,'600 344'),
	(50,1,'Lanes_mobile_home.jpg',5,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/mobile/Lanes_mobile_home.jpg','image/jpeg','Lanes_mobile_home.jpg',56304,NULL,NULL,NULL,1,1364415278,1,1364477626,'600 344'),
	(51,1,'Lanes_desktop_home.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/Lanes_desktop_home.jpg','image/jpeg','Lanes_desktop_home.jpg',118457,NULL,NULL,NULL,1,1364415386,1,1364477621,'600 1054'),
	(52,1,'CCHC_desktop_home.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/CCHC_desktop_home.jpg','image/jpeg','CCHC_desktop_home.jpg',108469,NULL,NULL,NULL,1,1364416194,1,1364477619,'600 1054'),
	(53,1,'BBC_desktop_home_1.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/BBC_desktop_home_1.jpg','image/jpeg','BBC_desktop_home_1.jpg',163877,NULL,NULL,NULL,1,1364416699,1,1364477619,'600 1054'),
	(54,1,'BBC_desktop_home_2.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/BBC_desktop_home_2.jpg','image/jpeg','BBC_desktop_home_2.jpg',137901,NULL,NULL,NULL,1,1364416699,1,1364477619,'600 1054'),
	(55,1,'BBC_tablet_home_1.jpg',4,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/tablet/BBC_tablet_home_1.jpg','image/jpeg','BBC_tablet_home_1.jpg',87197,NULL,NULL,NULL,1,1364416725,1,1364477630,'600 482'),
	(56,1,'BBC_tablet_home_2.jpg',4,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/tablet/BBC_tablet_home_2.jpg','image/jpeg','BBC_tablet_home_2.jpg',69595,NULL,NULL,NULL,1,1364416725,1,1364477630,'600 482'),
	(57,1,'EMBA_desktop_home.jpg',3,'/var/www/vhosts/20miletech.net/20mile/images/uploads/result_images/desktop/EMBA_desktop_home.jpg','image/jpeg','EMBA_desktop_home.jpg',131444,NULL,NULL,NULL,1,1364417416,1,1364477621,'600 1054'),
	(58,1,'Bradford_desktop_home.jpg',3,'/var/www/vhosts/20mile.in/httpdocs/images/uploads/result_images/desktop/Bradford_desktop_home.jpg','image/jpeg','Bradford_desktop_home.jpg',118182,NULL,NULL,NULL,1,1364480624,1,1364480624,'600 1054');

/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_composer_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_composer_layouts`;

CREATE TABLE `exp_freeform_composer_layouts` (
  `composer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composer_data` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `preview` char(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`composer_id`),
  KEY `preview` (`preview`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_composer_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_composer_templates`;

CREATE TABLE `exp_freeform_composer_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `template_name` varchar(150) NOT NULL DEFAULT 'default',
  `template_label` varchar(150) NOT NULL DEFAULT 'default',
  `template_description` text,
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_data` text,
  `param_data` text,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_fields`;

CREATE TABLE `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `field_name` varchar(150) NOT NULL DEFAULT 'default',
  `field_label` varchar(150) NOT NULL DEFAULT 'default',
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `settings` text,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `required` char(1) NOT NULL DEFAULT 'n',
  `submissions_page` char(1) NOT NULL DEFAULT 'y',
  `moderation_page` char(1) NOT NULL DEFAULT 'y',
  `composer_use` char(1) NOT NULL DEFAULT 'y',
  `field_description` text,
  PRIMARY KEY (`field_id`),
  KEY `field_name` (`field_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_fields` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fields` DISABLE KEYS */;

INSERT INTO `exp_freeform_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_type`, `settings`, `author_id`, `entry_date`, `edit_date`, `required`, `submissions_page`, `moderation_page`, `composer_use`, `field_description`)
VALUES
	(1,1,'name','Name','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1359649793,1363363521,'n','y','y','y','This field contains the user\'s first name.'),
	(2,1,'phone','Phone','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1359649793,1363363535,'n','y','y','y','This field contains the user\'s last name.'),
	(3,1,'email','Email','text','{\"field_length\":150,\"field_content_type\":\"email\"}',1,1359649793,0,'n','y','y','y','A basic email field for collecting stuff like an email address.'),
	(4,1,'user_message','Message','textarea','{\"field_ta_rows\":6}',1,1359649793,0,'n','y','y','y','This field contains the user\'s message.');

/*!40000 ALTER TABLE `exp_freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_fieldtypes`;

CREATE TABLE `exp_freeform_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldtype_name` varchar(250) DEFAULT NULL,
  `settings` text,
  `default_field` char(1) NOT NULL DEFAULT 'n',
  `version` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`fieldtype_id`),
  KEY `fieldtype_name` (`fieldtype_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_freeform_fieldtypes` (`fieldtype_id`, `fieldtype_name`, `settings`, `default_field`, `version`)
VALUES
	(1,'checkbox','[]','n','4.0.10'),
	(2,'checkbox_group','[]','n','4.0.10'),
	(3,'country_select','[]','n','4.0.10'),
	(4,'file_upload','[]','n','4.0.10'),
	(5,'hidden','[]','n','4.0.10'),
	(6,'mailinglist','[]','n','4.0.10'),
	(7,'multiselect','[]','n','4.0.10'),
	(8,'province_select','[]','n','4.0.10'),
	(9,'radio','[]','n','4.0.10'),
	(10,'select','[]','n','4.0.10'),
	(11,'state_select','[]','n','4.0.10'),
	(12,'text','[]','n','4.0.10'),
	(13,'textarea','[]','n','4.0.10');

/*!40000 ALTER TABLE `exp_freeform_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_file_uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_file_uploads`;

CREATE TABLE `exp_freeform_file_uploads` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_path` varchar(750) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_form_entries_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_form_entries_1`;

CREATE TABLE `exp_freeform_form_entries_1` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `complete` varchar(1) NOT NULL DEFAULT 'y',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `form_field_1` text,
  `form_field_2` text,
  `form_field_3` text,
  `form_field_4` text,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_form_entries_1` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` DISABLE KEYS */;

INSERT INTO `exp_freeform_form_entries_1` (`entry_id`, `site_id`, `author_id`, `complete`, `ip_address`, `entry_date`, `edit_date`, `status`, `form_field_1`, `form_field_2`, `form_field_3`, `form_field_4`)
VALUES
	(1,1,0,'y','127.0.0.1',1359649793,0,'pending','Jake','Solspace','support@solspace.com','Welcome to Freeform. We hope that you will enjoy Solspace software.'),
	(2,1,1,'y','127.0.0.1',1363367665,0,'pending','aaa','aaa','aaa@aaa.com','aaaa'),
	(3,1,1,'y','127.0.0.1',1363367778,0,'pending','asds','5082469047','rpassos@20miletech.com','dasdsadasdas'),
	(4,1,1,'y','127.0.0.1',1363369420,0,'pending','aaaa','adadas','aaa@aaa.com','fsdlkjflsf'),
	(5,1,1,'y','173.162.198.217',1364305355,0,'pending','Dave Fravel','5084197439','dfravel@20miletech.com','testing testing testing'),
	(6,1,1,'y','173.162.198.217',1364305820,0,'pending','Sue','5085246348','smalomo@20miletech.com','Just testing the fancy new contact form and notification email.'),
	(7,1,1,'y','173.162.198.217',1364306182,0,'pending','Sue M.','5084197439','smalomo@20miletech.com','sorry, testing again. maybe the email will be easier to read with bold?'),
	(8,1,1,'y','173.162.198.217',1364307207,0,'pending','Dave Fravel','5084197439','dfravel@20miletech.com','testing testing testing'),
	(9,1,0,'y','24.91.83.26',1364415746,0,'pending','Tim Merrill','5089011874','merrill9@gmail.com','Phone shouldn\'t be required. :)'),
	(10,1,1,'y','173.162.198.217',1364416270,0,'pending','dasda','dsadsadas','adasd@dassdsa.com','dsadasd'),
	(11,1,1,'y','173.162.198.217',1364416412,0,'pending','asdaa','sdsad','aaaaa@aaa.com','dasd'),
	(12,1,1,'y','173.162.198.217',1364481164,0,'pending','dasdsf','','dada@sdsad.com','dasdasda');

/*!40000 ALTER TABLE `exp_freeform_form_entries_1` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_forms`;

CREATE TABLE `exp_freeform_forms` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_name` varchar(150) NOT NULL DEFAULT 'default',
  `form_label` varchar(150) NOT NULL DEFAULT 'default',
  `default_status` varchar(150) NOT NULL DEFAULT 'default',
  `notify_user` char(1) NOT NULL DEFAULT 'n',
  `notify_admin` char(1) NOT NULL DEFAULT 'n',
  `user_email_field` varchar(150) NOT NULL DEFAULT '',
  `user_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_email` text,
  `form_description` text,
  `field_ids` text,
  `field_order` text,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `composer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`form_id`),
  KEY `form_name` (`form_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_forms` WRITE;
/*!40000 ALTER TABLE `exp_freeform_forms` DISABLE KEYS */;

INSERT INTO `exp_freeform_forms` (`form_id`, `site_id`, `form_name`, `form_label`, `default_status`, `notify_user`, `notify_admin`, `user_email_field`, `user_notification_id`, `admin_notification_id`, `admin_notification_email`, `form_description`, `field_ids`, `field_order`, `template_id`, `composer_id`, `author_id`, `entry_date`, `edit_date`, `settings`)
VALUES
	(1,1,'contact','Contact','pending','n','y','',0,1,'dfravel@20miletech.com','This is a basic contact form.','1|2|3|4','1|2|3|4',0,0,1,1359649793,1364305720,NULL);

/*!40000 ALTER TABLE `exp_freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_multipage_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_multipage_hashes`;

CREATE TABLE `exp_freeform_multipage_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit` char(1) NOT NULL DEFAULT 'n',
  `data` text,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`),
  KEY `ip_address` (`ip_address`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_notification_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_notification_templates`;

CREATE TABLE `exp_freeform_notification_templates` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `notification_name` varchar(150) NOT NULL DEFAULT 'default',
  `notification_label` varchar(150) NOT NULL DEFAULT 'default',
  `notification_description` text,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `allow_html` char(1) NOT NULL DEFAULT 'n',
  `from_name` varchar(150) NOT NULL DEFAULT '',
  `from_email` varchar(250) NOT NULL DEFAULT '',
  `reply_to_email` varchar(250) NOT NULL DEFAULT '',
  `email_subject` varchar(128) NOT NULL DEFAULT 'default',
  `include_attachments` char(1) NOT NULL DEFAULT 'n',
  `template_data` text,
  PRIMARY KEY (`notification_id`),
  KEY `notification_name` (`notification_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_notification_templates` WRITE;
/*!40000 ALTER TABLE `exp_freeform_notification_templates` DISABLE KEYS */;

INSERT INTO `exp_freeform_notification_templates` (`notification_id`, `site_id`, `notification_name`, `notification_label`, `notification_description`, `wordwrap`, `allow_html`, `from_name`, `from_email`, `reply_to_email`, `email_subject`, `include_attachments`, `template_data`)
VALUES
	(1,1,'20mile_contact_form','20Mile Contact Form','','y','y','{name}','{email}','{email}','20Mile Contact Form','n','The contact form from http://20mile.20miletech.net/contact/ has been submitted. Here are the details:\n\n{all_form_fields}\n	<p><strong>{field_label}</strong> : {field_data}</p>\n{/all_form_fields}');

/*!40000 ALTER TABLE `exp_freeform_notification_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_params
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_params`;

CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`params_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;

INSERT INTO `exp_freeform_params` (`params_id`, `entry_date`, `data`)
VALUES
	(112,1364479392,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(113,1364480098,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(114,1364480751,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(115,1364480841,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(116,1364480887,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(117,1364480971,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(118,1364481117,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(119,1364481146,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(120,1364481411,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(121,1364481574,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),
	(122,1364481960,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dfravel@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}');

/*!40000 ALTER TABLE `exp_freeform_params` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_preferences`;

CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) DEFAULT NULL,
  `preference_value` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  KEY `preference_name` (`preference_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_preferences` WRITE;
/*!40000 ALTER TABLE `exp_freeform_preferences` DISABLE KEYS */;

INSERT INTO `exp_freeform_preferences` (`preference_id`, `preference_name`, `preference_value`, `site_id`)
VALUES
	(1,'ffp','y',0);

/*!40000 ALTER TABLE `exp_freeform_preferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_user_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_user_email`;

CREATE TABLE `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  `email_addresses` text,
  PRIMARY KEY (`email_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_global_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`)
VALUES
	(1,1,'company_phone_number','508.419.7439'),
	(2,1,'company_email_address','info@20mile.in'),
	(3,1,'company_address','901 Main St Osterville, MA 02655'),
	(4,1,'company_address_map_link','https://maps.google.com/maps?q=901+Main+St+Osterville,+MA+02655&ie=UTF-8&hq=&hnear=0x89fb3286cf0712b9:0x55b7f70c945efeee,901+Main+St,+Osterville,+MA+02655&gl=us&ei=VDw_UZP9I6Xb0wGnw4H4Dg&ved=0CDEQ8gEwAA'),
	(5,1,'copywrite','&copy; 2013 20Mile Interactive. All rights reserved.'),
	(6,1,'job_ticker','We\'re currently hiring new <br>\n20Milers. Please take a look at our <br>\n<a href=\"{path=\'/journal/were-hiring-web-developer\'}\">open positions</a>.'),
	(7,1,'page_not_found','The page you requested can\'t be found.'),
	(8,1,'google_analytics_code','<script type=\"text/javascript\">\n\n  var _gaq = _gaq || [];\n  _gaq.push([\'_setAccount\', \'UA-3944803-1\']);\n  _gaq.push([\'_trackPageview\']);\n\n  (function() {\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\n  })();\n\n</script>');

/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_html_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`)
VALUES
	(1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),
	(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),
	(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),
	(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),
	(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');

/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_matrix_cols
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_matrix_cols`;

CREATE TABLE `exp_matrix_cols` (
  `col_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_instructions` text,
  `col_type` varchar(50) DEFAULT 'text',
  `col_required` char(1) DEFAULT 'n',
  `col_search` char(1) DEFAULT 'n',
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_width` varchar(4) DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `site_id` (`site_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_matrix_cols` WRITE;
/*!40000 ALTER TABLE `exp_matrix_cols` DISABLE KEYS */;

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `var_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`)
VALUES
	(4,1,25,NULL,'fact','Fact','','text','n','n',0,'100%','YTozOntzOjQ6Im1heGwiO3M6MjoiNTAiO3M6MzoiZm10IjtzOjQ6Im5vbmUiO3M6MzoiZGlyIjtzOjM6Imx0ciI7fQ==');

/*!40000 ALTER TABLE `exp_matrix_cols` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_matrix_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_matrix_data`;

CREATE TABLE `exp_matrix_data` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  `row_order` int(4) unsigned DEFAULT NULL,
  `col_id_4` text,
  PRIMARY KEY (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_matrix_data` WRITE;
/*!40000 ALTER TABLE `exp_matrix_data` DISABLE KEYS */;

INSERT INTO `exp_matrix_data` (`row_id`, `site_id`, `entry_id`, `field_id`, `var_id`, `is_draft`, `row_order`, `col_id_4`)
VALUES
	(1,1,23,25,NULL,0,1,'Responsive'),
	(2,1,23,25,NULL,0,2,'ExpressionEngine CMS'),
	(3,1,23,25,NULL,0,3,'Training');

/*!40000 ALTER TABLE `exp_matrix_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_bulletin_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_member_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;

INSERT INTO `exp_member_data` (`member_id`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9);

/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_groups`;

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_admin_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`)
VALUES
	(1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),
	(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),
	(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),
	(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),
	(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');

/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_homepage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_homepage`;

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`)
VALUES
	(1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0),
	(2,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(3,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(4,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(5,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(6,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(7,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(8,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(9,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0);

/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `daylight_savings`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`)
VALUES
	(1,1,'admin','Admin','ddff76872107e2d87d7786bb260a8350e91552b36da402f8ae3666248a69f9e53f27943dc8889955c0eca7c77a734cba29c6ec56ff52cff5513fa9e4a0e660f9','KI&X_p6^L!Eo5<Q%.MfHZx)S}hM3%D{!F$XEk#bgRf|p@Ce@;m%/H`GIP6=\\^;Ot}\'nc(CRs.Haw|&xijDvG]CxN$|a.ZXC-qg)<{cayUp;#H%nnEuERdVg-!:Lp^cPw','d9490be546faec262aefce9c499d3b9b3b9167ab','15686ae21e2b99568206625ea60c23382bf7a3be',NULL,'smalomo@20miletech.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359648902,1364417731,1364483149,14,0,0,0,1364401351,0,0,0,'n','y','y','y','y','n','n','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','','Structure|C=addons_modules&M=show_module_cp&module=structure|1\nForms|C=addons_modules&M=show_module_cp&module=freeform|2\nAssets|C=addons_modules&M=show_module_cp&module=assets|3','n',0,'y',0),
	(2,1,'dfravel','Dave Fravel','8a97a667124bd17ca1fb24623736a80e0a25ec5b71ac01238e1d76a6d860cca909f6e0ed2396bbb3024300bc5ff35894358d2d7ed9b4956287b053d3f2121aeb','_S|9uO5tszG]|>t\'$rCxGteEw6&@TN&*\\b9+\\kO;<A7?Y2/<cGxC<G~~M~=Hg!`>@r7Eg&e7X-@,Qep%\"EWy]Jpx9eU2E]0-,e9jn#B!gtU1nq!,u6;+YuN\':Hvz!ywT','b30011d8a486782eb76e393946dfc93c061dd9f7','2b6e480d70e907b413cc021301238cebf6cbb283',NULL,'dave@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359839594,1364387500,1364418461,5,0,0,0,1364314955,0,0,0,'n','y','y','y','y','n','n','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,'Structure|C=addons_modules&M=show_module_cp&module=structure|1\nForms|C=addons_modules&M=show_module_cp&module=freeform|2','n',0,'y',0),
	(3,1,'rpassos','Rodrigo Passos','ee54bb05517ed9d806dae4263574a16cc6bfc6f281b1e6614984eb69af1e553662f1749703bdfcb4828ca8cb2ccfc13e77cdfb37224911dd69e2408ca0ea16cb','O@@7M(,0_(;Kgcb0q8rI+aZszt/Hs:vw;X|3rUkr0g]c6fQjr{Ap_GEa1Ws&0DH&?RX9>V`)K|<3EXm3\'[IsRu\\!>3<T]|rnCa`~{+!zI\\D^jHn&j$o*}d0=]E:N3``Q','307903d76f36e6b7b4fac7e90539a65d2502aedd','c3d47658b84eaf0fe9472575006ac615b41a41b8',NULL,'rodrigo@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359839975,0,0,2,0,0,0,1363276599,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),
	(4,1,'tmerrill','Tim Merrill','e14b9fddf8dac30c6eff052000645aeb00f87864e2aa391cbe6731bc229213c2f36a34cdcc2b64c670b26fa8c1919d2c964654cd77082a2c08becdeb4d851a24','v5#.V^qn)BFf\'.5u~1Ox(G~a2-A(\'W2{k6/JhTLClM2f80u#d{TJC1+dEabKKk@z@J[R6wvo:GNIZ<{vG[M%Mx~vb:?bX][4EK&k2MUK7!Rg{PUu{uTv2@u^ny,O1-7l','6c71da722f5567ebcd708f2325e25df2531e9724','2252b38e11ac0d51d1ee04bb47c3b7f7d1629b2b',NULL,'tim@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359840014,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),
	(5,1,'smalomo','Sue Malomo','0e5acadce66e5b28a8bbde659dd6602cb58c06644a25821a5cf5e937b140f53826f2fd9bc50b886e4b3d9d15d5fb447b33119c3e2ef80a55531bc9b7bcfe8616','g\"v%0O.)qK71Cn<!|y[Zv9_Hjj(hx$5n[Z#i\\b6m>HB?}LZyf4-gQq1FAu}9P^I:Sm*<aH?mN1h4tmiq367\",VoV%p?*#=H?.|r:QmYbSVeK@hEq:vdPICTG#.McOq\"K','f4fe34758492b28cc67482d4e046bbb4729a6b66','ca8603258609be03ae33c426308dd1cbb133583a',NULL,'sue@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841487,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),
	(6,1,'dfontes','David Fontes','c889635b55af84950ec5866424ed9a8956c6ba3954f8595faf2b32ae02f1689351547068f720018e43e08a8e9284d9f617d90480b3a2c99632d78eb3b4d9b6e3',')y4]aZ?u))]\"$>zL\"iYeH6|iCTF5<,)@l2\\<g37jYzbxn((k5\"By@ubZr{x.\\QXp`zoX#W9\\U@}pPIF8D85h)SES-n~aGmK*UU,FO\'*h.e,o#dQQl|acQy*%e;S`5q3a','05c56a5bf1cb286f621f1f9b23f21fdcb4aaa251','c39f06062fd3fbbd3b046b8a0a66876748e40110',NULL,'david@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841521,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),
	(7,1,'areddington','Amy Reddington','0e48321ccf7ece9d595e5d7a8d5925df88bd1fc1fd33d94476f01770c491367608c392ff9c70ca40c9f739bbea8ffd8c2b2d76c7db3798fac27048653d249fb9','D5\"TqUC9q|PE6O[L=awZ7MEj+lznFLy+Lk%_{2uH@l)}+lwAQ@#5l*<,RiF#GP/^@GzWd{EC/6so[E>]w<#Sk&Fn09JLT;]{S$~Z_b\"m.S;-d<ogHSf!o_E4;42J3#,}','2dfa6b38a849bed8e05fe4bce70aa7d72e9638d3','a062ad15b6130c5a389439b2355539c3d6940f34',NULL,'amy@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841547,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),
	(8,1,'cobrien','Chris OBrien','628da4d188ef939962cca92aaeff3203b9ab48e4ad3ce0762f07175ca0405d708dc426e4797ceac5b993f6f2df84bf6d18ed8277c4de3a58260a29d193d91a3c','Hj8FrFyl)nQ?88zvA%FTiFr\"6jtGL(`PY\\,Zye-xkinW{{Y\"5FBBs2CP91>p~;$Vn!-YA:-uI}0<2V&$\'-!J&eJ\\D!`jG7RE:&{R&:%sO-FbgD3XuSx$Ks?N&vQM}qi}','c7889cdfb2488e6e9730c451d60d84142364b61c','4e7807b8f08fa7931bc8bc78d77be0b02e55345a',NULL,'chris@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841576,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),
	(9,1,'eobrien','Emily OBrien','ef8bf4b51d507ce898e080994029b6918f982c2e840360c6e00d1177c34e5130982b0c8b5f74b5ac753042205c7db0672d807d368f1b9d2b5ccc4639a8704a0e','|$I}!mos*BOJIHQR[##Q\'Q/}&6B/p\"b\"A\'g9gToIEo!_dtSDhKe*DA,jk.}D|y~4hSlz0@|(}q`l:sQoukRt\"TKG?/D^C@BZdxoe1w~Hd\'v$2``(&\'@*hsAwG,1F7ZPi','60936104c6596551bd48a8604d78ea388e286707','f9897a76af3339e90c6aacc1cbb26bc84223fa06',NULL,'emily@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841601,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0);

/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_message_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_message_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`)
VALUES
	(1,'InBox','Sent','','','','','','','',''),
	(2,'InBox','Sent','','','','','','','','');

/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_listed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_module_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_module_member_groups`;

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`)
VALUES
	(1,'Email','2.0','n','n'),
	(2,'File','1.0.0','n','n'),
	(3,'Jquery','1.0','n','n'),
	(4,'Query','2.0','n','n'),
	(5,'Rss','2.0','n','n'),
	(6,'Safecracker','2.1','y','n'),
	(7,'Search','2.2','n','n'),
	(8,'Channel','2.0.1','n','n'),
	(9,'Member','2.1','n','n'),
	(10,'Stats','2.0','n','n'),
	(11,'Rte','1.0','y','n'),
	(12,'Freeform','4.0.11','y','n'),
	(13,'Playa','4.3.3','n','n'),
	(14,'Structure','3.3.8','y','y'),
	(15,'Wygwam','2.7','y','n'),
	(16,'Assets','2.0.3','y','n'),
	(17,'Detour_pro','1.3.2','y','n'),
	(18,'Super_search','2.0.5','y','y'),
	(20,'Profile','1.0.7','y','n'),
	(21,'Safeharbor','1.3.3','y','n'),
	(22,'Tag','4.2.1','y','y');

/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_online_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`)
VALUES
	(141,1,0,'n','','173.162.198.217',1364483394,''),
	(144,1,0,'n','','173.162.198.217',1364483394,''),
	(146,1,0,'n','','173.162.198.217',1364483394,''),
	(155,1,0,'n','','173.162.198.217',1364483394,''),
	(159,1,0,'n','','173.162.198.217',1364483394,''),
	(163,1,0,'n','','173.162.198.217',1364483394,''),
	(165,1,0,'n','','173.162.198.217',1364483394,''),
	(166,1,1,'n','Admin','173.162.198.217',1364483392,''),
	(173,1,0,'n','','173.162.198.217',1364483394,''),
	(174,1,1,'n','Admin','173.162.198.217',1364483392,''),
	(195,1,0,'n','','24.128.192.199',1364482529,''),
	(201,1,0,'n','','64.134.241.52',1364482020,'');

/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_password_lockout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`)
VALUES
	(1,1363363455,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.160 Safari/537.22','admin');

/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_ping_servers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_ping_servers`;

CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_playa_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_playa_relationships`;

CREATE TABLE `exp_playa_relationships` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_entry_id` int(10) unsigned DEFAULT NULL,
  `parent_field_id` int(6) unsigned DEFAULT NULL,
  `parent_col_id` int(6) unsigned DEFAULT NULL,
  `parent_row_id` int(10) unsigned DEFAULT NULL,
  `parent_var_id` int(6) unsigned DEFAULT NULL,
  `child_entry_id` int(10) unsigned DEFAULT NULL,
  `rel_order` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `parent_entry_id` (`parent_entry_id`),
  KEY `parent_field_id` (`parent_field_id`),
  KEY `parent_col_id` (`parent_col_id`),
  KEY `parent_row_id` (`parent_row_id`),
  KEY `parent_var_id` (`parent_var_id`),
  KEY `child_entry_id` (`child_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_playa_relationships` WRITE;
/*!40000 ALTER TABLE `exp_playa_relationships` DISABLE KEYS */;

INSERT INTO `exp_playa_relationships` (`rel_id`, `parent_entry_id`, `parent_field_id`, `parent_col_id`, `parent_row_id`, `parent_var_id`, `child_entry_id`, `rel_order`)
VALUES
	(6,20,26,NULL,NULL,NULL,23,0);

/*!40000 ALTER TABLE `exp_playa_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_remember_me
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_remember_me`;

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_revision_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_rte_tools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_tools`;

CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`)
VALUES
	(1,'Blockquote','Blockquote_rte','y'),
	(2,'Bold','Bold_rte','y'),
	(3,'Headings','Headings_rte','y'),
	(4,'Image','Image_rte','y'),
	(5,'Italic','Italic_rte','y'),
	(6,'Link','Link_rte','y'),
	(7,'Ordered List','Ordered_list_rte','y'),
	(8,'Underline','Underline_rte','y'),
	(9,'Unordered List','Unordered_list_rte','y'),
	(10,'View Source','View_source_rte','y');

/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_rte_toolsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_toolsets`;

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`)
VALUES
	(1,0,'Default','3|2|5|1|9|7|6|4|10','y');

/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_safeharbor_backups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_safeharbor_backups`;

CREATE TABLE `exp_safeharbor_backups` (
  `backup_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `backup_time` varchar(32) DEFAULT NULL,
  `start_time` varchar(32) NOT NULL,
  `end_time` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `db_backup_mode` varchar(32) DEFAULT NULL,
  `backup_size` varchar(32) DEFAULT NULL,
  `md5_hash` varchar(32) DEFAULT NULL,
  `local` int(1) DEFAULT NULL,
  `backup_transfer_failed` int(1) DEFAULT NULL,
  `backup_type` enum('full','differential') NOT NULL,
  `file_ctime` int(11) DEFAULT NULL,
  `full_backup_id` int(6) DEFAULT NULL,
  `transferred_amazon_s3` int(1) NOT NULL DEFAULT '0',
  `transferred_ftp` int(1) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`backup_id`),
  KEY `backup_type` (`backup_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_safeharbor_hash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_safeharbor_hash`;

CREATE TABLE `exp_safeharbor_hash` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL,
  `hash` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_safeharbor_indexes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_safeharbor_indexes`;

CREATE TABLE `exp_safeharbor_indexes` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `backup_id` int(6) unsigned NOT NULL,
  `file` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_safeharbor_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_safeharbor_messages`;

CREATE TABLE `exp_safeharbor_messages` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL,
  `message` varchar(512) NOT NULL,
  `date` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_safeharbor_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_safeharbor_settings`;

CREATE TABLE `exp_safeharbor_settings` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) NOT NULL,
  `auth_code` varchar(32) NOT NULL,
  `off_site_backup_auth_code` varchar(32) NOT NULL,
  `time_diff` int(2) NOT NULL,
  `db_backup` varchar(32) NOT NULL,
  `notify_email_address` varchar(128) NOT NULL,
  `backup_time` varchar(32) NOT NULL,
  `backup_plan` varchar(128) NOT NULL,
  `time_saved` varchar(32) NOT NULL,
  `backup_space` varchar(32) NOT NULL,
  `backup_path` varchar(256) NOT NULL,
  `storage_path` varchar(256) NOT NULL,
  `transfer_type` varchar(5) NOT NULL,
  `disable_remote` int(1) NOT NULL,
  `amazon_s3_enabled` int(1) NOT NULL DEFAULT '0',
  `amazon_s3_access_key` varchar(256) NOT NULL,
  `amazon_s3_secret` varchar(256) NOT NULL,
  `ftp_enabled` int(1) NOT NULL DEFAULT '0',
  `ftp_username` varchar(20) NOT NULL,
  `ftp_password` varchar(256) NOT NULL,
  `ftp_host` varchar(128) NOT NULL,
  `ftp_port` int(5) NOT NULL,
  `ftp_path` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_security_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`)
VALUES
	(3282,1364477547,'0','706368c8af08a4f5c661bddbe839ae3d86e9a554'),
	(3283,1364477547,'40585f6256fa44c8749085ef8da6baccaac6d837','f6aebe237a416abc8f901628cb41b71e4cc868cb'),
	(3284,1364477560,'40585f6256fa44c8749085ef8da6baccaac6d837','56b23c829f8a80f36dba8783fda7612c477934a7'),
	(3286,1364477569,'40585f6256fa44c8749085ef8da6baccaac6d837','aab8762539d72c89b247cca8933ad90e7fcc29d2'),
	(3287,1364477569,'40585f6256fa44c8749085ef8da6baccaac6d837','fa036ecc83c74ccf18dce872bfcf90da2e6e132c'),
	(3288,1364477577,'40585f6256fa44c8749085ef8da6baccaac6d837','629b9b414e10d6b4dcd96c5405cc5dd7d857853e'),
	(3293,1364477586,'40585f6256fa44c8749085ef8da6baccaac6d837','117fecb44ad496378c6b99762043fb35167bab59'),
	(3294,1364477586,'40585f6256fa44c8749085ef8da6baccaac6d837','4caf604d8df34b02b6325b1da0fcaa9938a35f90'),
	(3295,1364477589,'40585f6256fa44c8749085ef8da6baccaac6d837','78685724346afcc99e0146e70c6b394d33c263f6'),
	(3296,1364477590,'40585f6256fa44c8749085ef8da6baccaac6d837','5e09d9e195bacaafdefb454aef753199321bc63b'),
	(3297,1364477594,'40585f6256fa44c8749085ef8da6baccaac6d837','bf548f326db96983038ab3db4fff055abbb71b08'),
	(3298,1364477594,'40585f6256fa44c8749085ef8da6baccaac6d837','d324a9978e83fc6d489d171331aad1364fbd2b8b'),
	(3299,1364477597,'40585f6256fa44c8749085ef8da6baccaac6d837','a3a524d4ae4f475c8dce1a5e1aa2363d43dc9684'),
	(3300,1364477597,'40585f6256fa44c8749085ef8da6baccaac6d837','665f0b6e3f6decbb7a22cf4f2e00aa89f8cf85f3'),
	(3301,1364477606,'40585f6256fa44c8749085ef8da6baccaac6d837','a3bbc4e2b6fb28da82744bc296c118f9464c50fd'),
	(3302,1364477607,'40585f6256fa44c8749085ef8da6baccaac6d837','2bad7d7b119127d068ddc147fa37b96503422446'),
	(3303,1364477608,'40585f6256fa44c8749085ef8da6baccaac6d837','656476d21531722a32948813120530c0306a8aac'),
	(3304,1364477609,'40585f6256fa44c8749085ef8da6baccaac6d837','48be752168a693dad2fb06a205b32f86b0b40425'),
	(3305,1364477609,'40585f6256fa44c8749085ef8da6baccaac6d837','0f4b1c24874680ae6720f35ab4b5f71ad46bcb6f'),
	(3306,1364477612,'40585f6256fa44c8749085ef8da6baccaac6d837','2354b4b211feba092586a73232d7fa74d05b0f19'),
	(3307,1364477612,'40585f6256fa44c8749085ef8da6baccaac6d837','12395156bb1609ca44d695f16d9d1972bf4ef130'),
	(3308,1364477614,'40585f6256fa44c8749085ef8da6baccaac6d837','9f013f79c5e3677d28695ae7445085da27d104d0'),
	(3309,1364477614,'40585f6256fa44c8749085ef8da6baccaac6d837','db26ffc43b86d7a153c0d64d9b03ae5a936b467f'),
	(3310,1364477615,'40585f6256fa44c8749085ef8da6baccaac6d837','672a73c20e88f964ba0ae4e28c561ab0cdcc1396'),
	(3311,1364477615,'40585f6256fa44c8749085ef8da6baccaac6d837','9f12ed964726271172f120730d8ad71c8ef02c96'),
	(3312,1364477615,'40585f6256fa44c8749085ef8da6baccaac6d837','8c9bb4884523973b6eae41938da7c78b7e5d5af7'),
	(3313,1364477616,'40585f6256fa44c8749085ef8da6baccaac6d837','63727b4f8dcaa7402344ccb2034c375b0c39ecf2'),
	(3314,1364477619,'40585f6256fa44c8749085ef8da6baccaac6d837','108d643dbed79edb72564ce527c00fbd0d2fc1ec'),
	(3315,1364477619,'40585f6256fa44c8749085ef8da6baccaac6d837','3e42c3df72443c083e83d14ce14d4801e94798a4'),
	(3316,1364477621,'40585f6256fa44c8749085ef8da6baccaac6d837','3dfc3765952749e234f8eaae915c529977b06955'),
	(3317,1364477622,'40585f6256fa44c8749085ef8da6baccaac6d837','731118727b6c0d1ce4c6ee96dfe80450f7a55721'),
	(3318,1364477626,'40585f6256fa44c8749085ef8da6baccaac6d837','bae223cf1cc3483939ea630a3b54a67fcd741e2c'),
	(3319,1364477626,'40585f6256fa44c8749085ef8da6baccaac6d837','6ff66ac620520ab76f624dba8c6983642a2555de'),
	(3320,1364477630,'40585f6256fa44c8749085ef8da6baccaac6d837','651d70f95f2cd7f247a5e3a58f60573adf8f0757'),
	(3321,1364477630,'40585f6256fa44c8749085ef8da6baccaac6d837','5b5ad5864b8eb1eeefd3769aa7200bb25ec7e268'),
	(3322,1364477632,'40585f6256fa44c8749085ef8da6baccaac6d837','4304bb551a5dc395a18c56fc41be25bcfd475fd7'),
	(3323,1364477638,'40585f6256fa44c8749085ef8da6baccaac6d837','93d52fff96d301e61c2f08144ef1436972e10610'),
	(3324,1364477642,'40585f6256fa44c8749085ef8da6baccaac6d837','72607483f57b64ce082889c68c590a51a5f4ba82'),
	(3325,1364477666,'40585f6256fa44c8749085ef8da6baccaac6d837','dc9772d8ed3f4a53b640e4ff593e4251d52642b7'),
	(3326,1364477671,'40585f6256fa44c8749085ef8da6baccaac6d837','ad77b29e8582bf3a77032789fb10dc7804165f5b'),
	(3327,1364479392,'0','f207c678e746ef5b2cfccc21fb3d691414fbe264'),
	(3328,1364480098,'0','061541acbb7ec0528937017e44a9832112ab5007'),
	(3330,1364480522,'0','35b858e30726f80020578e179ee0d5b2a4303e8e'),
	(3331,1364480522,'390d848859da5737552b1537b80535a8d34b9de3','d4c54c9da9b28e99cab3a582d34bbdd1695448be'),
	(3332,1364480589,'390d848859da5737552b1537b80535a8d34b9de3','e6f1dd2569a3862642f95a0bb9f8af0883d9a5dd'),
	(3333,1364480592,'390d848859da5737552b1537b80535a8d34b9de3','09fe0519903b971d2fd6a3507dcf5893840a154e'),
	(3334,1364480594,'390d848859da5737552b1537b80535a8d34b9de3','a33d34385d2d1ea2e6d042043fef0d031b59fbb8'),
	(3335,1364480594,'390d848859da5737552b1537b80535a8d34b9de3','25d0c270d8cb5095819de2652d32f8c62dcde327'),
	(3336,1364480595,'390d848859da5737552b1537b80535a8d34b9de3','fded1af4899f75dee03d62909c1ddc004c56d9d9'),
	(3337,1364480605,'390d848859da5737552b1537b80535a8d34b9de3','ad4e144067c5d84800abdd0e13ec864a2eedd531'),
	(3339,1364480611,'390d848859da5737552b1537b80535a8d34b9de3','3f367ae8f5eb1d8c2b9b052bdc57e4aa4efc76d6'),
	(3340,1364480612,'390d848859da5737552b1537b80535a8d34b9de3','ed543adfb014d9244f178c72bd8c0a6367555442'),
	(3341,1364480612,'390d848859da5737552b1537b80535a8d34b9de3','ffccab724f2d6bc14e1ee7c4ca9df0c87cd32de7'),
	(3342,1364480642,'390d848859da5737552b1537b80535a8d34b9de3','a602c8ef51d9e69b0daa2630b2f54d1ae1c9dc32'),
	(3343,1364480643,'390d848859da5737552b1537b80535a8d34b9de3','fe649edd061b11842fff3e564b50be3e8ebb03d8'),
	(3344,1364480665,'390d848859da5737552b1537b80535a8d34b9de3','a690e196b4430fe5bd0f0f31e4cabde88206462e'),
	(3346,1364480670,'390d848859da5737552b1537b80535a8d34b9de3','674290cda6dce0b9b5773485973de2cda76be652'),
	(3347,1364480670,'390d848859da5737552b1537b80535a8d34b9de3','b2f052c2024bd86d96aa873f8b114709b55cffa1'),
	(3348,1364480671,'390d848859da5737552b1537b80535a8d34b9de3','7f6805d91531c413f9f1102e3227864f8dfdce8f'),
	(3349,1364480702,'390d848859da5737552b1537b80535a8d34b9de3','a5594b993e69a0251dacd7aa55c7dd983f629743'),
	(3350,1364480703,'390d848859da5737552b1537b80535a8d34b9de3','10d0c4536c10f90847b248b211572b061ac0e670'),
	(3351,1364480708,'40585f6256fa44c8749085ef8da6baccaac6d837','a9bb72902a233d8eb22faf0bd573f4ddba9d7bc3'),
	(3352,1364480713,'40585f6256fa44c8749085ef8da6baccaac6d837','b65282eedeb1f483188421f0b0518093dc9fa44e'),
	(3353,1364480715,'390d848859da5737552b1537b80535a8d34b9de3','3c9afd99ce8236bf25c497d8b5d2ddd5185023e0'),
	(3355,1364480718,'40585f6256fa44c8749085ef8da6baccaac6d837','7cbc181732d3cd4d6e3f3a29f420889c46ba65b5'),
	(3356,1364480719,'390d848859da5737552b1537b80535a8d34b9de3','b845a3d76086425e5c56f9a6a712d2d5cd61a976'),
	(3357,1364480720,'390d848859da5737552b1537b80535a8d34b9de3','37203420f16bd2d5d00b8d88d0376a09574c9f62'),
	(3358,1364480720,'390d848859da5737552b1537b80535a8d34b9de3','64f3f8686fada6f3de510fb70b69d01976c0d42f'),
	(3359,1364480720,'40585f6256fa44c8749085ef8da6baccaac6d837','320e47c5422006d6c1d1be9e3c32d96a58f163d2'),
	(3360,1364480725,'40585f6256fa44c8749085ef8da6baccaac6d837','c4a316704ddc46d1432db56da413e635eb01484e'),
	(3361,1364480728,'40585f6256fa44c8749085ef8da6baccaac6d837','afe53ecc0e4b70da0e23da4903b63819aa7f5642'),
	(3363,1364480738,'390d848859da5737552b1537b80535a8d34b9de3','c5c4196c4b864ebaceb8ef56d3b04599938be271'),
	(3364,1364480739,'390d848859da5737552b1537b80535a8d34b9de3','c37cad0a6bfef463156e89f9193eeb58924fd666'),
	(3365,1364480751,'0','da686f158934092a385a9e9daf34170c2716e009'),
	(3366,1364480756,'40585f6256fa44c8749085ef8da6baccaac6d837','72daa84ed86edb55f1688e8399f3d773d646c12c'),
	(3367,1364480841,'40585f6256fa44c8749085ef8da6baccaac6d837','67de46af80769cbf3c41539a40ca1a9a21a89e59'),
	(3368,1364480887,'40585f6256fa44c8749085ef8da6baccaac6d837','6faf60340a6ed93df1a254c49fd09309098484c1'),
	(3369,1364480971,'390d848859da5737552b1537b80535a8d34b9de3','aa4bfc7e51f83d3730b8268343afd218883309f6'),
	(3370,1364481117,'390d848859da5737552b1537b80535a8d34b9de3','013738fb984ebfc182db358fbcf39eb1ea713fa3'),
	(3372,1364481411,'40585f6256fa44c8749085ef8da6baccaac6d837','0eb93c5487706b2e25be27445b56274d7615ddae'),
	(3373,1364481574,'0','70ab7e8406bd6db720474c45772470a30e0e77e9'),
	(3374,1364481960,'0','f57bff6b833e115923df3a81dd7e63b6b7f0cc12');

/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `last_activity`)
VALUES
	('390d848859da5737552b1537b80535a8d34b9de3',1,1,'173.162.198.217','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1364483337),
	('40585f6256fa44c8749085ef8da6baccaac6d837',1,1,'173.162.198.217','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31',1364483392);

/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` longtext,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`)
VALUES
	(1,'20Mile Interactive','default_site',NULL,'YTo5NDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjk6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjM2OiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyMjoic21hbG9tb0AyMG1pbGV0ZWNoLmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6NDU6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjU0OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJuIjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToidGltZV9mb3JtYXQiO3M6MjoidXMiO3M6MTU6InNlcnZlcl90aW1lem9uZSI7czozOiJVTTUiO3M6MTM6InNlcnZlcl9vZmZzZXQiO3M6MDoiIjtzOjE2OiJkYXlsaWdodF9zYXZpbmdzIjtzOjE6Im4iO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czozOiJVTTUiO3M6MTY6ImRlZmF1bHRfc2l0ZV9kc3QiO3M6MToibiI7czoxNToiaG9ub3JfZW50cnlfZHN0IjtzOjE6InkiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjg6ImNwX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MjE6ImVtYWlsX21vZHVsZV9jYXB0Y2hhcyI7czoxOiJuIjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTI6InNlY3VyZV9mb3JtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6NDQ6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToibiI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjQ1OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjIwOiJ1c2VfaWdub3JlX3dvcmRfbGlzdCI7czoxOiJ5IjtzOjE2OiJpZ25vcmVfd29yZF9saXN0IjtzOjE5OiJhfHxhbmR8fG9mfHxvcnx8dGhlIjt9','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjIxOiJub21lbWJlcnJlZ2lzdHJhdGlvbnMiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJuIjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjQ0OiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6NTM6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGV0ZWNoLm5ldC8yMG1pbGUvaW1hZ2VzL2F2YXRhcnMvIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjUwOiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo1OToiL3Zhci93d3cvdmhvc3RzLzIwbWlsZXRlY2gubmV0LzIwbWlsZS9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTU6InBob3RvX21heF93aWR0aCI7czozOiIxMDAiO3M6MTY6InBob3RvX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEyOiJwaG90b19tYXhfa2IiO3M6MjoiNTAiO3M6MTY6ImFsbG93X3NpZ25hdHVyZXMiO3M6MToibiI7czoxMzoic2lnX21heGxlbmd0aCI7czozOiI1MDAiO3M6MjE6InNpZ19hbGxvd19pbWdfaG90bGluayI7czoxOiJuIjtzOjIwOiJzaWdfYWxsb3dfaW1nX3VwbG9hZCI7czoxOiJuIjtzOjExOiJzaWdfaW1nX3VybCI7czo1ODoiaHR0cDovLzIwbWlsZS4yMG1pbGV0ZWNoLm5ldC9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjY3OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6NjA6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGV0ZWNoLm5ldC8yMG1pbGUvaW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToibiI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxNzoidG90YWxfZm9ydW1fcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjk6InBhZ2VzLzQwNCI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo0ODoiL3Zhci93d3cvdmhvc3RzLzIwbWlsZXRlY2gubmV0LzIwbWlsZS90ZW1wbGF0ZXMvIjt9','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6NDQ6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGUuaW4vaHR0cGRvY3MvaW5kZXgucGhwIjtzOjMyOiIzZTQ0MjY0ZGJhMTQ3YThjN2E1ZTg5YjE5ZDk0YTk5MSI7fQ==','YToxOntpOjE7YTozOntzOjM6InVybCI7czoxNzoiaHR0cDovLzIwbWlsZS5pbi8iO3M6NDoidXJpcyI7YToyNjp7aToxMDtzOjE6Ii8iO2k6MTE7czoxMToiL2V4cGVydGlzZS8iO2k6MTI7czo5OiIvcmVzdWx0cy8iO2k6MjM7czozMToiL3Jlc3VsdHMvdGhlLWxhbmVzLWJvd2wtYmlzdHJvLyI7aToxMztzOjY6Ii90ZWFtLyI7aToxO3M6MTg6Ii90ZWFtL2RhdmUtZnJhdmVsLyI7aTo0O3M6MTc6Ii90ZWFtL3N1ZS1tYWxvbW8vIjtpOjY7czoyMToiL3RlYW0vYW15LXJlZGRpbmd0b24vIjtpOjI7czoyMToiL3RlYW0vcm9kcmlnby1wYXNzb3MvIjtpOjM7czoxODoiL3RlYW0vdGltLW1lcnJpbGwvIjtpOjc7czoxOToiL3RlYW0vY2hyaXMtb2JyaWVuLyI7aTo1O3M6MTk6Ii90ZWFtL2RhdmlkLWZvbnRlcy8iO2k6ODtzOjE5OiIvdGVhbS9lbWlseS1vYnJpZW4vIjtpOjE0O3M6OToiL2pvdXJuYWwvIjtpOjE1O3M6OToiL2NvbnRhY3QvIjtpOjE5O3M6MzA6Ii9yZXN1bHRzL2JyaXRpc2gtYmVlci1jb21wYW55LyI7aToyMDtzOjMxOiIvcmVzdWx0cy90aGUtbGFuZXMtYm93bC1iaXN0cm8vIjtpOjE2O3M6MzM6Ii9qb3VybmFsL3RoZS1zdG9yeS1iZWhpbmQtMjBtaWxlLyI7aToxNztzOjM1OiIvam91cm5hbC93ZXJlLWhpcmluZy13ZWItZGV2ZWxvcGVyLyI7aToxODtzOjc2OiIvam91cm5hbC9leHByZXNzaW9uZW5naW5lLWFuZC1naXQtdXNpbmctZ2l0LWhvb2tzLXRvLXRyYWNrLWRhdGFiYXNlLWNoYW5nZXMvIjtpOjIxO3M6MzE6Ii9qb3VybmFsL3doeS13ZS11c2UtdGVhbXdvcmtwbS8iO2k6MjI7czo0NjoiL2pvdXJuYWwvaG93LXdlLW1hbmFnZS1pbnRlcm5hbC1jb21tdW5pY2F0aW9uLyI7aToyNDtzOjIyOiIvcmVzdWx0cy9icmFkZm9yZC1pbm4vIjtpOjI1O3M6MzU6Ii9yZXN1bHRzL21pdC1leGVjdXRpdmUtbWJhLXByb2dyYW0vIjtpOjI2O3M6MzY6Ii9yZXN1bHRzL2NvdHVpdC1jZW50ZXItZm9yLXRoZS1hcnRzLyI7aToyNztzOjI5OiIvcmVzdWx0cy9jYXBlLWNvZC1oZWFsdGhjYXJlLyI7fXM6OToidGVtcGxhdGVzIjthOjI2OntpOjEwO3M6MToiNCI7aToxMTtzOjI6IjEwIjtpOjEyO3M6MjoiMTUiO2k6MTM7czoyOiIxNiI7aToxNDtzOjI6IjEzIjtpOjE1O3M6MjoiMTEiO2k6NztzOjI6IjE5IjtpOjg7czoyOiIxOSI7aTo2O3M6MjoiMTkiO2k6NTtzOjI6IjE5IjtpOjQ7czoyOiIxOSI7aTozO3M6MjoiMTkiO2k6MjtzOjI6IjE5IjtpOjE7czoyOiIxOSI7aToxNjtzOjI6IjE0IjtpOjE3O3M6MjoiMTQiO2k6MTg7czoyOiIxNCI7aToxOTtzOjE6IjkiO2k6MjA7czoxOiI5IjtpOjIxO3M6MjoiMTQiO2k6MjI7czoyOiIxNCI7aToyMztzOjI6IjEyIjtpOjI0O3M6MToiOSI7aToyNTtzOjE6IjkiO2k6MjY7czoxOiI5IjtpOjI3O3M6MToiOSI7fX19');

/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_specialty_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`)
VALUES
	(1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
	(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
	(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
	(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
	(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
	(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
	(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
	(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
	(9,1,'y','reset_password_notification','New Login Information','{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
	(10,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
	(11,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
	(12,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
	(13,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
	(14,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
	(15,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
	(16,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`)
VALUES
	(1,1,9,9,'Emily OBrien',26,0,0,0,1364413246,0,0,1364483394,29,1364480567,1364492841);

/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_groups`;

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`)
VALUES
	(1,1,'Statuses');

/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_no_access`;

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`)
VALUES
	(1,1,1,'open',1,'009933'),
	(2,1,1,'closed',2,'990000');

/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure`;

CREATE TABLE `exp_structure` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `listing_cid` int(6) unsigned NOT NULL DEFAULT '0',
  `lft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rgt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dead` varchar(100) NOT NULL,
  `hidden` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure` WRITE;
/*!40000 ALTER TABLE `exp_structure` DISABLE KEYS */;

INSERT INTO `exp_structure` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `listing_cid`, `lft`, `rgt`, `dead`, `hidden`)
VALUES
	(0,0,0,0,0,1,32,'root','n'),
	(1,1,13,3,0,11,12,'','n'),
	(1,2,13,3,0,17,18,'','n'),
	(1,3,13,3,0,19,20,'','n'),
	(1,4,13,3,0,13,14,'','n'),
	(1,5,13,3,0,23,24,'','n'),
	(1,6,13,3,0,15,16,'','n'),
	(1,7,13,3,0,21,22,'','n'),
	(1,8,13,3,0,25,26,'','n'),
	(1,10,0,1,0,2,3,'','n'),
	(1,11,0,1,0,4,5,'','n'),
	(1,12,0,1,4,6,9,'','n'),
	(1,13,0,1,0,10,27,'','n'),
	(1,14,0,1,2,28,29,'','n'),
	(1,15,0,1,0,30,31,'','n'),
	(1,23,12,5,0,7,8,'','n');

/*!40000 ALTER TABLE `exp_structure` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_channels`;

CREATE TABLE `exp_structure_channels` (
  `site_id` smallint(5) unsigned NOT NULL,
  `channel_id` mediumint(8) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_channels` WRITE;
/*!40000 ALTER TABLE `exp_structure_channels` DISABLE KEYS */;

INSERT INTO `exp_structure_channels` (`site_id`, `channel_id`, `template_id`, `type`, `split_assets`, `show_in_page_selector`)
VALUES
	(1,1,9,'page','n','y'),
	(1,2,14,'listing','n','y'),
	(1,3,19,'page','n','y'),
	(1,4,9,'listing','n','y'),
	(1,5,12,'page','n','y');

/*!40000 ALTER TABLE `exp_structure_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_listings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_listings`;

CREATE TABLE `exp_structure_listings` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `template_id` int(6) unsigned NOT NULL DEFAULT '0',
  `uri` varchar(75) NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_listings` WRITE;
/*!40000 ALTER TABLE `exp_structure_listings` DISABLE KEYS */;

INSERT INTO `exp_structure_listings` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `template_id`, `uri`)
VALUES
	(1,16,14,2,14,'the-story-behind-20mile'),
	(1,17,14,2,14,'were-hiring-web-developer'),
	(1,18,14,2,14,'expressionengine-and-git-using-git-hooks-to-track-database-changes'),
	(1,19,12,4,9,'british-beer-company'),
	(1,20,12,4,9,'the-lanes-bowl-bistro'),
	(1,21,14,2,14,'why-we-use-teamworkpm'),
	(1,22,14,2,14,'how-we-manage-internal-communication'),
	(1,24,12,4,9,'bradford-inn'),
	(1,25,12,4,9,'mit-executive-mba-program'),
	(1,26,12,4,9,'cotuit-center-for-the-arts'),
	(1,27,12,4,9,'cape-cod-healthcare');

/*!40000 ALTER TABLE `exp_structure_listings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_members`;

CREATE TABLE `exp_structure_members` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `nav_state` text,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_members` WRITE;
/*!40000 ALTER TABLE `exp_structure_members` DISABLE KEYS */;

INSERT INTO `exp_structure_members` (`member_id`, `site_id`, `nav_state`)
VALUES
	(1,1,'false');

/*!40000 ALTER TABLE `exp_structure_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_settings`;

CREATE TABLE `exp_structure_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) NOT NULL,
  `var_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_settings` WRITE;
/*!40000 ALTER TABLE `exp_structure_settings` DISABLE KEYS */;

INSERT INTO `exp_structure_settings` (`id`, `site_id`, `var`, `var_value`)
VALUES
	(1,0,'action_ajax_move','22'),
	(2,0,'module_id','14'),
	(10,1,'redirect_on_login','n'),
	(11,1,'redirect_on_publish','structure_only'),
	(12,1,'hide_hidden_templates','y'),
	(13,1,'add_trailing_slash','y');

/*!40000 ALTER TABLE `exp_structure_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_super_search_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_cache`;

CREATE TABLE `exp_super_search_cache` (
  `cache_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `type` char(1) NOT NULL DEFAULT 'q',
  `date` int(10) unsigned NOT NULL,
  `results` smallint(7) unsigned NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `ids` mediumtext,
  `query` mediumtext,
  PRIMARY KEY (`cache_id`),
  KEY `site_id` (`site_id`),
  KEY `type` (`type`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_super_search_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_history`;

CREATE TABLE `exp_super_search_history` (
  `history_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `cache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cookie_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '',
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `results` smallint(7) unsigned NOT NULL DEFAULT '0',
  `search_name` varchar(250) NOT NULL DEFAULT '',
  `search_date` int(10) unsigned NOT NULL DEFAULT '0',
  `saved` char(1) NOT NULL DEFAULT 'n',
  `historical` char(1) NOT NULL DEFAULT 'n',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `query` mediumtext,
  `term` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`history_id`),
  UNIQUE KEY `search_key` (`member_id`,`cookie_id`,`site_id`,`search_name`,`saved`),
  KEY `cache_id` (`cache_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_super_search_indexes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_indexes`;

CREATE TABLE `exp_super_search_indexes` (
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `index_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_super_search_indexes` WRITE;
/*!40000 ALTER TABLE `exp_super_search_indexes` DISABLE KEYS */;

INSERT INTO `exp_super_search_indexes` (`entry_id`, `site_id`, `index_date`)
VALUES
	(1,1,1364308300),
	(2,1,1364417233),
	(3,1,1364305353),
	(4,1,1364413737),
	(5,1,1364411799),
	(6,1,1364305132),
	(7,1,1364307158),
	(8,1,1364414443),
	(10,1,1363097935),
	(11,1,1364394116),
	(12,1,1364320100),
	(13,1,1364414987),
	(14,1,1363107882),
	(15,1,1364324979),
	(16,1,1363276914),
	(17,1,1364307083),
	(18,1,1364241422),
	(19,1,1364417267),
	(20,1,1364480738),
	(21,1,1364341013),
	(22,1,1364339448),
	(23,1,1364395445),
	(24,1,1364480702),
	(25,1,1364417423),
	(26,1,1364416919),
	(27,1,1364416213);

/*!40000 ALTER TABLE `exp_super_search_indexes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_super_search_lexicon_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_lexicon_log`;

CREATE TABLE `exp_super_search_lexicon_log` (
  `lexicon_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  `entry_ids` varchar(200) NOT NULL DEFAULT '',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `origin` varchar(200) NOT NULL DEFAULT '',
  `action_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lexicon_id`),
  KEY `type` (`type`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_super_search_lexicon_log` WRITE;
/*!40000 ALTER TABLE `exp_super_search_lexicon_log` DISABLE KEYS */;

INSERT INTO `exp_super_search_lexicon_log` (`lexicon_id`, `type`, `entry_ids`, `member_id`, `origin`, `action_date`)
VALUES
	(1,'build','0||1',0,'manual',1359842375),
	(2,'build','0||7',0,'manual',1359842444),
	(3,'build','0||10',0,'manual',1363018927),
	(4,'build','0||11',0,'manual',1363018994),
	(5,'build','0||12',0,'manual',1363019023),
	(6,'build','0||13',0,'manual',1363019535),
	(7,'build','0||14',0,'manual',1363019546),
	(8,'build','0||15',0,'manual',1363019556),
	(9,'build','0||10',0,'manual',1363020221),
	(10,'build','0||10',0,'manual',1363021287),
	(11,'build','0||10',0,'manual',1363021309),
	(12,'build','0||10',0,'manual',1363097935),
	(13,'build','0||11',0,'manual',1363106637),
	(14,'build','0||12',0,'manual',1363106649),
	(15,'build','0||13',0,'manual',1363106658),
	(16,'build','0||14',0,'manual',1363106672),
	(17,'build','0||15',0,'manual',1363106683),
	(18,'build','0||14',0,'manual',1363107882),
	(19,'build','0||11',0,'manual',1363108715),
	(20,'build','0||13',0,'manual',1363117397),
	(21,'build','0||13',0,'manual',1363117423),
	(22,'build','0||7',0,'manual',1363117984),
	(23,'build','0||8',0,'manual',1363117995),
	(24,'build','0||6',0,'manual',1363118008),
	(25,'build','0||5',0,'manual',1363118028),
	(26,'build','0||4',0,'manual',1363118038),
	(27,'build','0||3',0,'manual',1363118055),
	(28,'build','0||2',0,'manual',1363118065),
	(29,'build','0||1',0,'manual',1363118076),
	(30,'build','0||1',0,'manual',1363118180),
	(31,'build','0||6',0,'manual',1363118190),
	(32,'build','0||4',0,'manual',1363118197),
	(33,'build','0||3',0,'manual',1363118205),
	(34,'build','0||7',0,'manual',1363118212),
	(35,'build','0||2',0,'manual',1363118220),
	(36,'build','0||5',0,'manual',1363118227),
	(37,'build','0||8',0,'manual',1363118234),
	(38,'build','0||1',0,'manual',1363118792),
	(39,'build','0||6',0,'manual',1363118885),
	(40,'build','0||4',0,'manual',1363118904),
	(41,'build','0||3',0,'manual',1363118929),
	(42,'build','0||7',0,'manual',1363118946),
	(43,'build','0||2',0,'manual',1363118975),
	(44,'build','0||5',0,'manual',1363118997),
	(45,'build','0||8',0,'manual',1363119017),
	(46,'build','0||1',0,'manual',1363183676),
	(47,'build','0||6',0,'manual',1363183744),
	(48,'build','0||4',0,'manual',1363183755),
	(49,'build','0||3',0,'manual',1363183764),
	(50,'build','0||7',0,'manual',1363183773),
	(51,'build','0||2',0,'manual',1363183780),
	(52,'build','0||5',0,'manual',1363183786),
	(53,'build','0||8',0,'manual',1363183793),
	(54,'build','0||7',0,'manual',1363183931),
	(55,'build','0||16',0,'manual',1363189837),
	(56,'build','0||16',0,'manual',1363194910),
	(57,'build','0||16',0,'manual',1363196114),
	(58,'build','0||17',0,'manual',1363268323),
	(59,'build','0||17',0,'manual',1363268339),
	(60,'build','0||17',0,'manual',1363268396),
	(61,'build','0||17',0,'manual',1363268420),
	(62,'build','0||17',0,'manual',1363268452),
	(63,'build','0||17',0,'manual',1363270075),
	(64,'build','0||17',0,'manual',1363272871),
	(65,'build','0||18',0,'manual',1363276599),
	(66,'build','0||18',0,'manual',1363276709),
	(67,'build','0||18',0,'manual',1363276749),
	(68,'build','0||16',0,'manual',1363276832),
	(69,'build','0||18',0,'manual',1363276881),
	(70,'build','0||17',0,'manual',1363276903),
	(71,'build','0||16',0,'manual',1363276914),
	(72,'build','0||12',0,'manual',1363278385),
	(73,'build','0||12',0,'manual',1363278402),
	(74,'build','0||12',0,'manual',1363282706),
	(75,'build','0||19',0,'manual',1363285850),
	(76,'build','0||19',0,'manual',1363289123),
	(77,'build','0||19',0,'manual',1363289253),
	(78,'build','0||19',0,'manual',1363291110),
	(79,'build','0||1',0,'manual',1364228094),
	(80,'build','0||4',0,'manual',1364228109),
	(81,'build','0||6',0,'manual',1364228121),
	(82,'build','0||2',0,'manual',1364228133),
	(83,'build','0||3',0,'manual',1364228148),
	(84,'build','0||7',0,'manual',1364228157),
	(85,'build','0||5',0,'manual',1364228166),
	(86,'build','0||8',0,'manual',1364228175),
	(87,'build','0||18',0,'manual',1364241389),
	(88,'build','0||18',0,'manual',1364241422),
	(89,'build','0||20',0,'manual',1364303882),
	(90,'build','0||20',0,'manual',1364303912),
	(91,'build','0||2',0,'manual',1364304883),
	(92,'build','0||1',0,'manual',1364305001),
	(93,'build','0||6',0,'manual',1364305132),
	(94,'build','0||3',0,'manual',1364305353),
	(95,'build','0||1',0,'manual',1364305366),
	(96,'build','0||15',0,'manual',1364306790),
	(97,'build','0||17',0,'manual',1364306937),
	(98,'build','0||17',0,'manual',1364307083),
	(99,'build','0||7',0,'manual',1364307158),
	(100,'build','0||15',0,'manual',1364307182),
	(101,'build','0||8',0,'manual',1364307336),
	(102,'build','0||1',0,'manual',1364307381),
	(103,'build','0||1',0,'manual',1364307485),
	(104,'build','0||1',0,'manual',1364307534),
	(105,'build','0||4',0,'manual',1364307602),
	(106,'build','0||8',0,'manual',1364308026),
	(107,'build','0||1',0,'manual',1364308210),
	(108,'build','0||1',0,'manual',1364308269),
	(109,'build','0||1',0,'manual',1364308300),
	(110,'build','0||13',0,'manual',1364308654),
	(111,'build','0||21',0,'manual',1364310695),
	(112,'build','0||21',0,'manual',1364310976),
	(113,'build','0||21',0,'manual',1364311061),
	(114,'build','0||21',0,'manual',1364311591),
	(115,'build','0||21',0,'manual',1364313049),
	(116,'build','0||21',0,'manual',1364313183),
	(117,'build','0||21',0,'manual',1364313267),
	(118,'build','0||21',0,'manual',1364313406),
	(119,'build','0||13',0,'manual',1364314118),
	(120,'build','0||22',0,'manual',1364315068),
	(121,'build','0||22',0,'manual',1364315136),
	(122,'build','0||22',0,'manual',1364315996),
	(123,'build','0||11',0,'manual',1364319917),
	(124,'build','0||12',0,'manual',1364319937),
	(125,'build','0||13',0,'manual',1364320005),
	(126,'build','0||11',0,'manual',1364320079),
	(127,'build','0||12',0,'manual',1364320100),
	(128,'build','0||13',0,'manual',1364320142),
	(129,'build','0||15',0,'manual',1364320172),
	(130,'build','0||11',0,'manual',1364324760),
	(131,'build','0||15',0,'manual',1364324979),
	(132,'build','0||13',0,'manual',1364325034),
	(133,'build','0||2',0,'manual',1364337984),
	(134,'build','0||2',0,'manual',1364338031),
	(135,'build','0||22',0,'manual',1364338292),
	(136,'build','0||21',0,'manual',1364338348),
	(137,'build','0||22',0,'manual',1364338369),
	(138,'build','0||22',0,'manual',1364338419),
	(139,'build','0||22',0,'manual',1364338605),
	(140,'build','0||22',0,'manual',1364338784),
	(141,'build','0||21',0,'manual',1364338841),
	(142,'build','0||21',0,'manual',1364339306),
	(143,'build','0||21',0,'manual',1364339422),
	(144,'build','0||22',0,'manual',1364339448),
	(145,'build','0||21',0,'manual',1364340902),
	(146,'build','0||21',0,'manual',1364341013),
	(147,'build','0||20',0,'manual',1364393564),
	(148,'build','0||11',0,'manual',1364394019),
	(149,'build','0||13',0,'manual',1364394079),
	(150,'build','0||11',0,'manual',1364394116),
	(151,'build','0||20',0,'manual',1364394134),
	(152,'build','0||20',0,'manual',1364394186),
	(153,'build','0||23',0,'manual',1364395203),
	(154,'build','0||20',0,'manual',1364395224),
	(155,'build','0||23',0,'manual',1364395445),
	(156,'build','0||24',0,'manual',1364397419),
	(157,'build','0||24',0,'manual',1364399533),
	(158,'build','0||25',0,'manual',1364400273),
	(159,'build','0||26',0,'manual',1364400703),
	(160,'build','0||26',0,'manual',1364400788),
	(161,'build','0||26',0,'manual',1364400808),
	(162,'build','0||25',0,'manual',1364400996),
	(163,'build','0||25',0,'manual',1364401024),
	(164,'build','0||27',0,'manual',1364401351),
	(165,'build','0||13',0,'manual',1364402880),
	(166,'build','0||20',0,'manual',1364403560),
	(167,'build','0||25',0,'manual',1364404335),
	(168,'build','0||25',0,'manual',1364404365),
	(169,'build','0||19',0,'manual',1364404700),
	(170,'build','0||26',0,'manual',1364405643),
	(171,'build','0||26',0,'manual',1364405764),
	(172,'build','0||25',0,'manual',1364405806),
	(173,'build','0||27',0,'manual',1364406246),
	(174,'build','0||24',0,'manual',1364407141),
	(175,'build','0||24',0,'manual',1364407171),
	(176,'build','0||5',0,'manual',1364411799),
	(177,'build','0||4',0,'manual',1364413737),
	(178,'build','0||8',0,'manual',1364414443),
	(179,'build','0||20',0,'manual',1364414699),
	(180,'build','0||13',0,'manual',1364414987),
	(181,'build','0||27',0,'manual',1364415006),
	(182,'build','0||20',0,'manual',1364415290),
	(183,'build','0||20',0,'manual',1364415396),
	(184,'build','0||27',0,'manual',1364416213),
	(185,'build','0||19',0,'manual',1364416737),
	(186,'build','0||19',0,'manual',1364416820),
	(187,'build','0||26',0,'manual',1364416919),
	(188,'build','0||2',0,'manual',1364417233),
	(189,'build','0||19',0,'manual',1364417267),
	(190,'build','0||25',0,'manual',1364417423),
	(191,'build','0||24',0,'manual',1364480642),
	(192,'build','0||24',0,'manual',1364480702),
	(193,'build','0||20',0,'manual',1364480738);

/*!40000 ALTER TABLE `exp_super_search_lexicon_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_super_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_log`;

CREATE TABLE `exp_super_search_log` (
  `log_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` varchar(10) NOT NULL DEFAULT '1',
  `results` smallint(7) unsigned NOT NULL DEFAULT '0',
  `search_date` int(10) unsigned NOT NULL DEFAULT '0',
  `term` varchar(200) NOT NULL DEFAULT '',
  `query` mediumtext,
  PRIMARY KEY (`log_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_super_search_refresh_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_refresh_rules`;

CREATE TABLE `exp_super_search_refresh_rules` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh` smallint(5) unsigned NOT NULL DEFAULT '0',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `site_id` (`site_id`),
  KEY `template_id` (`template_id`),
  KEY `channel_id` (`channel_id`),
  KEY `category_group_id` (`category_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_super_search_refresh_rules` WRITE;
/*!40000 ALTER TABLE `exp_super_search_refresh_rules` DISABLE KEYS */;

INSERT INTO `exp_super_search_refresh_rules` (`rule_id`, `site_id`, `date`, `refresh`, `template_id`, `channel_id`, `category_group_id`, `member_id`)
VALUES
	(1,1,1359653498,10,0,0,0,1);

/*!40000 ALTER TABLE `exp_super_search_refresh_rules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_super_search_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_super_search_terms`;

CREATE TABLE `exp_super_search_terms` (
  `term_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` varchar(10) NOT NULL DEFAULT '1',
  `term` varchar(200) NOT NULL DEFAULT '',
  `term_soundex` varchar(200) NOT NULL DEFAULT '',
  `term_length` int(10) unsigned NOT NULL DEFAULT '0',
  `first_seen` int(10) unsigned NOT NULL DEFAULT '0',
  `last_seen` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_count` int(10) unsigned NOT NULL DEFAULT '0',
  `suggestions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`term`),
  KEY `term_id` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_super_search_terms` WRITE;
/*!40000 ALTER TABLE `exp_super_search_terms` DISABLE KEYS */;

INSERT INTO `exp_super_search_terms` (`term_id`, `site_id`, `term`, `term_soundex`, `term_length`, `first_seen`, `last_seen`, `count`, `entry_count`, `suggestions`)
VALUES
	(4489,'1','1','',1,0,0,0,2,''),
	(4514,'1','10','',2,0,0,0,16,''),
	(856,'1','100','',3,0,0,0,38,''),
	(1898,'1','12px','P200',4,0,0,0,6,''),
	(4788,'1','14','',2,0,0,0,4,''),
	(6242,'1','140','',3,0,0,0,14,''),
	(6517,'1','149','',3,0,0,0,14,''),
	(16,'1','15','',2,0,0,0,24,''),
	(4941,'1','1997','',4,0,0,0,2,''),
	(4516,'1','2','',1,0,0,0,12,''),
	(880,'1','20','',2,0,0,0,20,''),
	(1540,'1','200','',3,0,0,0,10,''),
	(14,'1','2007','',4,0,0,0,15,''),
	(4763,'1','2010','',4,0,0,0,5,''),
	(4972,'1','2012','',4,0,0,0,2,''),
	(5,'1','20mile','M400',6,0,0,0,50,''),
	(3303,'1','20mileinteractive','M4536231',17,0,0,0,6,''),
	(6368,'1','25','',2,0,0,0,14,''),
	(4536,'1','3','',1,0,0,0,2,''),
	(6532,'1','37signals','S542',9,0,0,0,23,''),
	(26,'1','39','',2,0,0,0,67,''),
	(777,'1','4','',1,0,0,0,6,''),
	(6497,'1','40','',2,0,0,0,14,''),
	(1510,'1','419','',3,0,0,0,10,''),
	(10622,'1','5','',1,0,0,0,9,''),
	(4951,'1','500','',3,0,0,0,1,''),
	(1509,'1','508','',3,0,0,0,10,''),
	(845,'1','6x8','X000',3,0,0,0,5,''),
	(1511,'1','7439','',4,0,0,0,10,''),
	(4773,'1','90','',2,0,0,0,5,''),
	(10498,'1','95','',2,0,0,0,9,''),
	(8,'1','a','A000',1,0,0,0,72,''),
	(935,'1','ability','A143',7,0,0,0,15,''),
	(1635,'1','able','A140',4,0,0,0,25,''),
	(985,'1','about','A130',5,0,0,0,29,''),
	(6512,'1','accessible','A214',10,0,0,0,14,''),
	(6118,'1','account','A253',7,0,0,0,23,''),
	(17048,'1','accountant','A25353',10,0,0,0,1,''),
	(6500,'1','accounts','A2532',8,0,0,0,14,''),
	(6416,'1','accuracy','A262',8,0,0,0,14,''),
	(1622,'1','across','A262',6,0,0,0,33,''),
	(1537,'1','active','A231',6,0,0,0,24,''),
	(6406,'1','actual','A234',6,0,0,0,17,''),
	(1679,'1','actually','A234',8,0,0,0,24,''),
	(4499,'1','add','A300',3,0,0,0,2,''),
	(6465,'1','added','A300',5,0,0,0,14,''),
	(17112,'1','administrative','A3523631',14,0,0,0,1,''),
	(929,'1','advise','A312',6,0,0,0,5,''),
	(171,'1','aenean','A500',6,0,0,0,6,''),
	(15,'1','after','A136',5,0,0,0,40,''),
	(6387,'1','against','A2523',7,0,0,0,14,''),
	(4948,'1','agencies','A252',8,0,0,0,1,''),
	(4967,'1','agency','A252',6,0,0,0,1,''),
	(17074,'1','ago','A200',3,0,0,0,1,''),
	(1564,'1','all','A400',3,0,0,0,41,''),
	(6380,'1','allows','A420',6,0,0,0,15,''),
	(864,'1','almost','A4523',6,0,0,0,20,''),
	(10541,'1','also','A420',4,0,0,0,9,''),
	(13229,'1','alt','A430',3,0,0,0,7,''),
	(6155,'1','alternatives','A4365312',12,0,0,0,14,''),
	(6540,'1','always','A420',6,0,0,0,23,''),
	(757,'1','amazed','A523',6,0,0,0,14,''),
	(6685,'1','amp','A510',3,0,0,0,13,''),
	(286,'1','amy','A500',3,0,0,0,6,''),
	(895,'1','an','A500',2,0,0,0,41,''),
	(78,'1','and','A530',3,0,0,0,66,''),
	(6060,'1','anniversary','A51626',11,0,0,0,14,''),
	(10511,'1','another','A536',7,0,0,0,9,''),
	(3272,'1','answer','A526',6,0,0,0,6,''),
	(3285,'1','anwser','A526',6,0,0,0,6,''),
	(1572,'1','any','A500',3,0,0,0,33,''),
	(6338,'1','anything','A5352',8,0,0,0,23,''),
	(1508,'1','anytime','A535',7,0,0,0,10,''),
	(1684,'1','api','A100',3,0,0,0,24,''),
	(6425,'1','app','A100',3,0,0,0,14,''),
	(6031,'1','application','A14235',11,0,0,0,11,''),
	(1595,'1','applications','A142352',12,0,0,0,21,''),
	(1669,'1','appreciate','A1623',10,0,0,0,10,''),
	(10450,'1','approach','A162',8,0,0,0,9,''),
	(85,'1','approaches','A162',10,0,0,0,8,''),
	(6056,'1','approaching','A16252',11,0,0,0,14,''),
	(6496,'1','approximately','A162534',13,0,0,0,14,''),
	(6440,'1','apps','A120',4,0,0,0,23,''),
	(1645,'1','architecture','A623236',12,0,0,0,10,''),
	(901,'1','are','A600',3,0,0,0,47,''),
	(4904,'1','areas','A620',5,0,0,0,1,''),
	(6323,'1','around','A653',6,0,0,0,14,''),
	(16847,'1','arts','A632',4,0,0,0,6,''),
	(837,'1','as','A200',2,0,0,0,33,''),
	(915,'1','ask','A200',3,0,0,0,5,''),
	(958,'1','asked','A230',5,0,0,0,19,''),
	(6288,'1','asking','A252',6,0,0,0,14,''),
	(6397,'1','assigned','A253',8,0,0,0,14,''),
	(16985,'1','assorted','A263',8,0,0,0,1,''),
	(4482,'1','assume','A250',6,0,0,0,2,''),
	(6156,'1','as_epq','A212',6,0,0,0,14,''),
	(6158,'1','as_eq','A200',5,0,0,0,14,''),
	(6171,'1','as_filetype','A21431',11,0,0,0,14,''),
	(6160,'1','as_nhi','A250',6,0,0,0,14,''),
	(6159,'1','as_nlo','A254',6,0,0,0,14,''),
	(6166,'1','as_occt','A230',7,0,0,0,14,''),
	(6157,'1','as_oq','A200',5,0,0,0,14,''),
	(6154,'1','as_q','A200',4,0,0,0,14,''),
	(6163,'1','as_qdr','A236',6,0,0,0,14,''),
	(6172,'1','as_rights','A26232',9,0,0,0,14,''),
	(6165,'1','as_sitesearch','A23262',13,0,0,0,14,''),
	(775,'1','at','A300',2,0,0,0,51,''),
	(6421,'1','attempt','A3513',7,0,0,0,14,''),
	(189,'1','auctor','A236',6,0,0,0,3,''),
	(939,'1','audience','A352',8,0,0,0,5,''),
	(10641,'1','audio','A300',5,0,0,0,9,''),
	(184,'1','augue','A200',5,0,0,0,6,''),
	(6117,'1','available','A1414',9,0,0,0,14,''),
	(10555,'1','away','A000',4,0,0,0,9,''),
	(6237,'1','awhile','A400',6,0,0,0,14,''),
	(870,'1','back','B200',4,0,0,0,19,''),
	(11368,'1','background','B2653',10,0,0,0,1,''),
	(4931,'1','baking','B252',6,0,0,0,1,''),
	(52,'1','barnstable','B652314',10,0,0,0,14,''),
	(6072,'1','basecamp','B251',8,0,0,0,23,''),
	(1644,'1','based','B230',5,0,0,0,33,''),
	(4537,'1','bash','B200',4,0,0,0,2,''),
	(4768,'1','basic','B200',5,0,0,0,4,''),
	(6361,'1','basis','B200',5,0,0,0,14,''),
	(57,'1','bbc','B200',3,0,0,0,14,''),
	(37,'1','be','B000',2,0,0,0,58,''),
	(47,'1','beach','B200',5,0,0,0,16,''),
	(4987,'1','beaches','B200',7,0,0,0,1,''),
	(69,'1','beautiful','B314',9,0,0,0,10,''),
	(10448,'1','because','B200',7,0,0,0,9,''),
	(16975,'1','become','B250',6,0,0,0,1,''),
	(862,'1','been','B500',4,0,0,0,18,''),
	(4297,'1','beer','B600',4,0,0,0,8,''),
	(55,'1','beers','B620',5,0,0,0,14,''),
	(4563,'1','before','B600',6,0,0,0,12,''),
	(751,'1','behind','B530',6,0,0,0,5,''),
	(6444,'1','being','B520',5,0,0,0,14,''),
	(6565,'1','benefit','B513',7,0,0,0,23,''),
	(93,'1','best','B230',4,0,0,0,36,''),
	(3278,'1','better','B360',6,0,0,0,29,''),
	(10544,'1','between','B350',7,0,0,0,9,''),
	(10426,'1','bieber','B600',6,0,0,0,9,''),
	(6483,'1','billing','B452',7,0,0,0,14,''),
	(4544,'1','bin','B500',3,0,0,0,2,''),
	(10615,'1','bio','B000',3,0,0,0,9,''),
	(4744,'1','bistro','B236',6,0,0,0,13,''),
	(16958,'1','block','B420',5,0,0,0,1,''),
	(6180,'1','blog','B420',4,0,0,0,14,''),
	(10552,'1','bolton','B435',6,0,0,0,9,''),
	(6195,'1','bombarded','B5163',9,0,0,0,14,''),
	(17111,'1','bookkeeping','B2152',11,0,0,0,1,''),
	(10494,'1','boomerang','B5652',9,0,0,0,9,''),
	(17082,'1','border','B636',6,0,0,0,1,''),
	(1533,'1','boston','B235',6,0,0,0,10,''),
	(938,'1','both','B300',4,0,0,0,19,''),
	(6302,'1','bottom','B350',6,0,0,0,14,''),
	(4743,'1','bowl','B400',4,0,0,0,13,''),
	(4926,'1','boys','B200',4,0,0,0,2,''),
	(1642,'1','br','B600',2,0,0,0,10,''),
	(16835,'1','bradford','B63163',8,0,0,0,6,''),
	(33,'1','brainstorming','B6523652',13,0,0,0,14,''),
	(853,'1','brand','B653',5,0,0,0,9,''),
	(4771,'1','brazil','B624',6,0,0,0,4,''),
	(869,'1','brings','B652',6,0,0,0,19,''),
	(4296,'1','british','B632',7,0,0,0,8,''),
	(16971,'1','browser','B626',7,0,0,0,1,''),
	(1624,'1','browsers','B6262',8,0,0,0,11,''),
	(936,'1','build','B430',5,0,0,0,14,''),
	(16994,'1','building','B4352',8,0,0,0,1,''),
	(6410,'1','built','B430',5,0,0,0,15,''),
	(921,'1','business','B252',8,0,0,0,19,''),
	(17085,'1','busy','B200',4,0,0,0,1,''),
	(1701,'1','but','B300',3,0,0,0,46,''),
	(5063,'1','by','B000',2,0,0,0,17,''),
	(6471,'1','calendar','C4536',8,0,0,0,23,''),
	(6463,'1','calendars','C45362',9,0,0,0,14,''),
	(5056,'1','call','C400',4,0,0,0,1,''),
	(1703,'1','called','C430',6,0,0,0,10,''),
	(10409,'1','camaraderie','C5636',11,0,0,0,9,''),
	(962,'1','came','C500',4,0,0,0,5,''),
	(10571,'1','campfire','C516',8,0,0,0,9,''),
	(17062,'1','camping','C5152',7,0,0,0,1,''),
	(36,'1','can','C500',3,0,0,0,58,''),
	(1493,'1','cape','C100',4,0,0,0,24,''),
	(10601,'1','car','C600',3,0,0,0,9,''),
	(6372,'1','categories','C3262',10,0,0,0,14,''),
	(4510,'1','cd','C300',2,0,0,0,2,''),
	(16844,'1','center','C536',6,0,0,0,6,''),
	(6067,'1','cfm','C150',3,0,0,0,14,''),
	(800,'1','challenge','C452',9,0,0,0,5,''),
	(920,'1','challenges','C452',10,0,0,0,9,''),
	(874,'1','change','C520',6,0,0,0,19,''),
	(3253,'1','changes','C520',7,0,0,0,6,''),
	(6492,'1','charges','C620',7,0,0,0,14,''),
	(10482,'1','chat','C300',4,0,0,0,9,''),
	(10565,'1','chats','C320',5,0,0,0,9,''),
	(6555,'1','check','C000',5,0,0,0,14,''),
	(6223,'1','checking','C520',8,0,0,0,14,''),
	(904,'1','cheerleader','C6436',11,0,0,0,5,''),
	(4993,'1','children','C4365',8,0,0,0,1,''),
	(17095,'1','chip','C100',4,0,0,0,1,''),
	(4534,'1','chmod','C530',5,0,0,0,2,''),
	(17094,'1','chocolate','C430',9,0,0,0,1,''),
	(882,'1','choices','C000',7,0,0,0,5,''),
	(59,'1','chris','C620',5,0,0,0,8,''),
	(9786,'1','cke','C000',3,0,0,0,1,''),
	(6073,'1','classic','C420',7,0,0,0,14,''),
	(910,'1','client','C453',6,0,0,0,41,''),
	(31,'1','clients','C4532',7,0,0,0,43,''),
	(6313,'1','close','C420',5,0,0,0,14,''),
	(6119,'1','closed','C423',6,0,0,0,14,''),
	(10428,'1','club','C410',4,0,0,0,9,''),
	(16989,'1','coastal','C340',7,0,0,0,1,''),
	(1494,'1','cod','C300',3,0,0,0,15,''),
	(4524,'1','code','C300',4,0,0,0,20,''),
	(1652,'1','codeigniter','C32536',11,0,0,0,10,''),
	(1638,'1','collaborate','C4163',11,0,0,0,10,''),
	(10490,'1','collaboration','C41635',13,0,0,0,9,''),
	(10449,'1','collaborative','C41631',13,0,0,0,9,''),
	(903,'1','collaborator','C41636',12,0,0,0,5,''),
	(6209,'1','colleagues','C420',10,0,0,0,14,''),
	(17083,'1','collie','C400',6,0,0,0,1,''),
	(6475,'1','column','C450',6,0,0,0,14,''),
	(6151,'1','com','C500',3,0,0,0,17,''),
	(10524,'1','come','C500',4,0,0,0,9,''),
	(4890,'1','comes','C520',5,0,0,0,24,''),
	(1550,'1','commerce','C562',8,0,0,0,12,''),
	(4530,'1','commit','C530',6,0,0,0,2,''),
	(4567,'1','commited','C530',8,0,0,0,2,''),
	(1712,'1','communicate','C523',11,0,0,0,10,''),
	(10368,'1','communication','C5235',13,0,0,0,9,''),
	(23,'1','companies','C5152',9,0,0,0,14,''),
	(806,'1','company','C515',7,0,0,0,28,''),
	(6402,'1','compare','C516',7,0,0,0,14,''),
	(10631,'1','competitors','C51362',11,0,0,0,9,''),
	(5058,'1','complete','C5143',8,0,0,0,15,''),
	(6131,'1','completely','C51434',10,0,0,0,14,''),
	(6396,'1','completing','C514352',10,0,0,0,14,''),
	(6399,'1','completion','C51435',10,0,0,0,14,''),
	(1631,'1','complex','C5142',7,0,0,0,10,''),
	(10661,'1','conferencing','C5165252',12,0,0,0,9,''),
	(858,'1','confident','C51353',9,0,0,0,5,''),
	(955,'1','connect','C523',7,0,0,0,5,''),
	(1580,'1','consider','C5236',8,0,0,0,10,''),
	(6211,'1','considered','C52363',10,0,0,0,14,''),
	(1627,'1','consistent','C52353',10,0,0,0,24,''),
	(6251,'1','constant','C52353',8,0,0,0,14,''),
	(6034,'1','consulting','C524352',10,0,0,0,2,''),
	(1685,'1','consumption','C525135',11,0,0,0,10,''),
	(117,'1','contact','C5323',7,0,0,0,16,''),
	(1546,'1','content','C5353',7,0,0,0,14,''),
	(4796,'1','contributing','C5361352',12,0,0,0,4,''),
	(3270,'1','control','C5364',7,0,0,0,20,''),
	(3295,'1','conventions','C515352',11,0,0,0,6,''),
	(17096,'1','cookies','C000',7,0,0,0,1,''),
	(4930,'1','cooking','C520',7,0,0,0,1,''),
	(4495,'1','copy','C100',4,0,0,0,16,''),
	(16843,'1','cotuit','C300',6,0,0,0,6,''),
	(960,'1','could','C430',5,0,0,0,28,''),
	(6098,'1','couldn','C435',6,0,0,0,14,''),
	(930,'1','counsel','C524',7,0,0,0,5,''),
	(975,'1','couple','C140',6,0,0,0,19,''),
	(6039,'1','covered','C163',7,0,0,0,2,''),
	(6162,'1','cr','C600',2,0,0,0,14,''),
	(16748,'1','craft','C613',5,0,0,0,2,''),
	(1632,'1','crafted','C613',7,0,0,0,10,''),
	(68,'1','crafts','C6132',6,0,0,0,8,''),
	(4517,'1','create','C630',6,0,0,0,16,''),
	(886,'1','created','C630',7,0,0,0,7,''),
	(871,'1','creating','C6352',8,0,0,0,6,''),
	(88,'1','creative','C631',8,0,0,0,26,''),
	(6559,'1','credits','C632',7,0,0,0,23,''),
	(1590,'1','css','C000',3,0,0,0,10,''),
	(1598,'1','css3','C000',4,0,0,0,10,''),
	(17132,'1','cursing','C6252',7,0,0,0,1,''),
	(6029,'1','custom','C350',6,0,0,0,3,''),
	(6526,'1','customers','C3562',9,0,0,0,14,''),
	(893,'1','d','D000',1,0,0,0,40,''),
	(1713,'1','daily','D400',5,0,0,0,14,''),
	(1676,'1','data','D000',4,0,0,0,11,''),
	(809,'1','database','D120',8,0,0,0,21,''),
	(1,'1','dave','D100',4,0,0,0,30,''),
	(288,'1','david','D130',5,0,0,0,6,''),
	(890,'1','day','D000',3,0,0,0,19,''),
	(957,'1','days','D200',4,0,0,0,5,''),
	(4549,'1','db','D100',2,0,0,0,2,''),
	(4547,'1','dbpass','D120',6,0,0,0,2,''),
	(4502,'1','dbschema','D125',8,0,0,0,2,''),
	(4545,'1','dbuser','D126',6,0,0,0,2,''),
	(4550,'1','db_name','D150',7,0,0,0,2,''),
	(4548,'1','db_password','D1263',11,0,0,0,2,''),
	(4546,'1','db_username','D1265',11,0,0,0,2,''),
	(6143,'1','decided','D230',7,0,0,0,23,''),
	(6246,'1','decision','D250',8,0,0,0,14,''),
	(6079,'1','decisions','D252',9,0,0,0,14,''),
	(4916,'1','decisively','D214',10,0,0,0,1,''),
	(1629,'1','define','D150',6,0,0,0,10,''),
	(16731,'1','deliver','D416',7,0,0,0,4,''),
	(6201,'1','demo','D500',4,0,0,0,14,''),
	(94,'1','design','D250',6,0,0,0,41,''),
	(4943,'1','designed','D253',8,0,0,0,1,''),
	(66,'1','designer','D256',8,0,0,0,9,''),
	(6501,'1','designers','D2562',9,0,0,0,14,''),
	(17124,'1','designing','D252',9,0,0,0,1,''),
	(10592,'1','desktops','D2312',8,0,0,0,9,''),
	(10519,'1','detailed','D430',8,0,0,0,9,''),
	(77,'1','details','D420',7,0,0,0,8,''),
	(950,'1','develop','D141',7,0,0,0,5,''),
	(578,'1','developer','D1416',9,0,0,0,22,''),
	(1485,'1','developers','D14162',10,0,0,0,24,''),
	(1621,'1','developing','D14152',10,0,0,0,11,''),
	(811,'1','development','D14153',11,0,0,0,36,''),
	(17019,'1','did','D000',3,0,0,0,1,''),
	(768,'1','didn','D500',4,0,0,0,19,''),
	(4814,'1','diets','D200',5,0,0,0,4,''),
	(4808,'1','different','D1653',9,0,0,0,18,''),
	(10680,'1','direct','D623',6,0,0,0,9,''),
	(1484,'1','directed','D623',8,0,0,0,19,''),
	(1706,'1','directly','D6234',8,0,0,0,24,''),
	(96,'1','director','D6236',8,0,0,0,12,''),
	(4500,'1','directory','D6236',9,0,0,0,2,''),
	(947,'1','disappear','D216',9,0,0,0,5,''),
	(6142,'1','disappointed','D2153',12,0,0,0,14,''),
	(6130,'1','disbelief','D2141',9,0,0,0,14,''),
	(65,'1','disciplinary','D21456',12,0,0,0,8,''),
	(6557,'1','disclaimer','D2456',10,0,0,0,23,''),
	(6124,'1','discover','D216',8,0,0,0,14,''),
	(10472,'1','discovered','D2163',10,0,0,0,9,''),
	(6121,'1','dived','D130',5,0,0,0,14,''),
	(1576,'1','divided','D130',7,0,0,0,10,''),
	(824,'1','do','D000',2,0,0,0,36,''),
	(6443,'1','docs','D200',4,0,0,0,14,''),
	(10488,'1','documents','D2532',9,0,0,0,9,''),
	(10584,'1','does','D200',4,0,0,0,9,''),
	(875,'1','doesn','D250',5,0,0,0,14,''),
	(863,'1','doing','D520',5,0,0,0,5,''),
	(188,'1','dolor','D460',5,0,0,0,3,''),
	(6441,'1','domain','D500',6,0,0,0,14,''),
	(908,'1','don','D500',3,0,0,0,11,''),
	(11331,'1','done','D500',4,0,0,0,6,''),
	(17088,'1','down','D500',4,0,0,0,1,''),
	(6479,'1','downloading','D54352',11,0,0,0,14,''),
	(1592,'1','dreamweaver','D6516',11,0,0,0,10,''),
	(6439,'1','drive','D610',5,0,0,0,23,''),
	(1606,'1','drupal','D614',6,0,0,0,10,''),
	(1672,'1','dumping','D5152',7,0,0,0,10,''),
	(795,'1','during','D652',6,0,0,0,19,''),
	(1549,'1','e','E000',1,0,0,0,12,''),
	(989,'1','each','E200',4,0,0,0,28,''),
	(4772,'1','early','E640',5,0,0,0,4,''),
	(6436,'1','easier','E260',6,0,0,0,23,''),
	(6401,'1','easily','E240',6,0,0,0,14,''),
	(6523,'1','easy','E200',4,0,0,0,14,''),
	(16990,'1','ecology','E242',7,0,0,0,1,''),
	(4794,'1','edge','E320',4,0,0,0,4,''),
	(4540,'1','edit','E300',4,0,0,0,2,''),
	(4512,'1','ee','E000',2,0,0,0,2,''),
	(850,'1','eight','E230',5,0,0,0,5,''),
	(6383,'1','either','E360',6,0,0,0,14,''),
	(4479,'1','em','E500',2,0,0,0,2,''),
	(5057,'1','email','E540',5,0,0,0,15,''),
	(284,'1','emily','E540',5,0,0,0,8,''),
	(6153,'1','en','E500',2,0,0,0,17,''),
	(4518,'1','enable','E514',6,0,0,0,11,''),
	(6337,'1','enabled','E5143',7,0,0,0,14,''),
	(1555,'1','encompasses','E52512',11,0,0,0,10,''),
	(1582,'1','end','E530',3,0,0,0,24,''),
	(10406,'1','energy','E562',6,0,0,0,9,''),
	(6268,'1','engineroom','E52565',10,0,0,0,14,''),
	(4990,'1','england','E52453',7,0,0,0,1,''),
	(6454,'1','enjoyed','E523',7,0,0,0,14,''),
	(4805,'1','enjoys','E520',6,0,0,0,5,''),
	(6314,'1','enough','E520',6,0,0,0,14,''),
	(6376,'1','ensure','E526',6,0,0,0,14,''),
	(13313,'1','enterprise','E536162',10,0,0,0,3,''),
	(4781,'1','enviroments','E516532',11,0,0,0,4,''),
	(1544,'1','especially','E2124',10,0,0,0,10,''),
	(6398,'1','estimated','E2353',9,0,0,0,14,''),
	(6404,'1','estimates','E23532',9,0,0,0,14,''),
	(6359,'1','etc','E320',3,0,0,0,14,''),
	(164,'1','etiam','E350',5,0,0,0,6,''),
	(172,'1','eu','E000',2,0,0,0,6,''),
	(170,'1','euismod','E253',7,0,0,0,6,''),
	(764,'1','even','E150',4,0,0,0,20,''),
	(4897,'1','event','E153',5,0,0,0,1,''),
	(16974,'1','eventually','E1534',10,0,0,0,1,''),
	(889,'1','every','E160',5,0,0,0,21,''),
	(986,'1','everything','E16352',10,0,0,0,14,''),
	(6260,'1','evolution','E1435',9,0,0,0,14,''),
	(6481,'1','excel','E240',5,0,0,0,14,''),
	(4532,'1','executable','E2314',10,0,0,0,2,''),
	(16840,'1','executive','E231',9,0,0,0,7,''),
	(6016,'1','existing','E2352',8,0,0,0,16,''),
	(4558,'1','exit','E230',4,0,0,0,2,''),
	(840,'1','expanded','E2153',8,0,0,0,5,''),
	(10423,'1','expanding','E215352',9,0,0,0,9,''),
	(1560,'1','expect','E2123',6,0,0,0,24,''),
	(1552,'1','expectations','E212352',12,0,0,0,10,''),
	(98,'1','experience','E21652',10,0,0,0,32,''),
	(72,'1','experiences','E21652',11,0,0,0,11,''),
	(3301,'1','experimenting','E2165352',13,0,0,0,6,''),
	(1587,'1','expert','E2163',6,0,0,0,10,''),
	(105,'1','expertise','E21632',9,0,0,0,14,''),
	(961,'1','explain','E2145',7,0,0,0,5,''),
	(6266,'1','explaining','E21452',10,0,0,0,14,''),
	(16961,'1','explorer','E2146',8,0,0,0,1,''),
	(4983,'1','exploring','E214652',9,0,0,0,1,''),
	(6469,'1','export','E2163',6,0,0,0,14,''),
	(1604,'1','expressionengine','E2162525',16,0,0,0,16,''),
	(75,'1','eye','E000',3,0,0,0,8,''),
	(6120,'1','eyes','E200',4,0,0,0,14,''),
	(772,'1','face','F200',4,0,0,0,5,''),
	(6312,'1','familiar','F546',8,0,0,0,14,''),
	(17141,'1','family','F540',6,0,0,0,1,''),
	(10427,'1','fan','F500',3,0,0,0,9,''),
	(187,'1','faucibus','F212',8,0,0,0,6,''),
	(10617,'1','favorite','F630',8,0,0,0,9,''),
	(6434,'1','favorites','F632',9,0,0,0,14,''),
	(6453,'1','feature','F360',7,0,0,0,23,''),
	(6111,'1','features','F362',8,0,0,0,14,''),
	(6473,'1','feed','F300',4,0,0,0,14,''),
	(6226,'1','feel','F400',4,0,0,0,14,''),
	(6140,'1','felt','F430',4,0,0,0,14,''),
	(6275,'1','few','F000',3,0,0,0,23,''),
	(10380,'1','field','F430',5,0,0,0,3,''),
	(4529,'1','file','F400',4,0,0,0,25,''),
	(6328,'1','files','F420',5,0,0,0,14,''),
	(4527,'1','find','F530',4,0,0,0,2,''),
	(91,'1','finding','F5352',7,0,0,0,22,''),
	(943,'1','finish','F520',6,0,0,0,5,''),
	(1608,'1','fireworks','F620',9,0,0,0,10,''),
	(1527,'1','firm','F650',4,0,0,0,11,''),
	(914,'1','first','F623',5,0,0,0,18,''),
	(1521,'1','five','F000',4,0,0,0,33,''),
	(10407,'1','flows','F420',5,0,0,0,9,''),
	(1596,'1','fluency','F452',7,0,0,0,10,''),
	(17123,'1','focus','F200',5,0,0,0,1,''),
	(3294,'1','follow','F400',6,0,0,0,6,''),
	(1574,'1','following','F452',9,0,0,0,12,''),
	(1896,'1','font','F530',4,0,0,0,6,''),
	(289,'1','fontes','F532',6,0,0,0,6,''),
	(979,'1','foot','F300',4,0,0,0,5,''),
	(20,'1','for','F600',3,0,0,0,83,''),
	(4985,'1','forests','F6232',7,0,0,0,1,''),
	(5060,'1','form','F650',4,0,0,0,1,''),
	(4950,'1','fortune','F635',7,0,0,0,1,''),
	(1716,'1','forward','F630',7,0,0,0,10,''),
	(38,'1','found','F530',5,0,0,0,37,''),
	(877,'1','foundation','F535',10,0,0,0,5,''),
	(4964,'1','founded','F530',7,0,0,0,1,''),
	(1649,'1','frameworks','F6562',10,0,0,0,10,''),
	(2,'1','fravel','F614',6,0,0,0,24,''),
	(6567,'1','free','F600',4,0,0,0,23,''),
	(6393,'1','freshbooks','F6212',10,0,0,0,14,''),
	(6511,'1','friendliest','F653423',11,0,0,0,14,''),
	(6294,'1','friendly','F6534',8,0,0,0,14,''),
	(976,'1','friends','F6532',7,0,0,0,19,''),
	(897,'1','from','F650',4,0,0,0,33,''),
	(980,'1','front','F653',5,0,0,0,15,''),
	(6113,'1','frustration','F623635',11,0,0,0,14,''),
	(1695,'1','full','F400',4,0,0,0,11,''),
	(10638,'1','fuze','F200',4,0,0,0,9,''),
	(10627,'1','fuzebox','F212',7,0,0,0,9,''),
	(10618,'1','fuzemeeting','F25352',11,0,0,0,9,''),
	(6384,'1','general','G564',7,0,0,0,14,''),
	(894,'1','get','G300',3,0,0,0,19,''),
	(788,'1','getting','G352',7,0,0,0,19,''),
	(16980,'1','gig','G000',3,0,0,0,1,''),
	(1634,'1','git','G300',3,0,0,0,16,''),
	(4946,'1','global','G414',6,0,0,0,1,''),
	(926,'1','go','G000',2,0,0,0,10,''),
	(922,'1','goals','G420',5,0,0,0,15,''),
	(6085,'1','goes','G000',4,0,0,0,14,''),
	(4526,'1','going','G520',5,0,0,0,25,''),
	(17093,'1','good','G300',4,0,0,0,1,''),
	(6150,'1','google','G400',6,0,0,0,23,''),
	(6037,'1','got','G300',3,0,0,0,17,''),
	(10633,'1','goto','G300',4,0,0,0,9,''),
	(10621,'1','gotomeeting','G35352',11,0,0,0,9,''),
	(6259,'1','graceful','G6214',8,0,0,0,14,''),
	(13578,'1','grandpa','G6531',7,0,0,0,2,''),
	(6332,'1','granular','G6546',8,0,0,0,14,''),
	(6087,'1','grateful','G6314',8,0,0,0,14,''),
	(878,'1','great','G630',5,0,0,0,38,''),
	(6188,'1','greatest','G6323',8,0,0,0,14,''),
	(1616,'1','grids','G632',5,0,0,0,10,''),
	(1673,'1','ground','G653',6,0,0,0,10,''),
	(10564,'1','group','G610',5,0,0,0,9,''),
	(852,'1','growing','G652',7,0,0,0,15,''),
	(836,'1','grown','G650',5,0,0,0,19,''),
	(814,'1','gt','G300',2,0,0,0,8,''),
	(6245,'1','guessed','G300',7,0,0,0,14,''),
	(927,'1','guide','G300',5,0,0,0,17,''),
	(818,'1','guy','G000',3,0,0,0,5,''),
	(1518,'1','h3','H000',2,0,0,0,35,''),
	(783,'1','had','H300',3,0,0,0,28,''),
	(10422,'1','hairlines','H6452',9,0,0,0,9,''),
	(794,'1','hand','H530',4,0,0,0,5,''),
	(6429,'1','handful','H5314',7,0,0,0,14,''),
	(17108,'1','handles','H5342',7,0,0,0,1,''),
	(6102,'1','hands','H532',5,0,0,0,14,''),
	(6274,'1','handy','H530',5,0,0,0,14,''),
	(39,'1','hanging','H5252',7,0,0,0,14,''),
	(10481,'1','hangouts','H5232',8,0,0,0,9,''),
	(6134,'1','happened','H153',8,0,0,0,14,''),
	(4561,'1','happening','H152',9,0,0,0,2,''),
	(17054,'1','happier','H160',7,0,0,0,1,''),
	(4982,'1','happiest','H123',8,0,0,0,1,''),
	(6320,'1','hard','H630',4,0,0,0,14,''),
	(6078,'1','hardest','H6323',7,0,0,0,14,''),
	(4878,'1','has','H200',3,0,0,0,13,''),
	(1639,'1','hatred','H363',6,0,0,0,10,''),
	(839,'1','have','H100',4,0,0,0,38,''),
	(6243,'1','haven','H150',5,0,0,0,18,''),
	(25,'1','he','H000',2,0,0,0,33,''),
	(973,'1','head','H300',4,0,0,0,5,''),
	(13236,'1','headshot','H323',8,0,0,0,3,''),
	(16868,'1','healthcare','H4326',10,0,0,0,4,''),
	(3256,'1','hear','H600',4,0,0,0,7,''),
	(6530,'1','heard','H630',5,0,0,0,14,''),
	(6177,'1','heavy','H100',5,0,0,0,14,''),
	(6653,'1','hellip','H410',6,0,0,0,13,''),
	(949,'1','help','H410',4,0,0,0,15,''),
	(6550,'1','helped','H413',6,0,0,0,14,''),
	(16745,'1','helping','H4152',7,0,0,0,2,''),
	(4903,'1','her','H600',3,0,0,0,3,''),
	(819,'1','here','H600',4,0,0,0,34,''),
	(815,'1','hi','H000',2,0,0,0,5,''),
	(4523,'1','hidden','H350',6,0,0,0,2,''),
	(17063,'1','hiking','H252',6,0,0,0,1,''),
	(898,'1','him','H500',3,0,0,0,5,''),
	(789,'1','himself','H5241',7,0,0,0,5,''),
	(10548,'1','hipchat','H123',7,0,0,0,9,''),
	(4756,'1','hire','H600',4,0,0,0,4,''),
	(1474,'1','hiring','H652',6,0,0,0,10,''),
	(12,'1','his','H200',3,0,0,0,48,''),
	(10590,'1','history','H236',7,0,0,0,9,''),
	(6152,'1','hl','H400',2,0,0,0,14,''),
	(4809,'1','hobbies','H120',7,0,0,0,4,''),
	(9,'1','home','H500',4,0,0,0,34,''),
	(4519,'1','hook','H200',4,0,0,0,2,''),
	(3249,'1','hooks','H200',5,0,0,0,6,''),
	(6563,'1','hope','H100',4,0,0,0,23,''),
	(6431,'1','horizon','H625',7,0,0,0,14,''),
	(983,'1','hours','H620',5,0,0,0,5,''),
	(10551,'1','house','H200',5,0,0,0,9,''),
	(828,'1','how','H000',3,0,0,0,30,''),
	(1515,'1','href','H610',4,0,0,0,30,''),
	(1589,'1','html','H354',4,0,0,0,10,''),
	(1597,'1','html5','H354',5,0,0,0,10,''),
	(6063,'1','http','H310',4,0,0,0,17,''),
	(6149,'1','https','H312',5,0,0,0,17,''),
	(6318,'1','huge','H200',4,0,0,0,14,''),
	(6339,'1','hundreds','H53632',8,0,0,0,14,''),
	(56,'1','hyannis','H520',7,0,0,0,14,''),
	(754,'1','i','I000',1,0,0,0,45,''),
	(6470,'1','ical','I240',4,0,0,0,14,''),
	(9235,'1','id','I300',2,0,0,0,2,''),
	(785,'1','idea','I300',4,0,0,0,6,''),
	(953,'1','identities','I3532',10,0,0,0,5,''),
	(1497,'1','if','I100',2,0,0,0,39,''),
	(896,'1','im','I500',2,0,0,0,5,''),
	(6169,'1','images','I520',6,0,0,0,17,''),
	(10510,'1','imagine','I525',7,0,0,0,9,''),
	(13228,'1','img','I520',3,0,0,0,7,''),
	(1618,'1','implement','I51453',9,0,0,0,10,''),
	(1551,'1','implementations','I5145352',15,0,0,0,10,''),
	(1539,'1','implemented','I51453',11,0,0,0,10,''),
	(6456,'1','import','I5163',6,0,0,0,23,''),
	(6510,'1','importantly','I5163534',11,0,0,0,14,''),
	(7,'1','in','I500',2,0,0,0,69,''),
	(6478,'1','include','I5243',7,0,0,0,14,''),
	(6562,'1','including','I524352',9,0,0,0,24,''),
	(6066,'1','index','I532',5,0,0,0,14,''),
	(1562,'1','individual','I53134',10,0,0,0,24,''),
	(1637,'1','individually','I53134',12,0,0,0,10,''),
	(6344,'1','information','I516535',11,0,0,0,14,''),
	(10470,'1','informed','I51653',8,0,0,0,9,''),
	(4515,'1','init','I530',4,0,0,0,2,''),
	(4507,'1','initialize','I5342',10,0,0,0,2,''),
	(4521,'1','initializing','I534252',12,0,0,0,2,''),
	(4801,'1','initiatives','I5312',11,0,0,0,4,''),
	(16836,'1','inn','I500',3,0,0,0,6,''),
	(6252,'1','innovation','I5135',10,0,0,0,14,''),
	(6556,'1','ins','I520',3,0,0,0,14,''),
	(17076,'1','insistence','I52352',10,0,0,0,1,''),
	(4492,'1','installed','I52343',9,0,0,0,2,''),
	(6229,'1','instantly','I523534',9,0,0,0,14,''),
	(1687,'1','integration','I532635',11,0,0,0,33,''),
	(6430,'1','integrations','I5326352',12,0,0,0,14,''),
	(1694,'1','interaction','I536235',11,0,0,0,10,''),
	(6,'1','interactive','I536231',11,0,0,0,37,''),
	(6538,'1','interest','I53623',8,0,0,0,14,''),
	(1500,'1','interested','I53623',10,0,0,0,12,''),
	(6105,'1','interface','I53612',9,0,0,0,14,''),
	(1711,'1','internal','I53654',8,0,0,0,33,''),
	(4960,'1','internet','I53653',8,0,0,0,2,''),
	(6198,'1','interns','I53652',7,0,0,0,14,''),
	(13311,'1','intl','I534',4,0,0,0,3,''),
	(790,'1','into','I530',4,0,0,0,38,''),
	(10371,'1','intro','I536',5,0,0,0,5,''),
	(10558,'1','invest','I5123',6,0,0,0,9,''),
	(6488,'1','invoice','I512',7,0,0,0,14,''),
	(6218,'1','ireland','I6453',7,0,0,0,14,''),
	(62,'1','is','I200',2,0,0,0,61,''),
	(6427,'1','island','I2453',6,0,0,0,14,''),
	(4974,'1','isn','I250',3,0,0,0,5,''),
	(10651,'1','issues','I200',6,0,0,0,9,''),
	(1677,'1','it','I300',2,0,0,0,39,''),
	(6356,'1','item','I350',4,0,0,0,14,''),
	(4560,'1','its','I320',3,0,0,0,11,''),
	(17105,'1','january','J560',7,0,0,0,1,''),
	(1601,'1','javascript','J12613',10,0,0,0,10,''),
	(5734,'1','jeep','J100',4,0,0,0,1,''),
	(14576,'1','job','J100',3,0,0,0,5,''),
	(16986,'1','jobs','J120',4,0,0,0,1,''),
	(1487,'1','join','J500',4,0,0,0,10,''),
	(17022,'1','joined','J530',6,0,0,0,3,''),
	(10635,'1','joinme','J500',6,0,0,0,9,''),
	(1661,'1','joins','J520',5,0,0,0,10,''),
	(10418,'1','jokes','J000',5,0,0,0,9,''),
	(114,'1','journal','J654',7,0,0,0,3,''),
	(1603,'1','jquery','J600',6,0,0,0,10,''),
	(4813,'1','juice','J000',5,0,0,0,4,''),
	(4505,'1','jump','J510',4,0,0,0,2,''),
	(6392,'1','jumping','J5152',7,0,0,0,14,''),
	(4886,'1','just','J300',4,0,0,0,1,''),
	(10425,'1','justin','J350',6,0,0,0,9,''),
	(17064,'1','kayaking','K520',8,0,0,0,1,''),
	(74,'1','keen','K500',4,0,0,0,8,''),
	(977,'1','keep','K100',4,0,0,0,16,''),
	(10609,'1','keepers','K162',7,0,0,0,9,''),
	(16966,'1','kernel','K654',6,0,0,0,1,''),
	(16956,'1','kid','K300',3,0,0,0,1,''),
	(6549,'1','kidd','K300',4,0,0,0,14,''),
	(42,'1','kids','K320',4,0,0,0,14,''),
	(6189,'1','killer','K460',6,0,0,0,14,''),
	(867,'1','knew','K500',4,0,0,0,19,''),
	(917,'1','know','K500',4,0,0,0,11,''),
	(1657,'1','knowledge','K5432',9,0,0,0,10,''),
	(17090,'1','known','K500',5,0,0,0,1,''),
	(177,'1','lacinia','L250',7,0,0,0,6,''),
	(6110,'1','lack','L200',4,0,0,0,14,''),
	(182,'1','lacus','L200',5,0,0,0,6,''),
	(1643,'1','lamp','L510',4,0,0,0,10,''),
	(4742,'1','lanes','L520',5,0,0,0,13,''),
	(4780,'1','languages','L520',9,0,0,0,4,''),
	(185,'1','laoreet','L630',7,0,0,0,6,''),
	(1653,'1','laravel','L614',7,0,0,0,10,''),
	(21,'1','large','L620',5,0,0,0,14,''),
	(6279,'1','last','L230',4,0,0,0,23,''),
	(16998,'1','late','L300',4,0,0,0,1,''),
	(54,'1','latest','L323',6,0,0,0,28,''),
	(6552,'1','launch','L520',6,0,0,0,14,''),
	(6334,'1','launched','L523',8,0,0,0,14,''),
	(6282,'1','launching','L5252',9,0,0,0,14,''),
	(6958,'1','ldquo','L320',5,0,0,0,22,''),
	(932,'1','lead','L300',4,0,0,0,19,''),
	(6240,'1','leap','L100',4,0,0,0,14,''),
	(776,'1','least','L230',5,0,0,0,15,''),
	(4954,'1','led','L300',3,0,0,0,1,''),
	(6474,'1','left','L130',4,0,0,0,14,''),
	(4939,'1','lendingtree','L535236',11,0,0,0,1,''),
	(173,'1','leo','L000',3,0,0,0,6,''),
	(6536,'1','less','L200',4,0,0,0,15,''),
	(1640,'1','letters','L362',7,0,0,0,10,''),
	(1588,'1','level','L140',5,0,0,0,10,''),
	(1585,'1','li','L000',2,0,0,0,33,''),
	(4553,'1','library','L160',7,0,0,0,2,''),
	(17116,'1','lights','L232',6,0,0,0,1,''),
	(6309,'1','like','L200',4,0,0,0,23,''),
	(4494,'1','lincensed','L52523',9,0,0,0,2,''),
	(944,'1','line','L500',4,0,0,0,5,''),
	(6449,'1','link','L520',4,0,0,0,14,''),
	(6184,'1','links','L520',5,0,0,0,23,''),
	(6409,'1','list','L230',4,0,0,0,23,''),
	(913,'1','listen','L235',6,0,0,0,19,''),
	(907,'1','listener','L2356',8,0,0,0,5,''),
	(6348,'1','lists','L232',5,0,0,0,14,''),
	(6435,'1','lives','L120',5,0,0,0,14,''),
	(861,'1','living','L152',6,0,0,0,5,''),
	(6564,'1','ll','L000',2,0,0,0,23,''),
	(4497,'1','local','L240',5,0,0,0,2,''),
	(4485,'1','locally','L240',7,0,0,0,2,''),
	(6330,'1','located','L230',7,0,0,0,14,''),
	(6394,'1','log','L200',3,0,0,0,14,''),
	(6504,'1','logged','L230',6,0,0,0,14,''),
	(6018,'1','logo','L200',4,0,0,0,2,''),
	(887,'1','logos','L200',5,0,0,0,5,''),
	(829,'1','long','L520',4,0,0,0,14,''),
	(843,'1','longer','L526',6,0,0,0,20,''),
	(6203,'1','looked','L230',6,0,0,0,14,''),
	(6141,'1','lost','L230',4,0,0,0,14,''),
	(1570,'1','love','L100',4,0,0,0,34,''),
	(6103,'1','loved','L130',5,0,0,0,14,''),
	(6161,'1','lr','L600',2,0,0,0,14,''),
	(9773,'1','lt','L300',2,0,0,0,1,''),
	(756,'1','m','M000',1,0,0,0,28,''),
	(4980,'1','mac','M200',3,0,0,0,1,''),
	(4498,'1','machine','M250',7,0,0,0,2,''),
	(6081,'1','made','M300',4,0,0,0,23,''),
	(168,'1','magna','M250',5,0,0,0,6,''),
	(10486,'1','mail','M400',4,0,0,0,9,''),
	(1630,'1','maintain','M350',8,0,0,0,10,''),
	(1626,'1','maintaining','M352',11,0,0,0,10,''),
	(1700,'1','majority','M263',8,0,0,0,10,''),
	(4531,'1','make','M200',4,0,0,0,26,''),
	(6388,'1','makes','M200',5,0,0,0,23,''),
	(167,'1','malesuada','M423',9,0,0,0,6,''),
	(291,'1','malomo','M450',6,0,0,0,7,''),
	(4486,'1','mamp','M100',4,0,0,0,2,''),
	(1699,'1','manage','M200',6,0,0,0,20,''),
	(1547,'1','management','M253',10,0,0,0,36,''),
	(525,'1','manager','M260',7,0,0,0,25,''),
	(1698,'1','managers','M262',8,0,0,0,10,''),
	(16991,'1','managing','M252',8,0,0,0,1,''),
	(6460,'1','manually','M400',8,0,0,0,14,''),
	(883,'1','many','M000',4,0,0,0,23,''),
	(964,'1','marathons','M6352',9,0,0,0,5,''),
	(855,'1','marketing','M62352',9,0,0,0,21,''),
	(1495,'1','massachusetts','M232',13,0,0,0,10,''),
	(10513,'1','matches','M320',7,0,0,0,9,''),
	(10578,'1','maybe','M100',5,0,0,0,9,''),
	(16841,'1','mba','M100',3,0,0,0,7,''),
	(763,'1','me','M000',2,0,0,0,5,''),
	(29,'1','meeting','M352',7,0,0,0,42,''),
	(1718,'1','meetings','M352',8,0,0,0,19,''),
	(6531,'1','member','M160',6,0,0,0,14,''),
	(10429,'1','memberships','M16212',11,0,0,0,9,''),
	(6291,'1','mentioned','M353',9,0,0,0,14,''),
	(905,'1','mentor','M360',6,0,0,0,5,''),
	(4970,'1','merged','M623',6,0,0,0,1,''),
	(293,'1','merrill','M640',7,0,0,0,6,''),
	(6297,'1','message','M200',7,0,0,0,14,''),
	(6136,'1','messages','M200',8,0,0,0,14,''),
	(11370,'1','messed','M230',6,0,0,0,1,''),
	(10466,'1','methods','M320',7,0,0,0,9,''),
	(965,'1','mile','M400',4,0,0,0,6,''),
	(10554,'1','miles','M420',5,0,0,0,9,''),
	(6466,'1','milestones','M42352',10,0,0,0,14,''),
	(1567,'1','mind','M300',4,0,0,0,10,''),
	(6280,'1','minute','M300',6,0,0,0,14,''),
	(6132,'1','missing','M252',7,0,0,0,14,''),
	(16839,'1','mit','M300',3,0,0,0,7,''),
	(10474,'1','mix','M200',3,0,0,0,9,''),
	(10593,'1','mobile','M140',6,0,0,0,9,''),
	(1543,'1','modern','M365',6,0,0,0,10,''),
	(169,'1','mollis','M420',6,0,0,0,6,''),
	(10559,'1','money','M000',5,0,0,0,9,''),
	(781,'1','month','M300',5,0,0,0,28,''),
	(6231,'1','months','M320',6,0,0,0,23,''),
	(765,'1','more','M600',4,0,0,0,29,''),
	(972,'1','morning','M652',7,0,0,0,5,''),
	(16952,'1','mosaic','M200',6,0,0,0,1,''),
	(6509,'1','most','M230',4,0,0,0,23,''),
	(1482,'1','motivated','M313',9,0,0,0,10,''),
	(1714,'1','move','M100',4,0,0,0,24,''),
	(4777,'1','moved','M130',5,0,0,0,14,''),
	(17021,'1','moving','M152',6,0,0,0,1,''),
	(16715,'1','much','M200',4,0,0,0,5,''),
	(64,'1','multi','M430',5,0,0,0,8,''),
	(1623,'1','multiple','M4314',8,0,0,0,11,''),
	(821,'1','my','M000',2,0,0,0,20,''),
	(1655,'1','mysql','M240',5,0,0,0,10,''),
	(4554,'1','mysqldump','M24351',9,0,0,0,2,''),
	(873,'1','name','N000',4,0,0,0,6,''),
	(4501,'1','named','N300',5,0,0,0,2,''),
	(803,'1','nbsp','N121',4,0,0,0,16,''),
	(10534,'1','nearly','N640',6,0,0,0,9,''),
	(6257,'1','necessarily','N264',11,0,0,0,14,''),
	(931,'1','necessary','N260',9,0,0,0,5,''),
	(46,'1','neck','N200',4,0,0,0,14,''),
	(10454,'1','need','N300',4,0,0,0,13,''),
	(6007,'1','needs','N320',5,0,0,0,1,''),
	(6065,'1','net','N300',3,0,0,0,17,''),
	(6529,'1','never','N160',5,0,0,0,15,''),
	(841,'1','new','N000',3,0,0,0,34,''),
	(4541,'1','newly','N400',5,0,0,0,2,''),
	(6265,'1','newsletter','N2436',10,0,0,0,14,''),
	(1722,'1','next','N230',4,0,0,0,10,''),
	(817,'1','nice','N200',4,0,0,0,19,''),
	(784,'1','no','N000',2,0,0,0,38,''),
	(6215,'1','noise','N200',5,0,0,0,14,''),
	(6349,'1','none','N000',4,0,0,0,14,''),
	(16951,'1','norm','N650',4,0,0,0,1,''),
	(1660,'1','normalization','N654235',13,0,0,0,10,''),
	(28,'1','not','N300',3,0,0,0,44,''),
	(4568,'1','note','N300',4,0,0,0,16,''),
	(6137,'1','notebooks','N312',9,0,0,0,14,''),
	(6446,'1','notes','N320',5,0,0,0,14,''),
	(6295,'1','notice','N320',6,0,0,0,14,''),
	(6286,'1','noticed','N323',7,0,0,0,14,''),
	(6116,'1','notification','N31235',12,0,0,0,14,''),
	(833,'1','now','N000',3,0,0,0,20,''),
	(6551,'1','nudge','N320',5,0,0,0,14,''),
	(6499,'1','number','N160',6,0,0,0,23,''),
	(951,'1','nurture','N636',7,0,0,0,5,''),
	(1646,'1','object','O123',6,0,0,0,10,''),
	(60,'1','obrien','O165',6,0,0,0,16,''),
	(4806,'1','obsessing','O1252',9,0,0,0,4,''),
	(6457,'1','obviously','O124',9,0,0,0,14,''),
	(6554,'1','occasional','O254',10,0,0,0,14,''),
	(1702,'1','occasionally','O254',12,0,0,0,10,''),
	(18,'1','of','O100',2,0,0,0,72,''),
	(879,'1','offered','O163',7,0,0,0,5,''),
	(10,'1','office','O120',6,0,0,0,45,''),
	(1529,'1','offices','O120',7,0,0,0,10,''),
	(6239,'1','official','O124',8,0,0,0,14,''),
	(1523,'1','old','O430',3,0,0,0,11,''),
	(44,'1','on','O500',2,0,0,0,63,''),
	(4491,'1','once','O520',4,0,0,0,25,''),
	(807,'1','one','O500',3,0,0,0,29,''),
	(885,'1','ones','O520',4,0,0,0,14,''),
	(952,'1','online','O545',6,0,0,0,8,''),
	(4570,'1','only','O540',4,0,0,0,25,''),
	(4799,'1','open','O150',4,0,0,0,13,''),
	(4900,'1','operations','O16352',10,0,0,0,1,''),
	(1663,'1','optimization','O135235',12,0,0,0,10,''),
	(10576,'1','option','O135',6,0,0,0,9,''),
	(6477,'1','options','O1352',7,0,0,0,23,''),
	(32,'1','or','O600',2,0,0,0,62,''),
	(4952,'1','organizations','O6252352',13,0,0,0,1,''),
	(1647,'1','oriented','O653',8,0,0,0,10,''),
	(176,'1','ornare','O656',6,0,0,0,6,''),
	(1492,'1','osterville','O23614',10,0,0,0,10,''),
	(981,'1','other','O360',5,0,0,0,38,''),
	(838,'1','our','O600',3,0,0,0,43,''),
	(40,'1','out','O300',3,0,0,0,43,''),
	(17060,'1','outdoors','O362',8,0,0,0,1,''),
	(779,'1','over','O160',4,0,0,0,45,''),
	(10502,'1','overlap','O1641',7,0,0,0,9,''),
	(6317,'1','overwhelmed','O16453',11,0,0,0,14,''),
	(6331,'1','overwhelming','O16452',12,0,0,0,14,''),
	(4965,'1','own','O500',3,0,0,0,15,''),
	(17047,'1','owner','O560',5,0,0,0,1,''),
	(3,'1','p','P000',1,0,0,0,112,''),
	(104,'1','page','P200',4,0,0,0,27,''),
	(1516,'1','page_15','P200',7,0,0,0,8,''),
	(11660,'1','page_21','P200',7,0,0,0,6,''),
	(14575,'1','part','P630',4,0,0,0,4,''),
	(4795,'1','participating','P6321352',13,0,0,0,4,''),
	(1602,'1','particular','P63246',10,0,0,0,10,''),
	(902,'1','partner','P6356',7,0,0,0,9,''),
	(6418,'1','party','P630',5,0,0,0,14,''),
	(90,'1','passion','P250',7,0,0,0,8,''),
	(295,'1','passos','P200',6,0,0,0,9,''),
	(6290,'1','password','P263',8,0,0,0,14,''),
	(780,'1','past','P230',4,0,0,0,18,''),
	(6522,'1','paying','P520',6,0,0,0,14,''),
	(6480,'1','pdf','P310',3,0,0,0,14,''),
	(175,'1','pellentesque','P4532',12,0,0,0,6,''),
	(851,'1','people','P400',6,0,0,0,19,''),
	(6355,'1','per','P600',3,0,0,0,23,''),
	(6342,'1','perceptions','P621352',11,0,0,0,14,''),
	(6459,'1','perfect','P6123',7,0,0,0,23,''),
	(6360,'1','person','P625',6,0,0,0,14,''),
	(6524,'1','personalities','P625432',13,0,0,0,14,''),
	(10652,'1','phantom','P535',7,0,0,0,9,''),
	(1607,'1','photoshop','P321',9,0,0,0,10,''),
	(1648,'1','php','P000',3,0,0,0,10,''),
	(10607,'1','pictures','P2362',8,0,0,0,9,''),
	(10324,'1','plan','P450',4,0,0,0,7,''),
	(10612,'1','plans','P452',5,0,0,0,9,''),
	(6262,'1','platform','P43165',8,0,0,0,14,''),
	(1504,'1','please','P420',6,0,0,0,11,''),
	(6319,'1','plus','P420',4,0,0,0,14,''),
	(6234,'1','pm','P500',2,0,0,0,14,''),
	(13237,'1','png','P520',3,0,0,0,7,''),
	(6199,'1','pointing','P5352',8,0,0,0,14,''),
	(6558,'1','points','P532',6,0,0,0,23,''),
	(6128,'1','pool','P400',4,0,0,0,14,''),
	(782,'1','poor','P600',4,0,0,0,5,''),
	(13230,'1','poppin','P500',6,0,0,0,3,''),
	(165,'1','porta','P630',5,0,0,0,6,''),
	(1503,'1','position','P235',8,0,0,0,10,''),
	(888,'1','possible','P214',8,0,0,0,5,''),
	(10520,'1','post','P230',4,0,0,0,9,''),
	(6181,'1','posts','P232',5,0,0,0,23,''),
	(6277,'1','powering','P652',8,0,0,0,14,''),
	(1613,'1','practices','P6232',9,0,0,0,10,''),
	(3291,'1','pre','P600',3,0,0,0,6,''),
	(10377,'1','prefer','P616',6,0,0,0,4,''),
	(16993,'1','preserve','P6261',8,0,0,0,1,''),
	(58,'1','president','P62353',9,0,0,0,14,''),
	(4918,'1','pressure','P626',8,0,0,0,1,''),
	(17092,'1','pretty','P630',6,0,0,0,1,''),
	(10515,'1','price','P620',5,0,0,0,9,''),
	(6281,'1','prior','P600',5,0,0,0,14,''),
	(1719,'1','priorities','P632',10,0,0,0,10,''),
	(6333,'1','privacy','P612',7,0,0,0,14,''),
	(6135,'1','private','P613',7,0,0,0,14,''),
	(900,'1','problem','P6145',7,0,0,0,6,''),
	(1666,'1','procedures','P62362',10,0,0,0,10,''),
	(1710,'1','process','P620',7,0,0,0,10,''),
	(6138,'1','product','P6323',7,0,0,0,23,''),
	(6560,'1','products','P63232',8,0,0,0,23,''),
	(10604,'1','professional','P61254',12,0,0,0,9,''),
	(16842,'1','program','P6265',7,0,0,0,7,''),
	(4766,'1','programming','P62652',11,0,0,0,4,''),
	(524,'1','project','P623',7,0,0,0,53,''),
	(86,'1','projects','P6232',8,0,0,0,52,''),
	(911,'1','prospect','P62123',8,0,0,0,5,''),
	(876,'1','provide','P613',7,0,0,0,5,''),
	(808,'1','providing','P61352',9,0,0,0,5,''),
	(6301,'1','ps','P200',2,0,0,0,14,''),
	(988,'1','pull','P400',4,0,0,0,5,''),
	(770,'1','punch','P520',5,0,0,0,5,''),
	(82,'1','purpose','P612',7,0,0,0,8,''),
	(6561,'1','purposefully','P61214',12,0,0,0,23,''),
	(987,'1','push','P200',4,0,0,0,5,''),
	(6542,'1','pushing','P252',7,0,0,0,14,''),
	(945,'1','put','P300',3,0,0,0,5,''),
	(978,'1','putting','P352',7,0,0,0,5,''),
	(10642,'1','quality','Q430',7,0,0,0,9,''),
	(174,'1','quam','Q500',4,0,0,0,6,''),
	(1662,'1','query','Q600',5,0,0,0,10,''),
	(3258,'1','question','Q350',8,0,0,0,20,''),
	(916,'1','questions','Q352',9,0,0,0,5,''),
	(6147,'1','quick','Q000',5,0,0,0,14,''),
	(17134,'1','quickbooks','Q120',10,0,0,0,1,''),
	(4915,'1','quickly','Q400',7,0,0,0,1,''),
	(774,'1','quit','Q300',4,0,0,0,5,''),
	(792,'1','raised','R230',6,0,0,0,5,''),
	(822,'1','rate','R300',4,0,0,0,5,''),
	(6420,'1','rather','R360',6,0,0,0,15,''),
	(6962,'1','rdquo','R320',5,0,0,0,22,''),
	(940,'1','re','R000',2,0,0,0,43,''),
	(4914,'1','react','R230',5,0,0,0,1,''),
	(804,'1','read_more','R356',9,0,0,0,35,''),
	(6269,'1','real','R400',4,0,0,0,14,''),
	(10436,'1','reality','R430',7,0,0,0,9,''),
	(1553,'1','realize','R420',7,0,0,0,10,''),
	(17036,'1','realizing','R4252',9,0,0,0,1,''),
	(6285,'1','really','R400',6,0,0,0,13,''),
	(6095,'1','reason','R250',6,0,0,0,15,''),
	(881,'1','reasonable','R2514',10,0,0,0,5,''),
	(10421,'1','receding','R2352',8,0,0,0,9,''),
	(6264,'1','receive','R210',7,0,0,0,14,''),
	(6115,'1','received','R213',8,0,0,0,14,''),
	(6424,'1','recognize','R252',9,0,0,0,14,''),
	(4569,'1','recommend','R253',9,0,0,0,2,''),
	(287,'1','reddington','R35235',10,0,0,0,6,''),
	(6498,'1','reduce','R320',6,0,0,0,14,''),
	(6183,'1','referral','R164',8,0,0,0,23,''),
	(6442,'1','regular','R246',7,0,0,0,14,''),
	(6507,'1','regularly','R2464',9,0,0,0,14,''),
	(4909,'1','relations','R4352',9,0,0,0,1,''),
	(10535,'1','relationship','R43521',12,0,0,0,9,''),
	(937,'1','relationships','R435212',13,0,0,0,5,''),
	(17136,'1','relaxing','R4252',8,0,0,0,1,''),
	(17071,'1','reluctantly','R423534',11,0,0,0,1,''),
	(14466,'1','reminder','R536',8,0,0,0,4,''),
	(11374,'1','removed','R513',7,0,0,0,1,''),
	(4490,'1','repo','R100',4,0,0,0,2,''),
	(4508,'1','repository','R1236',10,0,0,0,2,''),
	(6289,'1','reset','R230',5,0,0,0,14,''),
	(17113,'1','responsibilities','R21521432',16,0,0,0,1,''),
	(1545,'1','responsive','R21521',10,0,0,0,12,''),
	(1692,'1','rest','R230',4,0,0,0,11,''),
	(108,'1','results','R2432',7,0,0,0,7,''),
	(6395,'1','reviewing','R152',9,0,0,0,14,''),
	(6258,'1','revolutionary','R14356',13,0,0,0,14,''),
	(1566,'1','ridiculous','R3242',10,0,0,0,10,''),
	(6122,'1','right','R230',5,0,0,0,23,''),
	(4986,'1','rivers','R162',6,0,0,0,1,''),
	(10444,'1','road','R300',4,0,0,0,9,''),
	(6139,'1','roadmap','R351',7,0,0,0,14,''),
	(294,'1','rodrigo','R362',7,0,0,0,9,''),
	(4503,'1','root','R300',4,0,0,0,2,''),
	(1568,'1','rsquo','R200',5,0,0,0,25,''),
	(966,'1','run','R500',3,0,0,0,7,''),
	(48,'1','running','R520',7,0,0,0,29,''),
	(186,'1','rutrum','R365',6,0,0,0,6,''),
	(27,'1','s','S000',1,0,0,0,54,''),
	(6168,'1','safe','S100',4,0,0,0,14,''),
	(181,'1','sagittis','S320',8,0,0,0,6,''),
	(6196,'1','salespeople','S4214',11,0,0,0,14,''),
	(6548,'1','sam','S500',3,0,0,0,14,''),
	(6191,'1','same','S500',4,0,0,0,14,''),
	(6547,'1','samkidd','S523',7,0,0,0,14,''),
	(6346,'1','samples','S5142',7,0,0,0,14,''),
	(45,'1','sandy','S530',5,0,0,0,14,''),
	(6374,'1','save','S100',4,0,0,0,14,''),
	(9787,'1','saved','S130',5,0,0,0,1,''),
	(6495,'1','saving','S152',6,0,0,0,14,''),
	(10603,'1','say','S000',3,0,0,0,9,''),
	(6468,'1','schedule','S340',8,0,0,0,14,''),
	(4551,'1','schemapath','S513',10,0,0,0,2,''),
	(10637,'1','screen','S650',6,0,0,0,9,''),
	(4538,'1','script','S613',6,0,0,0,2,''),
	(6148,'1','search','S620',6,0,0,0,14,''),
	(6244,'1','second','S530',6,0,0,0,18,''),
	(6366,'1','see','S000',3,0,0,0,14,''),
	(1481,'1','seeking','S520',7,0,0,0,10,''),
	(6541,'1','seem','S500',4,0,0,0,14,''),
	(10658,'1','seen','S500',4,0,0,0,9,''),
	(1483,'1','self','S410',4,0,0,0,10,''),
	(5733,'1','sells','S420',5,0,0,0,1,''),
	(166,'1','sem','S500',3,0,0,0,6,''),
	(6489,'1','send','S530',4,0,0,0,14,''),
	(576,'1','senior','S560',6,0,0,0,11,''),
	(80,'1','sense','S520',5,0,0,0,22,''),
	(6176,'1','seo','S000',3,0,0,0,14,''),
	(10379,'1','separate','S163',8,0,0,0,3,''),
	(6048,'1','series','S620',6,0,0,0,12,''),
	(6343,'1','server','S616',6,0,0,0,14,''),
	(1686,'1','service','S612',7,0,0,0,24,''),
	(812,'1','services','S612',8,0,0,0,5,''),
	(10492,'1','sessions','S520',8,0,0,0,9,''),
	(1720,'1','set','S300',3,0,0,0,24,''),
	(4783,'1','settled','S343',7,0,0,0,4,''),
	(3293,'1','setup','S310',5,0,0,0,6,''),
	(4959,'1','several','S164',7,0,0,0,2,''),
	(10567,'1','sharing','S652',7,0,0,0,9,''),
	(4889,'1','she','S000',3,0,0,0,3,''),
	(6525,'1','shine','S500',5,0,0,0,14,''),
	(10415,'1','shines','S520',6,0,0,0,9,''),
	(16992,'1','shorebird','S6163',9,0,0,0,1,''),
	(3271,'1','short','S630',5,0,0,0,6,''),
	(1658,'1','should','S430',6,0,0,0,10,''),
	(10653,'1','showing','S520',7,0,0,0,9,''),
	(6503,'1','shows','S000',5,0,0,0,14,''),
	(4811,'1','side','S300',4,0,0,0,7,''),
	(8174,'1','signup','S510',6,0,0,0,11,''),
	(813,'1','simple','S514',6,0,0,0,14,''),
	(6104,'1','simplicity','S51423',10,0,0,0,14,''),
	(4922,'1','simultaneously','S543524',14,0,0,0,1,''),
	(4762,'1','since','S520',5,0,0,0,29,''),
	(1561,'1','single','S524',6,0,0,0,10,''),
	(946,'1','site','S300',4,0,0,0,21,''),
	(6202,'1','sites','S320',5,0,0,0,14,''),
	(43,'1','sitting','S352',7,0,0,0,19,''),
	(1897,'1','size','S000',4,0,0,0,6,''),
	(1559,'1','skills','S420',6,0,0,0,10,''),
	(6230,'1','smitten','S535',7,0,0,0,14,''),
	(6400,'1','so','S000',2,0,0,0,14,''),
	(1691,'1','soap','S100',4,0,0,0,10,''),
	(22,'1','software','S136',8,0,0,0,23,''),
	(1614,'1','solid','S430',5,0,0,0,19,''),
	(10505,'1','solution','S435',8,0,0,0,9,''),
	(95,'1','solutions','S4352',9,0,0,0,12,''),
	(4911,'1','solving','S4152',7,0,0,0,1,''),
	(1681,'1','some','S500',4,0,0,0,40,''),
	(10443,'1','someone','S500',7,0,0,0,9,''),
	(6256,'1','something','S5352',9,0,0,0,17,''),
	(1531,'1','soon','S500',4,0,0,0,10,''),
	(4800,'1','source','S620',6,0,0,0,18,''),
	(1894,'1','span','S150',4,0,0,0,4,''),
	(4803,'1','spare','S160',5,0,0,0,5,''),
	(1705,'1','speak','S120',5,0,0,0,10,''),
	(6544,'1','speaking','S1252',8,0,0,0,14,''),
	(6545,'1','special','S124',7,0,0,0,14,''),
	(1542,'1','specialize','S1242',10,0,0,0,10,''),
	(6386,'1','specific','S1212',8,0,0,0,14,''),
	(970,'1','spend','S153',5,0,0,0,28,''),
	(17014,'1','spends','S1532',6,0,0,0,1,''),
	(6407,'1','spent','S153',5,0,0,0,14,''),
	(6482,'1','spreadsheet','S16323',11,0,0,0,14,''),
	(10489,'1','spreadsheets','S163232',12,0,0,0,9,''),
	(942,'1','sprint','S1653',6,0,0,0,5,''),
	(4557,'1','sql','S400',3,0,0,0,2,''),
	(13232,'1','src','S620',3,0,0,0,7,''),
	(6089,'1','stability','S3143',9,0,0,0,14,''),
	(4566,'1','stage','S320',5,0,0,0,2,''),
	(16996,'1','staircases','S362',10,0,0,0,1,''),
	(13,'1','stairs','S362',6,0,0,0,19,''),
	(6108,'1','stale','S340',5,0,0,0,14,''),
	(6207,'1','stand','S353',5,0,0,0,14,''),
	(6371,'1','standard','S35363',8,0,0,0,14,''),
	(1611,'1','standards','S353632',9,0,0,0,10,''),
	(6129,'1','stared','S363',6,0,0,0,14,''),
	(4977,'1','staring','S3652',7,0,0,0,1,''),
	(827,'1','start','S363',5,0,0,0,20,''),
	(4,'1','started','S363',7,0,0,0,19,''),
	(4961,'1','startups','S36312',8,0,0,0,1,''),
	(10580,'1','stay','S300',4,0,0,0,9,''),
	(4488,'1','step','S310',4,0,0,0,2,''),
	(760,'1','still','S340',5,0,0,0,9,''),
	(5062,'1','stop','S310',4,0,0,0,2,''),
	(1665,'1','stored','S363',6,0,0,0,10,''),
	(860,'1','stories','S362',7,0,0,0,5,''),
	(750,'1','story','S360',5,0,0,0,7,''),
	(87,'1','strategic','S3632',9,0,0,0,10,''),
	(16739,'1','strategy','S3632',8,0,0,0,2,''),
	(933,'1','strength','S36523',8,0,0,0,5,''),
	(4791,'1','strives','S3612',7,0,0,0,4,''),
	(79,'1','strong','S3652',6,0,0,0,34,''),
	(10527,'1','studio','S300',6,0,0,0,9,''),
	(1895,'1','style','S340',5,0,0,0,8,''),
	(1633,'1','stylesheets','S34232',11,0,0,0,10,''),
	(1650,'1','such','S000',4,0,0,0,10,''),
	(290,'1','sue','S000',3,0,0,0,7,''),
	(928,'1','suggest','S300',7,0,0,0,14,''),
	(872,'1','suggestion','S350',10,0,0,0,5,''),
	(6505,'1','summary','S560',7,0,0,0,14,''),
	(971,'1','sunday','S530',6,0,0,0,5,''),
	(6013,'1','support','S163',7,0,0,0,16,''),
	(10457,'1','sure','S600',4,0,0,0,9,''),
	(6096,'1','switch','S320',6,0,0,0,23,''),
	(6070,'1','switching','S3252',9,0,0,0,14,''),
	(6026,'1','system','S350',6,0,0,0,16,''),
	(1619,'1','systematically','S35324',14,0,0,0,10,''),
	(1548,'1','systems','S352',7,0,0,0,10,''),
	(769,'1','t','T000',1,0,0,0,40,''),
	(6485,'1','tab','T100',3,0,0,0,14,''),
	(13231,'1','tags','T200',4,0,0,0,3,''),
	(832,'1','take','T200',4,0,0,0,28,''),
	(984,'1','talk','T420',4,0,0,0,24,''),
	(761,'1','talking','T4252',7,0,0,0,5,''),
	(6068,'1','target','T623',6,0,0,0,17,''),
	(6347,'1','task','T200',4,0,0,0,14,''),
	(6271,'1','tasks','T200',5,0,0,0,14,''),
	(53,'1','tasting','T2352',7,0,0,0,14,''),
	(6170,'1','tbs','T120',3,0,0,0,14,''),
	(16988,'1','teaching','T252',8,0,0,0,1,''),
	(35,'1','team','T500',4,0,0,0,52,''),
	(4574,'1','teams','T520',5,0,0,0,3,''),
	(6075,'1','teamwork','T562',8,0,0,0,23,''),
	(6043,'1','teamworkpm','T56215',10,0,0,0,23,''),
	(51,'1','tears','T620',5,0,0,0,14,''),
	(6012,'1','technical','T2524',9,0,0,0,4,''),
	(6304,'1','technically','T2524',11,0,0,0,14,''),
	(1689,'1','technologies','T2542',12,0,0,0,14,''),
	(842,'1','tell','T400',4,0,0,0,7,''),
	(802,'1','telling','T452',7,0,0,0,5,''),
	(859,'1','tells','T420',5,0,0,0,5,''),
	(6367,'1','templates','T51432',9,0,0,0,14,''),
	(948,'1','term','T650',4,0,0,0,5,''),
	(4506,'1','terminal','T654',8,0,0,0,2,''),
	(16970,'1','terrible','T614',8,0,0,0,1,''),
	(1620,'1','testing','T2352',7,0,0,0,10,''),
	(11347,'1','text','T230',4,0,0,0,3,''),
	(1671,'1','than','T500',4,0,0,0,35,''),
	(6300,'1','thank','T520',5,0,0,0,14,''),
	(766,'1','that','T000',4,0,0,0,46,''),
	(34,'1','the','T000',3,0,0,0,102,''),
	(919,'1','their','T600',5,0,0,0,28,''),
	(912,'1','them','T500',4,0,0,0,38,''),
	(4539,'1','then','T500',4,0,0,0,6,''),
	(4528,'1','there','T600',5,0,0,0,29,''),
	(1577,'1','these','T200',5,0,0,0,33,''),
	(924,'1','they','T000',4,0,0,0,28,''),
	(1682,'1','things','T520',6,0,0,0,24,''),
	(6310,'1','think','T520',5,0,0,0,23,''),
	(906,'1','thinker','T526',7,0,0,0,5,''),
	(89,'1','thinking','T5252',8,0,0,0,8,''),
	(6417,'1','third','T630',5,0,0,0,14,''),
	(101,'1','this','T200',4,0,0,0,51,''),
	(956,'1','those','T200',5,0,0,0,28,''),
	(6324,'1','thought','T230',7,0,0,0,14,''),
	(6175,'1','thousands','T2532',9,0,0,0,14,''),
	(41,'1','three','T600',5,0,0,0,20,''),
	(49,'1','through','T620',7,0,0,0,53,''),
	(10493,'1','throw','T600',5,0,0,0,9,''),
	(292,'1','tim','T500',3,0,0,0,20,''),
	(1696,'1','time','T500',4,0,0,0,46,''),
	(6411,'1','timer','T560',5,0,0,0,14,''),
	(778,'1','times','T520',5,0,0,0,19,''),
	(6452,'1','timesaver','T5216',9,0,0,0,14,''),
	(13235,'1','tims','T520',4,0,0,0,3,''),
	(13577,'1','title','T400',5,0,0,0,6,''),
	(762,'1','to','T000',2,0,0,0,58,''),
	(10402,'1','together','T236',8,0,0,0,10,''),
	(4562,'1','told','T430',4,0,0,0,2,''),
	(6375,'1','ton','T500',3,0,0,0,14,''),
	(1683,'1','too','T000',3,0,0,0,10,''),
	(798,'1','took','T200',4,0,0,0,19,''),
	(10560,'1','tool','T400',4,0,0,0,9,''),
	(6051,'1','tools','T420',5,0,0,0,23,''),
	(6178,'1','top','T100',3,0,0,0,14,''),
	(6362,'1','total','T400',5,0,0,0,14,''),
	(4533,'1','touch','T200',5,0,0,0,2,''),
	(3251,'1','track','T620',5,0,0,0,20,''),
	(6486,'1','tracked','T623',7,0,0,0,14,''),
	(6379,'1','tracking','T6252',8,0,0,0,14,''),
	(50,'1','trail','T640',5,0,0,0,14,''),
	(963,'1','training','T652',8,0,0,0,19,''),
	(10608,'1','trapper','T616',7,0,0,0,9,''),
	(10464,'1','tried','T630',5,0,0,0,9,''),
	(1667,'1','triggers','T6262',8,0,0,0,10,''),
	(6484,'1','true','T600',4,0,0,0,14,''),
	(6185,'1','try','T600',3,0,0,0,23,''),
	(10629,'1','trying','T652',6,0,0,0,9,''),
	(4575,'1','turning','T652',7,0,0,0,2,''),
	(6216,'1','tweet','T000',5,0,0,0,14,''),
	(4925,'1','twin','T500',4,0,0,0,1,''),
	(6193,'1','twitter','T600',7,0,0,0,14,''),
	(892,'1','two','T000',3,0,0,0,6,''),
	(10530,'1','type','T100',4,0,0,0,9,''),
	(4555,'1','u','U000',1,0,0,0,2,''),
	(1584,'1','ul','U400',2,0,0,0,33,''),
	(11,'1','under','U536',5,0,0,0,20,''),
	(918,'1','understand','U5362353',10,0,0,0,15,''),
	(1615,'1','understanding','U536235352',13,0,0,0,10,''),
	(10435,'1','unfortunately','U5163534',13,0,0,0,9,''),
	(10420,'1','unicorns','U52652',8,0,0,0,9,''),
	(884,'1','unreasonable','U562514',12,0,0,0,5,''),
	(5732,'1','until','U534',5,0,0,0,1,''),
	(868,'1','up','U100',2,0,0,0,29,''),
	(6508,'1','updated','U130',7,0,0,0,14,''),
	(6270,'1','updates','U132',7,0,0,0,14,''),
	(10606,'1','uploading','U14352',9,0,0,0,9,''),
	(13234,'1','uploads','U1432',7,0,0,0,7,''),
	(1704,'1','upon','U150',4,0,0,0,10,''),
	(4892,'1','us','U200',2,0,0,0,25,''),
	(70,'1','usable','U214',6,0,0,0,8,''),
	(1513,'1','use','U200',3,0,0,0,39,''),
	(10596,'1','used','U230',4,0,0,0,9,''),
	(97,'1','user','U260',4,0,0,0,29,''),
	(6381,'1','users','U262',5,0,0,0,14,''),
	(1688,'1','using','U252',5,0,0,0,25,''),
	(83,'1','utility','U343',7,0,0,0,8,''),
	(748,'1','ux','U200',2,0,0,0,3,''),
	(10514,'1','value','V400',5,0,0,0,9,''),
	(1557,'1','variety','V630',7,0,0,0,10,''),
	(4798,'1','various','V620',7,0,0,0,4,''),
	(835,'1','ve','V000',2,0,0,0,41,''),
	(183,'1','vel','V400',3,0,0,0,6,''),
	(178,'1','venenatis','V532',9,0,0,0,6,''),
	(6021,'1','venture','V536',7,0,0,0,2,''),
	(1610,'1','versed','V623',6,0,0,0,10,''),
	(3269,'1','version','V625',7,0,0,0,15,''),
	(4754,'1','very','V600',4,0,0,0,18,''),
	(179,'1','vestibulum','V23145',10,0,0,0,6,''),
	(6472,'1','via','V000',3,0,0,0,14,''),
	(10491,'1','video','V300',5,0,0,0,9,''),
	(6467,'1','view','V000',4,0,0,0,14,''),
	(1664,'1','views','V200',5,0,0,0,10,''),
	(10623,'1','virtual','V634',7,0,0,0,9,''),
	(16752,'1','visitors','V2362',8,0,0,0,2,''),
	(180,'1','vivamus','V520',7,0,0,0,6,''),
	(6405,'1','vs','V200',2,0,0,0,14,''),
	(10424,'1','waistlines','W23452',10,0,0,0,9,''),
	(6100,'1','wait','W300',4,0,0,0,14,''),
	(909,'1','walk','W420',4,0,0,0,5,''),
	(17065,'1','walking','W4252',7,0,0,0,1,''),
	(925,'1','want','W530',4,0,0,0,5,''),
	(10579,'1','wanted','W530',6,0,0,0,9,''),
	(787,'1','was','W200',3,0,0,0,34,''),
	(10602,'1','wash','W200',4,0,0,0,9,''),
	(16962,'1','wasn','W250',4,0,0,0,1,''),
	(6127,'1','water','W360',5,0,0,0,14,''),
	(954,'1','way','W000',3,0,0,0,28,''),
	(969,'1','ways','W200',4,0,0,0,5,''),
	(834,'1','we','W000',2,0,0,0,55,''),
	(71,'1','web','W100',3,0,0,0,41,''),
	(10632,'1','webex','W120',5,0,0,0,9,''),
	(4513,'1','website','W123',7,0,0,0,7,''),
	(1541,'1','websites','W1232',8,0,0,0,12,''),
	(1723,'1','week','W200',4,0,0,0,19,''),
	(10611,'1','weekend','W253',7,0,0,0,9,''),
	(1717,'1','weekly','W240',6,0,0,0,10,''),
	(6458,'1','welcome','W425',7,0,0,0,14,''),
	(1609,'1','well','W400',4,0,0,0,33,''),
	(6194,'1','were','W600',4,0,0,0,15,''),
	(6316,'1','weren','W650',5,0,0,0,14,''),
	(786,'1','what','W300',4,0,0,0,46,''),
	(24,'1','when','W500',4,0,0,0,53,''),
	(923,'1','where','W600',5,0,0,0,30,''),
	(6008,'1','whether','W360',7,0,0,0,3,''),
	(4969,'1','which','W200',5,0,0,0,11,''),
	(1625,'1','while','W400',5,0,0,0,33,''),
	(67,'1','who','W000',3,0,0,0,33,''),
	(959,'1','why','W000',3,0,0,0,28,''),
	(1556,'1','wide','W300',4,0,0,0,10,''),
	(4991,'1','wife','W100',4,0,0,0,1,''),
	(831,'1','will','W400',4,0,0,0,24,''),
	(3288,'1','willing','W452',7,0,0,0,6,''),
	(30,'1','with','W300',4,0,0,0,73,''),
	(6261,'1','within','W350',6,0,0,0,14,''),
	(4968,'1','wonderwheel','W5364',11,0,0,0,1,''),
	(1605,'1','wordpress','W63162',9,0,0,0,10,''),
	(1636,'1','work','W620',4,0,0,0,24,''),
	(6513,'1','worked','W623',6,0,0,0,14,''),
	(19,'1','working','W6252',7,0,0,0,32,''),
	(10549,'1','works','W620',5,0,0,0,9,''),
	(968,'1','worst','W623',5,0,0,0,5,''),
	(3279,'1','would','W430',5,0,0,0,30,''),
	(6340,'1','writeboards','W631632',11,0,0,0,14,''),
	(1600,'1','writing','W6352',7,0,0,0,33,''),
	(10517,'1','wrote','W630',5,0,0,0,9,''),
	(6064,'1','www','W000',3,0,0,0,17,''),
	(1594,'1','wysiwyg','W200',7,0,0,0,13,''),
	(4535,'1','x','X000',1,0,0,0,2,''),
	(1690,'1','xml','X540',3,0,0,0,10,''),
	(1522,'1','year','Y600',4,0,0,0,25,''),
	(17,'1','years','Y620',5,0,0,0,53,''),
	(6506,'1','yes','Y200',3,0,0,0,14,''),
	(826,'1','you','Y000',3,0,0,0,47,''),
	(1675,'1','your','Y600',4,0,0,0,33,''),
	(6069,'1','_blank','B452',6,0,0,0,17,'');

/*!40000 ALTER TABLE `exp_super_search_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_tag_bad_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tag_bad_tags`;

CREATE TABLE `exp_tag_bad_tags` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(150) NOT NULL,
  `site_id` smallint(3) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  KEY `tag_name` (`tag_name`),
  KEY `site_id` (`site_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_tag_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tag_entries`;

CREATE TABLE `exp_tag_entries` (
  `entry_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `channel_id` smallint(3) unsigned NOT NULL,
  `site_id` smallint(3) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT 'channel',
  `tag_group_id` int(10) unsigned NOT NULL DEFAULT '1',
  `remote` char(1) NOT NULL DEFAULT 'n',
  KEY `entry_id` (`entry_id`),
  KEY `tag_id` (`tag_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_tag_entries` WRITE;
/*!40000 ALTER TABLE `exp_tag_entries` DISABLE KEYS */;

INSERT INTO `exp_tag_entries` (`entry_id`, `tag_id`, `channel_id`, `site_id`, `author_id`, `ip_address`, `type`, `tag_group_id`, `remote`)
VALUES
	(16,1,2,1,1,'127.0.0.1','channel',1,'n'),
	(16,2,2,1,1,'127.0.0.1','channel',1,'n'),
	(16,3,2,1,1,'127.0.0.1','channel',1,'n'),
	(18,6,2,1,1,'173.162.198.217','channel',1,'n'),
	(18,7,2,1,1,'173.162.198.217','channel',1,'n'),
	(17,3,2,1,1,'173.162.198.217','channel',1,'n'),
	(17,4,2,1,1,'173.162.198.217','channel',1,'n'),
	(22,9,2,1,1,'173.162.198.217','channel',1,'n'),
	(22,10,2,1,1,'173.162.198.217','channel',1,'n'),
	(22,11,2,1,1,'173.162.198.217','channel',1,'n'),
	(21,8,2,1,1,'173.162.198.217','channel',1,'n'),
	(21,9,2,1,1,'173.162.198.217','channel',1,'n');

/*!40000 ALTER TABLE `exp_tag_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_tag_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tag_groups`;

CREATE TABLE `exp_tag_groups` (
  `tag_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_group_name` varchar(150) NOT NULL,
  `tag_group_short_name` varchar(150) NOT NULL,
  PRIMARY KEY (`tag_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_tag_groups` WRITE;
/*!40000 ALTER TABLE `exp_tag_groups` DISABLE KEYS */;

INSERT INTO `exp_tag_groups` (`tag_group_id`, `tag_group_name`, `tag_group_short_name`)
VALUES
	(1,'default','default');

/*!40000 ALTER TABLE `exp_tag_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_tag_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tag_preferences`;

CREATE TABLE `exp_tag_preferences` (
  `tag_preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_preference_name` varchar(100) NOT NULL,
  `tag_preference_value` varchar(100) NOT NULL,
  `site_id` int(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`tag_preference_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_tag_preferences` WRITE;
/*!40000 ALTER TABLE `exp_tag_preferences` DISABLE KEYS */;

INSERT INTO `exp_tag_preferences` (`tag_preference_id`, `tag_preference_name`, `tag_preference_value`, `site_id`)
VALUES
	(1,'parse','linebreak',1),
	(2,'convert_case','y',1),
	(3,'enable_tag_form','y',1),
	(4,'publish_entry_tag_limit','0',1),
	(5,'allow_tag_creation_publish','y',1);

/*!40000 ALTER TABLE `exp_tag_preferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_tag_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tag_subscriptions`;

CREATE TABLE `exp_tag_subscriptions` (
  `tag_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `site_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`member_id`,`site_id`),
  KEY `site_id` (`site_id`),
  KEY `member_id` (`member_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_tag_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tag_tags`;

CREATE TABLE `exp_tag_tags` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_alpha` char(3) NOT NULL,
  `tag_name` varchar(200) NOT NULL,
  `site_id` smallint(3) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL,
  `entry_date` int(10) NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `clicks` int(10) NOT NULL DEFAULT '0',
  `total_entries` int(10) NOT NULL DEFAULT '0',
  `total_entries_1` int(10) NOT NULL DEFAULT '0',
  `channel_entries` int(10) NOT NULL DEFAULT '0',
  `gallery_entries` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  KEY `tag_name` (`tag_name`),
  KEY `tag_alpha` (`tag_alpha`),
  KEY `author_id` (`author_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_tag_tags` WRITE;
/*!40000 ALTER TABLE `exp_tag_tags` DISABLE KEYS */;

INSERT INTO `exp_tag_tags` (`tag_id`, `tag_alpha`, `tag_name`, `site_id`, `author_id`, `entry_date`, `edit_date`, `clicks`, `total_entries`, `total_entries_1`, `channel_entries`, `gallery_entries`)
VALUES
	(1,'s','stories',1,1,1363196114,1363276914,0,1,1,1,0),
	(2,'b','business',1,1,1363196114,1363276914,10,1,1,1,0),
	(3,'2','20mile',1,1,1363196114,1364338784,5,3,3,3,0),
	(4,'j','jobs',1,1,1363268323,1364307083,3,1,1,1,0),
	(6,'g','git',1,1,1363276599,1364241422,8,1,1,1,0),
	(7,'e','expressionengine',1,1,1363276599,1364241422,2,1,1,1,0),
	(8,'p','project management',1,1,1364310695,1364341013,2,1,1,1,0),
	(9,'t','tools',1,1,1364310695,1364341013,2,2,2,2,0),
	(10,'c','communication',1,1,1364339448,0,1,1,1,1,0),
	(11,'c','collaboration',1,1,1364339448,0,0,1,1,1,0);

/*!40000 ALTER TABLE `exp_tag_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`)
VALUES
	(3,1,'pages',1,'y');

/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_member_groups`;

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_template_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_no_access`;

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`)
VALUES
	(3,1,3,'index','n','webpage','',NULL,1363018638,0,'n',0,'','n','n','o',5092),
	(4,1,3,'home_page','y','webpage','','',1363018670,1,'n',0,'','n','n','o',201),
	(5,1,3,'_top','y','webpage','','',1363018684,1,'n',0,'','n','n','o',0),
	(6,1,3,'_bottom','y','webpage','','',1363018693,1,'n',0,'','n','n','o',0),
	(7,1,3,'_header','y','webpage','','',1363018810,1,'n',0,'','n','n','o',0),
	(8,1,3,'_footer','y','webpage','','',1363018820,1,'n',0,'','n','n','o',0),
	(9,1,3,'interior_page','y','webpage','','',1363018850,1,'n',0,'','n','n','o',1),
	(10,1,3,'expertise_page','y','webpage','','',1363105881,1,'n',0,'','n','n','o',205),
	(11,1,3,'contact_page','y','webpage','','',1363105895,1,'n',0,'','n','n','o',114),
	(12,1,3,'case_study_page','y','webpage','','',1363105911,1,'n',0,'','n','n','o',2),
	(13,1,3,'journal_listing_page','y','webpage','','',1363105928,1,'n',0,'','n','n','o',290),
	(14,1,3,'journal_detail_page','y','webpage','','',1363105947,1,'n',0,'','n','n','o',321),
	(15,1,3,'results_page','y','webpage','{embed=\"pages/_top\"}\n\n{embed=\"pages/_header\"}\n\n<!-- CONTENT -->\n\n{embed=\"pages/_page_header\"}\n        <!-- First Row -->\n\n        {exp:channel:entries\n        	channel=\"results\"\n        	disable=\"category_fields|member_data|pagination|trackbacks\"\n        	dynamic=\"off\"\n        	require_entry=\"yes\"\n        }\n        <a name=\"result-{url_title}\"></a>\n        <div class=\"row\">\n            <div class=\"span12\">\n                <article class=\"result-item\">\n                     <div class=\"result-screens\">\n                        <div class=\"top\">\n                        	{if \"{result_tablet_images:total_files}\" != \"0\"}\n                            <div class=\"tablet-screen\">\n                                <div class=\"snapshot\">\n                                    <a href=\"#{url_title}-modal\" data-toggle=\"modal\">\n                                        <img src=\"{result_tablet_images:url:thumb}\" alt=\"\">\n                                    </a>\n                                </div>\n                            </div>\n                            {/if}\n                            {if \"{result_mobile_images:total_files}\" != \"0\"}\n                            <div class=\"mobile-screen\">\n                                <div class=\"snapshot\">\n                                    <a href=\"#{url_title}-modal\" data-toggle=\"modal\">\n                                        <img src=\"{result_mobile_images:url:thumb}\" alt=\"\">\n                                    </a>\n                                </div>\n                            </div>\n                            {/if}\n                        </div>\n                        <div class=\"bottom\">\n                        	{if \"{result_desktop_images:total_files}\" != \"0\"}\n                            <div class=\"desktop-screen\">\n                                <div class=\"snapshot\">\n                                    <a href=\"#{url_title}-modal\" data-toggle=\"modal\">\n                                        <img src=\"{result_desktop_images:url:thumb}\" alt=\"\">\n                                    </a>\n                                </div>\n                            </div>\n                            {/if}\n\n                        </div>\n                    </div>\n                    <div class=\"result-description\">\n                        <header>\n                            <h1>{title}</h1>\n                        </header>\n\n                        {result_description}\n\n                        <footer>\n                           <!--  <a href=\"<!-- @path case_study.html -->\" class=\"case-study-btn\">Read the Case Study</a> -->\n                            <div class=\"categories\">\n                                {categories show_group=\"1\"}\n                                    <div class=\"{category_url_title}\"></div>\n                                {/categories}\n                            </div>\n                        </footer>\n                    </div>\n                    <!-- Modal Gallery -->\n                    <div\n                        id=\"{url_title}-modal\" class=\"modal hide results-modal\" tabindex=\"-1\"\n                        role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"\n                    >\n                        <div class=\"modal-header\">\n                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&nbsp;</button>\n                            &nbsp;\n                        </div>\n                        <div class=\"modal-body\">\n                            <img src=\"{result_desktop_images:url:full}\" alt=\"\">\n                        </div>\n                        <div class=\"modal-footer\">\n                            <div class=\"thumb-wrapper\">\n                                <div class=\"scrollable\">\n                                    <div class=\"items\">\n                                    	{result_desktop_images}\n                                        <div class=\"thumb-screen desktop\">\n                                            <img src=\"{url:thumb}\" data-src=\"{url:full}\" alt=\"\">\n                                        </div>\n                                        {/result_desktop_images}\n                                        {result_tablet_images}\n                                        <div class=\"thumb-screen tablet\">\n                                            <img src=\"{url:thumb}\" data-src=\"{url:full}\" alt=\"\">\n                                        </div>\n                                        {/result_tablet_images}\n                                        {result_mobile_images}\n                                        <div class=\"thumb-screen mobile\">\n                                            <img src=\"{url:thumb}\" data-src=\"{url:full}\" alt=\"\">\n                                        </div>\n                                        {/result_mobile_images}\n                                    </div>\n                                </div>\n                                <a class=\"prev browse left\"></a>\n                                <a class=\"next browse right\"></a>\n                            </div>\n                        </div>\n                    </div>\n                </article>\n            </div>\n        </div>\n		{/exp:channel:entries}\n    </div>\n</div>\n\n{embed=\"pages/_footer\"}\n\n{embed=\"pages/_bottom\"}\n','',1364395412,1,'n',0,'','n','n','o',220),
	(16,1,3,'team_page','y','webpage','','',1363106616,1,'n',0,'','n','n','o',275),
	(17,1,3,'_page_header','y','webpage','','',1363116544,1,'n',0,'','n','n','o',0),
	(18,1,3,'_team_member_component','y','webpage','','',1363116809,1,'n',0,'','n','n','o',0),
	(19,1,3,'redirect_to_team_page','y','webpage','','',1363118099,1,'n',0,'','n','n','o',13),
	(20,1,3,'_journal_detail_footer','y','webpage','','',1363195320,1,'n',0,'','n','n','o',0),
	(21,1,3,'404','y','webpage','','',1364414329,1,'n',0,'','n','n','o',596);

/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_upload_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_no_access`;

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_upload_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`)
VALUES
	(1,1,'Main Image Uploads','/var/www/vhosts/20mile.in/httpdocs/images/uploads/','http://20mile.in/images/uploads/','all','','','','','','','','','','',NULL),
	(2,1,'Member Photos','/var/www/vhosts/20mile.in/httpdocs/images/member_photos/','http://20mile.in/images/member_photos/','img','','','','','','','','','','',NULL),
	(3,1,'Result Desktop Images','/var/www/vhosts/20mile.in/httpdocs/images/uploads/result_images/desktop/','http://20mile.in/images/uploads/result_images/desktop/','img','','','','','','','','','','',NULL),
	(4,1,'Result Tablet Images','/var/www/vhosts/20mile.in/httpdocs/images/uploads/result_images/tablet/','http://20mile.in/images/uploads/result_images/tablet/','img','','','','','','','','','','',NULL),
	(5,1,'Result Mobile Images','/var/www/vhosts/20mile.in/httpdocs/images/uploads/result_images/mobile/','http://20mile.in/images/uploads/result_images/mobile/','img','','','','','','','','','','',NULL);

/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_wygwam_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_wygwam_configs`;

CREATE TABLE `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;

INSERT INTO `exp_wygwam_configs` (`config_id`, `config_name`, `settings`)
VALUES
	(1,'Basic','YTo1OntzOjc6InRvb2xiYXIiO2E6MTA6e2k6MDtzOjQ6IkJvbGQiO2k6MTtzOjY6Ikl0YWxpYyI7aToyO3M6OToiVW5kZXJsaW5lIjtpOjM7czo2OiJTdHJpa2UiO2k6NDtzOjEyOiJOdW1iZXJlZExpc3QiO2k6NTtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NjtzOjQ6IkxpbmsiO2k6NztzOjY6IlVubGluayI7aTo4O3M6NjoiQW5jaG9yIjtpOjk7czo1OiJBYm91dCI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxNDoicmVzaXplX2VuYWJsZWQiO3M6MToieSI7czoxMToiY29udGVudHNDc3MiO2E6MDp7fXM6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),
	(2,'Full','YTo1OntzOjc6InRvb2xiYXIiO2E6Njc6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6NDoiU2F2ZSI7aToyO3M6NzoiTmV3UGFnZSI7aTozO3M6NzoiUHJldmlldyI7aTo0O3M6OToiVGVtcGxhdGVzIjtpOjU7czozOiJDdXQiO2k6NjtzOjQ6IkNvcHkiO2k6NztzOjU6IlBhc3RlIjtpOjg7czo5OiJQYXN0ZVRleHQiO2k6OTtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjEwO3M6NToiUHJpbnQiO2k6MTE7czoxMjoiU3BlbGxDaGVja2VyIjtpOjEyO3M6NToiU2NheXQiO2k6MTM7czo0OiJVbmRvIjtpOjE0O3M6NDoiUmVkbyI7aToxNTtzOjQ6IkZpbmQiO2k6MTY7czo3OiJSZXBsYWNlIjtpOjE3O3M6OToiU2VsZWN0QWxsIjtpOjE4O3M6MTI6IlJlbW92ZUZvcm1hdCI7aToxOTtzOjQ6IkZvcm0iO2k6MjA7czo4OiJDaGVja2JveCI7aToyMTtzOjU6IlJhZGlvIjtpOjIyO3M6OToiVGV4dEZpZWxkIjtpOjIzO3M6ODoiVGV4dGFyZWEiO2k6MjQ7czo2OiJTZWxlY3QiO2k6MjU7czo2OiJCdXR0b24iO2k6MjY7czoxMToiSW1hZ2VCdXR0b24iO2k6Mjc7czoxMToiSGlkZGVuRmllbGQiO2k6Mjg7czoxOiIvIjtpOjI5O3M6NDoiQm9sZCI7aTozMDtzOjY6Ikl0YWxpYyI7aTozMTtzOjk6IlVuZGVybGluZSI7aTozMjtzOjY6IlN0cmlrZSI7aTozMztzOjk6IlN1YnNjcmlwdCI7aTozNDtzOjExOiJTdXBlcnNjcmlwdCI7aTozNTtzOjEyOiJOdW1iZXJlZExpc3QiO2k6MzY7czoxMjoiQnVsbGV0ZWRMaXN0IjtpOjM3O3M6NzoiT3V0ZGVudCI7aTozODtzOjY6IkluZGVudCI7aTozOTtzOjEwOiJCbG9ja3F1b3RlIjtpOjQwO3M6OToiQ3JlYXRlRGl2IjtpOjQxO3M6MTE6Ikp1c3RpZnlMZWZ0IjtpOjQyO3M6MTM6Ikp1c3RpZnlDZW50ZXIiO2k6NDM7czoxMjoiSnVzdGlmeVJpZ2h0IjtpOjQ0O3M6MTI6Ikp1c3RpZnlCbG9jayI7aTo0NTtzOjQ6IkxpbmsiO2k6NDY7czo2OiJVbmxpbmsiO2k6NDc7czo2OiJBbmNob3IiO2k6NDg7czo1OiJJbWFnZSI7aTo0OTtzOjU6IkZsYXNoIjtpOjUwO3M6NToiVGFibGUiO2k6NTE7czoxNDoiSG9yaXpvbnRhbFJ1bGUiO2k6NTI7czo2OiJTbWlsZXkiO2k6NTM7czoxMToiU3BlY2lhbENoYXIiO2k6NTQ7czo5OiJQYWdlQnJlYWsiO2k6NTU7czo4OiJSZWFkTW9yZSI7aTo1NjtzOjEwOiJFbWJlZE1lZGlhIjtpOjU3O3M6MToiLyI7aTo1ODtzOjY6IlN0eWxlcyI7aTo1OTtzOjY6IkZvcm1hdCI7aTo2MDtzOjQ6IkZvbnQiO2k6NjE7czo4OiJGb250U2l6ZSI7aTo2MjtzOjk6IlRleHRDb2xvciI7aTo2MztzOjc6IkJHQ29sb3IiO2k6NjQ7czo4OiJNYXhpbWl6ZSI7aTo2NTtzOjEwOiJTaG93QmxvY2tzIjtpOjY2O3M6NToiQWJvdXQiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjEwOiJ1cGxvYWRfZGlyIjtzOjE6IjEiO30=');

/*!40000 ALTER TABLE `exp_wygwam_configs` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
