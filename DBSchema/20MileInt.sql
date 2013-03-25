-- MySQL dump 10.13  Distrib 5.5.25, for osx10.6 (i386)
--
-- Host: localhost    Database: 20MileInt
-- ------------------------------------------------------
-- Server version	5.5.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exp_accessories`
--

DROP TABLE IF EXISTS `exp_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(50) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_accessories`
--

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` VALUES (1,'Expressionengine_info_acc','1|5','addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|addons|admin_content|admin_system|content_edit|content_files_modal|content_files|content_publish|content|design|homepage|members|myaccount|tools_communicate|tools_data|tools_logs|tools_utilities|tools','1.0'),(2,'Structure_acc','1|5','addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|addons|admin_content|admin_system|content_edit|content_files_modal|content_files|content_publish|content|design|homepage|members|myaccount|tools_communicate|tools_data|tools_logs|tools_utilities|tools','3.3.8');
/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Email','send_email'),(2,'Safecracker','submit_entry'),(3,'Safecracker','combo_loader'),(4,'Search','do_search'),(5,'Channel','insert_new_entry'),(6,'Channel','filemanager_endpoint'),(7,'Channel','smiley_pop'),(8,'Member','registration_form'),(9,'Member','register_member'),(10,'Member','activate_member'),(11,'Member','member_login'),(12,'Member','member_logout'),(13,'Member','retrieve_password'),(14,'Member','reset_password'),(15,'Member','send_member_email'),(16,'Member','update_un_pw'),(17,'Member','member_search'),(18,'Member','member_delete'),(19,'Rte','get_js'),(20,'Freeform','save_form'),(21,'Playa_mcp','filter_entries'),(22,'Structure','ajax_move_set_data'),(23,'Assets_mcp','upload_file'),(24,'Assets_mcp','get_files_view_by_folders'),(25,'Assets_mcp','get_props'),(26,'Assets_mcp','save_props'),(27,'Assets_mcp','get_ordered_files_view'),(28,'Assets_mcp','get_session_id'),(29,'Assets_mcp','start_index'),(30,'Assets_mcp','perform_index'),(31,'Assets_mcp','finish_index'),(32,'Assets_mcp','get_s3_buckets'),(33,'Assets_mcp','move_folder'),(34,'Assets_mcp','rename_folder'),(35,'Assets_mcp','create_folder'),(36,'Assets_mcp','delete_folder'),(37,'Assets_mcp','view_file'),(38,'Assets_mcp','move_file'),(39,'Assets_mcp','delete_file'),(40,'Assets_mcp','view_thumbnail'),(41,'Assets_mcp','build_sheet'),(42,'Assets_mcp','get_selected_files'),(43,'Super_search','save_search'),(51,'Profile','register_action'),(52,'Profile','edit_action'),(53,'Profile','set_active_profile_action'),(54,'Profile','login_action'),(55,'Profile','logout_action'),(56,'Profile','forgot_password_action'),(57,'Profile','reset_password_action'),(58,'Profile','activation_action'),(59,'Safeharbor','communicate'),(60,'Safeharbor','_backup_cron'),(61,'Tag','insert_tags'),(62,'Tag','ajax'),(63,'Tag','tag_js'),(64,'Tag','subscribe'),(65,'Tag','unsubscribe');
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_files`
--

DROP TABLE IF EXISTS `exp_assets_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_files`
--

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;
INSERT INTO `exp_assets_files` VALUES (1,1,'ee',NULL,2,'dave-fravel-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157346,'image',437,656,77709,'dave-fravel-c.jpg'),(2,1,'ee',NULL,2,'dave-fravel-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155158,'image',255,316,18533,'dave-fravel-bw.jpg'),(3,1,'ee',NULL,2,'amy-reddington-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155165,'image',255,316,21177,'amy-reddington-bw.jpg'),(4,1,'ee',NULL,2,'amy-reddington-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157353,'image',437,656,80783,'amy-reddington-c.jpg'),(5,1,'ee',NULL,2,'chris-obrien-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155161,'image',255,316,23939,'chris-obrien-bw.jpg'),(6,1,'ee',NULL,2,'chris-obrien-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157351,'image',437,656,90119,'chris-obrien-c.jpg'),(7,1,'ee',NULL,2,'dave-fontes-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157307,'image',255,316,19917,'dave-fontes-bw.jpg'),(8,1,'ee',NULL,2,'dave-fontes-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157349,'image',437,656,75420,'dave-fontes-c.jpg'),(9,1,'ee',NULL,2,'emily-obrien-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155156,'image',255,316,20765,'emily-obrien-bw.jpg'),(10,1,'ee',NULL,2,'emily-obrien-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157344,'image',437,656,76684,'emily-obrien-c.jpg'),(11,1,'ee',NULL,2,'rodrigo-passos-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155154,'image',255,316,21010,'rodrigo-passos-bw.jpg'),(12,1,'ee',NULL,2,'rodrigo-passos-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157342,'image',437,656,79479,'rodrigo-passos-c.jpg'),(13,1,'ee',NULL,2,'sue-malomo-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155152,'image',255,316,26792,'sue-malomo-bw.jpg'),(14,1,'ee',NULL,2,'sue-malomo-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157339,'image',437,656,88412,'sue-malomo-c.jpg'),(15,1,'ee',NULL,2,'tim-merrill-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155150,'image',255,316,17438,'tim-merrill-bw.jpg'),(16,1,'ee',NULL,2,'tim-merrill-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157338,'image',437,656,69183,'tim-merrill-c.jpg'),(17,2,'ee',NULL,3,'BBC_large_home_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363285825,'image',1218,994,301801,'BBC_large_home_full2.jpg'),(18,2,'ee',NULL,3,'BBC_large_home_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363289060,'image',1218,864,219139,'BBC_large_home_full3.jpg'),(19,6,'ee',NULL,1,'BBC_large_home_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363285825,'image',1218,994,301801,'BBC_large_home_full2.jpg'),(20,4,'ee',NULL,1,'index.html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363014866,'html',NULL,NULL,114,'index.html'),(21,6,'ee',NULL,1,'BBC_large_home_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363289060,'image',1218,864,219139,'BBC_large_home_full3.jpg'),(22,1,'ee',NULL,2,'index.html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363014854,'html',NULL,NULL,114,'index.html'),(23,9,'ee',NULL,5,'bbc_mobile_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363289222,'image',385,712,71157,'bbc_mobile_1.jpg'),(24,9,'ee',NULL,5,'bbc_mobile2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363289222,'image',385,712,68058,'bbc_mobile2.jpg'),(25,3,'ee',NULL,4,'BBC_tablet_full3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363289228,'image',746,979,123732,'BBC_tablet_full3.jpg'),(26,3,'ee',NULL,4,'BBC_tablet_full2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363289228,'image',746,1083,212076,'BBC_tablet_full2.jpg'),(27,1,'ee',NULL,2,'amy-reddington-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219818,'image',482,604,164462,'amy-reddington-bw@2x.png'),(28,1,'ee',NULL,2,'chris-obrien-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364220066,'image',482,604,169066,'chris-obrien-bw@2x.png'),(29,1,'ee',NULL,2,'dave-fontes-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219962,'image',482,604,164422,'dave-fontes-bw@2x.png'),(30,1,'ee',NULL,2,'dave-fravel-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219982,'image',482,604,160239,'dave-fravel-bw@2x.png'),(31,1,'ee',NULL,2,'emily-obrien-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219901,'image',482,604,166324,'emily-obrien-bw@2x.png'),(32,1,'ee',NULL,2,'rodrigo-passos-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219866,'image',482,604,162692,'rodrigo-passos-bw@2x.png'),(33,1,'ee',NULL,2,'sue-malomo-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219943,'image',482,604,185311,'sue-malomo-bw@2x.png'),(34,1,'ee',NULL,2,'tim-merrill-bw@2x.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1364219921,'image',482,604,165847,'tim-merrill-bw@2x.png');
/*!40000 ALTER TABLE `exp_assets_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_folders`
--

DROP TABLE IF EXISTS `exp_assets_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_folders`
--

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;
INSERT INTO `exp_assets_folders` VALUES (1,'ee','Member Photos','',NULL,NULL,2),(2,'ee','Result Desktop Images','',NULL,NULL,3),(3,'ee','Result Tablet Images','',NULL,NULL,4),(4,'ee','Main Image Uploads','',NULL,NULL,1),(5,'ee','result_images','result_images/',4,NULL,1),(6,'ee','desktop','result_images/desktop/',5,NULL,1),(7,'ee','mobile','result_images/mobile/',5,NULL,1),(8,'ee','tablet','result_images/tablet/',5,NULL,1),(9,'ee','Result Mobile Images','',NULL,NULL,5);
/*!40000 ALTER TABLE `exp_assets_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_index_data`
--

DROP TABLE IF EXISTS `exp_assets_index_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_index_data`
--

LOCK TABLES `exp_assets_index_data` WRITE;
/*!40000 ALTER TABLE `exp_assets_index_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_index_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_selections`
--

DROP TABLE IF EXISTS `exp_assets_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_selections`
--

LOCK TABLES `exp_assets_selections` WRITE;
/*!40000 ALTER TABLE `exp_assets_selections` DISABLE KEYS */;
INSERT INTO `exp_assets_selections` VALUES (17,19,17,NULL,NULL,NULL,0,0),(18,19,17,NULL,NULL,NULL,1,0),(26,19,18,NULL,NULL,NULL,0,0),(25,19,18,NULL,NULL,NULL,1,0),(24,19,19,NULL,NULL,NULL,0,0),(23,19,19,NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `exp_assets_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_sources`
--

DROP TABLE IF EXISTS `exp_assets_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_sources` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 's3',
  `name` varchar(255) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  PRIMARY KEY (`source_id`),
  UNIQUE KEY `unq_source_type__source_id` (`source_type`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_sources`
--

LOCK TABLES `exp_assets_sources` WRITE;
/*!40000 ALTER TABLE `exp_assets_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_captcha`
--

LOCK TABLES `exp_captcha` WRITE;
/*!40000 ALTER TABLE `exp_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
INSERT INTO `exp_categories` VALUES (1,1,1,0,'Identity Design','identity-design','Donec sed odio dui. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam quis risus eget urna mollis ornare vel eu leo. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.','0',1),(2,1,1,0,'Online Marketing','online-marketing','Donec sed odio dui. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam quis risus eget urna mollis ornare vel eu leo. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.','0',2),(3,1,1,0,'Web Design','web-design','Donec sed odio dui. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam quis risus eget urna mollis ornare vel eu leo. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.','0',3),(4,1,1,0,'Web Development','web-development','Donec sed odio dui. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam quis risus eget urna mollis ornare vel eu leo. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.','0',4);
/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_field_data`
--

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
INSERT INTO `exp_category_field_data` VALUES (1,1,1,'<ul>\n   <li>Logos</li>\n   <li>Identity Systems</li>\n   <li>Brand Development</li>\n   <li>Brand Guidelines</li>\n   <li>Stationary</li>\n</ul>','none'),(2,1,1,'<ul>\n   <li>Logos</li>\n   <li>Identity Systems</li>\n   <li>Brand Development</li>\n   <li>Brand Guidelines</li>\n   <li>Stationary</li>\n</ul>','none'),(3,1,1,'<ul>\n   <li>Logos</li>\n   <li>Identity Systems</li>\n   <li>Brand Development</li>\n   <li>Brand Guidelines</li>\n   <li>Stationary</li>\n</ul>','none'),(4,1,1,'<ul>\n   <li>Logos</li>\n   <li>Identity Systems</li>\n   <li>Brand Development</li>\n   <li>Brand Guidelines</li>\n   <li>Stationary</li>\n</ul>','none');
/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_fields`
--

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;
INSERT INTO `exp_category_fields` VALUES (1,1,1,'topics','Topics','textarea','',128,6,'none','y','ltr','y',2);
/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
INSERT INTO `exp_category_groups` VALUES (1,1,'Expertise','a',0,'all','','');
/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_posts`
--

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
INSERT INTO `exp_category_posts` VALUES (16,1),(17,4),(18,4),(19,3),(19,4);
/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data`
--

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
INSERT INTO `exp_channel_data` VALUES (1,1,3,'',NULL,'',NULL,'<p>\n	Dave Fravel started 20Mile Interactive in a home office under his stairs in 2007 after 15 years of working for large software companies. When he&#39;s not meeting with clients or brainstorming with the 20Mile team, Dave can be found hanging out with his three kids, sitting on Sandy Neck Beach, running through the Trail of Tears in Barnstable or tasting the latest beers @ the Hyannis BBC.</p>',NULL,'{filedir_2}dave-fravel-c.jpg','none','{filedir_2}dave-fravel-bw@2x.png','none','President','none','74BDE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(2,1,3,'',NULL,'',NULL,'','none','{filedir_2}rodrigo-passos-c.jpg','none','{filedir_2}rodrigo-passos-bw@2x.png','none','Senior Web Developer','none','F05921','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(3,1,3,'',NULL,'',NULL,'','none','{filedir_2}tim-merrill-c.jpg','none','{filedir_2}tim-merrill-bw@2x.png','none','Creative Director','none','A5CD38','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(4,1,3,'',NULL,'',NULL,'','none','{filedir_2}sue-malomo-c.jpg','none','{filedir_2}sue-malomo-bw@2x.png','none','Project Manager','none','EDECE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(5,1,3,'',NULL,'',NULL,'','none','{filedir_2}dave-fontes-c.jpg','none','{filedir_2}dave-fontes-bw@2x.png','none','Senior Web Developer','none','F05921','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(6,1,3,'',NULL,'',NULL,'','none','{filedir_2}amy-reddington-c.jpg','none','{filedir_2}amy-reddington-bw@2x.png','none','Project Manager','none','EDECE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(7,1,3,'',NULL,'',NULL,'<p>\n	Chris is a multi-disciplinary designer who crafts beautiful, usable web experiences with a keen eye for details and a strong sense of purpose and utility. He approaches projects with strategic, creative thinking and a passion for finding the best design solutions.</p>','none','{filedir_2}chris-obrien-c.jpg','none','{filedir_2}chris-obrien-bw@2x.png','none','Director of UX','none','A5CD38','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(8,1,3,'',NULL,'',NULL,'','none','{filedir_2}emily-obrien-c.jpg','none','{filedir_2}emily-obrien-bw@2x.png','none','Office','none','EDECE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(9,1,3,NULL,NULL,NULL,NULL,NULL,'none',NULL,'none',NULL,'none',NULL,'none','','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(10,1,1,'<p>\n	This is the home page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(11,1,1,'<p>\n	Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(12,1,1,'<p>\n	Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(13,1,1,'<p>Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(14,1,1,'<p>\n	Journal page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(15,1,1,'<p>\n	Contact page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(16,1,2,'',NULL,'<p>\n	I&#39;m amazed Tim is still talking to me. I&#39;m even more amazed that he didn&#39;t punch me in the face and quit at least 4 times over the past month. Poor Tim.He had no idea what he was getting himself into when he raised his hand during a meeting and took on the challenge of telling the 20Mile story.&nbsp;</p>\n<!--read_more-->\n<p>\n	&nbsp;</p>\n<p>\n	When this was a company of one providing database and web development services the story was simple --&gt; Hi. I&#39;m Dave. I&#39;m a nice guy. Here&#39;s my rate. Here&#39;s what I can do for you. Here&#39;s when I can start. Here&#39;s how long the project will take.</p>\n<p>\n	Now that we&#39;ve grown as a company and our services have expanded, we have a new story to tell. 20Mile is no longer me sitting in my 6x8 home office under the stairs. 20Mile is now eight people (and growing) providing brand, design, development and marketing services for over 100 clients.</p>\n<p>\n	Tim was confident. He tells stories for a living. He&#39;s been doing this for almost 15 years and knew he was up to the challenge of telling our story.</p>\n<p>\n	This brings me back to Tim and the challenge of creating a design that will tell our story. One suggestion was a name change. 20Mile doesn&#39;t provide the foundation for a great story. Tim offered at least 20 reasonable choices (and at least that many unreasonable ones). He created logos for one possible name. Every day or two I&#39;d get an IM from him with a new suggestion. My problem was that</p>\n<p>\n	We are a partner, collaborator, cheerleader, mentor, thinker and listener. We don&#39;t walk into a client (or prospect) and tell them what to do. We listen first. We ask questions. We get to know them, understand their challenges, their business goals, where they&#39;ve been and where they want to go. We guide, suggest, advise, counsel and, when necessary, lead.&nbsp;</p>\n<p>\n	Our strength is in our expertise and our ability to build relationships - both with our clients and their audience. We&#39;re not here to sprint to a finish line, put up a site and disappear. We&#39;re here for the long-term, to help our clients develop and nurture their online identities - to help them tell their stories in a way that will connect with their audience.</p>\n<p>\n	In those days, when people asked me \"Why 20Mile?\" I could explain that the name came to me when I was training for marathons. The 20 mile run was one of the best and worst ways to spend a Sunday morning. I&#39;d head out with a couple friends and we&#39;d keep putting one foot in front of the other for three hours. We&#39;d talk about everything. We&#39;d push and pull each other.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'We are a partner, collaborator, cheerleader, mentor, thinker and listener.','none','20mile\nbusiness\nstories','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(17,1,2,'',NULL,'<p>\n	20Mile Interactive is seeking motivated, self-directed web developers to join our growing team at our Osterville, Cape Cod, Massachusetts office. If you&#39;re interested in this position, please contact Dave Fravel at anytime - 508-419-7439 or use our <a href=\"{page_15}\">contact page</a>.</p>\n<!--read_more-->\n<h3>\n	Who We Are</h3>\n<p>\n	We are a five year old web design and development firm with offices on Cape Cod and soon to be in Boston. We have over 100 active clients and have implemented over 200 websites. We specialize in modern web design (especially responsive), content management systems and e-commerce implementations.</p>\n<h3>\n	Position Expectations</h3>\n<p>\n	We realize that modern web development encompasses a wide variety of skills and to expect a single individual to be great at all of them is ridiculous. With this in mind, we&rsquo;d love to talk with you if you have any of the following skills. We&rsquo;ve divided these into what we consider Front End Development and Back End Development.</p>\n<h3>\n	Front End Developer Skills</h3>\n<ul>\n	<li>\n		An expert level of HTML/CSS (no Dreamweaver or other WYSIWYG applications, please)</li>\n	<li>\n		Fluency in HTML5 / CSS3</li>\n	<li>\n		Experience in writing Javascript, and in particular JQuery</li>\n	<li>\n		Experience with Responsive Web Design</li>\n	<li>\n		Content Management Systems</li>\n	<li>\n		ExpressionEngine</li>\n	<li>\n		WordPress</li>\n	<li>\n		Drupal</li>\n	<li>\n		Photoshop or Fireworks skills</li>\n	<li>\n		Well-versed in modern web standards and best practices</li>\n	<li>\n		A solid understanding of grids in web design and how to implement them systematically</li>\n	<li>\n		Experience with testing and developing across multiple browsers while maintaining a consistent experience</li>\n	<li>\n		Ability to define and maintain complex and well crafted stylesheets</li>\n	<li>\n		Experience with Git</li>\n	<li>\n		Able to work well individually and collaborate with a team</li>\n	<li>\n		A hatred of the letters I and E</li>\n</ul>\n<h3>\n	Back End Developer Skills</h3>\n<ul>\n	<li>\n		Experience in a LAMP-based architecture</li>\n	<li>\n		Object-oriented PHP</li>\n	<li>\n		PHP Frameworks such as CodeIgniter and Laravel</li>\n	<li>\n		Strong MySQL/Database knowledge - you should understand normalization, joins, query optimization, views, stored procedures and triggers (or at least appreciate that the database is more than a dumping ground for your data - it can actually do some things, too)</li>\n	<li>\n		Experience with Git</li>\n	<li>\n		Experience with API consumption</li>\n	<li>\n		Web service integration using technologies such as XML, SOAP and REST</li>\n	<li>\n		Content Management Systems</li>\n	<li>\n		ExpressionEngine</li>\n	<li>\n		WordPress</li>\n	<li>\n		Drupal</li>\n	<li>\n		Able to work well individually and collaborate with a team</li>\n</ul>\n<h3>\n	Client Interaction Expectations</h3>\n<p>\n	We have full-time Project and Client Managers that manage the majority of the client interaction, but the web developer is occasionally called upon to speak directly with a client to help guide them through the development process.</p>\n<h3>\n	Internal Interaction</h3>\n<p>\n	Communicate daily with design and project management team to move projects forward<br />\n	Weekly meetings with the project team to manage priorities and set goals for the next week.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'We specialize in modern web design (especially responsive), content management systems and e-commerce implementations.','none','20mile\njobs','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(18,1,2,'',NULL,'<p>\n	I hear this question all the time: \"How can I use git in my ExpressionEngine projects?\" or \"How can I version control my database?\". The short answer is you can&#39;t (a better short answer would be \"I don&#39;t know\"). But the longer anwser is you can, if you are willing to do some pre-project setup and follow some conventions.</p>\n<p>\n	Here is what we have been experimenting at 20MileInteractive.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'The longer anwser is you can, if you are willing to do some pre-project setup and follow some conventions.','none','expressionengine\ngit','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','none',0,'','none','','none','','none'),(19,1,4,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam quis risus eget urna mollis ornare vel eu leo.</p>\n<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam quis risus eget urna mollis ornare vel eu leo.</p>','xhtml','BBC_large_home_full2.jpg\nBBC_large_home_full3.jpg','none','BBC_tablet_full3.jpg\nBBC_tablet_full2.jpg','none','bbc_mobile_1.jpg\nbbc_mobile2.jpg','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'','none');
/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
INSERT INTO `exp_channel_entries_autosave` VALUES (4,0,1,4,1,0,NULL,'127.0.0.1','British Beer Company','british-beer-company','open','y',0,0,0,0,'n','n',1363282694,'n','2013','03','14',0,0,20130314123814,0,0,'a:30:{s:8:\"entry_id\";i:4;s:10:\"channel_id\";s:1:\"4\";s:7:\"site_id\";s:1:\"1\";s:11:\"field_id_16\";s:0:\"\";s:11:\"field_id_17\";s:0:\"\";s:11:\"field_id_18\";s:0:\"\";s:11:\"field_id_19\";s:0:\"\";s:11:\"field_id_26\";s:0:\"\";s:10:\"field_id_1\";s:0:\"\";s:10:\"field_id_2\";s:0:\"\";s:10:\"field_id_4\";s:0:\"\";s:10:\"field_id_5\";s:0:\"\";s:10:\"field_id_6\";s:0:\"\";s:10:\"field_id_7\";s:0:\"\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_id_9\";s:0:\"\";s:11:\"field_id_10\";s:0:\"\";s:11:\"field_id_11\";s:0:\"\";s:11:\"field_id_12\";s:0:\"\";s:11:\"field_id_13\";s:0:\"\";s:11:\"field_id_14\";s:0:\"\";s:11:\"field_id_15\";s:0:\"\";s:11:\"field_id_20\";s:0:\"\";s:11:\"field_id_21\";s:0:\"\";s:11:\"field_id_22\";s:0:\"\";s:11:\"field_id_23\";s:0:\"\";s:11:\"field_id_25\";s:0:\"\";s:17:\"original_entry_id\";i:0;s:14:\"structure__uri\";s:20:\"british-beer-company\";s:22:\"structure__template_id\";s:1:\"9\";}');
/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'page_content','Page Content','','wygwam','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(2,1,2,'journal_content','Journal Content','','wygwam','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(4,1,3,'team_bio','Team Bio','','wygwam','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(5,1,3,'profile_photo','Profile Photo','Full photo for profile detail page','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(6,1,3,'profile_headshot','Profile Headshot','Headshot for thumbnail','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(7,1,3,'job_title','Job Title','','text','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','y','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,3,'profile_group_color','Group Color','','pt_dropdown','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',5,'any','YTo3OntzOjc6Im9wdGlvbnMiO2E6NTp7czo2OiI3NEJERTgiO3M6OToiT3duZXJzaGlwIjtzOjY6IkVERUNFOCI7czoxNToiUHJvamVjdCBNYW5hZ2VyIjtzOjY6IkE1Q0QzOCI7czoxNzoiRGVzaWduZXIvQ3JlYXRpdmUiO3M6NjoiRjA1OTIxIjtzOjExOiJEZXZlbG9wbWVudCI7czo2OiJGRkZGRkYiO3M6NjoiT2ZmaWNlIjt9czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(9,1,3,'profile_twitter','Twitter','','text','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(10,1,3,'profile_linkedin','Linkedin','','text','','0',0,0,'channel',2,'title','desc',0,6,250,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(11,1,3,'profile_first_question','First Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(12,1,3,'profile_second_question','Second Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',9,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(13,1,3,'profile_third_question','Third Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',10,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(14,1,2,'journal_blockquote','Blockquote','','text','','0',0,0,'channel',2,'title','desc',0,6,250,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(15,1,2,'journal_tags','Tags','','tag','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',3,'any','YToxMDp7czo4OiJhbGxfb3BlbiI7czoyOiJubyI7czoxMjoic3VnZ2VzdF9mcm9tIjtzOjU6Imdyb3VwIjtzOjk6InRhZ19ncm91cCI7czoxOiIxIjtzOjEzOiJ0b3BfdGFnX2xpbWl0IjtzOjE6IjMiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(16,1,4,'result_description','Description','','rte','','0',0,0,'channel',2,'title','desc',0,10,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjI0OiJydGVfZmllbGRfdGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJydGVfdGFfcm93cyI7czoyOiIxMCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(17,1,4,'result_desktop_images','Desktop Images','','assets','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZTozIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJsYXJnZSI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToieSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(18,1,4,'result_tablet_images','Tablet Images','','assets','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZTo0Ijt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJsYXJnZSI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToieSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(19,1,4,'result_mobile_images','Mobile Images','','assets','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZTo1Ijt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJsYXJnZSI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToieSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(20,1,5,'case_study_tag_line','Tag Line','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(21,1,5,'case_study_case_title','Case Title','This is the title in orange, bellow the screens.','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(22,1,5,'case_study_content','Content','','wygwam','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(23,1,5,'case_study_url','URL','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(24,1,5,'case_study_launch_date','Launch Date','','date','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(25,1,5,'case_study_fact_sheet','Fact Sheet','','matrix','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',6,'any','YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6MTp7aTowO2k6NDt9fQ=='),(26,1,4,'case_study','Case Study','','playa','','0',0,0,'channel',5,'title','desc',0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMjp7czo1OiJtdWx0aSI7czoxOiJuIjtzOjc6ImV4cGlyZWQiO3M6MToibiI7czo2OiJmdXR1cmUiO3M6MToieSI7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI1Ijt9czo3OiJvcmRlcmJ5IjtzOjU6InRpdGxlIjtzOjQ6InNvcnQiO3M6MzoiQVNDIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_member_groups`
--

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (1,1,3,2,0,0,'127.0.0.1','Dave Fravel','dfravel','open','y',0,0,0,0,'n','n',1359839633,'n','2013','02','02',0,0,20130325161454,NULL,0),(2,1,3,3,0,0,'127.0.0.1','Rodrigo Passos','rpassos','open','y',0,0,0,0,'n','n',1359839912,'n','2013','02','02',0,0,20130325161533,NULL,0),(3,1,3,4,0,0,'127.0.0.1','Tim Merrill','tmerrill','open','y',0,0,0,0,'n','n',1359840047,'n','2013','02','02',0,0,20130325161548,NULL,0),(4,1,3,5,0,0,'127.0.0.1','Sue Malomo','smalomo','open','y',0,0,0,0,'n','n',1359841448,'n','2013','02','02',0,0,20130325161509,NULL,0),(5,1,3,6,0,0,'127.0.0.1','David Fontes','dfontes','open','y',0,0,0,0,'n','n',1359841505,'n','2013','02','02',0,0,20130325161606,NULL,0),(6,1,3,7,0,0,'127.0.0.1','Amy Reddington','areddington','open','y',0,0,0,0,'n','n',1359841520,'n','2013','02','02',0,0,20130325161521,NULL,0),(7,1,3,8,0,0,'127.0.0.1','Chris OBrien','cobrien','open','y',0,0,0,0,'n','n',1359841616,'n','2013','02','02',0,0,20130325161557,NULL,0),(8,1,3,9,0,0,'127.0.0.1','Emily OBrien','eobrien','open','y',0,0,0,0,'n','n',1359841574,'n','2013','02','02',0,0,20130325161615,NULL,0),(9,1,3,1,0,0,'71.233.247.104','Admin','admin','open','y',0,0,0,0,'y','n',1359854848,'n','2013','02','02',0,0,20130202202728,NULL,0),(10,1,1,1,0,NULL,'127.0.0.1','Home','home','open','y',0,0,0,0,'n','n',1363018914,'n','2013','03','11',0,0,20130312141855,0,0),(11,1,1,1,0,NULL,'127.0.0.1','Expertise','expertise','open','y',0,0,0,0,'n','n',1363018954,'n','2013','03','11',0,0,20130312171835,0,0),(12,1,1,1,0,NULL,'127.0.0.1','Results','results','open','y',0,0,0,0,'n','n',1363019005,'n','2013','03','11',0,0,20130314173826,0,0),(13,1,1,1,0,NULL,'127.0.0.1','Team','team','open','y',0,0,0,0,'n','n',1363019562,'n','2013','03','11',0,0,20130312194343,0,0),(14,1,1,1,0,NULL,'127.0.0.1','Journal','journal','open','y',0,0,0,0,'n','n',1363019561,'n','2013','03','11',0,0,20130312170442,0,0),(15,1,1,1,0,NULL,'127.0.0.1','Contact','contact','open','y',0,0,0,0,'n','n',1363019562,'n','2013','03','11',0,0,20130312164443,0,0),(16,1,2,2,0,NULL,'127.0.0.1','The Story Behind 20Mile','the-story-behind-20mile','open','y',0,0,0,0,'n','n',1363189313,'n','2013','03','13',0,0,20130314160154,0,0),(17,1,2,2,0,NULL,'127.0.0.1','We’re Hiring - Web Developer','were-hiring-web-developer','open','y',0,0,0,0,'n','n',1363008582,'n','2013','03','11',0,0,20130314160143,0,0),(18,1,2,3,0,NULL,'127.0.0.1','ExpressionEngine and Git: Using Git Hooks to Track Database Changes','expressionengine-and-git-using-git-hooks-to-track-database-changes','open','y',0,0,0,0,'n','n',1362844160,'n','2013','03','09',0,0,20130314160121,0,0),(19,1,4,1,0,NULL,'127.0.0.1','British Beer Company','british-beer-company','open','y',0,0,0,0,'n','n',1363285769,'n','2013','03','14',0,0,20130314195830,0,0);
/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'pages','Pages','http://20mile.20miletech.net/','','en',6,0,1363019562,0,'',1,'open',1,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,'','','y','','n',10,'','',0),(2,1,'journal','Journal','http://20mile.20miletech.net/',NULL,'en',3,0,1363189313,0,'1',1,'open',2,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),(3,1,'team_profiles','Team Profiles','http://20mile.20miletech.net/',NULL,'en',9,0,1359854848,0,'',1,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),(4,1,'results','Results','http://20mile/',NULL,'en',1,0,1363285769,0,'1',1,'open',4,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),(5,1,'case_study','Case Study','http://20mile/',NULL,'en',0,0,0,0,'1',1,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0);
/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'admin','173.162.198.217',1359648945,'Logged in'),(2,1,1,'admin','173.162.198.217',1359648970,'Logged in'),(3,1,1,'admin','173.162.198.217',1359734790,'Logged in'),(4,1,1,'admin','173.162.198.217',1359735087,'Channel Created:&nbsp;&nbsp;pages'),(5,1,1,'admin','173.162.198.217',1359735134,'Field Group Created:&nbsp;Pages Fields'),(6,1,1,'admin','173.162.198.217',1359735209,'Field Group Created:&nbsp;Journal Fields'),(7,1,1,'admin','173.162.198.217',1359837983,'Logged in'),(8,1,1,'admin','173.162.198.217',1359838028,'Channel Created:&nbsp;&nbsp;Journal'),(9,1,1,'admin','173.162.198.217',1359839333,'Channel Created:&nbsp;&nbsp;Team Profiles'),(10,1,1,'admin','173.162.198.217',1359839353,'Field Group Created:&nbsp;Team Profile fields'),(11,1,1,'admin','173.162.198.217',1359839594,'Member profile created:&nbsp;&nbsp;dfravel'),(12,1,1,'admin','173.162.198.217',1359839975,'Member profile created:&nbsp;&nbsp;rpassos'),(13,1,1,'admin','173.162.198.217',1359840014,'Member profile created:&nbsp;&nbsp;tmerrill'),(14,1,1,'admin','173.162.198.217',1359841487,'Member profile created:&nbsp;&nbsp;smalomo'),(15,1,1,'admin','173.162.198.217',1359841521,'Member profile created:&nbsp;&nbsp;dfontes'),(16,1,1,'admin','173.162.198.217',1359841547,'Member profile created:&nbsp;&nbsp;areddington'),(17,1,1,'admin','173.162.198.217',1359841576,'Member profile created:&nbsp;&nbsp;cobrien'),(18,1,1,'admin','173.162.198.217',1359841601,'Member profile created:&nbsp;&nbsp;eobrien'),(19,1,1,'admin','71.233.247.104',1359854822,'Logged in'),(20,1,1,'admin','173.162.198.217',1362667443,'Logged in'),(21,1,1,'admin','127.0.0.1',1363017873,'Logged in'),(22,1,1,'admin','127.0.0.1',1363094883,'Logged in'),(23,1,1,'admin','127.0.0.1',1363095655,'Category Group Created:&nbsp;&nbsp;Expertise'),(24,1,1,'admin','127.0.0.1',1363105848,'Logged in'),(25,1,1,'admin','127.0.0.1',1363107940,'Field Group Created:&nbsp;Result Fields'),(26,1,1,'admin','127.0.0.1',1363107953,'Channel Created:&nbsp;&nbsp;Results'),(27,1,1,'admin','127.0.0.1',1363115952,'Logged out'),(28,1,1,'admin','127.0.0.1',1363116401,'Logged in'),(29,1,1,'admin','127.0.0.1',1363183093,'Logged in'),(30,1,1,'admin','127.0.0.1',1363194693,'Logged in'),(31,1,1,'admin','127.0.0.1',1363265884,'Logged in'),(32,1,1,'admin','127.0.0.1',1363279944,'Field Group Created:&nbsp;Case Study Fields'),(33,1,1,'admin','127.0.0.1',1363280203,'Channel Created:&nbsp;&nbsp;Case Study'),(34,1,1,'admin','127.0.0.1',1363355314,'Logged in'),(35,1,1,'admin','127.0.0.1',1363363461,'Logged in'),(36,1,1,'admin','127.0.0.1',1364228001,'Logged in');
/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_search_index`
--

DROP TABLE IF EXISTS `exp_cp_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_search_index`
--

LOCK TABLES `exp_cp_search_index` WRITE;
/*!40000 ALTER TABLE `exp_cp_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_cp_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_detours`
--

DROP TABLE IF EXISTS `exp_detours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_detours`
--

LOCK TABLES `exp_detours` WRITE;
/*!40000 ALTER TABLE `exp_detours` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_detours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_detours_hits`
--

DROP TABLE IF EXISTS `exp_detours_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_detours_hits` (
  `hit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detour_id` int(10) unsigned DEFAULT NULL,
  `hit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`hit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_detours_hits`
--

LOCK TABLES `exp_detours_hits` WRITE;
/*!40000 ALTER TABLE `exp_detours_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_detours_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_developer_log`
--

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache`
--

LOCK TABLES `exp_email_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_mg`
--

LOCK TABLES `exp_email_cache_mg` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_mg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_ml`
--

LOCK TABLES `exp_email_cache_ml` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_console_cache`
--

LOCK TABLES `exp_email_console_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_console_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_console_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_tracker`
--

DROP TABLE IF EXISTS `exp_email_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_tracker`
--

LOCK TABLES `exp_email_tracker` WRITE;
/*!40000 ALTER TABLE `exp_email_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_ping_status`
--

DROP TABLE IF EXISTS `exp_entry_ping_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_ping_status`
--

LOCK TABLES `exp_entry_ping_status` WRITE;
/*!40000 ALTER TABLE `exp_entry_ping_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_ping_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_versioning`
--

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Safecracker_ext','form_declaration_modify_data','form_declaration_modify_data','',10,'2.1','y'),(2,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0','y'),(3,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0','y'),(4,'Rte_ext','publish_form_entry_data','publish_form_entry_data','',10,'1.0','y'),(5,'Matrix_ext','channel_entries_tagdata','channel_entries_tagdata','',10,'2.5.3','y'),(6,'Playa_ext','channel_entries_tagdata','channel_entries_tagdata','',9,'4.3.3','y'),(7,'Structure_ext','entry_submission_redirect','entry_submission_redirect','',10,'3.3.8','y'),(8,'Structure_ext','cp_member_login','cp_member_login','',10,'3.3.8','y'),(9,'Structure_ext','sessions_start','sessions_start','',10,'3.3.8','y'),(10,'Structure_ext','channel_module_create_pagination','channel_module_create_pagination','',9,'3.3.8','y'),(11,'Structure_ext','wygwam_config','wygwam_config','',10,'3.3.8','y'),(12,'Structure_ext','core_template_route','core_template_route','',10,'3.3.8','y'),(13,'Structure_ext','entry_submission_end','entry_submission_end','',10,'3.3.8','y'),(14,'Structure_ext','safecracker_submit_entry_end','safecracker_submit_entry_end','',10,'3.3.8','y'),(16,'Assets_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.0.3','y'),(17,'Assets_ext','file_after_save','file_after_save','',9,'2.0.3','y'),(18,'Assets_ext','files_after_delete','files_after_delete','',8,'2.0.3','y'),(19,'Detour_pro_ext','sessions_start','sessions_start','b:0;',1,'1.3.2','y'),(20,'Super_search_ext','entry_submission_absolute_end','entry_submission_absolute_end','',10,'2.0.5','y'),(21,'Super_search_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.0.5','y'),(22,'Super_search_ext','refresh_cache_from_template','edit_template_end','',10,'2.0.5','y'),(23,'Super_search_ext','refresh_cache_from_weblog','submit_new_entry_end','',10,'2.0.5','y'),(24,'Super_search_ext','refresh_cache_from_weblog','entry_submission_end','',10,'2.0.5','y'),(25,'Super_search_ext','refresh_cache_from_category','publish_admin_update_category','',10,'2.0.5','y'),(26,'Super_search_ext','sessions_end_processor','sessions_end','',10,'2.0.5','y'),(27,'Super_search_ext','super_search_alter_search_check_group','super_search_alter_search','',5,'2.0.5','y'),(28,'Super_search_ext','super_search_alter_search_multiselect','super_search_alter_search','',6,'2.0.5','y'),(29,'Super_search_ext','super_search_alter_search_playa','super_search_alter_search','',7,'2.0.5','y'),(30,'Super_search_ext','super_search_alter_search_relationship','super_search_alter_search','',4,'2.0.5','y'),(31,'Super_search_ext','super_search_extra_basic_fields_tag','super_search_extra_basic_fields','',5,'2.0.5','y'),(32,'Super_search_ext','super_search_alter_ids_tag','super_search_alter_ids','',5,'2.0.5','y'),(33,'Super_search_ext','super_search_do_search_and_array_playa','super_search_do_search_and_array','',5,'2.0.5','y'),(37,'Profile_ext','member_member_register','member_member_register','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(38,'Profile_ext','cp_members_member_create','cp_members_member_create','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(39,'Profile_ext','cp_js_end','cp_js_end','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(40,'Profile_ext','entry_submission_start','entry_submission_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(41,'Profile_ext','safecracker_entry_form_tagdata_start','safecracker_entry_form_tagdata_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(42,'Profile_ext','safecracker_submit_entry_start','safecracker_submit_entry_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(43,'Profile_ext','safecracker_submit_entry_end','safecracker_submit_entry_end','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(44,'Profile_ext','publish_form_entry_data','publish_form_entry_data','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(45,'Profile_ext','entry_submission_redirect','entry_submission_redirect','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',1,'1.0.7','y'),(46,'Tag_ext','delete_entries_start','delete_entries_start','',4,'4.2.1','y'),(47,'Tag_ext','sessions_end','sessions_end','',4,'4.2.1','y'),(48,'Tag_ext','entry_submission_end','entry_submission_end','',4,'4.2.1','y'),(49,'Tag_ext','cp_js_end','cp_js_end','',4,'4.2.1','y'),(50,'Freebie_ext','Freebie_ext','sessions_start','a:7:{s:9:\"to_ignore\";s:6:\"filter\";s:13:\"ignore_beyond\";s:6:\"filter\";s:14:\"break_category\";s:2:\"no\";s:14:\"remove_numbers\";s:2:\"no\";s:23:\"always_parse_pagination\";s:2:\"no\";s:12:\"always_parse\";s:0:\"\";s:13:\"cache_cleared\";s:3:\"yes\";}',10,'0.2','y');
/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_formatting`
--

DROP TABLE IF EXISTS `exp_field_formatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'xhtml'),(4,2,'none'),(5,2,'br'),(6,2,'xhtml'),(10,4,'none'),(11,4,'br'),(12,4,'xhtml'),(13,5,'none'),(14,5,'br'),(15,5,'xhtml'),(16,6,'none'),(17,6,'br'),(18,6,'xhtml'),(19,7,'none'),(20,7,'br'),(21,7,'xhtml'),(22,8,'none'),(23,8,'br'),(24,8,'xhtml'),(25,9,'none'),(26,9,'br'),(27,9,'xhtml'),(28,10,'none'),(29,10,'br'),(30,10,'xhtml'),(31,11,'none'),(32,11,'br'),(33,11,'xhtml'),(34,12,'none'),(35,12,'br'),(36,12,'xhtml'),(37,13,'none'),(38,13,'br'),(39,13,'xhtml'),(40,14,'none'),(41,14,'br'),(42,14,'xhtml'),(43,15,'none'),(44,15,'br'),(45,15,'xhtml'),(46,16,'none'),(47,16,'br'),(48,16,'xhtml'),(49,17,'none'),(50,17,'br'),(51,17,'xhtml'),(52,18,'none'),(53,18,'br'),(54,18,'xhtml'),(55,19,'none'),(56,19,'br'),(57,19,'xhtml'),(58,20,'none'),(59,20,'br'),(60,20,'xhtml'),(61,21,'none'),(62,21,'br'),(63,21,'xhtml'),(64,22,'none'),(65,22,'br'),(66,22,'xhtml'),(67,23,'none'),(68,23,'br'),(69,23,'xhtml'),(70,24,'none'),(71,24,'br'),(72,24,'xhtml'),(73,25,'none'),(74,25,'br'),(75,25,'xhtml'),(76,26,'none'),(77,26,'br'),(78,26,'xhtml');
/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Pages Fields'),(2,1,'Journal Fields'),(3,1,'Team Profile fields'),(4,1,'Result Fields'),(5,1,'Case Study Fields');
/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'multi_select','1.0','YTowOnt9','n'),(7,'checkboxes','1.0','YTowOnt9','n'),(8,'radio','1.0','YTowOnt9','n'),(9,'rel','1.0','YTowOnt9','n'),(10,'rte','1.0','YTowOnt9','n'),(11,'freeform','4.0.10','YTowOnt9','n'),(12,'matrix','2.5.2','YTowOnt9','y'),(13,'playa','4.3.3','YTowOnt9','y'),(14,'structure','3.3.8','YTowOnt9','n'),(15,'wygwam','2.7','YTowOnt9','y'),(16,'assets','2.0.3','YTowOnt9','y'),(18,'pt_dropdown','1.0.3','YTowOnt9','n'),(19,'tag','4.0.2','YTowOnt9','n');
/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_categories`
--

LOCK TABLES `exp_file_categories` WRITE;
/*!40000 ALTER TABLE `exp_file_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_dimensions`
--

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;
INSERT INTO `exp_file_dimensions` VALUES (2,1,5,'thumb','thumb','constrain',31,54,0),(3,1,3,'thumb','thumb','constrain',355,202,0),(4,1,4,'thumb','thumb','constrain',90,112,0),(5,1,4,'full','full','constrain',482,600,0),(6,1,3,'full','full','none',1054,600,0),(7,1,5,'full','full','none',344,600,0);
/*!40000 ALTER TABLE `exp_file_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_watermarks`
--

LOCK TABLES `exp_file_watermarks` WRITE;
/*!40000 ALTER TABLE `exp_file_watermarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_watermarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'dave-fravel-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-c.jpg','image/jpeg','dave-fravel-c.jpg',77709,NULL,NULL,NULL,1,1363118776,1,1364228060,'656 437'),(2,1,'dave-fravel-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-bw.jpg','image/jpeg','dave-fravel-bw.jpg',18533,NULL,NULL,NULL,1,1363118788,1,1364228060,'316 255'),(3,1,'amy-reddington-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-bw.jpg','image/jpeg','amy-reddington-bw.jpg',21177,NULL,NULL,NULL,1,1362155165,1,1364228060,'316 255'),(4,1,'amy-reddington-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-c.jpg','image/jpeg','amy-reddington-c.jpg',80783,NULL,NULL,NULL,1,1362157353,1,1364228060,'656 437'),(5,1,'chris-obrien-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-bw.jpg','image/jpeg','chris-obrien-bw.jpg',23939,NULL,NULL,NULL,1,1362155161,1,1364228060,'316 255'),(6,1,'chris-obrien-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-c.jpg','image/jpeg','chris-obrien-c.jpg',90119,NULL,NULL,NULL,1,1362157351,1,1364228060,'656 437'),(7,1,'dave-fontes-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-bw.jpg','image/jpeg','dave-fontes-bw.jpg',19917,NULL,NULL,NULL,1,1362157307,1,1364228060,'316 255'),(8,1,'dave-fontes-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-c.jpg','image/jpeg','dave-fontes-c.jpg',75420,NULL,NULL,NULL,1,1362157349,1,1364228060,'656 437'),(9,1,'emily-obrien-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-bw.jpg','image/jpeg','emily-obrien-bw.jpg',20765,NULL,NULL,NULL,1,1362155156,1,1364228060,'316 255'),(10,1,'emily-obrien-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-c.jpg','image/jpeg','emily-obrien-c.jpg',76684,NULL,NULL,NULL,1,1362157344,1,1364228060,'656 437'),(11,1,'rodrigo-passos-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-bw.jpg','image/jpeg','rodrigo-passos-bw.jpg',21010,NULL,NULL,NULL,1,1362155154,1,1364228061,'316 255'),(12,1,'rodrigo-passos-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-c.jpg','image/jpeg','rodrigo-passos-c.jpg',79479,NULL,NULL,NULL,1,1362157342,1,1364228061,'656 437'),(13,1,'sue-malomo-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-bw.jpg','image/jpeg','sue-malomo-bw.jpg',26792,NULL,NULL,NULL,1,1362155152,1,1364228061,'316 255'),(14,1,'sue-malomo-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-c.jpg','image/jpeg','sue-malomo-c.jpg',88412,NULL,NULL,NULL,1,1362157339,1,1364228061,'656 437'),(15,1,'tim-merrill-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-bw.jpg','image/jpeg','tim-merrill-bw.jpg',17438,NULL,NULL,NULL,1,1362155150,1,1364228061,'316 255'),(16,1,'tim-merrill-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-c.jpg','image/jpeg','tim-merrill-c.jpg',69183,NULL,NULL,NULL,1,1362157338,1,1364228061,'656 437'),(17,1,'BBC_large_home_full2.jpg',3,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/desktop/BBC_large_home_full2.jpg','image/jpeg','BBC_large_home_full2.jpg',301801,NULL,NULL,NULL,1,1363285825,1,1363290240,'994 1218'),(18,1,'BBC_large_home_full3.jpg',3,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/desktop/BBC_large_home_full3.jpg','image/jpeg','BBC_large_home_full3.jpg',219139,NULL,NULL,NULL,1,1363289060,1,1363290240,'864 1218'),(19,1,'bbc_mobile_1.jpg',5,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/mobile/bbc_mobile_1.jpg','image/jpeg','bbc_mobile_1.jpg',71157,NULL,NULL,NULL,1,1363289222,1,1363290231,'712 385'),(20,1,'bbc_mobile2.jpg',5,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/mobile/bbc_mobile2.jpg','image/jpeg','bbc_mobile2.jpg',68058,NULL,NULL,NULL,1,1363289222,1,1363290231,'712 385'),(21,1,'BBC_tablet_full3.jpg',4,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/tablet/BBC_tablet_full3.jpg','image/jpeg','BBC_tablet_full3.jpg',123732,NULL,NULL,NULL,1,1363289228,1,1363290211,'979 746'),(22,1,'BBC_tablet_full2.jpg',4,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/tablet/BBC_tablet_full2.jpg','image/jpeg','BBC_tablet_full2.jpg',212076,NULL,NULL,NULL,1,1363289228,1,1363290211,'1083 746'),(23,1,'amy-reddington-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-bw@2x.png','image/png','amy-reddington-bw@2x.png',164462,NULL,NULL,NULL,1,1364219818,1,1364219818,'604 482'),(24,1,'chris-obrien-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-bw@2x.png','image/png','chris-obrien-bw@2x.png',169066,NULL,NULL,NULL,1,1364220066,1,1364220066,'604 482'),(25,1,'dave-fontes-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-bw@2x.png','image/png','dave-fontes-bw@2x.png',164422,NULL,NULL,NULL,1,1364219962,1,1364219962,'604 482'),(26,1,'dave-fravel-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-bw@2x.png','image/png','dave-fravel-bw@2x.png',160239,NULL,NULL,NULL,1,1364219982,1,1364219982,'604 482'),(27,1,'emily-obrien-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-bw@2x.png','image/png','emily-obrien-bw@2x.png',166324,NULL,NULL,NULL,1,1364219901,1,1364219901,'604 482'),(28,1,'rodrigo-passos-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-bw@2x.png','image/png','rodrigo-passos-bw@2x.png',162692,NULL,NULL,NULL,1,1364219866,1,1364219866,'604 482'),(29,1,'sue-malomo-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-bw@2x.png','image/png','sue-malomo-bw@2x.png',185311,NULL,NULL,NULL,1,1364219943,1,1364219943,'604 482'),(30,1,'tim-merrill-bw@2x.png',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-bw@2x.png','image/png','tim-merrill-bw@2x.png',165847,NULL,NULL,NULL,1,1364219921,1,1364219921,'604 482');
/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_composer_layouts`
--

DROP TABLE IF EXISTS `exp_freeform_composer_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_composer_layouts`
--

LOCK TABLES `exp_freeform_composer_layouts` WRITE;
/*!40000 ALTER TABLE `exp_freeform_composer_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_composer_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_composer_templates`
--

DROP TABLE IF EXISTS `exp_freeform_composer_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_composer_templates`
--

LOCK TABLES `exp_freeform_composer_templates` WRITE;
/*!40000 ALTER TABLE `exp_freeform_composer_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_composer_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_fields`
--

DROP TABLE IF EXISTS `exp_freeform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_fields`
--

LOCK TABLES `exp_freeform_fields` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fields` DISABLE KEYS */;
INSERT INTO `exp_freeform_fields` VALUES (1,1,'name','Name','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1359649793,1363363521,'n','y','y','y','This field contains the user\'s first name.'),(2,1,'phone','Phone','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1359649793,1363363535,'n','y','y','y','This field contains the user\'s last name.'),(3,1,'email','Email','text','{\"field_length\":150,\"field_content_type\":\"email\"}',1,1359649793,0,'n','y','y','y','A basic email field for collecting stuff like an email address.'),(4,1,'user_message','Message','textarea','{\"field_ta_rows\":6}',1,1359649793,0,'n','y','y','y','This field contains the user\'s message.');
/*!40000 ALTER TABLE `exp_freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_fieldtypes`
--

DROP TABLE IF EXISTS `exp_freeform_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldtype_name` varchar(250) DEFAULT NULL,
  `settings` text,
  `default_field` char(1) NOT NULL DEFAULT 'n',
  `version` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`fieldtype_id`),
  KEY `fieldtype_name` (`fieldtype_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_fieldtypes`
--

LOCK TABLES `exp_freeform_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_freeform_fieldtypes` VALUES (1,'checkbox','[]','n','4.0.10'),(2,'checkbox_group','[]','n','4.0.10'),(3,'country_select','[]','n','4.0.10'),(4,'file_upload','[]','n','4.0.10'),(5,'hidden','[]','n','4.0.10'),(6,'mailinglist','[]','n','4.0.10'),(7,'multiselect','[]','n','4.0.10'),(8,'province_select','[]','n','4.0.10'),(9,'radio','[]','n','4.0.10'),(10,'select','[]','n','4.0.10'),(11,'state_select','[]','n','4.0.10'),(12,'text','[]','n','4.0.10'),(13,'textarea','[]','n','4.0.10');
/*!40000 ALTER TABLE `exp_freeform_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_file_uploads`
--

DROP TABLE IF EXISTS `exp_freeform_file_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_file_uploads`
--

LOCK TABLES `exp_freeform_file_uploads` WRITE;
/*!40000 ALTER TABLE `exp_freeform_file_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_file_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_form_entries_1`
--

DROP TABLE IF EXISTS `exp_freeform_form_entries_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_form_entries_1`
--

LOCK TABLES `exp_freeform_form_entries_1` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` DISABLE KEYS */;
INSERT INTO `exp_freeform_form_entries_1` VALUES (1,1,0,'y','127.0.0.1',1359649793,0,'pending','Jake','Solspace','support@solspace.com','Welcome to Freeform. We hope that you will enjoy Solspace software.'),(2,1,1,'y','127.0.0.1',1363367665,0,'pending','aaa','aaa','aaa@aaa.com','aaaa'),(3,1,1,'y','127.0.0.1',1363367778,0,'pending','asds','5082469047','rpassos@20miletech.com','dasdsadasdas'),(4,1,1,'y','127.0.0.1',1363369420,0,'pending','aaaa','adadas','aaa@aaa.com','fsdlkjflsf');
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_forms`
--

DROP TABLE IF EXISTS `exp_freeform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_forms`
--

LOCK TABLES `exp_freeform_forms` WRITE;
/*!40000 ALTER TABLE `exp_freeform_forms` DISABLE KEYS */;
INSERT INTO `exp_freeform_forms` VALUES (1,1,'contact','Contact','pending','n','y','',0,1,'smalomo@20miletech.com','This is a basic contact form.','1|2|3|4',NULL,0,0,1,1359649793,0,NULL);
/*!40000 ALTER TABLE `exp_freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_multipage_hashes`
--

DROP TABLE IF EXISTS `exp_freeform_multipage_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_multipage_hashes`
--

LOCK TABLES `exp_freeform_multipage_hashes` WRITE;
/*!40000 ALTER TABLE `exp_freeform_multipage_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_multipage_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_notification_templates`
--

DROP TABLE IF EXISTS `exp_freeform_notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_notification_templates`
--

LOCK TABLES `exp_freeform_notification_templates` WRITE;
/*!40000 ALTER TABLE `exp_freeform_notification_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_params`
--

DROP TABLE IF EXISTS `exp_freeform_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`params_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
INSERT INTO `exp_freeform_params` VALUES (59,1363889234,'{\"form_id\":\"1\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"contact\",\"inline_error_return\":\"contact\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"name|email|phone|user_message\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"smalomo@20miletech.com\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":true,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"1\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}');
/*!40000 ALTER TABLE `exp_freeform_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_preferences`
--

DROP TABLE IF EXISTS `exp_freeform_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) DEFAULT NULL,
  `preference_value` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  KEY `preference_name` (`preference_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_preferences`
--

LOCK TABLES `exp_freeform_preferences` WRITE;
/*!40000 ALTER TABLE `exp_freeform_preferences` DISABLE KEYS */;
INSERT INTO `exp_freeform_preferences` VALUES (1,'ffp','y',0);
/*!40000 ALTER TABLE `exp_freeform_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_user_email`
--

DROP TABLE IF EXISTS `exp_freeform_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_user_email`
--

LOCK TABLES `exp_freeform_user_email` WRITE;
/*!40000 ALTER TABLE `exp_freeform_user_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_user_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_global_variables`
--

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;
INSERT INTO `exp_global_variables` VALUES (1,1,'company_phone_number','508.419.7439'),(2,1,'company_email_address','info@20mile.in'),(3,1,'company_address','901 Main St Osterville, MA 02655'),(4,1,'company_address_map_link','https://maps.google.com/maps?q=901+Main+St+Osterville,+MA+02655&ie=UTF-8&hq=&hnear=0x89fb3286cf0712b9:0x55b7f70c945efeee,901+Main+St,+Osterville,+MA+02655&gl=us&ei=VDw_UZP9I6Xb0wGnw4H4Dg&ved=0CDEQ8gEwAA'),(5,1,'copywrite','&copy; 2013 20Mile Interactive. All rights reserved.'),(6,1,'job_ticker','We\'re currently hiring new <br>\n20Milers. Please take a look at our <br>\n<a href=\"#\">open positions</a>.');
/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_html_buttons`
--

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` VALUES (1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');
/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_matrix_cols`
--

DROP TABLE IF EXISTS `exp_matrix_cols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_matrix_cols`
--

LOCK TABLES `exp_matrix_cols` WRITE;
/*!40000 ALTER TABLE `exp_matrix_cols` DISABLE KEYS */;
INSERT INTO `exp_matrix_cols` VALUES (4,1,25,NULL,'fact','Fact','','text','n','n',0,'100%','YTozOntzOjQ6Im1heGwiO3M6MjoiNTAiO3M6MzoiZm10IjtzOjQ6Im5vbmUiO3M6MzoiZGlyIjtzOjM6Imx0ciI7fQ==');
/*!40000 ALTER TABLE `exp_matrix_cols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_matrix_data`
--

DROP TABLE IF EXISTS `exp_matrix_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_matrix_data`
--

LOCK TABLES `exp_matrix_data` WRITE;
/*!40000 ALTER TABLE `exp_matrix_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_matrix_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_bulletin_board`
--

LOCK TABLES `exp_member_bulletin_board` WRITE;
/*!40000 ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_data`
--

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_fields`
--

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_groups`
--

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` VALUES (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');
/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_homepage`
--

DROP TABLE IF EXISTS `exp_member_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_homepage`
--

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;
INSERT INTO `exp_member_homepage` VALUES (1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0),(2,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(3,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(4,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(5,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(6,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(7,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(8,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(9,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0);
/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_search`
--

LOCK TABLES `exp_member_search` WRITE;
/*!40000 ALTER TABLE `exp_member_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_members`
--

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` VALUES (1,1,'admin','Admin','ddff76872107e2d87d7786bb260a8350e91552b36da402f8ae3666248a69f9e53f27943dc8889955c0eca7c77a734cba29c6ec56ff52cff5513fa9e4a0e660f9','KI&X_p6^L!Eo5<Q%.MfHZx)S}hM3%D{!F$XEk#bgRf|p@Ce@;m%/H`GIP6=\\^;Ot}\'nc(CRs.Haw|&xijDvG]CxN$|a.ZXC-qg)<{cayUp;#H%nnEuERdVg-!:Lp^cPw','d9490be546faec262aefce9c499d3b9b3b9167ab','15686ae21e2b99568206625ea60c23382bf7a3be',NULL,'smalomo@20miletech.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359648902,1363373912,1364230053,8,0,0,0,1363285850,0,0,0,'n','y','y','y','y','n','n','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','','Structure|C=addons_modules&M=show_module_cp&module=structure|1\nForms|C=addons_modules&M=show_module_cp&module=freeform|2','n',0,'y',0),(2,1,'dfravel','Dave Fravel','8a97a667124bd17ca1fb24623736a80e0a25ec5b71ac01238e1d76a6d860cca909f6e0ed2396bbb3024300bc5ff35894358d2d7ed9b4956287b053d3f2121aeb','_S|9uO5tszG]|>t\'$rCxGteEw6&@TN&*\\b9+\\kO;<A7?Y2/<cGxC<G~~M~=Hg!`>@r7Eg&e7X-@,Qep%\"EWy]Jpx9eU2E]0-,e9jn#B!gtU1nq!,u6;+YuN\':Hvz!ywT','b30011d8a486782eb76e393946dfc93c061dd9f7','2b6e480d70e907b413cc021301238cebf6cbb283',NULL,'dave@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359839594,0,0,3,0,0,0,1363267791,0,0,0,'n','y','y','y','y','n','n','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'rpassos','Rodrigo Passos','ee54bb05517ed9d806dae4263574a16cc6bfc6f281b1e6614984eb69af1e553662f1749703bdfcb4828ca8cb2ccfc13e77cdfb37224911dd69e2408ca0ea16cb','O@@7M(,0_(;Kgcb0q8rI+aZszt/Hs:vw;X|3rUkr0g]c6fQjr{Ap_GEa1Ws&0DH&?RX9>V`)K|<3EXm3\'[IsRu\\!>3<T]|rnCa`~{+!zI\\D^jHn&j$o*}d0=]E:N3``Q','307903d76f36e6b7b4fac7e90539a65d2502aedd','c3d47658b84eaf0fe9472575006ac615b41a41b8',NULL,'rodrigo@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359839975,0,0,2,0,0,0,1363276599,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'tmerrill','Tim Merrill','e14b9fddf8dac30c6eff052000645aeb00f87864e2aa391cbe6731bc229213c2f36a34cdcc2b64c670b26fa8c1919d2c964654cd77082a2c08becdeb4d851a24','v5#.V^qn)BFf\'.5u~1Ox(G~a2-A(\'W2{k6/JhTLClM2f80u#d{TJC1+dEabKKk@z@J[R6wvo:GNIZ<{vG[M%Mx~vb:?bX][4EK&k2MUK7!Rg{PUu{uTv2@u^ny,O1-7l','6c71da722f5567ebcd708f2325e25df2531e9724','2252b38e11ac0d51d1ee04bb47c3b7f7d1629b2b',NULL,'tim@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359840014,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'smalomo','Sue Malomo','0e5acadce66e5b28a8bbde659dd6602cb58c06644a25821a5cf5e937b140f53826f2fd9bc50b886e4b3d9d15d5fb447b33119c3e2ef80a55531bc9b7bcfe8616','g\"v%0O.)qK71Cn<!|y[Zv9_Hjj(hx$5n[Z#i\\b6m>HB?}LZyf4-gQq1FAu}9P^I:Sm*<aH?mN1h4tmiq367\",VoV%p?*#=H?.|r:QmYbSVeK@hEq:vdPICTG#.McOq\"K','f4fe34758492b28cc67482d4e046bbb4729a6b66','ca8603258609be03ae33c426308dd1cbb133583a',NULL,'sue@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841487,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'dfontes','David Fontes','c889635b55af84950ec5866424ed9a8956c6ba3954f8595faf2b32ae02f1689351547068f720018e43e08a8e9284d9f617d90480b3a2c99632d78eb3b4d9b6e3',')y4]aZ?u))]\"$>zL\"iYeH6|iCTF5<,)@l2\\<g37jYzbxn((k5\"By@ubZr{x.\\QXp`zoX#W9\\U@}pPIF8D85h)SES-n~aGmK*UU,FO\'*h.e,o#dQQl|acQy*%e;S`5q3a','05c56a5bf1cb286f621f1f9b23f21fdcb4aaa251','c39f06062fd3fbbd3b046b8a0a66876748e40110',NULL,'david@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841521,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(7,1,'areddington','Amy Reddington','0e48321ccf7ece9d595e5d7a8d5925df88bd1fc1fd33d94476f01770c491367608c392ff9c70ca40c9f739bbea8ffd8c2b2d76c7db3798fac27048653d249fb9','D5\"TqUC9q|PE6O[L=awZ7MEj+lznFLy+Lk%_{2uH@l)}+lwAQ@#5l*<,RiF#GP/^@GzWd{EC/6so[E>]w<#Sk&Fn09JLT;]{S$~Z_b\"m.S;-d<ogHSf!o_E4;42J3#,}','2dfa6b38a849bed8e05fe4bce70aa7d72e9638d3','a062ad15b6130c5a389439b2355539c3d6940f34',NULL,'amy@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841547,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(8,1,'cobrien','Chris OBrien','628da4d188ef939962cca92aaeff3203b9ab48e4ad3ce0762f07175ca0405d708dc426e4797ceac5b993f6f2df84bf6d18ed8277c4de3a58260a29d193d91a3c','Hj8FrFyl)nQ?88zvA%FTiFr\"6jtGL(`PY\\,Zye-xkinW{{Y\"5FBBs2CP91>p~;$Vn!-YA:-uI}0<2V&$\'-!J&eJ\\D!`jG7RE:&{R&:%sO-FbgD3XuSx$Ks?N&vQM}qi}','c7889cdfb2488e6e9730c451d60d84142364b61c','4e7807b8f08fa7931bc8bc78d77be0b02e55345a',NULL,'chris@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841576,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(9,1,'eobrien','Emily OBrien','ef8bf4b51d507ce898e080994029b6918f982c2e840360c6e00d1177c34e5130982b0c8b5f74b5ac753042205c7db0672d807d368f1b9d2b5ccc4639a8704a0e','|$I}!mos*BOJIHQR[##Q\'Q/}&6B/p\"b\"A\'g9gToIEo!_dtSDhKe*DA,jk.}D|y~4hSlz0@|(}q`l:sQoukRt\"TKG?/D^C@BZdxoe1w~Hd\'v$2``(&\'@*hsAwG,1F7ZPi','60936104c6596551bd48a8604d78ea388e286707','f9897a76af3339e90c6aacc1cbb26bc84223fa06',NULL,'emily@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841601,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0);
/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_attachments`
--

LOCK TABLES `exp_message_attachments` WRITE;
/*!40000 ALTER TABLE `exp_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_copies`
--

LOCK TABLES `exp_message_copies` WRITE;
/*!40000 ALTER TABLE `exp_message_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_data`
--

LOCK TABLES `exp_message_data` WRITE;
/*!40000 ALTER TABLE `exp_message_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_folders`
--

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;
INSERT INTO `exp_message_folders` VALUES (1,'InBox','Sent','','','','','','','','');
/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_listed`
--

LOCK TABLES `exp_message_listed` WRITE;
/*!40000 ALTER TABLE `exp_message_listed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_listed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_module_member_groups`
--

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Email','2.0','n','n'),(2,'File','1.0.0','n','n'),(3,'Jquery','1.0','n','n'),(4,'Query','2.0','n','n'),(5,'Rss','2.0','n','n'),(6,'Safecracker','2.1','y','n'),(7,'Search','2.2','n','n'),(8,'Channel','2.0.1','n','n'),(9,'Member','2.1','n','n'),(10,'Stats','2.0','n','n'),(11,'Rte','1.0','y','n'),(12,'Freeform','4.0.11','y','n'),(13,'Playa','4.3.3','n','n'),(14,'Structure','3.3.8','y','y'),(15,'Wygwam','2.7','y','n'),(16,'Assets','2.0.3','y','n'),(17,'Detour_pro','1.3.2','y','n'),(18,'Super_search','2.0.5','y','y'),(20,'Profile','1.0.7','y','n'),(21,'Safeharbor','1.3.3','y','n'),(22,'Tag','4.2.1','y','y');
/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` VALUES (65,1,0,'n','','127.0.0.1',1364230581,''),(66,1,0,'n','','127.0.0.1',1364230581,''),(67,1,0,'n','','127.0.0.1',1364230581,''),(68,1,0,'n','','127.0.0.1',1364230581,''),(69,1,0,'n','','127.0.0.1',1364230581,''),(70,1,0,'n','','127.0.0.1',1364230581,''),(71,1,0,'n','','127.0.0.1',1364230581,''),(72,1,0,'n','','127.0.0.1',1364230581,''),(73,1,0,'n','','127.0.0.1',1364230581,''),(74,1,1,'n','Admin','127.0.0.1',1364230176,''),(75,1,1,'n','Admin','127.0.0.1',1364230176,'');
/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
INSERT INTO `exp_password_lockout` VALUES (1,1363363455,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.160 Safari/537.22','admin');
/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ping_servers`
--

DROP TABLE IF EXISTS `exp_ping_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_ping_servers`
--

LOCK TABLES `exp_ping_servers` WRITE;
/*!40000 ALTER TABLE `exp_ping_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_ping_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_playa_relationships`
--

DROP TABLE IF EXISTS `exp_playa_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_playa_relationships`
--

LOCK TABLES `exp_playa_relationships` WRITE;
/*!40000 ALTER TABLE `exp_playa_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_playa_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_remember_me`
--

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_reset_password`
--

LOCK TABLES `exp_reset_password` WRITE;
/*!40000 ALTER TABLE `exp_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_revision_tracker`
--

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_tools`
--

DROP TABLE IF EXISTS `exp_rte_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_tools`
--

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;
INSERT INTO `exp_rte_tools` VALUES (1,'Blockquote','Blockquote_rte','y'),(2,'Bold','Bold_rte','y'),(3,'Headings','Headings_rte','y'),(4,'Image','Image_rte','y'),(5,'Italic','Italic_rte','y'),(6,'Link','Link_rte','y'),(7,'Ordered List','Ordered_list_rte','y'),(8,'Underline','Underline_rte','y'),(9,'Unordered List','Unordered_list_rte','y'),(10,'View Source','View_source_rte','y');
/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_toolsets`
--

DROP TABLE IF EXISTS `exp_rte_toolsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_toolsets`
--

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;
INSERT INTO `exp_rte_toolsets` VALUES (1,0,'Default','3|2|5|1|9|7|6|4|10','y');
/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_safeharbor_backups`
--

DROP TABLE IF EXISTS `exp_safeharbor_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_safeharbor_backups`
--

LOCK TABLES `exp_safeharbor_backups` WRITE;
/*!40000 ALTER TABLE `exp_safeharbor_backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_safeharbor_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_safeharbor_hash`
--

DROP TABLE IF EXISTS `exp_safeharbor_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_safeharbor_hash` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL,
  `hash` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_safeharbor_hash`
--

LOCK TABLES `exp_safeharbor_hash` WRITE;
/*!40000 ALTER TABLE `exp_safeharbor_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_safeharbor_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_safeharbor_indexes`
--

DROP TABLE IF EXISTS `exp_safeharbor_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_safeharbor_indexes` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `backup_id` int(6) unsigned NOT NULL,
  `file` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_safeharbor_indexes`
--

LOCK TABLES `exp_safeharbor_indexes` WRITE;
/*!40000 ALTER TABLE `exp_safeharbor_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_safeharbor_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_safeharbor_messages`
--

DROP TABLE IF EXISTS `exp_safeharbor_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_safeharbor_messages` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL,
  `message` varchar(512) NOT NULL,
  `date` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_safeharbor_messages`
--

LOCK TABLES `exp_safeharbor_messages` WRITE;
/*!40000 ALTER TABLE `exp_safeharbor_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_safeharbor_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_safeharbor_settings`
--

DROP TABLE IF EXISTS `exp_safeharbor_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_safeharbor_settings`
--

LOCK TABLES `exp_safeharbor_settings` WRITE;
/*!40000 ALTER TABLE `exp_safeharbor_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_safeharbor_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search`
--

LOCK TABLES `exp_search` WRITE;
/*!40000 ALTER TABLE `exp_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search_log`
--

LOCK TABLES `exp_search_log` WRITE;
/*!40000 ALTER TABLE `exp_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=1943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (1847,1364228001,'0','15f49f11fa19ba1d1b04c987d7799a96622b84b2'),(1848,1364228001,'2e83986a040341d34d98840adad1d4f5d838a6a7','8e45af1ca2c9b5ac425c6f69e1717fe6b7b69763'),(1849,1364228006,'2e83986a040341d34d98840adad1d4f5d838a6a7','19c81d785d1c55caeab82e1277947c4ab9dc1893'),(1850,1364228008,'2e83986a040341d34d98840adad1d4f5d838a6a7','e9cc64972b172d8c888149654a4efc2d0abb59a7'),(1851,1364228008,'2e83986a040341d34d98840adad1d4f5d838a6a7','be794c6be03b0c673ce7a4bf55266c0f0f6bb462'),(1852,1364228008,'2e83986a040341d34d98840adad1d4f5d838a6a7','711802af258009a8576b3f7bbeb7bfeed1020208'),(1853,1364228009,'2e83986a040341d34d98840adad1d4f5d838a6a7','805417fce5fdf52431fcc20ca88eef432ac95777'),(1854,1364228015,'2e83986a040341d34d98840adad1d4f5d838a6a7','381bfb43e8ed38ccb6e37f6869b1bc9e830a9ac6'),(1855,1364228054,'2e83986a040341d34d98840adad1d4f5d838a6a7','d64ebecbfe5852429446becdfc18f51679b3da4b'),(1856,1364228056,'2e83986a040341d34d98840adad1d4f5d838a6a7','a0c665c92046efea49eea8f2001886ff7936c725'),(1857,1364228060,'2e83986a040341d34d98840adad1d4f5d838a6a7','bd5beaa3ff9f58e4b54123fb1dccd3671e1ece21'),(1858,1364228060,'2e83986a040341d34d98840adad1d4f5d838a6a7','a74ca19f6ba67cf6cb2cda437089a86300c43d98'),(1859,1364228060,'2e83986a040341d34d98840adad1d4f5d838a6a7','b80d62fb0873d1a344732332f0e4cd53ce994ea8'),(1860,1364228061,'2e83986a040341d34d98840adad1d4f5d838a6a7','8cf6dd066c46b8cf755e4f733086c371e0c5b198'),(1861,1364228061,'2e83986a040341d34d98840adad1d4f5d838a6a7','ecb9fe1f7dc3282b3a323a3a94f72d22a678214c'),(1862,1364228062,'2e83986a040341d34d98840adad1d4f5d838a6a7','4557de1941a712a72a1d87f083e2407516c9d592'),(1863,1364228064,'2e83986a040341d34d98840adad1d4f5d838a6a7','5737e9ef099a9ff7e8ea112229d824a60cd62ace'),(1864,1364228067,'2e83986a040341d34d98840adad1d4f5d838a6a7','7ff12cfe2ef91c272e106544113f66fa9a6aeeb6'),(1868,1364228070,'2e83986a040341d34d98840adad1d4f5d838a6a7','c70108751f3a6b3912dd5a6fb3baba6bf7a77f2f'),(1874,1364228074,'2e83986a040341d34d98840adad1d4f5d838a6a7','49ee17128f31ab823c56613bbcd4151259e31576'),(1875,1364228075,'2e83986a040341d34d98840adad1d4f5d838a6a7','7b8ea267350769f09759d78fbafa7c47ef1b6caa'),(1876,1364228076,'2e83986a040341d34d98840adad1d4f5d838a6a7','883fb36aa76a3a2f1f4801fd9330c58a13a462f9'),(1877,1364228077,'2e83986a040341d34d98840adad1d4f5d838a6a7','bcb44ff13e030802aaa921fd2cf9ef5adf842d7b'),(1878,1364228078,'2e83986a040341d34d98840adad1d4f5d838a6a7','b941ea4467cec0c3bb90d2c499ef04b8623a9146'),(1879,1364228078,'2e83986a040341d34d98840adad1d4f5d838a6a7','3f4386c61e3f57845176ca20f2bcad16ccc68635'),(1880,1364228078,'2e83986a040341d34d98840adad1d4f5d838a6a7','1ef78e7a06591ae4faa80ded14ecf741efbfbf6e'),(1881,1364228078,'2e83986a040341d34d98840adad1d4f5d838a6a7','ab2e331efc0aef2690b6a76215f475aa5febb4df'),(1882,1364228078,'2e83986a040341d34d98840adad1d4f5d838a6a7','d726feb1e0352c6c9ffbc1545d35da3435617651'),(1883,1364228078,'2e83986a040341d34d98840adad1d4f5d838a6a7','7ec17ecfb927e59e06bf31937e6562a7cbdee1c3'),(1884,1364228079,'2e83986a040341d34d98840adad1d4f5d838a6a7','a5d3b52167113057495ad24fafaceaedbe2098eb'),(1885,1364228079,'2e83986a040341d34d98840adad1d4f5d838a6a7','4664a4166dc536d8cffc2a6478f416fae298de49'),(1886,1364228079,'2e83986a040341d34d98840adad1d4f5d838a6a7','4c2ba4cad462daa293e1c18e6e21bae957fd7cb8'),(1887,1364228079,'2e83986a040341d34d98840adad1d4f5d838a6a7','73ca6a9308626ce8fdb518b4e5c1b61453b1c44b'),(1888,1364228079,'2e83986a040341d34d98840adad1d4f5d838a6a7','3ab23acbd0b445e678d723e6633fe94efd43e656'),(1889,1364228079,'2e83986a040341d34d98840adad1d4f5d838a6a7','bf8be8fc17ce7990a5e05648bb8d9861e970afb5'),(1890,1364228080,'2e83986a040341d34d98840adad1d4f5d838a6a7','aea2faf151fb9ffd747ac7025b44887be19e3e2e'),(1891,1364228080,'2e83986a040341d34d98840adad1d4f5d838a6a7','96852d53cc2800b4bb916e27374fb9edfc0e90f2'),(1892,1364228080,'2e83986a040341d34d98840adad1d4f5d838a6a7','abcda90a05297002c83d3d963ea81ae6b93a2976'),(1893,1364228080,'2e83986a040341d34d98840adad1d4f5d838a6a7','6ad3f407e50bd648be5da1a0fca4b6a6d25f9bac'),(1894,1364228082,'2e83986a040341d34d98840adad1d4f5d838a6a7','8903106fd56fd0f5d8b7625ed5991ae5a5de5f6d'),(1895,1364228082,'2e83986a040341d34d98840adad1d4f5d838a6a7','0654b7491617b76e40708097aa525c713342602a'),(1896,1364228082,'2e83986a040341d34d98840adad1d4f5d838a6a7','914e4a9a0faef8f178876a0ae46a82966090f396'),(1897,1364228082,'2e83986a040341d34d98840adad1d4f5d838a6a7','5078ab85d9ff0c0c6b86fd371d093d0ff8cffa1b'),(1898,1364228082,'2e83986a040341d34d98840adad1d4f5d838a6a7','065724c5122728f1e6fa4f00ade894931dfa3c0c'),(1899,1364228082,'2e83986a040341d34d98840adad1d4f5d838a6a7','9d744beb5028b61bc410aa4554e51a1256bd80a8'),(1900,1364228085,'2e83986a040341d34d98840adad1d4f5d838a6a7','9cf9c7edf68c88873ea7a2dc300b49a47a3ae422'),(1901,1364228086,'2e83986a040341d34d98840adad1d4f5d838a6a7','d059ca16bf5472a90f0fa4bc581a4c8c998e53df'),(1902,1364228094,'2e83986a040341d34d98840adad1d4f5d838a6a7','994aba79c5acc9060b7e5b3773acb87027c63171'),(1903,1364228095,'2e83986a040341d34d98840adad1d4f5d838a6a7','3a548da2b77411653fbdbf2217e68c093740c521'),(1904,1364228100,'2e83986a040341d34d98840adad1d4f5d838a6a7','386c4e15766e9c2b28159b2b3f14c0b98c0d5d2d'),(1905,1364228102,'2e83986a040341d34d98840adad1d4f5d838a6a7','61eb442acc03241720331e3dcb812fd1d5a10b34'),(1906,1364228107,'2e83986a040341d34d98840adad1d4f5d838a6a7','9e21ec2946967aaecdf4abd46f75cbd2b1a9580a'),(1907,1364228107,'2e83986a040341d34d98840adad1d4f5d838a6a7','34f399efd39b1c24484b49e86440631afdd9cbf3'),(1908,1364228109,'2e83986a040341d34d98840adad1d4f5d838a6a7','49c93d3afaa17480dc49d35a7e07da87ae3ff57c'),(1909,1364228110,'2e83986a040341d34d98840adad1d4f5d838a6a7','c6d62f6f37b13ed315b4204d3a935da64e2c592e'),(1910,1364228115,'2e83986a040341d34d98840adad1d4f5d838a6a7','56b49e63f6e7732748f92de92c3784db905b23b6'),(1911,1364228118,'2e83986a040341d34d98840adad1d4f5d838a6a7','eb86c55a7cb670f7e9264dc3bf2c44d3fe45f88b'),(1912,1364228119,'2e83986a040341d34d98840adad1d4f5d838a6a7','349d948f632a4caa5bf305671f807a945e011976'),(1913,1364228119,'2e83986a040341d34d98840adad1d4f5d838a6a7','e4795e3bcdaac5fa9f48486a87cfbe95fdf8a636'),(1914,1364228121,'2e83986a040341d34d98840adad1d4f5d838a6a7','1832d60a89f49de9d4431b5ef05eadf3ebb56c2e'),(1915,1364228121,'2e83986a040341d34d98840adad1d4f5d838a6a7','67e94f2045bce570192642535a837e500e9fd9a9'),(1916,1364228127,'2e83986a040341d34d98840adad1d4f5d838a6a7','b885624971ebb43a83c590075b35be5fb6d0d460'),(1917,1364228129,'2e83986a040341d34d98840adad1d4f5d838a6a7','60ef997163731c8503abaf7b813bd61ef2d596b2'),(1918,1364228132,'2e83986a040341d34d98840adad1d4f5d838a6a7','55ab24a63a46808a75d50d89f574acbb7e7dc4a8'),(1919,1364228132,'2e83986a040341d34d98840adad1d4f5d838a6a7','cfe2de4989f138b6622271767d9872354ade23f4'),(1920,1364228133,'2e83986a040341d34d98840adad1d4f5d838a6a7','b5a3a4ec12dfb3e86481d8999a689cfc33fd2771'),(1921,1364228134,'2e83986a040341d34d98840adad1d4f5d838a6a7','a595eed82768b384030d2509b13b5b3f2e49bbdc'),(1922,1364228141,'2e83986a040341d34d98840adad1d4f5d838a6a7','b4be0cd474a7768c3fb9e6025bde7f0935c9d8e2'),(1923,1364228145,'2e83986a040341d34d98840adad1d4f5d838a6a7','da76b52c3c2cd75a8e7da6c09b10b0dc1898b978'),(1924,1364228147,'2e83986a040341d34d98840adad1d4f5d838a6a7','c86dd94a72eacb0d9434c595a959ad0e13b3c863'),(1925,1364228147,'2e83986a040341d34d98840adad1d4f5d838a6a7','89f112471404a12afdeb8a2764d8ed62e50ddc74'),(1926,1364228148,'2e83986a040341d34d98840adad1d4f5d838a6a7','cd8b5e0c5c9186ca5cbd956c302247d5dbcae565'),(1927,1364228149,'2e83986a040341d34d98840adad1d4f5d838a6a7','431afa0d4a96c19cc9beda95b65ecd669ba33f67'),(1928,1364228154,'2e83986a040341d34d98840adad1d4f5d838a6a7','ba76f50e401e0fad9f8ec5530dcdc0a1ffb1fe60'),(1929,1364228155,'2e83986a040341d34d98840adad1d4f5d838a6a7','ec979e007b6e89127f70b71e14bf6f9dce5c582c'),(1930,1364228156,'2e83986a040341d34d98840adad1d4f5d838a6a7','03fdf6fbf7c182ac0501f11a4e72bc341905c3c9'),(1931,1364228157,'2e83986a040341d34d98840adad1d4f5d838a6a7','66266d0d33c7976215e2d7dd15171fcfbab84123'),(1932,1364228158,'2e83986a040341d34d98840adad1d4f5d838a6a7','d0f5dd060615fbc198a1036e40bb5afcc387553d'),(1933,1364228163,'2e83986a040341d34d98840adad1d4f5d838a6a7','9d886ffdda5ca53f5dfa9d24e8bc317180418770'),(1934,1364228164,'2e83986a040341d34d98840adad1d4f5d838a6a7','d5a9500f32fedf330af9a2cf939dade00c371f9b'),(1935,1364228165,'2e83986a040341d34d98840adad1d4f5d838a6a7','1a0681873037817c0d74d73e9e1b87d67c1c9b3c'),(1936,1364228166,'2e83986a040341d34d98840adad1d4f5d838a6a7','be29dd9bf8398bfe2e27eadd29c8023753357475'),(1937,1364228167,'2e83986a040341d34d98840adad1d4f5d838a6a7','c012707b976e454cf059ee0b7e6c84878cd880a2'),(1938,1364228172,'2e83986a040341d34d98840adad1d4f5d838a6a7','083731569c5926803e32d41d26240d999f0c0f18'),(1939,1364228174,'2e83986a040341d34d98840adad1d4f5d838a6a7','2eb836fa7ac40922f8c3dea55732a3952bd03576'),(1940,1364228174,'2e83986a040341d34d98840adad1d4f5d838a6a7','e6771cc821027ec732bb6cc2ee3287100fde727c'),(1941,1364228175,'2e83986a040341d34d98840adad1d4f5d838a6a7','6406428e397aea158389820c6d6c2d6f4af8d707'),(1942,1364228176,'2e83986a040341d34d98840adad1d4f5d838a6a7','f9e729cc804247d06462b6e9a0e8f67cb1bc8e5a');
/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sessions`
--

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
INSERT INTO `exp_sessions` VALUES ('2e83986a040341d34d98840adad1d4f5d838a6a7',1,1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1364230176);
/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sites`
--

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` VALUES (1,'20Mile Interactive','default_site',NULL,'YTo5NDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjk6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjM2OiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyMjoic21hbG9tb0AyMG1pbGV0ZWNoLmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6NDU6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjU0OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJuIjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToidGltZV9mb3JtYXQiO3M6MjoidXMiO3M6MTU6InNlcnZlcl90aW1lem9uZSI7czozOiJVTTUiO3M6MTM6InNlcnZlcl9vZmZzZXQiO3M6MDoiIjtzOjE2OiJkYXlsaWdodF9zYXZpbmdzIjtzOjE6Im4iO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czozOiJVTTUiO3M6MTY6ImRlZmF1bHRfc2l0ZV9kc3QiO3M6MToibiI7czoxNToiaG9ub3JfZW50cnlfZHN0IjtzOjE6InkiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjg6ImNwX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MjE6ImVtYWlsX21vZHVsZV9jYXB0Y2hhcyI7czoxOiJuIjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTI6InNlY3VyZV9mb3JtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6NDQ6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToibiI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjQ1OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjIwOiJ1c2VfaWdub3JlX3dvcmRfbGlzdCI7czoxOiJ5IjtzOjE2OiJpZ25vcmVfd29yZF9saXN0IjtzOjE5OiJhfHxhbmR8fG9mfHxvcnx8dGhlIjt9','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjIxOiJub21lbWJlcnJlZ2lzdHJhdGlvbnMiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJuIjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjQ0OiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6NTM6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGV0ZWNoLm5ldC8yMG1pbGUvaW1hZ2VzL2F2YXRhcnMvIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjUwOiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo1OToiL3Zhci93d3cvdmhvc3RzLzIwbWlsZXRlY2gubmV0LzIwbWlsZS9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTU6InBob3RvX21heF93aWR0aCI7czozOiIxMDAiO3M6MTY6InBob3RvX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEyOiJwaG90b19tYXhfa2IiO3M6MjoiNTAiO3M6MTY6ImFsbG93X3NpZ25hdHVyZXMiO3M6MToibiI7czoxMzoic2lnX21heGxlbmd0aCI7czozOiI1MDAiO3M6MjE6InNpZ19hbGxvd19pbWdfaG90bGluayI7czoxOiJuIjtzOjIwOiJzaWdfYWxsb3dfaW1nX3VwbG9hZCI7czoxOiJuIjtzOjExOiJzaWdfaW1nX3VybCI7czo1ODoiaHR0cDovLzIwbWlsZS4yMG1pbGV0ZWNoLm5ldC9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjY3OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6NjA6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGV0ZWNoLm5ldC8yMG1pbGUvaW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToibiI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxNzoidG90YWxfZm9ydW1fcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo0ODoiL3Zhci93d3cvdmhvc3RzLzIwbWlsZXRlY2gubmV0LzIwbWlsZS90ZW1wbGF0ZXMvIjt9','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToyOntzOjcyOiIvVXNlcnMvcm9kcmlnb3Bhc3Nvcy9Eb2N1bWVudHMvUmVwb3NpdG9yaWVzLzIwbWlsZS9wdWJsaWNfaHRtbC9pbmRleC5waHAiO3M6MzI6IjNlNDQyNjRkYmExNDdhOGM3YTVlODliMTlkOTRhOTkxIjtzOjc6ImVtYWlsZWQiO2E6MDp7fX0=','YToxOntpOjE7YTozOntzOjM6InVybCI7czoxNDoiaHR0cDovLzIwbWlsZS8iO3M6NDoidXJpcyI7YToxODp7aToxMDtzOjE6Ii8iO2k6MTE7czoxMDoiL2V4cGVydGlzZSI7aToxMjtzOjg6Ii9yZXN1bHRzIjtpOjEzO3M6NToiL3RlYW0iO2k6MTtzOjE3OiIvdGVhbS9kYXZlLWZyYXZlbCI7aTo0O3M6MTY6Ii90ZWFtL3N1ZS1tYWxvbW8iO2k6NjtzOjIwOiIvdGVhbS9hbXktcmVkZGluZ3RvbiI7aToyO3M6MjA6Ii90ZWFtL3JvZHJpZ28tcGFzc29zIjtpOjM7czoxNzoiL3RlYW0vdGltLW1lcnJpbGwiO2k6NztzOjE4OiIvdGVhbS9jaHJpcy1vYnJpZW4iO2k6NTtzOjE4OiIvdGVhbS9kYXZpZC1mb250ZXMiO2k6ODtzOjE4OiIvdGVhbS9lbWlseS1vYnJpZW4iO2k6MTQ7czo4OiIvam91cm5hbCI7aToxNTtzOjg6Ii9jb250YWN0IjtpOjE2O3M6MzI6Ii9qb3VybmFsL3RoZS1zdG9yeS1iZWhpbmQtMjBtaWxlIjtpOjE3O3M6MzQ6Ii9qb3VybmFsL3dlcmUtaGlyaW5nLXdlYi1kZXZlbG9wZXIiO2k6MTg7czo3NToiL2pvdXJuYWwvZXhwcmVzc2lvbmVuZ2luZS1hbmQtZ2l0LXVzaW5nLWdpdC1ob29rcy10by10cmFjay1kYXRhYmFzZS1jaGFuZ2VzIjtpOjE5O3M6Mjk6Ii9yZXN1bHRzL2JyaXRpc2gtYmVlci1jb21wYW55Ijt9czo5OiJ0ZW1wbGF0ZXMiO2E6MTg6e2k6MTA7czoxOiI0IjtpOjExO3M6MjoiMTAiO2k6MTI7czoyOiIxNSI7aToxMztzOjI6IjE2IjtpOjE0O3M6MjoiMTMiO2k6MTU7czoyOiIxMSI7aTo3O3M6MjoiMTkiO2k6ODtzOjI6IjE5IjtpOjY7czoyOiIxOSI7aTo1O3M6MjoiMTkiO2k6NDtzOjI6IjE5IjtpOjM7czoyOiIxOSI7aToyO3M6MjoiMTkiO2k6MTtzOjI6IjE5IjtpOjE2O3M6MjoiMTQiO2k6MTc7czoyOiIxNCI7aToxODtzOjI6IjE0IjtpOjE5O3M6MToiOSI7fX19');
/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_snippets`
--

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_specialty_templates`
--

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` VALUES (1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),(9,1,'y','reset_password_notification','New Login Information','{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),(10,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),(11,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),(12,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),(13,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(14,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),(15,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),(16,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');
/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stats`
--

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` VALUES (1,1,9,9,'Emily OBrien',19,0,0,0,1363285769,0,0,1364230581,28,1363278390,1364492841);
/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_groups`
--

DROP TABLE IF EXISTS `exp_status_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_groups`
--

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;
INSERT INTO `exp_status_groups` VALUES (1,1,'Statuses');
/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_no_access`
--

LOCK TABLES `exp_status_no_access` WRITE;
/*!40000 ALTER TABLE `exp_status_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_status_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_statuses`
--

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` VALUES (1,1,1,'open',1,'009933'),(2,1,1,'closed',2,'990000');
/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure`
--

DROP TABLE IF EXISTS `exp_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure`
--

LOCK TABLES `exp_structure` WRITE;
/*!40000 ALTER TABLE `exp_structure` DISABLE KEYS */;
INSERT INTO `exp_structure` VALUES (0,0,0,0,0,1,30,'root','n'),(1,1,13,3,0,9,10,'','n'),(1,2,13,3,0,15,16,'','n'),(1,3,13,3,0,17,18,'','n'),(1,4,13,3,0,11,12,'','n'),(1,5,13,3,0,21,22,'','n'),(1,6,13,3,0,13,14,'','n'),(1,7,13,3,0,19,20,'','n'),(1,8,13,3,0,23,24,'','n'),(1,10,0,1,0,2,3,'','n'),(1,11,0,1,0,4,5,'','n'),(1,12,0,1,4,6,7,'','n'),(1,13,0,1,0,8,25,'','n'),(1,14,0,1,2,26,27,'','n'),(1,15,0,1,0,28,29,'','n');
/*!40000 ALTER TABLE `exp_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_channels`
--

DROP TABLE IF EXISTS `exp_structure_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_channels` (
  `site_id` smallint(5) unsigned NOT NULL,
  `channel_id` mediumint(8) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_channels`
--

LOCK TABLES `exp_structure_channels` WRITE;
/*!40000 ALTER TABLE `exp_structure_channels` DISABLE KEYS */;
INSERT INTO `exp_structure_channels` VALUES (1,1,9,'page','n','y'),(1,2,14,'listing','n','y'),(1,3,19,'page','n','y'),(1,4,9,'listing','n','y'),(1,5,12,'page','n','y');
/*!40000 ALTER TABLE `exp_structure_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_listings`
--

DROP TABLE IF EXISTS `exp_structure_listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_listings` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `template_id` int(6) unsigned NOT NULL DEFAULT '0',
  `uri` varchar(75) NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_listings`
--

LOCK TABLES `exp_structure_listings` WRITE;
/*!40000 ALTER TABLE `exp_structure_listings` DISABLE KEYS */;
INSERT INTO `exp_structure_listings` VALUES (1,16,14,2,14,'the-story-behind-20mile'),(1,17,14,2,14,'were-hiring-web-developer'),(1,18,14,2,14,'expressionengine-and-git-using-git-hooks-to-track-database-changes'),(1,19,12,4,9,'british-beer-company');
/*!40000 ALTER TABLE `exp_structure_listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_members`
--

DROP TABLE IF EXISTS `exp_structure_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_members` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `nav_state` text,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_members`
--

LOCK TABLES `exp_structure_members` WRITE;
/*!40000 ALTER TABLE `exp_structure_members` DISABLE KEYS */;
INSERT INTO `exp_structure_members` VALUES (1,1,'false');
/*!40000 ALTER TABLE `exp_structure_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_structure_settings`
--

DROP TABLE IF EXISTS `exp_structure_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_structure_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) NOT NULL,
  `var_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_structure_settings`
--

LOCK TABLES `exp_structure_settings` WRITE;
/*!40000 ALTER TABLE `exp_structure_settings` DISABLE KEYS */;
INSERT INTO `exp_structure_settings` VALUES (1,0,'action_ajax_move','22'),(2,0,'module_id','14'),(10,1,'redirect_on_login','n'),(11,1,'redirect_on_publish','structure_only'),(12,1,'hide_hidden_templates','y'),(13,1,'add_trailing_slash','y');
/*!40000 ALTER TABLE `exp_structure_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_cache`
--

DROP TABLE IF EXISTS `exp_super_search_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_cache`
--

LOCK TABLES `exp_super_search_cache` WRITE;
/*!40000 ALTER TABLE `exp_super_search_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_super_search_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_history`
--

DROP TABLE IF EXISTS `exp_super_search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_history`
--

LOCK TABLES `exp_super_search_history` WRITE;
/*!40000 ALTER TABLE `exp_super_search_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_super_search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_indexes`
--

DROP TABLE IF EXISTS `exp_super_search_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_super_search_indexes` (
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `index_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_indexes`
--

LOCK TABLES `exp_super_search_indexes` WRITE;
/*!40000 ALTER TABLE `exp_super_search_indexes` DISABLE KEYS */;
INSERT INTO `exp_super_search_indexes` VALUES (1,1,1364228094),(2,1,1364228133),(3,1,1364228148),(4,1,1364228109),(5,1,1364228166),(6,1,1364228121),(7,1,1364228157),(8,1,1364228175),(10,1,1363097935),(11,1,1363108715),(12,1,1363282706),(13,1,1363117423),(14,1,1363107882),(15,1,1363106683),(16,1,1363276914),(17,1,1363276903),(18,1,1363276881),(19,1,1363291110);
/*!40000 ALTER TABLE `exp_super_search_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_lexicon_log`
--

DROP TABLE IF EXISTS `exp_super_search_lexicon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_lexicon_log`
--

LOCK TABLES `exp_super_search_lexicon_log` WRITE;
/*!40000 ALTER TABLE `exp_super_search_lexicon_log` DISABLE KEYS */;
INSERT INTO `exp_super_search_lexicon_log` VALUES (1,'build','0||1',0,'manual',1359842375),(2,'build','0||7',0,'manual',1359842444),(3,'build','0||10',0,'manual',1363018927),(4,'build','0||11',0,'manual',1363018994),(5,'build','0||12',0,'manual',1363019023),(6,'build','0||13',0,'manual',1363019535),(7,'build','0||14',0,'manual',1363019546),(8,'build','0||15',0,'manual',1363019556),(9,'build','0||10',0,'manual',1363020221),(10,'build','0||10',0,'manual',1363021287),(11,'build','0||10',0,'manual',1363021309),(12,'build','0||10',0,'manual',1363097935),(13,'build','0||11',0,'manual',1363106637),(14,'build','0||12',0,'manual',1363106649),(15,'build','0||13',0,'manual',1363106658),(16,'build','0||14',0,'manual',1363106672),(17,'build','0||15',0,'manual',1363106683),(18,'build','0||14',0,'manual',1363107882),(19,'build','0||11',0,'manual',1363108715),(20,'build','0||13',0,'manual',1363117397),(21,'build','0||13',0,'manual',1363117423),(22,'build','0||7',0,'manual',1363117984),(23,'build','0||8',0,'manual',1363117995),(24,'build','0||6',0,'manual',1363118008),(25,'build','0||5',0,'manual',1363118028),(26,'build','0||4',0,'manual',1363118038),(27,'build','0||3',0,'manual',1363118055),(28,'build','0||2',0,'manual',1363118065),(29,'build','0||1',0,'manual',1363118076),(30,'build','0||1',0,'manual',1363118180),(31,'build','0||6',0,'manual',1363118190),(32,'build','0||4',0,'manual',1363118197),(33,'build','0||3',0,'manual',1363118205),(34,'build','0||7',0,'manual',1363118212),(35,'build','0||2',0,'manual',1363118220),(36,'build','0||5',0,'manual',1363118227),(37,'build','0||8',0,'manual',1363118234),(38,'build','0||1',0,'manual',1363118792),(39,'build','0||6',0,'manual',1363118885),(40,'build','0||4',0,'manual',1363118904),(41,'build','0||3',0,'manual',1363118929),(42,'build','0||7',0,'manual',1363118946),(43,'build','0||2',0,'manual',1363118975),(44,'build','0||5',0,'manual',1363118997),(45,'build','0||8',0,'manual',1363119017),(46,'build','0||1',0,'manual',1363183676),(47,'build','0||6',0,'manual',1363183744),(48,'build','0||4',0,'manual',1363183755),(49,'build','0||3',0,'manual',1363183764),(50,'build','0||7',0,'manual',1363183773),(51,'build','0||2',0,'manual',1363183780),(52,'build','0||5',0,'manual',1363183786),(53,'build','0||8',0,'manual',1363183793),(54,'build','0||7',0,'manual',1363183931),(55,'build','0||16',0,'manual',1363189837),(56,'build','0||16',0,'manual',1363194910),(57,'build','0||16',0,'manual',1363196114),(58,'build','0||17',0,'manual',1363268323),(59,'build','0||17',0,'manual',1363268339),(60,'build','0||17',0,'manual',1363268396),(61,'build','0||17',0,'manual',1363268420),(62,'build','0||17',0,'manual',1363268452),(63,'build','0||17',0,'manual',1363270075),(64,'build','0||17',0,'manual',1363272871),(65,'build','0||18',0,'manual',1363276599),(66,'build','0||18',0,'manual',1363276709),(67,'build','0||18',0,'manual',1363276749),(68,'build','0||16',0,'manual',1363276832),(69,'build','0||18',0,'manual',1363276881),(70,'build','0||17',0,'manual',1363276903),(71,'build','0||16',0,'manual',1363276914),(72,'build','0||12',0,'manual',1363278385),(73,'build','0||12',0,'manual',1363278402),(74,'build','0||12',0,'manual',1363282706),(75,'build','0||19',0,'manual',1363285850),(76,'build','0||19',0,'manual',1363289123),(77,'build','0||19',0,'manual',1363289253),(78,'build','0||19',0,'manual',1363291110),(79,'build','0||1',0,'manual',1364228094),(80,'build','0||4',0,'manual',1364228109),(81,'build','0||6',0,'manual',1364228121),(82,'build','0||2',0,'manual',1364228133),(83,'build','0||3',0,'manual',1364228148),(84,'build','0||7',0,'manual',1364228157),(85,'build','0||5',0,'manual',1364228166),(86,'build','0||8',0,'manual',1364228175);
/*!40000 ALTER TABLE `exp_super_search_lexicon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_log`
--

DROP TABLE IF EXISTS `exp_super_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_log`
--

LOCK TABLES `exp_super_search_log` WRITE;
/*!40000 ALTER TABLE `exp_super_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_super_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_refresh_rules`
--

DROP TABLE IF EXISTS `exp_super_search_refresh_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_refresh_rules`
--

LOCK TABLES `exp_super_search_refresh_rules` WRITE;
/*!40000 ALTER TABLE `exp_super_search_refresh_rules` DISABLE KEYS */;
INSERT INTO `exp_super_search_refresh_rules` VALUES (1,1,1359653498,10,0,0,0,1);
/*!40000 ALTER TABLE `exp_super_search_refresh_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_super_search_terms`
--

DROP TABLE IF EXISTS `exp_super_search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4420 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_terms`
--

LOCK TABLES `exp_super_search_terms` WRITE;
/*!40000 ALTER TABLE `exp_super_search_terms` DISABLE KEYS */;
INSERT INTO `exp_super_search_terms` VALUES (856,'1','100','',3,0,0,0,13,''),(1898,'1','12px','P200',4,0,0,0,1,''),(16,'1','15','',2,0,0,0,11,''),(880,'1','20','',2,0,0,0,5,''),(1540,'1','200','',3,0,0,0,8,''),(14,'1','2007','',4,0,0,0,6,''),(5,'1','20mile','M400',6,0,0,0,19,''),(3303,'1','20mileinteractive','M4536231',17,0,0,0,4,''),(26,'1','39','',2,0,0,0,23,''),(777,'1','4','',1,0,0,0,5,''),(1510,'1','419','',3,0,0,0,8,''),(1509,'1','508','',3,0,0,0,8,''),(845,'1','6x8','X000',3,0,0,0,5,''),(1511,'1','7439','',4,0,0,0,8,''),(8,'1','a','A000',1,0,0,0,30,''),(935,'1','ability','A143',7,0,0,0,13,''),(1635,'1','able','A140',4,0,0,0,8,''),(985,'1','about','A130',5,0,0,0,5,''),(1622,'1','across','A262',6,0,0,0,8,''),(1537,'1','active','A231',6,0,0,0,8,''),(1679,'1','actually','A234',8,0,0,0,8,''),(929,'1','advise','A312',6,0,0,0,5,''),(171,'1','aenean','A500',6,0,0,0,6,''),(15,'1','after','A136',5,0,0,0,6,''),(1564,'1','all','A400',3,0,0,0,12,''),(864,'1','almost','A4523',6,0,0,0,5,''),(757,'1','amazed','A523',6,0,0,0,5,''),(286,'1','amy','A500',3,0,0,0,5,''),(895,'1','an','A500',2,0,0,0,13,''),(78,'1','and','A530',3,0,0,0,24,''),(3272,'1','answer','A526',6,0,0,0,4,''),(3285,'1','anwser','A526',6,0,0,0,4,''),(1572,'1','any','A500',3,0,0,0,8,''),(1508,'1','anytime','A535',7,0,0,0,8,''),(1684,'1','api','A100',3,0,0,0,8,''),(1595,'1','applications','A142352',12,0,0,0,8,''),(1669,'1','appreciate','A1623',10,0,0,0,8,''),(85,'1','approaches','A162',10,0,0,0,7,''),(1645,'1','architecture','A623236',12,0,0,0,8,''),(901,'1','are','A600',3,0,0,0,17,''),(837,'1','as','A200',2,0,0,0,13,''),(915,'1','ask','A200',3,0,0,0,5,''),(958,'1','asked','A230',5,0,0,0,5,''),(775,'1','at','A300',2,0,0,0,17,''),(189,'1','auctor','A236',6,0,0,0,3,''),(939,'1','audience','A352',8,0,0,0,5,''),(184,'1','augue','A200',5,0,0,0,6,''),(870,'1','back','B200',4,0,0,0,13,''),(52,'1','barnstable','B652314',10,0,0,0,6,''),(1644,'1','based','B230',5,0,0,0,8,''),(57,'1','bbc','B200',3,0,0,0,6,''),(37,'1','be','B000',2,0,0,0,18,''),(47,'1','beach','B200',5,0,0,0,6,''),(69,'1','beautiful','B314',9,0,0,0,7,''),(862,'1','been','B500',4,0,0,0,9,''),(4297,'1','beer','B600',4,0,0,0,4,''),(55,'1','beers','B620',5,0,0,0,6,''),(751,'1','behind','B530',6,0,0,0,5,''),(93,'1','best','B230',4,0,0,0,20,''),(3278,'1','better','B360',6,0,0,0,4,''),(1533,'1','boston','B235',6,0,0,0,8,''),(938,'1','both','B300',4,0,0,0,5,''),(1642,'1','br','B600',2,0,0,0,8,''),(33,'1','brainstorming','B6523652',13,0,0,0,6,''),(853,'1','brand','B653',5,0,0,0,5,''),(869,'1','brings','B652',6,0,0,0,5,''),(4296,'1','british','B632',7,0,0,0,4,''),(1624,'1','browsers','B6262',8,0,0,0,8,''),(936,'1','build','B430',5,0,0,0,5,''),(921,'1','business','B252',8,0,0,0,5,''),(1701,'1','but','B300',3,0,0,0,12,''),(1703,'1','called','C430',6,0,0,0,8,''),(962,'1','came','C500',4,0,0,0,5,''),(36,'1','can','C500',3,0,0,0,23,''),(1493,'1','cape','C100',4,0,0,0,8,''),(800,'1','challenge','C452',9,0,0,0,5,''),(920,'1','challenges','C452',10,0,0,0,5,''),(874,'1','change','C520',6,0,0,0,5,''),(3253,'1','changes','C520',7,0,0,0,4,''),(904,'1','cheerleader','C6436',11,0,0,0,5,''),(882,'1','choices','C000',7,0,0,0,5,''),(59,'1','chris','C620',5,0,0,0,7,''),(910,'1','client','C453',6,0,0,0,13,''),(31,'1','clients','C4532',7,0,0,0,19,''),(1494,'1','cod','C300',3,0,0,0,8,''),(1652,'1','codeigniter','C32536',11,0,0,0,8,''),(1638,'1','collaborate','C4163',11,0,0,0,8,''),(903,'1','collaborator','C41636',12,0,0,0,5,''),(1550,'1','commerce','C562',8,0,0,0,8,''),(1712,'1','communicate','C523',11,0,0,0,8,''),(23,'1','companies','C5152',9,0,0,0,6,''),(806,'1','company','C515',7,0,0,0,9,''),(1631,'1','complex','C5142',7,0,0,0,8,''),(858,'1','confident','C51353',9,0,0,0,5,''),(955,'1','connect','C523',7,0,0,0,5,''),(1580,'1','consider','C5236',8,0,0,0,8,''),(1627,'1','consistent','C52353',10,0,0,0,8,''),(1685,'1','consumption','C525135',11,0,0,0,8,''),(117,'1','contact','C5323',7,0,0,0,10,''),(1546,'1','content','C5353',7,0,0,0,8,''),(3270,'1','control','C5364',7,0,0,0,4,''),(3295,'1','conventions','C515352',11,0,0,0,4,''),(960,'1','could','C430',5,0,0,0,5,''),(930,'1','counsel','C524',7,0,0,0,5,''),(975,'1','couple','C140',6,0,0,0,5,''),(1632,'1','crafted','C613',7,0,0,0,8,''),(68,'1','crafts','C6132',6,0,0,0,7,''),(886,'1','created','C630',7,0,0,0,5,''),(871,'1','creating','C6352',8,0,0,0,5,''),(88,'1','creative','C631',8,0,0,0,10,''),(1590,'1','css','C000',3,0,0,0,8,''),(1598,'1','css3','C000',4,0,0,0,8,''),(893,'1','d','D000',1,0,0,0,13,''),(1713,'1','daily','D400',5,0,0,0,8,''),(1676,'1','data','D000',4,0,0,0,8,''),(809,'1','database','D120',8,0,0,0,17,''),(1,'1','dave','D100',4,0,0,0,19,''),(288,'1','david','D130',5,0,0,0,5,''),(890,'1','day','D000',3,0,0,0,5,''),(957,'1','days','D200',4,0,0,0,5,''),(1629,'1','define','D150',6,0,0,0,8,''),(94,'1','design','D250',6,0,0,0,20,''),(66,'1','designer','D256',8,0,0,0,7,''),(77,'1','details','D420',7,0,0,0,7,''),(950,'1','develop','D141',7,0,0,0,5,''),(578,'1','developer','D1416',9,0,0,0,14,''),(1485,'1','developers','D14162',10,0,0,0,8,''),(1621,'1','developing','D14152',10,0,0,0,8,''),(811,'1','development','D14153',11,0,0,0,13,''),(768,'1','didn','D500',4,0,0,0,5,''),(1484,'1','directed','D623',8,0,0,0,8,''),(1706,'1','directly','D6234',8,0,0,0,8,''),(96,'1','director','D6236',8,0,0,0,10,''),(947,'1','disappear','D216',9,0,0,0,5,''),(65,'1','disciplinary','D21456',12,0,0,0,7,''),(1576,'1','divided','D130',7,0,0,0,8,''),(824,'1','do','D000',2,0,0,0,17,''),(875,'1','doesn','D250',5,0,0,0,5,''),(863,'1','doing','D520',5,0,0,0,5,''),(188,'1','dolor','D460',5,0,0,0,3,''),(908,'1','don','D500',3,0,0,0,9,''),(1592,'1','dreamweaver','D6516',11,0,0,0,8,''),(1606,'1','drupal','D614',6,0,0,0,8,''),(1672,'1','dumping','D5152',7,0,0,0,8,''),(795,'1','during','D652',6,0,0,0,5,''),(1549,'1','e','E000',1,0,0,0,8,''),(989,'1','each','E200',4,0,0,0,5,''),(850,'1','eight','E230',5,0,0,0,5,''),(284,'1','emily','E540',5,0,0,0,5,''),(1555,'1','encompasses','E52512',11,0,0,0,8,''),(1582,'1','end','E530',3,0,0,0,8,''),(1544,'1','especially','E2124',10,0,0,0,8,''),(164,'1','etiam','E350',5,0,0,0,6,''),(172,'1','eu','E000',2,0,0,0,6,''),(170,'1','euismod','E253',7,0,0,0,6,''),(764,'1','even','E150',4,0,0,0,5,''),(889,'1','every','E160',5,0,0,0,5,''),(986,'1','everything','E16352',10,0,0,0,5,''),(840,'1','expanded','E2153',8,0,0,0,5,''),(1560,'1','expect','E2123',6,0,0,0,8,''),(1552,'1','expectations','E212352',12,0,0,0,8,''),(98,'1','experience','E21652',10,0,0,0,13,''),(72,'1','experiences','E21652',11,0,0,0,7,''),(3301,'1','experimenting','E2165352',13,0,0,0,4,''),(1587,'1','expert','E2163',6,0,0,0,8,''),(105,'1','expertise','E21632',9,0,0,0,8,''),(961,'1','explain','E2145',7,0,0,0,5,''),(1604,'1','expressionengine','E2162525',16,0,0,0,12,''),(75,'1','eye','E000',3,0,0,0,7,''),(772,'1','face','F200',4,0,0,0,5,''),(187,'1','faucibus','F212',8,0,0,0,6,''),(91,'1','finding','F5352',7,0,0,0,7,''),(943,'1','finish','F520',6,0,0,0,5,''),(1608,'1','fireworks','F620',9,0,0,0,8,''),(1527,'1','firm','F650',4,0,0,0,8,''),(914,'1','first','F623',5,0,0,0,5,''),(1521,'1','five','F000',4,0,0,0,8,''),(1596,'1','fluency','F452',7,0,0,0,8,''),(3294,'1','follow','F400',6,0,0,0,4,''),(1574,'1','following','F452',9,0,0,0,8,''),(1896,'1','font','F530',4,0,0,0,1,''),(289,'1','fontes','F532',6,0,0,0,5,''),(979,'1','foot','F300',4,0,0,0,5,''),(20,'1','for','F600',3,0,0,0,26,''),(1716,'1','forward','F630',7,0,0,0,8,''),(38,'1','found','F530',5,0,0,0,6,''),(877,'1','foundation','F535',10,0,0,0,5,''),(1649,'1','frameworks','F6562',10,0,0,0,8,''),(2,'1','fravel','F614',6,0,0,0,14,''),(976,'1','friends','F6532',7,0,0,0,5,''),(897,'1','from','F650',4,0,0,0,5,''),(980,'1','front','F653',5,0,0,0,13,''),(1695,'1','full','F400',4,0,0,0,8,''),(894,'1','get','G300',3,0,0,0,5,''),(788,'1','getting','G352',7,0,0,0,5,''),(1634,'1','git','G300',3,0,0,0,12,''),(926,'1','go','G000',2,0,0,0,5,''),(922,'1','goals','G420',5,0,0,0,13,''),(878,'1','great','G630',5,0,0,0,13,''),(1616,'1','grids','G632',5,0,0,0,8,''),(1673,'1','ground','G653',6,0,0,0,8,''),(852,'1','growing','G652',7,0,0,0,13,''),(836,'1','grown','G650',5,0,0,0,5,''),(814,'1','gt','G300',2,0,0,0,5,''),(927,'1','guide','G300',5,0,0,0,13,''),(818,'1','guy','G000',3,0,0,0,5,''),(1518,'1','h3','H000',2,0,0,0,8,''),(783,'1','had','H300',3,0,0,0,5,''),(794,'1','hand','H530',4,0,0,0,5,''),(39,'1','hanging','H5252',7,0,0,0,6,''),(1639,'1','hatred','H363',6,0,0,0,8,''),(839,'1','have','H100',4,0,0,0,17,''),(25,'1','he','H000',2,0,0,0,18,''),(973,'1','head','H300',4,0,0,0,5,''),(3256,'1','hear','H600',4,0,0,0,4,''),(949,'1','help','H410',4,0,0,0,13,''),(819,'1','here','H600',4,0,0,0,9,''),(815,'1','hi','H000',2,0,0,0,5,''),(898,'1','him','H500',3,0,0,0,5,''),(789,'1','himself','H5241',7,0,0,0,5,''),(1474,'1','hiring','H652',6,0,0,0,8,''),(12,'1','his','H200',3,0,0,0,11,''),(9,'1','home','H500',4,0,0,0,16,''),(3249,'1','hooks','H200',5,0,0,0,4,''),(983,'1','hours','H620',5,0,0,0,5,''),(828,'1','how','H000',3,0,0,0,17,''),(1515,'1','href','H610',4,0,0,0,8,''),(1589,'1','html','H354',4,0,0,0,8,''),(1597,'1','html5','H354',5,0,0,0,8,''),(56,'1','hyannis','H520',7,0,0,0,6,''),(754,'1','i','I000',1,0,0,0,17,''),(785,'1','idea','I300',4,0,0,0,5,''),(953,'1','identities','I3532',10,0,0,0,5,''),(1497,'1','if','I100',2,0,0,0,12,''),(896,'1','im','I500',2,0,0,0,5,''),(1618,'1','implement','I51453',9,0,0,0,8,''),(1551,'1','implementations','I5145352',15,0,0,0,8,''),(1539,'1','implemented','I51453',11,0,0,0,8,''),(7,'1','in','I500',2,0,0,0,23,''),(1562,'1','individual','I53134',10,0,0,0,8,''),(1637,'1','individually','I53134',12,0,0,0,8,''),(1687,'1','integration','I532635',11,0,0,0,8,''),(1694,'1','interaction','I536235',11,0,0,0,8,''),(6,'1','interactive','I536231',11,0,0,0,14,''),(1500,'1','interested','I53623',10,0,0,0,8,''),(1711,'1','internal','I53654',8,0,0,0,8,''),(790,'1','into','I530',4,0,0,0,13,''),(62,'1','is','I200',2,0,0,0,29,''),(1677,'1','it','I300',2,0,0,0,8,''),(1601,'1','javascript','J12613',10,0,0,0,8,''),(1487,'1','join','J500',4,0,0,0,8,''),(1661,'1','joins','J520',5,0,0,0,8,''),(114,'1','journal','J654',7,0,0,0,3,''),(1603,'1','jquery','J600',6,0,0,0,8,''),(74,'1','keen','K500',4,0,0,0,7,''),(977,'1','keep','K100',4,0,0,0,5,''),(42,'1','kids','K320',4,0,0,0,6,''),(867,'1','knew','K500',4,0,0,0,5,''),(917,'1','know','K500',4,0,0,0,9,''),(1657,'1','knowledge','K5432',9,0,0,0,8,''),(177,'1','lacinia','L250',7,0,0,0,6,''),(182,'1','lacus','L200',5,0,0,0,6,''),(1643,'1','lamp','L510',4,0,0,0,8,''),(185,'1','laoreet','L630',7,0,0,0,6,''),(1653,'1','laravel','L614',7,0,0,0,8,''),(21,'1','large','L620',5,0,0,0,6,''),(54,'1','latest','L323',6,0,0,0,6,''),(932,'1','lead','L300',4,0,0,0,5,''),(776,'1','least','L230',5,0,0,0,13,''),(173,'1','leo','L000',3,0,0,0,6,''),(1640,'1','letters','L362',7,0,0,0,8,''),(1588,'1','level','L140',5,0,0,0,8,''),(1585,'1','li','L000',2,0,0,0,8,''),(944,'1','line','L500',4,0,0,0,5,''),(913,'1','listen','L235',6,0,0,0,5,''),(907,'1','listener','L2356',8,0,0,0,5,''),(861,'1','living','L152',6,0,0,0,5,''),(887,'1','logos','L200',5,0,0,0,5,''),(829,'1','long','L520',4,0,0,0,5,''),(843,'1','longer','L526',6,0,0,0,9,''),(1570,'1','love','L100',4,0,0,0,8,''),(756,'1','m','M000',1,0,0,0,5,''),(168,'1','magna','M250',5,0,0,0,6,''),(1630,'1','maintain','M350',8,0,0,0,8,''),(1626,'1','maintaining','M352',11,0,0,0,8,''),(1700,'1','majority','M263',8,0,0,0,8,''),(167,'1','malesuada','M423',9,0,0,0,6,''),(291,'1','malomo','M450',6,0,0,0,5,''),(1699,'1','manage','M200',6,0,0,0,8,''),(1547,'1','management','M253',10,0,0,0,8,''),(525,'1','manager','M260',7,0,0,0,6,''),(1698,'1','managers','M262',8,0,0,0,8,''),(883,'1','many','M000',4,0,0,0,5,''),(964,'1','marathons','M6352',9,0,0,0,5,''),(855,'1','marketing','M62352',9,0,0,0,5,''),(1495,'1','massachusetts','M232',13,0,0,0,8,''),(763,'1','me','M000',2,0,0,0,5,''),(29,'1','meeting','M352',7,0,0,0,11,''),(1718,'1','meetings','M352',8,0,0,0,8,''),(905,'1','mentor','M360',6,0,0,0,5,''),(293,'1','merrill','M640',7,0,0,0,5,''),(965,'1','mile','M400',4,0,0,0,5,''),(1567,'1','mind','M300',4,0,0,0,8,''),(1543,'1','modern','M365',6,0,0,0,8,''),(169,'1','mollis','M420',6,0,0,0,6,''),(781,'1','month','M300',5,0,0,0,5,''),(765,'1','more','M600',4,0,0,0,13,''),(972,'1','morning','M652',7,0,0,0,5,''),(1482,'1','motivated','M313',9,0,0,0,8,''),(1714,'1','move','M100',4,0,0,0,8,''),(64,'1','multi','M430',5,0,0,0,7,''),(1623,'1','multiple','M4314',8,0,0,0,8,''),(821,'1','my','M000',2,0,0,0,9,''),(1655,'1','mysql','M240',5,0,0,0,8,''),(873,'1','name','N000',4,0,0,0,5,''),(803,'1','nbsp','N121',4,0,0,0,5,''),(931,'1','necessary','N260',9,0,0,0,5,''),(46,'1','neck','N200',4,0,0,0,6,''),(841,'1','new','N000',3,0,0,0,5,''),(1722,'1','next','N230',4,0,0,0,8,''),(817,'1','nice','N200',4,0,0,0,5,''),(784,'1','no','N000',2,0,0,0,13,''),(1660,'1','normalization','N654235',13,0,0,0,8,''),(28,'1','not','N300',3,0,0,0,11,''),(833,'1','now','N000',3,0,0,0,5,''),(951,'1','nurture','N636',7,0,0,0,5,''),(1646,'1','object','O123',6,0,0,0,8,''),(60,'1','obrien','O165',6,0,0,0,12,''),(1702,'1','occasionally','O254',12,0,0,0,8,''),(18,'1','of','O100',2,0,0,0,26,''),(879,'1','offered','O163',7,0,0,0,5,''),(10,'1','office','O120',6,0,0,0,22,''),(1529,'1','offices','O120',7,0,0,0,8,''),(1523,'1','old','O430',3,0,0,0,8,''),(44,'1','on','O500',2,0,0,0,19,''),(807,'1','one','O500',3,0,0,0,5,''),(885,'1','ones','O520',4,0,0,0,5,''),(952,'1','online','O545',6,0,0,0,5,''),(1663,'1','optimization','O135235',12,0,0,0,8,''),(32,'1','or','O600',2,0,0,0,23,''),(1647,'1','oriented','O653',8,0,0,0,8,''),(176,'1','ornare','O656',6,0,0,0,6,''),(1492,'1','osterville','O23614',10,0,0,0,8,''),(981,'1','other','O360',5,0,0,0,13,''),(838,'1','our','O600',3,0,0,0,13,''),(40,'1','out','O300',3,0,0,0,11,''),(779,'1','over','O160',4,0,0,0,13,''),(3,'1','p','P000',1,0,0,0,52,''),(104,'1','page','P200',4,0,0,0,24,''),(1516,'1','page_15','P200',7,0,0,0,8,''),(1602,'1','particular','P63246',10,0,0,0,8,''),(902,'1','partner','P6356',7,0,0,0,5,''),(90,'1','passion','P250',7,0,0,0,7,''),(295,'1','passos','P200',6,0,0,0,5,''),(780,'1','past','P230',4,0,0,0,5,''),(175,'1','pellentesque','P4532',12,0,0,0,6,''),(851,'1','people','P400',6,0,0,0,5,''),(1607,'1','photoshop','P321',9,0,0,0,8,''),(1648,'1','php','P000',3,0,0,0,8,''),(1504,'1','please','P420',6,0,0,0,8,''),(782,'1','poor','P600',4,0,0,0,5,''),(165,'1','porta','P630',5,0,0,0,6,''),(1503,'1','position','P235',8,0,0,0,8,''),(888,'1','possible','P214',8,0,0,0,5,''),(1613,'1','practices','P6232',9,0,0,0,8,''),(3291,'1','pre','P600',3,0,0,0,4,''),(58,'1','president','P62353',9,0,0,0,6,''),(1719,'1','priorities','P632',10,0,0,0,8,''),(900,'1','problem','P6145',7,0,0,0,5,''),(1666,'1','procedures','P62362',10,0,0,0,8,''),(1710,'1','process','P620',7,0,0,0,8,''),(524,'1','project','P623',7,0,0,0,23,''),(86,'1','projects','P6232',8,0,0,0,19,''),(911,'1','prospect','P62123',8,0,0,0,5,''),(876,'1','provide','P613',7,0,0,0,5,''),(808,'1','providing','P61352',9,0,0,0,5,''),(988,'1','pull','P400',4,0,0,0,5,''),(770,'1','punch','P520',5,0,0,0,5,''),(82,'1','purpose','P612',7,0,0,0,7,''),(987,'1','push','P200',4,0,0,0,5,''),(945,'1','put','P300',3,0,0,0,5,''),(978,'1','putting','P352',7,0,0,0,5,''),(174,'1','quam','Q500',4,0,0,0,6,''),(1662,'1','query','Q600',5,0,0,0,8,''),(3258,'1','question','Q350',8,0,0,0,4,''),(916,'1','questions','Q352',9,0,0,0,5,''),(774,'1','quit','Q300',4,0,0,0,5,''),(792,'1','raised','R230',6,0,0,0,5,''),(822,'1','rate','R300',4,0,0,0,5,''),(940,'1','re','R000',2,0,0,0,13,''),(804,'1','read_more','R356',9,0,0,0,10,''),(1553,'1','realize','R420',7,0,0,0,8,''),(881,'1','reasonable','R2514',10,0,0,0,5,''),(287,'1','reddington','R35235',10,0,0,0,5,''),(937,'1','relationships','R435212',13,0,0,0,5,''),(1545,'1','responsive','R21521',10,0,0,0,8,''),(1692,'1','rest','R230',4,0,0,0,8,''),(108,'1','results','R2432',7,0,0,0,5,''),(1566,'1','ridiculous','R3242',10,0,0,0,8,''),(294,'1','rodrigo','R362',7,0,0,0,5,''),(1568,'1','rsquo','R200',5,0,0,0,8,''),(966,'1','run','R500',3,0,0,0,5,''),(48,'1','running','R520',7,0,0,0,6,''),(186,'1','rutrum','R365',6,0,0,0,6,''),(27,'1','s','S000',1,0,0,0,11,''),(181,'1','sagittis','S320',8,0,0,0,6,''),(45,'1','sandy','S530',5,0,0,0,6,''),(1481,'1','seeking','S520',7,0,0,0,8,''),(1483,'1','self','S410',4,0,0,0,8,''),(166,'1','sem','S500',3,0,0,0,6,''),(576,'1','senior','S560',6,0,0,0,6,''),(80,'1','sense','S520',5,0,0,0,7,''),(1686,'1','service','S612',7,0,0,0,8,''),(812,'1','services','S612',8,0,0,0,5,''),(1720,'1','set','S300',3,0,0,0,8,''),(3293,'1','setup','S310',5,0,0,0,4,''),(3271,'1','short','S630',5,0,0,0,4,''),(1658,'1','should','S430',6,0,0,0,8,''),(813,'1','simple','S514',6,0,0,0,5,''),(1561,'1','single','S524',6,0,0,0,8,''),(946,'1','site','S300',4,0,0,0,5,''),(43,'1','sitting','S352',7,0,0,0,11,''),(1897,'1','size','S000',4,0,0,0,1,''),(1559,'1','skills','S420',6,0,0,0,8,''),(1691,'1','soap','S100',4,0,0,0,8,''),(22,'1','software','S136',8,0,0,0,6,''),(1614,'1','solid','S430',5,0,0,0,8,''),(95,'1','solutions','S4352',9,0,0,0,7,''),(1681,'1','some','S500',4,0,0,0,12,''),(1531,'1','soon','S500',4,0,0,0,8,''),(1894,'1','span','S150',4,0,0,0,1,''),(1705,'1','speak','S120',5,0,0,0,8,''),(1542,'1','specialize','S1242',10,0,0,0,8,''),(970,'1','spend','S153',5,0,0,0,5,''),(942,'1','sprint','S1653',6,0,0,0,5,''),(13,'1','stairs','S362',6,0,0,0,11,''),(1611,'1','standards','S353632',9,0,0,0,8,''),(827,'1','start','S363',5,0,0,0,5,''),(4,'1','started','S363',7,0,0,0,6,''),(760,'1','still','S340',5,0,0,0,5,''),(1665,'1','stored','S363',6,0,0,0,8,''),(860,'1','stories','S362',7,0,0,0,5,''),(750,'1','story','S360',5,0,0,0,5,''),(87,'1','strategic','S3632',9,0,0,0,7,''),(933,'1','strength','S36523',8,0,0,0,5,''),(79,'1','strong','S3652',6,0,0,0,15,''),(1895,'1','style','S340',5,0,0,0,1,''),(1633,'1','stylesheets','S34232',11,0,0,0,8,''),(1650,'1','such','S000',4,0,0,0,8,''),(290,'1','sue','S000',3,0,0,0,5,''),(928,'1','suggest','S300',7,0,0,0,5,''),(872,'1','suggestion','S350',10,0,0,0,5,''),(971,'1','sunday','S530',6,0,0,0,5,''),(1619,'1','systematically','S35324',14,0,0,0,8,''),(1548,'1','systems','S352',7,0,0,0,8,''),(769,'1','t','T000',1,0,0,0,9,''),(832,'1','take','T200',4,0,0,0,5,''),(984,'1','talk','T420',4,0,0,0,13,''),(761,'1','talking','T4252',7,0,0,0,5,''),(53,'1','tasting','T2352',7,0,0,0,6,''),(35,'1','team','T500',4,0,0,0,18,''),(51,'1','tears','T620',5,0,0,0,6,''),(1689,'1','technologies','T2542',12,0,0,0,8,''),(842,'1','tell','T400',4,0,0,0,5,''),(802,'1','telling','T452',7,0,0,0,5,''),(859,'1','tells','T420',5,0,0,0,5,''),(948,'1','term','T650',4,0,0,0,5,''),(1620,'1','testing','T2352',7,0,0,0,8,''),(1671,'1','than','T500',4,0,0,0,8,''),(766,'1','that','T000',4,0,0,0,13,''),(34,'1','the','T000',3,0,0,0,35,''),(919,'1','their','T600',5,0,0,0,5,''),(912,'1','them','T500',4,0,0,0,13,''),(1577,'1','these','T200',5,0,0,0,8,''),(924,'1','they','T000',4,0,0,0,5,''),(1682,'1','things','T520',6,0,0,0,8,''),(906,'1','thinker','T526',7,0,0,0,5,''),(89,'1','thinking','T5252',8,0,0,0,7,''),(101,'1','this','T200',4,0,0,0,22,''),(956,'1','those','T200',5,0,0,0,5,''),(41,'1','three','T600',5,0,0,0,11,''),(49,'1','through','T620',7,0,0,0,14,''),(292,'1','tim','T500',3,0,0,0,10,''),(1696,'1','time','T500',4,0,0,0,12,''),(778,'1','times','T520',5,0,0,0,5,''),(762,'1','to','T000',2,0,0,0,17,''),(1683,'1','too','T000',3,0,0,0,8,''),(798,'1','took','T200',4,0,0,0,5,''),(3251,'1','track','T620',5,0,0,0,4,''),(50,'1','trail','T640',5,0,0,0,6,''),(963,'1','training','T652',8,0,0,0,5,''),(1667,'1','triggers','T6262',8,0,0,0,8,''),(892,'1','two','T000',3,0,0,0,5,''),(1584,'1','ul','U400',2,0,0,0,8,''),(11,'1','under','U536',5,0,0,0,11,''),(918,'1','understand','U5362353',10,0,0,0,13,''),(1615,'1','understanding','U536235352',13,0,0,0,8,''),(884,'1','unreasonable','U562514',12,0,0,0,5,''),(868,'1','up','U100',2,0,0,0,5,''),(1704,'1','upon','U150',4,0,0,0,8,''),(70,'1','usable','U214',6,0,0,0,7,''),(1513,'1','use','U200',3,0,0,0,12,''),(97,'1','user','U260',4,0,0,0,5,''),(1688,'1','using','U252',5,0,0,0,12,''),(83,'1','utility','U343',7,0,0,0,7,''),(748,'1','ux','U200',2,0,0,0,2,''),(1557,'1','variety','V630',7,0,0,0,8,''),(835,'1','ve','V000',2,0,0,0,13,''),(183,'1','vel','V400',3,0,0,0,6,''),(178,'1','venenatis','V532',9,0,0,0,6,''),(1610,'1','versed','V623',6,0,0,0,8,''),(3269,'1','version','V625',7,0,0,0,4,''),(179,'1','vestibulum','V23145',10,0,0,0,6,''),(1664,'1','views','V200',5,0,0,0,8,''),(180,'1','vivamus','V520',7,0,0,0,6,''),(909,'1','walk','W420',4,0,0,0,5,''),(925,'1','want','W530',4,0,0,0,5,''),(787,'1','was','W200',3,0,0,0,5,''),(954,'1','way','W000',3,0,0,0,5,''),(969,'1','ways','W200',4,0,0,0,5,''),(834,'1','we','W000',2,0,0,0,17,''),(71,'1','web','W100',3,0,0,0,26,''),(1541,'1','websites','W1232',8,0,0,0,8,''),(1723,'1','week','W200',4,0,0,0,8,''),(1717,'1','weekly','W240',6,0,0,0,8,''),(1609,'1','well','W400',4,0,0,0,8,''),(786,'1','what','W300',4,0,0,0,17,''),(24,'1','when','W500',4,0,0,0,11,''),(923,'1','where','W600',5,0,0,0,5,''),(1625,'1','while','W400',5,0,0,0,8,''),(67,'1','who','W000',3,0,0,0,15,''),(959,'1','why','W000',3,0,0,0,5,''),(1556,'1','wide','W300',4,0,0,0,8,''),(831,'1','will','W400',4,0,0,0,5,''),(3288,'1','willing','W452',7,0,0,0,4,''),(30,'1','with','W300',4,0,0,0,26,''),(1605,'1','wordpress','W63162',9,0,0,0,8,''),(1636,'1','work','W620',4,0,0,0,8,''),(19,'1','working','W6252',7,0,0,0,6,''),(968,'1','worst','W623',5,0,0,0,5,''),(3279,'1','would','W430',5,0,0,0,4,''),(1600,'1','writing','W6352',7,0,0,0,8,''),(1594,'1','wysiwyg','W200',7,0,0,0,8,''),(1690,'1','xml','X540',3,0,0,0,8,''),(1522,'1','year','Y600',4,0,0,0,8,''),(17,'1','years','Y620',5,0,0,0,11,''),(826,'1','you','Y000',3,0,0,0,17,''),(1675,'1','your','Y600',4,0,0,0,8,'');
/*!40000 ALTER TABLE `exp_super_search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_tag_bad_tags`
--

DROP TABLE IF EXISTS `exp_tag_bad_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_bad_tags`
--

LOCK TABLES `exp_tag_bad_tags` WRITE;
/*!40000 ALTER TABLE `exp_tag_bad_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_tag_bad_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_tag_entries`
--

DROP TABLE IF EXISTS `exp_tag_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_entries`
--

LOCK TABLES `exp_tag_entries` WRITE;
/*!40000 ALTER TABLE `exp_tag_entries` DISABLE KEYS */;
INSERT INTO `exp_tag_entries` VALUES (18,6,2,1,1,'127.0.0.1','channel',1,'n'),(18,7,2,1,1,'127.0.0.1','channel',1,'n'),(17,3,2,1,1,'127.0.0.1','channel',1,'n'),(17,4,2,1,1,'127.0.0.1','channel',1,'n'),(16,1,2,1,1,'127.0.0.1','channel',1,'n'),(16,2,2,1,1,'127.0.0.1','channel',1,'n'),(16,3,2,1,1,'127.0.0.1','channel',1,'n');
/*!40000 ALTER TABLE `exp_tag_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_tag_groups`
--

DROP TABLE IF EXISTS `exp_tag_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_tag_groups` (
  `tag_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_group_name` varchar(150) NOT NULL,
  `tag_group_short_name` varchar(150) NOT NULL,
  PRIMARY KEY (`tag_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_groups`
--

LOCK TABLES `exp_tag_groups` WRITE;
/*!40000 ALTER TABLE `exp_tag_groups` DISABLE KEYS */;
INSERT INTO `exp_tag_groups` VALUES (1,'default','default');
/*!40000 ALTER TABLE `exp_tag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_tag_preferences`
--

DROP TABLE IF EXISTS `exp_tag_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_tag_preferences` (
  `tag_preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_preference_name` varchar(100) NOT NULL,
  `tag_preference_value` varchar(100) NOT NULL,
  `site_id` int(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`tag_preference_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_preferences`
--

LOCK TABLES `exp_tag_preferences` WRITE;
/*!40000 ALTER TABLE `exp_tag_preferences` DISABLE KEYS */;
INSERT INTO `exp_tag_preferences` VALUES (1,'parse','linebreak',1),(2,'convert_case','y',1),(3,'enable_tag_form','y',1),(4,'publish_entry_tag_limit','0',1),(5,'allow_tag_creation_publish','y',1);
/*!40000 ALTER TABLE `exp_tag_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_tag_subscriptions`
--

DROP TABLE IF EXISTS `exp_tag_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_tag_subscriptions` (
  `tag_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `site_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`member_id`,`site_id`),
  KEY `site_id` (`site_id`),
  KEY `member_id` (`member_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_subscriptions`
--

LOCK TABLES `exp_tag_subscriptions` WRITE;
/*!40000 ALTER TABLE `exp_tag_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_tag_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_tag_tags`
--

DROP TABLE IF EXISTS `exp_tag_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_tags`
--

LOCK TABLES `exp_tag_tags` WRITE;
/*!40000 ALTER TABLE `exp_tag_tags` DISABLE KEYS */;
INSERT INTO `exp_tag_tags` VALUES (1,'s','stories',1,1,1363196114,1363276914,0,1,1,1,0),(2,'b','business',1,1,1363196114,1363276914,10,1,1,1,0),(3,'2','20mile',1,1,1363196114,1363276914,5,2,2,2,0),(4,'j','jobs',1,1,1363268323,1363276903,0,1,1,1,0),(6,'g','git',1,1,1363276599,1363276881,8,1,1,1,0),(7,'e','expressionengine',1,1,1363276599,1363276881,2,1,1,1,0);
/*!40000 ALTER TABLE `exp_tag_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (3,1,'pages',1,'y');
/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_member_groups`
--

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_no_access`
--

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (3,1,3,'index','n','webpage','',NULL,1363018638,0,'n',0,'','n','n','o',2611),(4,1,3,'home_page','y','webpage','','',1363018670,1,'n',0,'','n','n','o',43),(5,1,3,'_top','y','webpage','','',1363018684,1,'n',0,'','n','n','o',0),(6,1,3,'_bottom','y','webpage','','',1363018693,1,'n',0,'','n','n','o',0),(7,1,3,'_header','y','webpage','','',1363018810,1,'n',0,'','n','n','o',0),(8,1,3,'_footer','y','webpage','','',1363018820,1,'n',0,'','n','n','o',0),(9,1,3,'interior_page','y','webpage','','',1363018850,1,'n',0,'','n','n','o',1),(10,1,3,'expertise_page','y','webpage','','',1363105881,1,'n',0,'','n','n','o',62),(11,1,3,'contact_page','y','webpage','','',1363105895,1,'n',0,'','n','n','o',51),(12,1,3,'case_study_page','y','webpage','','',1363105911,1,'n',0,'','n','n','o',0),(13,1,3,'journal_listing_page','y','webpage','','',1363105928,1,'n',0,'','n','n','o',170),(14,1,3,'journal_detail_page','y','webpage','','',1363105947,1,'n',0,'','n','n','o',157),(15,1,3,'results_page','y','webpage','','',1363106596,1,'n',0,'','n','n','o',50),(16,1,3,'team_page','y','webpage','','',1363106616,1,'n',0,'','n','n','o',133),(17,1,3,'_page_header','y','webpage','','',1363116544,1,'n',0,'','n','n','o',0),(18,1,3,'_team_member_component','y','webpage','','',1363116809,1,'n',0,'','n','n','o',0),(19,1,3,'redirect_to_team_page','y','webpage','','',1363118099,1,'n',0,'','n','n','o',8),(20,1,3,'_journal_detail_footer','y','webpage','','',1363195320,1,'n',0,'','n','n','o',0);
/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_throttle`
--

LOCK TABLES `exp_throttle` WRITE;
/*!40000 ALTER TABLE `exp_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_no_access`
--

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
INSERT INTO `exp_upload_prefs` VALUES (1,1,'Main Image Uploads','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/','http://20mile/images/uploads/','all','','','','','','','','','','',NULL),(2,1,'Member Photos','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/','http://20mile/images/member_photos/','img','','','','','','','','','','',NULL),(3,1,'Result Desktop Images','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/desktop/','http://20mile/images/uploads/result_images/desktop/','img','','','','','','','','','','',NULL),(4,1,'Result Tablet Images','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/tablet/','http://20mile/images/uploads/result_images/tablet/','img','','','','','','','','','','',NULL),(5,1,'Result Mobile Images','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/result_images/mobile/','http://20mile/images/uploads/result_images/mobile/','img','','','','','','','','','','',NULL);
/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_wygwam_configs`
--

DROP TABLE IF EXISTS `exp_wygwam_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_wygwam_configs`
--

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;
INSERT INTO `exp_wygwam_configs` VALUES (1,'Basic','YTo1OntzOjc6InRvb2xiYXIiO2E6MTA6e2k6MDtzOjQ6IkJvbGQiO2k6MTtzOjY6Ikl0YWxpYyI7aToyO3M6OToiVW5kZXJsaW5lIjtpOjM7czo2OiJTdHJpa2UiO2k6NDtzOjEyOiJOdW1iZXJlZExpc3QiO2k6NTtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NjtzOjQ6IkxpbmsiO2k6NztzOjY6IlVubGluayI7aTo4O3M6NjoiQW5jaG9yIjtpOjk7czo1OiJBYm91dCI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxNDoicmVzaXplX2VuYWJsZWQiO3M6MToieSI7czoxMToiY29udGVudHNDc3MiO2E6MDp7fXM6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),(2,'Full','YTo1OntzOjc6InRvb2xiYXIiO2E6Njc6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6NDoiU2F2ZSI7aToyO3M6NzoiTmV3UGFnZSI7aTozO3M6NzoiUHJldmlldyI7aTo0O3M6OToiVGVtcGxhdGVzIjtpOjU7czozOiJDdXQiO2k6NjtzOjQ6IkNvcHkiO2k6NztzOjU6IlBhc3RlIjtpOjg7czo5OiJQYXN0ZVRleHQiO2k6OTtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjEwO3M6NToiUHJpbnQiO2k6MTE7czoxMjoiU3BlbGxDaGVja2VyIjtpOjEyO3M6NToiU2NheXQiO2k6MTM7czo0OiJVbmRvIjtpOjE0O3M6NDoiUmVkbyI7aToxNTtzOjQ6IkZpbmQiO2k6MTY7czo3OiJSZXBsYWNlIjtpOjE3O3M6OToiU2VsZWN0QWxsIjtpOjE4O3M6MTI6IlJlbW92ZUZvcm1hdCI7aToxOTtzOjQ6IkZvcm0iO2k6MjA7czo4OiJDaGVja2JveCI7aToyMTtzOjU6IlJhZGlvIjtpOjIyO3M6OToiVGV4dEZpZWxkIjtpOjIzO3M6ODoiVGV4dGFyZWEiO2k6MjQ7czo2OiJTZWxlY3QiO2k6MjU7czo2OiJCdXR0b24iO2k6MjY7czoxMToiSW1hZ2VCdXR0b24iO2k6Mjc7czoxMToiSGlkZGVuRmllbGQiO2k6Mjg7czoxOiIvIjtpOjI5O3M6NDoiQm9sZCI7aTozMDtzOjY6Ikl0YWxpYyI7aTozMTtzOjk6IlVuZGVybGluZSI7aTozMjtzOjY6IlN0cmlrZSI7aTozMztzOjk6IlN1YnNjcmlwdCI7aTozNDtzOjExOiJTdXBlcnNjcmlwdCI7aTozNTtzOjEyOiJOdW1iZXJlZExpc3QiO2k6MzY7czoxMjoiQnVsbGV0ZWRMaXN0IjtpOjM3O3M6NzoiT3V0ZGVudCI7aTozODtzOjY6IkluZGVudCI7aTozOTtzOjEwOiJCbG9ja3F1b3RlIjtpOjQwO3M6OToiQ3JlYXRlRGl2IjtpOjQxO3M6MTE6Ikp1c3RpZnlMZWZ0IjtpOjQyO3M6MTM6Ikp1c3RpZnlDZW50ZXIiO2k6NDM7czoxMjoiSnVzdGlmeVJpZ2h0IjtpOjQ0O3M6MTI6Ikp1c3RpZnlCbG9jayI7aTo0NTtzOjQ6IkxpbmsiO2k6NDY7czo2OiJVbmxpbmsiO2k6NDc7czo2OiJBbmNob3IiO2k6NDg7czo1OiJJbWFnZSI7aTo0OTtzOjU6IkZsYXNoIjtpOjUwO3M6NToiVGFibGUiO2k6NTE7czoxNDoiSG9yaXpvbnRhbFJ1bGUiO2k6NTI7czo2OiJTbWlsZXkiO2k6NTM7czoxMToiU3BlY2lhbENoYXIiO2k6NTQ7czo5OiJQYWdlQnJlYWsiO2k6NTU7czo4OiJSZWFkTW9yZSI7aTo1NjtzOjEwOiJFbWJlZE1lZGlhIjtpOjU3O3M6MToiLyI7aTo1ODtzOjY6IlN0eWxlcyI7aTo1OTtzOjY6IkZvcm1hdCI7aTo2MDtzOjQ6IkZvbnQiO2k6NjE7czo4OiJGb250U2l6ZSI7aTo2MjtzOjk6IlRleHRDb2xvciI7aTo2MztzOjc6IkJHQ29sb3IiO2k6NjQ7czo4OiJNYXhpbWl6ZSI7aTo2NTtzOjEwOiJTaG93QmxvY2tzIjtpOjY2O3M6NToiQWJvdXQiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjEwOiJ1cGxvYWRfZGlyIjtzOjE6IjEiO30=');
/*!40000 ALTER TABLE `exp_wygwam_configs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-25 12:57:42
