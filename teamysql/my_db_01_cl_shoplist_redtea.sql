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
-- Table structure for table `cl_shoplist_redtea`
--

DROP TABLE IF EXISTS `cl_shoplist_redtea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_shoplist_redtea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `imgUrl` varchar(255) NOT NULL,
  `recommend` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='红茶';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_shoplist_redtea`
--

LOCK TABLES `cl_shoplist_redtea` WRITE;
/*!40000 ALTER TABLE `cl_shoplist_redtea` DISABLE KEYS */;
INSERT INTO `cl_shoplist_redtea` VALUES (1,'英德红茶','http://img.tea7.com/0167288_0.jpeg?x-oss-process=image/resize,w_150','红茶'),(2,'坦洋工夫','http://img.tea7.com/0167289_0.jpeg?x-oss-process=image/resize,w_150','红茶'),(3,'金骏眉','http://img.tea7.com/0011372_0.jpeg?x-oss-process=image/resize,w_150','红茶'),(4,'正山小种','http://img.tea7.com/0011449_0.jpeg?x-oss-process=image/resize,w_150','红茶'),(5,'云南滇红','http://img.tea7.com/0011450_0.jpeg?x-oss-process=image/resize,w_150','红茶');
/*!40000 ALTER TABLE `cl_shoplist_redtea` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 19:56:20
