DROP TABLE IF EXISTS `raspberrypi_informations`;
CREATE TABLE `raspberrypi_informations` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `detail` varchar(200) ,
    PRIMARY KEY(`id`)
);

DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `serialnumber` varchar(50) NOT NULL,
  `script` varchar(100) NOT NULL DEFAULT 'NoScript',
  PRIMARY KEY (`id`)
);