# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 10.0.0.237 (MySQL 5.6.10)
# Database: finance4
# Generation Time: 2018-09-14 01:58:25 +0000
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
	(1,NULL,'PREP Program','Debbie Sbal','2017-08-27',3999,'Ameeshi Goel','2017-08-28',13,NULL,'Request open purchase order for Ministry of Education, Bureau of Curriculum & Instruction for Classroom Digital Technology Component and accessories.Refer to IFB:16-17.',NULL,NULL,NULL,'2017-08-31','2017-09-01','R','L72089','2017-09-08',127680.000,NULL,NULL,NULL,3999,'2018-08-29',71,'2018-09-12',''),
	(2,NULL,'PREP Program','Debbie Sbal','0000-00-00',3999,'Ameeshi Goel','2017-08-28',13,NULL,'Request open purchase order for Ministry of Education, Bureau of Curriculum & Instruction for Classroom Digital Technology Component and accessories.Refer to IFB:16-17.',NULL,NULL,NULL,'2017-08-31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3999,'2018-08-29',NULL,NULL,''),
	(3,NULL,'BOEA','Bonnie Imeong','2017-10-04',2709,'Bonnie Imeong','2017-10-04',4,NULL,'Requesting items to help unloading school instructional materials and supplies for Sonsorol Elementary School.',NULL,NULL,NULL,'2017-10-05',NULL,'R','L80014','2017-10-09',119.980,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(4,NULL,'BOEA','Bonnie Imeong','2017-10-04',2709,'Bonnie Imeong','2017-10-04',4,NULL,'Requesting items to help unloading school instructional materials and supplies for Sonsorol Elementary School.',NULL,NULL,NULL,'2017-10-05',NULL,'R','L80014','2017-10-09',119.980,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(5,NULL,'Division of School Management','Bonnie Imeong','2017-10-11',2709,'Bonnie Imeong','2017-10-11',5,NULL,'Requesting items to be used G.B Harris Elementary School',NULL,NULL,NULL,'2017-10-11',NULL,NULL,'L80043',NULL,NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(6,NULL,'Division of School Management','Bonnie Imeong','2017-10-11',2709,'Bonnie Imeong','2017-10-11',5,NULL,'Requesting items to be used G.B Harris Elementary School',NULL,NULL,NULL,'2017-10-11',NULL,NULL,'L80043',NULL,NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(7,NULL,'Division of School Management','Bonnie Imeong','2017-10-11',2709,'Bonnie Imeong','2017-10-11',4,'Mason\'s Hardware','Requesting items to be used at Meyuns and G.B Harris Elementary School',NULL,NULL,NULL,'2017-10-11',NULL,NULL,'L80044','2017-10-17',224.750,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(8,NULL,'Division of School Management','Bonnie Imeong','2017-10-11',2709,'Bonnie Imeong','2017-10-11',4,'Mason\'s Hardware','Requesting items to be used at Meyuns and G.B Harris Elementary School',NULL,NULL,NULL,'2017-10-11',NULL,NULL,'L80044','2017-10-17',224.750,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(9,NULL,'BOEA','Bonnie Imeong','2017-10-16',2709,'Bonnie Imeong','2017-10-16',7,'West Office Supply','Request to purchase additional paper to print Report for all Public Elementary Schools',NULL,NULL,NULL,'2017-10-17',NULL,NULL,'L80065','2017-10-19',600.000,NULL,NULL,NULL,2709,'2018-09-12',2709,'2018-09-12',''),
	(10,NULL,'BOEA','Bonnie Imeong','2017-10-16',2709,'Bonnie Imeong','2017-10-16',7,'West Office Supply','Request to purchase additional paper to print Report for all Public Elementary Schools',NULL,NULL,NULL,'2017-10-17',NULL,NULL,'L80065','2017-10-19',NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(11,NULL,'Division of School Management','Bonnie Imeong','2017-11-06',2709,'Bonnie Imeong','2017-11-06',7,'West Office Supply','Requesting items to be used to support school activities and programs at G.B Harris Elementary School',NULL,NULL,NULL,'2017-11-07',NULL,NULL,'L80189','2017-11-09',NULL,NULL,NULL,'RP#4671',2709,'2018-09-12',NULL,NULL,''),
	(12,NULL,'Division of School Management','Bonnie Imeong','2017-11-06',2709,'Bonnie Imeong','2017-11-06',7,'West Office Supply','Requesting items to be used to support school activities and programs at G.B Harris Elementary School',NULL,NULL,NULL,'2017-11-07',NULL,NULL,'L80189','2017-11-09',NULL,NULL,NULL,'RP#4671',2709,'2018-09-12',NULL,NULL,''),
	(13,NULL,'BOEA','Bonnie Imeong','2017-11-08',2709,'Bonnie Imeong','2017-11-08',4,'Mason\'s Hardware','Requesting items to be used at Meyuns Elementary School to prevent students from slipping, It will be used from each classrooms walking to the cafeteria',NULL,NULL,NULL,NULL,NULL,NULL,'L80214','2017-11-14',377.970,NULL,NULL,NULL,2709,'2018-09-12',2709,'2018-09-12',''),
	(14,NULL,'BOEA','Bonnie Imeong','2017-11-08',2709,'Bonnie Imeong','2017-11-08',4,'Mason\'s Hardware','Requesting items to be used at Meyuns Elementary School to prevent students from slipping, It will be used from each classrooms walking to the cafeteria',NULL,NULL,NULL,NULL,NULL,NULL,'L80214','2017-11-14',NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(15,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,'Mason\'s Hardware','Requesting to purchase items to repair classrooms and main office at Airai Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80251','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(16,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,'Mason\'s Hardware','Requesting to purchase items to repair classrooms and main office at Airai Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80251','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(17,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,'Mason\'s Hardware','Requesting to purchase items to repair restrooms at Ibobang Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,'R','L80252','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-12',2709,'2018-09-12',''),
	(18,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong',NULL,4,'Mason\'s Hardware','Requesting to purchase items to repair restrooms at Ibobang Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80252','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-12',NULL,NULL,''),
	(19,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,NULL,'Requesting to purchase items to repair restrooms at G.B. Harris Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80253','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(20,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,NULL,'Requesting to purchase items to repair restrooms at G.B. Harris Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80253','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(21,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,'Mason\'s Hardware','Requesting to purchase items to repair classrooms, restrooms and kitchen at Melekeok Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80254','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(22,NULL,'BOEA','Bonnie Imeong','2017-11-10',2709,'Bonnie Imeong','2017-11-10',4,'Mason\'s Hardware','Requesting to purchase items to repair classrooms, restrooms and kitchen at Melekeok Elementary School',NULL,NULL,NULL,'2017-11-13',NULL,NULL,'L80254','2017-11-20',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(23,NULL,'Division of School Management','Bonnie Imeong','2017-11-27',2709,'Bonnie Imeong','2017-11-27',4,'Mason\'s Hardware','Requesting items to be used at Peleliu Elementary School to clean and maintain the school campus and facility',NULL,NULL,NULL,'2017-11-29',NULL,NULL,'L80335','2017-12-04',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(24,NULL,'Division of School Management','Bonnie Imeong','2017-11-27',2709,'Bonnie Imeong','2017-11-27',4,'Mason\'s Hardware','Requesting items to be used at Peleliu Elementary School to clean and maintain the school campus and facility',NULL,NULL,NULL,'2017-11-29',NULL,NULL,'L80335','2017-12-04',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(25,NULL,'Division of School Management','Bonnie Imeong','2017-11-27',2709,'Bonnie Imeong','2017-11-27',4,'Mason\'s Hardware','Requesting to purchase maintenance tools to be used to repair & maintain Peleliu Elementary School Facility',NULL,NULL,NULL,'2017-11-29',NULL,NULL,'L80336','2017-12-04',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(26,NULL,'Division of School Management','Bonnie Imeong','2017-11-27',2709,'Bonnie Imeong','2017-11-27',4,'Mason\'s Hardware','Requesting to purchase maintenance tools to be used to repair & maintain Peleliu Elementary School Facility',NULL,NULL,NULL,'2017-11-29',NULL,NULL,'L80336','2017-12-04',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(27,NULL,'BOEA','Bonnie Imeong','2017-11-30',2709,'Bonnie Imeong','2017-11-30',4,'Mason\'s Hardware','Requesting to purchase order for items to replace air conditions at Palau High School (English & Palauan Department), as they are old and can no longer be repaired.',NULL,NULL,NULL,'2017-11-30',NULL,NULL,'L80349','2017-12-05',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(28,NULL,'BOEA','Bonnie Imeong','2017-11-30',2709,'Bonnie Imeong','2017-11-30',4,'Mason\'s Hardware','Requesting to purchase order for items to replace air conditions at Palau High School (English & Palauan Department), as they are old and can no longer be repaired.',NULL,NULL,NULL,'2017-11-30',NULL,NULL,'L80349','2017-12-05',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(29,NULL,'BOEA','Bonnie Imeong','2017-11-30',2709,'Bonnie Imeong','2017-11-30',16,'W.C.T.C BF-Department Store','Requesting to purchase order for items to be used by the Ministry of Education for hosting of the 2017 Children\'s Christmas Program on December 12, 2017 at 7:30pm/Bethlehem Park',NULL,NULL,NULL,NULL,NULL,NULL,'L80372','2017-12-07',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(30,NULL,'BOEA','Bonnie Imeong','2017-11-30',2709,'Bonnie Imeong','2017-11-30',16,'W.C.T.C BF-Department Store','Requesting to purchase order for items to be used by the Ministry of Education for hosting of the 2017 Children\'s Christmas Program on December 12, 2017 at 7:30pm/Bethlehem Park',NULL,NULL,NULL,NULL,NULL,NULL,'L80372','2017-12-07',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(31,NULL,'Division of School Management','Bonnie Imeong','2017-12-07',2709,'Bonnie Imeong','2017-12-07',4,'Mason\'s Hardware','Requesting items to Koror Elementary School Cafeteria to help to reduce heat inside the kitchen',NULL,NULL,NULL,'2017-12-07',NULL,NULL,'L80407','2017-12-12',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(32,NULL,'Division of School Management','Bonnie Imeong','2017-12-07',2709,'Bonnie Imeong','2017-12-07',4,'Mason\'s Hardware','Requesting items to Koror Elementary School Cafeteria to help to reduce heat inside the kitchen',NULL,NULL,NULL,'2017-12-07',NULL,NULL,'L80407','2017-12-12',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(33,NULL,'BOEA','Bonnie Imeong','2017-12-21',2709,'Bonnie Imeong','2017-12-21',4,'Mason\'s Hardware','Request to purchase additional materials to renovate kitchen at Melekeok Elementary School',NULL,NULL,NULL,'2017-12-21',NULL,NULL,'L80497','2017-12-27',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(34,NULL,'BOEA','Bonnie Imeong','2017-12-21',2709,'Bonnie Imeong','2017-12-21',4,'Mason\'s Hardware','Request to purchase additional materials to renovate kitchen at Melekeok Elementary School',NULL,NULL,NULL,'2017-12-21',NULL,NULL,'L80497','2017-12-27',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(35,NULL,'BOEA','Bonnie Imeong','2017-12-18',2709,'Bonnie Imeong','2017-12-18',5,'W.C.T.C Ace Hardware','Requesting to purchase items to change rusted and leaking roofs at Polo Anna Elementary School',NULL,NULL,NULL,'2017-12-20',NULL,NULL,'L80498','2017-12-27',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(36,NULL,'BOEA','Bonnie Imeong','2017-12-18',2709,'Bonnie Imeong','2017-12-18',5,'W.C.T.C Ace Hardware','Requesting to purchase items to change rusted and leaking roofs at Polo Anna Elementary School',NULL,NULL,NULL,'2017-12-20',NULL,NULL,'L80498','2017-12-27',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,''),
	(37,NULL,'BOEA','Bonnie Imeong','2018-01-01',2709,'Bonnie Imeong','2018-09-13',18,'Sarahs Yum Yum','Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17, 2018 @ Palau High School Multi-Purpose Building.',NULL,NULL,NULL,'2018-01-15',NULL,NULL,'L80591','2018-01-17',NULL,NULL,NULL,NULL,2709,'2018-09-13',2709,'2018-09-13',''),
	(38,NULL,'BOEA','Bonnie Imeong','2018-01-01',2709,'Bonnie Imeong','2018-09-13',18,'Sarahs Yum Yum','Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17, 2018 @ Palau High School Multi-Purpose Building.',NULL,NULL,NULL,'2018-01-15',NULL,NULL,'L80591','2018-01-17',NULL,NULL,NULL,NULL,2709,'2018-09-13',NULL,NULL,'');

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
	(1,1,'3650','E73650','E05','000','1555','EPSON POWERLITE EB-535W 3 LCD PROJECTOR',80.000,'ea',1596.000,127680.000,NULL,''),
	(2,3,'1322','EBOE03','OPR',NULL,'1420','Tire, Wheelbarrow',2.000,'each',59.990,119.980,NULL,''),
	(3,5,'1322','EBOE03','OPR',NULL,'1420','Trimmer Head',4.000,'Each',26.250,105.000,NULL,''),
	(4,5,'1322','EBOE03','OPR',NULL,'1420','Mop Head',10.000,'Each',8.850,88.500,NULL,''),
	(5,5,'1322','EBOE03','OPR',NULL,'1420','Mop Handle',10.000,'Each',14.750,147.500,NULL,''),
	(6,7,'1322','EBOE03',NULL,'OPR','1420','Light Bulb (indoor/outdoor)',25.000,'Each',8.990,224.750,NULL,''),
	(7,9,'1301','ESBS01',NULL,'OPR','1420','Index Paper, 8.5 X 14',2000.000,'Each',0.300,600.000,NULL,''),
	(8,11,'1301','ESBS01',NULL,'OPR','1555','Copier, Canon IR 2525',1.000,'Each',6850.000,6850.000,NULL,''),
	(9,13,'1322','EBOE03',NULL,'OPR','1420','No Slip Tape 4\"',3.000,'Each',125.990,377.970,NULL,''),
	(10,15,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Rib Blue 32 X 10',30.000,'Each',19.990,599.700,NULL,''),
	(11,15,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Galvalume 26GA 32X12',30.000,'Each',24.990,749.700,NULL,''),
	(12,15,'1322','EBOE03',NULL,'OPR','1420','Flat Tin, 28 Gauge 4X8',18.000,'Each',24.990,449.820,NULL,''),
	(13,15,'1322','EBOE03',NULL,'OPR','1420','Ridge Cap, Blue 8',8.000,'Each',5.490,43.920,NULL,''),
	(14,15,'1322','EBOE03',NULL,'OPR','1420','Paint, Acrylic Roof Azure Blue Gloss WEL',10.000,'Gal.',22.990,229.900,NULL,''),
	(15,17,'1322','EBOE03',NULL,'OPR','1420','Toilet, Elongated PRO-\'Fit 2',2.000,'Each',157.990,315.980,NULL,''),
	(16,17,'1322','EBOE03',NULL,'OPR','1420','Cement, White 50KG',7.000,'Each',2.190,15.330,NULL,''),
	(17,19,'1322','EBOE03',NULL,'OPR','1420','Toilet, Elongated PRO-\'Fit 2',5.000,'Each',157.990,789.950,NULL,''),
	(18,21,'1322','EBOE03',NULL,'OPR','1420','Ridge Cap, Blue 8',30.000,'Each',5.490,164.700,NULL,''),
	(19,21,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Galvalume 26GA 32X12',30.000,'Each',24.990,749.700,NULL,''),
	(20,21,'1322','EBOE03',NULL,'OPR','1420','Plywood ACX 1/4 Untreated',20.000,'Each',46.990,939.800,NULL,''),
	(21,21,'1322','EBOE03',NULL,'OPR','1420','Lumber, Treated 2X2X16DF',30.000,'Each',8.290,248.700,NULL,''),
	(22,21,'1322','EBOE03',NULL,'OPR','1420','Nail Roofing 2-1/2  w/rubber',50.000,'Lbs.',1.990,99.500,NULL,''),
	(23,21,'1322','EBOE03',NULL,'OPR','1420','Roof Cement, wet/dry Fiber Plastic',5.000,'Gal.',15.990,79.950,NULL,''),
	(24,23,'1322','EBOE03',NULL,'OPR','1420','Lawn Mower, Push Gas 21\" Deck',1.000,'Each',269.990,269.990,NULL,''),
	(25,23,'1322','EBOE03',NULL,'OPR','1420','Blower, Backpack 2-cycle',1.000,'Each',489.000,489.000,NULL,''),
	(26,23,'1322','EBOE03',NULL,'OPR','1420','Trimmer/Green Machine',2.000,'Each',299.990,599.980,NULL,''),
	(27,25,'1322','EBOE03',NULL,'OPR','1420','Tool Box 24\" Plastic',1.000,'Each',34.990,34.990,NULL,''),
	(28,25,'1322','EBOE03',NULL,'OPR','1420','Tool Set, 83 pcs. auto',1.000,'Each',29.990,29.990,NULL,''),
	(29,25,'1322','EBOE03',NULL,'OPR','1420','Square,Combination Plastic',1.000,'Each',6.990,6.990,NULL,''),
	(30,25,'1322','EBOE03',NULL,'OPR','1420','Pliers 9.5\"',1.000,'Each',37.990,37.990,NULL,''),
	(31,25,'1322','EBOE03',NULL,'OPR','1420','Pliers, 12\" V TG/GRV',1.000,'Each',13.990,13.990,NULL,''),
	(32,25,'1322','EBOE03',NULL,'OPR','1420','Pliers, 8\" Long Nose',1.000,'Each',24.990,24.990,NULL,''),
	(33,25,'1322','EBOE03',NULL,'OPR','1420','Pliers, 10\" TG/GRV',1.000,'Each',19.990,19.990,NULL,''),
	(34,25,'1322','EBOE03',NULL,'OPR','1420','Snip, Left Cut 9-3/4\" MIR',1.000,'Each',18.990,18.990,NULL,''),
	(35,25,'1322','EBOE03',NULL,'OPR','1420','Pliers, Locking Set Fast Release',1.000,'Each',39.990,39.990,NULL,''),
	(36,25,'1322','EBOE03',NULL,'OPR','1420','Tool Set (Blade, Measuring Tape, Marker)',1.000,'Each',29.990,29.990,NULL,''),
	(37,25,'1322','EBOE03',NULL,'OPR','1420','Screwdriver, 8 pcs. Set',1.000,'Each',25.990,25.990,NULL,''),
	(38,25,'1322','EBOE03',NULL,'OPR','1420','Hacksaw, Frame',1.000,'Each',6.990,6.990,NULL,''),
	(39,25,'1322','EBOE03',NULL,'OPR','1420','Square, Carpenter 8X12 STL',1.000,'Each',5.490,5.490,NULL,''),
	(40,25,'1322','EBOE03',NULL,'OPR','1420','Blade, Hacksaw High Speed Steel',1.000,'Each',4.490,4.490,NULL,''),
	(41,25,'1322','EBOE03',NULL,'OPR','1420','Handsaw, 15\" 9ft. Short Cut',1.000,'Each',19.990,19.990,NULL,''),
	(42,25,'1322','EBOE03',NULL,'OPR','1420','Chisel, Set 3pcs. Wood',1.000,'Each',14.990,14.990,NULL,''),
	(43,25,'1322','EBOE03',NULL,'OPR','1420','Blade, Utility Dispenser 025\'',1.000,'Each',3.790,3.790,NULL,''),
	(44,25,'1322','EBOE03',NULL,'OPR','1420','Hammer, Claw Wood Handle 16oz.',1.000,'Each',6.990,6.990,NULL,''),
	(45,25,'1322','EBOE03',NULL,'OPR','1420','Hammer, Claw Wood Handle 7oz.',1.000,'Each',4.990,4.990,NULL,''),
	(46,27,'1322','EBOE03',NULL,'OPR','1420','Air Condition, Split Unit 12000 BTU',1.000,'Each',409.000,409.000,NULL,''),
	(47,27,'1322','EBOE03',NULL,'OPR','1420','Air Condition, Split Unit 24000BTU',1.000,'Each',699.000,699.000,NULL,''),
	(48,27,'1322','EBOE03',NULL,'OPR','1420','Air Condition, Split Unit 24000 BTU',1.000,'Each',699.000,699.000,NULL,''),
	(49,27,'1322','EBOE03',NULL,'OPR','1420','Air Condition, Split Unit 24000BRU',2.000,'Each',699.000,1398.000,NULL,''),
	(50,29,'1302','EBOE03',NULL,'OPR','1616','Gift Bag',500.000,'Each',0.750,375.000,NULL,''),
	(51,29,'1302','EBOE03',NULL,'OPR','1616','Crayons, Bazic 8 premium quantity',165.000,'Each',0.850,140.250,NULL,''),
	(52,29,'1302','EBOE03',NULL,'OPR','1616','Color Book w/stickers',500.000,'Each',0.850,425.000,NULL,''),
	(53,29,'1302','EBOE03',NULL,'OPR','1616','School Set. RS 1000 assorted',41.000,'Each',0.860,35.260,NULL,''),
	(54,29,'1302','EBOE03',NULL,'OPR','1616','Pencil, Basic Fluorescent 8pk/24',500.000,'Each',0.450,225.000,NULL,''),
	(55,29,'1302','EBOE03',NULL,'OPR','1616','Assorted Snacks',500.000,'Each',0.400,200.000,NULL,''),
	(56,29,'1302','EBOE03',NULL,'OPR','1616','Party Favors',500.000,'Each',0.700,350.000,NULL,''),
	(57,31,'1322','EBOE03',NULL,'OPR','1420','Ventilator',2.000,'Each',79.990,159.980,NULL,''),
	(58,33,'1322','EBOE03',NULL,'OPR','1420','Plywood ACX 1/4',40.000,'Each',46.990,1879.600,NULL,''),
	(59,33,'1322','EBOE03',NULL,'OPR','1420','Lumber 2X2X16',50.000,'Each',9.090,454.500,NULL,''),
	(60,33,'1322','EBOE03',NULL,'OPR','1420','Wire 10-2',1.000,'Roll',122.500,122.500,NULL,''),
	(61,33,'1322','EBOE03',NULL,'OPR','1420','Wire 14-2',1.000,'Roll',97.500,97.500,NULL,''),
	(62,33,'1322','EBOE03',NULL,'OPR','1420','Lamp Holder',10.000,'Each',3.790,37.900,NULL,''),
	(63,33,'1322','EBOE03',NULL,'OPR','1420','Screen 48X100',1.000,'Roll',119.000,119.000,NULL,''),
	(64,33,'1322','EBOE03',NULL,'OPR','1420','Wire Mesh 1X4X100',1.000,'Each',299.000,299.000,NULL,''),
	(65,33,'1322','EBOE03',NULL,'OPR','1420','Hinge, SS 4X4',12.000,'Each',7.490,89.880,NULL,''),
	(66,33,'1322','EBOE03',NULL,'OPR','1420','Spring Extension ',4.000,'Each',5.990,23.960,NULL,''),
	(67,33,'1322','EBOE03',NULL,'OPR','1420','Brush 4\"',4.000,'Each',3.990,15.960,NULL,''),
	(68,33,'1322','EBOE03',NULL,'OPR','1420','Brush 2\"',4.000,'Each',1.190,4.760,NULL,''),
	(69,33,'1322','EBOE03',NULL,'OPR','1420','Roller Painting Set',4.000,'Set',11.990,47.960,NULL,''),
	(70,33,'1322','EBOE03',NULL,'OPR','1420','Paint, Primer Pail',3.000,'Pail',134.990,404.970,NULL,''),
	(71,33,'1322','EBOE03',NULL,'OPR','1420','Paint, Primer Pail',3.000,'Pail',209.990,629.970,NULL,''),
	(72,33,'1322','EBOE03',NULL,'OPR','1420','Paint, Light Brown/gal.',5.000,'Gal.',42.990,214.950,NULL,''),
	(73,33,'1322','EBOE03',NULL,'OPR','1420','Paint, Dark Brown/gal.',5.000,'Gal.',42.990,214.950,NULL,''),
	(74,35,'1322','EBOE03',NULL,'OPR','1420','Rib Roof 12ft. Blue',36.000,'Each',33.590,1209.240,NULL,''),
	(75,35,'1322','EBOE03',NULL,'OPR','1420','Rib Roof 8ft. Blue',36.000,'Each',21.990,791.640,NULL,''),
	(76,35,'1322','EBOE03',NULL,'OPR','1420','Ridge Cap 10ft. Blue',7.000,'Each',20.550,143.850,NULL,''),
	(77,35,'1322','EBOE03',NULL,'OPR','1420','Nail, Roofing 2-1/2',25.000,'Lbs.',1.950,48.750,NULL,''),
	(78,37,'1322','EBOE03',NULL,'OPR','1440','Prepacked: Beef Stew, Rice, Fruits & Water',80.000,'Pks.',9.000,720.000,NULL,'');

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
	(4,'Mason\'s Hardware','P.O. Box 295',NULL,'Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL,NULL,NULL,NULL,NULL),
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
	(23,'Yuhi Hotel',NULL,'Koror, Republic of Palau','Koror','Palau','96940',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
