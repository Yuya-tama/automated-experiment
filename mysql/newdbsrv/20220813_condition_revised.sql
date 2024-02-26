-- MySQL dump 10.13  Distrib 8.0.27, for macos12.0 (arm64)
--
-- Host: localhost    Database: macmini
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `argument` varchar(20) DEFAULT NULL,
  `detail_number` int NOT NULL DEFAULT '0',
  `is_result_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'on','--on',0,0,NULL,NULL),(2,'get the value','--get',0,1,NULL,NULL),(3,'off','--off',0,0,NULL,NULL),(4,'waiting','wait',1,0,NULL,NULL),(5,'set infusion rate','--irate',2,0,NULL,NULL),(6,'set withdraw rate','--wrate',2,0,NULL,NULL),(7,'infusion run','--irun',0,0,NULL,NULL),(8,'withdraw run','--wrun',0,0,NULL,NULL),(9,'change position','--changePos',1,0,NULL,NULL);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type_action_links`
--

DROP TABLE IF EXISTS `device_type_action_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_type_action_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_type_id` int NOT NULL,
  `action_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type_action_links`
--

LOCK TABLES `device_type_action_links` WRITE;
/*!40000 ALTER TABLE `device_type_action_links` DISABLE KEYS */;
INSERT INTO `device_type_action_links` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL),(8,1,8,NULL,NULL),(10,2,3,NULL,NULL),(11,2,5,NULL,NULL),(12,2,6,NULL,NULL),(13,2,7,NULL,NULL),(14,2,8,NULL,NULL),(15,3,9,NULL,NULL),(16,4,1,NULL,NULL),(17,4,2,NULL,NULL),(18,4,3,NULL,NULL),(19,5,1,NULL,NULL),(20,5,2,NULL,NULL),(21,5,3,NULL,NULL),(22,6,4,NULL,NULL),(23,1,9,NULL,NULL);
/*!40000 ALTER TABLE `device_type_action_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_types`
--

DROP TABLE IF EXISTS `device_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_type_name` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_value_choices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_link_id` int NOT NULL,
  `value` int DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `experiment_title_id` int NOT NULL,
  `device_name` varchar(200) NOT NULL,
  `device_type_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'testdevice',1,NULL,NULL),(2,1,'-',6,NULL,NULL),(3,1,'testdevice2',1,NULL,NULL),(4,2,'testdevice',1,NULL,NULL),(9,1,'testvalve',3,NULL,NULL),(10,4,'-',6,'2022-07-15 03:09:10',NULL),(11,4,'tewww',1,'2022-07-15 03:17:37',NULL),(12,3,'1',1,'2022-08-02 23:37:12',NULL),(13,5,'-',6,'2022-08-02 23:37:24',NULL),(14,5,'w',1,'2022-08-02 23:37:39',NULL),(15,6,'-',6,'2022-08-11 02:08:33',NULL),(16,5,'sfdsf',1,'2022-08-11 15:30:18',NULL);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_conditions`
--

DROP TABLE IF EXISTS `experiment_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiment_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `experiment_procedure_id` int NOT NULL,
  `condition_title` varchar(200) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `device_link_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_conditions`
--

LOCK TABLES `experiment_conditions` WRITE;
/*!40000 ALTER TABLE `experiment_conditions` DISABLE KEYS */;
INSERT INTO `experiment_conditions` VALUES (1,2,'温度条件など','100',NULL,NULL,NULL),(2,2,'温度条件などその2','20',NULL,NULL,NULL),(3,100,'ダミーコンディション','20',NULL,NULL,NULL),(4,37,'aa','1','2022-08-09 17:26:17',NULL,NULL),(5,37,'test','3','2022-08-09 17:30:48',NULL,NULL),(6,37,'xc','4','2022-08-09 17:42:10',NULL,NULL),(7,37,'１３４５','1','2022-08-09 17:50:46',NULL,NULL),(8,37,'2345','2','2022-08-11 01:52:52',NULL,NULL),(9,37,'hgjhgfhk','27','2022-08-11 01:53:40',NULL,NULL),(10,39,'ｒｔれ','5','2022-08-11 01:58:37',NULL,NULL),(11,37,'oi','2 mL/min','2022-08-11 15:18:09',NULL,NULL),(12,37,'ぽぽぽぽｐ','2 μL/min','2022-08-11 15:19:55',NULL,NULL);
/*!40000 ALTER TABLE `experiment_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_procedure_blocks`
--

DROP TABLE IF EXISTS `experiment_procedure_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiment_procedure_blocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `experiment_procedure_id` int NOT NULL,
  `experiment_block_order` int NOT NULL,
  `device_id` int NOT NULL,
  `action_id` int NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `condition_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedure_blocks`
--

LOCK TABLES `experiment_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `experiment_procedure_blocks` DISABLE KEYS */;
INSERT INTO `experiment_procedure_blocks` VALUES (2,1,2,2,4,NULL,NULL,NULL,NULL),(4,3,1,1,3,NULL,NULL,NULL,NULL),(9,2,2,1,5,NULL,1,NULL,NULL),(11,100,3,1,5,'ダミーブロック',NULL,NULL,NULL),(12,4,1,4,9,'1',NULL,'2022-07-15 02:19:56',NULL),(13,16,3,1,5,NULL,1,'2022-07-15 02:33:39',NULL),(14,16,4,4,9,'1',NULL,'2022-07-15 02:35:10',NULL),(15,18,1,4,7,NULL,NULL,'2022-07-15 02:40:43',NULL),(16,16,5,4,3,NULL,NULL,'2022-07-15 02:46:34',NULL),(18,26,5,4,3,NULL,NULL,'2022-07-15 02:46:46',NULL),(23,30,5,4,3,NULL,NULL,'2022-07-15 03:02:25',NULL),(24,31,3,1,5,NULL,1,'2022-07-15 03:03:33',NULL),(26,31,5,4,3,NULL,NULL,'2022-07-15 03:03:33',NULL),(27,33,1,10,4,'3',NULL,'2022-07-15 03:10:05',NULL),(28,33,2,10,4,'5',NULL,'2022-07-15 03:10:13',NULL),(29,34,1,10,4,'3',NULL,'2022-07-15 03:10:22',NULL),(30,34,2,10,4,'5',NULL,'2022-07-15 03:10:22',NULL),(31,35,1,10,4,'3',NULL,'2022-07-15 03:10:22',NULL),(32,35,2,10,4,'5',NULL,'2022-07-15 03:10:22',NULL),(33,36,1,11,1,NULL,NULL,'2022-07-15 03:17:37',NULL),(34,32,1,12,2,NULL,NULL,'2022-08-02 23:37:12',NULL),(45,39,4,13,4,'3',NULL,'2022-08-07 20:49:13',NULL),(46,40,1,14,2,NULL,NULL,'2022-08-07 20:49:13',NULL),(47,40,3,13,4,'2',NULL,'2022-08-07 20:49:13',NULL),(48,40,4,13,4,'3',NULL,'2022-08-07 20:49:13',NULL),(49,41,1,14,2,NULL,NULL,'2022-08-07 20:49:13',NULL),(51,41,4,13,4,'3',NULL,'2022-08-07 20:49:13',NULL),(52,42,1,14,2,NULL,NULL,'2022-08-07 20:49:13',NULL),(53,42,3,13,4,'2',NULL,'2022-08-07 20:49:13',NULL),(54,42,4,13,4,'3',NULL,'2022-08-07 20:49:13',NULL),(55,37,5,14,5,'4 mL/min',NULL,'2022-08-08 01:32:30','2022-08-08 04:19:41'),(56,37,6,13,4,'6',NULL,'2022-08-08 04:16:01',NULL),(57,37,7,14,3,NULL,NULL,'2022-08-08 04:16:16',NULL),(58,37,8,14,6,'2 nL/s',NULL,'2022-08-08 04:16:29',NULL),(59,37,9,13,4,NULL,4,'2022-08-09 17:26:17',NULL),(60,37,10,13,4,NULL,5,'2022-08-09 17:30:48',NULL),(61,37,11,13,4,NULL,6,'2022-08-09 17:42:10',NULL),(62,37,12,13,4,NULL,7,'2022-08-09 17:50:46',NULL),(63,37,13,13,4,NULL,8,'2022-08-11 01:52:52',NULL),(64,37,14,13,4,NULL,9,'2022-08-11 01:53:40',NULL),(65,39,5,13,4,NULL,10,'2022-08-11 01:58:37',NULL),(66,37,15,14,5,NULL,11,'2022-08-11 15:18:09',NULL),(67,37,16,14,6,NULL,12,'2022-08-11 15:19:55',NULL),(68,37,17,14,3,NULL,NULL,'2022-08-11 15:22:08',NULL),(69,37,18,13,4,'2',NULL,'2022-08-11 15:25:26',NULL),(70,39,6,13,4,'4',NULL,'2022-08-11 15:27:25',NULL),(71,37,19,16,9,'1',NULL,'2022-08-11 15:30:18',NULL),(72,37,20,16,1,NULL,NULL,'2022-08-11 15:30:36',NULL),(73,40,5,13,4,'3',NULL,'2022-08-11 15:33:59',NULL),(74,37,21,13,4,'1',NULL,'2022-08-11 15:38:57',NULL),(75,37,22,14,3,NULL,NULL,'2022-08-11 15:40:49',NULL);
/*!40000 ALTER TABLE `experiment_procedure_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_procedures`
--

DROP TABLE IF EXISTS `experiment_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiment_procedures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `experiment_title_id` int NOT NULL,
  `experiment_procedure_order` int NOT NULL,
  `experiment_procedure_title` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedures`
--

LOCK TABLES `experiment_procedures` WRITE;
/*!40000 ALTER TABLE `experiment_procedures` DISABLE KEYS */;
INSERT INTO `experiment_procedures` VALUES (1,1,1,'startup',NULL,'2022-07-15 02:19:05'),(2,1,4,'measurment',NULL,'2022-07-15 02:19:05'),(3,1,5,'end',NULL,'2022-07-15 02:19:05'),(6,1,3,'measurment','2022-07-15 02:18:02','2022-07-15 02:19:05'),(7,1,2,'measurment','2022-07-15 02:19:05',NULL),(16,2,7,'うぇうぇ','2022-07-15 02:33:39','2022-07-15 03:03:33'),(25,2,2,'うぇうぇ','2022-07-15 02:46:46','2022-07-15 03:03:33'),(26,2,8,'うぇうぇ','2022-07-15 02:46:46','2022-07-15 03:03:33'),(27,2,1,'うぇうぇ','2022-07-15 02:53:41','2022-07-15 03:03:33'),(28,2,3,'うぇうぇ','2022-07-15 02:54:18','2022-07-15 03:03:33'),(29,2,4,'うぇうぇ','2022-07-15 02:58:16','2022-07-15 03:03:33'),(30,2,5,'うぇうぇ','2022-07-15 03:02:25','2022-07-15 03:03:33'),(31,2,6,'うぇうぇ','2022-07-15 03:03:33',NULL),(32,3,1,'あ','2022-07-15 03:05:02',NULL),(33,4,4,'2132','2022-07-15 03:09:54','2022-07-15 03:10:22'),(34,4,2,'ポケモン','2022-07-15 03:10:22','2022-07-15 03:12:26'),(35,4,3,'hogehoge','2022-07-15 03:10:22','2022-07-15 03:12:38'),(36,4,1,'ｑｗ','2022-07-15 03:17:21',NULL),(37,5,1,'w','2022-08-02 23:37:28','2022-08-07 20:49:13'),(39,5,2,'w','2022-08-07 20:49:13',NULL),(40,5,3,'w','2022-08-07 20:49:13',NULL),(41,5,4,'w','2022-08-07 20:49:13',NULL),(42,5,6,'w','2022-08-07 20:49:13',NULL);
/*!40000 ALTER TABLE `experiment_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_titles`
--

DROP TABLE IF EXISTS `experiment_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiment_titles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `experiment_title` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_titles`
--

LOCK TABLES `experiment_titles` WRITE;
/*!40000 ALTER TABLE `experiment_titles` DISABLE KEYS */;
INSERT INTO `experiment_titles` VALUES (1,'test1',NULL,NULL),(2,'test2',NULL,NULL),(3,'あ',NULL,NULL),(4,'w',NULL,NULL),(5,'rtr',NULL,NULL),(6,'い',NULL,NULL);
/*!40000 ALTER TABLE `experiment_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_devices`
--

DROP TABLE IF EXISTS `result_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `run_id` int NOT NULL,
  `device_id` int NOT NULL,
  `result_device_model` varchar(200) DEFAULT NULL,
  `result_device_company` varchar(200) DEFAULT NULL,
  `result_device_serialnumber` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_devices`
--

LOCK TABLES `result_devices` WRITE;
/*!40000 ALTER TABLE `result_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_procedure_blocks`
--

DROP TABLE IF EXISTS `result_procedure_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_procedure_blocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_procedure_id` int NOT NULL,
  `result_block_order` int NOT NULL,
  `device_id` int NOT NULL,
  `action_id` int NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `result_raw_data` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedure_blocks`
--

LOCK TABLES `result_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `result_procedure_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_procedure_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_procedures`
--

DROP TABLE IF EXISTS `result_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_procedures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `run_id` int NOT NULL,
  `result_procedure_order` int NOT NULL,
  `result_procedure_title` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedures`
--

LOCK TABLES `result_procedures` WRITE;
/*!40000 ALTER TABLE `result_procedures` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `runs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_title` varchar(200) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
INSERT INTO `runs` VALUES (1,'test1',NULL,'2022-06-24 12:59:40'),(2,'test1',NULL,'2022-06-24 13:03:48'),(3,'test1',NULL,'2022-06-24 13:06:43'),(4,'test1',NULL,'2022-06-24 13:07:20'),(5,'test1',NULL,'2022-07-06 12:43:05'),(6,'test1',NULL,'2022-07-06 12:53:54'),(7,'w',NULL,'2022-07-15 03:13:34'),(8,'w',NULL,'2022-07-15 03:17:54'),(9,'w',NULL,'2022-07-15 03:18:50'),(10,'test1',NULL,'2022-08-02 13:02:59'),(11,'test1',NULL,'2022-08-02 13:41:25'),(12,'test1',NULL,'2022-08-02 13:47:45'),(13,'test1',NULL,'2022-08-02 13:48:26'),(14,'test1',NULL,'2022-08-02 13:49:02'),(15,'test1',NULL,'2022-08-02 13:51:32'),(16,'test1',NULL,'2022-08-02 13:53:16'),(17,'test1',NULL,'2022-08-02 13:53:58'),(18,'test1',NULL,'2022-08-02 17:28:33'),(19,'test1',NULL,'2022-08-02 17:29:55'),(20,'test1',NULL,'2022-08-02 17:30:18'),(21,'test1',NULL,'2022-08-02 17:35:14'),(22,'test1',NULL,'2022-08-02 17:35:24'),(23,'test1',NULL,'2022-08-02 17:36:33'),(24,'test1',NULL,'2022-08-02 17:44:11'),(25,'test1',NULL,'2022-08-02 22:54:41'),(26,'test1',NULL,'2022-08-02 22:55:06'),(27,'test1',NULL,'2022-08-02 23:00:57'),(28,'w',NULL,'2022-08-02 23:24:42'),(29,'test1',NULL,'2022-08-02 23:27:19'),(30,'test1',NULL,'2022-08-02 23:30:48'),(31,'w',NULL,'2022-08-02 23:31:03'),(32,'w',NULL,'2022-08-02 23:32:41'),(33,'w',NULL,'2022-08-02 23:34:10'),(34,'w',NULL,'2022-08-02 23:35:26'),(35,'rtr',NULL,'2022-08-02 23:38:07'),(36,'rtr',NULL,'2022-08-02 23:39:01'),(37,'rtr',NULL,'2022-08-02 23:57:53'),(38,'w',NULL,'2022-08-02 23:58:13'),(39,'rtr',NULL,'2022-08-03 00:00:26'),(40,'rtr',NULL,'2022-08-03 00:01:31'),(41,'w',NULL,'2022-08-03 00:03:52'),(42,'w',NULL,'2022-08-03 00:06:15'),(43,'w',NULL,'2022-08-03 00:12:47'),(44,'rtr',NULL,'2022-08-03 00:37:58'),(45,'rtr',NULL,'2022-08-03 00:38:20'),(46,'rtr',NULL,'2022-08-03 00:39:43'),(47,'rtr',NULL,'2022-08-03 00:40:10'),(48,'rtr',NULL,'2022-08-03 00:41:22'),(49,'rtr',NULL,'2022-08-03 00:42:35'),(50,'rtr',NULL,'2022-08-03 00:44:40'),(51,'rtr',NULL,'2022-08-03 00:47:24'),(52,'w',NULL,'2022-08-03 00:51:27'),(53,'w',NULL,'2022-08-03 00:55:16'),(54,'rtr',NULL,'2022-08-03 01:04:28'),(55,'w',NULL,'2022-08-03 01:04:49'),(56,'w',NULL,'2022-08-03 01:17:51'),(57,'w',NULL,'2022-08-03 01:19:16'),(58,'w',NULL,'2022-08-03 01:29:27'),(59,'w',NULL,'2022-08-03 01:37:32'),(60,'w',NULL,'2022-08-03 01:40:58'),(61,'w',NULL,'2022-08-03 01:52:05'),(62,'w',NULL,'2022-08-03 01:55:39'),(63,'w',NULL,'2022-08-03 01:56:13'),(64,'w',NULL,'2022-08-03 02:02:56'),(65,'w',NULL,'2022-08-03 02:09:11'),(66,'w',NULL,'2022-08-03 02:11:52'),(67,'w',NULL,'2022-08-03 02:17:44'),(68,'w',NULL,'2022-08-03 03:58:48'),(69,'w',NULL,'2022-08-03 04:00:01'),(70,'w',NULL,'2022-08-03 04:00:49'),(71,'w',NULL,'2022-08-03 04:08:45'),(72,'w',NULL,'2022-08-03 04:10:12'),(73,'rtr',NULL,'2022-08-03 04:12:26');
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

-- Dump completed on 2022-08-13 18:28:00
