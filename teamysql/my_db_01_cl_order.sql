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
-- Table structure for table `cl_order`
--

DROP TABLE IF EXISTS `cl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cl_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) DEFAULT NULL,
  `goods_name` varchar(20) DEFAULT NULL,
  `goods_price` varchar(10) DEFAULT NULL,
  `goods_num` int DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `uId` int DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `identifier` varchar(10) DEFAULT NULL,
  `orderpwd` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cl_order`
--

LOCK TABLES `cl_order` WRITE;
/*!40000 ALTER TABLE `cl_order` DISABLE KEYS */;
INSERT INTO `cl_order` VALUES (88,'20221021161139782808','绿茶-竹影清风碧螺春','204',3,4,16,'http://img.tea7.com/0173689_0.png?x-oss-process=image/resize,w_300','1008','$2a$10$MCGUXoiQuW.ZOh1F1cgotueoZ5/.DmwgeTfdZlheyUB0RN/9K.PzS'),(89,'20221021161412304563','消青工艺浓香铁观音1号','256',2,1,16,'http://img.tea7.com/0130740_0.png?x-oss-process=image/resize,w_300','1005','$2a$05$/diXHtD5ymms8DVa7i2Doumw4lSVa54Bb/kshctDjU2q4BN2Q4kWa'),(90,'20221024210126686455','消青工艺浓香铁观音1号','128',1,1,16,'http://img.tea7.com/0130740_0.png?x-oss-process=image/resize,w_300','1005','$2a$05$a4qfILGkVncGaM80lI/RfOM79G9kwa0sXISf8ImGM3Jdnw1H4oyPC'),(91,'2022102714251768954','醉群芳醉桃喜武夷红茶','1596',3,4,16,'http://img.tea7.com/0153669_0.jpeg?x-oss-process=image/resize,w_300','1012','$2a$05$kxsxdAxcJHMTUsg2nSt7NenrMvZxviV/32KBfDOMXc16.DiG81y7W'),(92,'20221027143531316040','醉群芳醉桃喜武夷红茶','1596',3,1,25,'http://img.tea7.com/0153669_0.jpeg?x-oss-process=image/resize,w_300','1012','$2a$05$AXhLpiWfqPKvUk2HQuOgpeFBLETeP3quWMHIa3IfU51qHMasrjLh6'),(93,'2022102714501450441','红茶习茶系列·入门版','708',2,4,16,'http://img.tea7.com/0167479_0.jpeg?x-oss-process=image/resize,w_300','1011','$2a$05$OD72Oak8EZT1cFdJB7S0r.6jpIGsBWoPVRcazC2pIfU/UhjHpQjZy'),(94,'20221027145228956496','雨前珍稀白茶1号','204',3,4,16,'http://img.tea7.com/0170739_0.png?x-oss-process=image/resize,w_300','1111','$2a$05$u419EdcKlr261wrjHJFIDea06rOR303.F4ej2.KAAcouEZvu0AQfG'),(95,'20221027145458353281','雨前珍稀白茶1号','204',3,4,16,'http://img.tea7.com/0170739_0.png?x-oss-process=image/resize,w_300','1111','$2a$05$x5xSnR7t/H.pU6KbCcSn1uIoESN.2Gvs1cDgSaaTjLyOfAcaLThvu'),(96,'20221027155637609198','雨前珍稀白茶1号','272',4,4,16,'http://img.tea7.com/0170739_0.png?x-oss-process=image/resize,w_300','1111','$2a$05$mBE8z5f0Wtq1/3QIQmrNhe8sp2uiOAH1BgOOWPJF1COyoCqObAhQ2'),(97,'20221027160610278741','黄山太平猴魁绿茶1号','55',1,4,16,'http://img.tea7.com/0170763_0.png?x-oss-process=image/resize,w_300','1009','$2a$05$bIYi6THUMnVuApogB19FKe9khpoBLsVGA2pMHVqPrGOM4JPK0DTAq'),(98,'20221027202315810291','雨前珍稀白茶1号','264',3,4,16,'http://img.tea7.com/0170739_0.png?x-oss-process=image/resize,w_300','1111','$2a$05$w9iJBmKhexlK8VEoTvqbh.4i4ZxQdkcjectJ4ouXgk1sCidxXhq.q'),(99,'20221027202502330432','雨前珍稀白茶1号','264',3,1,16,'http://img.tea7.com/0170739_0.png?x-oss-process=image/resize,w_300','1111','$2a$05$EpmxsdFLeqWQQjbWb7WBaeWQ/CRzCYTnSiRQHyPRBDi/YTj2BBmCe'),(100,'2022102723495911201','武夷山高级大红袍2号','272',4,4,16,'http://img.tea7.com/0126611_0.jpeg?x-oss-process=image/resize,w_300','1006','$2a$05$q9kY3d46M1GQFeVYg1Pgtuk1yNlbJZ7Ag5KqRunVbe6bhtfPhIAHa'),(101,'20221030104356825174','绿茶-竹影清风碧螺春','272',4,2,16,'http://img.tea7.com/0173689_0.png?x-oss-process=image/resize,w_300','1008','$2a$05$w/eOsnO9/ZtPUrLVhhEd7eRkfur7yGOhmO6ZF5tSVmkP4AxcumFaW'),(102,'20221106110922930059','醉群芳醉桃喜武夷红茶','2660',5,4,16,'http://img.tea7.com/0153669_0.jpeg?x-oss-process=image/resize,w_300','1012','$2a$05$tTXwAS6XF1R4NpJfEc2CuegsH3hj2O2WWxdnY3LKqXgQE/zqSwv6m');
/*!40000 ALTER TABLE `cl_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 19:56:19
