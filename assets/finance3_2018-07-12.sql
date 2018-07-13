# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.12)
# Database: finance3
# Generation Time: 2018-07-12 10:21:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table grant_allocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grant_allocations`;

CREATE TABLE `grant_allocations` (
  `grantAllocationId` varchar(10) NOT NULL,
  `grantId` varchar(20) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `groupLevel1` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`grantAllocationId`),
  KEY `awardId_idx` (`grantId`),
  CONSTRAINT `awardId` FOREIGN KEY (`grantId`) REFERENCES `grants` (`grantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table grantmoe_allocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grantmoe_allocations`;

CREATE TABLE `grantmoe_allocations` (
  `grantAllocationId` varchar(20) DEFAULT NULL,
  `moeAllocationId` int(11) DEFAULT NULL,
  KEY `grantAllocationId2_idx` (`grantAllocationId`),
  KEY `moeAllocationId2_idx` (`moeAllocationId`),
  CONSTRAINT `grantAllocationId2` FOREIGN KEY (`grantAllocationId`) REFERENCES `grant_allocations` (`grantAllocationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `moeAllocationId2` FOREIGN KEY (`moeAllocationId`) REFERENCES `moe_allocations` (`moeAllocationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table grants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grants`;

CREATE TABLE `grants` (
  `grantId` varchar(20) NOT NULL,
  `grantDate` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`grantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table moe_allocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `moe_allocations`;

CREATE TABLE `moe_allocations` (
  `moeAllocationId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `fiscalYear` year(4) DEFAULT NULL,
  `programName` varchar(45) DEFAULT NULL,
  `purpose` varchar(45) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `masterPlanRef` int(11) DEFAULT NULL,
  `mapRef` int(11) DEFAULT NULL,
  PRIMARY KEY (`moeAllocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table mof_allotments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mof_allotments`;

CREATE TABLE `mof_allotments` (
  `mofAllotmentId` int(11) NOT NULL AUTO_INCREMENT,
  `grantAllocationId` varchar(10) DEFAULT NULL,
  `fiscalYear` year(4) DEFAULT NULL,
  `org` varchar(4) DEFAULT NULL,
  `costCenter` varchar(6) DEFAULT NULL,
  `account` varchar(4) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `targetLimit` float DEFAULT NULL,
  PRIMARY KEY (`mofAllotmentId`),
  UNIQUE KEY `mofAlloc` (`fiscalYear`,`org`,`costCenter`,`account`),
  KEY `awardAllocationId_idx` (`grantAllocationId`),
  CONSTRAINT `awardAllocationId` FOREIGN KEY (`grantAllocationId`) REFERENCES `grant_allocations` (`grantAllocationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table po
# ------------------------------------------------------------

DROP TABLE IF EXISTS `po`;

CREATE TABLE `po` (
  `poId` int(11) NOT NULL AUTO_INCREMENT,
  `requisitionId` int(11) DEFAULT NULL,
  `pocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`poId`),
  KEY `requisitionId_idx` (`requisitionId`),
  CONSTRAINT `requisitionId` FOREIGN KEY (`requisitionId`) REFERENCES `requisitions` (`requisitionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requests`;

CREATE TABLE `requests` (
  `requestId` int(11) NOT NULL AUTO_INCREMENT,
  `requestDate` date DEFAULT NULL,
  `requestBy` varchar(45) DEFAULT NULL,
  `moeUnitId` int(11) DEFAULT NULL,
  `justification` varchar(200) DEFAULT NULL,
  `moeAllocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  KEY `budgetActivityId_idx` (`moeAllocationId`),
  CONSTRAINT `moeAllocationId` FOREIGN KEY (`moeAllocationId`) REFERENCES `moe_allocations` (`moeAllocationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table requests_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requests_items`;

CREATE TABLE `requests_items` (
  `requestsItemId` int(11) NOT NULL AUTO_INCREMENT,
  `requestId` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `requisitionsItemId` int(11) DEFAULT NULL,
  PRIMARY KEY (`requestsItemId`),
  KEY `requestId_idx` (`requestId`),
  KEY `requisitionsItemId_idx` (`requisitionsItemId`),
  CONSTRAINT `requestId` FOREIGN KEY (`requestId`) REFERENCES `requests` (`requestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `requisitionsItemId` FOREIGN KEY (`requisitionsItemId`) REFERENCES `requisitions_items` (`requisitionItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
  `vendorName` int(11) DEFAULT NULL,
  `justification` text,
  `numItems` int(11) DEFAULT NULL,
  `rqAmount` decimal(10,3) DEFAULT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `moeApprovedDate` date DEFAULT NULL,
  `mofDeliveredDate` date DEFAULT NULL,
  `poNo` int(11) DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `poAmount` decimal(10,3) DEFAULT NULL,
  `rcvDate` date DEFAULT NULL,
  `rcvBy` varchar(30) DEFAULT NULL,
  `invoiceNo` varchar(12) DEFAULT NULL,
  `invoiceAmount` decimal(10,3) DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `isValid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`requisitionId`),
  KEY `vendorId_idx` (`vendorId`),
  CONSTRAINT `vendorId` FOREIGN KEY (`vendorId`) REFERENCES `vendors` (`vendorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `requisitions` WRITE;
/*!40000 ALTER TABLE `requisitions` DISABLE KEYS */;

INSERT INTO `requisitions` (`requisitionId`, `requisitionNo`, `initiatingOffice`, `requestedBy`, `requestedDate`, `preparedById`, `preparedByName`, `preparedDate`, `vendorId`, `vendorName`, `justification`, `numItems`, `rqAmount`, `quotationId`, `moeApprovedDate`, `mofDeliveredDate`, `poNo`, `poDate`, `poAmount`, `rcvDate`, `rcvBy`, `invoiceNo`, `invoiceAmount`, `invoiceDate`, `isValid`)
VALUES
	(1,'2017-04',NULL,NULL,NULL,709,NULL,'2017-10-06',1,NULL,'Requesting Open Purchase order for school bus engine and mechanical services for MOE School Buses that needs extensive monthly upkeep to prolong their services to the Ministry. Vendor is selected based on their experience with servicing MOE buses. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(2,'2018-10',NULL,NULL,NULL,709,NULL,'2017-10-11',2,NULL,'Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(3,'2018-11',NULL,NULL,NULL,709,NULL,'2017-10-11',3,NULL,'Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Flamingo Fish & Steak as sometimes the other vendor will have other clients and their services will be unavailable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(4,'2018-12',NULL,NULL,NULL,709,NULL,'2017-10-11',4,NULL,'Requesting items to be used at Meyuns and G.B Harris Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(5,'2018-13',NULL,NULL,NULL,709,NULL,'2017-10-11',5,NULL,'Requesting items to be used at George B. Harris Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(6,'2018-14',NULL,NULL,NULL,709,NULL,'2017-10-11',6,NULL,'Requesting PETTY CASH to purchase this item to be used at MOE-IT Office.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(7,'2018-16',NULL,NULL,NULL,709,NULL,'2017-10-11',7,NULL,'Request to purchase additional paper to print Report Cards for the school.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(8,'2018-17',NULL,NULL,NULL,709,NULL,'2017-10-11',8,NULL,'Request PETTY CASH to pay invoices for Instructional Supplies for P.E.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(9,'2018-06',NULL,NULL,NULL,709,NULL,'2017-10-06',9,NULL,'Requesting Open Purchase order for school bus tire services, oil changes and other preventive services for MOE School Buses that needs extensive monthly upkeep to prolong their services to the Ministry. Vendor is selected based on their experience with servicing MOE buses. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(10,'2018-07',NULL,NULL,NULL,709,NULL,'2017-10-25',10,NULL,'Requesting Open Purchase Order for MOE boat maintenance and repairs to cover this first (1st) quarter cost and expenses for this FY2018. Maintenance and repairs are necessary for MOE boats to ensure delivery of school supplies (i.e., textbooks, tests, school lunch menus etc.), specialists? visitations and school assessments by MOE specialists. Vendor is chosen, as it is the only vendor that deals with Yamaha engines and merchandises. *Requisition to replace returned RQ.  Please see attached returned RQ.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(11,'2017-01',NULL,NULL,NULL,709,NULL,'2017-09-03',11,NULL,'Requesting Open Purchase order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of OCTOBER 2017. Vendor offers cheaper services and has issued fleet cards, which gives us convenient access to any Shell gas stations.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(12,'2017-02',NULL,NULL,NULL,709,NULL,'2017-10-04',12,NULL,'Requesting items to help unloading school instructional materials and supplies for Sonsorol Elementary School.  Requesting for ?Petty Cash?.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(13,'2017-03',NULL,NULL,NULL,709,NULL,'2017-10-04',13,NULL,'Requesting Open Purchase Order for Instructional Supplies for all MOE Public School in preparation school year SY17-18.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(14,'2017-05',NULL,NULL,NULL,709,NULL,'2017-10-06',9,NULL,'Requesting Open Purchase order for vehicle service/maintenance for MOE vehicles that need monthly maintenance to prolong its running life. Vendor is selected based on their experience with servicing MOE vehicles. This request will cover costs and expenses for this fourth (4th) quarter fiscal year 2017.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(15,'2018-05',NULL,NULL,NULL,709,NULL,'2017-10-25',14,NULL,'Requesting Open Purchase Order for MOE boat maintenance and repairs to cover this first (1st) quarter cost and expenses for this FY2018. Maintenance and repairs are necessary for MOE boats to ensure delivery of school supplies (i.e., textbooks, tests, school lunch menus etc.), specialists? visitations and school assessments by MOE specialists. Vendor is chosen, as it is the only vendor that deals with Mercury engines and merchandises. *Requisition to replace returned RQ.  Please see attached returned RQ.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(16,'2018-08',NULL,NULL,NULL,709,NULL,'2017-10-07',1,NULL,'Requesting Open Purchase order for vehicle service/maintenance for MOE vehicles that need monthly maintenance to prolong its running life. Vendor is selected based on their experience with servicing MOE vehicles. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018. *See attached lists of MOE vehicles and quotes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(17,'2018-20',NULL,NULL,NULL,709,NULL,'2017-11-02',7,NULL,'Requesting items to be used to support school activities and programs at George B. Harris Elementary School. School Year 17-18.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(18,'2018-09',NULL,NULL,NULL,709,NULL,'2017-10-10',13,NULL,'Requesting open purchase order for office equipment repair services and parts for computers, copiers, fax and printers for the Ministry of Education for this first (1st) quarter FY 2018. We choose this vendor because they have worked long with MOE and are familiar with services needed for equipment?s. *See attached list of office equipment?s and quotes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(19,'2018-18',NULL,NULL,NULL,709,NULL,'2017-10-30',15,NULL,'Requesting for additional vehicle to be used at MOE/Food Service Program to help deliver fresh fruits and vegetables to all Public Elementary School on time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(20,'2018-19',NULL,NULL,NULL,709,NULL,'2017-11-02',13,NULL,'Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450/RP#3992.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(21,'2018-21',NULL,NULL,NULL,2709,NULL,'2018-11-06',13,NULL,'Requesting a Copier Machine to be used to support school programs and activities at G.B. Harris Elementary School. SY2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(22,'23',NULL,NULL,NULL,2709,NULL,'2011-10-17',12,NULL,'Requesting to purchase items to repair restroom at Ibobang Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(23,'24',NULL,NULL,NULL,2709,NULL,'2010-10-17',12,NULL,'Requesting to purchase items to repair restrooms at George B. Harris Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(24,'#2018-25',NULL,NULL,NULL,2709,NULL,'2011-10-17',12,NULL,'Requesting to purchase items to repair classrooms, restrooms and kitchen at Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(25,'2018-26',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting to purchase items to repair classrooms and main office at Airai Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(26,'2018-27',NULL,NULL,NULL,2709,NULL,'0000-00-00',13,NULL,'Requesting Open Purchase order for Additional Instructional Supplies for all MOE Public Schools. This request will cover costs and expenses for this first 1st) Quarter Fiscal Year 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(27,'20108-28',NULL,NULL,NULL,2709,NULL,'0000-00-00',7,NULL,'Requesting Open Purchase order for Additional Instructional Supplies for all MOE public schools. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(28,'2018-30',NULL,NULL,NULL,2709,NULL,'0000-00-00',11,NULL,'Requesting Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of December 2017. Vendor offers cheaper services and has issued fleet cards, which gives us convenient access to any Shell Gas Station.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(29,'2018-31',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting items to purchase maintenance tools to be used to repair & maintain Peleliu Elementary School Facility',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(30,'#2018-32',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting to purchase items to help maintain school campus and facility at Peleliu Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(31,'#2018-33',NULL,NULL,NULL,2709,NULL,'0000-00-00',5,NULL,'Requesting items to Koror Elementary School Cafeteria to help to reduce heat inside the kitchen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(32,'#2018-34',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting purchase order for items to replace air conditions at Palau High School (English & Palauan Classroom), as they are old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(33,'#2018-35',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting purchase order for items to replace air condition at Melekeok Elementary School (8th grade classroom) as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(34,'#2018-36',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting purchase order for items to replace air condition at G.B. Harris Elementary School (Lab 2) as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(35,'#2018-37',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Requesting purchase order for items to replace air condition at Bureau of Education Administration/Division of School Management, as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(36,'#2018-38',NULL,NULL,NULL,2709,NULL,'0000-00-00',16,NULL,'Requesting purchase order for items to be used by the Ministry of Education for hosting of the 2017 Childrenâ€™s Christmas Program on December 12, 2017 at 7:30pm. Vendor is chosen as they offer cheapest prices for requested items. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(37,'#2018-39',NULL,NULL,NULL,2709,NULL,'2012-05-17',2,NULL,'Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(38,'#2018-40',NULL,NULL,NULL,2709,NULL,'2012-05-17',3,NULL,'Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Flamingo Fish & Steak as sometimes the other vendor will have other clients and their services will be unavailable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(39,'39',NULL,NULL,NULL,2709,NULL,'2017-05-12',2,NULL,'Request to Open Purchase Order for snacks, drinks and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultation with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.\r\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(40,'#2018-40',NULL,NULL,NULL,2709,NULL,'2017-05-12',3,NULL,'Open PO will be used by Director for sponsered meetings, events and for any other consultations with guests.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(41,'#2018-41',NULL,NULL,NULL,2709,NULL,'0000-00-00',5,NULL,'Request to purchase items to change rusted and leaking roofs at Polo Anna Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(42,'#2018-42',NULL,NULL,NULL,2709,NULL,'0000-00-00',12,NULL,'Request to purchase additional materials that will be used to renovate cafeteria at Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(43,'#2018-43',NULL,NULL,NULL,2709,NULL,'0000-00-00',17,NULL,'Requesting payment to Western Association of Schools and Colleges (wASC) accreditation initial list fees for Elementary Schools which include Koror Elementary School, George B. Harris Elementary School, Meyuns Elementary School, Airai Elementary School and Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(44,'#2018-43',NULL,NULL,NULL,2709,NULL,'2018-11-01',18,NULL,'Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17 at Palau High School Multi-Purpose Building.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(45,'#2018-44',NULL,NULL,NULL,2709,NULL,'2018-02-01',11,NULL,'Requesting Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover all expenses for the month of January 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(46,'#2018-44',NULL,NULL,NULL,2709,NULL,'2018-01-01',2,NULL,'Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17,02018 at Palau High School Multi-Purpose Building.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(47,'#2018-45',NULL,NULL,NULL,2709,NULL,'0000-00-00',13,NULL,'Requesting to purchase items to be used for MOE-IT/Bureau of Education Administration Office program activities.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(48,'#2018-46',NULL,NULL,NULL,2709,NULL,'0000-00-00',9,NULL,'Requesting Open Purchase Order for vehicle service/maintenance for MOE vehicles that needs monthly maintenance to prolong its running life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(49,'#2018-47',NULL,NULL,NULL,2709,NULL,'2017-10-10',13,NULL,'Open Purchase Order for office equipment repair services and parts for computers, copiers, fax and printers for the Ministry of Education for the Third (3rd) Quarter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(50,'#2018-48',NULL,NULL,NULL,2709,NULL,'2018-02-02',12,NULL,'Requesting Materials that will be used to fulfill all schools Job Order Requests for 2nd Quarter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(51,'#2018-49',NULL,NULL,NULL,2709,NULL,'0000-00-00',13,NULL,'Requesting to purchase items to fix the Walkway at Airai Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(52,'#2018-50',NULL,NULL,NULL,2709,NULL,'0000-00-00',19,NULL,'Request Open Purchase Order to cover for Contractor cost services for doing special request for schools facilities and maintenance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(53,'#2018-50',NULL,NULL,NULL,2709,NULL,'2018-06-02',13,NULL,'Requesting to purchase items to be installed at Koror Elementary School (Principals Office)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(54,'#2018-51',NULL,NULL,NULL,2709,NULL,'2018-06-02',5,NULL,'Requesting to purchase items to be installed at Melekeok Elementary School (3rd grade), Ngeremlengui Elementary School (Library), Palau High School (Science Lab) and GBH Elementary School (Lab).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(55,'2018-52',NULL,NULL,NULL,2709,NULL,'2018-08-02',11,NULL,'Open Purchase Order for fuel to be used by the Ministry Of Education. Open PO will be used to cover the costs and expenses for the month of February 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(56,'2018-53',NULL,NULL,NULL,2709,NULL,'0000-00-00',9,NULL,'Requesting payment to repair School Bus (Hyundai Plate # 1147)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(57,'2018-54',NULL,NULL,NULL,2709,NULL,'0000-00-00',20,NULL,'Requesting to purchase items that will be used to replace broken modules at Ministry of Education PBX Telephone System.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(58,'2018-55',NULL,NULL,NULL,2709,NULL,'0000-00-00',5,NULL,'To purchase materials that will be used to build a base for flag pole at Ngaraard Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(59,'201-56',NULL,NULL,NULL,2709,NULL,'0000-00-00',5,NULL,'All items listed will purchased will be used to fulfill all schools Job Order Requests for 2nd Quarter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(60,'2018-57',NULL,NULL,NULL,2709,NULL,'0000-00-00',11,NULL,'Requesting Open Purchase Order for fuel to be used by the Ministry of Education to cover the costs and expenses for the month of February 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(61,'2018-58',NULL,NULL,NULL,2709,NULL,'0000-00-00',9,NULL,'Requesting Open Purchase Order for school bus tire service, oil changes and other preventive for MOE School Buses that needs monthly upkeep to prolong their services to the Ministry. This request will cover costs and expenses for the 2nd Quarter 2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(62,'2018-59',NULL,NULL,NULL,2709,NULL,'0000-00-00',5,NULL,'Requesting to purchase items that will be used at G.B. Harris Elementary School for the upcoming events Educational Awareness Week on March 12-16, 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(63,'2018-60',NULL,NULL,NULL,2709,NULL,'0000-00-00',21,NULL,'Requesting to purchase item to be used for conference and other meetings conducted by the Directors of Bureau of Education Administration.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(64,'2018-61',NULL,NULL,NULL,2709,NULL,'0000-00-00',13,NULL,'Requesting to purchase items that will be used at all Public Schools and Ministry of Education Main Office.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(65,'2018-62',NULL,NULL,NULL,2709,NULL,'2018-01-03',22,NULL,'Request payment to purchase a round trip ticket from Kroror to Angaur for a MOE-Staff (IT) to repair and program Anger Elementary School Internet Server System.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(66,'2018-63',NULL,NULL,NULL,2709,NULL,'2018-01-03',12,NULL,'Request to purchase item to be used as a back drop at the gymnasium in Airai Elementary School for the upcoming event, Educational Awareness Week on March 12-16, 2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(67,'2018-64',NULL,NULL,NULL,2709,NULL,'2018-01-03',12,NULL,'Requesting items to be used to support Melekeok Elementary School for preparation of the upcoming Educational Awareness Week on March 12-16, 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(68,'2018-65',NULL,NULL,NULL,2709,NULL,'2018-07-03',13,NULL,'Requesting Open Purchase Order for Instructional Supplies for all MOE Public Schools in preparation SY 17-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(69,'2018-66',NULL,NULL,NULL,2709,NULL,'2018-07-03',7,NULL,'Requesting Open Purchase Order for Instructional Supplies for all MOE Public School in preparation SY17-18.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(70,'2018-67',NULL,NULL,NULL,2709,NULL,'2018-07-03',21,NULL,'Requesting Open Purchase Order for Instructional Supplies for All MOE-Public School in preparation SY17-18.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(71,'2018-68',NULL,NULL,NULL,2709,NULL,'0000-00-00',23,NULL,'Requesting payment for rooms to accommodate students from Anger and Peleliu Elementary Schools to attend PVA Field Trip on March 21-23, 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(72,'2018-69',NULL,NULL,NULL,2709,NULL,'0000-00-00',11,NULL,'Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of March 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(73,'2018-70',NULL,NULL,NULL,2709,NULL,'0000-00-00',5,NULL,'Requested materials to be used to fix water pumps at All Public Schools including Palau High School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');

/*!40000 ALTER TABLE `requisitions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table requisitions_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requisitions_items`;

CREATE TABLE `requisitions_items` (
  `requisitionItemId` int(11) NOT NULL AUTO_INCREMENT,
  `requisitionId` int(11) DEFAULT NULL,
  `org` varchar(4) DEFAULT NULL,
  `costCenter` varchar(10) DEFAULT NULL,
  `task` varchar(10) DEFAULT NULL,
  `opt` varchar(10) DEFAULT NULL,
  `acc` varchar(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `extended` float DEFAULT NULL,
  `fiscalYear` year(4) DEFAULT NULL,
  `sequenceNo` int(3) DEFAULT NULL,
  `rcvQuantity` decimal(10,3) DEFAULT NULL,
  `rcvPrice` decimal(10,3) DEFAULT NULL,
  `isValid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`requisitionItemId`),
  KEY `fiscalYear_idx` (`fiscalYear`,`org`,`costCenter`,`acc`),
  KEY `fk_requisitions_idx` (`requisitionId`),
  CONSTRAINT `fk_mofAllocations` FOREIGN KEY (`fiscalYear`, `org`, `costCenter`, `acc`) REFERENCES `mof_allotments` (`fiscalYear`, `org`, `costCenter`, `account`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_requisitions` FOREIGN KEY (`requisitionId`) REFERENCES `requisitions` (`requisitionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `requisitions_items` WRITE;
/*!40000 ALTER TABLE `requisitions_items` DISABLE KEYS */;

INSERT INTO `requisitions_items` (`requisitionItemId`, `requisitionId`, `org`, `costCenter`, `task`, `opt`, `acc`, `description`, `quantity`, `unit`, `price`, `extended`, `fiscalYear`, `sequenceNo`, `rcvQuantity`, `rcvPrice`, `isValid`)
VALUES
	(1,1,'1322','EB0E03','OPR',NULL,'1221','Open PO for School Bus Engine & Mechanical Services',1.000,'Lot',5000,5000,NULL,1,NULL,NULL,''),
	(3,3,'1322','EBOE03','OPR',NULL,'1440','Open PO Meeting Expenses',1.000,'Lot',2000,2000,NULL,1,NULL,NULL,''),
	(4,4,'1322','EBOE03','OPR',NULL,'1420','Light Bulb (indoor/outdoor',100.000,'Each',8.99,244.75,NULL,1,NULL,NULL,''),
	(9,7,'1301','ESBS01','OPR',NULL,'1420','Index Paper, 8.5 X 14',2000.000,'Each',0.3,600,NULL,1,NULL,NULL,''),
	(10,8,'1301','ESBS01','OPR',NULL,'1450','Handling Charges',1.000,'Each',24.99,24.99,NULL,1,NULL,NULL,''),
	(11,8,'1301','ESBS01','OPR',NULL,'1450','Wharfage Charges',1.000,'Each',3.53,3.53,NULL,2,NULL,NULL,''),
	(12,8,'1301','ESBS01','OPR',NULL,'1450','EA Fee',1.000,'Each',10,10,NULL,3,NULL,NULL,''),
	(14,10,'1322','EB0E03','OPR',NULL,'1222','Open PO for Boat Maintenance and Repairs',1.000,'Lot',2000,2000,NULL,1,NULL,NULL,''),
	(15,11,'1322','OPR','EB0E03',NULL,'1436','Open PO for Gasoline/Diesel/Oil',1.000,'Lot',9500,9500,NULL,1,NULL,NULL,''),
	(16,12,'1322','OPR','EB0E03',NULL,'1420','Tire, Wheelbarrow',2.000,'Each',59.99,119.98,NULL,1,NULL,NULL,''),
	(17,13,'1301','OPR','ESBSO1',NULL,'1420','Open PO for Instructional Supplies',1.000,'Lot',20000,20000,NULL,1,NULL,NULL,''),
	(18,14,'1322','OPR','EBOE03',NULL,'1221','Open PO for',1.000,'Lot',5000,5000,NULL,1,NULL,NULL,''),
	(19,15,'1322','EB0E03','OPR',NULL,'1222','Open PO for Boat Engine Maintenance and Repair',1.000,'Lot',2000,2000,NULL,1,NULL,NULL,''),
	(20,16,'1322','EB0E03','OPR',NULL,'1221','Open PO for Vehicle Service and Maintenance',1.000,'Lot',5000,5000,NULL,1,NULL,NULL,''),
	(21,17,'1301','OPR','ESBS01',NULL,'1555','Copier Machine',1.000,'Each',6850,6850,NULL,1,NULL,NULL,''),
	(22,18,'1322','OPR','EBOE03',NULL,'1220','Open PO for Office Equipment Repair Services & Parts for Computers, Copiers, Fax, and Printers.',1.000,'LOT',8500,8500,NULL,1,NULL,NULL,''),
	(23,19,'1302','OPR','EFOOD1',NULL,'1560','Vehicle, Van',1.000,'Each',7695,7695,NULL,1,NULL,NULL,''),
	(24,20,'1322','OPR','EBOEO3',NULL,'1420','Feed Clutch',1.000,'Each',375,375,NULL,1,NULL,NULL,''),
	(25,20,'1322','OPR','EBOE03',NULL,'1420','Belt Primary Drive',1.000,'Each',241.6,241.6,NULL,2,NULL,NULL,''),
	(26,20,'1322','OPR','EBOE03',NULL,'1420','Separator Base Unit',2.000,'Each',64.8,129.6,NULL,3,NULL,NULL,''),
	(27,20,'1322','OPR','EBOE03',NULL,'1420','Paper Feed Roller',6.000,'Each',152.8,916.8,NULL,4,NULL,NULL,''),
	(28,20,'1322','OPR','EBOE03',NULL,'1420','Service Labor',1.000,'Lot',55,55,NULL,5,NULL,NULL,''),
	(59,5,'1322','EBOE03','OPR',NULL,'1420','Trimmer Head',4.000,'Each',26.25,105,NULL,NULL,NULL,NULL,''),
	(60,5,'1322','EBOE03','OPR',NULL,'1420','Mop Head',10.000,'Each',8.85,88.5,NULL,NULL,NULL,NULL,''),
	(61,5,'1322','EBOE03','OPR',NULL,'1420','Mop Handle',10.000,'Each',14.75,147.5,NULL,NULL,NULL,NULL,''),
	(64,2,'1322','EBOE03','OPR','NULL','1440','Open PO Meeting Expenses',1.000,'Lot',2000,2000,NULL,NULL,NULL,NULL,''),
	(69,9,'1322','EB0E03','OPR',NULL,'1221','Open PO for School Bus Tire Service, Oil Changes & Other Preventive Maintenance',1.000,'Lot',5000,5000,NULL,NULL,NULL,NULL,''),
	(72,21,'1301','ESBS01',NULL,'OPR','1555','Copier Machine',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(73,22,'1322','EBOE03',NULL,'OPR','1420','No Slip Tape 4\"',3.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(74,22,'1322','EBOE03',NULL,'OPR','1420','Toilet, Elongated PRO-fit 2',2.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(75,22,'1322','EBOE03',NULL,'OPR','1420','Cement, White 50KG',7.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(76,23,'1322','EBOE03',NULL,'OPR','1420','Toilet,Elongated PRO-Fit 2',5.000,'Each',0,NULL,NULL,NULL,NULL,NULL,''),
	(83,24,'1322','EBOE03',NULL,'OPR','1420','Ridge Cap, Blue 8',30.000,'each',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(84,24,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Galvalume 26GA/32',30.000,'each',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(85,24,'1322','EBOE03',NULL,'OPR','1420','Plywood, ACX 1/4',20.000,'each',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(86,24,'1322','EBOE03',NULL,'OPR','1420','Lumber, Treated 2X2X16DF',30.000,'each',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(87,24,'1322','EBOE03',NULL,'OPR','1420','Nail, Roofing 2-21/2',50.000,'lbs.',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(88,24,'1322','EBOE03',NULL,'OPR','1420','Roof Cement, Wet/Dry Fiber Plastic',5.000,'gal.',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(89,25,'1322','EBOE03',NULL,'OPR','1420','Tn Roof, Rib Blue 32\"X 10\"',30.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(90,25,'1322','EBOE03',NULL,'OPR','1420','Tin Roof, Galvalume 26GA/32\"X12\"',30.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(91,25,'1322','EBOE03',NULL,'OPR','1420','Flat Tin, 26 Gauge 4\"X8\"',18.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(92,25,'1322','EBOE03',NULL,'OPR','1420','Paint Acrylic Roof Azure Blue Gloss Wen10',10.000,'gal.',0,NULL,NULL,NULL,NULL,NULL,''),
	(93,26,'1301','ESBS01',NULL,'OPR','1420','Open PO for Instructional Supplies',1.000,'lot',0,NULL,NULL,NULL,NULL,NULL,''),
	(94,27,'1301','ESBS01',NULL,'OPR','1420','Open PO for Instructional Supplies',1.000,'lot',0,NULL,NULL,NULL,NULL,NULL,''),
	(95,28,'1322','EBOE03',NULL,'OPR','1436','Open O for Gasoline/Diesel/Oil',1.000,'lot',0,NULL,NULL,NULL,NULL,NULL,''),
	(96,29,'1322','EBOE03',NULL,'OPR','1420','Tool Box 24\" plastic',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(97,29,'1322','EBOE03',NULL,'OPR','1420','Tool Set, 83pc. Auto',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(98,29,'1322','EBOE03',NULL,'OPR','1420','Square, Combination Plastic',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(99,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 9.5â€',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(100,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 12â€ V TG/GRV',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(101,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 8â€ Long Nose',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(102,29,'1322','EBOE03',NULL,'OPR','1420','Pliers, 10â€ TG/GRV',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(103,29,'1322','EBOE03',NULL,'OPR','1420','Snip, Left Cut 9-3/4â€ MIR',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(104,29,'1322','EBOE03',NULL,'OPR','1420','Plier, Locking Set Fast Release',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(105,29,'1322','EBOE03',NULL,'OPR','1420','Tool Set (Blade, Measuring Tape, Marker)',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(106,29,'1322','EBOE03',NULL,'OPR','1420','Screwdriver, 6pc. Set',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(107,29,'1322','EBOE03',NULL,'OPR','1420','Hacksaw, Frame',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(108,29,'1322','EBOE03',NULL,'OPR','1420','Square, Carpenter 8X12 STL',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(109,29,'1322','EBOE03',NULL,'OPR','1420','Blade, Hacksaw High speed Steel',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(110,29,'1322','EBOE03',NULL,'OPR','1420','Handsaw, 15â€ 9ft. Short Cut',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(111,29,'1322','EBOE03',NULL,'OPR','1420','Chisel, Set 3pcs. Wood',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(112,29,'1322','EBOE03',NULL,'OPR','1420','Blade, Utility Dispenser 025â€',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(113,29,'1322','EBOE03',NULL,'OPR','1420','Hammer, Claw Wood Handle 16oz.',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(114,29,'1322','EBOE03',NULL,'OPR','1420','Hammer, Claw Wood Handle 7oz.',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(115,30,'1322','EBOE03',NULL,'OR','1420','Lawmower, Push Gas 21\" Deck',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(116,30,'1322','EBOE3',NULL,'OPR','1420','Blower, Backpack 2-Cycle',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(117,30,'1322','EBOE03',NULL,'OPR','1420','Trimmer/Green Machine',2.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(118,31,'1322','EBOE03',NULL,'OPR','1420','Ventilator',2.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(119,32,'1322','EBOE03',NULL,'OPR','1585','Air Condition, Split 24,000 BTU',2.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(120,33,'1322','EBOE3',NULL,'OPR','1420','Air Condition, Split 24,000 BTU',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(122,35,'1322','EBOE03',NULL,'OPR','1585','Air Condition, Split 12,000 BTU',1.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(123,34,'1322','EBOE03',NULL,'OPR','1585','Air Condition, Split 24,000 BTU',1.000,'each',NULL,NULL,NULL,NULL,NULL,NULL,''),
	(124,36,'1322','EBOE03',NULL,'OPR','1420','Gift Bag, T-Shirt Style Small',500.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(125,36,'1322','EBOE03',NULL,'OPR','1420','Crayons, Bazic 8 Premium Quali',41.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(126,36,'1322','EBOE03',NULL,'OPR','1420','Coloring Book, w/Stickers 1ct/12',500.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(127,36,'1322','EBOE03',NULL,'OPR','1420','School Set, RS-1000 Assorte',500.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(128,36,'1322','EBOE03',NULL,'OPR','1420','Pencil, Bazic Fluorescent 8pk/24',500.000,'each',0,NULL,NULL,NULL,NULL,NULL,''),
	(129,36,'1322','EBOE03',NULL,'OPR','1440','Snacks',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,''),
	(130,37,'1322','EBOE03',NULL,'OPR','1440','Open PO for Meeting Expenses',1.000,'Lot',0,NULL,NULL,NULL,NULL,NULL,''),
	(131,38,'1322','EBOE03',NULL,'OPR','1420','Open PO for Meeting Expenses',1.000,'Lot',0,NULL,NULL,NULL,NULL,NULL,''),
	(132,6,'1322','EBOE03','OPR',NULL,'1420','Magnifier Desk Lamp',1.000,'Each',41.49,41.49,NULL,NULL,NULL,NULL,''),
	(133,39,'1322','EBOE03',NULL,'OPR','1440','Open PO for Meeting Expenses',1.000,'Lot',0,NULL,NULL,NULL,NULL,NULL,'');

/*!40000 ALTER TABLE `requisitions_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table requisitions_po_diff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `requisitions_po_diff`;

CREATE TABLE `requisitions_po_diff` (
  `poRequistionsDiffId` int(11) NOT NULL AUTO_INCREMENT,
  `poId` int(11) DEFAULT NULL,
  `requisitionsItemId` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`poRequistionsDiffId`),
  KEY `poId_idx` (`poId`),
  KEY `fk_requisitionsItems_idx` (`requisitionsItemId`),
  CONSTRAINT `fk_requisitionsItems` FOREIGN KEY (`requisitionsItemId`) REFERENCES `requisitions_items` (`requisitionItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `poId` FOREIGN KEY (`poId`) REFERENCES `po` (`poId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
	(4,'Mason?s Hardware','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL),
	(5,'W.C.T.C Ace Hardware','P.O. Box 280','','Koror','Palau','96940','Republic of Palau','(680) 488-1552','(680) 488-4189',NULL,NULL),
	(6,'Ngiratkel Etpison Company Inc.','','Ngetkib, Airai','Koror','Palau','96940','Republic of Palau','(680) 587-2031','(680) 587-2071',NULL,NULL),
	(7,'West Office Supply','P.O. Box 280','','Koror','Palau','96940','Republic of Palau','(680) 488-2363','(680) 488-5610',NULL,NULL),
	(8,'Palau Shipping Co. Inc.','P.O. Box 6000','Port Area, Malakal','Koror','Palau','96940','Republic of Palau','(680) 488-2629','(680) 488-1095',NULL,NULL),
	(9,'Midtown Service Center','P.O. Box 9064','','Koror','Palau','96940','Republic of Palau','(680) 488-2245','(680) 488-6484',NULL,NULL),
	(10,'NECO Yamaha Corporation','P.O. Box 129','','Koror','Palau','96940','Republic of Palau','(680) 488-1100','(680) 488-1804',NULL,NULL),
	(11,'IP&E Palau Inc.','P.O. Box 1678','','Koror','Palau','96940','Republic of Palau','(680) 488-6464','(680) 488-6363',NULL,NULL),
	(12,'Mason?s Hardware Do-It Center','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','(680) 488-5353',NULL,NULL),
	(13,'Jezrrae Wear II','P.O. Box 7048',NULL,'Koror','Palau','96940','Republic of Palau','(680) 488-2662','(680) 488-2005',NULL,NULL),
	(14,'Mason?s Mercury Marine','P.O. Box 295','','Koror','Palau','96940','Republic of Palau','(680) 488-3660','',NULL,NULL),
	(15,'IR Motors','P.O. Box 9064','','Koror','Palau','96940','Republic of Palau','(680) 488-5600','(680) 488-7433',NULL,NULL),
	(16,'W.C.T.C BF-Department Store','P.O. Box 280',NULL,'Koror','Palau','96940',NULL,'(680)488-1633','(680) 488-8523',NULL,NULL),
	(17,'Accrediting Commission for Schools','Western Association of Schools and Colleges (','533 Airport Boulevard, Suite 200','Burlingame','CA','94010',NULL,'(650) 696-1060','(650) 696-1867',NULL,NULL),
	(18,'Sarahs Yum Yum','Koror, Palau',NULL,'Koror','Palau','96940',NULL,'(650) 488-5590',NULL,NULL,NULL),
	(19,'KR Construction','P.O. Box 2000','Koror, Palau','Koror','Palau','96940',NULL,'(650) 488--5865',NULL,NULL,NULL),
	(20,'Palau National Communication Corporation (PNC','P.O.Box 99','Koror , Palau','Koror','Palau','96940',NULL,'(680) 4888-9600','(680) 488-9090',NULL,NULL),
	(21,'Surangel & Son\'s Company','P.O.Box 295','Republic of Palau','Koror','Palau','96940',NULL,'(680) 488-2608','(680)488-1535',NULL,NULL),
	(22,'Pacific Mission Aviation','P.O.Box 906','Koror, Republic of Palau','Koror','Palau','96940',NULL,'(680) 587-4567','(680) 778-2747',NULL,NULL),
	(23,'YUHI HOTEL',NULL,'Koror, Republic of Palau','Koror','Palau','96940',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
