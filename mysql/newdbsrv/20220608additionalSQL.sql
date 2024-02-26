ALTER TABLE experiment_procedure_blocks add condition_id int(10) DEFAULT NULL AFTER detail;

DROP TABLE IF EXISTS `experiment_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_conditions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `experiment_procedure_id` int(10) NOT NULL,
  `condition_title` varchar(200) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;