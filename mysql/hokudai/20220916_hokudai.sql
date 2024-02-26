-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: main
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0+deb11u1

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `argument` varchar(20) DEFAULT NULL,
  `detail_number` int(11) NOT NULL DEFAULT 0,
  `is_result_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'on','--on',0,0,NULL,NULL),(2,'get the value','--get',0,1,NULL,NULL),(3,'off','--off',0,0,NULL,NULL),(4,'waiting','wait',1,0,NULL,NULL),(5,'set infusion rate and run','--iraterun',2,0,NULL,NULL),(6,'set withdraw rate','--wrate',2,0,NULL,NULL),(7,'infusion run','--irun',0,0,NULL,NULL),(8,'withdraw run','--wrun',0,0,NULL,NULL),(9,'change position','--changePos',1,0,NULL,NULL),(10,'wait for steady-sate','--judge',0,0,NULL,NULL),(11,'set temp. and run','--setrun',1,0,NULL,NULL);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type_action_links`
--

DROP TABLE IF EXISTS `device_type_action_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type_action_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type_action_links`
--

LOCK TABLES `device_type_action_links` WRITE;
/*!40000 ALTER TABLE `device_type_action_links` DISABLE KEYS */;
INSERT INTO `device_type_action_links` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL),(8,1,8,NULL,NULL),(10,2,3,NULL,NULL),(11,2,5,NULL,NULL),(12,2,6,NULL,NULL),(13,2,7,NULL,NULL),(14,2,8,NULL,NULL),(15,3,9,NULL,NULL),(16,4,1,NULL,NULL),(17,4,2,NULL,NULL),(18,4,3,NULL,NULL),(19,5,1,NULL,NULL),(20,5,2,NULL,NULL),(21,5,3,NULL,NULL),(22,6,4,NULL,NULL),(23,1,9,NULL,NULL),(24,5,10,NULL,NULL),(26,5,11,NULL,NULL),(27,1,11,NULL,NULL);
/*!40000 ALTER TABLE `device_type_action_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_types`
--

DROP TABLE IF EXISTS `device_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type_name` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_types`
--

LOCK TABLES `device_types` WRITE;
/*!40000 ALTER TABLE `device_types` DISABLE KEYS */;
INSERT INTO `device_types` VALUES (1,'testType',NULL,NULL),(2,'syringePump',NULL,NULL),(3,'6-way valve',NULL,NULL),(4,'thermometer',NULL,NULL),(5,'temperature controller',NULL,NULL),(6,'No device',NULL,NULL);
/*!40000 ALTER TABLE `device_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_value_choices`
--

DROP TABLE IF EXISTS `device_value_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_value_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_link_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_value_choices`
--

LOCK TABLES `device_value_choices` WRITE;
/*!40000 ALTER TABLE `device_value_choices` DISABLE KEYS */;
INSERT INTO `device_value_choices` VALUES (1,15,1,NULL,NULL,NULL),(2,15,2,NULL,NULL,NULL),(3,15,3,NULL,NULL,NULL),(4,15,4,NULL,NULL,NULL),(5,15,5,NULL,NULL,NULL),(6,15,6,NULL,NULL,NULL),(7,23,1,NULL,NULL,NULL),(8,23,2,NULL,NULL,NULL),(9,23,3,NULL,NULL,NULL),(10,23,4,NULL,NULL,NULL),(11,23,5,NULL,NULL,NULL),(12,23,6,NULL,NULL,NULL),(13,5,NULL,'mL/min',NULL,NULL),(14,5,NULL,'mL/s',NULL,NULL),(15,5,NULL,'μL/min',NULL,NULL),(16,5,NULL,'μL/s',NULL,NULL),(17,5,NULL,'nL/min',NULL,NULL),(18,5,NULL,'nL/s',NULL,NULL),(19,11,NULL,'mL/min',NULL,NULL),(20,11,NULL,'mL/s',NULL,NULL),(21,11,NULL,'μL/min',NULL,NULL),(22,11,NULL,'μL/s',NULL,NULL),(23,11,NULL,'nL/min',NULL,NULL),(24,11,NULL,'nL/s',NULL,NULL),(25,6,NULL,'mL/min',NULL,NULL),(26,6,NULL,'mL/s',NULL,NULL),(27,6,NULL,'μL/min',NULL,NULL),(28,6,NULL,'μL/s',NULL,NULL),(29,6,NULL,'nL/min',NULL,NULL),(30,6,NULL,'nL/s',NULL,NULL),(31,12,NULL,'mL/min',NULL,NULL),(32,12,NULL,'mL/s',NULL,NULL),(33,12,NULL,'μL/min',NULL,NULL),(34,12,NULL,'μL/s',NULL,NULL),(35,12,NULL,'nL/min',NULL,NULL),(36,12,NULL,'nL/s',NULL,NULL);
/*!40000 ALTER TABLE `device_value_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experiment_title_id` int(11) NOT NULL,
  `device_name` varchar(200) NOT NULL,
  `device_type_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'-',6,'2022-08-22 09:11:00',NULL),(2,1,'a',1,'2022-08-22 09:11:18',NULL),(3,2,'-',6,'2022-08-22 09:14:19',NULL),(4,2,'b',1,'2022-08-22 09:14:37',NULL),(5,2,'temp',5,'2022-09-08 20:13:49',NULL),(6,1,'b',5,'2022-09-08 20:35:09',NULL),(7,3,'-',6,'2022-09-08 20:41:31',NULL),(8,3,'a',5,'2022-09-08 20:42:06',NULL),(9,4,'-',6,'2022-09-09 11:49:22',NULL),(10,4,'a',5,'2022-09-09 11:49:46',NULL),(11,5,'-',6,'2022-09-12 12:09:52',NULL),(12,5,'a',2,'2022-09-12 12:10:05',NULL),(13,6,'-',6,'2022-09-12 14:28:16',NULL),(14,6,'temp',5,'2022-09-12 14:29:38',NULL),(15,7,'-',6,'2022-09-12 15:42:46',NULL),(16,7,'pump',2,'2022-09-12 15:45:03',NULL),(17,7,'vulve',3,'2022-09-12 15:46:17',NULL),(18,8,'-',6,'2022-09-12 16:43:54',NULL),(19,8,'temp',5,'2022-09-12 16:44:29',NULL),(20,9,'-',6,'2022-09-14 09:57:00',NULL),(21,9,'pump',2,'2022-09-14 10:11:49',NULL),(22,9,'temp controller',5,'2022-09-14 10:12:57',NULL),(23,6,'pump',2,'2022-09-14 10:19:59',NULL),(24,10,'-',6,'2022-09-14 12:54:22',NULL),(25,10,'a',2,'2022-09-14 12:55:01',NULL),(26,11,'-',6,'2022-09-14 15:10:57',NULL),(27,11,'pump',2,'2022-09-14 15:12:42',NULL),(28,11,'temp cont',5,'2022-09-14 15:13:09',NULL),(29,12,'-',6,'2022-09-15 10:44:55',NULL),(30,12,'vulve',3,'2022-09-15 10:46:15',NULL),(31,12,'pump',2,'2022-09-15 10:47:56',NULL),(32,12,'temp controller',5,'2022-09-15 10:48:14',NULL),(33,13,'-',6,'2022-09-15 13:55:31',NULL),(34,13,'vulve',3,'2022-09-15 13:56:04',NULL),(35,13,'pump',2,'2022-09-15 13:56:15',NULL);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_conditions`
--

DROP TABLE IF EXISTS `experiment_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experiment_procedure_id` int(11) NOT NULL,
  `condition_title` varchar(200) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `device_link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_conditions`
--

LOCK TABLES `experiment_conditions` WRITE;
/*!40000 ALTER TABLE `experiment_conditions` DISABLE KEYS */;
INSERT INTO `experiment_conditions` VALUES (1,8,'バルブtoA','4','2022-09-12 15:46:17',NULL,15),(2,8,'バルブtoB','6','2022-09-12 15:46:54',NULL,15),(3,7,'試薬Aの流量','20 mL/min','2022-09-14 10:19:59','2022-09-14 10:20:39',11);
/*!40000 ALTER TABLE `experiment_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_procedure_blocks`
--

DROP TABLE IF EXISTS `experiment_procedure_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_procedure_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experiment_procedure_id` int(11) NOT NULL,
  `experiment_block_order` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `condition_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedure_blocks`
--

LOCK TABLES `experiment_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `experiment_procedure_blocks` DISABLE KEYS */;
INSERT INTO `experiment_procedure_blocks` VALUES (1,1,1,2,1,NULL,NULL,'2022-08-22 09:11:18',NULL),(2,1,2,1,4,'1',NULL,'2022-08-22 09:11:23',NULL),(3,2,1,4,1,NULL,NULL,'2022-08-22 09:14:37',NULL),(4,2,2,5,11,'30',NULL,'2022-09-08 20:13:49','2022-09-08 20:16:28'),(5,2,3,4,3,NULL,NULL,'2022-09-08 20:13:59',NULL),(6,2,4,5,10,NULL,NULL,'2022-09-08 20:14:08',NULL),(7,2,5,4,1,NULL,NULL,'2022-09-08 20:14:23',NULL),(8,2,6,5,3,NULL,NULL,'2022-09-08 20:20:19',NULL),(9,1,3,6,10,NULL,NULL,'2022-09-08 20:35:09',NULL),(10,1,4,6,3,NULL,NULL,'2022-09-08 20:35:17',NULL),(11,4,1,8,11,'30',NULL,'2022-09-08 20:42:06',NULL),(12,4,2,8,1,NULL,NULL,'2022-09-08 20:42:13',NULL),(13,4,3,8,10,NULL,NULL,'2022-09-08 20:42:19',NULL),(14,4,4,8,3,NULL,NULL,'2022-09-08 20:42:25',NULL),(15,5,1,10,11,'30',NULL,'2022-09-09 11:49:46',NULL),(16,5,2,9,4,'4',NULL,'2022-09-09 11:49:56',NULL),(17,5,3,10,10,NULL,NULL,'2022-09-09 11:50:03',NULL),(18,5,4,10,3,NULL,NULL,'2022-09-09 11:50:08',NULL),(19,6,1,12,7,NULL,NULL,'2022-09-12 12:10:05',NULL),(20,6,2,11,4,'4',NULL,'2022-09-12 12:10:13',NULL),(21,6,3,12,3,NULL,NULL,'2022-09-12 12:10:18',NULL),(22,7,1,14,11,'60',NULL,'2022-09-12 14:29:38','2022-09-13 18:36:27'),(23,7,2,13,4,'6',NULL,'2022-09-12 14:29:52',NULL),(24,7,3,14,10,NULL,NULL,'2022-09-12 14:30:02',NULL),(25,7,4,13,4,'10',NULL,'2022-09-12 14:30:29',NULL),(26,7,5,14,3,NULL,NULL,'2022-09-12 14:30:36',NULL),(27,8,2,16,5,'1 mL/min',NULL,'2022-09-12 15:45:03','2022-09-12 16:02:24'),(28,8,1,17,9,NULL,1,'2022-09-12 15:46:17',NULL),(30,8,5,17,9,NULL,2,'2022-09-12 15:46:54',NULL),(31,8,4,15,4,'15',NULL,'2022-09-12 15:47:47','2022-09-13 14:23:34'),(32,8,6,15,4,'15',NULL,'2022-09-12 15:48:24','2022-09-13 14:23:39'),(33,8,7,17,9,NULL,1,'2022-09-12 15:48:34',NULL),(34,8,3,16,7,NULL,NULL,'2022-09-12 15:50:10',NULL),(35,8,8,16,3,NULL,NULL,'2022-09-12 15:51:49',NULL),(36,9,1,19,11,'50',NULL,'2022-09-12 16:44:29',NULL),(37,9,2,19,10,NULL,NULL,'2022-09-12 16:44:35',NULL),(38,9,3,18,4,'2',NULL,'2022-09-12 16:44:45',NULL),(39,10,1,21,5,'0.1 mL/min',NULL,'2022-09-14 10:11:49',NULL),(41,10,3,22,11,'30',NULL,'2022-09-14 10:12:57',NULL),(42,10,4,22,10,NULL,NULL,'2022-09-14 10:13:32',NULL),(43,10,5,21,5,'1 mL/min',NULL,'2022-09-14 10:15:02',NULL),(44,10,6,20,4,'600',NULL,'2022-09-14 10:16:55','2022-09-14 13:32:19'),(45,11,1,21,5,'0.1 mL/min',NULL,'2022-09-14 10:17:11',NULL),(47,11,3,22,11,'40',NULL,'2022-09-14 10:17:11','2022-09-14 10:18:06'),(48,11,4,22,10,NULL,NULL,'2022-09-14 10:17:11',NULL),(49,11,5,21,5,'1 mL/min',NULL,'2022-09-14 10:17:11',NULL),(50,11,6,20,4,'600',NULL,'2022-09-14 10:17:11','2022-09-14 13:32:27'),(51,12,1,21,5,'0.1 mL/min',NULL,'2022-09-14 10:17:11',NULL),(53,12,3,22,11,'50',NULL,'2022-09-14 10:17:11','2022-09-14 10:18:17'),(54,12,4,22,10,NULL,NULL,'2022-09-14 10:17:11',NULL),(55,12,5,21,5,'1 mL/min',NULL,'2022-09-14 10:17:11',NULL),(56,12,6,20,4,'600',NULL,'2022-09-14 10:17:11','2022-09-14 13:32:33'),(57,13,1,21,3,NULL,NULL,'2022-09-14 10:19:06',NULL),(58,13,2,22,3,NULL,NULL,'2022-09-14 10:19:11',NULL),(59,7,6,23,5,NULL,3,'2022-09-14 10:19:59',NULL),(60,7,7,23,5,NULL,3,'2022-09-14 10:20:16',NULL),(61,14,1,25,5,'1 mL/min',NULL,'2022-09-14 12:55:01',NULL),(62,14,2,24,4,'5',NULL,'2022-09-14 12:55:10',NULL),(63,14,3,25,3,NULL,NULL,'2022-09-14 12:55:17',NULL),(64,15,1,27,5,'0.1 mL/min',NULL,'2022-09-14 15:12:42',NULL),(65,15,2,28,11,'50',NULL,'2022-09-14 15:13:09',NULL),(66,15,3,28,10,NULL,NULL,'2022-09-14 15:13:22',NULL),(67,15,4,27,5,'1 mL/min',NULL,'2022-09-14 15:13:59',NULL),(68,15,5,26,4,'600',NULL,'2022-09-14 15:14:11',NULL),(69,15,6,27,3,NULL,NULL,'2022-09-14 15:14:33',NULL),(70,15,7,28,3,NULL,NULL,'2022-09-14 15:14:41',NULL),(71,16,1,30,9,'1',NULL,'2022-09-15 10:46:15',NULL),(72,16,2,31,5,'0.1 mL/min',NULL,'2022-09-15 10:47:56',NULL),(73,16,3,32,11,'60',NULL,'2022-09-15 10:48:14',NULL),(74,16,4,32,10,NULL,NULL,'2022-09-15 10:48:28',NULL),(75,16,5,31,5,'1 mL/min',NULL,'2022-09-15 10:49:27',NULL),(76,17,1,30,9,'2',NULL,'2022-09-15 10:49:50',NULL),(77,17,2,29,4,'780',NULL,'2022-09-15 10:50:17',NULL),(78,18,1,30,9,'4',NULL,'2022-09-15 10:50:27','2022-09-15 10:50:39'),(79,18,2,29,4,'780',NULL,'2022-09-15 10:50:27',NULL),(80,19,1,30,9,'6',NULL,'2022-09-15 10:50:27','2022-09-15 10:50:45'),(81,19,2,29,4,'780',NULL,'2022-09-15 10:50:27',NULL),(82,20,1,31,3,NULL,NULL,'2022-09-15 10:51:00',NULL),(83,20,2,32,3,NULL,NULL,'2022-09-15 10:51:08',NULL),(84,20,3,30,9,'1',NULL,'2022-09-15 10:51:16',NULL),(85,21,1,34,9,'1',NULL,'2022-09-15 13:56:04',NULL),(86,21,2,35,5,'1 mL/min',NULL,'2022-09-15 13:56:15',NULL),(87,21,3,33,4,'15',NULL,'2022-09-15 13:56:38',NULL),(88,21,4,34,9,'2',NULL,'2022-09-15 13:56:45',NULL),(89,21,5,33,4,'600',NULL,'2022-09-15 13:56:50',NULL),(90,21,6,34,9,'4',NULL,'2022-09-15 13:56:59',NULL),(91,21,7,33,4,'600',NULL,'2022-09-15 13:57:09',NULL),(92,21,8,34,9,'6',NULL,'2022-09-15 13:57:20',NULL),(93,21,9,33,4,'600',NULL,'2022-09-15 13:57:27',NULL),(94,21,10,34,9,'1',NULL,'2022-09-15 13:57:37',NULL),(95,21,11,35,3,NULL,NULL,'2022-09-15 13:57:48',NULL);
/*!40000 ALTER TABLE `experiment_procedure_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_procedures`
--

DROP TABLE IF EXISTS `experiment_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experiment_title_id` int(11) NOT NULL,
  `experiment_procedure_order` int(11) NOT NULL,
  `experiment_procedure_title` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedures`
--

LOCK TABLES `experiment_procedures` WRITE;
/*!40000 ALTER TABLE `experiment_procedures` DISABLE KEYS */;
INSERT INTO `experiment_procedures` VALUES (1,1,1,'a','2022-08-22 09:11:08',NULL),(2,2,1,'b','2022-08-22 09:14:30',NULL),(3,1,2,'b','2022-08-22 23:22:23',NULL),(4,3,1,'a','2022-09-08 20:41:40',NULL),(5,4,1,'a','2022-09-09 11:49:34',NULL),(6,5,1,'a','2022-09-12 12:09:57',NULL),(7,6,1,'a','2022-09-12 14:29:20',NULL),(8,7,1,'run','2022-09-12 15:42:56',NULL),(9,8,1,'a','2022-09-12 16:44:13',NULL),(10,9,1,'measure 30','2022-09-14 10:06:30','2022-09-14 10:17:30'),(11,9,2,'measure 40','2022-09-14 10:17:11','2022-09-14 10:17:34'),(12,9,3,'measure 50','2022-09-14 10:17:11','2022-09-14 10:17:40'),(13,9,4,'shutdown','2022-09-14 10:18:34',NULL),(14,10,1,'a','2022-09-14 12:54:48',NULL),(15,11,1,'flow rxn','2022-09-14 15:11:52',NULL),(16,12,1,'setup','2022-09-15 10:45:32','2022-09-15 10:50:27'),(17,12,2,'measure','2022-09-15 10:48:59','2022-09-15 10:50:27'),(18,12,3,'measure','2022-09-15 10:50:27',NULL),(19,12,4,'measure','2022-09-15 10:50:27',NULL),(20,12,5,'shutdown','2022-09-15 10:50:53',NULL),(21,13,1,'wash','2022-09-15 13:55:48',NULL);
/*!40000 ALTER TABLE `experiment_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_titles`
--

DROP TABLE IF EXISTS `experiment_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experiment_title` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_titles`
--

LOCK TABLES `experiment_titles` WRITE;
/*!40000 ALTER TABLE `experiment_titles` DISABLE KEYS */;
INSERT INTO `experiment_titles` VALUES (1,'a','2022-08-22 09:11:00',NULL),(2,'b','2022-08-22 09:14:19',NULL),(3,'c','2022-09-08 20:41:31',NULL),(4,'d','2022-09-09 11:49:22',NULL),(5,'e','2022-09-12 12:09:52',NULL),(6,'f','2022-09-12 14:28:16',NULL),(7,'syringe','2022-09-12 15:42:46',NULL),(8,'temp','2022-09-12 16:43:54',NULL),(9,'flow suzuki','2022-09-14 09:57:00',NULL),(10,'aa','2022-09-14 12:54:22',NULL),(11,'flow suzuki single','2022-09-14 15:10:57',NULL),(12,'flow suzuki multi','2022-09-15 10:44:55',NULL),(13,'senjo multi','2022-09-15 13:55:31',NULL);
/*!40000 ALTER TABLE `experiment_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_conditions`
--

DROP TABLE IF EXISTS `result_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_procedure_id` int(11) NOT NULL,
  `condition_title` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_conditions`
--

LOCK TABLES `result_conditions` WRITE;
/*!40000 ALTER TABLE `result_conditions` DISABLE KEYS */;
INSERT INTO `result_conditions` VALUES (1,20,'バルブtoA','4','2022-09-12 15:52:03'),(2,20,'バルブtoB','6','2022-09-12 15:52:03'),(3,21,'バルブtoA','4','2022-09-12 16:05:12'),(4,21,'バルブtoB','6','2022-09-12 16:05:12'),(5,25,'バルブtoA','4','2022-09-13 15:01:48'),(6,25,'バルブtoB','6','2022-09-13 15:01:48'),(7,26,'バルブtoA','4','2022-09-13 15:02:21'),(8,26,'バルブtoB','6','2022-09-13 15:02:21'),(9,27,'バルブtoA','4','2022-09-13 15:22:23'),(10,27,'バルブtoB','6','2022-09-13 15:22:23');
/*!40000 ALTER TABLE `result_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_data`
--

DROP TABLE IF EXISTS `result_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `result_block_id` int(11) NOT NULL,
  `data` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_data`
--

LOCK TABLES `result_data` WRITE;
/*!40000 ALTER TABLE `result_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_devices`
--

DROP TABLE IF EXISTS `result_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `device_name` varchar(200) NOT NULL,
  `result_device_name` varchar(200) NOT NULL DEFAULT 'NoName',
  `result_device_model` varchar(200) DEFAULT NULL,
  `result_device_company` varchar(200) DEFAULT NULL,
  `result_device_serialnumber` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_devices`
--

LOCK TABLES `result_devices` WRITE;
/*!40000 ALTER TABLE `result_devices` DISABLE KEYS */;
INSERT INTO `result_devices` VALUES (1,1,'-','-',NULL,NULL,NULL,'2022-08-22 09:12:56'),(2,1,'a','test2','test','test','1234','2022-08-22 09:12:56'),(3,2,'b','test2','test','test','1234','2022-08-22 09:14:48'),(4,3,'b','test2','test','test','1234','2022-08-22 09:15:27'),(5,4,'b','test2','test','test','1234','2022-08-22 09:16:26'),(6,5,'-','-',NULL,NULL,NULL,'2022-08-22 09:16:47'),(7,5,'a','test2','test','test','1234','2022-08-22 09:16:47'),(8,6,'-','-',NULL,NULL,NULL,'2022-08-22 23:22:30'),(9,6,'a','test2','test','test','1234','2022-08-22 23:22:30'),(10,7,'b','test','-','-','-','2022-09-08 20:18:29'),(11,7,'temp','temp. controller','N/A','N/A','N/A','2022-09-08 20:18:29'),(12,8,'b','test','-','-','-','2022-09-08 20:21:44'),(13,8,'temp','temp. controller','N/A','N/A','N/A','2022-09-08 20:21:44'),(14,9,'b','test','-','-','-','2022-09-08 20:24:12'),(15,9,'temp','temp. controller','N/A','N/A','N/A','2022-09-08 20:24:12'),(16,10,'-','-',NULL,NULL,NULL,'2022-09-08 20:35:28'),(17,10,'b','test','-','-','-','2022-09-08 20:35:28'),(18,10,'b','test','-','-','-','2022-09-08 20:35:28'),(19,11,'a','test','-','-','-','2022-09-08 20:42:32'),(20,12,'a','temp. controller','N/A','N/A','N/A','2022-09-09 11:50:42'),(21,13,'-','-',NULL,NULL,NULL,'2022-09-12 12:10:27'),(22,13,'a','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-12 12:10:27'),(23,14,'-','-',NULL,NULL,NULL,'2022-09-12 12:11:44'),(24,14,'a','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-12 12:11:44'),(25,15,'-','-',NULL,NULL,NULL,'2022-09-12 14:32:35'),(26,15,'temp','tempController','BH501','yamato','65100342','2022-09-12 14:32:35'),(27,16,'-','-',NULL,NULL,NULL,'2022-09-12 14:38:03'),(28,16,'temp','tempController','BH501','yamato','65100342','2022-09-12 14:38:03'),(29,17,'-','-',NULL,NULL,NULL,'2022-09-12 14:44:56'),(30,17,'temp','tempController','BH501','yamato','65100342','2022-09-12 14:44:56'),(31,18,'-','-',NULL,NULL,NULL,'2022-09-12 15:52:03'),(32,18,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-12 15:52:03'),(33,18,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-12 15:52:03'),(34,19,'-','-',NULL,NULL,NULL,'2022-09-12 16:05:12'),(35,19,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-12 16:05:12'),(36,19,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-12 16:05:12'),(37,20,'-','-',NULL,NULL,NULL,'2022-09-12 16:45:04'),(38,20,'temp','tempController','BH501','yamato','65100342','2022-09-12 16:45:04'),(39,21,'-','-',NULL,NULL,NULL,'2022-09-13 12:52:33'),(40,21,'temp','tempController','BH501','yamato','65100342','2022-09-13 12:52:33'),(41,22,'-','-',NULL,NULL,NULL,'2022-09-13 13:11:37'),(42,22,'temp','tempController','BH501','yamato','65100342','2022-09-13 13:11:37'),(43,23,'-','-',NULL,NULL,NULL,'2022-09-13 15:01:48'),(44,23,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-13 15:01:48'),(45,23,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-13 15:01:48'),(46,24,'-','-',NULL,NULL,NULL,'2022-09-13 15:02:21'),(47,24,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-13 15:02:21'),(48,24,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-13 15:02:21'),(49,25,'-','-',NULL,NULL,NULL,'2022-09-13 15:22:23'),(50,25,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-13 15:22:23'),(51,25,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-13 15:22:23'),(52,26,'-','-',NULL,NULL,NULL,'2022-09-13 17:26:08'),(53,26,'temp','tempController','BH501','yamato','65100342','2022-09-13 17:26:08'),(54,27,'-','-',NULL,NULL,NULL,'2022-09-13 17:30:26'),(55,27,'temp','tempController','BH501','yamato','65100342','2022-09-13 17:30:26'),(56,28,'-','-',NULL,NULL,NULL,'2022-09-13 17:35:08'),(57,28,'temp','tempController','BH501','yamato','65100342','2022-09-13 17:35:08'),(58,29,'-','-',NULL,NULL,NULL,'2022-09-13 17:40:28'),(59,29,'temp','tempController','BH501','yamato','65100342','2022-09-13 17:40:28'),(60,30,'-','-',NULL,NULL,NULL,'2022-09-13 17:49:53'),(61,30,'temp','tempController','BH501','yamato','65100342','2022-09-13 17:49:53'),(62,31,'-','-',NULL,NULL,NULL,'2022-09-13 18:07:49'),(63,31,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:07:49'),(64,32,'-','-',NULL,NULL,NULL,'2022-09-13 18:09:26'),(65,32,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:09:26'),(66,33,'-','-',NULL,NULL,NULL,'2022-09-13 18:16:42'),(67,33,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:16:42'),(68,34,'-','-',NULL,NULL,NULL,'2022-09-13 18:17:40'),(69,34,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:17:40'),(70,35,'-','-',NULL,NULL,NULL,'2022-09-13 18:18:29'),(71,35,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:18:29'),(72,36,'-','-',NULL,NULL,NULL,'2022-09-13 18:19:28'),(73,36,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:19:28'),(74,37,'-','-',NULL,NULL,NULL,'2022-09-13 18:28:24'),(75,37,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:28:24'),(76,38,'-','-',NULL,NULL,NULL,'2022-09-13 18:32:47'),(77,38,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:32:47'),(78,39,'-','-',NULL,NULL,NULL,'2022-09-13 18:36:34'),(79,39,'temp','tempController','BH501','yamato','65100342','2022-09-13 18:36:34'),(80,40,'-','-',NULL,NULL,NULL,'2022-09-14 10:29:51'),(81,40,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-14 10:29:51'),(82,40,'temp controller','tempController','BH501','yamato','65100342','2022-09-14 10:29:51'),(83,41,'-','-',NULL,NULL,NULL,'2022-09-14 12:56:03'),(84,41,'a','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-14 12:56:03'),(85,42,'-','-',NULL,NULL,NULL,'2022-09-14 12:57:40'),(86,42,'a','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-14 12:57:40'),(87,43,'-','-',NULL,NULL,NULL,'2022-09-14 13:02:35'),(88,43,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-14 13:02:35'),(89,43,'temp controller','tempController','BH501','yamato','65100342','2022-09-14 13:02:35'),(90,44,'-','-',NULL,NULL,NULL,'2022-09-14 13:34:47'),(91,44,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-14 13:34:47'),(92,44,'temp controller','tempController','BH501','yamato','65100342','2022-09-14 13:34:47'),(93,45,'-','-',NULL,NULL,NULL,'2022-09-14 15:15:30'),(94,45,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-14 15:15:30'),(95,45,'temp cont','tempController','BH501','yamato','65100342','2022-09-14 15:15:30'),(96,46,'-','-',NULL,NULL,NULL,'2022-09-15 12:28:17'),(97,46,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-15 12:28:17'),(98,46,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-15 12:28:17'),(99,46,'temp controller','tempController','BH501','yamato','65100342','2022-09-15 12:28:17'),(100,47,'-','-',NULL,NULL,NULL,'2022-09-15 12:30:11'),(101,47,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-15 12:30:11'),(102,47,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-15 12:30:11'),(103,47,'temp controller','tempController','BH501','yamato','65100342','2022-09-15 12:30:11'),(104,48,'-','-',NULL,NULL,NULL,'2022-09-15 14:05:32'),(105,48,'vulve','valve','VA-21-618','FLOM','2601R0402','2022-09-15 14:05:32'),(106,48,'pump','syringePump1','PHD ULTRA','Harvard','1103953','2022-09-15 14:05:32');
/*!40000 ALTER TABLE `result_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_procedure_blocks`
--

DROP TABLE IF EXISTS `result_procedure_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_procedure_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_procedure_id` int(11) NOT NULL,
  `result_block_order` int(11) NOT NULL,
  `result_device_id` int(11) NOT NULL,
  `action_name` varchar(200) NOT NULL,
  `action_argument` varchar(200) NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedure_blocks`
--

LOCK TABLES `result_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `result_procedure_blocks` DISABLE KEYS */;
INSERT INTO `result_procedure_blocks` VALUES (1,4,1,5,'on','--on',NULL,'2022-08-22 09:16:26'),(2,5,1,7,'on','--on',NULL,'2022-08-22 09:16:47'),(3,5,2,6,'waiting','wait','1','2022-08-22 09:16:48'),(4,6,1,9,'on','--on',NULL,'2022-08-22 23:22:31'),(5,6,2,8,'waiting','wait','1','2022-08-22 23:22:32'),(6,8,1,10,'on','--on',NULL,'2022-09-08 20:18:29'),(7,8,2,11,'set temp. and run','--setrun','30','2022-09-08 20:18:29'),(8,8,3,10,'off','--off',NULL,'2022-09-08 20:18:29'),(9,9,1,12,'on','--on',NULL,'2022-09-08 20:21:44'),(10,9,2,13,'set temp. and run','--setrun','30','2022-09-08 20:21:44'),(11,9,3,12,'off','--off',NULL,'2022-09-08 20:21:44'),(12,10,1,14,'on','--on',NULL,'2022-09-08 20:24:12'),(13,10,2,15,'set temp. and run','--setrun','30','2022-09-08 20:24:13'),(14,10,3,14,'off','--off',NULL,'2022-09-08 20:24:13'),(15,11,1,17,'on','--on',NULL,'2022-09-08 20:35:28'),(16,11,2,16,'waiting','wait','1','2022-09-08 20:35:29'),(17,13,1,19,'set temp. and run','--setrun','30','2022-09-08 20:42:33'),(18,13,2,19,'on','--on',NULL,'2022-09-08 20:42:33'),(19,14,1,20,'set temp. and run','--setrun','30','2022-09-09 11:50:43'),(20,14,2,20,'on','--on',NULL,'2022-09-09 11:50:43'),(21,14,3,20,'wait for steady-sate','--judge','100','2022-09-09 12:00:31'),(22,14,4,20,'off','--off',NULL,'2022-09-09 12:00:31'),(23,15,1,22,'infusion run','--irun',NULL,'2022-09-12 12:10:28'),(24,15,2,21,'waiting','wait','4','2022-09-12 12:10:32'),(25,15,3,22,'off','--off',NULL,'2022-09-12 12:10:32'),(26,16,1,24,'infusion run','--irun',NULL,'2022-09-12 12:11:44'),(27,16,2,23,'waiting','wait','4','2022-09-12 12:11:48'),(28,16,3,24,'off','--off',NULL,'2022-09-12 12:11:49'),(29,17,1,26,'set temp. and run','--setrun','28','2022-09-12 14:32:36'),(30,17,2,25,'waiting','wait','6','2022-09-12 14:32:42'),(31,18,1,28,'set temp. and run','--setrun','28','2022-09-12 14:38:04'),(32,18,2,27,'waiting','wait','6','2022-09-12 14:38:10'),(33,19,1,30,'set temp. and run','--setrun','28','2022-09-12 14:44:57'),(34,19,2,29,'waiting','wait','6','2022-09-12 14:45:03'),(35,20,1,33,'change position','--changePos','4','2022-09-12 15:52:03'),(36,20,2,32,'set infusion rate','--irate','0.5 mL/min','2022-09-12 15:52:04'),(37,20,3,32,'infusion run','--irun',NULL,'2022-09-12 15:52:05'),(38,21,1,36,'change position','--changePos','4','2022-09-12 16:05:12'),(39,21,2,35,'set infusion rate','--irate','1 mL/min','2022-09-12 16:05:13'),(40,21,3,35,'infusion run','--irun',NULL,'2022-09-12 16:05:13'),(41,21,4,34,'waiting','wait','500','2022-09-12 16:13:33'),(42,21,5,36,'change position','--changePos','6','2022-09-12 16:13:34'),(43,21,6,34,'waiting','wait','500','2022-09-12 16:21:54'),(44,21,7,36,'change position','--changePos','4','2022-09-12 16:21:54'),(45,21,8,35,'off','--off',NULL,'2022-09-12 16:21:55'),(46,22,1,38,'set temp. and run','--setrun','50','2022-09-12 16:45:05'),(47,23,1,40,'set temp. and run','--setrun','40','2022-09-13 12:52:34'),(48,23,2,39,'waiting','wait','6','2022-09-13 12:52:40'),(49,24,1,42,'set temp. and run','--setrun','50','2022-09-13 13:11:39'),(50,24,2,41,'waiting','wait','6','2022-09-13 13:11:45'),(51,24,3,42,'wait for steady-sate','--judge','2821','2022-09-13 13:58:47'),(52,24,4,41,'waiting','wait','10','2022-09-13 13:58:57'),(53,24,5,42,'off','--off',NULL,'2022-09-13 13:58:58'),(54,25,1,45,'change position','--changePos','4','2022-09-13 15:01:49'),(55,25,2,44,'set infusion rate','--irate','1 mL/min','2022-09-13 15:01:49'),(56,25,3,44,'infusion run','--irun',NULL,'2022-09-13 15:01:49'),(57,26,1,48,'change position','--changePos','4','2022-09-13 15:02:21'),(58,26,2,47,'set infusion rate','--irate','1 mL/min','2022-09-13 15:02:22'),(59,26,3,47,'infusion run','--irun',NULL,'2022-09-13 15:02:22'),(60,26,4,46,'waiting','wait','15','2022-09-13 15:02:37'),(61,26,5,48,'change position','--changePos','6','2022-09-13 15:02:38'),(62,26,6,46,'waiting','wait','15','2022-09-13 15:02:53'),(63,26,7,48,'change position','--changePos','4','2022-09-13 15:02:53'),(64,26,8,47,'off','--off',NULL,'2022-09-13 15:02:54'),(65,27,1,51,'change position','--changePos','4','2022-09-13 15:22:24'),(66,27,2,50,'set infusion rate','--irate','1 mL/min','2022-09-13 15:22:24'),(67,27,3,50,'infusion run','--irun',NULL,'2022-09-13 15:22:25'),(68,27,4,49,'waiting','wait','15','2022-09-13 15:22:40'),(69,27,5,51,'change position','--changePos','6','2022-09-13 15:22:40'),(70,27,6,49,'waiting','wait','15','2022-09-13 15:22:55'),(71,27,7,51,'change position','--changePos','4','2022-09-13 15:22:56'),(72,27,8,50,'off','--off',NULL,'2022-09-13 15:22:56'),(73,30,1,57,'set temp. and run','--setrun','49.3','2022-09-13 17:35:09'),(74,30,2,56,'waiting','wait','6','2022-09-13 17:35:15'),(75,31,1,59,'set temp. and run','--setrun','49.3','2022-09-13 17:40:29'),(76,31,2,58,'waiting','wait','6','2022-09-13 17:40:35'),(77,32,1,61,'set temp. and run','--setrun','56.3','2022-09-13 17:49:54'),(78,32,2,60,'waiting','wait','6','2022-09-13 17:50:00'),(79,33,1,63,'set temp. and run','--setrun','57','2022-09-13 18:07:50'),(80,33,2,62,'waiting','wait','6','2022-09-13 18:07:56'),(81,34,1,65,'set temp. and run','--setrun','57','2022-09-13 18:09:27'),(82,34,2,64,'waiting','wait','6','2022-09-13 18:09:33'),(83,35,1,67,'set temp. and run','--setrun','57','2022-09-13 18:16:43'),(84,35,2,66,'waiting','wait','6','2022-09-13 18:16:49'),(85,37,1,71,'set temp. and run','--setrun','57','2022-09-13 18:18:30'),(86,37,2,70,'waiting','wait','6','2022-09-13 18:18:36'),(87,38,1,73,'set temp. and run','--setrun','57','2022-09-13 18:19:29'),(88,38,2,72,'waiting','wait','6','2022-09-13 18:19:35'),(89,39,1,75,'set temp. and run','--setrun','57','2022-09-13 18:28:25'),(90,39,2,74,'waiting','wait','6','2022-09-13 18:28:31'),(91,40,1,77,'set temp. and run','--setrun','57','2022-09-13 18:32:48'),(92,40,2,76,'waiting','wait','6','2022-09-13 18:32:54'),(93,41,1,79,'set temp. and run','--setrun','60','2022-09-13 18:36:35'),(94,41,2,78,'waiting','wait','6','2022-09-13 18:36:41'),(95,41,3,79,'wait for steady-sate','--judge','826','2022-09-13 18:50:28'),(96,41,4,78,'waiting','wait','10','2022-09-13 18:50:38'),(97,41,5,79,'off','--off',NULL,'2022-09-13 18:50:39'),(98,42,1,81,'set infusion rate','--irate','0.1 mL/min','2022-09-14 10:29:51'),(99,42,2,81,'infusion run','--irun',NULL,'2022-09-14 10:29:52'),(100,42,3,82,'set temp. and run','--setrun','30','2022-09-14 10:29:53'),(101,42,4,82,'wait for steady-sate','--judge','803','2022-09-14 10:43:17'),(102,42,5,81,'set infusion rate','--irate','1 mL/min','2022-09-14 10:43:17'),(103,42,6,80,'waiting','wait','600','2022-09-14 10:53:17'),(104,43,1,81,'set infusion rate','--irate','0.1 mL/min','2022-09-14 10:53:18'),(105,43,2,81,'infusion run','--irun',NULL,'2022-09-14 10:53:18'),(106,43,3,82,'set temp. and run','--setrun','40','2022-09-14 10:53:19'),(107,43,4,82,'wait for steady-sate','--judge','1081','2022-09-14 11:11:21'),(108,43,5,81,'set infusion rate','--irate','1 mL/min','2022-09-14 11:11:21'),(109,43,6,80,'waiting','wait','600','2022-09-14 11:21:21'),(110,44,1,81,'set infusion rate','--irate','0.1 mL/min','2022-09-14 11:21:22'),(111,44,2,81,'infusion run','--irun',NULL,'2022-09-14 11:21:22'),(112,44,3,82,'set temp. and run','--setrun','50','2022-09-14 11:21:23'),(113,44,4,82,'wait for steady-sate','--judge','1138','2022-09-14 11:40:22'),(114,44,5,81,'set infusion rate','--irate','1 mL/min','2022-09-14 11:40:22'),(115,44,6,80,'waiting','wait','600','2022-09-14 11:50:22'),(116,45,1,81,'off','--off',NULL,'2022-09-14 11:50:23'),(117,45,2,82,'off','--off',NULL,'2022-09-14 11:50:23'),(118,46,1,84,'set infusion rate and run','--iraterun','1 mL/min','2022-09-14 12:56:03'),(119,46,2,83,'waiting','wait','5','2022-09-14 12:56:08'),(120,46,3,84,'off','--off',NULL,'2022-09-14 12:56:09'),(121,47,1,86,'set infusion rate and run','--iraterun','1 mL/min','2022-09-14 12:57:41'),(122,47,2,85,'waiting','wait','5','2022-09-14 12:57:46'),(123,47,3,86,'off','--off',NULL,'2022-09-14 12:57:47'),(124,48,1,88,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-14 13:02:36'),(125,48,3,89,'set temp. and run','--setrun','30','2022-09-14 13:02:37'),(126,48,3,89,'set temp. and run','--setrun','30','2022-09-14 13:02:41'),(127,52,1,91,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-14 13:34:48'),(128,52,3,92,'set temp. and run','--setrun','30','2022-09-14 13:34:49'),(129,52,4,92,'wait for steady-sate','--judge','799','2022-09-14 13:48:08'),(130,52,5,91,'set infusion rate and run','--iraterun','1 mL/min','2022-09-14 13:48:09'),(131,52,6,90,'waiting','wait','600','2022-09-14 13:58:09'),(132,53,1,91,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-14 13:58:10'),(133,53,3,92,'set temp. and run','--setrun','40','2022-09-14 13:58:11'),(134,53,4,92,'wait for steady-sate','--judge','1107','2022-09-14 14:16:38'),(135,53,5,91,'set infusion rate and run','--iraterun','1 mL/min','2022-09-14 14:16:39'),(136,53,6,90,'waiting','wait','600','2022-09-14 14:26:39'),(137,54,1,91,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-14 14:26:39'),(138,54,3,92,'set temp. and run','--setrun','50','2022-09-14 14:26:40'),(139,54,4,92,'wait for steady-sate','--judge','1145','2022-09-14 14:45:46'),(140,54,5,91,'set infusion rate and run','--iraterun','1 mL/min','2022-09-14 14:45:46'),(141,56,1,94,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-14 15:15:31'),(142,56,2,95,'set temp. and run','--setrun','50','2022-09-14 15:15:32'),(143,56,3,95,'wait for steady-sate','--judge','823','2022-09-14 15:29:16'),(144,56,4,94,'set infusion rate and run','--iraterun','1 mL/min','2022-09-14 15:29:16'),(145,56,5,93,'waiting','wait','600','2022-09-14 15:39:16'),(146,56,6,94,'off','--off',NULL,'2022-09-14 15:39:17'),(147,56,7,95,'off','--off',NULL,'2022-09-14 15:39:17'),(148,57,1,97,'change position','--changePos','1','2022-09-15 12:28:17'),(149,57,2,98,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-15 12:28:18'),(150,57,3,99,'set temp. and run','--setrun','60','2022-09-15 12:28:19'),(151,62,1,101,'change position','--changePos','1','2022-09-15 12:30:11'),(152,62,2,102,'set infusion rate and run','--iraterun','0.1 mL/min','2022-09-15 12:30:12'),(153,62,3,103,'set temp. and run','--setrun','60','2022-09-15 12:30:13'),(154,62,4,103,'wait for steady-sate','--judge','2411','2022-09-15 13:10:24'),(155,62,5,102,'set infusion rate and run','--iraterun','1 mL/min','2022-09-15 13:10:25'),(156,63,1,101,'change position','--changePos','2','2022-09-15 13:10:25'),(157,63,2,100,'waiting','wait','780','2022-09-15 13:23:25'),(158,64,1,101,'change position','--changePos','4','2022-09-15 13:23:26'),(159,64,2,100,'waiting','wait','780','2022-09-15 13:36:26'),(160,65,1,101,'change position','--changePos','6','2022-09-15 13:36:26'),(161,65,2,100,'waiting','wait','780','2022-09-15 13:49:26'),(162,66,1,102,'off','--off',NULL,'2022-09-15 13:49:27'),(163,66,2,103,'off','--off',NULL,'2022-09-15 13:49:27'),(164,66,3,101,'change position','--changePos','1','2022-09-15 13:49:28'),(165,67,1,105,'change position','--changePos','1','2022-09-15 14:05:32'),(166,67,2,106,'set infusion rate and run','--iraterun','1 mL/min','2022-09-15 14:05:33'),(167,67,3,104,'waiting','wait','15','2022-09-15 14:05:48'),(168,67,4,105,'change position','--changePos','2','2022-09-15 14:05:48'),(169,67,5,104,'waiting','wait','600','2022-09-15 14:15:48'),(170,67,6,105,'change position','--changePos','4','2022-09-15 14:15:49'),(171,67,7,104,'waiting','wait','600','2022-09-15 14:25:49'),(172,67,8,105,'change position','--changePos','6','2022-09-15 14:25:49'),(173,67,9,104,'waiting','wait','600','2022-09-15 14:35:49'),(174,67,10,105,'change position','--changePos','1','2022-09-15 14:35:50'),(175,67,11,106,'off','--off',NULL,'2022-09-15 14:35:50');
/*!40000 ALTER TABLE `result_procedure_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_procedures`
--

DROP TABLE IF EXISTS `result_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `result_procedure_order` int(11) NOT NULL,
  `result_procedure_title` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedures`
--

LOCK TABLES `result_procedures` WRITE;
/*!40000 ALTER TABLE `result_procedures` DISABLE KEYS */;
INSERT INTO `result_procedures` VALUES (1,1,1,'a','2022-08-22 09:12:56'),(2,2,1,'b','2022-08-22 09:14:48'),(3,3,1,'b','2022-08-22 09:15:27'),(4,4,1,'b','2022-08-22 09:16:26'),(5,5,1,'a','2022-08-22 09:16:47'),(6,6,1,'a','2022-08-22 23:22:30'),(7,6,2,'b','2022-08-22 23:22:30'),(8,7,1,'b','2022-09-08 20:18:29'),(9,8,1,'b','2022-09-08 20:21:44'),(10,9,1,'b','2022-09-08 20:24:12'),(11,10,1,'a','2022-09-08 20:35:28'),(12,10,2,'b','2022-09-08 20:35:28'),(13,11,1,'a','2022-09-08 20:42:32'),(14,12,1,'a','2022-09-09 11:50:42'),(15,13,1,'a','2022-09-12 12:10:27'),(16,14,1,'a','2022-09-12 12:11:44'),(17,15,1,'a','2022-09-12 14:32:35'),(18,16,1,'a','2022-09-12 14:38:03'),(19,17,1,'a','2022-09-12 14:44:56'),(20,18,1,'run','2022-09-12 15:52:03'),(21,19,1,'run','2022-09-12 16:05:12'),(22,20,1,'a','2022-09-12 16:45:04'),(23,21,1,'a','2022-09-13 12:52:33'),(24,22,1,'a','2022-09-13 13:11:37'),(25,23,1,'run','2022-09-13 15:01:48'),(26,24,1,'run','2022-09-13 15:02:21'),(27,25,1,'run','2022-09-13 15:22:23'),(28,26,1,'a','2022-09-13 17:26:08'),(29,27,1,'a','2022-09-13 17:30:26'),(30,28,1,'a','2022-09-13 17:35:08'),(31,29,1,'a','2022-09-13 17:40:28'),(32,30,1,'a','2022-09-13 17:49:53'),(33,31,1,'a','2022-09-13 18:07:49'),(34,32,1,'a','2022-09-13 18:09:26'),(35,33,1,'a','2022-09-13 18:16:42'),(36,34,1,'a','2022-09-13 18:17:40'),(37,35,1,'a','2022-09-13 18:18:29'),(38,36,1,'a','2022-09-13 18:19:28'),(39,37,1,'a','2022-09-13 18:28:24'),(40,38,1,'a','2022-09-13 18:32:47'),(41,39,1,'a','2022-09-13 18:36:34'),(42,40,1,'measure 30','2022-09-14 10:29:51'),(43,40,2,'measure 40','2022-09-14 10:29:51'),(44,40,3,'measure 50','2022-09-14 10:29:51'),(45,40,4,'shutdown','2022-09-14 10:29:51'),(46,41,1,'a','2022-09-14 12:56:03'),(47,42,1,'a','2022-09-14 12:57:40'),(48,43,1,'measure 30','2022-09-14 13:02:35'),(49,43,2,'measure 40','2022-09-14 13:02:35'),(50,43,3,'measure 50','2022-09-14 13:02:35'),(51,43,4,'shutdown','2022-09-14 13:02:35'),(52,44,1,'measure 30','2022-09-14 13:34:47'),(53,44,2,'measure 40','2022-09-14 13:34:47'),(54,44,3,'measure 50','2022-09-14 13:34:47'),(55,44,4,'shutdown','2022-09-14 13:34:47'),(56,45,1,'flow rxn','2022-09-14 15:15:30'),(57,46,1,'setup','2022-09-15 12:28:17'),(58,46,2,'measure','2022-09-15 12:28:17'),(59,46,3,'measure','2022-09-15 12:28:17'),(60,46,4,'measure','2022-09-15 12:28:17'),(61,46,5,'shutdown','2022-09-15 12:28:17'),(62,47,1,'setup','2022-09-15 12:30:11'),(63,47,2,'measure','2022-09-15 12:30:11'),(64,47,3,'measure','2022-09-15 12:30:11'),(65,47,4,'measure','2022-09-15 12:30:11'),(66,47,5,'shutdown','2022-09-15 12:30:11'),(67,48,1,'wash','2022-09-15 14:05:32');
/*!40000 ALTER TABLE `result_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_title` varchar(200) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
INSERT INTO `runs` VALUES (1,'a',NULL,'2022-08-22 09:12:56'),(2,'b',NULL,'2022-08-22 09:14:48'),(3,'b',NULL,'2022-08-22 09:15:27'),(4,'b',NULL,'2022-08-22 09:16:26'),(5,'a',NULL,'2022-08-22 09:16:47'),(6,'a',NULL,'2022-08-22 23:22:30'),(7,'b',NULL,'2022-09-08 20:18:29'),(8,'b',NULL,'2022-09-08 20:21:44'),(9,'b',NULL,'2022-09-08 20:24:12'),(10,'a',NULL,'2022-09-08 20:35:28'),(11,'c',NULL,'2022-09-08 20:42:32'),(12,'c',NULL,'2022-09-09 11:50:42'),(13,'e',NULL,'2022-09-12 12:10:27'),(14,'e',NULL,'2022-09-12 12:11:44'),(15,'f',NULL,'2022-09-12 14:32:35'),(16,'f',NULL,'2022-09-12 14:38:03'),(17,'f',NULL,'2022-09-12 14:44:56'),(18,'syringe',NULL,'2022-09-12 15:52:03'),(19,'syringe',NULL,'2022-09-12 16:05:12'),(20,'temp',NULL,'2022-09-12 16:45:04'),(21,'f',NULL,'2022-09-13 12:52:33'),(22,'f',NULL,'2022-09-13 13:11:37'),(23,'syringe',NULL,'2022-09-13 15:01:48'),(24,'syringe',NULL,'2022-09-13 15:02:21'),(25,'syringe',NULL,'2022-09-13 15:22:23'),(26,'f',NULL,'2022-09-13 17:26:08'),(27,'f',NULL,'2022-09-13 17:30:26'),(28,'f',NULL,'2022-09-13 17:35:08'),(29,'f',NULL,'2022-09-13 17:40:28'),(30,'f',NULL,'2022-09-13 17:49:53'),(31,'f',NULL,'2022-09-13 18:07:49'),(32,'f',NULL,'2022-09-13 18:09:26'),(33,'f',NULL,'2022-09-13 18:16:42'),(34,'f',NULL,'2022-09-13 18:17:40'),(35,'f',NULL,'2022-09-13 18:18:29'),(36,'f',NULL,'2022-09-13 18:19:28'),(37,'f',NULL,'2022-09-13 18:28:24'),(38,'f',NULL,'2022-09-13 18:32:47'),(39,'f',NULL,'2022-09-13 18:36:34'),(40,'flow suzuki','テストプレイ','2022-09-14 10:29:51'),(41,'aa',NULL,'2022-09-14 12:56:03'),(42,'aa',NULL,'2022-09-14 12:57:40'),(43,'flow suzuki',NULL,'2022-09-14 13:02:35'),(44,'flow suzuki',NULL,'2022-09-14 13:34:47'),(45,'flow suzuki single',NULL,'2022-09-14 15:15:30'),(46,'flow suzuki multi',NULL,'2022-09-15 12:28:17'),(47,'flow suzuki multi',NULL,'2022-09-15 12:30:11'),(48,'senjo multi',NULL,'2022-09-15 14:05:32');
/*!40000 ALTER TABLE `runs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16 10:23:02
