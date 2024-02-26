DROP TABLE IF EXISTS `raspberrypi_informations`;

CREATE TABLE `raspberrypi_informations` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `detail` varchar(200) ,
    PRIMARY KEY(`id`)
)