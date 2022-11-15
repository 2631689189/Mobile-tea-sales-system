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
-- Table structure for table `cl_shoplist_greentea`
--

DROP TABLE IF EXISTS `cl_shoplist_greentea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_shoplist_greentea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `imgUrl` varchar(255) NOT NULL,
  `recommend` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类下的绿茶';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_shoplist_greentea`
--

LOCK TABLES `cl_shoplist_greentea` WRITE;
/*!40000 ALTER TABLE `cl_shoplist_greentea` DISABLE KEYS */;
INSERT INTO `cl_shoplist_greentea` VALUES (1,'龙井','http://img.tea7.com/0011479_0.jpeg?x-oss-process=image/resize,w_150','绿茶'),(2,'黄山毛峰','http://img.tea7.com/0011444_0.jpeg?x-oss-process=image/resize,w_150','绿茶'),(3,'碧螺春','http://img.tea7.com/0011445_0.jpeg?x-oss-process=image/resize,w_150','绿茶'),(4,'雀舌','http://img.tea7.com/0153803_0.png?x-oss-process=image/resize,w_150','绿茶'),(5,'太平猴魁','http://img.tea7.com/0034477_0.jpeg?x-oss-process=image/resize,w_150','绿茶');
/*!40000 ALTER TABLE `cl_shoplist_greentea` ENABLE KEYS */;
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
