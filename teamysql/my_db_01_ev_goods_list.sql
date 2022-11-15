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
-- Table structure for table `ev_goods_list`
--

DROP TABLE IF EXISTS `ev_goods_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_goods_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `num` varchar(100) NOT NULL,
  `imgUrl` varchar(225) NOT NULL,
  `zh` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='搜索的商品数据库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_goods_list`
--

LOCK TABLES `ev_goods_list` WRITE;
/*!40000 ALTER TABLE `ev_goods_list` DISABLE KEYS */;
INSERT INTO `ev_goods_list` VALUES (1,'绿茶-竹影清风碧螺春','绿茶','68','88','http://img.tea7.com/0173689_0.png?x-oss-process=image/resize,w_300',NULL),(2,'黄山太平猴魁绿茶1号','绿茶','128','1709','http://img.tea7.com/0170763_0.png?x-oss-process=image/resize,w_300',NULL),(3,'绿茶-清新珍稀白茶','绿茶','98','31','http://img.tea7.com/0169692_0.png?x-oss-process=image/resize,w_300',NULL),(4,'红茶习茶系列·入门版','红茶','39','100','http://img.tea7.com/0167479_0.jpeg?x-oss-process=image/resize,w_300',NULL),(5,'醉群芳醉桃喜武夷红茶','红茶','438','799','http://img.tea7.com/0153669_0.jpeg?x-oss-process=image/resize,w_300',NULL),(6,'黑金茶具套装','茶具','458','800','http://img.tea7.com/0163152_0.jpeg?x-oss-process=image/resize,w_300',NULL),(7,'简竹哥韵竹木茶具','茶具','327','588','http://img.tea7.com/0012549_0.jpeg?x-oss-process=image/resize,w_300',NULL),(8,'建阳红色芝麻毫建盏茶具','茶具','598','80','http://img.tea7.com/0010445_0.jpeg?x-oss-process=image/resize,w_300',NULL);
/*!40000 ALTER TABLE `ev_goods_list` ENABLE KEYS */;
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
