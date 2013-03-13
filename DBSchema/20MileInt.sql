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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_files`
--

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;
INSERT INTO `exp_assets_files` VALUES (1,1,'ee',NULL,2,'dave-fravel-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363118777,'image',437,656,77709,'dave-fravel-c.jpg'),(2,1,'ee',NULL,2,'dave-fravel-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363118788,'image',255,316,18533,'dave-fravel-bw.jpg'),(3,1,'ee',NULL,2,'amy-reddington-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155165,'image',255,316,21177,'amy-reddington-bw.jpg'),(4,1,'ee',NULL,2,'amy-reddington-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157353,'image',437,656,80783,'amy-reddington-c.jpg'),(5,1,'ee',NULL,2,'chris-obrien-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155161,'image',255,316,23939,'chris-obrien-bw.jpg'),(6,1,'ee',NULL,2,'chris-obrien-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157351,'image',437,656,90119,'chris-obrien-c.jpg'),(7,1,'ee',NULL,2,'dave-fontes-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157307,'image',255,316,19917,'dave-fontes-bw.jpg'),(8,1,'ee',NULL,2,'dave-fontes-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157349,'image',437,656,75420,'dave-fontes-c.jpg'),(9,1,'ee',NULL,2,'emily-obrien-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155156,'image',255,316,20765,'emily-obrien-bw.jpg'),(10,1,'ee',NULL,2,'emily-obrien-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157344,'image',437,656,76684,'emily-obrien-c.jpg'),(11,1,'ee',NULL,2,'rodrigo-passos-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155154,'image',255,316,21010,'rodrigo-passos-bw.jpg'),(12,1,'ee',NULL,2,'rodrigo-passos-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157342,'image',437,656,79479,'rodrigo-passos-c.jpg'),(13,1,'ee',NULL,2,'sue-malomo-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155152,'image',255,316,26792,'sue-malomo-bw.jpg'),(14,1,'ee',NULL,2,'sue-malomo-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157339,'image',437,656,88412,'sue-malomo-c.jpg'),(15,1,'ee',NULL,2,'tim-merrill-bw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362155150,'image',255,316,17438,'tim-merrill-bw.jpg'),(16,1,'ee',NULL,2,'tim-merrill-c.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1362157338,'image',437,656,69183,'tim-merrill-c.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_folders`
--

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;
INSERT INTO `exp_assets_folders` VALUES (1,'ee','Member Photos','',NULL,NULL,2);
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
INSERT INTO `exp_channel_data` VALUES (1,1,3,'',NULL,'',NULL,'<p>\n	Dave Fravel started 20Mile Interactive in a home office under his stairs in 2007 after 15 years of working for large software companies. When he&#39;s not meeting with clients or brainstorming with the 20Mile team, Dave can be found hanging out with his three kids, sitting on Sandy Neck Beach, running through the Trail of Tears in Barnstable or tasting the latest beers @ the Hyannis BBC.</p>',NULL,'{filedir_2}dave-fravel-c.jpg','none','{filedir_2}dave-fravel-bw.jpg','none','President','none','74BDE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(2,1,3,'',NULL,'',NULL,'','none','{filedir_2}rodrigo-passos-c.jpg','none','{filedir_2}rodrigo-passos-bw.jpg','none','Senior Web Developer','none','F05921','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(3,1,3,'',NULL,'',NULL,'','none','{filedir_2}tim-merrill-c.jpg','none','{filedir_2}tim-merrill-bw.jpg','none','Creative Director','none','A5CD38','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(4,1,3,'',NULL,'',NULL,'','none','{filedir_2}sue-malomo-c.jpg','none','{filedir_2}sue-malomo-bw.jpg','none','Project Manager','none','EDECE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(5,1,3,'',NULL,'',NULL,'','none','{filedir_2}dave-fontes-c.jpg','none','{filedir_2}dave-fontes-bw.jpg','none','Senior Web Developer','none','F05921','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(6,1,3,'',NULL,'',NULL,'','none','{filedir_2}amy-reddington-c.jpg','none','{filedir_2}amy-reddington-bw.jpg','none','Project Manager','none','EDECE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(7,1,3,'',NULL,'',NULL,'<p>\n	Chris is a multi-disciplinary designer who crafts beautiful, usable web experiences with a keen eye for details and a strong sense of purpose and utility. He approaches projects with strategic, creative thinking and a passion for finding the best design solutions.</p>','none','{filedir_2}chris-obrien-c.jpg','none','{filedir_2}chris-obrien-bw.jpg','none','Director of UX','none','A5CD38','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(8,1,3,'',NULL,'',NULL,'','none','{filedir_2}emily-obrien-c.jpg','none','{filedir_2}emily-obrien-bw.jpg','none','Office','none','EDECE8','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(9,1,3,NULL,NULL,NULL,NULL,NULL,'none',NULL,'none',NULL,'none',NULL,'none','','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(10,1,1,'<p>\n	This is the home page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(11,1,1,'<p>\n	Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(12,1,1,'<p>\n	Results page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(13,1,1,'<p>Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(14,1,1,'<p>\n	Journal page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(15,1,1,'<p>\n	Contact page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','xhtml'),(16,1,2,'',NULL,'<p>\n	I&#39;m amazed Tim is still talking to me. I&#39;m even more amazed that he didn&#39;t punch me in the face and quit at least 4 times over the past month. Poor Tim.He had no idea what he was getting himself into when he raised his hand during a meeting and took on the challenge of telling the 20Mile story.&nbsp;</p>\n<!--read_more-->\n<p>\n	&nbsp;</p>\n<p>\n	When this was a company of one providing database and web development services the story was simple --&gt; Hi. I&#39;m Dave. I&#39;m a nice guy. Here&#39;s my rate. Here&#39;s what I can do for you. Here&#39;s when I can start. Here&#39;s how long the project will take.</p>\n<p>\n	Now that we&#39;ve grown as a company and our services have expanded, we have a new story to tell. 20Mile is no longer me sitting in my 6x8 home office under the stairs. 20Mile is now eight people (and growing) providing brand, design, development and marketing services for over 100 clients.</p>\n<p>\n	Tim was confident. He tells stories for a living. He&#39;s been doing this for almost 15 years and knew he was up to the challenge of telling our story.</p>\n<p>\n	This brings me back to Tim and the challenge of creating a design that will tell our story. One suggestion was a name change. 20Mile doesn&#39;t provide the foundation for a great story. Tim offered at least 20 reasonable choices (and at least that many unreasonable ones). He created logos for one possible name. Every day or two I&#39;d get an IM from him with a new suggestion. My problem was that</p>\n<p>\n	We are a partner, collaborator, cheerleader, mentor, thinker and listener. We don&#39;t walk into a client (or prospect) and tell them what to do. We listen first. We ask questions. We get to know them, understand their challenges, their business goals, where they&#39;ve been and where they want to go. We guide, suggest, advise, counsel and, when necessary, lead.&nbsp;</p>\n<p>\n	Our strength is in our expertise and our ability to build relationships - both with our clients and their audience. We&#39;re not here to sprint to a finish line, put up a site and disappear. We&#39;re here for the long-term, to help our clients develop and nurture their online identities - to help them tell their stories in a way that will connect with their audience.</p>\n<p>\n	In those days, when people asked me \"Why 20Mile?\" I could explain that the name came to me when I was training for marathons. The 20 mile run was one of the best and worst ways to spend a Sunday morning. I&#39;d head out with a couple friends and we&#39;d keep putting one foot in front of the other for three hours. We&#39;d talk about everything. We&#39;d push and pull each other.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'We are a partner, collaborator, cheerleader, mentor, thinker and listener.','none','','xhtml');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'page_content','Page Content','','wygwam','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(2,1,2,'journal_content','Journal Content','','wygwam','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(4,1,3,'team_bio','Team Bio','','wygwam','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','y','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(5,1,3,'profile_photo','Profile Photo','Full photo for profile detail page','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(6,1,3,'profile_headshot','Profile Headshot','Headshot for thumbnail','file','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(7,1,3,'job_title','Job Title','','text','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','y','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,3,'profile_group_color','Group Color','','pt_dropdown','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',5,'any','YTo3OntzOjc6Im9wdGlvbnMiO2E6NTp7czo2OiI3NEJERTgiO3M6OToiT3duZXJzaGlwIjtzOjY6IkVERUNFOCI7czoxNToiUHJvamVjdCBNYW5hZ2VyIjtzOjY6IkE1Q0QzOCI7czoxNzoiRGVzaWduZXIvQ3JlYXRpdmUiO3M6NjoiRjA1OTIxIjtzOjExOiJEZXZlbG9wbWVudCI7czo2OiJGRkZGRkYiO3M6NjoiT2ZmaWNlIjt9czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(9,1,3,'profile_twitter','Twitter','','text','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(10,1,3,'profile_linkedin','Linkedin','','text','','0',0,0,'channel',2,'title','desc',0,6,250,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(11,1,3,'profile_first_question','First Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(12,1,3,'profile_second_question','Second Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',9,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(13,1,3,'profile_third_question','Third Question','','text','','0',0,0,'channel',2,'title','desc',0,6,255,'n','ltr','n','n','none','n',10,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(14,1,2,'journal_blockquote','Blockquote','','text','','0',0,0,'channel',2,'title','desc',0,6,250,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(15,1,2,'journal_tags','Tags','','tag','','0',0,0,'channel',2,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',3,'any','YToxMDp7czo4OiJhbGxfb3BlbiI7czoyOiJubyI7czoxMjoic3VnZ2VzdF9mcm9tIjtzOjU6Imdyb3VwIjtzOjk6InRhZ19ncm91cCI7czoxOiIxIjtzOjEzOiJ0b3BfdGFnX2xpbWl0IjtzOjE6IjMiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ==');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (1,1,3,2,0,0,'127.0.0.1','Dave Fravel','dfravel','open','y',0,0,0,0,'n','n',1359839635,'n','2013','02','02',0,0,20130313140756,NULL,0),(2,1,3,3,0,0,'127.0.0.1','Rodrigo Passos','rpassos','open','y',0,0,0,0,'n','n',1359839919,'n','2013','02','02',0,0,20130313140940,NULL,0),(3,1,3,4,0,0,'127.0.0.1','Tim Merrill','tmerrill','open','y',0,0,0,0,'n','n',1359840023,'n','2013','02','02',0,0,20130313140924,NULL,0),(4,1,3,5,0,0,'127.0.0.1','Sue Malomo','smalomo','open','y',0,0,0,0,'n','n',1359841454,'n','2013','02','02',0,0,20130313140915,NULL,0),(5,1,3,6,0,0,'127.0.0.1','David Fontes','dfontes','open','y',0,0,0,0,'n','n',1359841545,'n','2013','02','02',0,0,20130313140946,NULL,0),(6,1,3,7,0,0,'127.0.0.1','Amy Reddington','areddington','open','y',0,0,0,0,'n','n',1359841503,'n','2013','02','02',0,0,20130313140904,NULL,0),(7,1,3,8,0,0,'127.0.0.1','Chris OBrien','cobrien','open','y',0,0,0,0,'n','n',1359841570,'n','2013','02','02',0,0,20130313141211,NULL,0),(8,1,3,9,0,0,'127.0.0.1','Emily OBrien','eobrien','open','y',0,0,0,0,'n','n',1359841612,'n','2013','02','02',0,0,20130313140953,NULL,0),(9,1,3,1,0,0,'71.233.247.104','Admin','admin','open','y',0,0,0,0,'y','n',1359854848,'n','2013','02','02',0,0,20130202202728,NULL,0),(10,1,1,1,0,NULL,'127.0.0.1','Home','home','open','y',0,0,0,0,'n','n',1363018914,'n','2013','03','11',0,0,20130312141855,0,0),(11,1,1,1,0,NULL,'127.0.0.1','Expertise','expertise','open','y',0,0,0,0,'n','n',1363018954,'n','2013','03','11',0,0,20130312171835,0,0),(12,1,1,1,0,NULL,'127.0.0.1','Results','results','open','y',0,0,0,0,'n','n',1363018988,'n','2013','03','11',0,0,20130312164409,0,0),(13,1,1,1,0,NULL,'127.0.0.1','Team','team','open','y',0,0,0,0,'n','n',1363019562,'n','2013','03','11',0,0,20130312194343,0,0),(14,1,1,1,0,NULL,'127.0.0.1','Journal','journal','open','y',0,0,0,0,'n','n',1363019561,'n','2013','03','11',0,0,20130312170442,0,0),(15,1,1,1,0,NULL,'127.0.0.1','Contact','contact','open','y',0,0,0,0,'n','n',1363019562,'n','2013','03','11',0,0,20130312164443,0,0),(16,1,2,1,0,NULL,'127.0.0.1','The Story Behind 20Mile','the-story-behind-20mile','open','y',0,0,0,0,'n','n',1363189296,'n','2013','03','13',0,0,20130313104136,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'pages','Pages','http://20mile.20miletech.net/','','en',6,0,1363019562,0,'',1,'open',1,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,'','','y','','n',10,'','',0),(2,1,'journal','Journal','http://20mile.20miletech.net/',NULL,'en',1,0,1363189296,0,'1',1,'open',2,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),(3,1,'team_profiles','Team Profiles','http://20mile.20miletech.net/',NULL,'en',9,0,1359854848,0,'',1,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0),(4,1,'results','Results','http://20mile/',NULL,'en',0,0,0,0,'1',1,'open',4,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'admin','173.162.198.217',1359648945,'Logged in'),(2,1,1,'admin','173.162.198.217',1359648970,'Logged in'),(3,1,1,'admin','173.162.198.217',1359734790,'Logged in'),(4,1,1,'admin','173.162.198.217',1359735087,'Channel Created:&nbsp;&nbsp;pages'),(5,1,1,'admin','173.162.198.217',1359735134,'Field Group Created:&nbsp;Pages Fields'),(6,1,1,'admin','173.162.198.217',1359735209,'Field Group Created:&nbsp;Journal Fields'),(7,1,1,'admin','173.162.198.217',1359837983,'Logged in'),(8,1,1,'admin','173.162.198.217',1359838028,'Channel Created:&nbsp;&nbsp;Journal'),(9,1,1,'admin','173.162.198.217',1359839333,'Channel Created:&nbsp;&nbsp;Team Profiles'),(10,1,1,'admin','173.162.198.217',1359839353,'Field Group Created:&nbsp;Team Profile fields'),(11,1,1,'admin','173.162.198.217',1359839594,'Member profile created:&nbsp;&nbsp;dfravel'),(12,1,1,'admin','173.162.198.217',1359839975,'Member profile created:&nbsp;&nbsp;rpassos'),(13,1,1,'admin','173.162.198.217',1359840014,'Member profile created:&nbsp;&nbsp;tmerrill'),(14,1,1,'admin','173.162.198.217',1359841487,'Member profile created:&nbsp;&nbsp;smalomo'),(15,1,1,'admin','173.162.198.217',1359841521,'Member profile created:&nbsp;&nbsp;dfontes'),(16,1,1,'admin','173.162.198.217',1359841547,'Member profile created:&nbsp;&nbsp;areddington'),(17,1,1,'admin','173.162.198.217',1359841576,'Member profile created:&nbsp;&nbsp;cobrien'),(18,1,1,'admin','173.162.198.217',1359841601,'Member profile created:&nbsp;&nbsp;eobrien'),(19,1,1,'admin','71.233.247.104',1359854822,'Logged in'),(20,1,1,'admin','173.162.198.217',1362667443,'Logged in'),(21,1,1,'admin','127.0.0.1',1363017873,'Logged in'),(22,1,1,'admin','127.0.0.1',1363094883,'Logged in'),(23,1,1,'admin','127.0.0.1',1363095655,'Category Group Created:&nbsp;&nbsp;Expertise'),(24,1,1,'admin','127.0.0.1',1363105848,'Logged in'),(25,1,1,'admin','127.0.0.1',1363107940,'Field Group Created:&nbsp;Result Fields'),(26,1,1,'admin','127.0.0.1',1363107953,'Channel Created:&nbsp;&nbsp;Results'),(27,1,1,'admin','127.0.0.1',1363115952,'Logged out'),(28,1,1,'admin','127.0.0.1',1363116401,'Logged in'),(29,1,1,'admin','127.0.0.1',1363183093,'Logged in');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Safecracker_ext','form_declaration_modify_data','form_declaration_modify_data','',10,'2.1','y'),(2,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0','y'),(3,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0','y'),(4,'Rte_ext','publish_form_entry_data','publish_form_entry_data','',10,'1.0','y'),(5,'Matrix_ext','channel_entries_tagdata','channel_entries_tagdata','',10,'2.5.3','y'),(6,'Playa_ext','channel_entries_tagdata','channel_entries_tagdata','',9,'4.3.3','y'),(7,'Structure_ext','entry_submission_redirect','entry_submission_redirect','',10,'3.3.8','y'),(8,'Structure_ext','cp_member_login','cp_member_login','',10,'3.3.8','y'),(9,'Structure_ext','sessions_start','sessions_start','',10,'3.3.8','y'),(10,'Structure_ext','channel_module_create_pagination','channel_module_create_pagination','',9,'3.3.8','y'),(11,'Structure_ext','wygwam_config','wygwam_config','',10,'3.3.8','y'),(12,'Structure_ext','core_template_route','core_template_route','',10,'3.3.8','y'),(13,'Structure_ext','entry_submission_end','entry_submission_end','',10,'3.3.8','y'),(14,'Structure_ext','safecracker_submit_entry_end','safecracker_submit_entry_end','',10,'3.3.8','y'),(16,'Assets_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.0.3','y'),(17,'Assets_ext','file_after_save','file_after_save','',9,'2.0.3','y'),(18,'Assets_ext','files_after_delete','files_after_delete','',8,'2.0.3','y'),(19,'Detour_pro_ext','sessions_start','sessions_start','b:0;',1,'1.3.2','y'),(20,'Super_search_ext','entry_submission_absolute_end','entry_submission_absolute_end','',10,'2.0.5','y'),(21,'Super_search_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.0.5','y'),(22,'Super_search_ext','refresh_cache_from_template','edit_template_end','',10,'2.0.5','y'),(23,'Super_search_ext','refresh_cache_from_weblog','submit_new_entry_end','',10,'2.0.5','y'),(24,'Super_search_ext','refresh_cache_from_weblog','entry_submission_end','',10,'2.0.5','y'),(25,'Super_search_ext','refresh_cache_from_category','publish_admin_update_category','',10,'2.0.5','y'),(26,'Super_search_ext','sessions_end_processor','sessions_end','',10,'2.0.5','y'),(27,'Super_search_ext','super_search_alter_search_check_group','super_search_alter_search','',5,'2.0.5','y'),(28,'Super_search_ext','super_search_alter_search_multiselect','super_search_alter_search','',6,'2.0.5','y'),(29,'Super_search_ext','super_search_alter_search_playa','super_search_alter_search','',7,'2.0.5','y'),(30,'Super_search_ext','super_search_alter_search_relationship','super_search_alter_search','',4,'2.0.5','y'),(31,'Super_search_ext','super_search_extra_basic_fields_tag','super_search_extra_basic_fields','',5,'2.0.5','y'),(32,'Super_search_ext','super_search_alter_ids_tag','super_search_alter_ids','',5,'2.0.5','y'),(33,'Super_search_ext','super_search_do_search_and_array_playa','super_search_do_search_and_array','',5,'2.0.5','y'),(37,'Profile_ext','member_member_register','member_member_register','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(38,'Profile_ext','cp_members_member_create','cp_members_member_create','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(39,'Profile_ext','cp_js_end','cp_js_end','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(40,'Profile_ext','entry_submission_start','entry_submission_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(41,'Profile_ext','safecracker_entry_form_tagdata_start','safecracker_entry_form_tagdata_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(42,'Profile_ext','safecracker_submit_entry_start','safecracker_submit_entry_start','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(43,'Profile_ext','safecracker_submit_entry_end','safecracker_submit_entry_end','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(44,'Profile_ext','publish_form_entry_data','publish_form_entry_data','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',10,'1.0.7','y'),(45,'Profile_ext','entry_submission_redirect','entry_submission_redirect','a:10:{s:10:\"channel_id\";s:1:\"3\";s:23:\"allow_multiple_profiles\";b:0;s:21:\"use_email_as_username\";s:1:\"1\";s:28:\"login_after_email_activation\";b:0;s:24:\"global_profile_variables\";b:0;s:22:\"auto_title_screen_name\";s:1:\"1\";s:23:\"auto_url_title_username\";s:1:\"1\";s:24:\"require_current_password\";s:1:\"1\";s:24:\"require_password_confirm\";s:1:\"1\";s:21:\"require_email_confirm\";s:1:\"1\";}',1,'1.0.7','y'),(46,'Tag_ext','delete_entries_start','delete_entries_start','',4,'4.2.1','y'),(47,'Tag_ext','sessions_end','sessions_end','',4,'4.2.1','y'),(48,'Tag_ext','entry_submission_end','entry_submission_end','',4,'4.2.1','y'),(49,'Tag_ext','cp_js_end','cp_js_end','',4,'4.2.1','y');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'xhtml'),(4,2,'none'),(5,2,'br'),(6,2,'xhtml'),(10,4,'none'),(11,4,'br'),(12,4,'xhtml'),(13,5,'none'),(14,5,'br'),(15,5,'xhtml'),(16,6,'none'),(17,6,'br'),(18,6,'xhtml'),(19,7,'none'),(20,7,'br'),(21,7,'xhtml'),(22,8,'none'),(23,8,'br'),(24,8,'xhtml'),(25,9,'none'),(26,9,'br'),(27,9,'xhtml'),(28,10,'none'),(29,10,'br'),(30,10,'xhtml'),(31,11,'none'),(32,11,'br'),(33,11,'xhtml'),(34,12,'none'),(35,12,'br'),(36,12,'xhtml'),(37,13,'none'),(38,13,'br'),(39,13,'xhtml'),(40,14,'none'),(41,14,'br'),(42,14,'xhtml'),(43,15,'none'),(44,15,'br'),(45,15,'xhtml');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Pages Fields'),(2,1,'Journal Fields'),(3,1,'Team Profile fields'),(4,1,'Result Fields');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_dimensions`
--

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'dave-fravel-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-c.jpg','image/jpeg','dave-fravel-c.jpg',77709,NULL,NULL,NULL,1,1363118776,1,1363118854,'656 437'),(2,1,'dave-fravel-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fravel-bw.jpg','image/jpeg','dave-fravel-bw.jpg',18533,NULL,NULL,NULL,1,1363118788,1,1363118854,'316 255'),(3,1,'amy-reddington-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-bw.jpg','image/jpeg','amy-reddington-bw.jpg',21177,NULL,NULL,NULL,1,1362155165,1,1362155165,'316 255'),(4,1,'amy-reddington-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/amy-reddington-c.jpg','image/jpeg','amy-reddington-c.jpg',80783,NULL,NULL,NULL,1,1362157353,1,1362157353,'656 437'),(5,1,'chris-obrien-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-bw.jpg','image/jpeg','chris-obrien-bw.jpg',23939,NULL,NULL,NULL,1,1362155161,1,1362155161,'316 255'),(6,1,'chris-obrien-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/chris-obrien-c.jpg','image/jpeg','chris-obrien-c.jpg',90119,NULL,NULL,NULL,1,1362157351,1,1362157351,'656 437'),(7,1,'dave-fontes-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-bw.jpg','image/jpeg','dave-fontes-bw.jpg',19917,NULL,NULL,NULL,1,1362157307,1,1362157307,'316 255'),(8,1,'dave-fontes-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/dave-fontes-c.jpg','image/jpeg','dave-fontes-c.jpg',75420,NULL,NULL,NULL,1,1362157349,1,1362157349,'656 437'),(9,1,'emily-obrien-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-bw.jpg','image/jpeg','emily-obrien-bw.jpg',20765,NULL,NULL,NULL,1,1362155156,1,1362155156,'316 255'),(10,1,'emily-obrien-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/emily-obrien-c.jpg','image/jpeg','emily-obrien-c.jpg',76684,NULL,NULL,NULL,1,1362157344,1,1362157344,'656 437'),(11,1,'rodrigo-passos-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-bw.jpg','image/jpeg','rodrigo-passos-bw.jpg',21010,NULL,NULL,NULL,1,1362155154,1,1362155154,'316 255'),(12,1,'rodrigo-passos-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/rodrigo-passos-c.jpg','image/jpeg','rodrigo-passos-c.jpg',79479,NULL,NULL,NULL,1,1362157342,1,1362157342,'656 437'),(13,1,'sue-malomo-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-bw.jpg','image/jpeg','sue-malomo-bw.jpg',26792,NULL,NULL,NULL,1,1362155152,1,1362155152,'316 255'),(14,1,'sue-malomo-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/sue-malomo-c.jpg','image/jpeg','sue-malomo-c.jpg',88412,NULL,NULL,NULL,1,1362157339,1,1362157339,'656 437'),(15,1,'tim-merrill-bw.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-bw.jpg','image/jpeg','tim-merrill-bw.jpg',17438,NULL,NULL,NULL,1,1362155150,1,1362155150,'316 255'),(16,1,'tim-merrill-c.jpg',2,'/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/tim-merrill-c.jpg','image/jpeg','tim-merrill-c.jpg',69183,NULL,NULL,NULL,1,1362157338,1,1362157338,'656 437');
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
INSERT INTO `exp_freeform_fields` VALUES (1,1,'first_name','First Name','text','{\"field_length\":150,\"field_content_type\":\"any\"}',1,1359649793,0,'n','y','y','y','This field contains the user\'s first name.'),(2,1,'last_name','Last Name','text','{\"field_length\":150,\"field_content_type\":\"any\"}',1,1359649793,0,'n','y','y','y','This field contains the user\'s last name.'),(3,1,'email','Email','text','{\"field_length\":150,\"field_content_type\":\"email\"}',1,1359649793,0,'n','y','y','y','A basic email field for collecting stuff like an email address.'),(4,1,'user_message','Message','textarea','{\"field_ta_rows\":6}',1,1359649793,0,'n','y','y','y','This field contains the user\'s message.');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_form_entries_1`
--

LOCK TABLES `exp_freeform_form_entries_1` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` DISABLE KEYS */;
INSERT INTO `exp_freeform_form_entries_1` VALUES (1,1,0,'y','127.0.0.1',1359649793,0,'pending','Jake','Solspace','support@solspace.com','Welcome to Freeform. We hope that you will enjoy Solspace software.');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_matrix_cols`
--

LOCK TABLES `exp_matrix_cols` WRITE;
/*!40000 ALTER TABLE `exp_matrix_cols` DISABLE KEYS */;
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
INSERT INTO `exp_members` VALUES (1,1,'admin','Admin','ddff76872107e2d87d7786bb260a8350e91552b36da402f8ae3666248a69f9e53f27943dc8889955c0eca7c77a734cba29c6ec56ff52cff5513fa9e4a0e660f9','KI&X_p6^L!Eo5<Q%.MfHZx)S}hM3%D{!F$XEk#bgRf|p@Ce@;m%/H`GIP6=\\^;Ot}\'nc(CRs.Haw|&xijDvG]CxN$|a.ZXC-qg)<{cayUp;#H%nnEuERdVg-!:Lp^cPw','d9490be546faec262aefce9c499d3b9b3b9167ab','15686ae21e2b99568206625ea60c23382bf7a3be',NULL,'smalomo@20miletech.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359648902,1363123380,1363191230,8,0,0,0,1363189837,0,0,0,'n','y','y','y','y','n','n','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','','Structure|C=addons_modules&M=show_module_cp&module=structure|1','n',0,'y',0),(2,1,'dfravel','Dave Fravel','8a97a667124bd17ca1fb24623736a80e0a25ec5b71ac01238e1d76a6d860cca909f6e0ed2396bbb3024300bc5ff35894358d2d7ed9b4956287b053d3f2121aeb','_S|9uO5tszG]|>t\'$rCxGteEw6&@TN&*\\b9+\\kO;<A7?Y2/<cGxC<G~~M~=Hg!`>@r7Eg&e7X-@,Qep%\"EWy]Jpx9eU2E]0-,e9jn#B!gtU1nq!,u6;+YuN\':Hvz!ywT','b30011d8a486782eb76e393946dfc93c061dd9f7','2b6e480d70e907b413cc021301238cebf6cbb283',NULL,'dave@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359839594,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','n','n','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'rpassos','Rodrigo Passos','ee54bb05517ed9d806dae4263574a16cc6bfc6f281b1e6614984eb69af1e553662f1749703bdfcb4828ca8cb2ccfc13e77cdfb37224911dd69e2408ca0ea16cb','O@@7M(,0_(;Kgcb0q8rI+aZszt/Hs:vw;X|3rUkr0g]c6fQjr{Ap_GEa1Ws&0DH&?RX9>V`)K|<3EXm3\'[IsRu\\!>3<T]|rnCa`~{+!zI\\D^jHn&j$o*}d0=]E:N3``Q','307903d76f36e6b7b4fac7e90539a65d2502aedd','c3d47658b84eaf0fe9472575006ac615b41a41b8',NULL,'rodrigo@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359839975,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'tmerrill','Tim Merrill','e14b9fddf8dac30c6eff052000645aeb00f87864e2aa391cbe6731bc229213c2f36a34cdcc2b64c670b26fa8c1919d2c964654cd77082a2c08becdeb4d851a24','v5#.V^qn)BFf\'.5u~1Ox(G~a2-A(\'W2{k6/JhTLClM2f80u#d{TJC1+dEabKKk@z@J[R6wvo:GNIZ<{vG[M%Mx~vb:?bX][4EK&k2MUK7!Rg{PUu{uTv2@u^ny,O1-7l','6c71da722f5567ebcd708f2325e25df2531e9724','2252b38e11ac0d51d1ee04bb47c3b7f7d1629b2b',NULL,'tim@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359840014,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'smalomo','Sue Malomo','0e5acadce66e5b28a8bbde659dd6602cb58c06644a25821a5cf5e937b140f53826f2fd9bc50b886e4b3d9d15d5fb447b33119c3e2ef80a55531bc9b7bcfe8616','g\"v%0O.)qK71Cn<!|y[Zv9_Hjj(hx$5n[Z#i\\b6m>HB?}LZyf4-gQq1FAu}9P^I:Sm*<aH?mN1h4tmiq367\",VoV%p?*#=H?.|r:QmYbSVeK@hEq:vdPICTG#.McOq\"K','f4fe34758492b28cc67482d4e046bbb4729a6b66','ca8603258609be03ae33c426308dd1cbb133583a',NULL,'sue@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841487,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'dfontes','David Fontes','c889635b55af84950ec5866424ed9a8956c6ba3954f8595faf2b32ae02f1689351547068f720018e43e08a8e9284d9f617d90480b3a2c99632d78eb3b4d9b6e3',')y4]aZ?u))]\"$>zL\"iYeH6|iCTF5<,)@l2\\<g37jYzbxn((k5\"By@ubZr{x.\\QXp`zoX#W9\\U@}pPIF8D85h)SES-n~aGmK*UU,FO\'*h.e,o#dQQl|acQy*%e;S`5q3a','05c56a5bf1cb286f621f1f9b23f21fdcb4aaa251','c39f06062fd3fbbd3b046b8a0a66876748e40110',NULL,'david@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841521,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(7,1,'areddington','Amy Reddington','0e48321ccf7ece9d595e5d7a8d5925df88bd1fc1fd33d94476f01770c491367608c392ff9c70ca40c9f739bbea8ffd8c2b2d76c7db3798fac27048653d249fb9','D5\"TqUC9q|PE6O[L=awZ7MEj+lznFLy+Lk%_{2uH@l)}+lwAQ@#5l*<,RiF#GP/^@GzWd{EC/6so[E>]w<#Sk&Fn09JLT;]{S$~Z_b\"m.S;-d<ogHSf!o_E4;42J3#,}','2dfa6b38a849bed8e05fe4bce70aa7d72e9638d3','a062ad15b6130c5a389439b2355539c3d6940f34',NULL,'amy@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841547,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(8,1,'cobrien','Chris OBrien','628da4d188ef939962cca92aaeff3203b9ab48e4ad3ce0762f07175ca0405d708dc426e4797ceac5b993f6f2df84bf6d18ed8277c4de3a58260a29d193d91a3c','Hj8FrFyl)nQ?88zvA%FTiFr\"6jtGL(`PY\\,Zye-xkinW{{Y\"5FBBs2CP91>p~;$Vn!-YA:-uI}0<2V&$\'-!J&eJ\\D!`jG7RE:&{R&:%sO-FbgD3XuSx$Ks?N&vQM}qi}','c7889cdfb2488e6e9730c451d60d84142364b61c','4e7807b8f08fa7931bc8bc78d77be0b02e55345a',NULL,'chris@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841576,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0),(9,1,'eobrien','Emily OBrien','ef8bf4b51d507ce898e080994029b6918f982c2e840360c6e00d1177c34e5130982b0c8b5f74b5ac753042205c7db0672d807d368f1b9d2b5ccc4639a8704a0e','|$I}!mos*BOJIHQR[##Q\'Q/}&6B/p\"b\"A\'g9gToIEo!_dtSDhKe*DA,jk.}D|y~4hSlz0@|(}q`l:sQoukRt\"TKG?/D^C@BZdxoe1w~Hd\'v$2``(&\'@*hsAwG,1F7ZPi','60936104c6596551bd48a8604d78ea388e286707','f9897a76af3339e90c6aacc1cbb26bc84223fa06',NULL,'emily@20mile.in','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'173.162.198.217',1359841601,0,0,1,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','UM5','n','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18',NULL,NULL,'n',0,'y',0);
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
INSERT INTO `exp_modules` VALUES (1,'Email','2.0','n','n'),(2,'File','1.0.0','n','n'),(3,'Jquery','1.0','n','n'),(4,'Query','2.0','n','n'),(5,'Rss','2.0','n','n'),(6,'Safecracker','2.1','y','n'),(7,'Search','2.2','n','n'),(8,'Channel','2.0.1','n','n'),(9,'Member','2.1','n','n'),(10,'Stats','2.0','n','n'),(11,'Rte','1.0','y','n'),(12,'Freeform','4.0.10','y','n'),(13,'Playa','4.3.3','n','n'),(14,'Structure','3.3.8','y','y'),(15,'Wygwam','2.7','y','n'),(16,'Assets','2.0.3','y','n'),(17,'Detour_pro','1.3.2','y','n'),(18,'Super_search','2.0.5','y','y'),(20,'Profile','1.0.7','y','n'),(21,'Safeharbor','1.3.3','y','n'),(22,'Tag','4.2.1','y','y');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` VALUES (5,1,0,'n','','127.0.0.1',1363191232,''),(7,1,0,'n','','127.0.0.1',1363191232,''),(8,1,0,'n','','127.0.0.1',1363191232,''),(11,1,0,'n','','127.0.0.1',1363191232,''),(12,1,0,'n','','127.0.0.1',1363191232,''),(13,1,0,'n','','127.0.0.1',1363191232,''),(14,1,0,'n','','127.0.0.1',1363191232,''),(16,1,0,'n','','127.0.0.1',1363191232,''),(18,1,0,'n','','127.0.0.1',1363191232,''),(21,1,0,'n','','127.0.0.1',1363191232,''),(22,1,0,'n','','127.0.0.1',1363191232,''),(25,1,0,'n','','127.0.0.1',1363191232,''),(27,1,0,'n','','127.0.0.1',1363191232,''),(28,1,0,'n','','127.0.0.1',1363191232,''),(31,1,0,'n','','127.0.0.1',1363191232,''),(33,1,1,'n','Admin','127.0.0.1',1363191231,''),(34,1,1,'n','Admin','127.0.0.1',1363191231,''),(35,1,0,'n','','127.0.0.1',1363191232,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (1048,1363183093,'0','6cc29037cdd4063ba735b59415e8e7ac48606208'),(1049,1363183093,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','eb1bf9d9b4a03908f39b4cf9e8eb21171ce7536b'),(1050,1363183102,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e8b307ab82fafb48dc0a38e058dd8a418b19ad9a'),(1051,1363183104,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b0e64bd4297b2e8315876c6aa7bc70f0a993f156'),(1052,1363183110,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','9ca38c1a8e0e9834b84d962b38067a22ca0e0509'),(1053,1363183159,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','24ebd2100ba168a14e9994d865d27be91ecd0d6a'),(1054,1363183226,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','40ed053a7a8d33b5a953163e5615fbaafb37d6b5'),(1055,1363183234,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','d3c2b84c217f8a8c0728fd235034d2b9cc0d8418'),(1056,1363183234,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','9a76aa1d9fd6da07f17e2d5dc0647511887250ff'),(1057,1363183242,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','82e522aeebaa3fc1ff5e6aeb84a3d9aa5a858be2'),(1058,1363183243,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','7e0aecd46bbe48fed21f64cb6da6a0b0314c4369'),(1059,1363183246,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ebb354c9215a83fa7a1cf8fba1017156aac9ee19'),(1060,1363183343,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','6803ece055538d3e982d84a7b2d2a74f4d131cb5'),(1062,1363183519,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','588e43f149a2b647e1e3d854b28ba56ca78e7854'),(1063,1363183519,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','641b700b00fb8d1542b6304e4bc35d4d9fa1513f'),(1065,1363183539,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','37c47112bc74febb37135610ea168dbd0075a97d'),(1066,1363183539,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','4aa6a6530fbccbdae6fed58da7046d9b7368ba81'),(1067,1363183658,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ea3e8f98735e26a7500656ee0a9d5a4f1da161fe'),(1069,1363183661,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','a5de211029685fd44df53bda8ade81eba19b3afe'),(1070,1363183662,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','fbf02762bd29eed0be57c6debca2901af4c257d7'),(1071,1363183662,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','794f539987856c1e5a3cfa41e7bcf369c3f4f727'),(1072,1363183663,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c415c4f683abc6ffabc82c89dc4ff79b1d576b64'),(1077,1363183667,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','2f91a487060efb519f4272ed73734b4447858570'),(1078,1363183667,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e4ca229219ba207bfec587278ae68c6101244563'),(1079,1363183668,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','cdc06cf6499defa283a3daaa9183dae092bebceb'),(1080,1363183668,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8194f3993f73517bbdb50a1df4380e189d87480f'),(1081,1363183669,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','4a3537efc3992a5a7300312575d31a02cec5a36b'),(1082,1363183670,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','169b520332d1abb09d2b4c0aea9832905ad6d781'),(1083,1363183670,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e7c28287d32fcac4e62a5effe6a8bea480ddde7a'),(1084,1363183671,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','90c5384cbe70a4476f090ad3143aa2355c5ffe96'),(1085,1363183671,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','98a98602af210f58b79c1e64377986a0ce55ccae'),(1086,1363183672,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','004d5be2ee1c48b98bca50f9c5d7e40b7a6a3e5c'),(1087,1363183672,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','1274f14b980adbcad9e9730ad9b6e217edb5a7a2'),(1088,1363183672,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','95cd4f1f318c0c9935ca390019ec90929b6151e0'),(1089,1363183672,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e1c730bf50016f559c2123b7474394bd2cad2b6a'),(1090,1363183673,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','95fad6b78b6a5998e6bb1510943e4a01cf06c5aa'),(1091,1363183673,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','4c3a3d9def3a4958033b897a527d404feaca9ef4'),(1092,1363183673,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','7d76775846154c448dbf7ca30fdac85097dab9fa'),(1093,1363183674,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','5f6e6228010bb89b11f87b6aa4e866ca2dc5cfb4'),(1094,1363183674,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','a83c21bac87f5feb3ad66be515c607d760744a15'),(1095,1363183674,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','baa37d84b15f613921776092b38f8bea1c6a2d7e'),(1096,1363183674,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','a5aecdc614b55f414c5a8bdc70c3f569ebf89327'),(1097,1363183674,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','d3a499f2cefcd9b337982276727b09e86b5f340b'),(1098,1363183675,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','dc143a7cef20eca9f53331332b9134ccb8c65621'),(1099,1363183675,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','6642be181f97939d6a83b943fa3f83e89e03433c'),(1100,1363183676,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','50390c96294f3777cacf3cc1acbb8623f3e67cd6'),(1101,1363183677,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','853819d5134b883157e97834279429b140b534dc'),(1102,1363183697,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','94d1ce968430ca0248c9560e4267d335bbec275f'),(1104,1363183731,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c618dee535fab0c2b0286f22542e43f69304a060'),(1105,1363183732,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e3950be9ac6268167f12c89273d8c7c7a27442eb'),(1107,1363183737,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','6cf68aa121ea6677131beee9a5f2fb6b8ca883a0'),(1108,1363183738,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','f1324fd9555525399e710f5f96b14e4af915177b'),(1109,1363183738,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ff2f5b3c2d2018d31219ee4f970873e6db17f3ae'),(1110,1363183738,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','7e3857337f29852f5e39cae9eb2805a4690f97be'),(1111,1363183744,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e9d1150d282ef3b5b210964c02343fdab07edb18'),(1112,1363183744,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','58b3dbec844c62b972758910fd4b45f6aab0b897'),(1114,1363183751,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','45eca67883a31fba49a0d4654eddeab2a8cc4ad7'),(1115,1363183751,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','db0c22dc30d128200722e188cd97269b543ed276'),(1116,1363183752,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','23c06af5142809d0afb02ced912266aa4febb062'),(1117,1363183752,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e92401d92a0501d23db92582e7d1d1525237cfef'),(1118,1363183755,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','3a89d513f29eb28fe6fe7ebb94267ed97f560afe'),(1119,1363183755,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','0c2e10148cacbc407fed90183ecd420d82356606'),(1121,1363183759,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b698f11bf165759e386eae4aed50828657d24920'),(1122,1363183760,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','5acfe440406f58dcff681d1decebc547d203ac4a'),(1123,1363183760,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','a96513a7b2ce24f5ed8264cb94b166f9d43fb7f2'),(1124,1363183760,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','110f4142bb9577b1ab3ded58a0d054d4b21fe7a7'),(1125,1363183764,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','359dbf52664967f6c68988cb56ff0b36fc61735d'),(1126,1363183764,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','2cbeb0e9dcd074112f9340768fc6c5537eb5418d'),(1127,1363183773,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','6803048a769e6917905f6865bae17b040b57440b'),(1128,1363183773,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c9dd3465b31bec98637e35dc53524c4c301889f1'),(1129,1363183780,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','db92a1ecfb58b3b135f9dbd3915b48bcc8111d43'),(1130,1363183781,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','3c3ba378e4e94c398f477c5be3d5f7d6fd981c51'),(1131,1363183786,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','9e621153129cea2d88665d277e8d831b984a97fc'),(1132,1363183787,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ff86463e91bc4e3cf8dfd1bf313521f9ddac8750'),(1133,1363183793,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c1b34ee8aa0bf59bd21375bbb025c89f692c74fb'),(1134,1363183794,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','881cca03d55fd14f048ae320d12a2dd952311bf3'),(1135,1363183882,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','541452df6c98e6b394af66cedb732738494ea2d2'),(1136,1363183888,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','71af9aecc63aa200ecf18731e0ee8aba3e4efd47'),(1137,1363183901,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','9faecb5e1eae57bdc7f468edf2679fcc08bfd715'),(1139,1363183922,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','5bd356c3b5b54db7fed1b09fb47b6b44a0e6230f'),(1140,1363183923,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','05e5e5404bb82f103a95deeefca6235814abf240'),(1141,1363183923,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','bc272accaf832358f7dc76fec00784a7c70d041b'),(1142,1363183923,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','991f22f906ccf4493f5e19c2beb360a23bbc032b'),(1143,1363183931,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','9387101228a91f1d391b288c07cd33a391e74998'),(1144,1363183932,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','26e7ac0be9c211f31623457c7c5ea8893459e003'),(1145,1363184343,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','d409bb563d71537862e7765eb698c070a0b926a7'),(1146,1363184361,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','2bda2aff03d53eb9acae48537bc7d8d8c0dcc7b2'),(1147,1363184365,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','f98c20feccb20ed7e06e228de72e9eb5dd10e3a7'),(1148,1363184367,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','0d928cd78c99cbe79b0d326ea796196589cb3f8d'),(1150,1363184386,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','787a2fa339234384d33948c15fb687956cb091b0'),(1151,1363184387,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b7d708dc1ece82eb575e8e3f6e10d60d005101a3'),(1153,1363184407,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','0b84bbe6ebf28483b76771b40e3b9e983ff1c9bd'),(1154,1363184407,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e6bedf336cfb5114ef8e4f5b6b65ad382e6907a0'),(1156,1363184821,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','d5cee6edabea86f4de9427f8322ceca40b2284ba'),(1157,1363184821,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','4655292bf6d039ac723019f6059e7ef054fd4db1'),(1159,1363184836,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e994c943f862903654b9518ddfedf8c9755fd3d4'),(1160,1363184836,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ae1479edf6981b1a0c42b6d133a8a0057ad40c3b'),(1162,1363184854,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','61a2f8c622ce91808b5cdddb45638f6598c1b39a'),(1163,1363184855,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','5db00f184a75d87331bff3beb1630c1808de6452'),(1164,1363186088,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','f25c811dbe9df521cdcff00ab623248d0fd28362'),(1165,1363186091,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','cf7a2d2a3da4f1ec8a4ec2e3f64d7e2f8aafbe39'),(1167,1363188685,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b985e36e8afbd8ff1d9559ba7c9b2a660f14ca1d'),(1168,1363188685,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8d351e57d6e4407da84bc67b91350789e83a3c5f'),(1169,1363188695,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','1454f0d42beb923fd3cc7ba8fbd8e0faca677097'),(1171,1363188709,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','fdef2371fa507e1f8a65482d318953a68e702d01'),(1172,1363188709,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','25b0f73a7611f1350d17ae878e98a8e7a5c08bc8'),(1173,1363188711,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','dd9dcd7f3def97abecf0929fc61be8bd5d66bf99'),(1174,1363188715,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','267ae2c986e5695a641abed53520c9024d7f1eb5'),(1175,1363188742,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','15de8e9322522c772a4c8b624f0fba9aeef1b0b5'),(1176,1363188747,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','d10e40733da3cbbcf95386d1dd0be4b3cb28bdaa'),(1177,1363188783,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8b58215a8f739edaa16aff3b11d96e04ed014734'),(1178,1363188785,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','644c66832c1a6ec26a9def06696af1d0c786b92d'),(1179,1363188824,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ecae2c7078bc85dd5b9d519962c6c41b24ab8464'),(1180,1363188834,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','80b61301df1bddcfdbef3d8e7fc6249d3687a8eb'),(1181,1363188837,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','534c3accd9b47b854cdd555428f62c4438d641cf'),(1182,1363188840,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','047bf736d83330777cec59d394c83d6ed352068b'),(1184,1363188855,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8de18bc2779565f9e33b487655a7679786db6c04'),(1185,1363188887,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','2e72b90ca87b9393848187a0559271abe685f0ef'),(1186,1363188889,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','faad980d434eb5006fcf626c7779230fb007f9f4'),(1187,1363188909,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','40224a63ede7f21257496f785f563e296cbbad88'),(1188,1363188911,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ebd1a1f4667e665adfe1d324e8c49b28c2d8417d'),(1189,1363188914,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b3e91fe8d354e1e79a3620586cc74c6e86aa3bf8'),(1190,1363188916,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','1e1caf69975960407d995dd56056a88324a4b3e0'),(1192,1363189059,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e47a05b9c00c3dc937474665a288a2d42ee84a36'),(1194,1363189062,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','1388aa3da19c8cf94f5d40af001707e6c6050eaa'),(1195,1363189063,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','27aac91039bb08cdeb9d8db2a390b747cf5ce425'),(1196,1363189068,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','321bb605495921d53f8ae3cbc79fd714ba7401c4'),(1197,1363189071,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','f96f6b53abae4fd4b3cde16eb3bc1e5586e91600'),(1198,1363189104,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','5677085754af90554dbe8070fa83fdee73550c17'),(1199,1363189107,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','20801a3ae13f66e6e0649216bd83cb0c2ff2183d'),(1201,1363189110,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','21b364e17846677ddad85f4bea5194631cedcc6b'),(1202,1363189111,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','30a6943cdaf93b298478ae93963b5fb9ee054389'),(1203,1363189114,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c4d4170797dfa67440f8453591229464a21fa964'),(1204,1363189116,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','2082ec7b430a27df61fc7581770012a39c21d4c5'),(1205,1363189125,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8c3657ec408b42d2381fbbb78c1a92c9e2a5971c'),(1206,1363189127,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','758f3aa2d6ecc3c89beab0342985900323f66e89'),(1208,1363189160,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e1e42f4fa9b80b3f18542d89e1870356f45810bc'),(1209,1363189160,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','3e1ec65d2bb355de12e11bf05aeb315793996ca3'),(1211,1363189170,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','aebc7342b1db5275abc083ac524013aa3ba2bf17'),(1212,1363189170,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','ea8e55dee533e2c37a4e4c227814312d3e1532da'),(1213,1363189289,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','0b532fe635fc5cb9758938474f895ce9a94f006e'),(1215,1363189292,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','06a056da43a9f25590422b6826f3155b93ba6644'),(1216,1363189293,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','730a56cdac68a28433f4c1285c18267e889d0a1f'),(1217,1363189293,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c9667b664581ea62acf641039e0727af3bfeee47'),(1218,1363189293,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','7ec39877a220e6f0caa0ba2d8fe88023a20a39f8'),(1219,1363189293,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b8fb1265116be17f19c53161a9be07f64eefc0b7'),(1220,1363189362,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','90a86b6ec66bb0d09a0e2a7dd1fb743a995388ce'),(1221,1363189819,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','1ebf943e3b0fa269640d64eaf676bd613a06a26e'),(1222,1363189820,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','5bb97260d3e19420464f1b8ab21d53c1af2156da'),(1223,1363189823,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','bccd27c2c021cebc2ab44eff677528172dfa4a00'),(1224,1363189827,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','905492eea18163b2df2e79b641c1a42848f7aa4e'),(1225,1363189828,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','f69db41fd760ca3a982d771005cb87732a8ebd14'),(1226,1363189829,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8b808779bb136f45568110bb9d870817073dec8e'),(1227,1363189829,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','1ad5ceda929a296ba3c21b41ab34629207f5ac4b'),(1228,1363189830,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','7e8fddde4e18d0cc5445d04a60cc17f62bcbd76c'),(1229,1363189834,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','395750ecd264253fee5e69fdb64386cc21c72c61'),(1230,1363189837,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','0d1cc46724282de020dd3872bc55e743e41bb0c6'),(1231,1363189838,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b03f0e1c97249a427010c6b824f537248e733c55'),(1232,1363189848,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','c02df24ad06f446043dcbd1b860c25c36d4ac516'),(1233,1363189855,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','6e54240441feaaa3043044306f6bf8605b1aec7c'),(1234,1363189855,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','e4ef4faf06f6e21793b75e0ee3eea20bdd745bec'),(1235,1363189857,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','b806286e9412322d88c768ddf1246896b35bfe4b'),(1236,1363189857,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','9c943b6549a9e51df48ae62fca607411f63ec890'),(1237,1363189857,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','8a6f3079373a134a635518ea02fcfb3bcd3ea6ab'),(1238,1363189857,'4d5f0e59e8d74a31baf013bb47b7c13094fce8a9','d16f2bdad66b46a43b37593857ec9c327b476f4c');
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
INSERT INTO `exp_sessions` VALUES ('4d5f0e59e8d74a31baf013bb47b7c13094fce8a9',1,1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.160 Safari/537.22',1363191231);
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
INSERT INTO `exp_sites` VALUES (1,'20Mile Interactive','default_site',NULL,'YTo5NDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjk6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjM2OiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyMjoic21hbG9tb0AyMG1pbGV0ZWNoLmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6NDU6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjU0OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJuIjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToidGltZV9mb3JtYXQiO3M6MjoidXMiO3M6MTU6InNlcnZlcl90aW1lem9uZSI7czozOiJVTTUiO3M6MTM6InNlcnZlcl9vZmZzZXQiO3M6MDoiIjtzOjE2OiJkYXlsaWdodF9zYXZpbmdzIjtzOjE6Im4iO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czozOiJVTTUiO3M6MTY6ImRlZmF1bHRfc2l0ZV9kc3QiO3M6MToibiI7czoxNToiaG9ub3JfZW50cnlfZHN0IjtzOjE6InkiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjg6ImNwX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MjE6ImVtYWlsX21vZHVsZV9jYXB0Y2hhcyI7czoxOiJuIjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTI6InNlY3VyZV9mb3JtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6NDQ6Imh0dHA6Ly8yMG1pbGUuMjBtaWxldGVjaC5uZXQvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToibiI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjQ1OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjIwOiJ1c2VfaWdub3JlX3dvcmRfbGlzdCI7czoxOiJ5IjtzOjE2OiJpZ25vcmVfd29yZF9saXN0IjtzOjE5OiJhfHxhbmR8fG9mfHxvcnx8dGhlIjt9','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjIxOiJub21lbWJlcnJlZ2lzdHJhdGlvbnMiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJuIjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjQ0OiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6NTM6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGV0ZWNoLm5ldC8yMG1pbGUvaW1hZ2VzL2F2YXRhcnMvIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjUwOiJodHRwOi8vMjBtaWxlLjIwbWlsZXRlY2gubmV0L2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo1OToiL3Zhci93d3cvdmhvc3RzLzIwbWlsZXRlY2gubmV0LzIwbWlsZS9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTU6InBob3RvX21heF93aWR0aCI7czozOiIxMDAiO3M6MTY6InBob3RvX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEyOiJwaG90b19tYXhfa2IiO3M6MjoiNTAiO3M6MTY6ImFsbG93X3NpZ25hdHVyZXMiO3M6MToibiI7czoxMzoic2lnX21heGxlbmd0aCI7czozOiI1MDAiO3M6MjE6InNpZ19hbGxvd19pbWdfaG90bGluayI7czoxOiJuIjtzOjIwOiJzaWdfYWxsb3dfaW1nX3VwbG9hZCI7czoxOiJuIjtzOjExOiJzaWdfaW1nX3VybCI7czo1ODoiaHR0cDovLzIwbWlsZS4yMG1pbGV0ZWNoLm5ldC9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjY3OiIvdmFyL3d3dy92aG9zdHMvMjBtaWxldGVjaC5uZXQvMjBtaWxlL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6NjA6Ii92YXIvd3d3L3Zob3N0cy8yMG1pbGV0ZWNoLm5ldC8yMG1pbGUvaW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToibiI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxNzoidG90YWxfZm9ydW1fcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo0ODoiL3Zhci93d3cvdmhvc3RzLzIwbWlsZXRlY2gubmV0LzIwbWlsZS90ZW1wbGF0ZXMvIjt9','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToyOntzOjcyOiIvVXNlcnMvcm9kcmlnb3Bhc3Nvcy9Eb2N1bWVudHMvUmVwb3NpdG9yaWVzLzIwbWlsZS9wdWJsaWNfaHRtbC9pbmRleC5waHAiO3M6MzI6IjNlNDQyNjRkYmExNDdhOGM3YTVlODliMTlkOTRhOTkxIjtzOjc6ImVtYWlsZWQiO2E6MDp7fX0=','YToxOntpOjE7YTozOntzOjM6InVybCI7czoxNDoiaHR0cDovLzIwbWlsZS8iO3M6NDoidXJpcyI7YToxNTp7aToxMDtzOjE6Ii8iO2k6MTE7czoxMToiL2V4cGVydGlzZS8iO2k6MTI7czo5OiIvcmVzdWx0cy8iO2k6MTM7czo2OiIvdGVhbS8iO2k6MTtzOjE4OiIvdGVhbS9kYXZlLWZyYXZlbC8iO2k6NDtzOjE3OiIvdGVhbS9zdWUtbWFsb21vLyI7aTo2O3M6MjE6Ii90ZWFtL2FteS1yZWRkaW5ndG9uLyI7aToyO3M6MjE6Ii90ZWFtL3JvZHJpZ28tcGFzc29zLyI7aTozO3M6MTg6Ii90ZWFtL3RpbS1tZXJyaWxsLyI7aTo3O3M6MTk6Ii90ZWFtL2NocmlzLW9icmllbi8iO2k6NTtzOjE5OiIvdGVhbS9kYXZpZC1mb250ZXMvIjtpOjg7czoxOToiL3RlYW0vZW1pbHktb2JyaWVuLyI7aToxNDtzOjk6Ii9qb3VybmFsLyI7aToxNTtzOjk6Ii9jb250YWN0LyI7aToxNjtzOjMzOiIvam91cm5hbC90aGUtc3RvcnktYmVoaW5kLTIwbWlsZS8iO31zOjk6InRlbXBsYXRlcyI7YToxNTp7aToxMDtzOjE6IjQiO2k6MTE7czoyOiIxMCI7aToxMjtzOjI6IjE1IjtpOjEzO3M6MjoiMTYiO2k6MTQ7czoyOiIxMyI7aToxNTtzOjI6IjExIjtpOjc7czoyOiIxOSI7aTo4O3M6MjoiMTkiO2k6NjtzOjI6IjE5IjtpOjU7czoyOiIxOSI7aTo0O3M6MjoiMTkiO2k6MztzOjI6IjE5IjtpOjI7czoyOiIxOSI7aToxO3M6MjoiMTkiO2k6MTY7czoyOiIxNCI7fX19');
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
INSERT INTO `exp_stats` VALUES (1,1,9,9,'Emily OBrien',16,0,0,0,1363189296,0,0,1363191232,18,1363190940,1363622637);
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
INSERT INTO `exp_structure` VALUES (0,0,0,0,0,1,30,'root','n'),(1,1,13,3,0,9,10,'','n'),(1,2,13,3,0,15,16,'','n'),(1,3,13,3,0,17,18,'','n'),(1,4,13,3,0,11,12,'','n'),(1,5,13,3,0,21,22,'','n'),(1,6,13,3,0,13,14,'','n'),(1,7,13,3,0,19,20,'','n'),(1,8,13,3,0,23,24,'','n'),(1,10,0,1,0,2,3,'','n'),(1,11,0,1,0,4,5,'','n'),(1,12,0,1,0,6,7,'','n'),(1,13,0,1,0,8,25,'','n'),(1,14,0,1,2,26,27,'','n'),(1,15,0,1,0,28,29,'','n');
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
INSERT INTO `exp_structure_channels` VALUES (1,1,9,'page','n','y'),(1,2,14,'listing','n','y'),(1,3,19,'page','n','y'),(1,4,0,'unmanaged','n','y');
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
INSERT INTO `exp_structure_listings` VALUES (1,16,14,2,14,'the-story-behind-20mile');
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
INSERT INTO `exp_structure_members` VALUES (1,1,'[\"13\"]');
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
INSERT INTO `exp_super_search_indexes` VALUES (1,1,1363183676),(2,1,1363183780),(3,1,1363183764),(4,1,1363183755),(5,1,1363183786),(6,1,1363183744),(7,1,1363183931),(8,1,1363183793),(10,1,1363097935),(11,1,1363108715),(12,1,1363106649),(13,1,1363117423),(14,1,1363107882),(15,1,1363106683),(16,1,1363189837);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_lexicon_log`
--

LOCK TABLES `exp_super_search_lexicon_log` WRITE;
/*!40000 ALTER TABLE `exp_super_search_lexicon_log` DISABLE KEYS */;
INSERT INTO `exp_super_search_lexicon_log` VALUES (1,'build','0||1',0,'manual',1359842375),(2,'build','0||7',0,'manual',1359842444),(3,'build','0||10',0,'manual',1363018927),(4,'build','0||11',0,'manual',1363018994),(5,'build','0||12',0,'manual',1363019023),(6,'build','0||13',0,'manual',1363019535),(7,'build','0||14',0,'manual',1363019546),(8,'build','0||15',0,'manual',1363019556),(9,'build','0||10',0,'manual',1363020221),(10,'build','0||10',0,'manual',1363021287),(11,'build','0||10',0,'manual',1363021309),(12,'build','0||10',0,'manual',1363097935),(13,'build','0||11',0,'manual',1363106637),(14,'build','0||12',0,'manual',1363106649),(15,'build','0||13',0,'manual',1363106658),(16,'build','0||14',0,'manual',1363106672),(17,'build','0||15',0,'manual',1363106683),(18,'build','0||14',0,'manual',1363107882),(19,'build','0||11',0,'manual',1363108715),(20,'build','0||13',0,'manual',1363117397),(21,'build','0||13',0,'manual',1363117423),(22,'build','0||7',0,'manual',1363117984),(23,'build','0||8',0,'manual',1363117995),(24,'build','0||6',0,'manual',1363118008),(25,'build','0||5',0,'manual',1363118028),(26,'build','0||4',0,'manual',1363118038),(27,'build','0||3',0,'manual',1363118055),(28,'build','0||2',0,'manual',1363118065),(29,'build','0||1',0,'manual',1363118076),(30,'build','0||1',0,'manual',1363118180),(31,'build','0||6',0,'manual',1363118190),(32,'build','0||4',0,'manual',1363118197),(33,'build','0||3',0,'manual',1363118205),(34,'build','0||7',0,'manual',1363118212),(35,'build','0||2',0,'manual',1363118220),(36,'build','0||5',0,'manual',1363118227),(37,'build','0||8',0,'manual',1363118234),(38,'build','0||1',0,'manual',1363118792),(39,'build','0||6',0,'manual',1363118885),(40,'build','0||4',0,'manual',1363118904),(41,'build','0||3',0,'manual',1363118929),(42,'build','0||7',0,'manual',1363118946),(43,'build','0||2',0,'manual',1363118975),(44,'build','0||5',0,'manual',1363118997),(45,'build','0||8',0,'manual',1363119017),(46,'build','0||1',0,'manual',1363183676),(47,'build','0||6',0,'manual',1363183744),(48,'build','0||4',0,'manual',1363183755),(49,'build','0||3',0,'manual',1363183764),(50,'build','0||7',0,'manual',1363183773),(51,'build','0||2',0,'manual',1363183780),(52,'build','0||5',0,'manual',1363183786),(53,'build','0||8',0,'manual',1363183793),(54,'build','0||7',0,'manual',1363183931),(55,'build','0||16',0,'manual',1363189837);
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
) ENGINE=InnoDB AUTO_INCREMENT=990 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_super_search_terms`
--

LOCK TABLES `exp_super_search_terms` WRITE;
/*!40000 ALTER TABLE `exp_super_search_terms` DISABLE KEYS */;
INSERT INTO `exp_super_search_terms` VALUES (856,'1','100','',3,0,0,0,1,''),(16,'1','15','',2,0,0,0,6,''),(880,'1','20','',2,0,0,0,1,''),(14,'1','2007','',4,0,0,0,5,''),(5,'1','20mile','M400',6,0,0,0,6,''),(26,'1','39','',2,0,0,0,6,''),(777,'1','4','',1,0,0,0,1,''),(845,'1','6x8','X000',3,0,0,0,1,''),(8,'1','a','A000',1,0,0,0,12,''),(935,'1','ability','A143',7,0,0,0,1,''),(985,'1','about','A130',5,0,0,0,1,''),(929,'1','advise','A312',6,0,0,0,1,''),(171,'1','aenean','A500',6,0,0,0,3,''),(15,'1','after','A136',5,0,0,0,5,''),(864,'1','almost','A4523',6,0,0,0,1,''),(757,'1','amazed','A523',6,0,0,0,1,''),(286,'1','amy','A500',3,0,0,0,4,''),(895,'1','an','A500',2,0,0,0,1,''),(78,'1','and','A530',3,0,0,0,7,''),(85,'1','approaches','A162',10,0,0,0,6,''),(901,'1','are','A600',3,0,0,0,1,''),(837,'1','as','A200',2,0,0,0,1,''),(915,'1','ask','A200',3,0,0,0,1,''),(958,'1','asked','A230',5,0,0,0,1,''),(775,'1','at','A300',2,0,0,0,1,''),(189,'1','auctor','A236',6,0,0,0,2,''),(939,'1','audience','A352',8,0,0,0,1,''),(184,'1','augue','A200',5,0,0,0,3,''),(870,'1','back','B200',4,0,0,0,1,''),(52,'1','barnstable','B652314',10,0,0,0,5,''),(57,'1','bbc','B200',3,0,0,0,5,''),(37,'1','be','B000',2,0,0,0,5,''),(47,'1','beach','B200',5,0,0,0,5,''),(69,'1','beautiful','B314',9,0,0,0,6,''),(862,'1','been','B500',4,0,0,0,1,''),(55,'1','beers','B620',5,0,0,0,5,''),(751,'1','behind','B530',6,0,0,0,1,''),(93,'1','best','B230',4,0,0,0,7,''),(938,'1','both','B300',4,0,0,0,1,''),(33,'1','brainstorming','B6523652',13,0,0,0,5,''),(853,'1','brand','B653',5,0,0,0,1,''),(869,'1','brings','B652',6,0,0,0,1,''),(936,'1','build','B430',5,0,0,0,1,''),(921,'1','business','B252',8,0,0,0,1,''),(962,'1','came','C500',4,0,0,0,1,''),(36,'1','can','C500',3,0,0,0,6,''),(800,'1','challenge','C452',9,0,0,0,1,''),(920,'1','challenges','C452',10,0,0,0,1,''),(874,'1','change','C520',6,0,0,0,1,''),(904,'1','cheerleader','C6436',11,0,0,0,1,''),(882,'1','choices','C000',7,0,0,0,1,''),(59,'1','chris','C620',5,0,0,0,6,''),(910,'1','client','C453',6,0,0,0,1,''),(31,'1','clients','C4532',7,0,0,0,6,''),(903,'1','collaborator','C41636',12,0,0,0,1,''),(23,'1','companies','C5152',9,0,0,0,5,''),(806,'1','company','C515',7,0,0,0,1,''),(858,'1','confident','C51353',9,0,0,0,1,''),(955,'1','connect','C523',7,0,0,0,1,''),(117,'1','contact','C5323',7,0,0,0,2,''),(960,'1','could','C430',5,0,0,0,1,''),(930,'1','counsel','C524',7,0,0,0,1,''),(975,'1','couple','C140',6,0,0,0,1,''),(68,'1','crafts','C6132',6,0,0,0,6,''),(886,'1','created','C630',7,0,0,0,1,''),(871,'1','creating','C6352',8,0,0,0,1,''),(88,'1','creative','C631',8,0,0,0,8,''),(893,'1','d','D000',1,0,0,0,1,''),(809,'1','database','D120',8,0,0,0,1,''),(1,'1','dave','D100',4,0,0,0,6,''),(288,'1','david','D130',5,0,0,0,4,''),(890,'1','day','D000',3,0,0,0,1,''),(957,'1','days','D200',4,0,0,0,1,''),(94,'1','design','D250',6,0,0,0,7,''),(66,'1','designer','D256',8,0,0,0,6,''),(77,'1','details','D420',7,0,0,0,6,''),(950,'1','develop','D141',7,0,0,0,1,''),(578,'1','developer','D1416',9,0,0,0,4,''),(811,'1','development','D14153',11,0,0,0,1,''),(768,'1','didn','D500',4,0,0,0,1,''),(96,'1','director','D6236',8,0,0,0,8,''),(947,'1','disappear','D216',9,0,0,0,1,''),(65,'1','disciplinary','D21456',12,0,0,0,6,''),(824,'1','do','D000',2,0,0,0,1,''),(875,'1','doesn','D250',5,0,0,0,1,''),(863,'1','doing','D520',5,0,0,0,1,''),(188,'1','dolor','D460',5,0,0,0,2,''),(908,'1','don','D500',3,0,0,0,1,''),(795,'1','during','D652',6,0,0,0,1,''),(989,'1','each','E200',4,0,0,0,1,''),(850,'1','eight','E230',5,0,0,0,1,''),(284,'1','emily','E540',5,0,0,0,4,''),(164,'1','etiam','E350',5,0,0,0,3,''),(172,'1','eu','E000',2,0,0,0,3,''),(170,'1','euismod','E253',7,0,0,0,3,''),(764,'1','even','E150',4,0,0,0,1,''),(889,'1','every','E160',5,0,0,0,1,''),(986,'1','everything','E16352',10,0,0,0,1,''),(840,'1','expanded','E2153',8,0,0,0,1,''),(98,'1','experience','E21652',10,0,0,0,5,''),(72,'1','experiences','E21652',11,0,0,0,6,''),(105,'1','expertise','E21632',9,0,0,0,4,''),(961,'1','explain','E2145',7,0,0,0,1,''),(75,'1','eye','E000',3,0,0,0,6,''),(772,'1','face','F200',4,0,0,0,1,''),(187,'1','faucibus','F212',8,0,0,0,3,''),(91,'1','finding','F5352',7,0,0,0,6,''),(943,'1','finish','F520',6,0,0,0,1,''),(914,'1','first','F623',5,0,0,0,1,''),(289,'1','fontes','F532',6,0,0,0,4,''),(979,'1','foot','F300',4,0,0,0,1,''),(20,'1','for','F600',3,0,0,0,12,''),(38,'1','found','F530',5,0,0,0,5,''),(877,'1','foundation','F535',10,0,0,0,1,''),(2,'1','fravel','F614',6,0,0,0,5,''),(976,'1','friends','F6532',7,0,0,0,1,''),(897,'1','from','F650',4,0,0,0,1,''),(980,'1','front','F653',5,0,0,0,1,''),(894,'1','get','G300',3,0,0,0,1,''),(788,'1','getting','G352',7,0,0,0,1,''),(926,'1','go','G000',2,0,0,0,1,''),(922,'1','goals','G420',5,0,0,0,1,''),(878,'1','great','G630',5,0,0,0,1,''),(852,'1','growing','G652',7,0,0,0,1,''),(836,'1','grown','G650',5,0,0,0,1,''),(814,'1','gt','G300',2,0,0,0,1,''),(927,'1','guide','G300',5,0,0,0,1,''),(818,'1','guy','G000',3,0,0,0,1,''),(783,'1','had','H300',3,0,0,0,1,''),(794,'1','hand','H530',4,0,0,0,1,''),(39,'1','hanging','H5252',7,0,0,0,5,''),(839,'1','have','H100',4,0,0,0,1,''),(25,'1','he','H000',2,0,0,0,12,''),(973,'1','head','H300',4,0,0,0,1,''),(949,'1','help','H410',4,0,0,0,1,''),(819,'1','here','H600',4,0,0,0,1,''),(815,'1','hi','H000',2,0,0,0,1,''),(898,'1','him','H500',3,0,0,0,1,''),(789,'1','himself','H5241',7,0,0,0,1,''),(12,'1','his','H200',3,0,0,0,6,''),(9,'1','home','H500',4,0,0,0,11,''),(983,'1','hours','H620',5,0,0,0,1,''),(828,'1','how','H000',3,0,0,0,1,''),(56,'1','hyannis','H520',7,0,0,0,5,''),(754,'1','i','I000',1,0,0,0,1,''),(785,'1','idea','I300',4,0,0,0,1,''),(953,'1','identities','I3532',10,0,0,0,1,''),(896,'1','im','I500',2,0,0,0,1,''),(7,'1','in','I500',2,0,0,0,6,''),(6,'1','interactive','I536231',11,0,0,0,5,''),(790,'1','into','I530',4,0,0,0,1,''),(62,'1','is','I200',2,0,0,0,12,''),(114,'1','journal','J654',7,0,0,0,3,''),(74,'1','keen','K500',4,0,0,0,6,''),(977,'1','keep','K100',4,0,0,0,1,''),(42,'1','kids','K320',4,0,0,0,5,''),(867,'1','knew','K500',4,0,0,0,1,''),(917,'1','know','K500',4,0,0,0,1,''),(177,'1','lacinia','L250',7,0,0,0,3,''),(182,'1','lacus','L200',5,0,0,0,3,''),(185,'1','laoreet','L630',7,0,0,0,3,''),(21,'1','large','L620',5,0,0,0,5,''),(54,'1','latest','L323',6,0,0,0,5,''),(932,'1','lead','L300',4,0,0,0,1,''),(776,'1','least','L230',5,0,0,0,1,''),(173,'1','leo','L000',3,0,0,0,3,''),(944,'1','line','L500',4,0,0,0,1,''),(913,'1','listen','L235',6,0,0,0,1,''),(907,'1','listener','L2356',8,0,0,0,1,''),(861,'1','living','L152',6,0,0,0,1,''),(887,'1','logos','L200',5,0,0,0,1,''),(829,'1','long','L520',4,0,0,0,1,''),(843,'1','longer','L526',6,0,0,0,1,''),(756,'1','m','M000',1,0,0,0,1,''),(168,'1','magna','M250',5,0,0,0,3,''),(167,'1','malesuada','M423',9,0,0,0,3,''),(291,'1','malomo','M450',6,0,0,0,4,''),(525,'1','manager','M260',7,0,0,0,4,''),(883,'1','many','M000',4,0,0,0,1,''),(964,'1','marathons','M6352',9,0,0,0,1,''),(855,'1','marketing','M62352',9,0,0,0,1,''),(763,'1','me','M000',2,0,0,0,1,''),(29,'1','meeting','M352',7,0,0,0,6,''),(905,'1','mentor','M360',6,0,0,0,1,''),(293,'1','merrill','M640',7,0,0,0,4,''),(965,'1','mile','M400',4,0,0,0,1,''),(169,'1','mollis','M420',6,0,0,0,3,''),(781,'1','month','M300',5,0,0,0,1,''),(765,'1','more','M600',4,0,0,0,1,''),(972,'1','morning','M652',7,0,0,0,1,''),(64,'1','multi','M430',5,0,0,0,6,''),(821,'1','my','M000',2,0,0,0,1,''),(873,'1','name','N000',4,0,0,0,1,''),(803,'1','nbsp','N121',4,0,0,0,1,''),(931,'1','necessary','N260',9,0,0,0,1,''),(46,'1','neck','N200',4,0,0,0,5,''),(841,'1','new','N000',3,0,0,0,1,''),(817,'1','nice','N200',4,0,0,0,1,''),(784,'1','no','N000',2,0,0,0,1,''),(28,'1','not','N300',3,0,0,0,6,''),(833,'1','now','N000',3,0,0,0,1,''),(951,'1','nurture','N636',7,0,0,0,1,''),(60,'1','obrien','O165',6,0,0,0,10,''),(18,'1','of','O100',2,0,0,0,12,''),(879,'1','offered','O163',7,0,0,0,1,''),(10,'1','office','O120',6,0,0,0,8,''),(44,'1','on','O500',2,0,0,0,6,''),(807,'1','one','O500',3,0,0,0,1,''),(885,'1','ones','O520',4,0,0,0,1,''),(952,'1','online','O545',6,0,0,0,1,''),(32,'1','or','O600',2,0,0,0,6,''),(176,'1','ornare','O656',6,0,0,0,3,''),(981,'1','other','O360',5,0,0,0,1,''),(838,'1','our','O600',3,0,0,0,1,''),(40,'1','out','O300',3,0,0,0,6,''),(779,'1','over','O160',4,0,0,0,1,''),(3,'1','p','P000',1,0,0,0,31,''),(104,'1','page','P200',4,0,0,0,16,''),(902,'1','partner','P6356',7,0,0,0,1,''),(90,'1','passion','P250',7,0,0,0,6,''),(295,'1','passos','P200',6,0,0,0,4,''),(780,'1','past','P230',4,0,0,0,1,''),(175,'1','pellentesque','P4532',12,0,0,0,3,''),(851,'1','people','P400',6,0,0,0,1,''),(782,'1','poor','P600',4,0,0,0,1,''),(165,'1','porta','P630',5,0,0,0,3,''),(888,'1','possible','P214',8,0,0,0,1,''),(58,'1','president','P62353',9,0,0,0,5,''),(900,'1','problem','P6145',7,0,0,0,1,''),(524,'1','project','P623',7,0,0,0,5,''),(86,'1','projects','P6232',8,0,0,0,6,''),(911,'1','prospect','P62123',8,0,0,0,1,''),(876,'1','provide','P613',7,0,0,0,1,''),(808,'1','providing','P61352',9,0,0,0,1,''),(988,'1','pull','P400',4,0,0,0,1,''),(770,'1','punch','P520',5,0,0,0,1,''),(82,'1','purpose','P612',7,0,0,0,6,''),(987,'1','push','P200',4,0,0,0,1,''),(945,'1','put','P300',3,0,0,0,1,''),(978,'1','putting','P352',7,0,0,0,1,''),(174,'1','quam','Q500',4,0,0,0,3,''),(916,'1','questions','Q352',9,0,0,0,1,''),(774,'1','quit','Q300',4,0,0,0,1,''),(792,'1','raised','R230',6,0,0,0,1,''),(822,'1','rate','R300',4,0,0,0,1,''),(940,'1','re','R000',2,0,0,0,1,''),(804,'1','read_more','R356',9,0,0,0,1,''),(881,'1','reasonable','R2514',10,0,0,0,1,''),(287,'1','reddington','R35235',10,0,0,0,4,''),(937,'1','relationships','R435212',13,0,0,0,1,''),(108,'1','results','R2432',7,0,0,0,2,''),(294,'1','rodrigo','R362',7,0,0,0,4,''),(966,'1','run','R500',3,0,0,0,1,''),(48,'1','running','R520',7,0,0,0,5,''),(186,'1','rutrum','R365',6,0,0,0,3,''),(27,'1','s','S000',1,0,0,0,6,''),(181,'1','sagittis','S320',8,0,0,0,3,''),(45,'1','sandy','S530',5,0,0,0,5,''),(166,'1','sem','S500',3,0,0,0,3,''),(576,'1','senior','S560',6,0,0,0,4,''),(80,'1','sense','S520',5,0,0,0,6,''),(812,'1','services','S612',8,0,0,0,1,''),(813,'1','simple','S514',6,0,0,0,1,''),(946,'1','site','S300',4,0,0,0,1,''),(43,'1','sitting','S352',7,0,0,0,6,''),(22,'1','software','S136',8,0,0,0,5,''),(95,'1','solutions','S4352',9,0,0,0,6,''),(970,'1','spend','S153',5,0,0,0,1,''),(942,'1','sprint','S1653',6,0,0,0,1,''),(13,'1','stairs','S362',6,0,0,0,6,''),(827,'1','start','S363',5,0,0,0,1,''),(4,'1','started','S363',7,0,0,0,5,''),(760,'1','still','S340',5,0,0,0,1,''),(860,'1','stories','S362',7,0,0,0,1,''),(750,'1','story','S360',5,0,0,0,1,''),(87,'1','strategic','S3632',9,0,0,0,6,''),(933,'1','strength','S36523',8,0,0,0,1,''),(79,'1','strong','S3652',6,0,0,0,6,''),(290,'1','sue','S000',3,0,0,0,4,''),(928,'1','suggest','S300',7,0,0,0,1,''),(872,'1','suggestion','S350',10,0,0,0,1,''),(971,'1','sunday','S530',6,0,0,0,1,''),(769,'1','t','T000',1,0,0,0,1,''),(832,'1','take','T200',4,0,0,0,1,''),(984,'1','talk','T420',4,0,0,0,1,''),(761,'1','talking','T4252',7,0,0,0,1,''),(53,'1','tasting','T2352',7,0,0,0,5,''),(35,'1','team','T500',4,0,0,0,9,''),(51,'1','tears','T620',5,0,0,0,5,''),(842,'1','tell','T400',4,0,0,0,1,''),(802,'1','telling','T452',7,0,0,0,1,''),(859,'1','tells','T420',5,0,0,0,1,''),(948,'1','term','T650',4,0,0,0,1,''),(766,'1','that','T000',4,0,0,0,1,''),(34,'1','the','T000',3,0,0,0,17,''),(919,'1','their','T600',5,0,0,0,1,''),(912,'1','them','T500',4,0,0,0,1,''),(924,'1','they','T000',4,0,0,0,1,''),(906,'1','thinker','T526',7,0,0,0,1,''),(89,'1','thinking','T5252',8,0,0,0,6,''),(101,'1','this','T200',4,0,0,0,6,''),(956,'1','those','T200',5,0,0,0,1,''),(41,'1','three','T600',5,0,0,0,6,''),(49,'1','through','T620',7,0,0,0,5,''),(292,'1','tim','T500',3,0,0,0,5,''),(778,'1','times','T520',5,0,0,0,1,''),(762,'1','to','T000',2,0,0,0,1,''),(798,'1','took','T200',4,0,0,0,1,''),(50,'1','trail','T640',5,0,0,0,5,''),(963,'1','training','T652',8,0,0,0,1,''),(892,'1','two','T000',3,0,0,0,1,''),(11,'1','under','U536',5,0,0,0,6,''),(918,'1','understand','U5362353',10,0,0,0,1,''),(884,'1','unreasonable','U562514',12,0,0,0,1,''),(868,'1','up','U100',2,0,0,0,1,''),(70,'1','usable','U214',6,0,0,0,6,''),(97,'1','user','U260',4,0,0,0,5,''),(83,'1','utility','U343',7,0,0,0,6,''),(748,'1','ux','U200',2,0,0,0,1,''),(835,'1','ve','V000',2,0,0,0,1,''),(183,'1','vel','V400',3,0,0,0,3,''),(178,'1','venenatis','V532',9,0,0,0,3,''),(179,'1','vestibulum','V23145',10,0,0,0,3,''),(180,'1','vivamus','V520',7,0,0,0,3,''),(909,'1','walk','W420',4,0,0,0,1,''),(925,'1','want','W530',4,0,0,0,1,''),(787,'1','was','W200',3,0,0,0,1,''),(954,'1','way','W000',3,0,0,0,1,''),(969,'1','ways','W200',4,0,0,0,1,''),(834,'1','we','W000',2,0,0,0,1,''),(71,'1','web','W100',3,0,0,0,11,''),(786,'1','what','W300',4,0,0,0,1,''),(24,'1','when','W500',4,0,0,0,6,''),(923,'1','where','W600',5,0,0,0,1,''),(67,'1','who','W000',3,0,0,0,6,''),(959,'1','why','W000',3,0,0,0,1,''),(831,'1','will','W400',4,0,0,0,1,''),(30,'1','with','W300',4,0,0,0,12,''),(19,'1','working','W6252',7,0,0,0,5,''),(968,'1','worst','W623',5,0,0,0,1,''),(17,'1','years','Y620',5,0,0,0,6,''),(826,'1','you','Y000',3,0,0,0,1,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_tag_tags`
--

LOCK TABLES `exp_tag_tags` WRITE;
/*!40000 ALTER TABLE `exp_tag_tags` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (3,1,3,'index','n','webpage','',NULL,1363018638,0,'n',0,'','n','n','o',938),(4,1,3,'home_page','y','webpage','','',1363018670,1,'n',0,'','n','n','o',22),(5,1,3,'_top','y','webpage','','',1363018684,1,'n',0,'','n','n','o',0),(6,1,3,'_bottom','y','webpage','','',1363018693,1,'n',0,'','n','n','o',0),(7,1,3,'_header','y','webpage','','',1363018810,1,'n',0,'','n','n','o',0),(8,1,3,'_footer','y','webpage','','',1363018820,1,'n',0,'','n','n','o',0),(9,1,3,'interior_page','y','webpage','','',1363018850,1,'n',0,'','n','n','o',1),(10,1,3,'expertise_page','y','webpage','','',1363105881,1,'n',0,'','n','n','o',25),(11,1,3,'contact_page','y','webpage','','',1363105895,1,'n',0,'','n','n','o',0),(12,1,3,'case_study_page','y','webpage','','',1363105911,1,'n',0,'','n','n','o',0),(13,1,3,'journal_listing_page','y','webpage','','',1363105928,1,'n',0,'','n','n','o',8),(14,1,3,'journal_detail_page','y','webpage','','',1363105947,1,'n',0,'','n','n','o',11),(15,1,3,'results_page','y','webpage','','',1363106596,1,'n',0,'','n','n','o',1),(16,1,3,'team_page','y','webpage','','',1363106616,1,'n',0,'','n','n','o',58),(17,1,3,'_page_header','y','webpage','','',1363116544,1,'n',0,'','n','n','o',0),(18,1,3,'_team_member_component','y','webpage','','',1363116809,1,'n',0,'','n','n','o',0),(19,1,3,'redirect_to_team_page','y','webpage','','',1363118099,1,'n',0,'','n','n','o',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
INSERT INTO `exp_upload_prefs` VALUES (1,1,'Main Image Uploads','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/uploads/','http://20mile/images/uploads/','all','','','','','','','','','','',NULL),(2,1,'Member Photos','/Users/rodrigopassos/Documents/Repositories/20mile/public_html/images/member_photos/','http://20mile/images/member_photos/','img','','','','','','','','','','',NULL);
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

-- Dump completed on 2013-03-13 12:49:10
