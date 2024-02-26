LOCK TABLES `experiment_titles` WRITE;
INSERT INTO `experiment_titles` VALUES (default,'test1',default,default),(default,'test2',default,default);
UNLOCK TABLES;

LOCK TABLES `experiment_procedures` WRITE;
INSERT INTO `experiment_procedures` VALUES (default,1,1,'startup',default,default),(default,1,2,'measurment',default,default),(default,1,3,'end',default,default);
UNLOCK TABLES;

LOCK TABLES `experiment_procedure_blocks` WRITE;
INSERT INTO `experiment_procedure_blocks` VALUES (default,1,1,1,1,default,default,default),(default,1,2,2,4,default,default,default),(default,2,1,1,2,default,default,default),
(default,3,1,1,3,default,default,default);
UNLOCK TABLES;

LOCK TABLES `devices` WRITE;
INSERT INTO `devices` VALUES (default,1,'testdevice',default,default),(default,1,'-',default,default),(default,1,'testdevice2',default,default),(default,2,'testdevice',default,default);
UNLOCK TABLES;

LOCK TABLES `actions` WRITE;
INSERT INTO `actions` VALUES (1,'on','--on',false,default,default),(2,'get the value','--get',true,default,default),(3,'off','--off',false,default,default),(4,'waiting','wait',false,default,default),(5,'set infusion rate','--irate',false,default,default),
(6,'set withdraw rate','--wrate',false,default,default),(7,'infusion run','--irun',false,default,default),(8,'withdraw run','--wrun',false,default,default);
UNLOCK TABLES;

