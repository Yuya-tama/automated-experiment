-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: dbsrv
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0+deb10u1

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
-- Table structure for table `Action`
--

DROP TABLE IF EXISTS `Action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Action` varchar(50) NOT NULL,
  `Argument` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Action`
--

LOCK TABLES `Action` WRITE;
/*!40000 ALTER TABLE `Action` DISABLE KEYS */;
INSERT INTO `Action` VALUES (1,'on','--on'),(2,'get the value','--get'),(3,'off','--off'),(4,'waiting','wait'),(5,'set infusion rate','--irate'),(6,'set withdraw rate','--wrate'),(7,'infusion run','--irun'),(8,'withdraw run','--wrun'),(9,'set the valve position','--changePos');
/*!40000 ALTER TABLE `Action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActualDevice`
--

DROP TABLE IF EXISTS `ActualDevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActualDevice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RunID` int(11) NOT NULL,
  `ProcedureID` int(11) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActualDevice`
--

LOCK TABLES `ActualDevice` WRITE;
/*!40000 ALTER TABLE `ActualDevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActualDevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experiment`
--

DROP TABLE IF EXISTS `Experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Experiment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experiment`
--

LOCK TABLES `Experiment` WRITE;
/*!40000 ALTER TABLE `Experiment` DISABLE KEYS */;
INSERT INTO `Experiment` VALUES (1,'test1'),(2,'example1'),(20,'pump test'),(25,'flow test'),(26,'vulve test'),(27,'TESTRUN'),(28,'test run');
/*!40000 ALTER TABLE `Experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experimentalprocedure`
--

DROP TABLE IF EXISTS `Experimentalprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Experimentalprocedure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExperimentID` int(11) NOT NULL,
  `Device` varchar(50) NOT NULL DEFAULT '-',
  `ActionID` int(11) NOT NULL,
  `ProcedureOrder` int(10) NOT NULL,
  `Details` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experimentalprocedure`
--

LOCK TABLES `Experimentalprocedure` WRITE;
/*!40000 ALTER TABLE `Experimentalprocedure` DISABLE KEYS */;
INSERT INTO `Experimentalprocedure` VALUES (1,1,'aq',1,3,NULL),(2,1,'bq',1,2,NULL),(3,1,'cq',3,4,NULL),(4,2,'deviceX',1,1,NULL),(5,1,'aq',3,1,NULL),(6,2,'deviceX',2,2,NULL),(7,2,'deviceX',2,4,NULL),(8,19,'a',1,1,NULL),(9,2,'-',4,3,'2'),(10,19,'a',2,2,NULL),(11,2,'-',4,5,'3'),(44,19,'hgoehoge',4,44,'hogehoge'),(45,1,'aq',6,45,' '),(46,1,'aq',6,46,'5 m/m'),(47,1,'qazwsx',7,47,' '),(48,1,'cq',7,48,' '),(49,1,'-',4,49,'16 '),(50,20,'pump',5,50,'1 μL/min'),(51,20,'pumpB',5,51,'2 '),(52,20,'pumpB',5,52,' '),(53,20,'pumpB',5,53,'1 mL/min'),(54,20,'pump',5,54,' '),(55,25,'pumpA',5,1,'1 mL/s'),(56,25,'pumpB',5,2,'1 mL/s'),(57,25,'pumpA',7,4,' '),(58,25,'pumpB',7,5,' '),(59,25,'valve',9,3,'1'),(60,25,'-',4,6,'2'),(61,25,'valve',9,7,'2 '),(62,25,'-',4,8,'2'),(63,25,'valve',9,9,'3 '),(64,25,'-',4,10,'2'),(65,20,'-',4,65,'2 '),(66,20,'-',4,66,' '),(67,20,'-',4,67,'2 '),(68,20,'-',4,68,'4 '),(69,20,'-',4,69,'2 '),(70,20,'-',4,70,'4 '),(71,25,'pumpA',3,71,' '),(72,25,'pumpB',3,72,' '),(73,26,'valve',9,1,'2 '),(74,26,'valve',9,3,'4 '),(75,26,'valve',9,5,'6 '),(76,26,'valve',9,7,'1 '),(77,26,'-',4,2,'2 '),(78,26,'-',4,4,'2 '),(79,26,'-',4,6,'2 '),(80,27,'PumpA',5,80,'1 mL/min'),(81,27,'PumpB',5,81,'1 mL/min'),(82,27,'PumpA',6,82,'1 mL/min'),(83,27,'PumpB',6,83,'1 mL/min'),(84,27,'valveA',9,84,'1 '),(85,27,'valveB',9,85,'1 '),(86,27,'PumpA',7,86,' '),(88,27,'PumpB',7,88,' '),(89,27,'-',4,89,'60 '),(90,27,'valveA',9,90,'2 '),(91,27,'valveB',9,91,'2 '),(92,27,'-',4,92,'40 '),(93,27,'valveA',9,93,'6 '),(94,27,'valveB',9,94,'6 '),(95,27,'PumpA',8,95,' '),(96,27,'PumpB',8,96,' '),(97,27,'-',4,97,'60 '),(98,27,'valveA',9,98,'3 '),(99,27,'valveB',9,99,'3 '),(100,27,'PumpA',7,100,' '),(101,27,'PumpB',3,101,' '),(102,27,'valveA',9,102,'4 '),(103,27,'valveB',9,103,'4 '),(104,27,'PumpA',3,104,' '),(105,27,'PumpB',7,105,' '),(106,27,'-',4,106,'60 '),(107,27,'valveA',9,107,'2 '),(108,27,'valveB',9,108,'2 '),(109,27,'PumpA',8,109,' '),(110,27,'PumpB',8,110,' '),(111,27,'-',4,111,'40 '),(112,27,'valveA',9,112,'5 '),(113,27,'valveB',9,113,'5 '),(114,27,'PumpA',7,114,' '),(115,27,'valveB',7,115,' '),(116,27,'PumpA',3,116,' '),(117,27,'PumpB',3,117,' '),(118,28,'pump  A',5,1,'8 mL/min'),(119,28,'pump B',5,2,'8 mL/min'),(120,28,'valve A',9,3,'1 '),(121,28,'valve B',9,4,'1 '),(122,28,'pump  A',7,5,' '),(123,28,'pump B',7,6,' '),(124,28,'-',4,7,'40'),(125,28,'valve A',9,8,'2 '),(126,28,'valve B',9,9,'2 '),(127,28,'pump  A',3,10,' '),(128,28,'-',4,11,'20'),(129,28,'pump B',3,12,' '),(130,28,'pump  A',7,13,' '),(131,28,'-',4,14,'20'),(132,28,'pump  A',3,15,' '),(133,28,'valve A',9,16,'3 '),(134,28,'valve B',9,17,'3 '),(135,28,'pump  A',7,18,' '),(136,28,'pump B',7,19,' '),(137,28,'-',4,20,'20'),(138,28,'valve A',9,21,'4 '),(139,28,'valve B',9,22,'4 '),(140,28,'-',4,23,'20'),(141,28,'pump  A',3,24,' '),(142,28,'pump B',3,25,' ');
/*!40000 ALTER TABLE `Experimentalprocedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Result`
--

DROP TABLE IF EXISTS `Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Result` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RunID` int(11) NOT NULL,
  `ProcedureID` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Value` float NOT NULL,
  `Unit` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Result`
--

LOCK TABLES `Result` WRITE;
/*!40000 ALTER TABLE `Result` DISABLE KEYS */;
/*!40000 ALTER TABLE `Result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Run`
--

DROP TABLE IF EXISTS `Run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Run` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExperimentID` int(11) NOT NULL,
  `Starting_date` datetime DEFAULT NULL,
  `Comment` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Run`
--

LOCK TABLES `Run` WRITE;
/*!40000 ALTER TABLE `Run` DISABLE KEYS */;
INSERT INTO `Run` VALUES (1,2,'2021-11-14 01:25:40',NULL),(2,2,'2021-11-14 01:25:40',NULL),(3,2,'2021-11-14 01:49:53',NULL),(4,2,'2021-11-14 01:54:18',NULL),(5,2,'2021-11-14 01:57:55',NULL),(6,2,'2021-11-14 02:00:07',NULL),(7,2,'2021-11-14 02:01:33',NULL),(8,2,'2021-11-14 14:21:37',NULL),(9,1,'2021-11-14 14:37:53',NULL),(10,2,'2021-11-14 23:48:28',NULL),(11,2,'2021-11-14 23:51:31',NULL),(12,2,'2021-11-14 23:51:50',NULL),(13,2,'2021-11-15 01:01:58',NULL),(14,2,'2021-11-15 01:05:56',NULL),(15,2,'2021-11-15 01:09:39',NULL),(16,2,'2021-11-15 01:46:13',NULL),(17,2,'2021-11-15 02:47:50',NULL),(18,2,'2021-11-15 03:31:49','あいうえお'),(19,2,'2021-11-15 04:17:35','ああああ'),(20,2,'2021-11-15 05:26:40',NULL),(21,2,'2021-11-15 13:55:49',NULL),(22,2,'2021-11-16 15:33:25',NULL),(23,2,'2021-11-24 15:31:25','あいうえお'),(24,2,'2021-11-24 15:31:57',NULL),(25,2,'2021-11-24 15:32:01',NULL),(26,2,'2021-11-24 15:53:56',NULL),(27,2,'2021-11-24 15:54:53',NULL),(28,2,'2021-11-24 16:07:06',NULL),(29,2,'2021-11-24 16:09:58',NULL),(30,19,'2021-11-24 18:06:19',NULL),(31,19,'2021-11-24 18:11:38',NULL),(32,19,'2021-11-24 18:15:11',NULL),(33,2,'2021-11-24 18:26:37',NULL),(34,2,'2021-11-24 18:37:12',NULL),(35,2,'2021-11-24 18:39:24',NULL),(36,2,'2021-11-24 18:40:33',NULL),(37,2,'2021-11-24 18:43:49',NULL),(38,2,'2021-11-24 18:43:55',NULL),(39,19,'2021-11-24 18:50:08',NULL),(40,19,'2021-11-24 18:50:38',NULL),(41,2,'2021-12-01 13:05:12',NULL),(42,20,'2021-12-01 13:29:09',NULL),(43,20,'2021-12-01 13:36:35',NULL),(44,20,'2021-12-01 13:37:16',NULL),(45,2,'2021-12-07 01:08:53',NULL),(46,2,'2021-12-09 00:24:44',NULL),(47,2,'2021-12-09 12:58:10',NULL),(48,2,'2021-12-09 13:02:58',NULL),(49,2,'2021-12-09 17:07:54',NULL),(50,2,'2021-12-09 17:08:33',NULL),(51,2,'2021-12-10 00:59:38',NULL),(52,2,'2021-12-10 01:01:58',NULL),(53,2,'2021-12-10 01:04:24',NULL),(54,2,'2021-12-10 01:09:16',NULL),(55,2,'2021-12-10 01:13:29',NULL),(56,2,'2021-12-14 15:33:21',NULL),(57,19,'2021-12-14 15:48:22',NULL),(58,1,'2021-12-14 23:43:47','いろいろありすぎて難しい'),(59,1,'2021-12-16 03:23:29',NULL),(60,2,'2021-12-17 14:29:54',NULL),(61,2,'2021-12-18 12:50:32',NULL),(62,1,'2021-12-18 22:50:34',NULL),(63,2,'2021-12-18 22:56:33',NULL),(64,2,'2021-12-18 23:14:44',NULL),(65,2,'2021-12-18 23:25:50',NULL),(66,2,'2022-01-07 23:51:20',NULL),(67,2,'2022-01-09 15:57:44',NULL),(68,2,'2022-01-09 15:58:13',NULL),(69,1,'2022-01-09 19:36:01',NULL),(70,2,'2022-01-09 19:36:23',NULL),(71,1,'2022-01-12 13:41:01',NULL),(72,2,'2022-01-12 16:07:47',NULL),(73,2,'2022-01-12 17:19:48',NULL),(74,2,'2022-01-23 22:47:07',NULL),(75,2,'2022-01-23 22:48:16',NULL),(76,2,'2022-01-23 23:19:15',NULL),(77,2,'2022-02-01 00:20:47',NULL),(78,25,'2022-04-15 16:58:22',NULL),(79,2,'2022-04-15 17:03:35',NULL),(80,2,'2022-04-15 17:04:14',NULL),(81,2,'2022-04-15 17:06:22',NULL),(82,26,'2022-04-15 17:07:31',NULL),(83,26,'2022-04-15 17:08:12',NULL),(84,26,'2022-04-15 17:13:03',NULL),(85,26,'2022-04-15 17:16:59',NULL),(86,25,'2022-04-15 17:31:37',NULL),(87,25,'2022-04-15 17:45:04',NULL),(88,25,'2022-04-15 17:54:19',NULL),(89,25,'2022-04-15 18:17:48',NULL),(90,25,'2022-04-15 18:45:06',NULL),(91,25,'2022-04-15 18:54:49',NULL),(92,25,'2022-04-15 18:57:59',NULL),(93,25,'2022-04-15 19:05:48',NULL),(94,28,'2022-04-17 15:54:53',NULL),(95,28,'2022-04-17 15:59:37',NULL),(96,28,'2022-04-17 16:04:29',NULL),(97,28,'2022-04-17 16:12:23',NULL),(98,28,'2022-04-17 16:14:48',NULL),(99,28,'2022-04-18 02:23:18',NULL),(100,28,'2022-04-18 14:12:47',NULL),(101,28,'2022-04-18 14:14:22',NULL),(102,28,'2022-04-18 14:14:42',NULL),(103,28,'2022-04-18 14:20:46',NULL),(104,28,'2022-04-18 14:28:47',NULL);
/*!40000 ALTER TABLE `Run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Username`
--

DROP TABLE IF EXISTS `Username`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Username` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Belongs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Username`
--

LOCK TABLES `Username` WRITE;
/*!40000 ALTER TABLE `Username` DISABLE KEYS */;
/*!40000 ALTER TABLE `Username` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-01 22:59:50
