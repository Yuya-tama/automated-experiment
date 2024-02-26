/*　引数の数(0:なし、1:値、2:値と単位) */
ALTER TABLE actions add detail_number int(2) NOT NULL DEFAULT 0 AFTER argument;


ALTER TABLE devices add device_types_id int(10) NOT NULL AFTER device_name;


DROP TABLE IF EXISTS `device_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `device_type_name` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `device_value_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_value_choices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `device_link_id` int(10) NOT NULL,
  `value` int(8) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `device_type_action_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type_action_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `device_type_id` int(10) NOT NULL,
  `action_id` int(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;