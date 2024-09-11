-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: grafanaDB
-- ------------------------------------------------------
-- Server version	10.5.23-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `panel_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `state` varchar(190) NOT NULL,
  `settings` mediumtext DEFAULT NULL,
  `frequency` bigint(20) NOT NULL,
  `handler` bigint(20) NOT NULL,
  `severity` text NOT NULL,
  `silenced` tinyint(1) NOT NULL,
  `execution_error` text NOT NULL,
  `eval_data` text DEFAULT NULL,
  `eval_date` datetime DEFAULT NULL,
  `new_state_date` datetime NOT NULL,
  `state_changes` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `for` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_alert_org_id_id` (`org_id`,`id`),
  KEY `IDX_alert_state` (`state`),
  KEY `IDX_alert_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_configuration`
--

DROP TABLE IF EXISTS `alert_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alertmanager_configuration` mediumtext DEFAULT NULL,
  `configuration_version` varchar(3) NOT NULL,
  `created_at` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `org_id` bigint(20) NOT NULL DEFAULT 0,
  `configuration_hash` varchar(32) NOT NULL DEFAULT 'not-yet-calculated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_configuration_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_configuration`
--

LOCK TABLES `alert_configuration` WRITE;
/*!40000 ALTER TABLE `alert_configuration` DISABLE KEYS */;
INSERT INTO `alert_configuration` VALUES (1,'{\n	\"alertmanager_config\": {\n		\"route\": {\n			\"receiver\": \"grafana-default-email\",\n			\"group_by\": [\"grafana_folder\", \"alertname\"]\n		},\n		\"receivers\": [{\n			\"name\": \"grafana-default-email\",\n			\"grafana_managed_receiver_configs\": [{\n				\"uid\": \"\",\n				\"name\": \"email receiver\",\n				\"type\": \"email\",\n				\"isDefault\": true,\n				\"settings\": {\n					\"addresses\": \"<example@email.com>\"\n				}\n			}]\n		}]\n	}\n}\n','v1',1726038887,1,1,'e0528a75784033ae7b15c40851d89484');
/*!40000 ALTER TABLE `alert_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_configuration_history`
--

DROP TABLE IF EXISTS `alert_configuration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_configuration_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL DEFAULT 0,
  `alertmanager_configuration` mediumtext NOT NULL,
  `configuration_hash` varchar(32) NOT NULL DEFAULT 'not-yet-calculated',
  `configuration_version` varchar(3) NOT NULL,
  `created_at` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `last_applied` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_configuration_history`
--

LOCK TABLES `alert_configuration_history` WRITE;
/*!40000 ALTER TABLE `alert_configuration_history` DISABLE KEYS */;
INSERT INTO `alert_configuration_history` VALUES (1,1,'{\n	\"alertmanager_config\": {\n		\"route\": {\n			\"receiver\": \"grafana-default-email\",\n			\"group_by\": [\"grafana_folder\", \"alertname\"]\n		},\n		\"receivers\": [{\n			\"name\": \"grafana-default-email\",\n			\"grafana_managed_receiver_configs\": [{\n				\"uid\": \"\",\n				\"name\": \"email receiver\",\n				\"type\": \"email\",\n				\"isDefault\": true,\n				\"settings\": {\n					\"addresses\": \"<example@email.com>\"\n				}\n			}]\n		}]\n	}\n}\n','e0528a75784033ae7b15c40851d89484','v1',1726038887,1,1726066561);
/*!40000 ALTER TABLE `alert_configuration_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_image`
--

DROP TABLE IF EXISTS `alert_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(190) NOT NULL,
  `path` varchar(190) NOT NULL,
  `url` varchar(2048) NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_image_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_image`
--

LOCK TABLES `alert_image` WRITE;
/*!40000 ALTER TABLE `alert_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_instance`
--

DROP TABLE IF EXISTS `alert_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_instance` (
  `rule_org_id` bigint(20) NOT NULL,
  `rule_uid` varchar(40) NOT NULL,
  `labels` text NOT NULL,
  `labels_hash` varchar(190) NOT NULL,
  `current_state` varchar(190) NOT NULL,
  `current_state_since` bigint(20) NOT NULL,
  `last_eval_time` bigint(20) NOT NULL,
  `current_state_end` bigint(20) NOT NULL DEFAULT 0,
  `current_reason` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`rule_org_id`,`rule_uid`,`labels_hash`),
  KEY `IDX_alert_instance_rule_org_id_rule_uid_current_state` (`rule_org_id`,`rule_uid`,`current_state`),
  KEY `IDX_alert_instance_rule_org_id_current_state` (`rule_org_id`,`current_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_instance`
--

LOCK TABLES `alert_instance` WRITE;
/*!40000 ALTER TABLE `alert_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_notification`
--

DROP TABLE IF EXISTS `alert_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(190) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `frequency` bigint(20) DEFAULT NULL,
  `send_reminder` tinyint(1) DEFAULT 0,
  `disable_resolve_message` tinyint(1) NOT NULL DEFAULT 0,
  `uid` varchar(40) DEFAULT NULL,
  `secure_settings` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_notification_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_notification`
--

LOCK TABLES `alert_notification` WRITE;
/*!40000 ALTER TABLE `alert_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_notification_state`
--

DROP TABLE IF EXISTS `alert_notification_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_notification_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) NOT NULL,
  `notifier_id` bigint(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `version` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `alert_rule_state_updated_version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_notification_state_org_id_alert_id_notifier_id` (`org_id`,`alert_id`,`notifier_id`),
  KEY `IDX_alert_notification_state_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_notification_state`
--

LOCK TABLES `alert_notification_state` WRITE;
/*!40000 ALTER TABLE `alert_notification_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_notification_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule`
--

DROP TABLE IF EXISTS `alert_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `title` varchar(190) NOT NULL,
  `condition` varchar(190) NOT NULL,
  `data` mediumtext DEFAULT NULL,
  `updated` datetime NOT NULL,
  `interval_seconds` bigint(20) NOT NULL DEFAULT 60,
  `version` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(40) NOT NULL DEFAULT '0',
  `namespace_uid` varchar(40) NOT NULL,
  `rule_group` varchar(190) NOT NULL,
  `no_data_state` varchar(15) NOT NULL DEFAULT 'NoData',
  `exec_err_state` varchar(15) NOT NULL DEFAULT 'Alerting',
  `for` bigint(20) NOT NULL DEFAULT 0,
  `annotations` text DEFAULT NULL,
  `labels` text DEFAULT NULL,
  `dashboard_uid` varchar(40) DEFAULT NULL,
  `panel_id` bigint(20) DEFAULT NULL,
  `rule_group_idx` int(11) NOT NULL DEFAULT 1,
  `is_paused` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_alert_rule_org_id_namespace_uid_title` (`org_id`,`namespace_uid`,`title`),
  KEY `IDX_alert_rule_org_id_namespace_uid_rule_group` (`org_id`,`namespace_uid`,`rule_group`),
  KEY `IDX_alert_rule_org_id_dashboard_uid_panel_id` (`org_id`,`dashboard_uid`,`panel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule`
--

LOCK TABLES `alert_rule` WRITE;
/*!40000 ALTER TABLE `alert_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_tag`
--

DROP TABLE IF EXISTS `alert_rule_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_rule_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_tag_alert_id_tag_id` (`alert_id`,`tag_id`),
  KEY `IDX_alert_rule_tag_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_tag`
--

LOCK TABLES `alert_rule_tag` WRITE;
/*!40000 ALTER TABLE `alert_rule_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_version`
--

DROP TABLE IF EXISTS `alert_rule_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_rule_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_org_id` bigint(20) NOT NULL,
  `rule_uid` varchar(40) NOT NULL DEFAULT '0',
  `rule_namespace_uid` varchar(40) NOT NULL,
  `rule_group` varchar(190) NOT NULL,
  `parent_version` int(11) NOT NULL,
  `restored_from` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `title` varchar(190) NOT NULL,
  `condition` varchar(190) NOT NULL,
  `data` mediumtext DEFAULT NULL,
  `interval_seconds` bigint(20) NOT NULL,
  `no_data_state` varchar(15) NOT NULL DEFAULT 'NoData',
  `exec_err_state` varchar(15) NOT NULL DEFAULT 'Alerting',
  `for` bigint(20) NOT NULL DEFAULT 0,
  `annotations` text DEFAULT NULL,
  `labels` text DEFAULT NULL,
  `rule_group_idx` int(11) NOT NULL DEFAULT 1,
  `is_paused` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_version_rule_org_id_rule_uid_version` (`rule_org_id`,`rule_uid`,`version`),
  KEY `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` (`rule_org_id`,`rule_namespace_uid`,`rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_version`
--

LOCK TABLES `alert_rule_version` WRITE;
/*!40000 ALTER TABLE `alert_rule_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation`
--

DROP TABLE IF EXISTS `annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `dashboard_id` bigint(20) DEFAULT NULL,
  `panel_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `metric` varchar(255) DEFAULT NULL,
  `prev_state` varchar(25) NOT NULL,
  `new_state` varchar(25) NOT NULL,
  `data` text NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `region_id` bigint(20) DEFAULT 0,
  `tags` varchar(4096) DEFAULT NULL,
  `created` bigint(20) DEFAULT 0,
  `updated` bigint(20) DEFAULT 0,
  `epoch_end` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_annotation_org_id_alert_id` (`org_id`,`alert_id`),
  KEY `IDX_annotation_org_id_type` (`org_id`,`type`),
  KEY `IDX_annotation_org_id_created` (`org_id`,`created`),
  KEY `IDX_annotation_org_id_updated` (`org_id`,`updated`),
  KEY `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`),
  KEY `IDX_annotation_org_id_epoch_end_epoch` (`org_id`,`epoch_end`,`epoch`),
  KEY `IDX_annotation_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation`
--

LOCK TABLES `annotation` WRITE;
/*!40000 ALTER TABLE `annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation_tag`
--

DROP TABLE IF EXISTS `annotation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotation_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `annotation_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_annotation_tag_annotation_id_tag_id` (`annotation_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation_tag`
--

LOCK TABLES `annotation_tag` WRITE;
/*!40000 ALTER TABLE `annotation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `name` varchar(190) NOT NULL,
  `key` varchar(190) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` bigint(20) DEFAULT NULL,
  `service_account_id` bigint(20) DEFAULT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `is_revoked` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_api_key_key` (`key`),
  UNIQUE KEY `UQE_api_key_org_id_name` (`org_id`,`name`),
  KEY `IDX_api_key_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key`
--

LOCK TABLES `api_key` WRITE;
/*!40000 ALTER TABLE `api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builtin_role`
--

DROP TABLE IF EXISTS `builtin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builtin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(190) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `org_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_builtin_role_org_id_role_id_role` (`org_id`,`role_id`,`role`),
  KEY `IDX_builtin_role_role_id` (`role_id`),
  KEY `IDX_builtin_role_role` (`role`),
  KEY `IDX_builtin_role_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builtin_role`
--

LOCK TABLES `builtin_role` WRITE;
/*!40000 ALTER TABLE `builtin_role` DISABLE KEYS */;
INSERT INTO `builtin_role` VALUES (1,'Editor',2,'2024-09-11 15:03:57','2024-09-11 15:03:57',1),(2,'Viewer',3,'2024-09-11 15:03:57','2024-09-11 15:03:57',1);
/*!40000 ALTER TABLE `builtin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_data`
--

DROP TABLE IF EXISTS `cache_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_data` (
  `cache_key` varchar(168) NOT NULL,
  `data` blob NOT NULL,
  `expires` int(255) NOT NULL,
  `created_at` int(255) NOT NULL,
  PRIMARY KEY (`cache_key`),
  UNIQUE KEY `UQE_cache_data_cache_key` (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_data`
--

LOCK TABLES `cache_data` WRITE;
/*!40000 ALTER TABLE `cache_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `uid` varchar(40) NOT NULL,
  `source_uid` varchar(40) NOT NULL,
  `target_uid` varchar(40) DEFAULT NULL,
  `label` text NOT NULL,
  `description` text NOT NULL,
  `config` text DEFAULT NULL,
  PRIMARY KEY (`uid`,`source_uid`),
  KEY `IDX_correlation_uid` (`uid`),
  KEY `IDX_correlation_source_uid` (`source_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `slug` varchar(189) NOT NULL,
  `title` varchar(189) NOT NULL,
  `data` mediumtext NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `gnet_id` bigint(20) DEFAULT NULL,
  `plugin_id` varchar(189) DEFAULT NULL,
  `folder_id` bigint(20) NOT NULL DEFAULT 0,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `has_acl` tinyint(1) NOT NULL DEFAULT 0,
  `uid` varchar(40) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_org_id_folder_id_title` (`org_id`,`folder_id`,`title`),
  UNIQUE KEY `UQE_dashboard_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_dashboard_org_id` (`org_id`),
  KEY `IDX_dashboard_gnet_id` (`gnet_id`),
  KEY `IDX_dashboard_org_id_plugin_id` (`org_id`,`plugin_id`),
  KEY `IDX_dashboard_title` (`title`),
  KEY `IDX_dashboard_is_folder` (`is_folder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,3,'wordpress-coments','wordpress-coments','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"id\":1,\"links\":[],\"liveNow\":false,\"panels\":[{\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"description\":\"WordPress comment status\",\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"thresholds\"},\"custom\":{\"align\":\"auto\",\"cellOptions\":{\"type\":\"color-text\"},\"inspect\":false},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":24,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"cellHeight\":\"sm\",\"footer\":{\"countRows\":false,\"fields\":\"\",\"reducer\":[\"sum\"],\"show\":false},\"showHeader\":true},\"pluginVersion\":\"9.5.2\",\"targets\":[{\"dataset\":\"WordPressDB\",\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"editorMode\":\"builder\",\"format\":\"table\",\"rawSql\":\"SELECT comment_author, comment_date, comment_content, comment_approved FROM WordPressDB.wp_comments LIMIT 50 \",\"refId\":\"A\",\"sql\":{\"columns\":[{\"parameters\":[{\"name\":\"comment_author\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_date\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_content\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_approved\",\"type\":\"functionParameter\"}],\"type\":\"function\"}],\"groupBy\":[{\"property\":{\"type\":\"string\"},\"type\":\"groupBy\"}],\"limit\":50},\"table\":\"wp_comments\"}],\"title\":\"Wordpress Comments\",\"transparent\":true,\"type\":\"table\"}],\"refresh\":\"\",\"schemaVersion\":38,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress-coments\",\"uid\":\"b135752e-b7dd-49e2-8e8d-1c714a4e381d\",\"version\":3,\"weekStart\":\"\"}',1,'2024-09-11 15:03:57','2024-09-11 15:10:16',1,1,0,'',0,0,0,'b135752e-b7dd-49e2-8e8d-1c714a4e381d',0);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_acl`
--

DROP TABLE IF EXISTS `dashboard_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_acl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `permission` smallint(6) NOT NULL DEFAULT 4,
  `role` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_acl_dashboard_id_user_id` (`dashboard_id`,`user_id`),
  UNIQUE KEY `UQE_dashboard_acl_dashboard_id_team_id` (`dashboard_id`,`team_id`),
  KEY `IDX_dashboard_acl_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_acl_user_id` (`user_id`),
  KEY `IDX_dashboard_acl_team_id` (`team_id`),
  KEY `IDX_dashboard_acl_org_id_role` (`org_id`,`role`),
  KEY `IDX_dashboard_acl_permission` (`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_acl`
--

LOCK TABLES `dashboard_acl` WRITE;
/*!40000 ALTER TABLE `dashboard_acl` DISABLE KEYS */;
INSERT INTO `dashboard_acl` VALUES (1,-1,-1,NULL,NULL,1,'Viewer','2017-06-20 00:00:00','2017-06-20 00:00:00'),(2,-1,-1,NULL,NULL,2,'Editor','2017-06-20 00:00:00','2017-06-20 00:00:00');
/*!40000 ALTER TABLE `dashboard_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_provisioning`
--

DROP TABLE IF EXISTS `dashboard_provisioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_provisioning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint(20) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `external_id` text NOT NULL,
  `updated` int(11) NOT NULL DEFAULT 0,
  `check_sum` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_dashboard_provisioning_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_provisioning_dashboard_id_name` (`dashboard_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_provisioning`
--

LOCK TABLES `dashboard_provisioning` WRITE;
/*!40000 ALTER TABLE `dashboard_provisioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_provisioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public`
--

DROP TABLE IF EXISTS `dashboard_public`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_public` (
  `uid` varchar(40) NOT NULL,
  `dashboard_uid` varchar(40) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `time_settings` text DEFAULT NULL,
  `template_variables` mediumtext DEFAULT NULL,
  `access_token` varchar(32) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `annotations_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `time_selection_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `share` varchar(64) NOT NULL DEFAULT 'public',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQE_dashboard_public_config_uid` (`uid`),
  UNIQUE KEY `UQE_dashboard_public_config_access_token` (`access_token`),
  KEY `IDX_dashboard_public_config_org_id_dashboard_uid` (`org_id`,`dashboard_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public`
--

LOCK TABLES `dashboard_public` WRITE;
/*!40000 ALTER TABLE `dashboard_public` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_snapshot`
--

DROP TABLE IF EXISTS `dashboard_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(190) NOT NULL,
  `delete_key` varchar(190) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `external` tinyint(1) NOT NULL,
  `external_url` varchar(255) NOT NULL,
  `dashboard` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external_delete_url` varchar(255) DEFAULT NULL,
  `dashboard_encrypted` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_snapshot_key` (`key`),
  UNIQUE KEY `UQE_dashboard_snapshot_delete_key` (`delete_key`),
  KEY `IDX_dashboard_snapshot_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_snapshot`
--

LOCK TABLES `dashboard_snapshot` WRITE;
/*!40000 ALTER TABLE `dashboard_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_tag`
--

DROP TABLE IF EXISTS `dashboard_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint(20) NOT NULL,
  `term` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_dashboard_tag_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_tag`
--

LOCK TABLES `dashboard_tag` WRITE;
/*!40000 ALTER TABLE `dashboard_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_version`
--

DROP TABLE IF EXISTS `dashboard_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint(20) NOT NULL,
  `parent_version` int(11) NOT NULL,
  `restored_from` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `data` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_version_dashboard_id_version` (`dashboard_id`,`version`),
  KEY `IDX_dashboard_version_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_version`
--

LOCK TABLES `dashboard_version` WRITE;
/*!40000 ALTER TABLE `dashboard_version` DISABLE KEYS */;
INSERT INTO `dashboard_version` VALUES (1,1,0,0,1,'2024-09-11 15:03:57',1,'','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"id\":null,\"links\":[],\"liveNow\":false,\"panels\":[{\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"fieldConfig\":{\"defaults\":{\"custom\":{\"align\":\"auto\",\"cellOptions\":{\"type\":\"auto\"},\"inspect\":false},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"cellHeight\":\"sm\",\"footer\":{\"countRows\":false,\"fields\":\"\",\"reducer\":[\"sum\"],\"show\":false},\"showHeader\":true},\"pluginVersion\":\"9.5.2\",\"targets\":[{\"dataset\":\"WordPressDB\",\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"editorMode\":\"builder\",\"format\":\"table\",\"rawSql\":\"SELECT comment_author, comment_date, comment_content, comment_approved FROM WordPressDB.wp_comments LIMIT 50 \",\"refId\":\"A\",\"sql\":{\"columns\":[{\"parameters\":[{\"name\":\"comment_author\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_date\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_content\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_approved\",\"type\":\"functionParameter\"}],\"type\":\"function\"}],\"groupBy\":[{\"property\":{\"type\":\"string\"},\"type\":\"groupBy\"}],\"limit\":50},\"table\":\"wp_comments\"}],\"title\":\"Panel Title\",\"type\":\"table\"}],\"refresh\":\"\",\"schemaVersion\":38,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress-coments\",\"uid\":\"b135752e-b7dd-49e2-8e8d-1c714a4e381d\",\"version\":1,\"weekStart\":\"\"}'),(2,1,1,0,2,'2024-09-11 15:06:26',1,'','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"id\":1,\"links\":[],\"liveNow\":false,\"panels\":[{\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"description\":\"WordPress comment status\",\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"thresholds\"},\"custom\":{\"align\":\"auto\",\"cellOptions\":{\"type\":\"color-text\"},\"inspect\":false},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"cellHeight\":\"sm\",\"footer\":{\"countRows\":false,\"fields\":\"\",\"reducer\":[\"sum\"],\"show\":false},\"showHeader\":true},\"pluginVersion\":\"9.5.2\",\"targets\":[{\"dataset\":\"WordPressDB\",\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"editorMode\":\"builder\",\"format\":\"table\",\"rawSql\":\"SELECT comment_author, comment_date, comment_content, comment_approved FROM WordPressDB.wp_comments LIMIT 50 \",\"refId\":\"A\",\"sql\":{\"columns\":[{\"parameters\":[{\"name\":\"comment_author\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_date\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_content\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_approved\",\"type\":\"functionParameter\"}],\"type\":\"function\"}],\"groupBy\":[{\"property\":{\"type\":\"string\"},\"type\":\"groupBy\"}],\"limit\":50},\"table\":\"wp_comments\"}],\"title\":\"Wordpress Comments\",\"transparent\":true,\"type\":\"table\"}],\"refresh\":\"\",\"schemaVersion\":38,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress-coments\",\"uid\":\"b135752e-b7dd-49e2-8e8d-1c714a4e381d\",\"version\":2,\"weekStart\":\"\"}'),(3,1,2,0,3,'2024-09-11 15:10:16',1,'','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"id\":1,\"links\":[],\"liveNow\":false,\"panels\":[{\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"description\":\"WordPress comment status\",\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"thresholds\"},\"custom\":{\"align\":\"auto\",\"cellOptions\":{\"type\":\"color-text\"},\"inspect\":false},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\",\"value\":null},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":24,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"cellHeight\":\"sm\",\"footer\":{\"countRows\":false,\"fields\":\"\",\"reducer\":[\"sum\"],\"show\":false},\"showHeader\":true},\"pluginVersion\":\"9.5.2\",\"targets\":[{\"dataset\":\"WordPressDB\",\"datasource\":{\"type\":\"mysql\",\"uid\":\"fac7f5c4-49ba-450f-812e-02e55a244b08\"},\"editorMode\":\"builder\",\"format\":\"table\",\"rawSql\":\"SELECT comment_author, comment_date, comment_content, comment_approved FROM WordPressDB.wp_comments LIMIT 50 \",\"refId\":\"A\",\"sql\":{\"columns\":[{\"parameters\":[{\"name\":\"comment_author\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_date\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_content\",\"type\":\"functionParameter\"}],\"type\":\"function\"},{\"parameters\":[{\"name\":\"comment_approved\",\"type\":\"functionParameter\"}],\"type\":\"function\"}],\"groupBy\":[{\"property\":{\"type\":\"string\"},\"type\":\"groupBy\"}],\"limit\":50},\"table\":\"wp_comments\"}],\"title\":\"Wordpress Comments\",\"transparent\":true,\"type\":\"table\"}],\"refresh\":\"\",\"schemaVersion\":38,\"style\":\"dark\",\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"\",\"title\":\"wordpress-coments\",\"uid\":\"b135752e-b7dd-49e2-8e8d-1c714a4e381d\",\"version\":3,\"weekStart\":\"\"}');
/*!40000 ALTER TABLE `dashboard_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_keys`
--

DROP TABLE IF EXISTS `data_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_keys` (
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `scope` varchar(30) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `encrypted_data` blob NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_keys`
--

LOCK TABLES `data_keys` WRITE;
/*!40000 ALTER TABLE `data_keys` DISABLE KEYS */;
INSERT INTO `data_keys` VALUES ('cc230e3a-9a08-46ac-973f-e612670629a1',1,'root','secretKey.v1','*YWVzLWNmYg*NSmqjb3gµ\éDˆ }„\nB\âœd\õ˜\ñX\ÛdƒVB4xj?\Ä\ë©›','2024-09-11 14:40:03','2024-09-11 14:40:03','2024-09-11/root@secretKey.v1');
/*!40000 ALTER TABLE `data_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source`
--

DROP TABLE IF EXISTS `data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(190) NOT NULL,
  `access` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `database` varchar(255) DEFAULT NULL,
  `basic_auth` tinyint(1) NOT NULL,
  `basic_auth_user` varchar(255) DEFAULT NULL,
  `basic_auth_password` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `json_data` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `with_credentials` tinyint(1) NOT NULL DEFAULT 0,
  `secure_json_data` text DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT NULL,
  `uid` varchar(40) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_data_source_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_data_source_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_data_source_org_id` (`org_id`),
  KEY `IDX_data_source_org_id_is_default` (`org_id`,`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source`
--

LOCK TABLES `data_source` WRITE;
/*!40000 ALTER TABLE `data_source` DISABLE KEYS */;
INSERT INTO `data_source` VALUES (1,1,3,'mysql','MariaDB','proxy','mariadb:3306','','mguardia','',0,'','',1,'{\"connMaxLifetime\":14400,\"database\":\"WordPressDB\",\"maxIdleConns\":100,\"maxIdleConnsAuto\":true,\"maxOpenConns\":100}','2024-09-11 14:40:03','2024-09-11 14:40:48',0,'{\"password\":\"I1kyTXlNekJsTTJFdE9XRXdPQzAwTm1GakxUazNNMll0WlRZeE1qWTNNRFl5T1dFeCMqWVdWekxXTm1ZZypPU29HWjNTOcvicAz0us3rC1BI81gaB9pYNWjw+AJu+w8=\"}',0,'fac7f5c4-49ba-450f-812e-02e55a244b08');
/*!40000 ALTER TABLE `data_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_event`
--

DROP TABLE IF EXISTS `entity_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(1024) NOT NULL,
  `event_type` varchar(8) NOT NULL,
  `created` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_event`
--

LOCK TABLES `entity_event` WRITE;
/*!40000 ALTER TABLE `entity_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `path` varchar(1024) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `parent_folder_path_hash` varchar(64) NOT NULL,
  `contents` blob NOT NULL,
  `etag` varchar(32) NOT NULL,
  `cache_control` varchar(128) NOT NULL,
  `content_disposition` varchar(128) NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `size` bigint(20) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  UNIQUE KEY `UQE_file_path_hash` (`path_hash`),
  KEY `IDX_file_parent_folder_path_hash` (`parent_folder_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_meta`
--

DROP TABLE IF EXISTS `file_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_meta` (
  `path_hash` varchar(64) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` varchar(1024) NOT NULL,
  UNIQUE KEY `UQE_file_meta_path_hash_key` (`path_hash`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_meta`
--

LOCK TABLES `file_meta` WRITE;
/*!40000 ALTER TABLE `file_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `title` varchar(189) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_uid` varchar(40) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_folder_uid_org_id` (`uid`,`org_id`),
  UNIQUE KEY `UQE_folder_title_parent_uid` (`title`,`parent_uid`),
  KEY `IDX_folder_parent_uid_org_id` (`parent_uid`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kv_store`
--

DROP TABLE IF EXISTS `kv_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kv_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `namespace` varchar(190) NOT NULL,
  `key` varchar(190) NOT NULL,
  `value` mediumtext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_kv_store_org_id_namespace_key` (`org_id`,`namespace`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kv_store`
--

LOCK TABLES `kv_store` WRITE;
/*!40000 ALTER TABLE `kv_store` DISABLE KEYS */;
INSERT INTO `kv_store` VALUES (1,0,'datasource','secretMigrationStatus','compatible','2024-09-11 07:14:48','2024-09-11 07:14:48'),(2,1,'alertmanager','silences','','2024-09-11 07:43:24','2024-09-11 07:43:24'),(3,1,'alertmanager','notifications','','2024-09-11 07:43:24','2024-09-11 07:43:24');
/*!40000 ALTER TABLE `kv_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_element`
--

DROP TABLE IF EXISTS `library_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `folder_id` bigint(20) NOT NULL,
  `uid` varchar(40) NOT NULL,
  `name` varchar(150) NOT NULL,
  `kind` bigint(20) NOT NULL,
  `type` varchar(40) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `model` mediumtext NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_library_element_org_id_folder_id_name_kind` (`org_id`,`folder_id`,`name`,`kind`),
  UNIQUE KEY `UQE_library_element_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_element`
--

LOCK TABLES `library_element` WRITE;
/*!40000 ALTER TABLE `library_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_element_connection`
--

DROP TABLE IF EXISTS `library_element_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_element_connection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element_id` bigint(20) NOT NULL,
  `kind` bigint(20) NOT NULL,
  `connection_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_library_element_connection_element_id_kind_connection_id` (`element_id`,`kind`,`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_element_connection`
--

LOCK TABLES `library_element_connection` WRITE;
/*!40000 ALTER TABLE `library_element_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_element_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempt`
--

DROP TABLE IF EXISTS `login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(190) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_login_attempt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempt`
--

LOCK TABLES `login_attempt` WRITE;
/*!40000 ALTER TABLE `login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_log`
--

DROP TABLE IF EXISTS `migration_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `migration_id` varchar(255) NOT NULL,
  `sql` text NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error` text NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_log`
--

LOCK TABLES `migration_log` WRITE;
/*!40000 ALTER TABLE `migration_log` DISABLE KEYS */;
INSERT INTO `migration_log` VALUES (1,'create migration_log table','CREATE TABLE IF NOT EXISTS `migration_log` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `migration_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `sql` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `success` TINYINT(1) NOT NULL\n, `error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `timestamp` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(2,'create user table','CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `account_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(3,'add unique index user.login','CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);',1,'','2024-09-11 07:14:45'),(4,'add unique index user.email','CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);',1,'','2024-09-11 07:14:45'),(5,'drop index UQE_user_login - v1','DROP INDEX `UQE_user_login` ON `user`',1,'','2024-09-11 07:14:45'),(6,'drop index UQE_user_email - v1','DROP INDEX `UQE_user_email` ON `user`',1,'','2024-09-11 07:14:45'),(7,'Rename table user to user_v1 - v1','ALTER TABLE `user` RENAME TO `user_v1`',1,'','2024-09-11 07:14:45'),(8,'create user table v2','CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `org_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `email_verified` TINYINT(1) NULL\n, `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(9,'create index UQE_user_login - v2','CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);',1,'','2024-09-11 07:14:45'),(10,'create index UQE_user_email - v2','CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);',1,'','2024-09-11 07:14:45'),(11,'copy data_source v1 to v2','INSERT INTO `user` (`created`\n, `updated`\n, `version`\n, `login`\n, `email`\n, `password`\n, `company`\n, `is_admin`\n, `id`\n, `name`\n, `salt`\n, `rands`\n, `org_id`) SELECT `created`\n, `updated`\n, `version`\n, `login`\n, `email`\n, `password`\n, `company`\n, `is_admin`\n, `id`\n, `name`\n, `salt`\n, `rands`\n, `account_id` FROM `user_v1`',1,'','2024-09-11 07:14:45'),(12,'Drop old table user_v1','DROP TABLE IF EXISTS `user_v1`',1,'','2024-09-11 07:14:45'),(13,'Add column help_flags1 to user table','alter table `user` ADD COLUMN `help_flags1` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(14,'Update user table charset','ALTER TABLE `user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2024-09-11 07:14:45'),(15,'Add last_seen_at column to user','alter table `user` ADD COLUMN `last_seen_at` DATETIME NULL ',1,'','2024-09-11 07:14:45'),(16,'Add missing user data','code migration',1,'','2024-09-11 07:14:45'),(17,'Add is_disabled column to user','alter table `user` ADD COLUMN `is_disabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(18,'Add index user.login/user.email','CREATE INDEX `IDX_user_login_email` ON `user` (`login`,`email`);',1,'','2024-09-11 07:14:45'),(19,'Add is_service_account column to user','alter table `user` ADD COLUMN `is_service_account` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(20,'Update is_service_account column to nullable','ALTER TABLE user MODIFY is_service_account BOOLEAN DEFAULT 0;',1,'','2024-09-11 07:14:45'),(21,'create temp user table v1-7','CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(22,'create index IDX_temp_user_email - v1-7','CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);',1,'','2024-09-11 07:14:45'),(23,'create index IDX_temp_user_org_id - v1-7','CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);',1,'','2024-09-11 07:14:45'),(24,'create index IDX_temp_user_code - v1-7','CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);',1,'','2024-09-11 07:14:45'),(25,'create index IDX_temp_user_status - v1-7','CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);',1,'','2024-09-11 07:14:45'),(26,'Update temp_user table charset','ALTER TABLE `temp_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2024-09-11 07:14:45'),(27,'drop index IDX_temp_user_email - v1','DROP INDEX `IDX_temp_user_email` ON `temp_user`',1,'','2024-09-11 07:14:45'),(28,'drop index IDX_temp_user_org_id - v1','DROP INDEX `IDX_temp_user_org_id` ON `temp_user`',1,'','2024-09-11 07:14:45'),(29,'drop index IDX_temp_user_code - v1','DROP INDEX `IDX_temp_user_code` ON `temp_user`',1,'','2024-09-11 07:14:45'),(30,'drop index IDX_temp_user_status - v1','DROP INDEX `IDX_temp_user_status` ON `temp_user`',1,'','2024-09-11 07:14:45'),(31,'Rename table temp_user to temp_user_tmp_qwerty - v1','ALTER TABLE `temp_user` RENAME TO `temp_user_tmp_qwerty`',1,'','2024-09-11 07:14:45'),(32,'create temp_user v2','CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` INT NOT NULL DEFAULT 0\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(33,'create index IDX_temp_user_email - v2','CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);',1,'','2024-09-11 07:14:45'),(34,'create index IDX_temp_user_org_id - v2','CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);',1,'','2024-09-11 07:14:45'),(35,'create index IDX_temp_user_code - v2','CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);',1,'','2024-09-11 07:14:45'),(36,'create index IDX_temp_user_status - v2','CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);',1,'','2024-09-11 07:14:45'),(37,'copy temp_user v1 to v2','INSERT INTO `temp_user` (`id`\n, `code`\n, `invited_by_user_id`\n, `email_sent`\n, `remote_addr`\n, `email_sent_on`\n, `org_id`\n, `version`\n, `email`\n, `name`\n, `role`\n, `status`) SELECT `id`\n, `code`\n, `invited_by_user_id`\n, `email_sent`\n, `remote_addr`\n, `email_sent_on`\n, `org_id`\n, `version`\n, `email`\n, `name`\n, `role`\n, `status` FROM `temp_user_tmp_qwerty`',1,'','2024-09-11 07:14:45'),(38,'drop temp_user_tmp_qwerty','DROP TABLE IF EXISTS `temp_user_tmp_qwerty`',1,'','2024-09-11 07:14:45'),(39,'Set created for temp users that will otherwise prematurely expire','code migration',1,'','2024-09-11 07:14:45'),(40,'create star table','CREATE TABLE IF NOT EXISTS `star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(41,'add unique index star.user_id_dashboard_id','CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`);',1,'','2024-09-11 07:14:45'),(42,'create org table v1','CREATE TABLE IF NOT EXISTS `org` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(43,'create index UQE_org_name - v1','CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`);',1,'','2024-09-11 07:14:45'),(44,'create org_user table v1','CREATE TABLE IF NOT EXISTS `org_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(45,'create index IDX_org_user_org_id - v1','CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);',1,'','2024-09-11 07:14:45'),(46,'create index UQE_org_user_org_id_user_id - v1','CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`);',1,'','2024-09-11 07:14:45'),(47,'create index IDX_org_user_user_id - v1','CREATE INDEX `IDX_org_user_user_id` ON `org_user` (`user_id`);',1,'','2024-09-11 07:14:45'),(48,'Update org table charset','ALTER TABLE `org` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2024-09-11 07:14:45'),(49,'Update org_user table charset','ALTER TABLE `org_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:45'),(50,'Migrate all Read Only Viewers to Viewers','UPDATE org_user SET role = \'Viewer\' WHERE role = \'Read Only Editor\'',1,'','2024-09-11 07:14:45'),(51,'create dashboard table','CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(52,'add index dashboard.account_id','CREATE INDEX `IDX_dashboard_account_id` ON `dashboard` (`account_id`);',1,'','2024-09-11 07:14:45'),(53,'add unique index dashboard_account_id_slug','CREATE UNIQUE INDEX `UQE_dashboard_account_id_slug` ON `dashboard` (`account_id`,`slug`);',1,'','2024-09-11 07:14:45'),(54,'create dashboard_tag table','CREATE TABLE IF NOT EXISTS `dashboard_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(55,'add unique index dashboard_tag.dasboard_id_term','CREATE UNIQUE INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag` (`dashboard_id`,`term`);',1,'','2024-09-11 07:14:45'),(56,'drop index UQE_dashboard_tag_dashboard_id_term - v1','DROP INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag`',1,'','2024-09-11 07:14:45'),(57,'Rename table dashboard to dashboard_v1 - v1','ALTER TABLE `dashboard` RENAME TO `dashboard_v1`',1,'','2024-09-11 07:14:45'),(58,'create dashboard v2','CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(59,'create index IDX_dashboard_org_id - v2','CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`);',1,'','2024-09-11 07:14:45'),(60,'create index UQE_dashboard_org_id_slug - v2','CREATE UNIQUE INDEX `UQE_dashboard_org_id_slug` ON `dashboard` (`org_id`,`slug`);',1,'','2024-09-11 07:14:45'),(61,'copy dashboard v1 to v2','INSERT INTO `dashboard` (`org_id`\n, `created`\n, `updated`\n, `id`\n, `version`\n, `slug`\n, `title`\n, `data`) SELECT `account_id`\n, `created`\n, `updated`\n, `id`\n, `version`\n, `slug`\n, `title`\n, `data` FROM `dashboard_v1`',1,'','2024-09-11 07:14:45'),(62,'drop table dashboard_v1','DROP TABLE IF EXISTS `dashboard_v1`',1,'','2024-09-11 07:14:45'),(63,'alter dashboard.data to mediumtext v1','ALTER TABLE dashboard MODIFY data MEDIUMTEXT;',1,'','2024-09-11 07:14:45'),(64,'Add column updated_by in dashboard - v2','alter table `dashboard` ADD COLUMN `updated_by` INT NULL ',1,'','2024-09-11 07:14:45'),(65,'Add column created_by in dashboard - v2','alter table `dashboard` ADD COLUMN `created_by` INT NULL ',1,'','2024-09-11 07:14:45'),(66,'Add column gnetId in dashboard','alter table `dashboard` ADD COLUMN `gnet_id` BIGINT(20) NULL ',1,'','2024-09-11 07:14:45'),(67,'Add index for gnetId in dashboard','CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`);',1,'','2024-09-11 07:14:45'),(68,'Add column plugin_id in dashboard','alter table `dashboard` ADD COLUMN `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:45'),(69,'Add index for plugin_id in dashboard','CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`);',1,'','2024-09-11 07:14:45'),(70,'Add index for dashboard_id in dashboard_tag','CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`);',1,'','2024-09-11 07:14:45'),(71,'Update dashboard table charset','ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `data` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:45'),(72,'Update dashboard_tag table charset','ALTER TABLE `dashboard_tag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:45'),(73,'Add column folder_id in dashboard','alter table `dashboard` ADD COLUMN `folder_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(74,'Add column isFolder in dashboard','alter table `dashboard` ADD COLUMN `is_folder` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(75,'Add column has_acl in dashboard','alter table `dashboard` ADD COLUMN `has_acl` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(76,'Add column uid in dashboard','alter table `dashboard` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:45'),(77,'Update uid column values in dashboard','UPDATE dashboard SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;',1,'','2024-09-11 07:14:45'),(78,'Add unique index dashboard_org_id_uid','CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`);',1,'','2024-09-11 07:14:45'),(79,'Remove unique index org_id_slug','DROP INDEX `UQE_dashboard_org_id_slug` ON `dashboard`',1,'','2024-09-11 07:14:45'),(80,'Update dashboard title length','ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:45'),(81,'Add unique index for dashboard_org_id_title_folder_id','CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);',1,'','2024-09-11 07:14:45'),(82,'create dashboard_provisioning','CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(83,'Rename table dashboard_provisioning to dashboard_provisioning_tmp_qwerty - v1','ALTER TABLE `dashboard_provisioning` RENAME TO `dashboard_provisioning_tmp_qwerty`',1,'','2024-09-11 07:14:45'),(84,'create dashboard_provisioning v2','CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(85,'create index IDX_dashboard_provisioning_dashboard_id - v2','CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`);',1,'','2024-09-11 07:14:45'),(86,'create index IDX_dashboard_provisioning_dashboard_id_name - v2','CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`);',1,'','2024-09-11 07:14:45'),(87,'copy dashboard_provisioning v1 to v2','INSERT INTO `dashboard_provisioning` (`id`\n, `dashboard_id`\n, `name`\n, `external_id`) SELECT `id`\n, `dashboard_id`\n, `name`\n, `external_id` FROM `dashboard_provisioning_tmp_qwerty`',1,'','2024-09-11 07:14:45'),(88,'drop dashboard_provisioning_tmp_qwerty','DROP TABLE IF EXISTS `dashboard_provisioning_tmp_qwerty`',1,'','2024-09-11 07:14:45'),(89,'Add check_sum column','alter table `dashboard_provisioning` ADD COLUMN `check_sum` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:45'),(90,'Add index for dashboard_title','CREATE INDEX `IDX_dashboard_title` ON `dashboard` (`title`);',1,'','2024-09-11 07:14:45'),(91,'delete tags for deleted dashboards','DELETE FROM dashboard_tag WHERE dashboard_id NOT IN (SELECT id FROM dashboard)',1,'','2024-09-11 07:14:45'),(92,'delete stars for deleted dashboards','DELETE FROM star WHERE dashboard_id NOT IN (SELECT id FROM dashboard)',1,'','2024-09-11 07:14:45'),(93,'Add index for dashboard_is_folder','CREATE INDEX `IDX_dashboard_is_folder` ON `dashboard` (`is_folder`);',1,'','2024-09-11 07:14:45'),(94,'Add isPublic for dashboard','alter table `dashboard` ADD COLUMN `is_public` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(95,'create data_source table','CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(96,'add index data_source.account_id','CREATE INDEX `IDX_data_source_account_id` ON `data_source` (`account_id`);',1,'','2024-09-11 07:14:45'),(97,'add unique index data_source.account_id_name','CREATE UNIQUE INDEX `UQE_data_source_account_id_name` ON `data_source` (`account_id`,`name`);',1,'','2024-09-11 07:14:45'),(98,'drop index IDX_data_source_account_id - v1','DROP INDEX `IDX_data_source_account_id` ON `data_source`',1,'','2024-09-11 07:14:45'),(99,'drop index UQE_data_source_account_id_name - v1','DROP INDEX `UQE_data_source_account_id_name` ON `data_source`',1,'','2024-09-11 07:14:45'),(100,'Rename table data_source to data_source_v1 - v1','ALTER TABLE `data_source` RENAME TO `data_source_v1`',1,'','2024-09-11 07:14:45'),(101,'create data_source table v2','CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(102,'create index IDX_data_source_org_id - v2','CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`);',1,'','2024-09-11 07:14:45'),(103,'create index UQE_data_source_org_id_name - v2','CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`);',1,'','2024-09-11 07:14:45'),(104,'Drop old table data_source_v1 #2','DROP TABLE IF EXISTS `data_source_v1`',1,'','2024-09-11 07:14:45'),(105,'Add column with_credentials','alter table `data_source` ADD COLUMN `with_credentials` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(106,'Add secure json data column','alter table `data_source` ADD COLUMN `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:45'),(107,'Update data_source table charset','ALTER TABLE `data_source` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2024-09-11 07:14:45'),(108,'Update initial version to 1','UPDATE data_source SET version = 1 WHERE version = 0',1,'','2024-09-11 07:14:45'),(109,'Add read_only data column','alter table `data_source` ADD COLUMN `read_only` TINYINT(1) NULL ',1,'','2024-09-11 07:14:45'),(110,'Migrate logging ds to loki ds','UPDATE data_source SET type = \'loki\' WHERE type = \'logging\'',1,'','2024-09-11 07:14:45'),(111,'Update json_data with nulls','UPDATE data_source SET json_data = \'{}\' WHERE json_data is null',1,'','2024-09-11 07:14:45'),(112,'Add uid column','alter table `data_source` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:45'),(113,'Update uid value','UPDATE data_source SET uid=lpad(id,9,\'0\');',1,'','2024-09-11 07:14:45'),(114,'Add unique index datasource_org_id_uid','CREATE UNIQUE INDEX `UQE_data_source_org_id_uid` ON `data_source` (`org_id`,`uid`);',1,'','2024-09-11 07:14:45'),(115,'add unique index datasource_org_id_is_default','CREATE INDEX `IDX_data_source_org_id_is_default` ON `data_source` (`org_id`,`is_default`);',1,'','2024-09-11 07:14:45'),(116,'create api_key table','CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:45'),(117,'add index api_key.account_id','CREATE INDEX `IDX_api_key_account_id` ON `api_key` (`account_id`);',1,'','2024-09-11 07:14:45'),(118,'add index api_key.key','CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);',1,'','2024-09-11 07:14:45'),(119,'add index api_key.account_id_name','CREATE UNIQUE INDEX `UQE_api_key_account_id_name` ON `api_key` (`account_id`,`name`);',1,'','2024-09-11 07:14:45'),(120,'drop index IDX_api_key_account_id - v1','DROP INDEX `IDX_api_key_account_id` ON `api_key`',1,'','2024-09-11 07:14:46'),(121,'drop index UQE_api_key_key - v1','DROP INDEX `UQE_api_key_key` ON `api_key`',1,'','2024-09-11 07:14:46'),(122,'drop index UQE_api_key_account_id_name - v1','DROP INDEX `UQE_api_key_account_id_name` ON `api_key`',1,'','2024-09-11 07:14:46'),(123,'Rename table api_key to api_key_v1 - v1','ALTER TABLE `api_key` RENAME TO `api_key_v1`',1,'','2024-09-11 07:14:46'),(124,'create api_key table v2','CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(125,'create index IDX_api_key_org_id - v2','CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`);',1,'','2024-09-11 07:14:46'),(126,'create index UQE_api_key_key - v2','CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);',1,'','2024-09-11 07:14:46'),(127,'create index UQE_api_key_org_id_name - v2','CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`);',1,'','2024-09-11 07:14:46'),(128,'copy api_key v1 to v2','INSERT INTO `api_key` (`id`\n, `org_id`\n, `name`\n, `key`\n, `role`\n, `created`\n, `updated`) SELECT `id`\n, `account_id`\n, `name`\n, `key`\n, `role`\n, `created`\n, `updated` FROM `api_key_v1`',1,'','2024-09-11 07:14:46'),(129,'Drop old table api_key_v1','DROP TABLE IF EXISTS `api_key_v1`',1,'','2024-09-11 07:14:46'),(130,'Update api_key table charset','ALTER TABLE `api_key` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(131,'Add expires to api_key table','alter table `api_key` ADD COLUMN `expires` BIGINT(20) NULL ',1,'','2024-09-11 07:14:46'),(132,'Add service account foreign key','alter table `api_key` ADD COLUMN `service_account_id` BIGINT(20) NULL ',1,'','2024-09-11 07:14:46'),(133,'set service account foreign key to nil if 0','UPDATE api_key SET service_account_id = NULL WHERE service_account_id = 0;',1,'','2024-09-11 07:14:46'),(134,'Add last_used_at to api_key table','alter table `api_key` ADD COLUMN `last_used_at` DATETIME NULL ',1,'','2024-09-11 07:14:46'),(135,'Add is_revoked column to api_key table','alter table `api_key` ADD COLUMN `is_revoked` TINYINT(1) NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(136,'create dashboard_snapshot table v4','CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(137,'drop table dashboard_snapshot_v4 #1','DROP TABLE IF EXISTS `dashboard_snapshot`',1,'','2024-09-11 07:14:46'),(138,'create dashboard_snapshot table v5 #2','CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `external` TINYINT(1) NOT NULL\n, `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(139,'create index UQE_dashboard_snapshot_key - v5','CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`);',1,'','2024-09-11 07:14:46'),(140,'create index UQE_dashboard_snapshot_delete_key - v5','CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`);',1,'','2024-09-11 07:14:46'),(141,'create index IDX_dashboard_snapshot_user_id - v5','CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`);',1,'','2024-09-11 07:14:46'),(142,'alter dashboard_snapshot to mediumtext v2','ALTER TABLE dashboard_snapshot MODIFY dashboard MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(143,'Update dashboard_snapshot table charset','ALTER TABLE `dashboard_snapshot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `dashboard` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(144,'Add column external_delete_url to dashboard_snapshots table','alter table `dashboard_snapshot` ADD COLUMN `external_delete_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(145,'Add encrypted dashboard json column','alter table `dashboard_snapshot` ADD COLUMN `dashboard_encrypted` BLOB NULL ',1,'','2024-09-11 07:14:46'),(146,'Change dashboard_encrypted column to MEDIUMBLOB','ALTER TABLE dashboard_snapshot MODIFY dashboard_encrypted MEDIUMBLOB;',1,'','2024-09-11 07:14:46'),(147,'create quota table v1','CREATE TABLE IF NOT EXISTS `quota` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `limit` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(148,'create index UQE_quota_org_id_user_id_target - v1','CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`);',1,'','2024-09-11 07:14:46'),(149,'Update quota table charset','ALTER TABLE `quota` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(150,'create plugin_setting table','CREATE TABLE IF NOT EXISTS `plugin_setting` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `enabled` TINYINT(1) NOT NULL\n, `pinned` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(151,'create index UQE_plugin_setting_org_id_plugin_id - v1','CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`);',1,'','2024-09-11 07:14:46'),(152,'Add column plugin_version to plugin_settings','alter table `plugin_setting` ADD COLUMN `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(153,'Update plugin_setting table charset','ALTER TABLE `plugin_setting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2024-09-11 07:14:46'),(154,'create session table','CREATE TABLE IF NOT EXISTS `session` (\n`key` CHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(155,'Drop old table playlist table','DROP TABLE IF EXISTS `playlist`',1,'','2024-09-11 07:14:46'),(156,'Drop old table playlist_item table','DROP TABLE IF EXISTS `playlist_item`',1,'','2024-09-11 07:14:46'),(157,'create playlist table v2','CREATE TABLE IF NOT EXISTS `playlist` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(158,'create playlist item table v2','CREATE TABLE IF NOT EXISTS `playlist_item` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `playlist_id` BIGINT(20) NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `order` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(159,'Update playlist table charset','ALTER TABLE `playlist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(160,'Update playlist_item table charset','ALTER TABLE `playlist_item` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(161,'drop preferences table v2','DROP TABLE IF EXISTS `preferences`',1,'','2024-09-11 07:14:46'),(162,'drop preferences table v3','DROP TABLE IF EXISTS `preferences`',1,'','2024-09-11 07:14:46'),(163,'create preferences table v3','CREATE TABLE IF NOT EXISTS `preferences` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `home_dashboard_id` BIGINT(20) NOT NULL\n, `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(164,'Update preferences table charset','ALTER TABLE `preferences` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(165,'Add column team_id in preferences','alter table `preferences` ADD COLUMN `team_id` BIGINT(20) NULL ',1,'','2024-09-11 07:14:46'),(166,'Update team_id column values in preferences','UPDATE preferences SET team_id=0 WHERE team_id IS NULL;',1,'','2024-09-11 07:14:46'),(167,'Add column week_start in preferences','alter table `preferences` ADD COLUMN `week_start` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(168,'Add column preferences.json_data','alter table `preferences` ADD COLUMN `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(169,'alter preferences.json_data to mediumtext v1','ALTER TABLE preferences MODIFY json_data MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(170,'Add preferences index org_id','CREATE INDEX `IDX_preferences_org_id` ON `preferences` (`org_id`);',1,'','2024-09-11 07:14:46'),(171,'Add preferences index user_id','CREATE INDEX `IDX_preferences_user_id` ON `preferences` (`user_id`);',1,'','2024-09-11 07:14:46'),(172,'create alert table v1','CREATE TABLE IF NOT EXISTS `alert` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `panel_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `frequency` BIGINT(20) NOT NULL\n, `handler` BIGINT(20) NOT NULL\n, `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `silenced` TINYINT(1) NOT NULL\n, `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(173,'add index alert org_id & id ','CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`);',1,'','2024-09-11 07:14:46'),(174,'add index alert state','CREATE INDEX `IDX_alert_state` ON `alert` (`state`);',1,'','2024-09-11 07:14:46'),(175,'add index alert dashboard_id','CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`);',1,'','2024-09-11 07:14:46'),(176,'Create alert_rule_tag table v1','CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(177,'Add unique index alert_rule_tag.alert_id_tag_id','CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);',1,'','2024-09-11 07:14:46'),(178,'drop index UQE_alert_rule_tag_alert_id_tag_id - v1','DROP INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag`',1,'','2024-09-11 07:14:46'),(179,'Rename table alert_rule_tag to alert_rule_tag_v1 - v1','ALTER TABLE `alert_rule_tag` RENAME TO `alert_rule_tag_v1`',1,'','2024-09-11 07:14:46'),(180,'Create alert_rule_tag table v2','CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(181,'create index UQE_alert_rule_tag_alert_id_tag_id - Add unique index alert_rule_tag.alert_id_tag_id V2','CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);',1,'','2024-09-11 07:14:46'),(182,'copy alert_rule_tag v1 to v2','INSERT INTO `alert_rule_tag` (`alert_id`\n, `tag_id`) SELECT `alert_id`\n, `tag_id` FROM `alert_rule_tag_v1`',1,'','2024-09-11 07:14:46'),(183,'drop table alert_rule_tag_v1','DROP TABLE IF EXISTS `alert_rule_tag_v1`',1,'','2024-09-11 07:14:46'),(184,'create alert_notification table v1','CREATE TABLE IF NOT EXISTS `alert_notification` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(185,'Add column is_default','alter table `alert_notification` ADD COLUMN `is_default` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(186,'Add column frequency','alter table `alert_notification` ADD COLUMN `frequency` BIGINT(20) NULL ',1,'','2024-09-11 07:14:46'),(187,'Add column send_reminder','alter table `alert_notification` ADD COLUMN `send_reminder` TINYINT(1) NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(188,'Add column disable_resolve_message','alter table `alert_notification` ADD COLUMN `disable_resolve_message` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(189,'add index alert_notification org_id & name','CREATE UNIQUE INDEX `UQE_alert_notification_org_id_name` ON `alert_notification` (`org_id`,`name`);',1,'','2024-09-11 07:14:46'),(190,'Update alert table charset','ALTER TABLE `alert` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2024-09-11 07:14:46'),(191,'Update alert_notification table charset','ALTER TABLE `alert_notification` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(192,'create notification_journal table v1','CREATE TABLE IF NOT EXISTS `alert_notification_journal` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `sent_at` BIGINT(20) NOT NULL\n, `success` TINYINT(1) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(193,'add index notification_journal org_id & alert_id & notifier_id','CREATE INDEX `IDX_alert_notification_journal_org_id_alert_id_notifier_id` ON `alert_notification_journal` (`org_id`,`alert_id`,`notifier_id`);',1,'','2024-09-11 07:14:46'),(194,'drop alert_notification_journal','DROP TABLE IF EXISTS `alert_notification_journal`',1,'','2024-09-11 07:14:46'),(195,'create alert_notification_state table v1','CREATE TABLE IF NOT EXISTS `alert_notification_state` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `state` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `updated_at` BIGINT(20) NOT NULL\n, `alert_rule_state_updated_version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(196,'add index alert_notification_state org_id & alert_id & notifier_id','CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`);',1,'','2024-09-11 07:14:46'),(197,'Add for to alert table','alter table `alert` ADD COLUMN `for` BIGINT(20) NULL ',1,'','2024-09-11 07:14:46'),(198,'Add column uid in alert_notification','alter table `alert_notification` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(199,'Update uid column values in alert_notification','UPDATE alert_notification SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;',1,'','2024-09-11 07:14:46'),(200,'Add unique index alert_notification_org_id_uid','CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`);',1,'','2024-09-11 07:14:46'),(201,'Remove unique index org_id_name','DROP INDEX `UQE_alert_notification_org_id_name` ON `alert_notification`',1,'','2024-09-11 07:14:46'),(202,'Add column secure_settings in alert_notification','alter table `alert_notification` ADD COLUMN `secure_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(203,'alter alert.settings to mediumtext','ALTER TABLE alert MODIFY settings MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(204,'Add non-unique index alert_notification_state_alert_id','CREATE INDEX `IDX_alert_notification_state_alert_id` ON `alert_notification_state` (`alert_id`);',1,'','2024-09-11 07:14:46'),(205,'Add non-unique index alert_rule_tag_alert_id','CREATE INDEX `IDX_alert_rule_tag_alert_id` ON `alert_rule_tag` (`alert_id`);',1,'','2024-09-11 07:14:46'),(206,'Drop old annotation table v4','DROP TABLE IF EXISTS `annotation`',1,'','2024-09-11 07:14:46'),(207,'create annotation table v5','CREATE TABLE IF NOT EXISTS `annotation` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `dashboard_id` BIGINT(20) NULL\n, `panel_id` BIGINT(20) NULL\n, `category_id` BIGINT(20) NULL\n, `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `epoch` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(208,'add index annotation 0 v3','CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`);',1,'','2024-09-11 07:14:46'),(209,'add index annotation 1 v3','CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`);',1,'','2024-09-11 07:14:46'),(210,'add index annotation 2 v3','CREATE INDEX `IDX_annotation_org_id_category_id` ON `annotation` (`org_id`,`category_id`);',1,'','2024-09-11 07:14:46'),(211,'add index annotation 3 v3','CREATE INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation` (`org_id`,`dashboard_id`,`panel_id`,`epoch`);',1,'','2024-09-11 07:14:46'),(212,'add index annotation 4 v3','CREATE INDEX `IDX_annotation_org_id_epoch` ON `annotation` (`org_id`,`epoch`);',1,'','2024-09-11 07:14:46'),(213,'Update annotation table charset','ALTER TABLE `annotation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:46'),(214,'Add column region_id to annotation table','alter table `annotation` ADD COLUMN `region_id` BIGINT(20) NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(215,'Drop category_id index','DROP INDEX `IDX_annotation_org_id_category_id` ON `annotation`',1,'','2024-09-11 07:14:46'),(216,'Add column tags to annotation table','alter table `annotation` ADD COLUMN `tags` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(217,'Create annotation_tag table v2','CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(218,'Add unique index annotation_tag.annotation_id_tag_id','CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);',1,'','2024-09-11 07:14:46'),(219,'drop index UQE_annotation_tag_annotation_id_tag_id - v2','DROP INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag`',1,'','2024-09-11 07:14:46'),(220,'Rename table annotation_tag to annotation_tag_v2 - v2','ALTER TABLE `annotation_tag` RENAME TO `annotation_tag_v2`',1,'','2024-09-11 07:14:46'),(221,'Create annotation_tag table v3','CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(222,'create index UQE_annotation_tag_annotation_id_tag_id - Add unique index annotation_tag.annotation_id_tag_id V3','CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);',1,'','2024-09-11 07:14:46'),(223,'copy annotation_tag v2 to v3','INSERT INTO `annotation_tag` (`annotation_id`\n, `tag_id`) SELECT `annotation_id`\n, `tag_id` FROM `annotation_tag_v2`',1,'','2024-09-11 07:14:46'),(224,'drop table annotation_tag_v2','DROP TABLE IF EXISTS `annotation_tag_v2`',1,'','2024-09-11 07:14:46'),(225,'Update alert annotations and set TEXT to empty','UPDATE annotation SET TEXT = \'\' WHERE alert_id > 0',1,'','2024-09-11 07:14:46'),(226,'Add created time to annotation table','alter table `annotation` ADD COLUMN `created` BIGINT(20) NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(227,'Add updated time to annotation table','alter table `annotation` ADD COLUMN `updated` BIGINT(20) NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(228,'Add index for created in annotation table','CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`);',1,'','2024-09-11 07:14:46'),(229,'Add index for updated in annotation table','CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`);',1,'','2024-09-11 07:14:46'),(230,'Convert existing annotations from seconds to milliseconds','UPDATE annotation SET epoch = (epoch*1000) where epoch < 9999999999',1,'','2024-09-11 07:14:46'),(231,'Add epoch_end column','alter table `annotation` ADD COLUMN `epoch_end` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(232,'Add index for epoch_end','CREATE INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation` (`org_id`,`epoch`,`epoch_end`);',1,'','2024-09-11 07:14:46'),(233,'Make epoch_end the same as epoch','UPDATE annotation SET epoch_end = epoch',1,'','2024-09-11 07:14:46'),(234,'Move region to single row','code migration',1,'','2024-09-11 07:14:46'),(235,'Remove index org_id_epoch from annotation table','DROP INDEX `IDX_annotation_org_id_epoch` ON `annotation`',1,'','2024-09-11 07:14:46'),(236,'Remove index org_id_dashboard_id_panel_id_epoch from annotation table','DROP INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation`',1,'','2024-09-11 07:14:46'),(237,'Add index for org_id_dashboard_id_epoch_end_epoch on annotation table','CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`);',1,'','2024-09-11 07:14:46'),(238,'Add index for org_id_epoch_end_epoch on annotation table','CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`);',1,'','2024-09-11 07:14:46'),(239,'Remove index org_id_epoch_epoch_end from annotation table','DROP INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation`',1,'','2024-09-11 07:14:46'),(240,'Add index for alert_id on annotation table','CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`);',1,'','2024-09-11 07:14:46'),(241,'Increase tags column to length 4096','ALTER TABLE annotation MODIFY tags VARCHAR(4096);',1,'','2024-09-11 07:14:46'),(242,'create test_data table','CREATE TABLE IF NOT EXISTS `test_data` (\n`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `metric1` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `metric2` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `value_big_int` BIGINT(20) NULL\n, `value_double` DOUBLE NULL\n, `value_float` FLOAT NULL\n, `value_int` INT NULL\n, `time_epoch` BIGINT(20) NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` TIMESTAMP NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(243,'create dashboard_version table v1','CREATE TABLE IF NOT EXISTS `dashboard_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(244,'add index dashboard_version.dashboard_id','CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`);',1,'','2024-09-11 07:14:46'),(245,'add unique index dashboard_version.dashboard_id and dashboard_version.version','CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`);',1,'','2024-09-11 07:14:46'),(246,'Set dashboard version to 1 where 0','UPDATE dashboard SET version = 1 WHERE version = 0',1,'','2024-09-11 07:14:46'),(247,'save existing dashboard data in dashboard_version table v1','INSERT INTO dashboard_version\n(\n	dashboard_id,\n	version,\n	parent_version,\n	restored_from,\n	created,\n	created_by,\n	message,\n	data\n)\nSELECT\n	dashboard.id,\n	dashboard.version,\n	dashboard.version,\n	dashboard.version,\n	dashboard.updated,\n	COALESCE(dashboard.updated_by, -1),\n	\'\',\n	dashboard.data\nFROM dashboard;',1,'','2024-09-11 07:14:46'),(248,'alter dashboard_version.data to mediumtext v1','ALTER TABLE dashboard_version MODIFY data MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(249,'create team table','CREATE TABLE IF NOT EXISTS `team` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(250,'add index team.org_id','CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);',1,'','2024-09-11 07:14:46'),(251,'add unique index team_org_id_name','CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`);',1,'','2024-09-11 07:14:46'),(252,'create team member table','CREATE TABLE IF NOT EXISTS `team_member` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(253,'add index team_member.org_id','CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`);',1,'','2024-09-11 07:14:46'),(254,'add unique index team_member_org_id_team_id_user_id','CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`);',1,'','2024-09-11 07:14:46'),(255,'add index team_member.team_id','CREATE INDEX `IDX_team_member_team_id` ON `team_member` (`team_id`);',1,'','2024-09-11 07:14:46'),(256,'Add column email to team table','alter table `team` ADD COLUMN `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(257,'Add column external to team_member table','alter table `team_member` ADD COLUMN `external` TINYINT(1) NULL ',1,'','2024-09-11 07:14:46'),(258,'Add column permission to team_member table','alter table `team_member` ADD COLUMN `permission` SMALLINT NULL ',1,'','2024-09-11 07:14:46'),(259,'create dashboard acl table','CREATE TABLE IF NOT EXISTS `dashboard_acl` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NULL\n, `team_id` BIGINT(20) NULL\n, `permission` SMALLINT NOT NULL DEFAULT 4\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(260,'add index dashboard_acl_dashboard_id','CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`);',1,'','2024-09-11 07:14:46'),(261,'add unique index dashboard_acl_dashboard_id_user_id','CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`);',1,'','2024-09-11 07:14:46'),(262,'add unique index dashboard_acl_dashboard_id_team_id','CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`);',1,'','2024-09-11 07:14:46'),(263,'add index dashboard_acl_user_id','CREATE INDEX `IDX_dashboard_acl_user_id` ON `dashboard_acl` (`user_id`);',1,'','2024-09-11 07:14:46'),(264,'add index dashboard_acl_team_id','CREATE INDEX `IDX_dashboard_acl_team_id` ON `dashboard_acl` (`team_id`);',1,'','2024-09-11 07:14:46'),(265,'add index dashboard_acl_org_id_role','CREATE INDEX `IDX_dashboard_acl_org_id_role` ON `dashboard_acl` (`org_id`,`role`);',1,'','2024-09-11 07:14:46'),(266,'add index dashboard_permission','CREATE INDEX `IDX_dashboard_acl_permission` ON `dashboard_acl` (`permission`);',1,'','2024-09-11 07:14:46'),(267,'save default acl rules in dashboard_acl table','\nINSERT INTO dashboard_acl\n	(\n		org_id,\n		dashboard_id,\n		permission,\n		role,\n		created,\n		updated\n	)\n	VALUES\n		(-1,-1, 1,\'Viewer\',\'2017-06-20\',\'2017-06-20\'),\n		(-1,-1, 2,\'Editor\',\'2017-06-20\',\'2017-06-20\')\n	',1,'','2024-09-11 07:14:46'),(268,'delete acl rules for deleted dashboards and folders','DELETE FROM dashboard_acl WHERE dashboard_id NOT IN (SELECT id FROM dashboard) AND dashboard_id != -1',1,'','2024-09-11 07:14:46'),(269,'create tag table','CREATE TABLE IF NOT EXISTS `tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(270,'add index tag.key_value','CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`);',1,'','2024-09-11 07:14:46'),(271,'create login attempt table','CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(272,'add index login_attempt.username','CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);',1,'','2024-09-11 07:14:46'),(273,'drop index IDX_login_attempt_username - v1','DROP INDEX `IDX_login_attempt_username` ON `login_attempt`',1,'','2024-09-11 07:14:46'),(274,'Rename table login_attempt to login_attempt_tmp_qwerty - v1','ALTER TABLE `login_attempt` RENAME TO `login_attempt_tmp_qwerty`',1,'','2024-09-11 07:14:46'),(275,'create login_attempt v2','CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(276,'create index IDX_login_attempt_username - v2','CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);',1,'','2024-09-11 07:14:46'),(277,'copy login_attempt v1 to v2','INSERT INTO `login_attempt` (`id`\n, `username`\n, `ip_address`) SELECT `id`\n, `username`\n, `ip_address` FROM `login_attempt_tmp_qwerty`',1,'','2024-09-11 07:14:46'),(278,'drop login_attempt_tmp_qwerty','DROP TABLE IF EXISTS `login_attempt_tmp_qwerty`',1,'','2024-09-11 07:14:46'),(279,'create user auth table','CREATE TABLE IF NOT EXISTS `user_auth` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(280,'create index IDX_user_auth_auth_module_auth_id - v1','CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`);',1,'','2024-09-11 07:14:46'),(281,'alter user_auth.auth_id to length 190','ALTER TABLE user_auth MODIFY auth_id VARCHAR(190);',1,'','2024-09-11 07:14:46'),(282,'Add OAuth access token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(283,'Add OAuth refresh token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(284,'Add OAuth token type to user_auth','alter table `user_auth` ADD COLUMN `o_auth_token_type` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(285,'Add OAuth expiry to user_auth','alter table `user_auth` ADD COLUMN `o_auth_expiry` DATETIME NULL ',1,'','2024-09-11 07:14:46'),(286,'Add index to user_id column in user_auth','CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`);',1,'','2024-09-11 07:14:46'),(287,'Add OAuth ID token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_id_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(288,'create server_lock table','CREATE TABLE IF NOT EXISTS `server_lock` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `operation_uid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `last_execution` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(289,'add index server_lock.operation_uid','CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`);',1,'','2024-09-11 07:14:46'),(290,'create user auth token table','CREATE TABLE IF NOT EXISTS `user_auth_token` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `prev_auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_token_seen` TINYINT(1) NOT NULL\n, `seen_at` INT NULL\n, `rotated_at` INT NOT NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(291,'add unique index user_auth_token.auth_token','CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`);',1,'','2024-09-11 07:14:46'),(292,'add unique index user_auth_token.prev_auth_token','CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`);',1,'','2024-09-11 07:14:46'),(293,'add index user_auth_token.user_id','CREATE INDEX `IDX_user_auth_token_user_id` ON `user_auth_token` (`user_id`);',1,'','2024-09-11 07:14:46'),(294,'Add revoked_at to the user auth token','alter table `user_auth_token` ADD COLUMN `revoked_at` INT NULL ',1,'','2024-09-11 07:14:46'),(295,'create cache_data table','CREATE TABLE IF NOT EXISTS `cache_data` (\n`cache_key` VARCHAR(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER(255) NOT NULL\n, `created_at` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(296,'add unique index cache_data.cache_key','CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`);',1,'','2024-09-11 07:14:46'),(297,'create short_url table v1','CREATE TABLE IF NOT EXISTS `short_url` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `created_at` INT NOT NULL\n, `last_seen_at` INT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(298,'add index short_url.org_id-uid','CREATE UNIQUE INDEX `UQE_short_url_org_id_uid` ON `short_url` (`org_id`,`uid`);',1,'','2024-09-11 07:14:46'),(299,'alter table short_url alter column created_by type to bigint','ALTER TABLE short_url MODIFY created_by BIGINT;',1,'','2024-09-11 07:14:46'),(300,'delete alert_definition table','DROP TABLE IF EXISTS `alert_definition`',1,'','2024-09-11 07:14:46'),(301,'recreate alert_definition table','CREATE TABLE IF NOT EXISTS `alert_definition` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL DEFAULT 60\n, `version` INT NOT NULL DEFAULT 0\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(302,'add index in alert_definition on org_id and title columns','CREATE INDEX `IDX_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);',1,'','2024-09-11 07:14:46'),(303,'add index in alert_definition on org_id and uid columns','CREATE INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);',1,'','2024-09-11 07:14:46'),(304,'alter alert_definition table data column to mediumtext in mysql','ALTER TABLE alert_definition MODIFY data MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(305,'drop index in alert_definition on org_id and title columns','DROP INDEX `IDX_alert_definition_org_id_title` ON `alert_definition`',1,'','2024-09-11 07:14:46'),(306,'drop index in alert_definition on org_id and uid columns','DROP INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition`',1,'','2024-09-11 07:14:46'),(307,'add unique index in alert_definition on org_id and title columns','CREATE UNIQUE INDEX `UQE_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);',1,'','2024-09-11 07:14:46'),(308,'add unique index in alert_definition on org_id and uid columns','CREATE UNIQUE INDEX `UQE_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);',1,'','2024-09-11 07:14:46'),(309,'Add column paused in alert_definition','alter table `alert_definition` ADD COLUMN `paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(310,'drop alert_definition table','DROP TABLE IF EXISTS `alert_definition`',1,'','2024-09-11 07:14:46'),(311,'delete alert_definition_version table','DROP TABLE IF EXISTS `alert_definition_version`',1,'','2024-09-11 07:14:46'),(312,'recreate alert_definition_version table','CREATE TABLE IF NOT EXISTS `alert_definition_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alert_definition_id` BIGINT(20) NOT NULL\n, `alert_definition_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(313,'add index in alert_definition_version table on alert_definition_id and version columns','CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_id_version` ON `alert_definition_version` (`alert_definition_id`,`version`);',1,'','2024-09-11 07:14:46'),(314,'add index in alert_definition_version table on alert_definition_uid and version columns','CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_uid_version` ON `alert_definition_version` (`alert_definition_uid`,`version`);',1,'','2024-09-11 07:14:46'),(315,'alter alert_definition_version table data column to mediumtext in mysql','ALTER TABLE alert_definition_version MODIFY data MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(316,'drop alert_definition_version table','DROP TABLE IF EXISTS `alert_definition_version`',1,'','2024-09-11 07:14:46'),(317,'create alert_instance table','CREATE TABLE IF NOT EXISTS `alert_instance` (\n`def_org_id` BIGINT(20) NOT NULL\n, `def_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `labels_hash` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `current_state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `current_state_since` BIGINT(20) NOT NULL\n, `last_eval_time` BIGINT(20) NOT NULL\n, PRIMARY KEY ( `def_org_id`,`def_uid`,`labels_hash` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(318,'add index in alert_instance table on def_org_id, def_uid and current_state columns','CREATE INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance` (`def_org_id`,`def_uid`,`current_state`);',1,'','2024-09-11 07:14:46'),(319,'add index in alert_instance table on def_org_id, current_state columns','CREATE INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance` (`def_org_id`,`current_state`);',1,'','2024-09-11 07:14:46'),(320,'add column current_state_end to alert_instance','alter table `alert_instance` ADD COLUMN `current_state_end` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(321,'remove index def_org_id, def_uid, current_state on alert_instance','DROP INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance`',1,'','2024-09-11 07:14:46'),(322,'remove index def_org_id, current_state on alert_instance','DROP INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance`',1,'','2024-09-11 07:14:46'),(323,'rename def_org_id to rule_org_id in alert_instance','ALTER TABLE alert_instance CHANGE def_org_id rule_org_id BIGINT;',1,'','2024-09-11 07:14:46'),(324,'rename def_uid to rule_uid in alert_instance','ALTER TABLE alert_instance CHANGE def_uid rule_uid VARCHAR(40);',1,'','2024-09-11 07:14:46'),(325,'add index rule_org_id, rule_uid, current_state on alert_instance','CREATE INDEX `IDX_alert_instance_rule_org_id_rule_uid_current_state` ON `alert_instance` (`rule_org_id`,`rule_uid`,`current_state`);',1,'','2024-09-11 07:14:46'),(326,'add index rule_org_id, current_state on alert_instance','CREATE INDEX `IDX_alert_instance_rule_org_id_current_state` ON `alert_instance` (`rule_org_id`,`current_state`);',1,'','2024-09-11 07:14:46'),(327,'add current_reason column related to current_state','alter table `alert_instance` ADD COLUMN `current_reason` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(328,'create alert_rule table','CREATE TABLE IF NOT EXISTS `alert_rule` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL DEFAULT 60\n, `version` INT NOT NULL DEFAULT 0\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `namespace_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `rule_group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `no_data_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'NoData\'\n, `exec_err_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Alerting\'\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(329,'add index in alert_rule on org_id and title columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_title` ON `alert_rule` (`org_id`,`title`);',1,'','2024-09-11 07:14:46'),(330,'add index in alert_rule on org_id and uid columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_uid` ON `alert_rule` (`org_id`,`uid`);',1,'','2024-09-11 07:14:46'),(331,'add index in alert_rule on org_id, namespace_uid, group_uid columns','CREATE INDEX `IDX_alert_rule_org_id_namespace_uid_rule_group` ON `alert_rule` (`org_id`,`namespace_uid`,`rule_group`);',1,'','2024-09-11 07:14:46'),(332,'alter alert_rule table data column to mediumtext in mysql','ALTER TABLE alert_rule MODIFY data MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(333,'add column for to alert_rule','alter table `alert_rule` ADD COLUMN `for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(334,'add column annotations to alert_rule','alter table `alert_rule` ADD COLUMN `annotations` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(335,'add column labels to alert_rule','alter table `alert_rule` ADD COLUMN `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(336,'remove unique index from alert_rule on org_id, title columns','DROP INDEX `UQE_alert_rule_org_id_title` ON `alert_rule`',1,'','2024-09-11 07:14:46'),(337,'add index in alert_rule on org_id, namespase_uid and title columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_namespace_uid_title` ON `alert_rule` (`org_id`,`namespace_uid`,`title`);',1,'','2024-09-11 07:14:46'),(338,'add dashboard_uid column to alert_rule','alter table `alert_rule` ADD COLUMN `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(339,'add panel_id column to alert_rule','alter table `alert_rule` ADD COLUMN `panel_id` BIGINT(20) NULL ',1,'','2024-09-11 07:14:46'),(340,'add index in alert_rule on org_id, dashboard_uid and panel_id columns','CREATE INDEX `IDX_alert_rule_org_id_dashboard_uid_panel_id` ON `alert_rule` (`org_id`,`dashboard_uid`,`panel_id`);',1,'','2024-09-11 07:14:46'),(341,'add rule_group_idx column to alert_rule','alter table `alert_rule` ADD COLUMN `rule_group_idx` INT NOT NULL DEFAULT 1 ',1,'','2024-09-11 07:14:46'),(342,'add is_paused column to alert_rule table','alter table `alert_rule` ADD COLUMN `is_paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(343,'fix is_paused column for alert_rule table','SELECT 0;',1,'','2024-09-11 07:14:46'),(344,'create alert_rule_version table','CREATE TABLE IF NOT EXISTS `alert_rule_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `rule_org_id` BIGINT(20) NOT NULL\n, `rule_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `rule_namespace_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `rule_group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL\n, `no_data_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'NoData\'\n, `exec_err_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Alerting\'\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(345,'add index in alert_rule_version table on rule_org_id, rule_uid and version columns','CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_version` ON `alert_rule_version` (`rule_org_id`,`rule_uid`,`version`);',1,'','2024-09-11 07:14:46'),(346,'add index in alert_rule_version table on rule_org_id, rule_namespace_uid and rule_group columns','CREATE INDEX `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` ON `alert_rule_version` (`rule_org_id`,`rule_namespace_uid`,`rule_group`);',1,'','2024-09-11 07:14:46'),(347,'alter alert_rule_version table data column to mediumtext in mysql','ALTER TABLE alert_rule_version MODIFY data MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(348,'add column for to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(349,'add column annotations to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `annotations` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(350,'add column labels to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:46'),(351,'add rule_group_idx column to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `rule_group_idx` INT NOT NULL DEFAULT 1 ',1,'','2024-09-11 07:14:46'),(352,'add is_paused column to alert_rule_versions table','alter table `alert_rule_version` ADD COLUMN `is_paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(353,'fix is_paused column for alert_rule_version table','SELECT 0;',1,'','2024-09-11 07:14:46'),(354,'create_alert_configuration_table','CREATE TABLE IF NOT EXISTS `alert_configuration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alertmanager_configuration` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `configuration_version` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(355,'Add column default in alert_configuration','alter table `alert_configuration` ADD COLUMN `default` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(356,'alert alert_configuration alertmanager_configuration column from TEXT to MEDIUMTEXT if mysql','ALTER TABLE alert_configuration MODIFY alertmanager_configuration MEDIUMTEXT;',1,'','2024-09-11 07:14:46'),(357,'add column org_id in alert_configuration','alter table `alert_configuration` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:46'),(358,'add index in alert_configuration table on org_id column','CREATE INDEX `IDX_alert_configuration_org_id` ON `alert_configuration` (`org_id`);',1,'','2024-09-11 07:14:46'),(359,'add configuration_hash column to alert_configuration','alter table `alert_configuration` ADD COLUMN `configuration_hash` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'not-yet-calculated\' ',1,'','2024-09-11 07:14:46'),(360,'create_ngalert_configuration_table','CREATE TABLE IF NOT EXISTS `ngalert_configuration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alertmanagers` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:46'),(361,'add index in ngalert_configuration on org_id column','CREATE UNIQUE INDEX `UQE_ngalert_configuration_org_id` ON `ngalert_configuration` (`org_id`);',1,'','2024-09-11 07:14:47'),(362,'add column send_alerts_to in ngalert_configuration','alter table `ngalert_configuration` ADD COLUMN `send_alerts_to` SMALLINT NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(363,'create provenance_type table','CREATE TABLE IF NOT EXISTS `provenance_type` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `record_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `record_type` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `provenance` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(364,'add index to uniquify (record_key, record_type, org_id) columns','CREATE UNIQUE INDEX `UQE_provenance_type_record_type_record_key_org_id` ON `provenance_type` (`record_type`,`record_key`,`org_id`);',1,'','2024-09-11 07:14:47'),(365,'create alert_image table','CREATE TABLE IF NOT EXISTS `alert_image` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `token` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `expires_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(366,'add unique index on token to alert_image table','CREATE UNIQUE INDEX `UQE_alert_image_token` ON `alert_image` (`token`);',1,'','2024-09-11 07:14:47'),(367,'support longer URLs in alert_image table','ALTER TABLE alert_image MODIFY url VARCHAR(2048) NOT NULL;',1,'','2024-09-11 07:14:47'),(368,'create_alert_configuration_history_table','CREATE TABLE IF NOT EXISTS `alert_configuration_history` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL DEFAULT 0\n, `alertmanager_configuration` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `configuration_hash` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'not-yet-calculated\'\n, `configuration_version` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` INT NOT NULL\n, `default` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(369,'drop non-unique orgID index on alert_configuration','DROP INDEX `IDX_alert_configuration_org_id` ON `alert_configuration`',1,'','2024-09-11 07:14:47'),(370,'drop unique orgID index on alert_configuration if exists','DROP INDEX `UQE_alert_configuration_org_id` ON `alert_configuration`',1,'','2024-09-11 07:14:47'),(371,'extract alertmanager configuration history to separate table','code migration',1,'','2024-09-11 07:14:47'),(372,'add unique index on orgID to alert_configuration','CREATE UNIQUE INDEX `UQE_alert_configuration_org_id` ON `alert_configuration` (`org_id`);',1,'','2024-09-11 07:14:47'),(373,'add last_applied column to alert_configuration_history','alter table `alert_configuration_history` ADD COLUMN `last_applied` INT NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(374,'move dashboard alerts to unified alerting','code migration',1,'','2024-09-11 07:14:47'),(375,'create library_element table v1','CREATE TABLE IF NOT EXISTS `library_element` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `folder_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `kind` BIGINT(20) NOT NULL\n, `type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `model` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `updated` DATETIME NOT NULL\n, `updated_by` BIGINT(20) NOT NULL\n, `version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(376,'add index library_element org_id-folder_id-name-kind','CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_id_name_kind` ON `library_element` (`org_id`,`folder_id`,`name`,`kind`);',1,'','2024-09-11 07:14:47'),(377,'create library_element_connection table v1','CREATE TABLE IF NOT EXISTS `library_element_connection` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `element_id` BIGINT(20) NOT NULL\n, `kind` BIGINT(20) NOT NULL\n, `connection_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(378,'add index library_element_connection element_id-kind-connection_id','CREATE UNIQUE INDEX `UQE_library_element_connection_element_id_kind_connection_id` ON `library_element_connection` (`element_id`,`kind`,`connection_id`);',1,'','2024-09-11 07:14:47'),(379,'add unique index library_element org_id_uid','CREATE UNIQUE INDEX `UQE_library_element_org_id_uid` ON `library_element` (`org_id`,`uid`);',1,'','2024-09-11 07:14:47'),(380,'increase max description length to 2048','ALTER TABLE `library_element` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `description` VARCHAR(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:47'),(381,'alter library_element model to mediumtext','ALTER TABLE library_element MODIFY model MEDIUMTEXT NOT NULL;',1,'','2024-09-11 07:14:47'),(382,'clone move dashboard alerts to unified alerting','code migration',1,'','2024-09-11 07:14:47'),(383,'create data_keys table','CREATE TABLE IF NOT EXISTS `data_keys` (\n`name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `active` TINYINT(1) NOT NULL\n, `scope` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `provider` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `encrypted_data` BLOB NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(384,'create secrets table','CREATE TABLE IF NOT EXISTS `secrets` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `namespace` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(385,'rename data_keys name column to id','ALTER TABLE `data_keys` CHANGE `name` `id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2024-09-11 07:14:47'),(386,'add name column into data_keys','alter table `data_keys` ADD COLUMN `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2024-09-11 07:14:47'),(387,'copy data_keys id column values into name','UPDATE data_keys SET name = id',1,'','2024-09-11 07:14:47'),(388,'rename data_keys name column to label','ALTER TABLE `data_keys` CHANGE `name` `label` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2024-09-11 07:14:47'),(389,'rename data_keys id column back to name','ALTER TABLE `data_keys` CHANGE `id` `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2024-09-11 07:14:47'),(390,'create kv_store table v1','CREATE TABLE IF NOT EXISTS `kv_store` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `namespace` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(391,'add index kv_store.org_id-namespace-key','CREATE UNIQUE INDEX `UQE_kv_store_org_id_namespace_key` ON `kv_store` (`org_id`,`namespace`,`key`);',1,'','2024-09-11 07:14:47'),(392,'update dashboard_uid and panel_id from existing annotations','set dashboard_uid and panel_id migration',1,'','2024-09-11 07:14:47'),(393,'create permission table','CREATE TABLE IF NOT EXISTS `permission` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `action` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `scope` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(394,'add unique index permission.role_id','CREATE INDEX `IDX_permission_role_id` ON `permission` (`role_id`);',1,'','2024-09-11 07:14:47'),(395,'add unique index role_id_action_scope','CREATE UNIQUE INDEX `UQE_permission_role_id_action_scope` ON `permission` (`role_id`,`action`,`scope`);',1,'','2024-09-11 07:14:47'),(396,'create role table','CREATE TABLE IF NOT EXISTS `role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `version` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(397,'add column display_name','alter table `role` ADD COLUMN `display_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:47'),(398,'add column group_name','alter table `role` ADD COLUMN `group_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:47'),(399,'add index role.org_id','CREATE INDEX `IDX_role_org_id` ON `role` (`org_id`);',1,'','2024-09-11 07:14:47'),(400,'add unique index role_org_id_name','CREATE UNIQUE INDEX `UQE_role_org_id_name` ON `role` (`org_id`,`name`);',1,'','2024-09-11 07:14:47'),(401,'add index role_org_id_uid','CREATE UNIQUE INDEX `UQE_role_org_id_uid` ON `role` (`org_id`,`uid`);',1,'','2024-09-11 07:14:47'),(402,'create team role table','CREATE TABLE IF NOT EXISTS `team_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(403,'add index team_role.org_id','CREATE INDEX `IDX_team_role_org_id` ON `team_role` (`org_id`);',1,'','2024-09-11 07:14:47'),(404,'add unique index team_role_org_id_team_id_role_id','CREATE UNIQUE INDEX `UQE_team_role_org_id_team_id_role_id` ON `team_role` (`org_id`,`team_id`,`role_id`);',1,'','2024-09-11 07:14:47'),(405,'add index team_role.team_id','CREATE INDEX `IDX_team_role_team_id` ON `team_role` (`team_id`);',1,'','2024-09-11 07:14:47'),(406,'create user role table','CREATE TABLE IF NOT EXISTS `user_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(407,'add index user_role.org_id','CREATE INDEX `IDX_user_role_org_id` ON `user_role` (`org_id`);',1,'','2024-09-11 07:14:47'),(408,'add unique index user_role_org_id_user_id_role_id','CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role` (`org_id`,`user_id`,`role_id`);',1,'','2024-09-11 07:14:47'),(409,'add index user_role.user_id','CREATE INDEX `IDX_user_role_user_id` ON `user_role` (`user_id`);',1,'','2024-09-11 07:14:47'),(410,'create builtin role table','CREATE TABLE IF NOT EXISTS `builtin_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `role` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(411,'add index builtin_role.role_id','CREATE INDEX `IDX_builtin_role_role_id` ON `builtin_role` (`role_id`);',1,'','2024-09-11 07:14:47'),(412,'add index builtin_role.name','CREATE INDEX `IDX_builtin_role_role` ON `builtin_role` (`role`);',1,'','2024-09-11 07:14:47'),(413,'Add column org_id to builtin_role table','alter table `builtin_role` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(414,'add index builtin_role.org_id','CREATE INDEX `IDX_builtin_role_org_id` ON `builtin_role` (`org_id`);',1,'','2024-09-11 07:14:47'),(415,'add unique index builtin_role_org_id_role_id_role','CREATE UNIQUE INDEX `UQE_builtin_role_org_id_role_id_role` ON `builtin_role` (`org_id`,`role_id`,`role`);',1,'','2024-09-11 07:14:47'),(416,'Remove unique index role_org_id_uid','DROP INDEX `UQE_role_org_id_uid` ON `role`',1,'','2024-09-11 07:14:47'),(417,'add unique index role.uid','CREATE UNIQUE INDEX `UQE_role_uid` ON `role` (`uid`);',1,'','2024-09-11 07:14:47'),(418,'create seed assignment table','CREATE TABLE IF NOT EXISTS `seed_assignment` (\n`builtin_role` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(419,'add unique index builtin_role_role_name','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);',1,'','2024-09-11 07:14:47'),(420,'add column hidden to role table','alter table `role` ADD COLUMN `hidden` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(421,'create query_history table v1','CREATE TABLE IF NOT EXISTS `query_history` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `datasource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `created_at` INT NOT NULL\n, `comment` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `queries` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(422,'add index query_history.org_id-created_by-datasource_uid','CREATE INDEX `IDX_query_history_org_id_created_by_datasource_uid` ON `query_history` (`org_id`,`created_by`,`datasource_uid`);',1,'','2024-09-11 07:14:47'),(423,'alter table query_history alter column created_by type to bigint','ALTER TABLE query_history MODIFY created_by BIGINT;',1,'','2024-09-11 07:14:47'),(424,'teams permissions migration','code migration',1,'','2024-09-11 07:14:47'),(425,'dashboard permissions','code migration',1,'','2024-09-11 07:14:47'),(426,'dashboard permissions uid scopes','code migration',1,'','2024-09-11 07:14:47'),(427,'drop managed folder create actions','code migration',1,'','2024-09-11 07:14:47'),(428,'alerting notification permissions','code migration',1,'','2024-09-11 07:14:47'),(429,'create query_history_star table v1','CREATE TABLE IF NOT EXISTS `query_history_star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `query_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_id` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(430,'add index query_history.user_id-query_uid','CREATE UNIQUE INDEX `UQE_query_history_star_user_id_query_uid` ON `query_history_star` (`user_id`,`query_uid`);',1,'','2024-09-11 07:14:47'),(431,'add column org_id in query_history_star','alter table `query_history_star` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 1 ',1,'','2024-09-11 07:14:47'),(432,'alter table query_history_star_mig column user_id type to bigint','ALTER TABLE query_history_star MODIFY user_id BIGINT;',1,'','2024-09-11 07:14:47'),(433,'create correlation table v1','CREATE TABLE IF NOT EXISTS `correlation` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `source_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `target_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `label` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, PRIMARY KEY ( `uid`,`source_uid` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(434,'add index correlations.uid','CREATE INDEX `IDX_correlation_uid` ON `correlation` (`uid`);',1,'','2024-09-11 07:14:47'),(435,'add index correlations.source_uid','CREATE INDEX `IDX_correlation_source_uid` ON `correlation` (`source_uid`);',1,'','2024-09-11 07:14:47'),(436,'add correlation config column','alter table `correlation` ADD COLUMN `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:47'),(437,'create entity_events table','CREATE TABLE IF NOT EXISTS `entity_event` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `entity_id` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `event_type` VARCHAR(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(438,'create dashboard public config v1','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `refresh_rate` INT NOT NULL DEFAULT 30\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(439,'drop index UQE_dashboard_public_config_uid - v1','DROP INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config`',1,'','2024-09-11 07:14:47'),(440,'drop index IDX_dashboard_public_config_org_id_dashboard_uid - v1','DROP INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config`',1,'','2024-09-11 07:14:47'),(441,'Drop old dashboard public config table','DROP TABLE IF EXISTS `dashboard_public_config`',1,'','2024-09-11 07:14:47'),(442,'recreate dashboard public config v1','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `refresh_rate` INT NOT NULL DEFAULT 30\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(443,'create index UQE_dashboard_public_config_uid - v1','CREATE UNIQUE INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config` (`uid`);',1,'','2024-09-11 07:14:47'),(444,'create index IDX_dashboard_public_config_org_id_dashboard_uid - v1','CREATE INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config` (`org_id`,`dashboard_uid`);',1,'','2024-09-11 07:14:47'),(445,'drop index UQE_dashboard_public_config_uid - v2','DROP INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config`',1,'','2024-09-11 07:14:47'),(446,'drop index IDX_dashboard_public_config_org_id_dashboard_uid - v2','DROP INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config`',1,'','2024-09-11 07:14:47'),(447,'Drop public config table','DROP TABLE IF EXISTS `dashboard_public_config`',1,'','2024-09-11 07:14:47'),(448,'Recreate dashboard public config v2','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `access_token` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `updated_by` INT NULL\n, `created_at` DATETIME NOT NULL\n, `updated_at` DATETIME NULL\n, `is_enabled` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(449,'create index UQE_dashboard_public_config_uid - v2','CREATE UNIQUE INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config` (`uid`);',1,'','2024-09-11 07:14:47'),(450,'create index IDX_dashboard_public_config_org_id_dashboard_uid - v2','CREATE INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config` (`org_id`,`dashboard_uid`);',1,'','2024-09-11 07:14:47'),(451,'create index UQE_dashboard_public_config_access_token - v2','CREATE UNIQUE INDEX `UQE_dashboard_public_config_access_token` ON `dashboard_public_config` (`access_token`);',1,'','2024-09-11 07:14:47'),(452,'Rename table dashboard_public_config to dashboard_public - v2','ALTER TABLE `dashboard_public_config` RENAME TO `dashboard_public`',1,'','2024-09-11 07:14:47'),(453,'add annotations_enabled column','alter table `dashboard_public` ADD COLUMN `annotations_enabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(454,'add time_selection_enabled column','alter table `dashboard_public` ADD COLUMN `time_selection_enabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(455,'delete orphaned public dashboards','DELETE FROM dashboard_public WHERE dashboard_uid NOT IN (SELECT uid FROM dashboard)',1,'','2024-09-11 07:14:47'),(456,'add share column','alter table `dashboard_public` ADD COLUMN `share` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'public\' ',1,'','2024-09-11 07:14:47'),(457,'backfill empty share column fields with default of public','UPDATE dashboard_public SET share=\'public\' WHERE share=\'\'',1,'','2024-09-11 07:14:47'),(458,'create default alerting folders','code migration',1,'','2024-09-11 07:14:47'),(459,'create file table','CREATE TABLE IF NOT EXISTS `file` (\n`path` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `parent_folder_path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `contents` BLOB NOT NULL\n, `etag` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `cache_control` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `content_disposition` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `size` BIGINT(20) NOT NULL\n, `mime_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(460,'file table idx: path natural pk','CREATE UNIQUE INDEX `UQE_file_path_hash` ON `file` (`path_hash`);',1,'','2024-09-11 07:14:47'),(461,'file table idx: parent_folder_path_hash fast folder retrieval','CREATE INDEX `IDX_file_parent_folder_path_hash` ON `file` (`parent_folder_path_hash`);',1,'','2024-09-11 07:14:47'),(462,'create file_meta table','CREATE TABLE IF NOT EXISTS `file_meta` (\n`path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(463,'file table idx: path key','CREATE UNIQUE INDEX `UQE_file_meta_path_hash_key` ON `file_meta` (`path_hash`,`key`);',1,'','2024-09-11 07:14:47'),(464,'set path collation in file table','SELECT 0;',1,'','2024-09-11 07:14:47'),(465,'managed permissions migration','code migration',1,'','2024-09-11 07:14:47'),(466,'managed folder permissions alert actions migration','code migration',1,'','2024-09-11 07:14:47'),(467,'RBAC action name migrator','code migration',1,'','2024-09-11 07:14:47'),(468,'Add UID column to playlist','alter table `playlist` ADD COLUMN `uid` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2024-09-11 07:14:47'),(469,'Update uid column values in playlist','UPDATE playlist SET uid=id;',1,'','2024-09-11 07:14:47'),(470,'Add index for uid in playlist','CREATE UNIQUE INDEX `UQE_playlist_org_id_uid` ON `playlist` (`org_id`,`uid`);',1,'','2024-09-11 07:14:47'),(471,'update group index for alert rules','code migration',1,'','2024-09-11 07:14:47'),(472,'managed folder permissions alert actions repeated migration','code migration',1,'','2024-09-11 07:14:47'),(473,'admin only folder/dashboard permission','code migration',1,'','2024-09-11 07:14:47'),(474,'add action column to seed_assignment','alter table `seed_assignment` ADD COLUMN `action` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:47'),(475,'add scope column to seed_assignment','alter table `seed_assignment` ADD COLUMN `scope` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2024-09-11 07:14:47'),(476,'remove unique index builtin_role_role_name before nullable update','DROP INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment`',1,'','2024-09-11 07:14:47'),(477,'update seed_assignment role_name column to nullable','ALTER TABLE seed_assignment MODIFY role_name VARCHAR(190) DEFAULT NULL;',1,'','2024-09-11 07:14:47'),(478,'add unique index builtin_role_name back','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);',1,'','2024-09-11 07:14:47'),(479,'add unique index builtin_role_action_scope','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_action_scope` ON `seed_assignment` (`builtin_role`,`action`,`scope`);',1,'','2024-09-11 07:14:47'),(480,'add primary key to seed_assigment','code migration',1,'','2024-09-11 07:14:47'),(481,'managed folder permissions alert actions repeated fixed migration','code migration',1,'','2024-09-11 07:14:47'),(482,'migrate external alertmanagers to datsourcse','migrate external alertmanagers to datasource',1,'','2024-09-11 07:14:47'),(483,'create folder table','CREATE TABLE IF NOT EXISTS `folder` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `parent_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2024-09-11 07:14:47'),(484,'Add index for parent_uid','CREATE INDEX `IDX_folder_parent_uid_org_id` ON `folder` (`parent_uid`,`org_id`);',1,'','2024-09-11 07:14:47'),(485,'Add unique index for folder.uid and folder.org_id','CREATE UNIQUE INDEX `UQE_folder_uid_org_id` ON `folder` (`uid`,`org_id`);',1,'','2024-09-11 07:14:47'),(486,'Update folder title length','ALTER TABLE `folder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2024-09-11 07:14:47'),(487,'Add unique index for folder.title and folder.parent_uid','CREATE UNIQUE INDEX `UQE_folder_title_parent_uid` ON `folder` (`title`,`parent_uid`);',1,'','2024-09-11 07:14:47');
/*!40000 ALTER TABLE `migration_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngalert_configuration`
--

DROP TABLE IF EXISTS `ngalert_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngalert_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `alertmanagers` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `send_alerts_to` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_ngalert_configuration_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngalert_configuration`
--

LOCK TABLES `ngalert_configuration` WRITE;
/*!40000 ALTER TABLE `ngalert_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngalert_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `name` varchar(190) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` VALUES (1,0,'Main Org.','','','','','','',NULL,'2024-09-11 07:14:47','2024-09-11 07:14:47');
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_user_org_id_user_id` (`org_id`,`user_id`),
  KEY `IDX_org_user_org_id` (`org_id`),
  KEY `IDX_org_user_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
INSERT INTO `org_user` VALUES (1,1,1,'Admin','2024-09-11 07:14:47','2024-09-11 07:14:47');
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `action` varchar(190) NOT NULL,
  `scope` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_permission_role_id_action_scope` (`role_id`,`action`,`scope`),
  KEY `IDX_permission_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'dashboards:read','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(2,1,'dashboards:write','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(3,1,'dashboards:delete','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(4,1,'dashboards.permissions:read','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(5,1,'dashboards.permissions:write','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(6,2,'dashboards:read','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(7,2,'dashboards:write','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(8,2,'dashboards:delete','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57'),(9,3,'dashboards:read','dashboards:uid:b135752e-b7dd-49e2-8e8d-1c714a4e381d','2024-09-11 15:03:57','2024-09-11 15:03:57');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `interval` varchar(255) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `uid` varchar(80) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_playlist_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_item`
--

DROP TABLE IF EXISTS `playlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `playlist_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `title` text NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_item`
--

LOCK TABLES `playlist_item` WRITE;
/*!40000 ALTER TABLE `playlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_setting`
--

DROP TABLE IF EXISTS `plugin_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `plugin_id` varchar(190) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `json_data` text DEFAULT NULL,
  `secure_json_data` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `plugin_version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_plugin_setting_org_id_plugin_id` (`org_id`,`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_setting`
--

LOCK TABLES `plugin_setting` WRITE;
/*!40000 ALTER TABLE `plugin_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `home_dashboard_id` bigint(20) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `week_start` varchar(10) DEFAULT NULL,
  `json_data` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_preferences_org_id` (`org_id`),
  KEY `IDX_preferences_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,1,0,0,1,'','','2024-09-11 15:12:01','2024-09-11 15:12:01',0,'','{\"language\":\"\",\"queryHistory\":{\"homeTab\":\"\"},\"cookiePreferences\":null}');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provenance_type`
--

DROP TABLE IF EXISTS `provenance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provenance_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `record_key` varchar(190) NOT NULL,
  `record_type` varchar(190) NOT NULL,
  `provenance` varchar(190) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_provenance_type_record_type_record_key_org_id` (`record_type`,`record_key`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provenance_type`
--

LOCK TABLES `provenance_type` WRITE;
/*!40000 ALTER TABLE `provenance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provenance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history`
--

DROP TABLE IF EXISTS `query_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `datasource_uid` varchar(40) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `comment` text NOT NULL,
  `queries` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_query_history_org_id_created_by_datasource_uid` (`org_id`,`created_by`,`datasource_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history`
--

LOCK TABLES `query_history` WRITE;
/*!40000 ALTER TABLE `query_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history_star`
--

DROP TABLE IF EXISTS `query_history_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_history_star` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `query_uid` varchar(40) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_query_history_star_user_id_query_uid` (`user_id`,`query_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history_star`
--

LOCK TABLES `query_history_star` WRITE;
/*!40000 ALTER TABLE `query_history_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `target` varchar(190) NOT NULL,
  `limit` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_quota_org_id_user_id_target` (`org_id`,`user_id`,`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) NOT NULL,
  `description` text DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `uid` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `display_name` varchar(190) DEFAULT NULL,
  `group_name` varchar(190) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_role_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_role_uid` (`uid`),
  KEY `IDX_role_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'managed:users:1:permissions','',0,1,'ad9cb5aa-0917-4d1b-8473-11e98be7ef8a','2024-09-11 15:03:57','2024-09-11 15:03:57','','',0),(2,'managed:builtins:editor:permissions','',0,1,'d668dd30-3170-430b-90e8-25d43d0f7add','2024-09-11 15:03:57','2024-09-11 15:03:57','','',0),(3,'managed:builtins:viewer:permissions','',0,1,'f9594a84-06f3-4b10-96e9-2570747f6df5','2024-09-11 15:03:57','2024-09-11 15:03:57','','',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secrets`
--

DROP TABLE IF EXISTS `secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secrets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secrets`
--

LOCK TABLES `secrets` WRITE;
/*!40000 ALTER TABLE `secrets` DISABLE KEYS */;
INSERT INTO `secrets` VALUES (1,1,'MariaDB','datasource','I1kyTXlNekJsTTJFdE9XRXdPQzAwTm1GakxUazNNMll0WlRZeE1qWTNNRFl5T1dFeCMqWVdWekxXTm1ZZypVTXcxcXpFbhdhQr9bervQlOApqLvPtk+VxQitl9Syrq44ZcjSCAqz5N5nQo0rwfg','2024-09-11 14:40:03','2024-09-11 14:40:48');
/*!40000 ALTER TABLE `secrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seed_assignment`
--

DROP TABLE IF EXISTS `seed_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seed_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `builtin_role` varchar(190) NOT NULL,
  `role_name` varchar(190) DEFAULT NULL,
  `action` varchar(190) DEFAULT NULL,
  `scope` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_seed_assignment_builtin_role_role_name` (`builtin_role`,`role_name`),
  UNIQUE KEY `UQE_seed_assignment_builtin_role_action_scope` (`builtin_role`,`action`,`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seed_assignment`
--

LOCK TABLES `seed_assignment` WRITE;
/*!40000 ALTER TABLE `seed_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `seed_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_lock`
--

DROP TABLE IF EXISTS `server_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_uid` varchar(100) NOT NULL,
  `version` bigint(20) NOT NULL,
  `last_execution` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_server_lock_operation_uid` (`operation_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_lock`
--

LOCK TABLES `server_lock` WRITE;
/*!40000 ALTER TABLE `server_lock` DISABLE KEYS */;
INSERT INTO `server_lock` VALUES (1,'cleanup expired auth tokens',1,1726038888),(3,'delete old login attempts',28,1726067162);
/*!40000 ALTER TABLE `server_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `key` char(16) NOT NULL,
  `data` blob NOT NULL,
  `expiry` int(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `short_url`
--

DROP TABLE IF EXISTS `short_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `short_url` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `uid` varchar(40) NOT NULL,
  `path` text NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `last_seen_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_short_url_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `short_url`
--

LOCK TABLES `short_url` WRITE;
/*!40000 ALTER TABLE `short_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `short_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `dashboard_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_star_user_id_dashboard_id` (`user_id`,`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (1,1,1);
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_tag_key_value` (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_org_id_name` (`org_id`,`name`),
  KEY `IDX_team_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `permission` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_member_org_id_team_id_user_id` (`org_id`,`team_id`,`user_id`),
  KEY `IDX_team_member_org_id` (`org_id`),
  KEY `IDX_team_member_team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_role`
--

DROP TABLE IF EXISTS `team_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_role_org_id_team_id_role_id` (`org_id`,`team_id`,`role_id`),
  KEY `IDX_team_role_org_id` (`org_id`),
  KEY `IDX_team_role_team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_role`
--

LOCK TABLES `team_role` WRITE;
/*!40000 ALTER TABLE `team_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_user`
--

DROP TABLE IF EXISTS `temp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `code` varchar(190) NOT NULL,
  `status` varchar(20) NOT NULL,
  `invited_by_user_id` bigint(20) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `email_sent_on` datetime DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0,
  `updated` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_temp_user_email` (`email`),
  KEY `IDX_temp_user_org_id` (`org_id`),
  KEY `IDX_temp_user_code` (`code`),
  KEY `IDX_temp_user_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_user`
--

LOCK TABLES `temp_user` WRITE;
/*!40000 ALTER TABLE `temp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric1` varchar(20) DEFAULT NULL,
  `metric2` varchar(150) DEFAULT NULL,
  `value_big_int` bigint(20) DEFAULT NULL,
  `value_double` double DEFAULT NULL,
  `value_float` float DEFAULT NULL,
  `value_int` int(11) DEFAULT NULL,
  `time_epoch` bigint(20) NOT NULL,
  `time_date_time` datetime NOT NULL,
  `time_time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `login` varchar(190) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `rands` varchar(50) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `help_flags1` bigint(20) NOT NULL DEFAULT 0,
  `last_seen_at` datetime DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_account` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_login` (`login`),
  UNIQUE KEY `UQE_user_email` (`email`),
  KEY `IDX_user_login_email` (`login`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'mguardia','mguardia@localhost','Miguel','9fbc8ad647818a73c54945ea66b1498273cd7fd7ef91120c5e12d6ff014f49fcf129f7e16ba9f65e5d4c1be9c3129feaf483','UzVn1Tu2w4','YQuAdLbTRe','',1,1,0,'','2024-09-11 07:14:47','2024-09-11 14:14:04',1,'2024-09-11 15:11:51',0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `auth_module` varchar(190) NOT NULL,
  `auth_id` varchar(190) DEFAULT NULL,
  `created` datetime NOT NULL,
  `o_auth_access_token` text DEFAULT NULL,
  `o_auth_refresh_token` text DEFAULT NULL,
  `o_auth_token_type` text DEFAULT NULL,
  `o_auth_expiry` datetime DEFAULT NULL,
  `o_auth_id_token` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_user_auth_auth_module_auth_id` (`auth_module`,`auth_id`),
  KEY `IDX_user_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_token`
--

DROP TABLE IF EXISTS `user_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `auth_token` varchar(100) NOT NULL,
  `prev_auth_token` varchar(100) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `client_ip` varchar(255) NOT NULL,
  `auth_token_seen` tinyint(1) NOT NULL,
  `seen_at` int(11) DEFAULT NULL,
  `rotated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `revoked_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_auth_token_auth_token` (`auth_token`),
  UNIQUE KEY `UQE_user_auth_token_prev_auth_token` (`prev_auth_token`),
  KEY `IDX_user_auth_token_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_token`
--

LOCK TABLES `user_auth_token` WRITE;
/*!40000 ALTER TABLE `user_auth_token` DISABLE KEYS */;
INSERT INTO `user_auth_token` VALUES (2,1,'9f186c84f58d1896261990c6a6cb458a32f18ef63979fe6401ce90f8bfd04d36','ed92ffc5d3a88261cb7913cf3ed2f83dbf7a823e560720865a52da78f4a52a94','Mozilla/5.0 (X11; Linux aarch64; rv:109.0) Gecko/20100101 Firefox/115.0','172.18.0.1',1,1726065893,1726065863,1726064059,1726064059,0),(3,1,'fb4d03fba6a9861584aadeb2dc45ea5b0d1e5558b181f1b1eb544e835aa48eb4','fd5c52143216b5164d7e3780ba37cc6a041d1fc37ab3cb68af861c7c2d68f07c','Mozilla/5.0 (X11; Linux aarch64; rv:109.0) Gecko/20100101 Firefox/115.0','172.18.0.1',1,1726067186,1726067183,1726066581,1726066581,0);
/*!40000 ALTER TABLE `user_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_role_org_id_user_id_role_id` (`org_id`,`user_id`,`role_id`),
  KEY `IDX_user_role_org_id` (`org_id`),
  KEY `IDX_user_role_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,1,'2024-09-11 15:03:57');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11 15:13:05
