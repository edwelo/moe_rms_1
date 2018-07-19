# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.22)
# Database: finance3
# Generation Time: 2018-07-19 09:54:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
  `justification` text,
  `numItems` int(11) DEFAULT NULL,
  `rqAmount` decimal(10,3) DEFAULT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `approvedDate` date DEFAULT NULL,
  `mofDeliveredDate` date DEFAULT NULL,
  `poNo` varchar(11) DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `poAmount` decimal(10,3) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `statusDate` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT '',
  `isValid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`requisitionId`),
  KEY `vendorId_idx` (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `requisitions` WRITE;
/*!40000 ALTER TABLE `requisitions` DISABLE KEYS */;

INSERT INTO `requisitions` (`requisitionId`, `requisitionNo`, `initiatingOffice`, `requestedBy`, `requestedDate`, `preparedById`, `preparedByName`, `preparedDate`, `vendorId`, `vendorName`, `justification`, `numItems`, `rqAmount`, `quotationId`, `approvedDate`, `mofDeliveredDate`, `poNo`, `poDate`, `poAmount`, `status`, `statusDate`, `remarks`, `isValid`)
VALUES
	(1,'2017-04','BEA-Transportation','Godinez Renguul','2017-10-04',709,'Bonnie Imeong','2017-10-06',1,'Ksau Motors','Requesting Open Purchase order for school bus engine and mechanical services for MOE School Buses that needs extensive monthly upkeep to prolong their services to the Ministry. Vendor is selected based on their experience with servicing MOE buses. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',1,5000.000,NULL,'2017-11-01','2017-11-03','L55555','2017-11-20',5000.000,NULL,NULL,NULL,''),
	(2,'2018-10','BEA','Andrew Tabelual','2017-10-11',709,'Bonnie Imeong','2017-10-11',2,'Flamingo Restaurant','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',1,2000.000,NULL,'2017-10-11','2017-11-08','L55556','2017-11-30',2000.000,NULL,NULL,NULL,''),
	(3,'2018-11',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',3,'Best Coffee & Donut House','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Flamingo Fish & Steak as sometimes the other vendor will have other clients and their services will be unavailable.',1,2000.000,NULL,NULL,NULL,NULL,NULL,2000.000,NULL,NULL,NULL,''),
	(4,'2018-12','Meyuns','Principal','2017-10-10',709,'Bonnie Imeong','2017-10-11',4,'Mason?s Hardware','Requesting items to be used at Meyuns and G.B Harris Elementary School.',1,899.000,NULL,'2017-11-03','2017-11-03','L55558','2017-11-30',899.000,NULL,NULL,NULL,''),
	(5,'2018-13',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',5,'W.C.T.C Ace Hardware','Requesting items to be used at George B. Harris Elementary School.',3,341.000,NULL,NULL,NULL,NULL,NULL,341.000,NULL,NULL,NULL,''),
	(6,'2018-14',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',6,'Ngiratkel Etpison Company Inc.','Requesting PETTY CASH to purchase this item to be used at MOE-IT Office.',1,41.490,NULL,NULL,NULL,NULL,NULL,41.490,NULL,NULL,NULL,''),
	(7,'2018-16',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',7,'West Office Supply','Request to purchase additional paper to print Report Cards for the school.',1,600.000,NULL,NULL,NULL,NULL,NULL,600.000,NULL,NULL,NULL,''),
	(8,'2018-17',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-11',8,'Palau Shipping Co. Inc.','Request PETTY CASH to pay invoices for Instructional Supplies for P.E.',3,38.520,NULL,NULL,NULL,NULL,NULL,38.520,NULL,NULL,NULL,''),
	(9,'2018-06',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-06',9,'Midtown Service Center','Requesting Open Purchase order for school bus tire services, oil changes and other preventive services for MOE School Buses that needs extensive monthly upkeep to prolong their services to the Ministry. Vendor is selected based on their experience with servicing MOE buses. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',1,5000.000,NULL,NULL,NULL,NULL,NULL,5000.000,NULL,NULL,NULL,''),
	(10,'2018-07',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-25',10,'NECO Yamaha Corporation','Requesting Open Purchase Order for MOE boat maintenance and repairs to cover this first (1st) quarter cost and expenses for this FY2018. Maintenance and repairs are necessary for MOE boats to ensure delivery of school supplies (i.e., textbooks, tests, school lunch menus etc.), specialists? visitations and school assessments by MOE specialists. Vendor is chosen, as it is the only vendor that deals with Yamaha engines and merchandises. *Requisition to replace returned RQ.  Please see attached returned RQ.',1,2000.000,NULL,NULL,NULL,NULL,NULL,2000.000,NULL,NULL,NULL,''),
	(11,'2017-01',NULL,NULL,NULL,709,'Bonnie Imeong','2017-09-03',11,'IP&E Palau Inc.','Requesting Open Purchase order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of OCTOBER 2017. Vendor offers cheaper services and has issued fleet cards, which gives us convenient access to any Shell gas stations.',1,9500.000,NULL,NULL,NULL,NULL,NULL,9500.000,NULL,NULL,NULL,''),
	(12,'2017-02',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-04',12,'Mason?s Hardware Do-It Center','Requesting items to help unloading school instructional materials and supplies for Sonsorol Elementary School.  Requesting for ?Petty Cash?.',1,119.980,NULL,NULL,NULL,NULL,NULL,119.980,NULL,NULL,NULL,''),
	(13,'2017-03',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-04',13,'Jezrrae Wear II','Requesting Open Purchase Order for Instructional Supplies for all MOE Public School in preparation school year SY17-18.',1,20000.000,NULL,NULL,NULL,NULL,NULL,20000.000,NULL,NULL,NULL,''),
	(14,'2017-05',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-06',9,'Midtown Service Center','Requesting Open Purchase order for vehicle service/maintenance for MOE vehicles that need monthly maintenance to prolong its running life. Vendor is selected based on their experience with servicing MOE vehicles. This request will cover costs and expenses for this fourth (4th) quarter fiscal year 2017.',1,5000.000,NULL,NULL,NULL,NULL,NULL,5000.000,NULL,NULL,NULL,''),
	(15,'2018-05',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-25',14,'Mason?s Mercury Marine','Requesting Open Purchase Order for MOE boat maintenance and repairs to cover this first (1st) quarter cost and expenses for this FY2018. Maintenance and repairs are necessary for MOE boats to ensure delivery of school supplies (i.e., textbooks, tests, school lunch menus etc.), specialists? visitations and school assessments by MOE specialists. Vendor is chosen, as it is the only vendor that deals with Mercury engines and merchandises. *Requisition to replace returned RQ.  Please see attached returned RQ.',1,2000.000,NULL,NULL,NULL,NULL,NULL,2000.000,NULL,NULL,NULL,''),
	(16,'2018-08',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-07',1,'Ksau Motors','Requesting Open Purchase order for vehicle service/maintenance for MOE vehicles that need monthly maintenance to prolong its running life. Vendor is selected based on their experience with servicing MOE vehicles. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018. *See attached lists of MOE vehicles and quotes.',1,5000.000,NULL,NULL,NULL,NULL,NULL,5000.000,NULL,NULL,NULL,''),
	(17,'2018-20',NULL,NULL,NULL,709,'Bonnie Imeong','2017-11-02',7,'West Office Supply','Requesting items to be used to support school activities and programs at George B. Harris Elementary School. School Year 17-18.',1,6850.000,NULL,NULL,NULL,NULL,NULL,6850.000,NULL,NULL,NULL,''),
	(18,'2018-09',NULL,NULL,NULL,709,'Bonnie Imeong','2017-10-10',13,'Jezrrae Wear II','Requesting open purchase order for office equipment repair services and parts for computers, copiers, fax and printers for the Ministry of Education for this first (1st) quarter FY 2018. We choose this vendor because they have worked long with MOE and are familiar with services needed for equipment?s. *See attached list of office equipment?s and quotes.',1,8500.000,NULL,NULL,NULL,NULL,NULL,8500.000,NULL,NULL,NULL,''),
	(19,'2018-18','BEA-Food','Brynn','2017-08-01',709,'Joanne Mikel','2017-10-30',15,'IR Motors','Requesting for additional vehicle to be used at MOE/Food Service Program to help deliver fresh fruits and vegetables to all Public Elementary School on time.',1,7695.000,NULL,'2017-11-05','2017-11-06','L55564','2017-12-16',7695.000,NULL,NULL,NULL,''),
	(20,'2018-19','BEA-MPC','Ereneo Misajon','2017-10-28',709,'Bonnie Imeong','2017-11-02',13,'Jezrrae Wear II','Requesting to purchase items needed to repair and service DUPLO Printer, DP-J450/RP#3992.',5,1718.000,NULL,'2017-11-05','2017-11-06','L55560','2017-11-18',1718.000,'closed rcvId 3','2018-01-20',NULL,''),
	(21,'2018-21',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-11-06',13,'Jezrrae Wear II','Requesting a Copier Machine to be used to support school programs and activities at G.B. Harris Elementary School. SY2018.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(22,'23',NULL,NULL,NULL,2709,'Bonnie Imeong','2011-10-17',12,'Mason?s Hardware Do-It Center','Requesting to purchase items to repair restroom at Ibobang Elementary School.',3,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(23,'24',NULL,NULL,NULL,2709,'Bonnie Imeong','2010-10-17',12,'Mason?s Hardware Do-It Center','Requesting to purchase items to repair restrooms at George B. Harris Elementary School',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(24,'#2018-25',NULL,NULL,NULL,2709,'Bonnie Imeong','2011-10-17',12,'Mason?s Hardware Do-It Center','Requesting to purchase items to repair classrooms, restrooms and kitchen at Melekeok Elementary School.',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(25,'2018-26',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Requesting to purchase items to repair classrooms and main office at Airai Elementary School.',4,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(26,'2018-27',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',13,'Jezrrae Wear II','Requesting Open Purchase order for Additional Instructional Supplies for all MOE Public Schools. This request will cover costs and expenses for this first 1st) Quarter Fiscal Year 2018.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(27,'20108-28',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',7,'West Office Supply','Requesting Open Purchase order for Additional Instructional Supplies for all MOE public schools. This request will cover costs and expenses for this first (1st) quarter fiscal year 2018.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(28,'2018-30',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',11,'IP&E Palau Inc.','Requesting Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of December 2017. Vendor offers cheaper services and has issued fleet cards, which gives us convenient access to any Shell Gas Station.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(29,'2018-31',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Requesting items to purchase maintenance tools to be used to repair & maintain Peleliu Elementary School Facility',19,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(30,'#2018-32',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Requesting to purchase items to help maintain school campus and facility at Peleliu Elementary School',3,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(31,'#2018-33',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',5,'W.C.T.C Ace Hardware','Requesting items to Koror Elementary School Cafeteria to help to reduce heat inside the kitchen.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(32,'#2018-34','DSM','Ray Mechol','2017-10-23',2709,'Bonnie Imeong','2017-10-25',12,'Mason?s Hardware Do-It Center','Requesting purchase order for items to replace air conditions at Palau High School (English & Palauan Classroom), as they are old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',1,0.000,NULL,'2017-10-26','2017-10-27','L55558','2017-11-14',0.000,NULL,NULL,NULL,''),
	(33,'#2018-35',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Requesting purchase order for items to replace air condition at Melekeok Elementary School (8th grade classroom) as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(34,'#2018-36',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Requesting purchase order for items to replace air condition at G.B. Harris Elementary School (Lab 2) as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for parts.',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(35,'#2018-37',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Requesting purchase order for items to replace air condition at Bureau of Education Administration/Division of School Management, as it is old and can no longer be repaired. Vendor is chosen as they offer reasonable prices, with one-year warranty for ',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(36,'#2018-38',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',16,'W.C.T.C BF-Department Store','Requesting purchase order for items to be used by the Ministry of Education for hosting of the 2017 Childrenâ€™s Christmas Program on December 12, 2017 at 7:30pm. Vendor is chosen as they offer cheapest prices for requested items. ',6,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(37,'#2018-39',NULL,NULL,NULL,2709,'Bonnie Imeong','2012-05-17',2,'Flamingo Restaurant','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(38,'#2018-40',NULL,NULL,NULL,2709,'Bonnie Imeong','2012-05-17',3,'Best Coffee & Donut House','Request for Open Purchase Order for snacks, drinks, and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultations with guests. Splitting vendors with Flamingo Fish & Steak as sometimes the other vendor will have other clients and their services will be unavailable.',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(39,'39',NULL,NULL,NULL,2709,'Bonnie Imeong','2017-05-12',2,'Flamingo Restaurant','Request to Open Purchase Order for snacks, drinks and bento meals for the Bureau of Education Administration. Open PO will be used by the Director for sponsored meetings, events and for any other consultation with guests. Splitting vendors with Best Coffee & Donut House as sometimes the other vendor will have other clients and their services will be unavailable.\r\n',1,0.000,NULL,NULL,NULL,NULL,NULL,0.000,NULL,NULL,NULL,''),
	(40,'#2018-40',NULL,NULL,NULL,2709,'Bonnie Imeong','2017-05-12',3,'Best Coffee & Donut House','Open PO will be used by Director for sponsered meetings, events and for any other consultations with guests.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(41,'#2018-41',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',5,'W.C.T.C Ace Hardware','Request to purchase items to change rusted and leaking roofs at Polo Anna Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(42,'#2018-42',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',12,'Mason?s Hardware Do-It Center','Request to purchase additional materials that will be used to renovate cafeteria at Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(43,'#2018-43',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',17,'Accrediting Commission for Schools','Requesting payment to Western Association of Schools and Colleges (wASC) accreditation initial list fees for Elementary Schools which include Koror Elementary School, George B. Harris Elementary School, Meyuns Elementary School, Airai Elementary School and Melekeok Elementary School.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(44,'#2018-43',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-11-01',18,'Sarahs Yum Yum','Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17 at Palau High School Multi-Purpose Building.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(45,'#2018-44',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-02-01',11,'IP&E Palau Inc.','Requesting Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover all expenses for the month of January 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(46,'#2018-44',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-01',2,'Flamingo Restaurant','Requesting payment to purchase meals for the upcoming Palau High School Professional Learning Communities Workshop to be held on January 15-17,02018 at Palau High School Multi-Purpose Building.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(47,'#2018-45',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',13,'Jezrrae Wear II','Requesting to purchase items to be used for MOE-IT/Bureau of Education Administration Office program activities.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(48,'#2018-46',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',9,'Midtown Service Center','Requesting Open Purchase Order for vehicle service/maintenance for MOE vehicles that needs monthly maintenance to prolong its running life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(49,'#2018-47',NULL,NULL,NULL,2709,'Bonnie Imeong','2017-10-10',13,'Jezrrae Wear II','Open Purchase Order for office equipment repair services and parts for computers, copiers, fax and printers for the Ministry of Education for the Third (3rd) Quarter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(50,'#2018-48',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-02-02',12,'Mason?s Hardware Do-It Center','Requesting Materials that will be used to fulfill all schools Job Order Requests for 2nd Quarter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(51,'#2018-49',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',13,'Jezrrae Wear II','Requesting to purchase items to fix the Walkway at Airai Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(52,'#2018-50',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',19,'KR Construction','Request Open Purchase Order to cover for Contractor cost services for doing special request for schools facilities and maintenance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(53,'#2018-50',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-06-02',13,'Jezrrae Wear II','Requesting to purchase items to be installed at Koror Elementary School (Principals Office)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(54,'#2018-51',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-06-02',5,'W.C.T.C Ace Hardware','Requesting to purchase items to be installed at Melekeok Elementary School (3rd grade), Ngeremlengui Elementary School (Library), Palau High School (Science Lab) and GBH Elementary School (Lab).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(55,'2018-52',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-08-02',11,'IP&E Palau Inc.','Open Purchase Order for fuel to be used by the Ministry Of Education. Open PO will be used to cover the costs and expenses for the month of February 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(56,'2018-53',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',9,'Midtown Service Center','Requesting payment to repair School Bus (Hyundai Plate # 1147)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(57,'2018-54',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',20,'Palau National Communication Corporation (PNC','Requesting to purchase items that will be used to replace broken modules at Ministry of Education PBX Telephone System.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(58,'2018-55',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',5,'W.C.T.C Ace Hardware','To purchase materials that will be used to build a base for flag pole at Ngaraard Elementary School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(59,'201-56',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',5,'W.C.T.C Ace Hardware','All items listed will purchased will be used to fulfill all schools Job Order Requests for 2nd Quarter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(60,'2018-57',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',11,'IP&E Palau Inc.','Requesting Open Purchase Order for fuel to be used by the Ministry of Education to cover the costs and expenses for the month of February 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(61,'2018-58',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',9,'Midtown Service Center','Requesting Open Purchase Order for school bus tire service, oil changes and other preventive for MOE School Buses that needs monthly upkeep to prolong their services to the Ministry. This request will cover costs and expenses for the 2nd Quarter 2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(62,'2018-59',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',5,'W.C.T.C Ace Hardware','Requesting to purchase items that will be used at G.B. Harris Elementary School for the upcoming events Educational Awareness Week on March 12-16, 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(63,'2018-60',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',21,'Surangel & Son\'s Company','Requesting to purchase item to be used for conference and other meetings conducted by the Directors of Bureau of Education Administration.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(64,'2018-61',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',13,'Jezrrae Wear II','Requesting to purchase items that will be used at all Public Schools and Ministry of Education Main Office.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(65,'2018-62',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-03',22,'Pacific Mission Aviation','Request payment to purchase a round trip ticket from Kroror to Angaur for a MOE-Staff (IT) to repair and program Anger Elementary School Internet Server System.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(66,'2018-63',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-03',12,'Mason?s Hardware Do-It Center','Request to purchase item to be used as a back drop at the gymnasium in Airai Elementary School for the upcoming event, Educational Awareness Week on March 12-16, 2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(67,'2018-64',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-01-03',12,'Mason?s Hardware Do-It Center','Requesting items to be used to support Melekeok Elementary School for preparation of the upcoming Educational Awareness Week on March 12-16, 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(68,'2018-65',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-07-03',13,'Jezrrae Wear II','Requesting Open Purchase Order for Instructional Supplies for all MOE Public Schools in preparation SY 17-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(69,'2018-66',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-07-03',7,'West Office Supply','Requesting Open Purchase Order for Instructional Supplies for all MOE Public School in preparation SY17-18.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(70,'2018-67',NULL,NULL,NULL,2709,'Bonnie Imeong','2018-07-03',21,'Surangel & Son\'s Company','Requesting Open Purchase Order for Instructional Supplies for All MOE-Public School in preparation SY17-18.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(71,'2018-68',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',23,'YUHI HOTEL','Requesting payment for rooms to accommodate students from Anger and Peleliu Elementary Schools to attend PVA Field Trip on March 21-23, 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(72,'2018-69',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',11,'IP&E Palau Inc.','Open Purchase Order for fuel to be used by the Ministry of Education. Open PO will be used to cover the costs and expenses for the month of March 2018.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
	(73,'2018-70',NULL,NULL,NULL,2709,'Bonnie Imeong','0000-00-00',5,'W.C.T.C Ace Hardware','Requested materials to be used to fix water pumps at All Public Schools including Palau High School',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');

/*!40000 ALTER TABLE `requisitions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
