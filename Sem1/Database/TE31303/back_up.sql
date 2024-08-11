-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Linux (x86_64)
--
-- Host: 10.10.10.216    Database: t31303db
-- ------------------------------------------------------
-- Server version	5.5.43-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `dept_name` varchar(20) DEFAULT NULL,
  `building` varchar(20) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dept`
--

DROP TABLE IF EXISTS `Dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dept` (
  `dept_id` int(11) NOT NULL DEFAULT '0',
  `dname` varchar(20) NOT NULL,
  `dlocation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dept`
--

LOCK TABLES `Dept` WRITE;
/*!40000 ALTER TABLE `Dept` DISABLE KEYS */;
INSERT INTO `Dept` VALUES (1,'Computer','Mumbai'),(2,'IT','Mulund'),(3,'ENTC','Pune'),(4,'Mechanical','Malad'),(5,'Electrical','Pune'),(6,'Civil','Mumbai'),(7,'AIML','Kolhapur');
/*!40000 ALTER TABLE `Dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (1,'PQR','Comp',10000),(2,'dd','Comp',10000);
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `proj_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `pname` varchar(20) NOT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `pcost` int(11) DEFAULT NULL,
  `pyear` date DEFAULT NULL,
  PRIMARY KEY (`proj_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `Dept` (`dept_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,1,'Tata Power','Mumbai',200000,'2018-01-01'),(2,2,'Olectra','Pune',100000,'2018-05-01'),(3,3,'ProjElect','Mumbai',50000,'2018-12-01'),(4,1,'Web','Mumbai',50000,'2020-01-01'),(5,6,'Construction','Mumbai',50000,'2021-01-01');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `credit` int(11) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31304 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (10101,'ABC EFG',99,'2002-01-01','abc@gmail.com',NULL),(31301,'PQR',10,'2002-05-09','pqr@pqr.com',NULL),(31303,'Shreyash Bachate',100,'2002-09-20','shreyashbachate@gmai',NULL);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `Salary` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `Dept` (`dept_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Raja','Raman','G.Manager','2010-01-01','2000000'),(2,1,'Rohit','Dhavan','Manager','2012-03-01','1000000'),(3,1,'Prajwal','Kakade','HR','2016-04-01','500000'),(4,2,'Gaurav','Chawda','HR','2016-04-01','500000'),(5,3,'Sid','Bhusari','HR','2016-04-01','500000'),(6,4,'Tushar','Bhurale','employee','2018-05-01','450000'),(7,5,'Vinayak','Gondkar','employee','2018-07-01','450000'),(8,6,'Yash','Ghosalkar','employee','2018-07-01','450000'),(9,7,'Suyash','Teli','employee','2019-07-01','400000'),(10,1,'Rohan','Tithe','employee','2020-07-01','400000');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-29  9:29:22
