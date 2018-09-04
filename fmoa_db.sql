/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - fmoa_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fmoa_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fmoa_db`;

/*Table structure for table `account_set` */

DROP TABLE IF EXISTS `account_set`;

CREATE TABLE `account_set` (
  `accset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) NOT NULL,
  `periods` varchar(50) NOT NULL,
  `isSettleAccounts` tinyint(4) DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`accset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `account_set` */

insert  into `account_set`(`accset_id`,`companyName`,`periods`,`isSettleAccounts`,`visible`,`backupA`,`backupB`,`backupC`,`backupD`) values (1,'广西桂平黄大宝服装有限公司','2017-12',0,1,NULL,NULL,NULL,NULL);

/*Table structure for table `accountsub` */

DROP TABLE IF EXISTS `accountsub`;

CREATE TABLE `accountsub` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acSub_id` int(10) unsigned NOT NULL,
  `acSub_name` varchar(50) NOT NULL,
  `acSub_classes` varchar(50) NOT NULL,
  `acSub_property` varchar(50) NOT NULL,
  `balanceDirection` varchar(50) NOT NULL,
  `initDebitRemaining` float(14,2) unsigned DEFAULT NULL,
  `initDebitQuantity` int(10) unsigned DEFAULT NULL,
  `initDebitPrice` float(14,2) unsigned DEFAULT NULL,
  `initLenderRemaining` float(14,2) unsigned DEFAULT NULL,
  `initLenderQuantity` int(10) unsigned DEFAULT NULL,
  `initLenderPrice` float(14,2) unsigned DEFAULT NULL,
  `yearSumDebit` float(14,2) unsigned DEFAULT NULL,
  `yearDebitQuantity` int(10) unsigned DEFAULT NULL,
  `yearDebitPrice` float(14,2) unsigned DEFAULT NULL,
  `yearSumLender` float(14,2) unsigned DEFAULT NULL,
  `yearLenderQuantity` int(10) unsigned DEFAULT NULL,
  `yearLenderPrice` float(14,2) unsigned DEFAULT NULL,
  `endDebitBalance` float(14,2) unsigned DEFAULT NULL,
  `endDebitQuantity` int(10) unsigned DEFAULT NULL,
  `endDebitPrice` float(14,2) unsigned DEFAULT NULL,
  `endLenderBalance` float(14,2) unsigned DEFAULT NULL,
  `endLenderQuantity` int(10) unsigned DEFAULT NULL,
  `endLenderPrice` float(14,2) unsigned DEFAULT NULL,
  `isQuantity` tinyint(4) NOT NULL DEFAULT '0',
  `enStatus` tinyint(4) NOT NULL DEFAULT '1',
  `super_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acSub_id` (`acSub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `accountsub` */

insert  into `accountsub`(`id`,`acSub_id`,`acSub_name`,`acSub_classes`,`acSub_property`,`balanceDirection`,`initDebitRemaining`,`initDebitQuantity`,`initDebitPrice`,`initLenderRemaining`,`initLenderQuantity`,`initLenderPrice`,`yearSumDebit`,`yearDebitQuantity`,`yearDebitPrice`,`yearSumLender`,`yearLenderQuantity`,`yearLenderPrice`,`endDebitBalance`,`endDebitQuantity`,`endDebitPrice`,`endLenderBalance`,`endLenderQuantity`,`endLenderPrice`,`isQuantity`,`enStatus`,`super_id`,`visible`,`backupA`,`backupB`,`backupC`,`backupD`) values (1,1001,'库存现金','zichan','流动资产','借',100000.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(3,2001,'短期借款','fuzhai','流动负债','贷',0.00,NULL,NULL,10000.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(4,3001,'实收资本','quanyi','所有者权益','贷',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(5,4001,'生产成本','chengben','成本','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(6,5101,'主营业务收入','sunyi','营业收入','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(7,5102,'其他业务收入','sunyi','营业收入','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(12,1002,'银行存款','zichan','流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,NULL,NULL,NULL,NULL),(13,1012,'其他货币资金','zichan','流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(14,1101,'短期投资','zichan','流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(15,1121,'应收票据','zichan','流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(16,2201,'应付票据','fuzhai','流动负债','贷',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(17,110101,'股票','zichan','流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1101,1,NULL,NULL,NULL,NULL),(18,2221,'应交税费','fuzhai','流动负债','贷',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(19,222101,'应交增值税','fuzhai','流动负债','贷',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,2221,1,NULL,NULL,NULL,NULL),(20,22210101,'进项税额','fuzhai','流动负债','贷',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,222101,1,NULL,NULL,NULL,NULL),(21,1401,'采购材料','zichan','非流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(22,1402,'在途物资','zichan','非流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL),(23,1403,'原材料','zichan','流动资产','借',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,1,NULL,NULL,NULL,NULL);

/*Table structure for table `auth_role` */

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `auth_role` */

insert  into `auth_role`(`role_id`,`role_name`,`visible`,`backupA`,`backupB`,`backupC`,`backupD`) values (1,'管理员',1,NULL,NULL,NULL,NULL),(2,'会计主管',1,NULL,NULL,NULL,NULL),(3,'总账会计',1,NULL,NULL,NULL,NULL),(4,'成本会计',1,NULL,NULL,NULL,NULL),(5,'出纳员',1,NULL,NULL,NULL,NULL),(6,'efea是',0,NULL,NULL,NULL,NULL),(7,'gg',0,NULL,NULL,NULL,NULL);

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `uName` varchar(50) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `enStatus` tinyint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_auth_user` (`role_id`),
  CONSTRAINT `FK_auth_user` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`username`,`pwd`,`uName`,`role_id`,`enStatus`,`visible`,`backupA`,`backupB`,`backupC`,`backupD`) values (1,'admin','admin','管理员',1,1,1,NULL,NULL,NULL,NULL),(2,'usera','123456','张三',5,1,1,NULL,NULL,NULL,NULL),(3,'userb','123456','李四',4,1,1,NULL,NULL,NULL,NULL),(4,'userc','123456','王五',2,1,1,NULL,NULL,NULL,NULL),(5,'userd','123456','小明',5,1,1,NULL,NULL,NULL,NULL),(6,'ligoudan','123456','李狗蛋',1,0,1,NULL,NULL,NULL,NULL),(7,'hy123','123456','黄勇',1,1,1,NULL,NULL,NULL,NULL),(8,'hy321','123456','黄小勇',3,1,1,NULL,NULL,NULL,NULL);

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `exchangeRate` float(10,4) NOT NULL,
  `enStatus` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `currency` */

insert  into `currency`(`id`,`currency_id`,`currency_name`,`exchangeRate`,`enStatus`,`visible`,`backupA`,`backupB`,`backupC`,`backupD`) values (1,1,'人民币',1.0000,1,1,NULL,NULL,NULL,NULL);

/*Table structure for table `currentmoney` */

DROP TABLE IF EXISTS `currentmoney`;

CREATE TABLE `currentmoney` (
  `periods` varchar(50) DEFAULT NULL,
  `currentDebit` float(14,2) unsigned DEFAULT NULL,
  `currentLender` float(14,2) unsigned DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `currentmoney` */

/*Table structure for table `voucher` */

DROP TABLE IF EXISTS `voucher`;

CREATE TABLE `voucher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `acSub_id` int(10) unsigned NOT NULL,
  `abstract` varchar(50) NOT NULL,
  `debitMoney` float(14,2) unsigned DEFAULT NULL,
  `debitQuantity` int(10) unsigned DEFAULT NULL,
  `debitPrice` float(14,2) unsigned DEFAULT NULL,
  `creditorMoney` float(14,2) unsigned DEFAULT NULL,
  `creditorQuantity` int(10) unsigned DEFAULT NULL,
  `creditorPrice` float(14,2) unsigned DEFAULT NULL,
  `sumDebit` float(14,2) unsigned DEFAULT NULL,
  `sumCreditor` float(14,2) unsigned DEFAULT NULL,
  `formMaker` varchar(50) NOT NULL,
  `reChecker` varchar(50) DEFAULT NULL,
  `bookKeeper` varchar(50) DEFAULT NULL,
  `bookKeeperTime` varchar(50) DEFAULT NULL,
  `checkStatus` tinyint(4) NOT NULL DEFAULT '0',
  `createTime` varchar(50) NOT NULL,
  `periods` varchar(50) NOT NULL,
  `bills` int(10) unsigned DEFAULT NULL,
  `billsPhotos` varchar(100) DEFAULT NULL,
  `superid` int(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `jiezhang` tinyint(2) DEFAULT '0',
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_voucher` (`acSub_id`),
  CONSTRAINT `FK_voucher` FOREIGN KEY (`acSub_id`) REFERENCES `accountsub` (`acSub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `voucher` */

insert  into `voucher`(`id`,`voucher_id`,`acSub_id`,`abstract`,`debitMoney`,`debitQuantity`,`debitPrice`,`creditorMoney`,`creditorQuantity`,`creditorPrice`,`sumDebit`,`sumCreditor`,`formMaker`,`reChecker`,`bookKeeper`,`bookKeeperTime`,`checkStatus`,`createTime`,`periods`,`bills`,`billsPhotos`,`superid`,`visible`,`jiezhang`,`backupB`,`backupC`,`backupD`) values (1,1,1101,'asdf',220.00,NULL,NULL,220.00,NULL,NULL,220.00,220.00,'管理员','王五',NULL,NULL,1,'2018-03-26','1',NULL,NULL,0,1,0,NULL,NULL,NULL),(2,NULL,1002,'dasf',11.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员','王五',NULL,NULL,1,'2018-03-26','1',0,NULL,1,1,0,NULL,NULL,NULL),(4,NULL,1002,'af',11.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员','王五',NULL,NULL,1,'2018-03-26','1',0,NULL,1,1,0,NULL,NULL,NULL),(7,NULL,2201,'asdf',NULL,NULL,NULL,11.00,NULL,NULL,NULL,NULL,'管理员','王五',NULL,NULL,1,'2018-03-26','1',0,NULL,1,1,0,NULL,NULL,NULL),(9,NULL,1401,'af',111.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员','王五',NULL,NULL,1,'2018-03-26','1',0,NULL,1,1,0,NULL,NULL,NULL),(11,NULL,2221,'af',NULL,NULL,NULL,111.00,NULL,NULL,NULL,NULL,'管理员','王五',NULL,NULL,1,'2018-03-26','1',0,NULL,1,1,0,NULL,NULL,NULL),(12,2,1002,'阿凡达',22.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-26','1',0,NULL,0,1,0,NULL,NULL,NULL),(13,NULL,2201,'阿萨德',NULL,NULL,NULL,22.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-26','1',0,NULL,2,1,0,NULL,NULL,NULL),(14,3,1012,'sdf',111.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',0,NULL,0,1,0,NULL,NULL,NULL),(15,NULL,2001,'dsf',NULL,NULL,NULL,111.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',0,NULL,3,1,0,NULL,NULL,NULL),(16,1,1012,'we',111.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,0,1,0,NULL,NULL,NULL),(17,NULL,2221,'eqwe',NULL,NULL,NULL,111.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,1,1,0,NULL,NULL,NULL),(18,3,1012,'qwe',111.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,0,1,0,NULL,NULL,NULL),(19,NULL,2201,'qwewq',NULL,NULL,NULL,111.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,3,1,0,NULL,NULL,NULL),(20,4,1402,'sadf',111.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,0,1,0,NULL,NULL,NULL),(21,NULL,1121,'asf',111.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,4,1,0,NULL,NULL,NULL),(22,NULL,2001,'af',NULL,NULL,NULL,111.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,4,1,0,NULL,NULL,NULL),(23,NULL,2221,'fa',NULL,NULL,NULL,111.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-03-31','1',1,NULL,4,1,0,NULL,NULL,NULL),(24,4,1012,'asdf',222.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-04-13','1',0,NULL,0,1,0,NULL,NULL,NULL),(25,NULL,2201,'ddd',NULL,NULL,NULL,222.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-04-13','1',0,NULL,4,1,0,NULL,NULL,NULL),(26,NULL,1401,'dda',333.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-04-13','1',0,NULL,4,1,0,NULL,NULL,NULL),(27,NULL,2221,'aaa',NULL,NULL,NULL,333.00,NULL,NULL,NULL,NULL,'管理员',NULL,NULL,NULL,0,'2018-04-13','1',0,NULL,4,1,0,NULL,NULL,NULL);

/*Table structure for table `vouchertype` */

DROP TABLE IF EXISTS `vouchertype`;

CREATE TABLE `vouchertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voucherType_id` int(10) unsigned NOT NULL,
  `voucherType_name` varchar(50) NOT NULL,
  `printTitle` varchar(50) NOT NULL,
  `enStatus` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `backupA` varchar(50) DEFAULT NULL,
  `backupB` varchar(50) DEFAULT NULL,
  `backupC` varchar(50) DEFAULT NULL,
  `backupD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucherType_id` (`voucherType_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vouchertype` */

insert  into `vouchertype`(`id`,`voucherType_id`,`voucherType_name`,`printTitle`,`enStatus`,`visible`,`backupA`,`backupB`,`backupC`,`backupD`) values (1,1,'记','记账凭证',1,1,NULL,NULL,NULL,NULL);

/*Table structure for table `userview` */

DROP TABLE IF EXISTS `userview`;

/*!50001 DROP VIEW IF EXISTS `userview` */;
/*!50001 DROP TABLE IF EXISTS `userview` */;

/*!50001 CREATE TABLE  `userview`(
 `username` varchar(50) NOT NULL ,
 `password` varchar(50) NOT NULL ,
 `name` varchar(50) NOT NULL ,
 `roleName` varchar(50) NULL ,
 `status` tinyint(4) NOT NULL  default '0' ,
 `visible` tinyint(4) NOT NULL  default '1' 
)*/;

/*View structure for view userview */

/*!50001 DROP TABLE IF EXISTS `userview` */;
/*!50001 DROP VIEW IF EXISTS `userview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userview` AS select `u`.`username` AS `username`,`u`.`pwd` AS `password`,`u`.`uName` AS `name`,`r`.`role_name` AS `roleName`,`u`.`enStatus` AS `status`,`u`.`visible` AS `visible` from (`auth_user` `u` left join `auth_role` `r` on((`u`.`role_id` = `r`.`role_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
