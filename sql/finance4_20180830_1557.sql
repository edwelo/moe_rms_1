# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: mysql.moe (MySQL 5.6.10)
# Database: finance4
# Generation Time: 2018-08-30 06:57:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table distributions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `distributions`;

CREATE TABLE `distributions` (
  `distributionId` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `preparedBy` varchar(30) DEFAULT NULL,
  `preparedDate` date DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `deliveredBy` varchar(30) DEFAULT NULL,
  `deliveredDate` date DEFAULT NULL,
  `receivedBy` varchar(30) DEFAULT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `statusDate` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `enteredBy` int(5) DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `modifiedBy` int(5) DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `isValid` varchar(15) NOT NULL,
  PRIMARY KEY (`distributionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;

INSERT INTO `distributions` (`distributionId`, `preparedBy`, `preparedDate`, `destination`, `deliveredBy`, `deliveredDate`, `receivedBy`, `receivedDate`, `status`, `statusDate`, `remarks`, `enteredBy`, `enteredDate`, `modifiedBy`, `modifiedDate`, `isValid`)
VALUES
	(1,'Deborah Nagata','2018-03-02','Melekeok','Liz','2018-03-02','Magaria Tellei','2018-03-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(2,'Liz','2018-03-02','Airai Elem','Liz','2018-03-02','Sidney Rengulbai','2018-03-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(3,'Liz','2018-03-02','Meyuns Elem','Liz','2018-03-02','Lucia Tabelual','2018-03-02','Partial','2018-03-02',NULL,NULL,NULL,NULL,NULL,''),
	(4,'Liz','2018-03-02','GBH Elem','Liz','2018-03-02','Wycliff Emul','2018-03-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');

/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table distributions_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `distributions_items`;

CREATE TABLE `distributions_items` (
  `distributionItemId` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `distributionId` int(4) DEFAULT NULL,
  `receivingItemId` int(5) DEFAULT NULL,
  `requisitionItemId` int(5) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `assetTag` varchar(10) DEFAULT NULL,
  `modelNo` varchar(20) DEFAULT NULL,
  `serialNo` varchar(20) DEFAULT NULL,
  `isValid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`distributionItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `distributions_items` WRITE;
/*!40000 ALTER TABLE `distributions_items` DISABLE KEYS */;

INSERT INTO `distributions_items` (`distributionItemId`, `distributionId`, `receivingItemId`, `requisitionItemId`, `quantity`, `assetTag`, `modelNo`, `serialNo`, `isValid`)
VALUES
	(1,1,1,1,1.000,'MP-27928','EB535W3','VF9F790047L',''),
	(2,1,1,1,1.000,'MP-27929','EB535W3','VF9F790055L',''),
	(3,1,1,1,1.000,'MP-27930','EB535W3','VF9F790071L',''),
	(4,1,1,1,1.000,'MP-27931','EB535W3','VF9F7Y0032L',''),
	(5,2,1,1,1.000,'MP-27923','EB535W3','VF9F790046L',''),
	(6,2,1,1,1.000,'MP-27924','EB535W3','VF9F790045L',''),
	(7,2,1,1,1.000,'MP-27925','EB535W3','VF9F790053L',''),
	(8,2,1,1,1.000,'MP-27926','EB535W3','VF9F790049L',''),
	(9,2,1,1,1.000,'MP-27927','EB535W3','VF9F790057L',''),
	(10,3,1,1,1.000,'MP-27919','EB535W3','VF9F790063L',''),
	(11,3,1,1,1.000,'MP-27920','EB535W3','VF9F790058L',''),
	(12,3,1,1,1.000,'MP-27921','EB535W3','VF9F790050L',''),
	(13,3,1,1,1.000,'MP-27922','EB535W3','VF9F790054L',''),
	(14,4,1,1,1.000,'MP-27912','EB535W3','VF9F790063L',''),
	(15,4,1,1,1.000,'MP-27913','EB535W3','VF9F790061L',''),
	(16,4,1,1,1.000,'MP-27914','EB535W3','VF9F790070L',''),
	(17,4,1,1,1.000,'MP-27915','EB535W3','VF9F7Y0044L',''),
	(18,4,1,1,1.000,'MP-27916','EB535W3','VF9F790056L',''),
	(19,4,1,1,1.000,'MP-27917','EB535W3','VF9F790073L',''),
	(20,4,1,1,1.000,'MP-27918','EB535W3','VF9F790072L','');

/*!40000 ALTER TABLE `distributions_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table receiving
# ------------------------------------------------------------

DROP TABLE IF EXISTS `receiving`;

CREATE TABLE `receiving` (
  `receivingId` int(4) NOT NULL AUTO_INCREMENT,
  `requisitionId` int(4) DEFAULT NULL,
  `initiatingOffice` varchar(30) DEFAULT NULL,
  `requestedBy` varchar(30) DEFAULT NULL,
  `requestedDate` date DEFAULT NULL,
  `preparedById` int(5) DEFAULT NULL,
  `preparedByName` varchar(30) DEFAULT NULL,
  `preparedDate` date DEFAULT NULL,
  `justification` varchar(255) DEFAULT NULL,
  `numItems` int(4) DEFAULT NULL,
  `authNo` varchar(12) DEFAULT NULL,
  `authDate` date DEFAULT NULL,
  `authAmount` decimal(10,3) DEFAULT NULL,
  `rcvDate` date DEFAULT NULL,
  `rcvBy` varchar(30) DEFAULT NULL,
  `invoiceNo` varchar(12) DEFAULT NULL,
  `invoiceAmount` decimal(10,3) DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `statusDate` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT '',
  `isValid` varchar(20) NOT NULL DEFAULT '',
  `enteredBy` int(5) DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `modifiedBy` int(5) DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  PRIMARY KEY (`receivingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `receiving` WRITE;
/*!40000 ALTER TABLE `receiving` DISABLE KEYS */;

INSERT INTO `receiving` (`receivingId`, `requisitionId`, `initiatingOffice`, `requestedBy`, `requestedDate`, `preparedById`, `preparedByName`, `preparedDate`, `justification`, `numItems`, `authNo`, `authDate`, `authAmount`, `rcvDate`, `rcvBy`, `invoiceNo`, `invoiceAmount`, `invoiceDate`, `status`, `statusDate`, `remarks`, `isValid`, `enteredBy`, `enteredDate`, `modifiedBy`, `modifiedDate`)
VALUES
	(1,1,'PREP Program','Debbie Sbal','2017-08-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-14','Edwin, Liz','INV11815',127680.000,'2017-12-14',NULL,NULL,'','',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `receiving` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table receiving_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `receiving_items`;

CREATE TABLE `receiving_items` (
  `receivingItemId` int(5) NOT NULL AUTO_INCREMENT,
  `receivingId` int(4) DEFAULT NULL,
  `requisitionId` int(5) DEFAULT NULL,
  `requisitionItemId` int(5) DEFAULT NULL,
  `org` varchar(4) DEFAULT NULL,
  `costCenter` varchar(10) DEFAULT NULL,
  `acc` varchar(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `extended` decimal(10,3) DEFAULT NULL,
  `isValid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`receivingItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `receiving_items` WRITE;
/*!40000 ALTER TABLE `receiving_items` DISABLE KEYS */;

INSERT INTO `receiving_items` (`receivingItemId`, `receivingId`, `requisitionId`, `requisitionItemId`, `org`, `costCenter`, `acc`, `description`, `quantity`, `unit`, `price`, `extended`, `isValid`)
VALUES
	(1,1,NULL,1,NULL,NULL,NULL,'EPSON POWERLITE EB-535W 3 LCD PROJECTOR',80.000,'ea',1596.000,127680.000,'');

/*!40000 ALTER TABLE `receiving_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table requisitions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requisitions`;

CREATE TABLE `requisitions` (
  `requisitionId` int(11) NOT NULL AUTO_INCREMENT,
  `requisitionNo` varchar(10) DEFAULT NULL,
  `initiatingOffice` varchar(30) DEFAULT NULL,
  `requestedBy` varchar(30) DEFAULT NULL,
  `requestedDate` date DEFAULT NULL,
  `preparedById` int(5) DEFAULT NULL,
  `preparedByName` varchar(30) DEFAULT NULL,
  `preparedDate` date DEFAULT NULL,
  `vendorId` int(4) DEFAULT NULL,
  `vendorName` varchar(45) DEFAULT NULL,
  `justification` varchar(520) DEFAULT NULL,
  `numItems` int(4) DEFAULT NULL,
  `rqAmount` decimal(10,3) DEFAULT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `approvedDate` date DEFAULT NULL,
  `mofDeliveredDate` date DEFAULT NULL,
  `poType` varchar(10) DEFAULT NULL,
  `poNo` varchar(10) DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `poAmount` decimal(10,3) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `statusDate` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT '',
  `enteredBy` int(5) DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `modifiedBy` int(5) DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `isValid` varchar(20) NOT NULL,
  PRIMARY KEY (`requisitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `requisitions` WRITE;
/*!40000 ALTER TABLE `requisitions` DISABLE KEYS */;

INSERT INTO `requisitions` (`requisitionId`, `requisitionNo`, `initiatingOffice`, `requestedBy`, `requestedDate`, `preparedById`, `preparedByName`, `preparedDate`, `vendorId`, `vendorName`, `justification`, `numItems`, `rqAmount`, `quotationId`, `approvedDate`, `mofDeliveredDate`, `poType`, `poNo`, `poDate`, `poAmount`, `status`, `statusDate`, `remarks`, `enteredBy`, `enteredDate`, `modifiedBy`, `modifiedDate`, `isValid`)
VALUES
	(1,NULL,'PREP Program','Debbie Sbal',NULL,3999,'Ameeshi Goel','2017-08-28',13,NULL,'Request open purchase order for Ministry of Education, Bureau of Curriculum & Instruction for Classroom Digital Technology Component and accessories.Refer to IFB:16-17.',NULL,NULL,NULL,'2017-08-31','2017-09-01','R','L72089','2017-09-08',127680.000,NULL,NULL,NULL,3999,'2018-08-29',3999,'2018-08-29',''),
	(2,NULL,'PREP Program','Debbie Sbal','0000-00-00',3999,'Ameeshi Goel','2017-08-28',13,NULL,'Request open purchase order for Ministry of Education, Bureau of Curriculum & Instruction for Classroom Digital Technology Component and accessories.Refer to IFB:16-17.',NULL,NULL,NULL,'2017-08-31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3999,'2018-08-29',NULL,NULL,'');

/*!40000 ALTER TABLE `requisitions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table requisitions_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requisitions_items`;

CREATE TABLE `requisitions_items` (
  `requisitionItemId` int(11) NOT NULL AUTO_INCREMENT,
  `requisitionId` int(4) DEFAULT NULL,
  `org` varchar(4) DEFAULT NULL,
  `costCenter` varchar(10) DEFAULT NULL,
  `task` varchar(10) DEFAULT NULL,
  `opt` varchar(10) DEFAULT NULL,
  `acc` varchar(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `extended` decimal(10,3) DEFAULT NULL,
  `sequenceNo` int(3) DEFAULT NULL,
  `isValid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`requisitionItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `requisitions_items` WRITE;
/*!40000 ALTER TABLE `requisitions_items` DISABLE KEYS */;

INSERT INTO `requisitions_items` (`requisitionItemId`, `requisitionId`, `org`, `costCenter`, `task`, `opt`, `acc`, `description`, `quantity`, `unit`, `price`, `extended`, `sequenceNo`, `isValid`)
VALUES
	(1,1,'3650','E73650','E05','000','1555','EPSON POWERLITE EB-535W 3 LCD PROJECTOR',80.000,'ea',1596.000,127680.000,NULL,'');

/*!40000 ALTER TABLE `requisitions_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vendors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `vendorId` int(11) NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(45) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `enteredBy` int(5) DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `modifiedBy` int(5) DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;

INSERT INTO `vendors` (`vendorId`, `vendorName`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `phone`, `fax`, `email`, `website`, `enteredBy`, `enteredDate`, `modifiedBy`, `modifiedDate`)
VALUES
	(1,'Ksau Motors','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-1912','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'Flamingo Restaurant','P.O. Box 487','','Koror','Palau','96940','Republic of Palau','(680) 488-8072','',NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'Best Coffee & Donut House','P.O. Box 212','','Koror','Palau','96940','Republic of Palau','(680) 488-8025','',NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'Mason\'s Hardware','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(5,'W.C.T.C Ace Hardware','P.O. Box 280','','Koror','Palau','96940','Republic of Palau','(680) 488-1552','(680) 488-4189',NULL,NULL,NULL,NULL,NULL,NULL),
	(6,'Ngiratkel Etpison Company Inc.','','Ngetkib, Airai','Koror','Palau','96940','Republic of Palau','(680) 587-2031','(680) 587-2071',NULL,NULL,NULL,NULL,NULL,NULL),
	(7,'West Office Supply','P.O. Box 280','','Koror','Palau','96940','Republic of Palau','(680) 488-2363','(680) 488-5610',NULL,NULL,NULL,NULL,NULL,NULL),
	(8,'Palau Shipping Co. Inc.','P.O. Box 6000','Port Area, Malakal','Koror','Palau','96940','Republic of Palau','(680) 488-2629','(680) 488-1095',NULL,NULL,NULL,NULL,NULL,NULL),
	(9,'Midtown Service Center','P.O. Box 9064','','Koror','Palau','96940','Republic of Palau','(680) 488-2245','(680) 488-6484',NULL,NULL,NULL,NULL,NULL,NULL),
	(10,'NECO Yamaha Corporation','P.O. Box 129','','Koror','Palau','96940','Republic of Palau','(680) 488-1100','(680) 488-1804',NULL,NULL,NULL,NULL,NULL,NULL),
	(11,'IP&E Palau Inc.','P.O. Box 1678','','Koror','Palau','96940','Republic of Palau','(680) 488-6464','(680) 488-6363',NULL,NULL,NULL,NULL,NULL,NULL),
	(12,'Mason\'s Hardware Do-It Center','P.O. Box 295',NULL,'Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(13,'Jezrrae Wear II','P.O. Box 7048',NULL,'Koror','Palau','96940','Republic of Palau','(680) 488-2662','(680) 488-2005',NULL,NULL,NULL,NULL,NULL,NULL),
	(14,'Mason\'s Mercury Marine','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','',NULL,NULL,NULL,NULL,NULL,NULL),
	(15,'IR Motors','P.O. Box 9064','','Koror','Palau','96940','Republic of Palau','(680) 488-5600','(680) 488-7433',NULL,NULL,NULL,NULL,NULL,NULL),
	(16,'W.C.T.C BF-Department Store','P.O. Box 280',NULL,'Koror','Palau','96940',NULL,'(680)488-1633','(680) 488-8523',NULL,NULL,NULL,NULL,NULL,NULL),
	(17,'Accrediting Commission for Schools','Western Association of Schools and Colleges (','533 Airport Boulevard, Suite 200','Burlingame','CA','94010',NULL,'(650) 696-1060','(650) 696-1867',NULL,NULL,NULL,NULL,NULL,NULL),
	(18,'Sarahs Yum Yum','Koror, Palau',NULL,'Koror','Palau','96940',NULL,'(650) 488-5590',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(19,'KR Construction','P.O. Box 2000','Koror, Palau','Koror','Palau','96940',NULL,'(650) 488--5865',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(20,'Palau National Communication Corporation (PNC','P.O.Box 99','Koror , Palau','Koror','Palau','96940',NULL,'(680) 4888-9600','(680) 488-9090',NULL,NULL,NULL,NULL,NULL,NULL),
	(21,'Surangel & Son\'s Company','P.O.Box 295','Republic of Palau','Koror','Palau','96940',NULL,'(680) 488-2608','(680)488-1535',NULL,NULL,NULL,NULL,NULL,NULL),
	(22,'Pacific Mission Aviation','P.O.Box 906','Koror, Republic of Palau','Koror','Palau','96940',NULL,'(680) 587-4567','(680) 778-2747',NULL,NULL,NULL,NULL,NULL,NULL),
	(23,'Yuhi Hotel',NULL,'Koror, Republic of Palau','Koror','Palau','96940',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(24,'Test Vendor','Test address',NULL,'Koror','PW','96940',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(25,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(26,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(27,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(28,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(29,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(30,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(31,'Mason\'s Hardware Do-It Center','P.O. Box 295 xxx',NULL,'Koror','Palau','96940',NULL,'(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
	(32,'Test Vendor','Test address1','test address2','Koror','PW','96940',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(33,'Test Vendor','Test address1','test address2','Koror','PW','96940',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(34,'Test Vendor','Test address1','test address2','Koror','PW','96940',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
