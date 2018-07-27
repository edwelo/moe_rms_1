# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.40)
# Database: finance4
# Generation Time: 2018-07-26 04:02:31 +0000
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
  `isValid` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`distributionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;

INSERT INTO `distributions` (`distributionId`, `preparedBy`, `preparedDate`, `destination`, `deliveredBy`, `deliveredDate`, `receivedBy`, `receivedDate`, `status`, `statusDate`, `remarks`, `isValid`)
VALUES
	(1,'Bonnie','2017-11-26','MPC',NULL,NULL,'Totong','2017-11-26','closed','2017-11-26','Repaired and in good working order',''),
	(2,'Bonnie','2017-12-23','TTC',NULL,NULL,'Aileen','2017-12-23','delivered','2017-12-23','',''),
	(3,'Warren','2017-11-06','MOEIT',NULL,NULL,'Warren','2017-11-06','closed','2017-11-06','In service at MOEIT',''),
	(4,'Bonnie','2018-02-06','BEA-Transportation',NULL,NULL,'Godinez','2018-02-06','delivered','2018-02-06',NULL,''),
	(5,'Bonnie','2018-02-16','BEA-Transportation',NULL,NULL,'Godinez','2018-02-16','delivered','2018-02-16',NULL,''),
	(6,'Bonnie','2018-01-22','BEA',NULL,NULL,'Loi','2018-01-22','delivered','2018-01-22',NULL,'');

/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table distributions_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `distributions_items`;

CREATE TABLE `distributions_items` (
  `distributionItemId` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `distributionId` int(4) DEFAULT NULL,
  `receivingItemId` int(5) DEFAULT NULL,
  `receivingId` int(5) DEFAULT NULL,
  `requisitionItemId` int(5) DEFAULT NULL,
  `requisitionId` int(5) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `assetTag` varchar(10) DEFAULT NULL,
  `modelNo` varchar(20) DEFAULT NULL,
  `serialNo` varchar(20) DEFAULT NULL,
  `isValid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`distributionItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `distributions_items` WRITE;
/*!40000 ALTER TABLE `distributions_items` DISABLE KEYS */;

INSERT INTO `distributions_items` (`distributionItemId`, `distributionId`, `receivingItemId`, `receivingId`, `requisitionItemId`, `requisitionId`, `quantity`, `assetTag`, `modelNo`, `serialNo`, `isValid`)
VALUES
	(32,1,6,6,24,20,1.000,NULL,NULL,NULL,''),
	(33,1,7,6,25,20,1.000,NULL,NULL,NULL,''),
	(34,1,8,6,26,20,2.000,NULL,NULL,NULL,''),
	(35,1,9,6,27,20,6.000,NULL,NULL,NULL,''),
	(36,1,10,6,28,20,1.000,NULL,NULL,NULL,''),
	(37,2,11,2,64,2,30.000,NULL,NULL,NULL,''),
	(38,2,12,2,64,2,1.000,NULL,NULL,NULL,''),
	(39,2,13,2,64,2,30.000,NULL,NULL,NULL,''),
	(40,3,15,3,132,6,1.000,NULL,NULL,NULL,''),
	(41,4,16,8,1,1,24.000,NULL,NULL,NULL,''),
	(42,5,17,9,1,1,8.000,NULL,NULL,NULL,''),
	(43,5,18,9,1,1,3.000,NULL,NULL,NULL,''),
	(44,5,19,9,1,1,3.000,NULL,NULL,NULL,''),
	(45,6,20,10,64,2,1.000,NULL,NULL,NULL,''),
	(46,6,21,10,64,2,1.000,NULL,NULL,NULL,''),
	(47,6,22,10,64,2,50.000,NULL,NULL,NULL,'');

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
  PRIMARY KEY (`receivingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `receiving` WRITE;
/*!40000 ALTER TABLE `receiving` DISABLE KEYS */;

INSERT INTO `receiving` (`receivingId`, `requisitionId`, `initiatingOffice`, `requestedBy`, `requestedDate`, `preparedById`, `preparedByName`, `preparedDate`, `justification`, `numItems`, `authNo`, `authDate`, `authAmount`, `rcvDate`, `rcvBy`, `invoiceNo`, `invoiceAmount`, `invoiceDate`, `status`, `statusDate`, `remarks`, `isValid`)
VALUES
	(1,1,'BEA Transportation Services','Godinez','2017-12-23',709,'Bonnie Imeong','2017-12-23','Repair Bus #3',3,'Temp001.03','2018-01-28',372.600,'2018-02-28','Godinez','KM009',372.600,'2018-02-28',NULL,NULL,NULL,''),
	(2,2,'DSM','Ray Mechol','2017-12-17',709,'Bonnie Imeong','2017-12-19','Principals Forum 12/23/17',3,'Temp002.01','2017-12-19',343.500,'2017-12-23','Bonnie','Flam002',343.500,'2017-12-23',NULL,NULL,NULL,''),
	(3,6,NULL,NULL,NULL,NULL,NULL,'2017-10-11',NULL,1,NULL,NULL,41.490,'2017-11-06','Warren','NECO006',41.490,'2017-11-06','closed','2017-11-16','In use MOEIT service center',''),
	(4,17,NULL,NULL,NULL,NULL,NULL,'2017-11-02',NULL,1,NULL,NULL,6850.000,NULL,NULL,NULL,6850.000,NULL,NULL,NULL,NULL,''),
	(5,19,NULL,NULL,NULL,NULL,NULL,'2017-10-30',NULL,1,NULL,NULL,7695.000,NULL,NULL,NULL,7695.000,NULL,NULL,NULL,NULL,''),
	(6,20,NULL,NULL,NULL,NULL,NULL,'2017-11-02',NULL,5,NULL,NULL,1718.000,'2017-11-26','Totong','Jez020',1718.000,'2017-11-26','closed','2017-11-26','Repaired and in good working order',''),
	(7,32,NULL,NULL,NULL,NULL,NULL,'2017-11-14',NULL,1,NULL,NULL,3590.000,NULL,NULL,NULL,3590.000,NULL,NULL,NULL,NULL,''),
	(8,1,'BEA Transportation Services','Godinez','2017-11-04',709,'Bonnie Imeong','2017-11-04','Repair Bus #2',1,'Temp001.02','2018-01-28',1320.000,'2018-02-16','Godinez','KM008',1320.000,'2018-02-16',NULL,NULL,NULL,''),
	(9,1,'BEA Transportation Services','Godinez','2017-12-23',709,'Bonnie Imeong','2017-12-23','Repair Bus #3',3,'Temp001.03','2018-01-28',372.600,'2018-02-28','Godinez','KM009',372.600,'2018-02-28',NULL,NULL,NULL,''),
	(10,2,'BEA','Andrew','2017-01-20',709,'Bonnie Imeong','2017-01-20','Ngardmau PTA 1/22/17',3,'Temp002.02','2017-01-20',303.000,'2018-01-22','Loi','Flam010',303.000,'2017-01-22',NULL,NULL,NULL,''),
	(11,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-10','Bevenge','MH011',NULL,'2018-03-10','closed','2018-03-10','',''),
	(12,74,'dsaf','sdfdsaf',NULL,NULL,NULL,NULL,'dsfsdaf',NULL,'adsfdsf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',''),
	(13,74,'sfsdsadf','sdafsdaf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','');

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
	(1,1,1,1,'1322','EB0E03','1221','Brake Pads for 4 wheels',4.000,'ea',185.000,740.000,''),
	(2,1,1,1,'1322','EB0E03','1221','Brake disk for left front wheel',1.000,'ea',238.000,238.000,''),
	(3,1,1,1,'1322','EB0E03','1221','Service Labor',3.000,'hr',55.000,165.000,''),
	(4,4,17,21,'1301','OPR','1555','Copier Machine',1.000,'Each',6850.000,6850.000,''),
	(5,5,19,23,'1302','OPR','1560','Vehicle, Van',1.000,'Each',7695.000,7695.000,''),
	(6,6,20,24,'1322','OPR','1420','Feed Clutch',1.000,'Each',375.000,375.000,''),
	(7,6,20,25,'1322','OPR','1420','Belt Primary Drive',1.000,'Each',241.600,241.600,''),
	(8,6,20,26,'1322','OPR','1420','Separator Base Unit',2.000,'Each',64.800,129.600,''),
	(9,6,20,27,'1322','OPR','1420','Paper Feed Roller',6.000,'Each',152.800,916.800,''),
	(10,6,20,28,'1322','OPR','1221','Service Labor',1.000,'Lot',55.000,55.000,''),
	(11,2,2,64,'1322','EBOE03','1440','Prepacked Lunch Spaghetti',30.000,'ea',7.950,238.500,''),
	(12,2,2,64,'1322','EBOE03','1440','Mixed fruits 30 serving',1.000,'Lot',45.000,45.000,''),
	(13,2,2,64,'1322','EBOE03','1440','Bottled water 12 oz',30.000,'ea',2.000,60.000,''),
	(14,7,32,119,'1322','EBOE03','1585','Air Condition, Split 24,000 BTU',2.000,'each',1795.000,3590.000,''),
	(15,3,6,132,'1322','EBOE03','1420','Magnifier Desk Lamp',1.000,'Each',41.490,41.490,''),
	(16,8,1,1,'1322','EB0E03','1221','Engine rebuild and tune up',24.000,'hrs',55.000,1320.000,''),
	(17,9,1,1,'1322','EB0E03','1221','Motor Oil 10-30',8.000,'pts',7.950,63.600,''),
	(18,9,1,1,'1322','EB0E03','1221','Belts (Fan, Alternator, Main)',3.000,'ea',48.000,144.000,''),
	(19,9,1,1,'1322','EB0E03','1221','Service Labor',3.000,'hrs',55.000,165.000,''),
	(20,10,2,64,'1322','EBOE03','1440','Chicken 50 serving',1.000,'lot',135.000,135.000,''),
	(21,10,2,64,'1322','EBOE03','1440','Rice and Starch 50 serving',1.000,'lot',68.000,68.000,''),
	(22,10,2,64,'1322','EBOE03','1440','Soda Assorted',50.000,'cans',2.000,100.000,''),
	(28,14,NULL,1,NULL,NULL,NULL,'Fan Belts',3.000,'ea',25.000,75.000,''),
	(29,12,NULL,136,NULL,NULL,NULL,'Battery Charger 12V 6A',5.000,'ea',25.000,125.000,''),
	(30,13,NULL,135,NULL,NULL,NULL,'Toolbox',3.000,'ea',15.000,45.000,'');

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
  `isValid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`requisitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `requisitions` WRITE;
/*!40000 ALTER TABLE `requisitions` DISABLE KEYS */;

INSERT INTO `requisitions` (`requisitionId`, `requisitionNo`, `initiatingOffice`, `requestedBy`, `requestedDate`, `preparedById`, `preparedByName`, `preparedDate`, `vendorId`, `vendorName`, `justification`, `numItems`, `rqAmount`, `quotationId`, `approvedDate`, `mofDeliveredDate`, `poType`, `poNo`, `poDate`, `poAmount`, `status`, `statusDate`, `remarks`, `isValid`)
VALUES
	(1,'2017-04','BEA Transportation Services','Godinez','2017-10-01',709,'Bonnie Imeong','2017-10-06',1,'Ksau Motors','Requesting Open Purchase order for school bus engine and mechanical services for MOE School Buses that needs extensive monthly upkeep to prolong their services to the Ministry. Vendor is selected based on their experience with servicing MOE buses. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',1,5000.000,NULL,'2017-10-10','2017-10-11','Open','Temp001','2017-10-20',5000.000,NULL,NULL,NULL,''),
	(2,'2018-10','BEA','Andrew Tabelual','2017-10-01',709,'Bonnie Imeong','2017-10-11',2,'Flamingo Restaurant','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',1,2000.000,NULL,'2017-10-20','2017-10-21','Open','Temp002','2017-10-30',2000.000,NULL,NULL,NULL,''),
	(3,'2018-11',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',3,'Best Coffee & Donut House','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Flamingo Fish & Steak as sometimes the other vendor will have other clients and their services will be unavailable.',1,2000.000,NULL,NULL,NULL,'Open',NULL,NULL,2000.000,NULL,NULL,NULL,''),
	(4,'2018-12',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',4,'Mason\'s Hardware','Requesting items to be used at Meyuns and G.B Harris Elementary School.',1,899.000,NULL,'2017-10-11','2017-10-12','Regular',NULL,NULL,899.000,NULL,NULL,NULL,''),
	(5,'2018-13','GBH','Wycliff',NULL,709,'Bonnie Imeong','2017-10-11',5,'W.C.T.C Ace Hardware','Requesting items to be used at George B. Harris Elementary School.',3,483.500,NULL,'2017-10-11','2017-10-12','Regular','Temp005','2017-10-21',341.000,NULL,NULL,NULL,''),
	(6,'2018-14','BEA MOEIT','Edwel','2017-10-01',709,'Bonnie Imeong','2017-10-11',6,'Ngiratkel Etpison Company Inc.','Requesting PETTY CASH to purchase this item to be used at MOE-IT Office.',1,41.490,NULL,'2017-10-11','2017-10-12','Regular','Temp006','2017-11-01',41.490,'closed rcvId 3','2017-11-16',NULL,''),
	(7,'2018-16',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',7,'West Office Supply','Request to purchase additional paper to print Report Cards for the school.',1,600.000,NULL,'2017-10-11','2017-10-12','Regular',NULL,NULL,600.000,NULL,NULL,NULL,''),
	(8,'2018-17',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',8,'Palau Shipping Co. Inc.','Request PETTY CASH to pay invoices for Instructional Supplies for P.E.',3,38.520,NULL,'2017-10-11','2017-10-12','Regular',NULL,NULL,38.520,NULL,NULL,NULL,''),
	(9,'2018-06',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-06',9,'Midtown Service Center','Requesting Open Purchase order for school bus tire services, oil changes and other preventive services for MOE School Buses that needs extensive monthly upkeep to prolong their services to the Ministry. Vendor is selected based on their experience with servicing MOE buses. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',1,5000.000,NULL,NULL,NULL,'Open',NULL,NULL,5000.000,NULL,NULL,NULL,''),
	(10,'2018-07',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-25',10,'NECO Yamaha Corporation','Requesting Open Purchase Order for MOE boat maintenance and repairs to cover this first (1st) quarter cost and expenses for this FY2018. Maintenance and repairs are necessary for MOE boats to ensure delivery of school supplies (i.e., textbooks, tests, school lunch menus etc.), specialists? visitations and school assessments by MOE specialists. Vendor is chosen, as it is the only vendor that deals with Yamaha engines and merchandises. *Requisition to replace returned RQ.  Please see attached returned RQ.',1,2000.000,NULL,NULL,NULL,'Open',NULL,NULL,2000.000,NULL,NULL,NULL,''),
	(11,'2017-01',NULL,NULL,NULL,709,'Bonnie Imeong','2017-09-03',11,'IP&E Palau Inc.','Requesting Open Purchase order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of OCTOBER 2017. Vendor offers cheaper services and has issued fleet cards, which gives us convenient access to any Shell gas stations.',1,9500.000,NULL,NULL,NULL,'Open',NULL,NULL,9500.000,NULL,NULL,NULL,''),
	(12,'2017-02',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-04',12,'Mason\'s Hardware Do-It Center','Requesting items to help unloading school instructional materials and supplies for Sonsorol Elementary School.  Requesting for ?Petty Cash?.',1,119.980,NULL,NULL,NULL,'Regular',NULL,NULL,119.980,NULL,NULL,NULL,''),
	(13,'2017-03',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-04',13,'Jezrrae Wear II','Requesting Open Purchase Order for Instructional Supplies for all MOE Public School in preparation school year SY17-18.',1,20000.000,NULL,NULL,NULL,'Open',NULL,NULL,20000.000,NULL,NULL,NULL,''),
	(14,'2017-05',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-06',9,'Midtown Service Center','Requesting Open Purchase order for vehicle service/maintenance for MOE vehicles that need monthly maintenance to prolong its running life. Vendor is selected based on their experience with servicing MOE vehicles. This request will cover costs and expenses for this fourth (4th) quarter fiscal year 2017.',1,5000.000,NULL,NULL,NULL,'Open',NULL,NULL,5000.000,NULL,NULL,NULL,''),
	(15,'2018-05',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-25',14,'Mason\'s Mercury Marine','Requesting Open Purchase Order for MOE boat maintenance and repairs to cover this first (1st) quarter cost and expenses for this FY2018. Maintenance and repairs are necessary for MOE boats to ensure delivery of school supplies (i.e., textbooks, tests, school lunch menus etc.), specialists? visitations and school assessments by MOE specialists. Vendor is chosen, as it is the only vendor that deals with Mercury engines and merchandises. *Requisition to replace returned RQ.  Please see attached returned RQ.',1,2000.000,NULL,NULL,NULL,'Open',NULL,NULL,2000.000,NULL,NULL,NULL,''),
	(16,'2018-08',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-07',1,'Ksau Motors','Requesting Open Purchase order for vehicle service/maintenance for MOE vehicles that need monthly maintenance to prolong its running life. Vendor is selected based on their experience with servicing MOE vehicles. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018. *See attached lists of MOE vehicles and quotes.',1,5000.000,NULL,NULL,NULL,'Open',NULL,NULL,5000.000,NULL,NULL,NULL,''),
	(17,'2018-20','GBH','Principal','2017-10-15',709,'Bonnie Imeong','2017-11-02',7,'West Office Supply','Requesting items to be used to support school activities and programs at George B. Harris Elementary School. School Year 17-18.',1,6850.000,NULL,'2017-11-02','2017-11-03','Regular','Temp017','2017-11-16',6850.000,NULL,NULL,NULL,''),
	(18,'2018-09',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-10',13,'Jezrrae Wear II','Requesting open purchase order for office equipment repair services and parts for computers, copiers, fax and printers for the Ministry of Education for this first (1st) quarter FY 2018. We choose this vendor because they have worked long with MOE and are familiar with services needed for equipment?s. *See attached list of office equipment?s and quotes.',1,8500.000,NULL,NULL,NULL,'Open',NULL,NULL,8500.000,NULL,NULL,NULL,''),
	(19,'2018-18','BEA Food Service','Brynn','2017-10-17',709,'Bonnie Imeong','2017-10-30',15,'IR Motors','Requesting for additional vehicle to be used at MOE/Food Service Program to help deliver fresh fruits and vegetables to all Public Elementary School on time.',1,7695.000,NULL,'2017-11-02','2017-11-03','Regular','Temp019','2017-11-16',7695.000,NULL,NULL,NULL,''),
	(20,'2018-19','BEA MPC','Totong','2017-10-24',709,'Bonnie Imeong','2017-11-02',13,'Jezrrae Wear II','Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450/RP#3992.',5,1718.000,NULL,'2017-11-12','2017-11-12','Regular','Temp020','2017-11-30',1718.000,'closed rcvId 6','2017-11-26',NULL,''),
	(21,'2018-21',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-11-06',13,'Jezrrae Wear II','Requesting a Copier Machine to be used to support school programs and activities at G.B. Harris Elementary School. SY2018.',1,4059.000,NULL,NULL,NULL,'Regular',NULL,NULL,4059.000,NULL,NULL,NULL,''),
	(22,'23',NULL,NULL,NULL,2709,'Bonnie Imeong','2011-10-17',12,'Mason\'s Hardware Do-It Center','Requesting to purchase items to repair restroom at Ibobang Elementary School.',3,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(23,'24',NULL,NULL,NULL,2709,'Bonnie Imeong','2010-10-17',12,'Mason\'s Hardware Do-It Center','Requesting to purchase items to repair restrooms at George B. Harris Elementary School',1,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(24,'#2018-25',NULL,NULL,NULL,2709,'Bonnie Imeong','2011-10-17',12,'Mason\'s Hardware Do-It Center','Requesting to purchase items to repair classrooms, restrooms and kitchen at Melekeok Elementary School.',6,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(25,'2018-26',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,12,'Mason\'s Hardware Do-It Center','Requesting to purchase items to repair classrooms and main office at Airai Elementary School.',4,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(26,'2018-27',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,13,'Jezrrae Wear II','Requesting Open Purchase order for Additional Instructional Supplies for all MOE Public Schools. This request will cover costs and expenses for this first 1st) Quarter Fiscal Year 2018.',1,0.000,NULL,NULL,NULL,'Open',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(27,'20108-28',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,7,'West Office Supply','Requesting Open Purchase order for Additional Instructional Supplies for all MOE public schools. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',1,0.000,NULL,NULL,NULL,'Open',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(28,'2018-30',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,11,'IP&E Palau Inc.','Requesting Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of December 2017. Vendor offers cheaper services and has issued fleet cards, which gives us convenient access to any Shell Gas Station.',1,0.000,NULL,NULL,NULL,'Open',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(29,'2018-31','BEA Facilities','Bevenge','2018-03-01',2709,'Bonnie Imeong','2018-03-03',12,'Mason\'s Hardware Do-It Center','Requesting items to purchase maintenance tools to be used to repair & maintain Peleliu Elementary School Facility',19,0.000,NULL,'2018-03-04','2018-03-05','Regular','Temp029','2018-03-24',0.000,'closed rcvId 11','2018-03-10',NULL,''),
	(30,'#2018-32',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,12,'Mason\'s Hardware Do-It Center','Requesting to purchase items to help maintain school campus and facility at Peleliu Elementary School',3,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(31,'#2018-33',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,5,'W.C.T.C Ace Hardware','Requesting items to Koror Elementary School Cafeteria to help to reduce heat inside the kitchen.',1,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(32,'#2018-34','DSM','Ray Mechol','2017-11-12',2709,'Bonnie Imeong','2017-11-14',12,'Mason\'s Hardware Do-It Center','Requesting purchase order for items to replace air conditions at Palau High School (English & Palauan Classroom), as they are old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',1,3590.000,NULL,'2017-11-15','2017-11-15','Regular','Temp032','2017-11-29',3590.000,NULL,NULL,NULL,''),
	(33,'#2018-35',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,12,'Mason\'s Hardware Do-It Center','Requesting purchase order for items to replace air condition at Melekeok Elementary School (8th grade classroom) as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',1,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(34,'#2018-36',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,12,'Mason\'s Hardware Do-It Center','Requesting purchase order for items to replace air condition at G.B. Harris Elementary School (Lab 2) as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',1,1795.000,NULL,NULL,NULL,'Regular',NULL,NULL,1795.000,NULL,NULL,NULL,''),
	(35,'#2018-37',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,12,'Mason\'s Hardware Do-It Center','Requesting purchase order for items to replace air condition at Bureau of Education Administration/Division of School Management, as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for ',1,1099.000,NULL,NULL,NULL,'Regular',NULL,NULL,1099.000,NULL,NULL,NULL,''),
	(36,'#2018-38',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,16,'W.C.T.C BF-Department Store','Requesting purchase order for items to be used by the Ministry of Education for hosting of the 2017 Children\'s Christmas Program on December 12, 2017 at 7:30pm. Vendor is chosen as they offer cheapest prices for requested items. ',6,0.000,NULL,NULL,NULL,'Regular',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(37,'#2018-39',NULL,NULL,NULL,2709,'Bonnie Imeong','2012-05-17',2,'Flamingo Restaurant','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',1,0.000,NULL,NULL,NULL,'Open',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(38,'#2018-40',NULL,NULL,NULL,2709,'Bonnie Imeong','2012-05-17',3,'Best Coffee & Donut House','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Flamingo Fish & Steak as sometimes the other vendor will have other clients and their services will be unavailable.',1,0.000,NULL,NULL,NULL,'Open',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(39,'39',NULL,NULL,NULL,2709,'Bonnie Imeong','2017-05-12',2,'Flamingo Restaurant','Request to Open Purchase Order for snacks, drinks and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultation with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',1,0.000,NULL,NULL,NULL,'Open',NULL,NULL,0.000,NULL,NULL,NULL,''),
	(40,'#2018-40',NULL,NULL,NULL,2709,'Bonnie Imeong','2017-05-12',3,'Best Coffee & Donut House','Open PO will be used by Director for sponsered meetings, events and for any other consultations with guests.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(41,'#2018-41',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,5,'W.C.T.C Ace Hardware','Request to purchase items to change rusted and leaking roofs at Polo Anna Elementary School',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(42,'#2018-42',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,12,'Mason\'s Hardware Do-It Center','Request to purchase additional materials that will be used to renovate cafeteria at Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(43,'#2018-43',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,17,'Accrediting Commission for Schools','Requesting payment to Western Association of Schools and Colleges (wASC) accreditation initial list fees for Elementary Schools which include Koror Elementary School, George B. Harris Elementary School, Meyuns Elementary School, Airai Elementary School and Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(44,'#2018-43',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-11-01',18,'Sarahs Yum Yum','Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17 at Palau High School Multi-Purpose Building.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(45,'#2018-44',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-02-01',11,'IP&E Palau Inc.','Requesting Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover all expenses for the month of January 2018.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(46,'#2018-44',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-01',2,'Flamingo Restaurant','Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17,02018 at Palau High School Multi-Purpose Building.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(47,'#2018-45',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,13,'Jezrrae Wear II','Requesting to purchase items to be used for MOE-IT/Bureau of Education Administration Office program activities.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(48,'#2018-46',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,9,'Midtown Service Center','Requesting Open Purchase Order for vehicle service/maintenance for MOE vehicles that needs monthly maintenance to prolong its running life.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(49,'#2018-47',NULL,NULL,NULL,2709,'Bonnie Imeong','2017-10-10',13,'Jezrrae Wear II','Open Purchase Order for office equipment repair services and parts for computers, copiers, fax and printers for the Ministry of Education for the Third (3rd) Quarter.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(50,'#2018-48',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-02-02',12,'Mason\'s Hardware Do-It Center','Requesting Materials that will be used to fulfill all schools Job Order Requests for 2nd Quarter.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(51,'#2018-49',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,13,'Jezrrae Wear II','Requesting to purchase items to fix the Walkway at Airai Elementary School',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(52,'#2018-50',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,19,'KR Construction','Request Open Purchase Order to cover for Contractor cost services for doing special request for schools facilities and maintenance.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(53,'#2018-50',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-06-02',13,'Jezrrae Wear II','Requesting to purchase items to be installed at Koror Elementary School (Principals Office)',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(54,'#2018-51',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-06-02',5,'W.C.T.C Ace Hardware','Requesting to purchase items to be installed at Melekeok Elementary School (3rd grade), Ngeremlengui Elementary School (Library), Palau High School (Science Lab) and GBH Elementary School (Lab).',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(55,'2018-52',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-08-02',11,'IP&E Palau Inc.','Open Purchase Order for fuel to be used by the Ministry Of Education. Open PO will be used to cover the costs and expenses for the month of February 2018.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(56,'2018-53',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,9,'Midtown Service Center','Requesting payment to repair School Bus (Hyundai Plate # 1147)',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(57,'2018-54',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,20,'Palau National Communication Corporation (PNC','Requesting to purchase items that will be used to replace broken modules at Ministry of Education PBX Telephone System.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(58,'2018-55',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,5,'W.C.T.C Ace Hardware','To purchase materials that will be used to build a base for flag pole at Ngaraard Elementary School',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(59,'201-56',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,5,'W.C.T.C Ace Hardware','All items listed will purchased will be used to fulfill all schools Job Order Requests for 2nd Quarter.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(60,'2018-57',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,11,'IP&E Palau Inc.','Requesting Open Purchase Order for fuel to be used by the Ministry of Education to cover the costs and expenses for the month of February 2018.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(61,'2018-58',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,9,'Midtown Service Center','Requesting Open Purchase Order for school bus tire service, oil changes and other preventive for MOE School Buses that needs monthly upkeep to prolong their services to the Ministry. This request will cover costs and expenses for the 2nd Quarter 2018',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(62,'2018-59',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,5,'W.C.T.C Ace Hardware','Requesting to purchase items that will be used at G.B. Harris Elementary School for the upcoming events Educational Awareness Week on March 12-16, 2018.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(63,'2018-60',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,21,'Surangel & Son\'s Company','Requesting to purchase item to be used for conference and other meetings conducted by the Directors of Bureau of Education Administration.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(64,'2018-61',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,13,'Jezrrae Wear II','Requesting to purchase items that will be used at all Public Schools and Ministry of Education Main Office.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(65,'2018-62',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-03',22,'Pacific Mission Aviation','Request payment to purchase a round trip ticket from Kroror to Angaur for a MOE-Staff (IT) to repair and program Anger Elementary School Internet Server System.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(66,'2018-63',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-03',12,'Mason\'s Hardware Do-It Center','Request to purchase item to be used as a back drop at the gymnasium in Airai Elementary School for the upcoming event, Educational Awareness Week on March 12-16, 2018',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(67,'2018-64',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-03',12,'Mason\'s Hardware Do-It Center','Requesting items to be used to support Melekeok Elementary School for preparation of the upcoming Educational Awareness Week on March 12-16, 2018.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(68,'2018-65',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-07-03',13,'Jezrrae Wear II','Requesting Open Purchase Order for Instructional Supplies for all MOE Public Schools in preparation SY 17-18',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(69,'2018-66',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-07-03',7,'West Office Supply','Requesting Open Purchase Order for Instructional Supplies for all MOE Public School in preparation SY17-18.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(70,'2018-67',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-07-03',21,'Surangel & Son\'s Company','Requesting Open Purchase Order for Instructional Supplies for All MOE-Public School in preparation SY17-18.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(71,'2018-68',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,23,'Yuhi Hotel','Requesting payment for rooms to accommodate students from Anger and Peleliu Elementary Schools to attend PVA Field Trip on March 21-23, 2018.',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(72,'2018-69',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,11,'IP&E Palau Inc.','Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of March 2018.',NULL,NULL,NULL,NULL,NULL,'Open',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(73,'2018-70',NULL,NULL,NULL,2709,'Bonnie Imeong',NULL,5,'W.C.T.C Ace Hardware','Requested materials to be used to fix water pumps at All Public Schools including Palau High School',NULL,NULL,NULL,NULL,NULL,'Regular',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(74,NULL,'BEA MOEIT','Edwel',NULL,2071,'Edwel Ongrung','2018-01-20',15,NULL,'To be used in the office',NULL,312.000,NULL,NULL,NULL,'Regular','Temp0074','2018-06-20',NULL,NULL,NULL,'','');

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
	(1,1,'1322','EB0E03','OPR',NULL,'1221','Open PO for School Bus Engine & Mechanical Services',1.000,'Lot',5000.000,5000.000,1,''),
	(3,3,'1322','EBOE03','OPR',NULL,'1440','Open PO Meeting Expenses',1.000,'Lot',2000.000,2000.000,1,''),
	(4,4,'1322','EBOE03','OPR',NULL,'1420','Light Bulb (indoor/outdoor',100.000,'Each',8.990,899.000,1,''),
	(9,7,'1301','ESBS01','OPR',NULL,'1420','Index Paper, 8.5 X 14',2000.000,'Each',0.300,600.000,1,''),
	(10,8,'1301','ESBS01','OPR',NULL,'1450','Handling Charges',1.000,'Each',24.990,24.990,1,''),
	(11,8,'1301','ESBS01','OPR',NULL,'1450','Wharfage Charges',1.000,'Each',3.530,3.530,2,''),
	(12,8,'1301','ESBS01','OPR',NULL,'1450','EA Fee',1.000,'Each',10.000,10.000,3,''),
	(14,10,'1322','EB0E03','OPR',NULL,'1222','Open PO for Boat Maintenance and Repairs',1.000,'Lot',2000.000,2000.000,1,''),
	(15,11,'1322','OPR','EB0E03',NULL,'1436','Open PO for Gasoline/Diesel/Oil',1.000,'Lot',9500.000,9500.000,1,''),
	(16,12,'1322','OPR','EB0E03',NULL,'1420','Tire, Wheelbarrow',2.000,'Each',59.990,119.980,1,''),
	(17,13,'1301','OPR','ESBSO1',NULL,'1420','Open PO for Instructional Supplies',1.000,'Lot',20000.000,20000.000,1,''),
	(18,14,'1322','OPR','EBOE03',NULL,'1221','Open PO for',1.000,'Lot',5000.000,5000.000,1,''),
	(19,15,'1322','EB0E03','OPR',NULL,'1222','Open PO for Boat Engine Maintenance and Repair',1.000,'Lot',2000.000,2000.000,1,''),
	(20,16,'1322','EB0E03','OPR',NULL,'1221','Open PO for Vehicle Service and Maintenance',1.000,'Lot',5000.000,5000.000,1,''),
	(21,17,'1301','OPR','ESBS01',NULL,'1555','Copier Machine',1.000,'Each',6850.000,6850.000,1,''),
	(22,18,'1322','OPR','EBOE03',NULL,'1220','Open PO for Office Equipment Repair Services & Parts for Computers, Copiers, Fax, and Printers.',1.000,'LOT',8500.000,8500.000,1,''),
	(23,19,'1302','OPR','EFOOD1',NULL,'1560','Vehicle, Van',1.000,'Each',7695.000,7695.000,1,''),
	(24,20,'1322','OPR','EBOEO3',NULL,'1420','Feed Clutch',1.000,'Each',375.000,375.000,1,''),
	(25,20,'1322','OPR','EBOE03',NULL,'1420','Belt Primary Drive',1.000,'Each',241.600,241.600,2,''),
	(26,20,'1322','OPR','EBOE03',NULL,'1420','Separator Base Unit',2.000,'Each',64.800,129.600,3,''),
	(27,20,'1322','OPR','EBOE03',NULL,'1420','Paper Feed Roller',6.000,'Each',152.800,916.800,4,''),
	(28,20,'1322','OPR','EBOE03',NULL,'1221','Service Labor',1.000,'Lot',55.000,55.000,5,''),
	(59,5,'1322','EBOE03','OPR','opt','1420','Trimmer Head',4.000,'Each',26.250,105.000,NULL,''),
	(60,5,'1322','EBOE03','OPR',NULL,'1420','Mop Head',10.000,'Each',8.850,88.500,NULL,''),
	(61,5,'1322','EBOE03','OPR',NULL,'1420','Mop Handle',10.000,'Each',14.750,147.500,NULL,''),
	(64,2,'1322','EBOE03','OPT',NULL,'1440','Open PO Meeting Expenses',1.000,'Lot',2000.000,2000.000,NULL,''),
	(69,9,'1322','EB0E03','OPR',NULL,'1221','Open PO for School Bus Tire Service, Oil Changes & Other Preventive Maintenance',1.000,'Lot',5000.000,5000.000,NULL,''),
	(72,21,'1301','ESBS01',NULL,'OPR','1555','Copier Machine',1.000,'each',4059.000,4059.000,NULL,''),
	(73,22,'1322','EBOE03',NULL,'OPR','1420','No Slip Tape 4\"',3.000,'each',0.000,0.000,NULL,''),
	(74,22,'1322','EBOE03',NULL,'OPR','1420','Toilet, Elongated PRO-fit 2',2.000,'each',0.000,0.000,NULL,''),
	(75,22,'1322','EBOE03',NULL,'OPR','1420','Cement, White 50KG',7.000,'each',0.000,0.000,NULL,''),
	(76,23,'1322','EBOE03',NULL,'OPR','1420','Toilet,Elongated PRO-Fit 2',5.000,'Each',0.000,0.000,NULL,''),
	(83,24,'1322','EBOE03',NULL,'OPR','1420','Ridge Cap, Blue 8',30.000,'each',0.000,0.000,NULL,''),
	(84,24,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Galvalume 26GA/32',30.000,'each',0.000,0.000,NULL,''),
	(85,24,'1322','EBOE03',NULL,'OPR','1420','Plywood, ACX 1/4',20.000,'each',0.000,0.000,NULL,''),
	(86,24,'1322','EBOE03',NULL,'OPR','1420','Lumber, Treated 2X2X16DF',30.000,'each',0.000,0.000,NULL,''),
	(87,24,'1322','EBOE03',NULL,'OPR','1420','Nail, Roofing 2-21/2',50.000,'lbs.',0.000,0.000,NULL,''),
	(88,24,'1322','EBOE03',NULL,'OPR','1420','Roof Cement, Wet/Dry Fiber Plastic',5.000,'gal.',0.000,0.000,NULL,''),
	(89,25,'1322','EBOE03',NULL,'OPR','1420','Tn Roof, Rib Blue 32\"X 10NULL',30.000,'each',0.000,0.000,NULL,''),
	(90,25,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Galvalume 26GA/32\"X12NULL',30.000,'each',0.000,0.000,NULL,''),
	(91,25,'1322','EBOE03',NULL,'OPR','1420','Flat Tin, 26 Gauge 4\"X8NULL',18.000,'each',0.000,0.000,NULL,''),
	(92,25,'1322','EBOE03',NULL,'OPR','1420','Paint Acrylic Roof Azure Blue Gloss Wen10',10.000,'gal.',0.000,0.000,NULL,''),
	(93,26,'1301','ESBS01',NULL,'OPR','1420','Open PO for Instructional Supplies',1.000,'lot',0.000,0.000,NULL,''),
	(94,27,'1301','ESBS01',NULL,'OPR','1420','Open PO for Instructional Supplies',1.000,'lot',0.000,0.000,NULL,''),
	(95,28,'1322','EBOE03',NULL,'OPR','1436','Open O for Gasoline/Diesel/Oil',1.000,'lot',0.000,0.000,NULL,''),
	(96,29,'1322','EBOE03',NULL,'OPR','1420','Tool Box 24\" plastic',1.000,'each',0.000,0.000,NULL,''),
	(97,29,'1322','EBOE03',NULL,'OPR','1420','Tool Set, 83pc. Auto',1.000,'each',0.000,0.000,NULL,''),
	(98,29,'1322','EBOE03',NULL,'OPR','1420','Square, Combination Plastic',1.000,'each',0.000,0.000,NULL,''),
	(99,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 9.5',1.000,'each',0.000,0.000,NULL,''),
	(100,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 12 V TG/GRV',1.000,'each',0.000,0.000,NULL,''),
	(101,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 8 Long Nose',1.000,'each',0.000,0.000,NULL,''),
	(102,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 10 TG/GRV',1.000,'each',0.000,0.000,NULL,''),
	(103,29,'1322','EBOE03',NULL,'OPR','1420','Snip, Left Cut 9-3/4 MIR',1.000,'each',0.000,0.000,NULL,''),
	(104,29,'1322','EBOE03',NULL,'OPR','1420','Plier, Locking Set Fast Release',1.000,'each',0.000,0.000,NULL,''),
	(105,29,'1322','EBOE03',NULL,'OPR','1420','Tool Set (Blade, Measuring Tape, Marker)',1.000,'each',0.000,0.000,NULL,''),
	(106,29,'1322','EBOE03',NULL,'OPR','1420','Screwdriver, 6pc. Set',1.000,'each',0.000,0.000,NULL,''),
	(107,29,'1322','EBOE03',NULL,'OPR','1420','Hacksaw, Frame',1.000,'each',0.000,0.000,NULL,''),
	(108,29,'1322','EBOE03',NULL,'OPR','1420','Square, Carpenter 8X12 STL',1.000,'each',0.000,0.000,NULL,''),
	(109,29,'1322','EBOE03',NULL,'OPR','1420','Blade, Hacksaw High speed Steel',1.000,'each',0.000,0.000,NULL,''),
	(110,29,'1322','EBOE03',NULL,'OPR','1420','Handsaw, 15 9ft. Short Cut',1.000,'each',0.000,0.000,NULL,''),
	(111,29,'1322','EBOE03',NULL,'OPR','1420','Chisel, Set 3pcs. Wood',1.000,'each',0.000,0.000,NULL,''),
	(112,29,'1322','EBOE03',NULL,'OPR','1420','Blade, Utility Dispenser 025',1.000,'each',0.000,0.000,NULL,''),
	(113,29,'1322','EBOE03',NULL,'OPR','1420','Hammer, Claw Wood Handle 16oz.',1.000,'each',0.000,0.000,NULL,''),
	(114,29,'1322','EBOE03',NULL,'OPR','1420','Hammer, Claw Wood Handle 7oz.',1.000,'each',0.000,0.000,NULL,''),
	(115,30,'1322','EBOE03',NULL,'OPR','1420','Lawmower, Push Gas 21\" Deck',1.000,'each',0.000,0.000,NULL,''),
	(116,30,'1322','EBOE3',NULL,'OPR','1420','Blower, Backpack 2-Cycle',1.000,'each',0.000,0.000,NULL,''),
	(117,30,'1322','EBOE03',NULL,'OPR','1420','Trimmer/Green Machine',2.000,'each',0.000,0.000,NULL,''),
	(118,31,'1322','EBOE03',NULL,'OPR','1420','Ventilator',2.000,'each',0.000,0.000,NULL,''),
	(119,32,'1322','EBOE03',NULL,'OPR','1585','Air Condition, Split 24,000 BTU',2.000,'each',1795.000,3590.000,NULL,''),
	(120,33,'1322','EBOE3',NULL,'OPR','1420','Air Condition, Split 24,000 BTU',1.000,'each',0.000,0.000,NULL,''),
	(122,35,'1322','EBOE03',NULL,'OPR','1585','Air Condition, Split 12,000 BTU',1.000,'each',1099.000,1099.000,NULL,''),
	(123,34,'1322','EBOE03',NULL,'OPR','1585','Air Condition, Split 24,000 BTU',1.000,'each',1795.000,1795.000,NULL,''),
	(124,36,'1322','EBOE03',NULL,'OPR','1420','Gift Bag, T-Shirt Style Small',500.000,'each',0.000,0.000,NULL,''),
	(125,36,'1322','EBOE03',NULL,'OPR','1420','Crayons, Bazic 8 Premium Quali',41.000,'each',0.000,0.000,NULL,''),
	(126,36,'1322','EBOE03',NULL,'OPR','1420','Coloring Book, w/Stickers 1ct/12',500.000,'each',0.000,0.000,NULL,''),
	(127,36,'1322','EBOE03',NULL,'OPR','1420','School Set, RS-1000 Assorte',500.000,'each',0.000,0.000,NULL,''),
	(128,36,'1322','EBOE03',NULL,'OPR','1420','Pencil, Bazic Fluorescent 8pk/24',500.000,'each',0.000,0.000,NULL,''),
	(129,36,'1322','EBOE03',NULL,'OPR','1440','Snacks',500.000,'each',0.000,0.000,NULL,''),
	(130,37,'1322','EBOE03',NULL,'OPR','1440','Open PO for Meeting Expenses',1.000,'Lot',0.000,0.000,NULL,''),
	(131,38,'1322','EBOE03',NULL,'OPR','1420','Open PO for Meeting Expenses',1.000,'Lot',0.000,0.000,NULL,''),
	(132,6,'1322','EBOE03','OPR',NULL,'1420','Magnifier Desk Lamp',1.000,'Each',41.490,41.490,NULL,''),
	(133,39,'1322','EBOE03',NULL,'OPR','1440','Open PO for Meeting Expenses',1.000,'Lot',0.000,0.000,NULL,''),
	(134,5,'1322','EBOE03','OPR',NULL,'1420','Mop brush',5.000,'ea',28.500,142.500,NULL,'x1807221846'),
	(135,74,'1322',NULL,NULL,NULL,'1420','Toolbox',4.000,'ea',35.500,142.000,NULL,''),
	(136,74,'1322',NULL,NULL,NULL,'1420','Battery Charger 12V 6A',2.000,'ea',85.000,170.000,NULL,'');

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
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;

INSERT INTO `vendors` (`vendorId`, `vendorName`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `phone`, `fax`, `email`, `website`)
VALUES
	(1,'Ksau Motors','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-1912','(680) 488-5353',NULL,NULL),
	(2,'Flamingo Restaurant','P.O. Box 487','','Koror','Palau','96940','Republic of Palau','(680) 488-8072','',NULL,NULL),
	(3,'Best Coffee & Donut House','P.O. Box 212','','Koror','Palau','96940','Republic of Palau','(680) 488-8025','',NULL,NULL),
	(4,'Mason\'s Hardware','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL),
	(5,'W.C.T.C Ace Hardware','P.O. Box 280','','Koror','Palau','96940','Republic of Palau','(680) 488-1552','(680) 488-4189',NULL,NULL),
	(6,'Ngiratkel Etpison Company Inc.','','Ngetkib, Airai','Koror','Palau','96940','Republic of Palau','(680) 587-2031','(680) 587-2071',NULL,NULL),
	(7,'West Office Supply','P.O. Box 280','','Koror','Palau','96940','Republic of Palau','(680) 488-2363','(680) 488-5610',NULL,NULL),
	(8,'Palau Shipping Co. Inc.','P.O. Box 6000','Port Area, Malakal','Koror','Palau','96940','Republic of Palau','(680) 488-2629','(680) 488-1095',NULL,NULL),
	(9,'Midtown Service Center','P.O. Box 9064','','Koror','Palau','96940','Republic of Palau','(680) 488-2245','(680) 488-6484',NULL,NULL),
	(10,'NECO Yamaha Corporation','P.O. Box 129','','Koror','Palau','96940','Republic of Palau','(680) 488-1100','(680) 488-1804',NULL,NULL),
	(11,'IP&E Palau Inc.','P.O. Box 1678','','Koror','Palau','96940','Republic of Palau','(680) 488-6464','(680) 488-6363',NULL,NULL),
	(12,'Mason\'s Hardware Do-It Center','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL),
	(13,'Jezrrae Wear II','P.O. Box 7048',NULL,'Koror','Palau','96940','Republic of Palau','(680) 488-2662','(680) 488-2005',NULL,NULL),
	(14,'Mason\'s Mercury Marine','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','',NULL,NULL),
	(15,'IR Motors','P.O. Box 9064','','Koror','Palau','96940','Republic of Palau','(680) 488-5600','(680) 488-7433',NULL,NULL),
	(16,'W.C.T.C BF-Department Store','P.O. Box 280',NULL,'Koror','Palau','96940',NULL,'(680)488-1633','(680) 488-8523',NULL,NULL),
	(17,'Accrediting Commission for Schools','Western Association of Schools and Colleges (','533 Airport Boulevard, Suite 200','Burlingame','CA','94010',NULL,'(650) 696-1060','(650) 696-1867',NULL,NULL),
	(18,'Sarahs Yum Yum','Koror, Palau',NULL,'Koror','Palau','96940',NULL,'(650) 488-5590',NULL,NULL,NULL),
	(19,'KR Construction','P.O. Box 2000','Koror, Palau','Koror','Palau','96940',NULL,'(650) 488--5865',NULL,NULL,NULL),
	(20,'Palau National Communication Corporation (PNC','P.O.Box 99','Koror , Palau','Koror','Palau','96940',NULL,'(680) 4888-9600','(680) 488-9090',NULL,NULL),
	(21,'Surangel & Son\'s Company','P.O.Box 295','Republic of Palau','Koror','Palau','96940',NULL,'(680) 488-2608','(680)488-1535',NULL,NULL),
	(22,'Pacific Mission Aviation','P.O.Box 906','Koror, Republic of Palau','Koror','Palau','96940',NULL,'(680) 587-4567','(680) 778-2747',NULL,NULL),
	(23,'Yuhi Hotel',NULL,'Koror, Republic of Palau','Koror','Palau','96940',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
