CREATE DATABASE  IF NOT EXISTS `swipesystem` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `SwipeSystem`;
-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: SwipeSystem
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `center`
--

DROP TABLE IF EXISTS `center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center` (
  `centerId` int(11) NOT NULL AUTO_INCREMENT,
  `centerName` varchar(100) NOT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `location` varchar(250) NOT NULL,
  `directorName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`centerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center`
--

LOCK TABLES `center` WRITE;
/*!40000 ALTER TABLE `center` DISABLE KEYS */;
/*!40000 ALTER TABLE `center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centertutor`
--

DROP TABLE IF EXISTS `centertutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centertutor` (
  `centerId` int(11) NOT NULL,
  `tutorId` varchar(250) NOT NULL,
  PRIMARY KEY (`centerId`,`tutorId`),
  KEY `tutorId` (`tutorId`),
  CONSTRAINT `centertutor_ibfk_1` FOREIGN KEY (`centerId`) REFERENCES `center` (`centerId`),
  CONSTRAINT `centertutor_ibfk_2` FOREIGN KEY (`tutorId`) REFERENCES `tutor` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centertutor`
--

LOCK TABLES `centertutor` WRITE;
/*!40000 ALTER TABLE `centertutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `centertutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseId` varchar(100) NOT NULL,
  `courseName` varchar(500) NOT NULL,
  `centerId` int(11) NOT NULL,
  PRIMARY KEY (`courseId`),
  KEY `centerId` (`centerId`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`centerId`) REFERENCES `center` (`centerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursesection`
--

DROP TABLE IF EXISTS `coursesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursesection` (
  `crn` varchar(250) NOT NULL,
  `courseId` varchar(250) NOT NULL,
  `section` varchar(250) DEFAULT NULL,
  `professorName` varchar(250) DEFAULT NULL,
  `semester` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`crn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursesection`
--

LOCK TABLES `coursesection` WRITE;
/*!40000 ALTER TABLE `coursesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `crn` varchar(250) NOT NULL,
  `studentId` varchar(250) NOT NULL,
  PRIMARY KEY (`crn`,`studentId`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`crn`) REFERENCES `coursesection` (`crn`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentId` varchar(250) NOT NULL,
  `fName` varchar(250) NOT NULL,
  `lName` varchar(250) NOT NULL,
  `email` varchar(500) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Student_id','Student_name','Student_email','');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary`
--

DROP TABLE IF EXISTS `temporary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary` (
  `studentId` varchar(250) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `courseId` varchar(100) DEFAULT NULL,
  `section` varchar(250) DEFAULT NULL,
  `courseName` varchar(500) DEFAULT NULL,
  `crn` varchar(250) DEFAULT NULL,
  `professorName` varchar(250) DEFAULT NULL,
  `iEmail` varchar(250) DEFAULT NULL,
  `semester` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary`
--

LOCK TABLES `temporary` WRITE;
/*!40000 ALTER TABLE `temporary` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `studentId` varchar(250) NOT NULL,
  `name` varchar(500) NOT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorcourse`
--

DROP TABLE IF EXISTS `tutorcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorcourse` (
  `tutorId` varchar(250) NOT NULL,
  `courseId` varchar(250) NOT NULL,
  `centerId` int(11) NOT NULL,
  PRIMARY KEY (`tutorId`,`courseId`),
  KEY `courseId` (`courseId`),
  KEY `centerId` (`centerId`),
  CONSTRAINT `tutorcourse_ibfk_1` FOREIGN KEY (`tutorId`) REFERENCES `tutor` (`studentId`),
  CONSTRAINT `tutorcourse_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `tutorcourse_ibfk_3` FOREIGN KEY (`centerId`) REFERENCES `center` (`centerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorcourse`
--

LOCK TABLES `tutorcourse` WRITE;
/*!40000 ALTER TABLE `tutorcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutorcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorform`
--

DROP TABLE IF EXISTS `tutorform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorform` (
  `sequenceId` int(11) NOT NULL AUTO_INCREMENT,
  `centerId` int(11) NOT NULL,
  `tutorId` varchar(250) NOT NULL,
  `studentId` varchar(250) NOT NULL,
  `crn` varchar(250) NOT NULL,
  `comments` varchar(500) NOT NULL,
  `times` varchar(250) NOT NULL,
  `duration` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  PRIMARY KEY (`sequenceId`),
  KEY `centerId` (`centerId`),
  KEY `tutorId` (`tutorId`),
  KEY `studentId` (`studentId`),
  KEY `crn` (`crn`),
  CONSTRAINT `tutorform_ibfk_1` FOREIGN KEY (`centerId`) REFERENCES `center` (`centerId`),
  CONSTRAINT `tutorform_ibfk_2` FOREIGN KEY (`tutorId`) REFERENCES `centertutor` (`tutorId`),
  CONSTRAINT `tutorform_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`),
  CONSTRAINT `tutorform_ibfk_4` FOREIGN KEY (`crn`) REFERENCES `coursesection` (`crn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorform`
--

LOCK TABLES `tutorform` WRITE;
/*!40000 ALTER TABLE `tutorform` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutorform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorworking`
--

DROP TABLE IF EXISTS `tutorworking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorworking` (
  `centerId` int(11) NOT NULL,
  `tutorId` varchar(250) NOT NULL,
  `inTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reportedTimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actualTimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stat` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`centerId`,`tutorId`,`inTime`),
  KEY `tutorId` (`tutorId`),
  CONSTRAINT `tutorworking_ibfk_1` FOREIGN KEY (`centerId`) REFERENCES `centertutor` (`centerId`),
  CONSTRAINT `tutorworking_ibfk_2` FOREIGN KEY (`tutorId`) REFERENCES `centertutor` (`tutorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorworking`
--

LOCK TABLES `tutorworking` WRITE;
/*!40000 ALTER TABLE `tutorworking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutorworking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visitId` int(11) NOT NULL,
  `studentId` varchar(250) NOT NULL,
  `inTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `centerId` int(11) NOT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `status` varchar(250) NOT NULL,
  PRIMARY KEY (`visitId`),
  KEY `studentId` (`studentId`),
  KEY `centerId` (`centerId`),
  CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`),
  CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`centerId`) REFERENCES `center` (`centerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-16 18:56:01
