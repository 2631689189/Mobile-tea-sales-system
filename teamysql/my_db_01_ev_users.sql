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
-- Table structure for table `ev_users`
--

DROP TABLE IF EXISTS `ev_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `pwd` varchar(255) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `nickName` varchar(20) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `imgUrl` varchar(255) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_users`
--

LOCK TABLES `ev_users` WRITE;
/*!40000 ALTER TABLE `ev_users` DISABLE KEYS */;
INSERT INTO `ev_users` VALUES (14,'15968745321','777','王五','hhh','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTk2ODc0NTMyMSIsImlhdCI6MTY2NTQ1Nzk1MX0.YbGjC36_RBwo1e5IIiKrKHE1LkHFDMiEiHFHF-dNQuY'),(15,'15965745684','$2a$05$MSFuf6Wu0hzfD9t4RngjqON7Pdd0lnLF8lsZDOfxpNdXR7GKUVuqa','普耀龙','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTk2NTc0NTY4NCIsImlhdCI6MTY2NTQ1ODI4MX0.SQijSpQTOx5YnwRN7LqCLMF1MRqjIbC8-JRs2t3s0NA'),(16,'18183708596','$2a$10$hziQ65PGIIY9QQwqo3S5RegrOG6UkDHIsxZBL/o0LtlWwDlNV9MvW','李四','https://i.postimg.cc/sXsJxBd9/tx.webp','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxODE4MzcwODU5NiIsImlhdCI6MTY2NjMzOTEwNH0.rYssuXw-7uF8tcj03JUylCYH9PZIez6MiBVIaPnk_V4'),(17,'15864857213','666666','15864857213','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTg2NDg1NzIxMyIsImlhdCI6MTY2NTQ4Njk0NH0.xNo4Ut-6SQen52qkUqsbiGQZmUjYJO1OpvwGVD6bdBs'),(18,'18546957612','159357sm','18546957612','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxODU0Njk1NzYxMiIsImlhdCI6MTY2NTc1ODA4OH0.i5IWQvRiJhQHi1Ku7wyQqpfhblXmOGs3UovezxV9XwA'),(20,'19658745324','$2a$10$w4nEo/JKMBo3M6uUZjP2x.6A1jBKKVu3QLVtMXJ0RYES0LdBFyWTq','19658745324','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxOTY1ODc0NTMyNCIsImlhdCI6MTY2NjMzNjI3NX0.zWUyCKzQ5HlY2CCc3peZNYOTnT2Tnjhtzum3b7wOr1M'),(21,'15874563258','$2a$10$bIJgZ9TM53YN7xtjdoCiXO6n84pMxqkqEBLO/MUPFSvSCE8.T801.','15874563258','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTg3NDU2MzI1OCIsImlhdCI6MTY2NjMzNzk5MH0.bWpBNKevlzoCkVepu-hFsHS1pde3T5ZvUO7ApRs5Pzk'),(22,'18745632485','$2a$10$1AprW2iCp4gYWtPRneXX7.N1vMTzdCVcgwtAoaDiswe1GQJSpVODK','18745632485','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxODc0NTYzMjQ4NSIsImlhdCI6MTY2NjMzODczMH0.cU8LT9sYDPUBgAtSghOA-llGa_Se915dYBYFKgmqO-4'),(24,'15687453587','$2a$10$fttoSm0lWRxzDtLgywRHbOhDi5hFGdsc38knwpRe8TahUkF5yBQqm','15687453587','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTY4NzQ1MzU4NyIsImlhdCI6MTY2Njg1MTk3OX0.eqmWKpvMx_WNcD1115sKvTvokNbPt2tYTZP8E1gQKXE'),(25,'19516187882','$2a$10$9JeLFoVXR..o/xvw3Uc0OeteehO6JWlDkTXBYBwupdlJOGtvTILTO','19516187882','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxOTUxNjE4Nzg4MiIsImlhdCI6MTY2Njg1MjQ3MX0.B_HjcZpdgxWrctm7-D-UrpekwZTlZf9BBmsCeMzJAy0'),(26,'14753698547','$2a$10$feVcoPAXAEjI1rFliHAazeA2upL24C/zvGqAtukCmpT6xeD0OeUxq','14753698547','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNDc1MzY5ODU0NyIsImlhdCI6MTY2NzEzNzQwM30.E0um96ZutlhMqPcJwvRn2To_4DcOQfEesjUx4k-uLAA'),(27,'18657896451','$2a$10$RxwKNR9/bjOwX75J9GmbX.kttpEwdhJFPQfoZS22xuuW4zVmQD0XG','18657896451','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxODY1Nzg5NjQ1MSIsImlhdCI6MTY2NzIwNDcwN30.3KYDAfUVZuzq0V_YsQN_2sKTIHdpVNTkSZujW4rlHRQ'),(28,'18675963245','$2a$10$Fm7fFe34R3AaWiYpKEcNM.5UXfCaczFwk2xBIzwaOlV2GfRSv0sGS','18675963245','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxODY3NTk2MzI0NSIsImlhdCI6MTY2NzIwNTE3N30.TuT8FV8K5wxN0axtiOwPFNy2uPkF5Qm4dqO_No_u7zM'),(29,'19875642354','$2a$10$9I85AqGAXLEYZIBbM1dSGeJ4R077y5cYqrJGRWHo3twsWQmgB9kBW','19875642354','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxOTg3NTY0MjM1NCIsImlhdCI6MTY2NzIyOTAwNn0.lUDOrMPosEefGlb2ZZFnMuUsv4rST-D6BbT448D_Fhw'),(30,'19874563245','$2a$10$BLVvL6e9q37kqz/gLXAvMOjrixCNIeIM6wxWja7baVVQHA1Mm6StC','19874563245','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxOTg3NDU2MzI0NSIsImlhdCI6MTY2NzIyOTMwMn0.tlOH_YV63GISB0lYhQw4cRiN3vYqPypmpYkJir8uZIo'),(31,'19854681236','$2a$10$T1E4V9YEGi7N7AA9LT.ua.0zTiD9hXiYUqWs0EBjAI3JWnJm6UmbG','19854681236','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxOTg1NDY4MTIzNiIsImlhdCI6MTY2NzIyOTYwOX0.pA1sWT0ZsupMge6SVVSQgB-ZwGATkidxTzb5zWHVmo4'),(32,'15684698754','$2a$10$cL8gmmQBHK/WukGs.VbUz.FXp.jWx5YoXGB7sOqfP98E78KhsXOHq','15684698754','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTY4NDY5ODc1NCIsImlhdCI6MTY2NzIyOTkwM30.6AAVaiCNmCMZ62t6W6Hg5NGTQkWENPmUoRbmO7QS-_E'),(33,'19875643598','$2a$10$WzUsuLmPNCDiQlwCpD5vPudGnWHYSvVvoB/fRJr8K8olDOyVQXSAy','19875643598','/images/user.jpeg','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxOTg3NTY0MzU5OCIsImlhdCI6MTY2NzIzMDE1OX0.LIruEsin0xie_-oY9Gl5T7JuK49Ai4M45GLtgeVXCeg');
/*!40000 ALTER TABLE `ev_users` ENABLE KEYS */;
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
