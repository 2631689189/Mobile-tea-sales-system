-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: my_db_01
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cl_useraction`
--

DROP TABLE IF EXISTS `cl_useraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_useraction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uId` varchar(45) DEFAULT NULL,
  `numbe` int NOT NULL,
  `typeof` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_useraction`
--

LOCK TABLES `cl_useraction` WRITE;
/*!40000 ALTER TABLE `cl_useraction` DISABLE KEYS */;
INSERT INTO `cl_useraction` VALUES (1,'16',45,'1'),(2,'16',11,'2'),(3,'16',56,'3'),(4,'16',19,'4'),(5,'16',14,'5'),(6,'16',66,'6'),(7,'16',39,'7'),(8,'17',2,'2'),(9,'18',4,'7'),(10,'18',10,'3'),(11,'18',3,'4'),(12,'18',4,'1'),(13,'18',4,'6'),(14,'18',1,'2'),(15,'25',1,'6'),(16,'25',1,'3'),(17,'26',3,'1'),(18,'26',9,'4'),(19,'26',9,'7'),(20,'26',11,'3'),(21,'26',4,'2'),(22,'26',9,'6'),(23,'26',4,'5'),(24,'27',5,'4'),(25,'27',3,'2'),(26,'27',1,'3'),(27,'27',4,'5'),(28,'27',5,'6'),(29,'27',3,'7'),(30,'27',1,'1'),(31,'28',7,'6'),(32,'28',4,'5'),(33,'28',5,'4'),(34,'28',4,'2'),(35,'28',4,'1'),(36,'28',4,'7'),(37,'28',4,'3'),(38,'29',3,'1'),(39,'29',3,'2'),(40,'29',3,'3'),(41,'29',3,'4'),(42,'29',3,'5'),(43,'29',3,'6'),(44,'29',2,'7'),(45,'30',4,'3'),(46,'30',3,'2'),(47,'30',5,'1'),(48,'30',2,'4'),(49,'30',1,'5'),(50,'30',4,'6'),(51,'30',3,'7'),(52,'31',1,'2'),(53,'31',2,'3'),(54,'31',3,'4'),(55,'31',4,'5'),(56,'31',4,'7'),(57,'31',4,'6'),(58,'31',2,'1'),(59,'32',2,'2'),(60,'32',3,'3'),(61,'32',4,'5'),(62,'32',2,'7'),(63,'32',3,'6'),(64,'32',4,'4'),(65,'32',2,'1'),(66,'33',5,'3'),(67,'33',3,'5'),(68,'33',4,'4'),(69,'33',3,'6'),(70,'33',4,'1'),(71,'33',3,'7');
/*!40000 ALTER TABLE `cl_useraction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 19:56:18
