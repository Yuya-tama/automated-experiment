-- MySQL dump 10.13  Distrib 8.0.27, for macos12.0 (arm64)
--
-- Host: localhost    Database: 0821test
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
  `action` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `argument` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `detail_number` int NOT NULL DEFAULT '0',
  `is_result_flag` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'on','--on',0,0,NULL,NULL),(2,'get the value','--get',0,1,NULL,NULL),(3,'off','--off',0,0,NULL,NULL),(4,'waiting','wait',1,0,NULL,NULL),(5,'set infusion rate','--irate',2,0,NULL,NULL),(6,'set withdraw rate','--wrate',2,0,NULL,NULL),(7,'infusion run','--irun',0,0,NULL,NULL),(8,'withdraw run','--wrun',0,0,NULL,NULL),(9,'change position','--changePos',1,0,NULL,NULL),(10,'wait for steady-sate','--judge',0,0,NULL,NULL),(11,'set temp. and run','--setrun',1,0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type_action_links`
--

LOCK TABLES `device_type_action_links` WRITE;
/*!40000 ALTER TABLE `device_type_action_links` DISABLE KEYS */;
INSERT INTO `device_type_action_links` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL),(8,1,8,NULL,NULL),(10,2,3,NULL,NULL),(11,2,5,NULL,NULL),(12,2,6,NULL,NULL),(13,2,7,NULL,NULL),(14,2,8,NULL,NULL),(15,3,9,NULL,NULL),(16,4,1,NULL,NULL),(17,4,2,NULL,NULL),(18,4,3,NULL,NULL),(19,1,10,NULL,NULL),(20,5,2,NULL,NULL),(21,5,3,NULL,NULL),(22,6,4,NULL,NULL),(23,1,9,NULL,NULL),(24,5,10,NULL,NULL),(25,5,11,NULL,NULL),(26,1,11,NULL,NULL);
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
  `device_type_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `unit` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `device_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `device_type_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'-',6,'2022-08-22 09:11:00',NULL),(2,1,'a',1,'2022-08-22 09:11:18',NULL),(3,2,'-',6,'2022-08-22 09:14:19',NULL),(4,2,'b',1,'2022-08-22 09:14:37',NULL);
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
  `condition_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `device_link_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_conditions`
--

LOCK TABLES `experiment_conditions` WRITE;
/*!40000 ALTER TABLE `experiment_conditions` DISABLE KEYS */;
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
  `detail` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedure_blocks`
--

LOCK TABLES `experiment_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `experiment_procedure_blocks` DISABLE KEYS */;
INSERT INTO `experiment_procedure_blocks` VALUES (1,1,1,2,1,NULL,NULL,'2022-08-22 09:11:18',NULL),(2,1,2,1,4,'1',NULL,'2022-08-22 09:11:23',NULL),(3,2,1,4,1,NULL,NULL,'2022-08-22 09:14:37',NULL);
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
  `experiment_procedure_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedures`
--

LOCK TABLES `experiment_procedures` WRITE;
/*!40000 ALTER TABLE `experiment_procedures` DISABLE KEYS */;
INSERT INTO `experiment_procedures` VALUES (1,1,1,'a','2022-08-22 09:11:08',NULL),(2,2,1,'b','2022-08-22 09:14:30',NULL),(3,1,2,'b','2022-08-22 23:22:23',NULL);
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
  `experiment_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_titles`
--

LOCK TABLES `experiment_titles` WRITE;
/*!40000 ALTER TABLE `experiment_titles` DISABLE KEYS */;
INSERT INTO `experiment_titles` VALUES (1,'a','2022-08-22 09:11:00',NULL),(2,'b','2022-08-22 09:14:19',NULL);
/*!40000 ALTER TABLE `experiment_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_conditions`
--

DROP TABLE IF EXISTS `result_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_procedure_id` int NOT NULL,
  `condition_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_conditions`
--

LOCK TABLES `result_conditions` WRITE;
/*!40000 ALTER TABLE `result_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_data`
--

DROP TABLE IF EXISTS `result_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `run_id` int NOT NULL,
  `result_block_id` int NOT NULL,
  `data` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `run_id` int NOT NULL,
  `device_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `result_device_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NoName',
  `result_device_model` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `result_device_company` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `result_device_serialnumber` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_devices`
--

LOCK TABLES `result_devices` WRITE;
/*!40000 ALTER TABLE `result_devices` DISABLE KEYS */;
INSERT INTO `result_devices` VALUES (1,1,'-','-',NULL,NULL,NULL,'2022-08-22 09:12:56'),(2,1,'a','test2','test','test','1234','2022-08-22 09:12:56'),(3,2,'b','test2','test','test','1234','2022-08-22 09:14:48'),(4,3,'b','test2','test','test','1234','2022-08-22 09:15:27'),(5,4,'b','test2','test','test','1234','2022-08-22 09:16:26'),(6,5,'-','-',NULL,NULL,NULL,'2022-08-22 09:16:47'),(7,5,'a','test2','test','test','1234','2022-08-22 09:16:47'),(8,6,'-','-',NULL,NULL,NULL,'2022-08-22 23:22:30'),(9,6,'a','test2','test','test','1234','2022-08-22 23:22:30');
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
  `result_device_id` int NOT NULL,
  `action_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_argument` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `detail` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedure_blocks`
--

LOCK TABLES `result_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `result_procedure_blocks` DISABLE KEYS */;
INSERT INTO `result_procedure_blocks` VALUES (1,4,1,5,'on','--on',NULL,'2022-08-22 09:16:26'),(2,5,1,7,'on','--on',NULL,'2022-08-22 09:16:47'),(3,5,2,6,'waiting','wait','1','2022-08-22 09:16:48'),(4,6,1,9,'on','--on',NULL,'2022-08-22 23:22:31'),(5,6,2,8,'waiting','wait','1','2022-08-22 23:22:32');
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
  `result_procedure_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedures`
--

LOCK TABLES `result_procedures` WRITE;
/*!40000 ALTER TABLE `result_procedures` DISABLE KEYS */;
INSERT INTO `result_procedures` VALUES (1,1,1,'a','2022-08-22 09:12:56'),(2,2,1,'b','2022-08-22 09:14:48'),(3,3,1,'b','2022-08-22 09:15:27'),(4,4,1,'b','2022-08-22 09:16:26'),(5,5,1,'a','2022-08-22 09:16:47'),(6,6,1,'a','2022-08-22 23:22:30'),(7,6,2,'b','2022-08-22 23:22:30');
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
  `result_title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
INSERT INTO `runs` VALUES (1,'a',NULL,'2022-08-22 09:12:56'),(2,'b',NULL,'2022-08-22 09:14:48'),(3,'b',NULL,'2022-08-22 09:15:27'),(4,'b',NULL,'2022-08-22 09:16:26'),(5,'a',NULL,'2022-08-22 09:16:47'),(6,'a',NULL,'2022-08-22 23:22:30');
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

-- Dump completed on 2022-09-06 16:03:23