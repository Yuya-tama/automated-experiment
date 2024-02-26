-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: dbserver
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'on','--on',0,0,NULL,NULL),(2,'get the value','--get',0,1,NULL,NULL),(3,'off','--off',0,0,NULL,NULL),(4,'waiting','wait',1,0,NULL,NULL),(5,'set infusion rate and run','--iraterun',2,0,NULL,NULL),(6,'set withdraw rate','--wrate',2,0,NULL,NULL),(7,'infusion run','--irun',0,0,NULL,NULL),(8,'withdraw run','--wrun',0,0,NULL,NULL),(9,'change position','--changePos',1,0,NULL,NULL),(10,'wait for steady-sate','--judge',0,0,NULL,NULL),(11,'set temp. and run','--setrun',1,0,NULL,NULL),(12,'ready and set sampling time','--ready',1,0,NULL,NULL),(13,'sampling','--sample',0,0,NULL,NULL),(14,'alert','alert',1,0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type_action_links`
--

LOCK TABLES `device_type_action_links` WRITE;
/*!40000 ALTER TABLE `device_type_action_links` DISABLE KEYS */;
INSERT INTO `device_type_action_links` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL),(8,1,8,NULL,NULL),(10,2,3,NULL,NULL),(11,2,5,NULL,NULL),(12,2,6,NULL,NULL),(13,2,7,NULL,NULL),(14,2,8,NULL,NULL),(15,3,9,NULL,NULL),(16,4,1,NULL,NULL),(17,4,2,NULL,NULL),(18,4,3,NULL,NULL),(19,5,1,NULL,NULL),(20,5,2,NULL,NULL),(21,5,3,NULL,NULL),(22,6,4,NULL,NULL),(23,1,9,NULL,NULL),(24,5,10,NULL,NULL),(26,5,11,NULL,NULL),(27,1,11,NULL,NULL),(28,7,3,NULL,NULL),(29,7,12,NULL,NULL),(30,7,13,NULL,NULL),(31,6,14,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_types`
--

LOCK TABLES `device_types` WRITE;
/*!40000 ALTER TABLE `device_types` DISABLE KEYS */;
INSERT INTO `device_types` VALUES (1,'testType',NULL,NULL),(2,'syringePump',NULL,NULL),(3,'6-way valve',NULL,NULL),(4,'thermometer',NULL,NULL),(5,'temperature controller',NULL,NULL),(6,'No device',NULL,NULL),(7,'fraction collector',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'-',6,'2023-05-15 11:48:14',NULL),(2,1,'pumpA',2,'2023-05-15 11:49:12',NULL),(3,1,'sample',7,'2023-05-15 13:28:32',NULL),(4,2,'-',6,'2023-05-15 13:28:59',NULL),(5,2,'tempcontroller',5,'2023-05-15 13:29:50',NULL),(6,2,'pumpA',2,'2023-05-15 13:30:33',NULL),(7,2,'sampling',7,'2023-05-15 13:31:57',NULL),(8,3,'-',6,'2023-05-15 14:07:15',NULL),(9,3,'sampling',7,'2023-05-15 14:08:03',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_conditions`
--

LOCK TABLES `experiment_conditions` WRITE;
/*!40000 ALTER TABLE `experiment_conditions` DISABLE KEYS */;
INSERT INTO `experiment_conditions` VALUES (1,1,'flow rate of cleaning solution','314 μL/min','2023-05-15 11:49:12','2023-05-15 13:27:23',11),(2,1,'set sampling time','11','2023-05-15 13:28:32',NULL,29),(3,2,'set temp','25','2023-05-15 13:29:50',NULL,26),(4,2,'flow rate of reagent','314 μL/min','2023-05-15 13:30:33',NULL,11),(5,2,'waiting for tube long','282','2023-05-15 13:31:05',NULL,22),(6,3,'residence time','240','2023-05-15 13:32:58',NULL,22),(7,4,'residence time','240','2023-05-15 13:33:49',NULL,22),(8,5,'residence time','240','2023-05-15 13:33:49',NULL,22),(9,6,'residence time','240','2023-05-15 13:33:49',NULL,22),(10,7,'residence time','240','2023-05-15 13:33:49',NULL,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedure_blocks`
--

LOCK TABLES `experiment_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `experiment_procedure_blocks` DISABLE KEYS */;
INSERT INTO `experiment_procedure_blocks` VALUES (1,1,1,2,5,NULL,1,'2023-05-15 11:49:12',NULL),(2,1,2,1,4,'669',NULL,'2023-05-15 11:49:24','2023-05-15 13:27:49'),(3,1,3,3,12,NULL,2,'2023-05-15 13:28:32',NULL),(4,1,4,3,13,NULL,NULL,'2023-05-15 13:28:41',NULL),(5,2,1,5,11,NULL,3,'2023-05-15 13:29:50',NULL),(6,2,2,5,10,NULL,NULL,'2023-05-15 13:29:58',NULL),(7,2,3,6,5,NULL,4,'2023-05-15 13:30:33',NULL),(8,2,4,4,4,NULL,5,'2023-05-15 13:31:05',NULL),(9,3,2,7,13,NULL,NULL,'2023-05-15 13:31:57',NULL),(10,3,1,4,4,NULL,6,'2023-05-15 13:32:58',NULL),(11,4,2,7,13,NULL,NULL,'2023-05-15 13:33:49',NULL),(12,4,1,4,4,NULL,7,'2023-05-15 13:33:49',NULL),(13,5,2,7,13,NULL,NULL,'2023-05-15 13:33:49',NULL),(14,5,1,4,4,NULL,8,'2023-05-15 13:33:49',NULL),(15,6,2,7,13,NULL,NULL,'2023-05-15 13:33:49',NULL),(16,6,1,4,4,NULL,9,'2023-05-15 13:33:49',NULL),(17,7,2,7,13,NULL,NULL,'2023-05-15 13:33:49',NULL),(18,7,1,4,4,NULL,10,'2023-05-15 13:33:49',NULL),(20,8,2,9,13,NULL,NULL,'2023-05-15 14:08:13',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_procedures`
--

LOCK TABLES `experiment_procedures` WRITE;
/*!40000 ALTER TABLE `experiment_procedures` DISABLE KEYS */;
INSERT INTO `experiment_procedures` VALUES (1,1,1,'cleaning','2023-05-15 11:48:26',NULL),(2,2,1,'setting','2023-05-15 13:29:12','2023-05-15 13:33:50'),(3,2,2,'sampling','2023-05-15 13:31:24','2023-05-15 13:33:50'),(4,2,3,'sampling','2023-05-15 13:33:49','2023-05-15 13:33:50'),(5,2,4,'sampling','2023-05-15 13:33:49','2023-05-15 13:33:50'),(6,2,5,'sampling','2023-05-15 13:33:49','2023-05-15 13:33:50'),(7,2,6,'sampling','2023-05-15 13:33:49','2023-05-15 13:33:50'),(8,3,1,'sampling','2023-05-15 14:07:26',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_titles`
--

LOCK TABLES `experiment_titles` WRITE;
/*!40000 ALTER TABLE `experiment_titles` DISABLE KEYS */;
INSERT INTO `experiment_titles` VALUES (1,'cleaning','2023-05-15 11:48:14',NULL),(2,'kyuudai_flow','2023-05-15 13:28:59',NULL),(3,'sampling','2023-05-15 14:07:15',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_conditions`
--

LOCK TABLES `result_conditions` WRITE;
/*!40000 ALTER TABLE `result_conditions` DISABLE KEYS */;
INSERT INTO `result_conditions` VALUES (1,1,'flow rate of cleaning solution','1 mL/min','2023-05-15 11:49:38'),(2,2,'flow rate of cleaning solution','314 μL/min','2023-05-15 13:54:06'),(3,2,'set sampling time','11','2023-05-15 13:54:06'),(4,7,'set temp','25','2023-05-15 14:57:01'),(5,7,'flow rate of reagent','314 μL/min','2023-05-15 14:57:01'),(6,7,'waiting for tube long','282','2023-05-15 14:57:01'),(7,8,'residence time','240','2023-05-15 14:57:01'),(8,9,'residence time','240','2023-05-15 14:57:01'),(9,10,'residence time','240','2023-05-15 14:57:01'),(10,11,'residence time','240','2023-05-15 14:57:01'),(11,12,'residence time','240','2023-05-15 14:57:01'),(12,13,'set temp','25','2023-05-15 15:23:37'),(13,13,'flow rate of reagent','314 μL/min','2023-05-15 15:23:37'),(14,13,'waiting for tube long','282','2023-05-15 15:23:37'),(15,14,'residence time','240','2023-05-15 15:23:37'),(16,15,'residence time','240','2023-05-15 15:23:37'),(17,16,'residence time','240','2023-05-15 15:23:37'),(18,17,'residence time','240','2023-05-15 15:23:37'),(19,18,'residence time','240','2023-05-15 15:23:37'),(20,19,'set temp','25','2023-05-15 15:29:08'),(21,19,'flow rate of reagent','314 μL/min','2023-05-15 15:29:08'),(22,19,'waiting for tube long','282','2023-05-15 15:29:08'),(23,20,'residence time','240','2023-05-15 15:29:08'),(24,21,'residence time','240','2023-05-15 15:29:08'),(25,22,'residence time','240','2023-05-15 15:29:08'),(26,23,'residence time','240','2023-05-15 15:29:08'),(27,24,'residence time','240','2023-05-15 15:29:08');
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
  `data` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_data`
--

LOCK TABLES `result_data` WRITE;
/*!40000 ALTER TABLE `result_data` DISABLE KEYS */;
INSERT INTO `result_data` VALUES (1,1,'null','2023-05-15 11:49:38'),(2,2,'null','2023-05-15 13:54:06'),(3,3,'null','2023-05-15 14:08:28'),(4,4,'null','2023-05-15 14:09:41'),(5,5,'null','2023-05-15 14:10:18'),(6,6,'null','2023-05-15 14:12:00'),(7,7,'null','2023-05-15 14:57:01'),(8,8,'null','2023-05-15 15:23:37'),(9,9,'null','2023-05-15 15:29:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_devices`
--

LOCK TABLES `result_devices` WRITE;
/*!40000 ALTER TABLE `result_devices` DISABLE KEYS */;
INSERT INTO `result_devices` VALUES (1,1,'-','-',NULL,NULL,NULL,'2023-05-15 11:49:38'),(2,1,'pumpA','pump','-','-','-','2023-05-15 11:49:38'),(3,2,'-','-',NULL,NULL,NULL,'2023-05-15 13:54:06'),(4,2,'pumpA','pump','-','-','-','2023-05-15 13:54:06'),(5,2,'sample','fractioncollector','-','-','-','2023-05-15 13:54:06'),(6,3,'sampling','fractioncollector','-','-','-','2023-05-15 14:08:28'),(7,4,'sampling','fractioncollector','-','-','-','2023-05-15 14:09:41'),(8,5,'sampling','fractioncollector','-','-','-','2023-05-15 14:10:18'),(9,6,'sampling','fractioncollector','-','-','-','2023-05-15 14:12:00'),(10,7,'-','-',NULL,NULL,NULL,'2023-05-15 14:57:01'),(11,7,'tempcontroller','tempcontroller','-','-','-','2023-05-15 14:57:01'),(12,7,'pumpA','pump','-','-','-','2023-05-15 14:57:01'),(13,7,'sampling','fractioncollector','-','-','-','2023-05-15 14:57:01'),(14,8,'-','-',NULL,NULL,NULL,'2023-05-15 15:23:37'),(15,8,'tempcontroller','tempcontroller','-','-','-','2023-05-15 15:23:37'),(16,8,'pumpA','pump','-','-','-','2023-05-15 15:23:37'),(17,8,'sampling','fractioncollector','-','-','-','2023-05-15 15:23:37'),(18,9,'-','-',NULL,NULL,NULL,'2023-05-15 15:29:08'),(19,9,'tempcontroller','tempcontroller','-','-','-','2023-05-15 15:29:08'),(20,9,'pumpA','pump','-','-','-','2023-05-15 15:29:08'),(21,9,'sampling','fractioncollector','-','-','-','2023-05-15 15:29:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedure_blocks`
--

LOCK TABLES `result_procedure_blocks` WRITE;
/*!40000 ALTER TABLE `result_procedure_blocks` DISABLE KEYS */;
INSERT INTO `result_procedure_blocks` VALUES (1,1,1,2,'set infusion rate and run','--iraterun','1 mL/min','2023-05-15 11:49:38'),(2,1,2,1,'waiting','wait','30','2023-05-15 11:50:08'),(3,2,1,4,'set infusion rate and run','--iraterun','314 μL/min','2023-05-15 13:54:07'),(4,2,2,3,'waiting','wait','669','2023-05-15 14:05:16'),(5,2,3,5,'ready and set sampling time','--ready','11','2023-05-15 14:05:19'),(6,2,4,5,'sampling','--sample',NULL,'2023-05-15 14:05:37'),(7,3,1,6,'ready and set sampling time','--ready','15','2023-05-15 14:08:31'),(8,3,2,6,'sampling','--sample',NULL,'2023-05-15 14:08:53'),(9,4,2,7,'sampling','--sample',NULL,'2023-05-15 14:09:48'),(10,5,2,8,'sampling','--sample',NULL,'2023-05-15 14:10:25'),(11,6,1,9,'ready and set sampling time','--ready','15','2023-05-15 14:12:03'),(12,6,2,9,'sampling','--sample',NULL,'2023-05-15 14:12:25'),(13,7,1,11,'set temp. and run','--setrun','25','2023-05-15 14:57:02'),(14,13,1,15,'set temp. and run','--setrun','25','2023-05-15 15:23:38'),(15,19,1,19,'set temp. and run','--setrun','25','2023-05-15 15:29:09'),(16,19,2,19,'wait for steady-sate','--judge','894','2023-05-15 15:44:04'),(17,19,3,20,'set infusion rate and run','--iraterun','314 μL/min','2023-05-15 15:44:04'),(18,19,4,18,'waiting','wait','282','2023-05-15 15:48:46'),(19,20,1,18,'waiting','wait','240','2023-05-15 15:52:46'),(20,20,2,21,'sampling','--sample',NULL,'2023-05-15 15:52:54'),(21,21,1,18,'waiting','wait','240','2023-05-15 15:56:54'),(22,21,2,21,'sampling','--sample',NULL,'2023-05-15 15:57:01'),(23,22,1,18,'waiting','wait','240','2023-05-15 16:01:01'),(24,22,2,21,'sampling','--sample',NULL,'2023-05-15 16:01:08'),(25,23,1,18,'waiting','wait','240','2023-05-15 16:05:08'),(26,23,2,21,'sampling','--sample',NULL,'2023-05-15 16:05:15'),(27,24,1,18,'waiting','wait','240','2023-05-15 16:09:15'),(28,24,2,21,'sampling','--sample',NULL,'2023-05-15 16:09:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_procedures`
--

LOCK TABLES `result_procedures` WRITE;
/*!40000 ALTER TABLE `result_procedures` DISABLE KEYS */;
INSERT INTO `result_procedures` VALUES (1,1,1,'cleaning','2023-05-15 11:49:38'),(2,2,1,'cleaning','2023-05-15 13:54:06'),(3,3,1,'sampling','2023-05-15 14:08:28'),(4,4,1,'sampling','2023-05-15 14:09:41'),(5,5,1,'sampling','2023-05-15 14:10:18'),(6,6,1,'sampling','2023-05-15 14:12:00'),(7,7,1,'setting','2023-05-15 14:57:01'),(8,7,2,'sampling','2023-05-15 14:57:01'),(9,7,3,'sampling','2023-05-15 14:57:01'),(10,7,4,'sampling','2023-05-15 14:57:01'),(11,7,5,'sampling','2023-05-15 14:57:01'),(12,7,6,'sampling','2023-05-15 14:57:01'),(13,8,1,'setting','2023-05-15 15:23:37'),(14,8,2,'sampling','2023-05-15 15:23:37'),(15,8,3,'sampling','2023-05-15 15:23:37'),(16,8,4,'sampling','2023-05-15 15:23:37'),(17,8,5,'sampling','2023-05-15 15:23:37'),(18,8,6,'sampling','2023-05-15 15:23:37'),(19,9,1,'setting','2023-05-15 15:29:08'),(20,9,2,'sampling','2023-05-15 15:29:08'),(21,9,3,'sampling','2023-05-15 15:29:08'),(22,9,4,'sampling','2023-05-15 15:29:08'),(23,9,5,'sampling','2023-05-15 15:29:08'),(24,9,6,'sampling','2023-05-15 15:29:08');
/*!40000 ALTER TABLE `result_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_time_logs`
--

DROP TABLE IF EXISTS `result_time_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_time_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `result_device_id` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_time_logs`
--

LOCK TABLES `result_time_logs` WRITE;
/*!40000 ALTER TABLE `result_time_logs` DISABLE KEYS */;
INSERT INTO `result_time_logs` VALUES (1,7,11,'22.3','2023-05-15 14:57:08'),(2,7,11,'22.2','2023-05-15 14:57:12'),(3,7,11,'22.2','2023-05-15 14:57:17'),(4,7,11,'22.3','2023-05-15 14:57:23'),(5,7,11,'22.4','2023-05-15 14:57:27'),(6,7,11,'22.6','2023-05-15 14:57:32'),(7,7,11,'22.7','2023-05-15 14:57:37'),(8,7,11,'22.8','2023-05-15 14:57:42'),(9,7,11,'22.9','2023-05-15 14:57:47'),(10,7,11,'23.1','2023-05-15 14:57:52'),(11,7,11,'23.2','2023-05-15 14:57:57'),(12,7,11,'23.3','2023-05-15 14:58:02'),(13,7,11,'23.5','2023-05-15 14:58:07'),(14,7,11,'23.6','2023-05-15 14:58:12'),(15,7,11,'23.7','2023-05-15 14:58:17'),(16,7,11,'23.8','2023-05-15 14:58:22'),(17,7,11,'24','2023-05-15 14:58:27'),(18,7,11,'24.1','2023-05-15 14:58:32'),(19,7,11,'24.2','2023-05-15 14:58:38'),(20,7,11,'24.3','2023-05-15 14:58:42'),(21,7,11,'24.4','2023-05-15 14:58:47'),(22,7,11,'24.5','2023-05-15 14:58:52'),(23,7,11,'24.6','2023-05-15 14:58:57'),(24,7,11,'24.6','2023-05-15 14:59:03'),(25,7,11,'24.7','2023-05-15 14:59:07'),(26,7,11,'24.7','2023-05-15 14:59:12'),(27,7,11,'24.7','2023-05-15 14:59:17'),(28,7,11,'24.8','2023-05-15 14:59:22'),(29,7,11,'24.8','2023-05-15 14:59:28'),(30,7,11,'24.8','2023-05-15 14:59:32'),(31,7,11,'24.8','2023-05-15 14:59:37'),(32,7,11,'24.8','2023-05-15 14:59:42'),(33,7,11,'24.8','2023-05-15 14:59:48'),(34,7,11,'24.8','2023-05-15 14:59:52'),(35,7,11,'24.8','2023-05-15 14:59:57'),(36,7,11,'24.8','2023-05-15 15:00:02'),(37,7,11,'24.8','2023-05-15 15:00:07'),(38,7,11,'24.8','2023-05-15 15:00:12'),(39,7,11,'24.8','2023-05-15 15:00:17'),(40,7,11,'24.9','2023-05-15 15:00:23'),(41,7,11,'24.9','2023-05-15 15:00:28'),(42,7,11,'24.9','2023-05-15 15:00:32'),(43,7,11,'24.9','2023-05-15 15:00:37'),(44,7,11,'24.9','2023-05-15 15:00:42'),(45,7,11,'24.9','2023-05-15 15:00:48'),(46,7,11,'24.9','2023-05-15 15:00:53'),(47,7,11,'24.9','2023-05-15 15:00:57'),(48,7,11,'24.9','2023-05-15 15:01:03'),(49,7,11,'24.9','2023-05-15 15:01:08'),(50,7,11,'24.9','2023-05-15 15:01:12'),(51,7,11,'24.9','2023-05-15 15:01:18'),(52,7,11,'24.9','2023-05-15 15:01:22'),(53,7,11,'24.9','2023-05-15 15:01:27'),(54,7,11,'24.9','2023-05-15 15:01:32'),(55,7,11,'24.9','2023-05-15 15:01:38'),(56,7,11,'24.9','2023-05-15 15:01:42'),(57,7,11,'24.9','2023-05-15 15:01:47'),(58,7,11,'24.9','2023-05-15 15:01:53'),(59,7,11,'24.9','2023-05-15 15:01:57'),(60,7,11,'25','2023-05-15 15:02:03'),(61,7,11,'25','2023-05-15 15:02:08'),(62,7,11,'25','2023-05-15 15:02:12'),(63,7,11,'25','2023-05-15 15:02:18'),(64,7,11,'25','2023-05-15 15:02:22'),(65,7,11,'25','2023-05-15 15:02:28'),(66,7,11,'25','2023-05-15 15:02:33'),(67,7,11,'25','2023-05-15 15:02:38'),(68,7,11,'25','2023-05-15 15:02:43'),(69,7,11,'25','2023-05-15 15:02:47'),(70,7,11,'25','2023-05-15 15:02:53'),(71,7,11,'25','2023-05-15 15:02:57'),(72,7,11,'25','2023-05-15 15:03:03'),(73,7,11,'25','2023-05-15 15:03:08'),(74,7,11,'25','2023-05-15 15:03:13'),(75,7,11,'25','2023-05-15 15:03:18'),(76,7,11,'25','2023-05-15 15:03:23'),(77,7,11,'25','2023-05-15 15:03:28'),(78,7,11,'25','2023-05-15 15:03:32'),(79,7,11,'25','2023-05-15 15:03:38'),(80,7,11,'25','2023-05-15 15:03:42'),(81,7,11,'25.1','2023-05-15 15:03:48'),(82,7,11,'25.1','2023-05-15 15:03:53'),(83,7,11,'25.1','2023-05-15 15:03:58'),(84,7,11,'25.1','2023-05-15 15:04:03'),(85,7,11,'25.2','2023-05-15 15:04:08'),(86,7,11,'25.3','2023-05-15 15:04:13'),(87,7,11,'25.3','2023-05-15 15:04:18'),(88,7,11,'25.4','2023-05-15 15:04:23'),(89,7,11,'25.4','2023-05-15 15:04:28'),(90,7,11,'25.4','2023-05-15 15:04:33'),(91,7,11,'25.4','2023-05-15 15:04:38'),(92,7,11,'25.4','2023-05-15 15:04:43'),(93,7,11,'25.4','2023-05-15 15:04:48'),(94,7,11,'25.4','2023-05-15 15:04:53'),(95,7,11,'25.4','2023-05-15 15:04:58'),(96,7,11,'25.3','2023-05-15 15:05:03'),(97,7,11,'25.4','2023-05-15 15:05:08'),(98,7,11,'25.4','2023-05-15 15:05:13'),(99,7,11,'25.4','2023-05-15 15:05:18'),(100,7,11,'25.4','2023-05-15 15:05:23'),(101,7,11,'25.4','2023-05-15 15:05:28'),(102,7,11,'25.5','2023-05-15 15:05:33'),(103,7,11,'25.5','2023-05-15 15:05:38'),(104,7,11,'25.5','2023-05-15 15:05:43'),(105,7,11,'25.5','2023-05-15 15:05:48'),(106,7,11,'25.5','2023-05-15 15:05:53'),(107,7,11,'25.5','2023-05-15 15:05:58'),(108,7,11,'25.5','2023-05-15 15:06:03'),(109,7,11,'25.5','2023-05-15 15:06:08'),(110,7,11,'25.5','2023-05-15 15:06:13'),(111,7,11,'25.5','2023-05-15 15:06:18'),(112,7,11,'25.5','2023-05-15 15:06:23'),(113,7,11,'25.4','2023-05-15 15:06:28'),(114,7,11,'25.5','2023-05-15 15:06:33'),(115,7,11,'25.5','2023-05-15 15:06:38'),(116,7,11,'25.5','2023-05-15 15:06:43'),(117,7,11,'25.5','2023-05-15 15:06:48'),(118,7,11,'25.5','2023-05-15 15:06:53'),(119,7,11,'25.4','2023-05-15 15:06:58'),(120,7,11,'25.5','2023-05-15 15:07:03'),(121,7,11,'25.5','2023-05-15 15:07:08'),(122,7,11,'25.5','2023-05-15 15:07:13'),(123,7,11,'25.4','2023-05-15 15:07:18'),(124,7,11,'25.4','2023-05-15 15:07:23'),(125,7,11,'25.4','2023-05-15 15:07:28'),(126,7,11,'25.4','2023-05-15 15:07:33'),(127,7,11,'25.4','2023-05-15 15:07:38'),(128,7,11,'25.4','2023-05-15 15:07:43'),(129,7,11,'25.4','2023-05-15 15:07:48'),(130,7,11,'25.4','2023-05-15 15:07:53'),(131,7,11,'25.4','2023-05-15 15:07:58'),(132,7,11,'25.4','2023-05-15 15:08:03'),(133,7,11,'25.4','2023-05-15 15:08:08'),(134,7,11,'25.4','2023-05-15 15:08:13'),(135,7,11,'25.4','2023-05-15 15:08:18'),(136,7,11,'25.4','2023-05-15 15:08:23'),(137,7,11,'25.4','2023-05-15 15:08:28'),(138,7,11,'25.4','2023-05-15 15:08:33'),(139,7,11,'25.4','2023-05-15 15:08:38'),(140,7,11,'25.4','2023-05-15 15:08:43'),(141,7,11,'25.4','2023-05-15 15:08:48'),(142,7,11,'25.4','2023-05-15 15:08:53'),(143,7,11,'25.4','2023-05-15 15:08:58'),(144,7,11,'25.5','2023-05-15 15:09:03'),(145,7,11,'25.4','2023-05-15 15:09:08'),(146,7,11,'25.5','2023-05-15 15:09:13'),(147,7,11,'25.5','2023-05-15 15:09:18'),(148,7,11,'25.4','2023-05-15 15:09:23'),(149,7,11,'25.5','2023-05-15 15:09:28'),(150,7,11,'25.4','2023-05-15 15:09:33'),(151,7,11,'25.4','2023-05-15 15:09:38'),(152,7,11,'25.5','2023-05-15 15:09:43'),(153,7,11,'25.5','2023-05-15 15:09:48'),(154,7,11,'25.5','2023-05-15 15:09:53'),(155,7,11,'25.5','2023-05-15 15:09:58'),(156,7,11,'25.4','2023-05-15 15:10:03'),(157,7,11,'25.4','2023-05-15 15:10:08'),(158,7,11,'25.5','2023-05-15 15:10:13'),(159,7,11,'25.5','2023-05-15 15:10:18'),(160,7,11,'25.4','2023-05-15 15:10:23'),(161,7,11,'25.4','2023-05-15 15:10:28'),(162,7,11,'25.4','2023-05-15 15:10:33'),(163,7,11,'25.4','2023-05-15 15:10:38'),(164,7,11,'25.5','2023-05-15 15:10:43'),(165,7,11,'25.4','2023-05-15 15:10:48'),(166,7,11,'25.4','2023-05-15 15:10:53'),(167,7,11,'25.4','2023-05-15 15:10:58'),(168,7,11,'25.4','2023-05-15 15:11:03'),(169,7,11,'25.4','2023-05-15 15:11:08'),(170,7,11,'25.4','2023-05-15 15:11:13'),(171,7,11,'25.4','2023-05-15 15:11:18'),(172,7,11,'25.4','2023-05-15 15:11:23'),(173,7,11,'25.4','2023-05-15 15:11:28'),(174,7,11,'25.4','2023-05-15 15:11:33'),(175,7,11,'25.4','2023-05-15 15:11:38'),(176,7,11,'25.4','2023-05-15 15:11:43'),(177,7,11,'25.4','2023-05-15 15:11:48'),(178,7,11,'25.4','2023-05-15 15:11:53'),(179,7,11,'25.4','2023-05-15 15:11:58'),(180,7,11,'25.4','2023-05-15 15:12:03'),(181,7,11,'25.4','2023-05-15 15:12:08'),(182,7,11,'25.4','2023-05-15 15:12:13'),(183,7,11,'25.4','2023-05-15 15:12:18'),(184,7,11,'25.4','2023-05-15 15:12:23'),(185,7,11,'25.4','2023-05-15 15:12:28'),(186,7,11,'25.4','2023-05-15 15:12:33'),(187,7,11,'25.4','2023-05-15 15:12:38'),(188,7,11,'25.4','2023-05-15 15:12:43'),(189,7,11,'25.4','2023-05-15 15:12:48'),(190,7,11,'25.4','2023-05-15 15:12:53'),(191,7,11,'25.4','2023-05-15 15:12:58'),(192,7,11,'25.4','2023-05-15 15:13:03'),(193,7,11,'25.4','2023-05-15 15:13:08'),(194,7,11,'25.4','2023-05-15 15:13:13'),(195,7,11,'25.4','2023-05-15 15:13:18'),(196,7,11,'25.4','2023-05-15 15:13:23'),(197,7,11,'25.4','2023-05-15 15:13:28'),(198,7,11,'25.4','2023-05-15 15:13:33'),(199,7,11,'25.4','2023-05-15 15:13:38'),(200,7,11,'25.4','2023-05-15 15:13:43'),(201,7,11,'25.4','2023-05-15 15:13:48'),(202,7,11,'25.4','2023-05-15 15:13:53'),(203,7,11,'25.4','2023-05-15 15:13:58'),(204,7,11,'25.4','2023-05-15 15:14:03'),(205,7,11,'25.4','2023-05-15 15:14:08'),(206,7,11,'25.4','2023-05-15 15:14:13'),(207,7,11,'25.4','2023-05-15 15:14:18'),(208,7,11,'25.4','2023-05-15 15:14:23'),(209,7,11,'25.4','2023-05-15 15:14:28'),(210,7,11,'25.4','2023-05-15 15:14:33'),(211,7,11,'25.4','2023-05-15 15:14:38'),(212,7,11,'25.4','2023-05-15 15:14:43'),(213,7,11,'25.4','2023-05-15 15:14:48'),(214,7,11,'25.4','2023-05-15 15:14:53'),(215,7,11,'25.4','2023-05-15 15:14:58'),(216,8,15,'25.1','2023-05-15 15:23:44'),(217,8,15,'25.1','2023-05-15 15:23:49'),(218,8,15,'25.2','2023-05-15 15:23:54'),(219,8,15,'25.2','2023-05-15 15:23:59'),(220,8,15,'25.2','2023-05-15 15:24:04'),(221,8,15,'25.2','2023-05-15 15:24:09'),(222,8,15,'25.2','2023-05-15 15:24:14'),(223,8,15,'25.2','2023-05-15 15:24:19'),(224,8,15,'25.2','2023-05-15 15:24:24'),(225,8,15,'25.3','2023-05-15 15:24:29'),(226,8,15,'25.3','2023-05-15 15:24:34'),(227,8,15,'25.3','2023-05-15 15:24:39'),(228,8,15,'25.3','2023-05-15 15:24:44'),(229,8,15,'25.3','2023-05-15 15:24:49'),(230,8,15,'25.3','2023-05-15 15:24:54'),(231,8,15,'25.3','2023-05-15 15:24:59'),(232,8,15,'25.3','2023-05-15 15:25:04'),(233,8,15,'25.3','2023-05-15 15:25:09'),(234,8,15,'25.4','2023-05-15 15:25:14'),(235,8,15,'25.4','2023-05-15 15:25:19'),(236,8,15,'25.4','2023-05-15 15:25:24'),(237,8,15,'25.4','2023-05-15 15:25:29'),(238,8,15,'25.4','2023-05-15 15:25:34'),(239,8,15,'25.4','2023-05-15 15:25:39'),(240,8,15,'25.4','2023-05-15 15:25:44'),(241,8,15,'25.4','2023-05-15 15:25:49'),(242,8,15,'25.4','2023-05-15 15:25:54'),(243,8,15,'25.4','2023-05-15 15:25:59'),(244,8,15,'25.4','2023-05-15 15:26:04'),(245,8,15,'25.4','2023-05-15 15:26:09'),(246,8,15,'25.4','2023-05-15 15:26:14'),(247,8,15,'25.5','2023-05-15 15:26:19'),(248,8,15,'25.5','2023-05-15 15:26:24'),(249,8,15,'25.5','2023-05-15 15:26:29'),(250,8,15,'25.5','2023-05-15 15:26:34'),(251,8,15,'25.5','2023-05-15 15:26:39'),(252,8,15,'25.5','2023-05-15 15:26:44'),(253,8,15,'25.5','2023-05-15 15:26:49'),(254,8,15,'25.5','2023-05-15 15:26:54'),(255,8,15,'25.5','2023-05-15 15:26:59'),(256,8,15,'25.5','2023-05-15 15:27:04'),(257,8,15,'25.5','2023-05-15 15:27:09'),(258,8,15,'25.5','2023-05-15 15:27:14'),(259,8,15,'25.5','2023-05-15 15:27:19'),(260,8,15,'25.5','2023-05-15 15:27:24'),(261,8,15,'25.5','2023-05-15 15:27:29'),(262,8,15,'25.5','2023-05-15 15:27:34'),(263,9,19,'23.6','2023-05-15 15:29:15'),(264,9,19,'24.3','2023-05-15 15:29:20'),(265,9,19,'24.6','2023-05-15 15:29:25'),(266,9,19,'24.6','2023-05-15 15:29:30'),(267,9,19,'24.6','2023-05-15 15:29:35'),(268,9,19,'24.6','2023-05-15 15:29:40'),(269,9,19,'24.6','2023-05-15 15:29:45'),(270,9,19,'24.6','2023-05-15 15:29:50'),(271,9,19,'24.6','2023-05-15 15:29:55'),(272,9,19,'24.6','2023-05-15 15:30:00'),(273,9,19,'24.6','2023-05-15 15:30:05'),(274,9,19,'24.6','2023-05-15 15:30:10'),(275,9,19,'24.6','2023-05-15 15:30:15'),(276,9,19,'24.6','2023-05-15 15:30:20'),(277,9,19,'24.6','2023-05-15 15:30:25'),(278,9,19,'24.6','2023-05-15 15:30:30'),(279,9,19,'24.6','2023-05-15 15:30:35'),(280,9,19,'24.6','2023-05-15 15:30:40'),(281,9,19,'24.6','2023-05-15 15:30:45'),(282,9,19,'24.6','2023-05-15 15:30:50'),(283,9,19,'24.6','2023-05-15 15:30:55'),(284,9,19,'24.6','2023-05-15 15:31:00'),(285,9,19,'24.6','2023-05-15 15:31:05'),(286,9,19,'24.6','2023-05-15 15:31:10'),(287,9,19,'24.7','2023-05-15 15:31:15'),(288,9,19,'24.6','2023-05-15 15:31:21'),(289,9,19,'24.7','2023-05-15 15:31:25'),(290,9,19,'24.7','2023-05-15 15:31:30'),(291,9,19,'24.7','2023-05-15 15:31:35'),(292,9,19,'24.7','2023-05-15 15:31:40'),(293,9,19,'24.7','2023-05-15 15:31:45'),(294,9,19,'24.7','2023-05-15 15:31:51'),(295,9,19,'24.7','2023-05-15 15:31:55'),(296,9,19,'24.7','2023-05-15 15:32:00'),(297,9,19,'24.7','2023-05-15 15:32:05'),(298,9,19,'24.7','2023-05-15 15:32:10'),(299,9,19,'24.7','2023-05-15 15:32:15'),(300,9,19,'24.7','2023-05-15 15:32:20'),(301,9,19,'24.7','2023-05-15 15:32:25'),(302,9,19,'24.7','2023-05-15 15:32:30'),(303,9,19,'24.7','2023-05-15 15:32:35'),(304,9,19,'24.7','2023-05-15 15:32:40'),(305,9,19,'24.7','2023-05-15 15:32:45'),(306,9,19,'24.7','2023-05-15 15:32:50'),(307,9,19,'24.7','2023-05-15 15:32:55'),(308,9,19,'24.7','2023-05-15 15:33:00'),(309,9,19,'24.7','2023-05-15 15:33:05'),(310,9,19,'24.7','2023-05-15 15:33:10'),(311,9,19,'24.7','2023-05-15 15:33:15'),(312,9,19,'24.7','2023-05-15 15:33:20'),(313,9,19,'24.7','2023-05-15 15:33:25'),(314,9,19,'24.7','2023-05-15 15:33:30'),(315,9,19,'24.7','2023-05-15 15:33:35'),(316,9,19,'24.7','2023-05-15 15:33:40'),(317,9,19,'24.7','2023-05-15 15:33:45'),(318,9,19,'24.7','2023-05-15 15:33:50'),(319,9,19,'24.7','2023-05-15 15:33:55'),(320,9,19,'24.7','2023-05-15 15:34:00'),(321,9,19,'24.7','2023-05-15 15:34:06'),(322,9,19,'24.7','2023-05-15 15:34:10'),(323,9,19,'24.7','2023-05-15 15:34:15'),(324,9,19,'24.7','2023-05-15 15:34:21'),(325,9,19,'24.8','2023-05-15 15:34:25'),(326,9,19,'24.7','2023-05-15 15:34:30'),(327,9,19,'24.8','2023-05-15 15:34:35'),(328,9,19,'24.8','2023-05-15 15:34:40'),(329,9,19,'24.9','2023-05-15 15:34:45'),(330,9,19,'25','2023-05-15 15:34:51'),(331,9,19,'25.1','2023-05-15 15:34:55'),(332,9,19,'25.2','2023-05-15 15:35:00'),(333,9,19,'25.2','2023-05-15 15:35:06'),(334,9,19,'25.3','2023-05-15 15:35:10'),(335,9,19,'25.3','2023-05-15 15:35:15'),(336,9,19,'25.3','2023-05-15 15:35:20'),(337,9,19,'25.3','2023-05-15 15:35:25'),(338,9,19,'25.3','2023-05-15 15:35:30'),(339,9,19,'25.3','2023-05-15 15:35:35'),(340,9,19,'25.3','2023-05-15 15:35:40'),(341,9,19,'25.3','2023-05-15 15:35:46'),(342,9,19,'25.3','2023-05-15 15:35:50'),(343,9,19,'25.4','2023-05-15 15:35:55'),(344,9,19,'25.3','2023-05-15 15:36:00'),(345,9,19,'25.4','2023-05-15 15:36:05'),(346,9,19,'25.4','2023-05-15 15:36:10'),(347,9,19,'25.4','2023-05-15 15:36:15'),(348,9,19,'25.4','2023-05-15 15:36:20'),(349,9,19,'25.4','2023-05-15 15:36:25'),(350,9,19,'25.4','2023-05-15 15:36:31'),(351,9,19,'25.4','2023-05-15 15:36:35'),(352,9,19,'25.4','2023-05-15 15:36:40'),(353,9,19,'25.4','2023-05-15 15:36:46'),(354,9,19,'25.4','2023-05-15 15:36:50'),(355,9,19,'25.4','2023-05-15 15:36:55'),(356,9,19,'25.4','2023-05-15 15:37:01'),(357,9,19,'25.4','2023-05-15 15:37:05'),(358,9,19,'25.4','2023-05-15 15:37:10'),(359,9,19,'25.4','2023-05-15 15:37:15'),(360,9,19,'25.4','2023-05-15 15:37:21'),(361,9,19,'25.4','2023-05-15 15:37:25'),(362,9,19,'25.3','2023-05-15 15:37:30'),(363,9,19,'25.3','2023-05-15 15:37:35'),(364,9,19,'25.4','2023-05-15 15:37:40'),(365,9,19,'25.3','2023-05-15 15:37:45'),(366,9,19,'25.3','2023-05-15 15:37:50'),(367,9,19,'25.3','2023-05-15 15:37:55'),(368,9,19,'25.3','2023-05-15 15:38:00'),(369,9,19,'25.3','2023-05-15 15:38:05'),(370,9,19,'25.3','2023-05-15 15:38:10'),(371,9,19,'25.3','2023-05-15 15:38:15'),(372,9,19,'25.3','2023-05-15 15:38:20'),(373,9,19,'25.3','2023-05-15 15:38:26'),(374,9,19,'25.3','2023-05-15 15:38:30'),(375,9,19,'25.3','2023-05-15 15:38:35'),(376,9,19,'25.2','2023-05-15 15:38:40'),(377,9,19,'25.3','2023-05-15 15:38:45'),(378,9,19,'25.3','2023-05-15 15:38:50'),(379,9,19,'25.3','2023-05-15 15:38:55'),(380,9,19,'25.3','2023-05-15 15:39:00'),(381,9,19,'25.3','2023-05-15 15:39:05'),(382,9,19,'25.3','2023-05-15 15:39:10'),(383,9,19,'25.3','2023-05-15 15:39:15'),(384,9,19,'25.2','2023-05-15 15:39:20'),(385,9,19,'25.3','2023-05-15 15:39:25'),(386,9,19,'25.2','2023-05-15 15:39:30'),(387,9,19,'25.3','2023-05-15 15:39:35'),(388,9,19,'25.3','2023-05-15 15:39:40'),(389,9,19,'25.3','2023-05-15 15:39:45'),(390,9,19,'25.3','2023-05-15 15:39:50'),(391,9,19,'25.3','2023-05-15 15:39:55'),(392,9,19,'25.2','2023-05-15 15:40:00'),(393,9,19,'25.2','2023-05-15 15:40:05'),(394,9,19,'25.3','2023-05-15 15:40:10'),(395,9,19,'25.2','2023-05-15 15:40:15'),(396,9,19,'25.2','2023-05-15 15:40:20'),(397,9,19,'25.2','2023-05-15 15:40:25'),(398,9,19,'25.2','2023-05-15 15:40:30'),(399,9,19,'25.2','2023-05-15 15:40:35'),(400,9,19,'25.2','2023-05-15 15:40:40'),(401,9,19,'25.2','2023-05-15 15:40:45'),(402,9,19,'25.2','2023-05-15 15:40:50'),(403,9,19,'25.2','2023-05-15 15:40:56'),(404,9,19,'25.2','2023-05-15 15:41:00'),(405,9,19,'25.2','2023-05-15 15:41:05'),(406,9,19,'25.2','2023-05-15 15:41:11'),(407,9,19,'25.2','2023-05-15 15:41:15'),(408,9,19,'25.2','2023-05-15 15:41:20'),(409,9,19,'25.2','2023-05-15 15:41:25'),(410,9,19,'25.2','2023-05-15 15:41:30'),(411,9,19,'25.2','2023-05-15 15:41:35'),(412,9,19,'25.2','2023-05-15 15:41:40'),(413,9,19,'25.2','2023-05-15 15:41:45'),(414,9,19,'25.2','2023-05-15 15:41:50'),(415,9,19,'25.2','2023-05-15 15:41:55'),(416,9,19,'25.2','2023-05-15 15:42:00'),(417,9,19,'25.2','2023-05-15 15:42:05'),(418,9,19,'25.2','2023-05-15 15:42:10'),(419,9,19,'25.2','2023-05-15 15:42:15'),(420,9,19,'25.2','2023-05-15 15:42:20'),(421,9,19,'25.2','2023-05-15 15:42:25'),(422,9,19,'25.2','2023-05-15 15:42:30'),(423,9,19,'25.2','2023-05-15 15:42:35'),(424,9,19,'25.2','2023-05-15 15:42:40'),(425,9,19,'25.2','2023-05-15 15:42:45'),(426,9,19,'25.2','2023-05-15 15:42:50'),(427,9,19,'25.2','2023-05-15 15:42:55'),(428,9,19,'25.2','2023-05-15 15:43:00'),(429,9,19,'25.2','2023-05-15 15:43:06'),(430,9,19,'25.2','2023-05-15 15:43:11'),(431,9,19,'25.2','2023-05-15 15:43:15'),(432,9,19,'25.2','2023-05-15 15:43:20'),(433,9,19,'25.2','2023-05-15 15:43:25'),(434,9,19,'25.2','2023-05-15 15:43:31'),(435,9,19,'25.3','2023-05-15 15:43:35'),(436,9,19,'25.3','2023-05-15 15:43:40'),(437,9,19,'25.3','2023-05-15 15:43:45'),(438,9,19,'25.3','2023-05-15 15:43:50'),(439,9,19,'25.3','2023-05-15 15:43:55'),(440,9,19,'25.3','2023-05-15 15:44:01'),(441,9,19,'25.3','2023-05-15 15:44:06'),(442,9,19,'25.3','2023-05-15 15:44:11'),(443,9,19,'25.3','2023-05-15 15:44:15'),(444,9,19,'25.3','2023-05-15 15:44:20'),(445,9,19,'25.3','2023-05-15 15:44:25'),(446,9,19,'25.3','2023-05-15 15:44:30'),(447,9,19,'25.3','2023-05-15 15:44:35'),(448,9,19,'25.3','2023-05-15 15:44:40'),(449,9,19,'25.3','2023-05-15 15:44:45'),(450,9,19,'25.3','2023-05-15 15:44:50'),(451,9,19,'25.3','2023-05-15 15:44:55'),(452,9,19,'25.3','2023-05-15 15:45:00'),(453,9,19,'25.3','2023-05-15 15:45:06'),(454,9,19,'25.3','2023-05-15 15:45:11'),(455,9,19,'25.3','2023-05-15 15:45:15'),(456,9,19,'25.3','2023-05-15 15:45:20'),(457,9,19,'25.3','2023-05-15 15:45:25'),(458,9,19,'25.3','2023-05-15 15:45:30'),(459,9,19,'25.3','2023-05-15 15:45:35'),(460,9,19,'25.3','2023-05-15 15:45:40'),(461,9,19,'25.3','2023-05-15 15:45:45'),(462,9,19,'25.3','2023-05-15 15:45:50'),(463,9,19,'25.3','2023-05-15 15:45:55'),(464,9,19,'25.3','2023-05-15 15:46:00'),(465,9,19,'25.3','2023-05-15 15:46:05'),(466,9,19,'25.3','2023-05-15 15:46:11'),(467,9,19,'25.3','2023-05-15 15:46:15'),(468,9,19,'25.3','2023-05-15 15:46:20'),(469,9,19,'25.3','2023-05-15 15:46:25'),(470,9,19,'25.3','2023-05-15 15:46:30'),(471,9,19,'25.3','2023-05-15 15:46:35'),(472,9,19,'25.3','2023-05-15 15:46:41'),(473,9,19,'25.3','2023-05-15 15:46:46'),(474,9,19,'25.3','2023-05-15 15:46:51'),(475,9,19,'25.3','2023-05-15 15:46:56'),(476,9,19,'25.3','2023-05-15 15:47:01'),(477,9,19,'25.3','2023-05-15 15:47:06'),(478,9,19,'25.3','2023-05-15 15:47:11'),(479,9,19,'25.3','2023-05-15 15:47:16'),(480,9,19,'25.3','2023-05-15 15:47:21'),(481,9,19,'25.3','2023-05-15 15:47:26'),(482,9,19,'25.3','2023-05-15 15:47:31'),(483,9,19,'25.3','2023-05-15 15:47:36'),(484,9,19,'25.3','2023-05-15 15:47:41'),(485,9,19,'25.3','2023-05-15 15:47:46'),(486,9,19,'25.3','2023-05-15 15:47:51'),(487,9,19,'25.3','2023-05-15 15:47:56'),(488,9,19,'25.3','2023-05-15 15:48:01'),(489,9,19,'25.3','2023-05-15 15:48:06'),(490,9,19,'25.3','2023-05-15 15:48:11'),(491,9,19,'25.3','2023-05-15 15:48:16'),(492,9,19,'25.3','2023-05-15 15:48:21'),(493,9,19,'25.3','2023-05-15 15:48:26'),(494,9,19,'25.3','2023-05-15 15:48:31'),(495,9,19,'25.3','2023-05-15 15:48:36'),(496,9,19,'25.3','2023-05-15 15:48:41'),(497,9,19,'25.3','2023-05-15 15:48:46'),(498,9,19,'25.3','2023-05-15 15:48:51'),(499,9,19,'25.3','2023-05-15 15:48:56'),(500,9,19,'25.3','2023-05-15 15:49:01'),(501,9,19,'25.3','2023-05-15 15:49:06'),(502,9,19,'25.3','2023-05-15 15:49:11'),(503,9,19,'25.3','2023-05-15 15:49:16'),(504,9,19,'25.3','2023-05-15 15:49:21'),(505,9,19,'25.3','2023-05-15 15:49:26'),(506,9,19,'25.3','2023-05-15 15:49:31'),(507,9,19,'25.3','2023-05-15 15:49:36'),(508,9,19,'25.3','2023-05-15 15:49:41'),(509,9,19,'25.3','2023-05-15 15:49:46'),(510,9,19,'25.3','2023-05-15 15:49:51'),(511,9,19,'25.2','2023-05-15 15:49:56'),(512,9,19,'25.3','2023-05-15 15:50:01'),(513,9,19,'25.3','2023-05-15 15:50:06'),(514,9,19,'25.3','2023-05-15 15:50:11'),(515,9,19,'25.3','2023-05-15 15:50:16'),(516,9,19,'25.3','2023-05-15 15:50:21'),(517,9,19,'25.3','2023-05-15 15:50:26'),(518,9,19,'25.2','2023-05-15 15:50:31'),(519,9,19,'25.2','2023-05-15 15:50:36'),(520,9,19,'25.3','2023-05-15 15:50:41'),(521,9,19,'25.2','2023-05-15 15:50:46'),(522,9,19,'25.2','2023-05-15 15:50:51'),(523,9,19,'25.2','2023-05-15 15:50:56'),(524,9,19,'25.2','2023-05-15 15:51:01'),(525,9,19,'25.2','2023-05-15 15:51:06'),(526,9,19,'25.2','2023-05-15 15:51:11'),(527,9,19,'25.2','2023-05-15 15:51:16'),(528,9,19,'25.2','2023-05-15 15:51:21'),(529,9,19,'25.3','2023-05-15 15:51:26'),(530,9,19,'25.3','2023-05-15 15:51:31'),(531,9,19,'25.3','2023-05-15 15:51:36'),(532,9,19,'25.2','2023-05-15 15:51:41'),(533,9,19,'25.3','2023-05-15 15:51:46'),(534,9,19,'25.3','2023-05-15 15:51:51'),(535,9,19,'25.2','2023-05-15 15:51:56'),(536,9,19,'25.2','2023-05-15 15:52:01'),(537,9,19,'25.2','2023-05-15 15:52:06'),(538,9,19,'25.2','2023-05-15 15:52:11'),(539,9,19,'25.2','2023-05-15 15:52:16'),(540,9,19,'25.3','2023-05-15 15:52:21'),(541,9,19,'25.3','2023-05-15 15:52:26'),(542,9,19,'25.3','2023-05-15 15:52:31'),(543,9,19,'25.3','2023-05-15 15:52:36'),(544,9,19,'25.3','2023-05-15 15:52:41'),(545,9,19,'25.3','2023-05-15 15:52:46'),(546,9,19,'25.3','2023-05-15 15:52:51'),(547,9,19,'25.3','2023-05-15 15:52:56'),(548,9,19,'25.3','2023-05-15 15:53:01'),(549,9,19,'25.3','2023-05-15 15:53:06'),(550,9,19,'25.3','2023-05-15 15:53:11'),(551,9,19,'25.3','2023-05-15 15:53:16'),(552,9,19,'25.3','2023-05-15 15:53:21'),(553,9,19,'25.3','2023-05-15 15:53:26'),(554,9,19,'25.3','2023-05-15 15:53:31'),(555,9,19,'25.3','2023-05-15 15:53:36'),(556,9,19,'25.3','2023-05-15 15:53:41'),(557,9,19,'25.3','2023-05-15 15:53:46'),(558,9,19,'25.2','2023-05-15 15:53:51'),(559,9,19,'25.3','2023-05-15 15:53:56'),(560,9,19,'25.3','2023-05-15 15:54:01'),(561,9,19,'25.3','2023-05-15 15:54:06'),(562,9,19,'25.3','2023-05-15 15:54:11'),(563,9,19,'25.2','2023-05-15 15:54:16'),(564,9,19,'25.2','2023-05-15 15:54:21'),(565,9,19,'25.2','2023-05-15 15:54:26'),(566,9,19,'25.2','2023-05-15 15:54:31'),(567,9,19,'25.3','2023-05-15 15:54:36'),(568,9,19,'25.2','2023-05-15 15:54:41'),(569,9,19,'25.2','2023-05-15 15:54:46'),(570,9,19,'25.2','2023-05-15 15:54:51'),(571,9,19,'25.2','2023-05-15 15:54:56'),(572,9,19,'25.2','2023-05-15 15:55:01'),(573,9,19,'25.2','2023-05-15 15:55:06'),(574,9,19,'25.2','2023-05-15 15:55:11'),(575,9,19,'25.2','2023-05-15 15:55:16'),(576,9,19,'25.2','2023-05-15 15:55:21'),(577,9,19,'25.2','2023-05-15 15:55:26'),(578,9,19,'25.2','2023-05-15 15:55:31'),(579,9,19,'25.2','2023-05-15 15:55:36'),(580,9,19,'25.2','2023-05-15 15:55:41'),(581,9,19,'25.2','2023-05-15 15:55:46'),(582,9,19,'25.2','2023-05-15 15:55:51'),(583,9,19,'25.2','2023-05-15 15:55:56'),(584,9,19,'25.2','2023-05-15 15:56:01'),(585,9,19,'25.2','2023-05-15 15:56:06'),(586,9,19,'25.3','2023-05-15 15:56:11'),(587,9,19,'25.2','2023-05-15 15:56:16'),(588,9,19,'25.3','2023-05-15 15:56:21'),(589,9,19,'25.3','2023-05-15 15:56:26'),(590,9,19,'25.3','2023-05-15 15:56:31'),(591,9,19,'25.3','2023-05-15 15:56:36'),(592,9,19,'25.2','2023-05-15 15:56:41'),(593,9,19,'25.2','2023-05-15 15:56:46'),(594,9,19,'25.3','2023-05-15 15:56:51'),(595,9,19,'25.2','2023-05-15 15:56:56'),(596,9,19,'25.2','2023-05-15 15:57:01'),(597,9,19,'25.3','2023-05-15 15:57:06'),(598,9,19,'25.2','2023-05-15 15:57:11'),(599,9,19,'25.3','2023-05-15 15:57:16'),(600,9,19,'25.3','2023-05-15 15:57:21'),(601,9,19,'25.3','2023-05-15 15:57:26'),(602,9,19,'25.3','2023-05-15 15:57:31'),(603,9,19,'25.3','2023-05-15 15:57:36'),(604,9,19,'25.2','2023-05-15 15:57:41'),(605,9,19,'25.2','2023-05-15 15:57:46'),(606,9,19,'25.2','2023-05-15 15:57:51'),(607,9,19,'25.3','2023-05-15 15:57:56'),(608,9,19,'25.3','2023-05-15 15:58:01'),(609,9,19,'25.3','2023-05-15 15:58:06'),(610,9,19,'25.3','2023-05-15 15:58:11'),(611,9,19,'25.3','2023-05-15 15:58:16'),(612,9,19,'25.3','2023-05-15 15:58:21'),(613,9,19,'25.3','2023-05-15 15:58:26'),(614,9,19,'25.3','2023-05-15 15:58:31'),(615,9,19,'25.3','2023-05-15 15:58:36'),(616,9,19,'25.3','2023-05-15 15:58:41'),(617,9,19,'25.3','2023-05-15 15:58:46'),(618,9,19,'25.3','2023-05-15 15:58:51'),(619,9,19,'25.3','2023-05-15 15:58:56'),(620,9,19,'25.2','2023-05-15 15:59:01'),(621,9,19,'25.3','2023-05-15 15:59:06'),(622,9,19,'25.2','2023-05-15 15:59:11'),(623,9,19,'25.3','2023-05-15 15:59:16'),(624,9,19,'25.2','2023-05-15 15:59:21'),(625,9,19,'25.2','2023-05-15 15:59:26'),(626,9,19,'25.2','2023-05-15 15:59:31'),(627,9,19,'25.2','2023-05-15 15:59:36'),(628,9,19,'25.2','2023-05-15 15:59:41'),(629,9,19,'25.2','2023-05-15 15:59:46'),(630,9,19,'25.2','2023-05-15 15:59:51'),(631,9,19,'25.2','2023-05-15 15:59:56'),(632,9,19,'25.3','2023-05-15 16:00:01'),(633,9,19,'25.2','2023-05-15 16:00:06'),(634,9,19,'25.2','2023-05-15 16:00:11'),(635,9,19,'25.2','2023-05-15 16:00:16'),(636,9,19,'25.2','2023-05-15 16:00:21'),(637,9,19,'25.2','2023-05-15 16:00:26'),(638,9,19,'25.2','2023-05-15 16:00:31'),(639,9,19,'25.2','2023-05-15 16:00:36'),(640,9,19,'25.3','2023-05-15 16:00:41'),(641,9,19,'25.3','2023-05-15 16:00:46'),(642,9,19,'25.3','2023-05-15 16:00:51'),(643,9,19,'25.3','2023-05-15 16:00:56'),(644,9,19,'25.3','2023-05-15 16:01:01'),(645,9,19,'25.3','2023-05-15 16:01:06'),(646,9,19,'25.3','2023-05-15 16:01:11'),(647,9,19,'25.3','2023-05-15 16:01:16'),(648,9,19,'25.3','2023-05-15 16:01:21'),(649,9,19,'25.3','2023-05-15 16:01:26'),(650,9,19,'25.3','2023-05-15 16:01:31'),(651,9,19,'25.3','2023-05-15 16:01:36'),(652,9,19,'25.3','2023-05-15 16:01:41'),(653,9,19,'25.3','2023-05-15 16:01:46'),(654,9,19,'25.3','2023-05-15 16:01:51'),(655,9,19,'25.3','2023-05-15 16:01:56'),(656,9,19,'25.3','2023-05-15 16:02:01'),(657,9,19,'25.3','2023-05-15 16:02:06'),(658,9,19,'25.3','2023-05-15 16:02:11'),(659,9,19,'25.3','2023-05-15 16:02:16'),(660,9,19,'25.3','2023-05-15 16:02:21'),(661,9,19,'25.3','2023-05-15 16:02:26'),(662,9,19,'25.3','2023-05-15 16:02:31'),(663,9,19,'25.3','2023-05-15 16:02:36'),(664,9,19,'25.3','2023-05-15 16:02:41'),(665,9,19,'25.3','2023-05-15 16:02:46'),(666,9,19,'25.3','2023-05-15 16:02:51'),(667,9,19,'25.3','2023-05-15 16:02:56'),(668,9,19,'25.3','2023-05-15 16:03:01'),(669,9,19,'25.3','2023-05-15 16:03:06'),(670,9,19,'25.3','2023-05-15 16:03:11'),(671,9,19,'25.3','2023-05-15 16:03:16'),(672,9,19,'25.3','2023-05-15 16:03:21'),(673,9,19,'25.3','2023-05-15 16:03:26'),(674,9,19,'25.3','2023-05-15 16:03:31'),(675,9,19,'25.3','2023-05-15 16:03:36'),(676,9,19,'25.2','2023-05-15 16:03:41'),(677,9,19,'25.3','2023-05-15 16:03:46'),(678,9,19,'25.3','2023-05-15 16:03:51'),(679,9,19,'25.2','2023-05-15 16:03:56'),(680,9,19,'25.3','2023-05-15 16:04:01'),(681,9,19,'25.2','2023-05-15 16:04:06'),(682,9,19,'25.3','2023-05-15 16:04:11'),(683,9,19,'25.3','2023-05-15 16:04:16'),(684,9,19,'25.2','2023-05-15 16:04:21'),(685,9,19,'25.2','2023-05-15 16:04:26'),(686,9,19,'25.2','2023-05-15 16:04:31'),(687,9,19,'25.2','2023-05-15 16:04:36'),(688,9,19,'25.2','2023-05-15 16:04:41'),(689,9,19,'25.2','2023-05-15 16:04:46'),(690,9,19,'25.2','2023-05-15 16:04:51'),(691,9,19,'25.3','2023-05-15 16:04:56'),(692,9,19,'25.3','2023-05-15 16:05:01'),(693,9,19,'25.2','2023-05-15 16:05:06'),(694,9,19,'25.2','2023-05-15 16:05:11'),(695,9,19,'25.3','2023-05-15 16:05:16'),(696,9,19,'25.3','2023-05-15 16:05:21'),(697,9,19,'25.3','2023-05-15 16:05:26'),(698,9,19,'25.3','2023-05-15 16:05:31'),(699,9,19,'25.2','2023-05-15 16:05:36'),(700,9,19,'25.3','2023-05-15 16:05:41'),(701,9,19,'25.3','2023-05-15 16:05:46'),(702,9,19,'25.3','2023-05-15 16:05:51'),(703,9,19,'25.3','2023-05-15 16:05:56'),(704,9,19,'25.3','2023-05-15 16:06:01'),(705,9,19,'25.3','2023-05-15 16:06:06'),(706,9,19,'25.2','2023-05-15 16:06:11'),(707,9,19,'25.2','2023-05-15 16:06:16'),(708,9,19,'25.3','2023-05-15 16:06:21'),(709,9,19,'25.3','2023-05-15 16:06:26'),(710,9,19,'25.3','2023-05-15 16:06:31'),(711,9,19,'25.2','2023-05-15 16:06:36'),(712,9,19,'25.3','2023-05-15 16:06:41'),(713,9,19,'25.3','2023-05-15 16:06:46'),(714,9,19,'25.3','2023-05-15 16:06:51'),(715,9,19,'25.2','2023-05-15 16:06:56'),(716,9,19,'25.3','2023-05-15 16:07:01'),(717,9,19,'25.3','2023-05-15 16:07:06'),(718,9,19,'25.3','2023-05-15 16:07:11'),(719,9,19,'25.3','2023-05-15 16:07:16'),(720,9,19,'25.3','2023-05-15 16:07:21'),(721,9,19,'25.3','2023-05-15 16:07:26'),(722,9,19,'25.3','2023-05-15 16:07:31'),(723,9,19,'25.3','2023-05-15 16:07:36'),(724,9,19,'25.3','2023-05-15 16:07:41'),(725,9,19,'25.3','2023-05-15 16:07:46'),(726,9,19,'25.3','2023-05-15 16:07:51'),(727,9,19,'25.3','2023-05-15 16:07:56'),(728,9,19,'25.2','2023-05-15 16:08:01'),(729,9,19,'25.3','2023-05-15 16:08:06'),(730,9,19,'25.3','2023-05-15 16:08:11'),(731,9,19,'25.3','2023-05-15 16:08:16'),(732,9,19,'25.2','2023-05-15 16:08:21'),(733,9,19,'25.2','2023-05-15 16:08:26'),(734,9,19,'25.3','2023-05-15 16:08:31'),(735,9,19,'25.3','2023-05-15 16:08:36'),(736,9,19,'25.3','2023-05-15 16:08:41'),(737,9,19,'25.3','2023-05-15 16:08:46'),(738,9,19,'25.3','2023-05-15 16:08:51'),(739,9,19,'25.3','2023-05-15 16:08:56'),(740,9,19,'25.3','2023-05-15 16:09:01'),(741,9,19,'25.3','2023-05-15 16:09:06'),(742,9,19,'25.3','2023-05-15 16:09:11'),(743,9,19,'25.3','2023-05-15 16:09:16'),(744,9,19,'25.3','2023-05-15 16:09:21');
/*!40000 ALTER TABLE `result_time_logs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
INSERT INTO `runs` VALUES (1,'cleaning',NULL,'2023-05-15 11:49:38'),(2,'cleaning',NULL,'2023-05-15 13:54:06'),(3,'sampling',NULL,'2023-05-15 14:08:28'),(4,'sampling',NULL,'2023-05-15 14:09:41'),(5,'sampling',NULL,'2023-05-15 14:10:18'),(6,'sampling',NULL,'2023-05-15 14:12:00'),(7,'kyuudai_flow',NULL,'2023-05-15 14:57:01'),(8,'kyuudai_flow',NULL,'2023-05-15 15:23:37'),(9,'kyuudai_flow','イノベ実験101','2023-05-15 15:29:08');
/*!40000 ALTER TABLE `runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `argument` varchar(200) NOT NULL,
  `explanation` varchar(500) NOT NULL,
  `value` varchar(200) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'tempError','How much margin of error is acceptable? [℃]','0.35','2023-01-10 16:59:22'),(2,'samplingNumber','How many times is the data acquired considered steady-state? [-]','80','2023-01-10 16:59:22'),(3,'interval','Interval of temperature acquisition for steady-state [s]','3','2023-01-10 16:59:22'),(4,'maxTime','How much is maximum steady-state waiting time? [s]','2400','2023-01-10 16:59:22'),(5,'tempStep','Difference between the value used as a step and the desired set value for the temperature control [℃]','0.5','2023-01-10 16:59:22'),(6,'monitorInterval','Interval for status monitoring [s]','5','2023-01-10 16:59:22'),(7,'dtempError','default','0.45',NULL),(8,'dsamplingNumber','default','100',NULL),(9,'dinterval','default','3',NULL),(10,'dmaxTime','default','2400',NULL),(11,'dtempStep','default','0.7',NULL),(12,'dmonitorInterval','default','5',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-16 15:34:48
