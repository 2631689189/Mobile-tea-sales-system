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
-- Table structure for table `ev_like`
--

DROP TABLE IF EXISTS `ev_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `numbe` varchar(10) DEFAULT NULL,
  `states` varchar(10) DEFAULT NULL,
  `letter` varchar(200) DEFAULT NULL,
  `click` varchar(45) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `zh` varchar(45) DEFAULT NULL,
  `identifier` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_like`
--

LOCK TABLES `ev_like` WRITE;
/*!40000 ALTER TABLE `ev_like` DISABLE KEYS */;
INSERT INTO `ev_like` VALUES (1,'http://img.tea7.com/0173631_0.png?x-oss-process=image/resize,w_300','大红袍-灰色上茶','99','1000','1','口感清甜柔滑 叶底均匀成朵','11','1',NULL,'1017'),(2,'http://img.tea7.com/0012966_0.jpeg?x-oss-process=image/resize,w_300','武夷山灰芽花香金骏眉88号','12','955','1','限时享3折起步','77','2',NULL,'1002'),(3,'http://img.tea7.com/0149490_0.jpeg?x-oss-process=image/resize,w_300','2022春茶明前龙井飞花','128','998','1','送礼优选','6','3',NULL,'1003'),(4,'http://img.tea7.com/0014005_0.jpeg?x-oss-process=image/resize,w_300','云南凤庆高海拔古树滇红','99','7333','1','价格实惠','44','4',NULL,'1004'),(6,'http://img.tea7.com/0126611_0.jpeg?x-oss-process=image/resize,w_300','武夷山高级大红袍2号','68','19559','1','淡淡自然糯香符合初尝者口感。','21','6',NULL,'1006'),(10,'http://img.tea7.com/0013995_0.jpeg?x-oss-process=image/resize,w_300','云南糯米香小熟沱普洱','100','100','1','融入傣族糯米香叶，淡淡自然糯香符合初尝者口感。','88','7',NULL,'1007'),(11,'http://img.tea7.com/0173689_0.png?x-oss-process=image/resize,w_300','绿茶-竹影清风碧螺春','68','85','1','竹影清风碧螺春','55','3',NULL,'1008'),(12,'http://img.tea7.com/0166736_0.jpeg?x-oss-process=image/resize,w_800','浅尝-金牡丹（武夷岩茶）','15.8','1000','1','大红袍中喝出“观音韵”。','4','7',NULL,'1017'),(13,'http://img.tea7.com/0169692_0.png?x-oss-process=image/resize,w_300','绿茶-清新珍稀白茶','79','66','1','清新珍稀白茶','1','1',NULL,'1010'),(14,'http://img.tea7.com/0167479_0.jpeg?x-oss-process=image/resize,w_300','红茶习茶系列·入门版','354','52','1','红茶习茶','1','6',NULL,'1011'),(15,'http://img.tea7.com/0153669_0.jpeg?x-oss-process=image/resize,w_300','醉群芳醉桃喜武夷红茶','532','327','1','醉群芳醉桃喜','1','6',NULL,'1012'),(16,'http://img.tea7.com/0163152_0.jpeg?x-oss-process=image/resize,w_300','黑金茶具套装','128','1235','1','一套好的茶具','1','6',NULL,'1013'),(17,'http://img.tea7.com/0012549_0.jpeg?x-oss-process=image/resize,w_300','简竹哥韵竹木茶具','119','566','1','竹制品更清新','1','7',NULL,'1014'),(18,'http://img.tea7.com/0173656_0.png?x-oss-process=image/resize,w_300','正山小种-蓝色上茶','99','1000','1','送礼送朋友','7','3',NULL,'1018'),(19,'http://img.tea7.com/0173642_0.png?x-oss-process=image/resize,w_300','金骏眉-红色上茶','99','1000','1','此小饼的体积和大小，非常适合普洱茶的醇化。','5','5',NULL,'1019'),(21,'http://img.tea7.com/0052268_0.jpeg?x-oss-process=image/resize,w_800','雨前头采碧螺春1号散茶','68','888','1','香气悠长且滋味浓郁','2','3',NULL,'1001'),(22,'http://img.tea7.com/0118725_0.jpeg?x-oss-process=image/resize,w_800','明前一级春茶龙井破春','98','655','1','口感清甜柔滑 叶底均匀成朵','5','3',NULL,'1005'),(23,'http://img.tea7.com/0098677_0.jpeg?x-oss-process=image/resize,w_800','福安大白茶白毫银针散茶','128','997','1','白毫银针随冲随泡，以少量低价的方式，让新茶客入门体验白毫银针。','8','1',NULL,'1009'),(24,'http://img.tea7.com/0009763_0.jpeg?x-oss-process=image/resize,w_300','2016南糯山古树普洱生茶','98','1000','1','此小饼的体积和大小，非常适合普洱茶的醇化。','5','6',NULL,'1015'),(25,'http://img.tea7.com/0013951_0.jpeg?x-oss-process=image/resize,w_800','2008顶级宫廷熟普洱茶饼','168','10','1','荷香中裹挟着枣香，滋味醇厚。','6','4',NULL,'1016'),(26,'http://img.tea7.com/0173605_0.png?x-oss-process=image/resize,w_300','绿茶-大境枝美白茶','99','1000','1','口感清甜柔滑 叶底均匀成朵','55','2',NULL,'1018'),(27,'http://img.tea7.com/0173587_0.png?x-oss-process=image/resize,w_300','礼盒装-绿茶-黄色初采黄金芽200g','88','1000','1','白毫银针随冲随泡，以少量低价的方式，让新茶客入门体验白毫银针。','12','3',NULL,'1019'),(28,'http://img.tea7.com/0170576_0.jpeg?x-oss-process=image/resize,w_300','长寿龟茶漏','56','1000','1','白毫银针随冲随泡，以少量低价的方式，让新茶客入门体验白毫银针。','56','4',NULL,'2020'),(29,'http://img.tea7.com/0172991_0.jpeg?x-oss-process=image/resize,w_800','丁家寨古树生茶','1280','1000','1','口感清甜柔滑 叶底均匀成朵','1','5',NULL,'2021'),(30,'http://img.tea7.com/0173211_0.jpeg?x-oss-process=image/resize,w_300','品牌茶-武夷正韵-润红袍','358','1000','1','白毫银针随冲随泡，以少量低价的方式，让新茶客入门体验白毫银针。','2','6',NULL,'2022'),(31,'http://img.tea7.com/0010444_0.jpeg?x-oss-process=image/resize,w_800','建阳青目小黑滴建盏茶具','96','1000','1','建阳特产建盏，黑色油滴斑纹细密，茶具油亮光泽。','9','7',NULL,'2023'),(32,'http://img.tea7.com/0052311_0.jpeg?x-oss-process=image/resize,w_300','历史名茶黄山毛峰1号','668','1000','1','产自核心产区，芽叶细嫩带香，滋味鲜爽醇厚。','5','7',NULL,'2024'),(33,'http://img.tea7.com/0161918_0.png?x-oss-process=image/resize,w_800','安徽雨前黄山毛峰2号','168','1000','1','入口清新淡雅，多泡后甜味不减，适合口感较淡的新茶友饮用。','7','5',NULL,'2025'),(34,'http://img.tea7.com/0096965_0.jpeg?x-oss-process=image/resize,w_300','2022雨前黄山毛峰3号','371','1000','1','黄山富溪核心产区，口感鲜爽有回甘，且外形较匀整','9','6',NULL,'2026'),(35,'http://img.tea7.com/0165464_0.jpeg?x-oss-process=image/resize,w_300','2022明前毛峰','88','1000','1','香气馥郁纯正，是少见的兰花香，滋味鲜爽甘甜。</div>','6','4',NULL,'2027'),(36,'http://img.tea7.com/0163125_0.jpeg?x-oss-process=image/resize,w_300','白玉西施套装','198','1000','1','白玉套装，犹如西施降临','5','6',NULL,'2028'),(37,'http://img.tea7.com/0163136_0.jpeg?x-oss-process=image/resize,w_300','粉青浮雕盖碗套装','98','1000','1','粉青浮雕盖碗套装','3','5',NULL,'2029'),(38,'http://img.tea7.com/0163144_0.jpeg?x-oss-process=image/resize,w_300','汝窑提梁壶套装','168','1000','1','汝窑提梁壶套装，产自核心产区，','54','4',NULL,'2030'),(39,'http://img.tea7.com/0160224_0.png?x-oss-process=image/resize,w_300','凤庆滇红大金针红茶','128','1000','1','臻选古树纯芽精制而成，90%以上芽头干茶带蜜香。','8','2',NULL,'2031'),(40,'http://img.tea7.com/0173595_0.png?x-oss-process=image/resize,w_300','滇红-清欢双瓷礼盒金丝滇红','98','1000','1','滇红-清欢双瓷礼盒金丝滇红','2','1',NULL,'2032'),(41,'http://img.tea7.com/0167724_0.jpeg?x-oss-process=image/resize,w_300','浅尝-雨前碧螺春','96','1000','1','浙江优质产区，外形好看，口感上佳。','6','7',NULL,'2033'),(42,'http://img.tea7.com/0165514_0.jpeg?x-oss-process=image/resize,w_300','2022明前碧螺春','138','1000','1','高海拔加上独特工艺使制得的碧螺春花果香馥郁，嫩栗香凸显。','5','5',NULL,'2034'),(43,'http://img.tea7.com/0013512_0.jpeg?x-oss-process=image/resize,w_800','生态原产雨前碧螺春','48','1000','1','超大份量，茸毛密布，纯正花果清香','8','6',NULL,'2035'),(44,'http://img.tea7.com/0173146_0.jpeg?x-oss-process=image/resize,w_300','万物杯','68','1000','1','粉青浮雕盖碗套装','9','4',NULL,'2036'),(45,'http://img.tea7.com/0173121_0.jpeg?x-oss-process=image/resize,w_300','手绘悟融杯','58','1000','1','口感清甜柔滑 叶底均匀成朵','7','2',NULL,'2037'),(46,'http://img.tea7.com/0137507_0.png?x-oss-process=image/resize,w_300','飘雪茉莉花茶','995','1000','1','绿茶与茉莉的天作之合，花瓣犹如飘雪，冲泡后水中翩翩起舞','51','1',NULL,'2038'),(47,'http://img.tea7.com/0139295_0.png?x-oss-process=image/resize,w_300','茉莉花茶玉螺造型铁罐装','66','1000','1','早春全芽绿茶，传统工艺窨制，简单冲泡就可享有淡淡冰糖甘甜。','21','2',NULL,'2039'),(48,'http://img.tea7.com/0153110_0.png?x-oss-process=image/resize,w_800','茶师林灿茉莉雪芽','878','1000','1','茶师林灿茉莉雪芽','32','3',NULL,'2040'),(49,'http://img.tea7.com/0165404_0.png?x-oss-process=image/resize,w_300','2018布朗山普洱生茶饼','66','1000','1','口感刺激强，霸气甘甜','5','4',NULL,'2041'),(50,'http://img.tea7.com/0155524_0.png?x-oss-process=image/resize,w_300','郭银森寿眉散茶','98','1000','1','口感刺激强，霸气甘甜','9','5',NULL,'2042'),(51,'http://img.tea7.com/0166708_0.jpeg?x-oss-process=image/resize,w_300','浅尝-白龙珠','380','1000','1','粉青浮雕盖碗套装','66','6',NULL,'2043'),(52,'http://img.tea7.com/0137123_0.jpeg?x-oss-process=image/resize,w_300','2016白毫银针巧克力茶砖','159','1000','1','核心产区手工采摘，干仓存放转化好，滋味醇厚甘甜，营养物质丰富。','54','7',NULL,'2044'),(53,'http://img.tea7.com/0137103_0.png?x-oss-process=image/resize,w_800','2018福鼎白毫银针米针王','352','1000','1','芽头壮硕，形如米粒，初春头采，实为收藏佳选。','62','6',NULL,'2045'),(54,'http://img.tea7.com/0138995_0.png?x-oss-process=image/resize,w_800','2020年高山珍稀白毫银针','15','1000','1','满披白毫，入口口感糯滑，滋味鲜甜爽口，存茶不二之选。','24','5',NULL,'2046'),(55,'http://img.tea7.com/0098677_0.jpeg?x-oss-process=image/resize,w_300','福安大白茶白毫银针散茶','131','1000','1','白毫银针随冲随泡，以少量低价的方式，让新茶客入门体验白毫银针。','23','4',NULL,'2047'),(56,'http://img.tea7.com/0137097_0.png?x-oss-process=image/resize,w_300','2019年白牡丹巧克力饼','554','1000','1','高山产区的白茶入口清甜，新茶还保留有茶园最自然的气息。','61','3',NULL,'2048'),(57,'http://img.tea7.com/0156223_0.png?x-oss-process=image/resize,w_300','2013年高山白牡丹老茶饼','1080','1000','1','比起新茶，七年陈的老白茶更有韵味，口感香气更趋稳定。','55','2',NULL,'2049'),(58,'http://img.tea7.com/0173447_0.jpeg?x-oss-process=image/resize,w_300','黄山祁门红茶香螺','630','1000','1','来自黄山祁门原产地，采用早春新芽茶，手工制作。','2','1',NULL,'2050'),(59,'http://img.tea7.com/0167244_0.png?x-oss-process=image/resize,w_300','英德红茶-英红九号','88','1000','1','大叶种中的优质品种，汤感稠厚，超级耐泡','3','4',NULL,'2051'),(60,'http://img.tea7.com/0167276_0.jpeg?x-oss-process=image/resize,w_300','见山-坦洋工夫红茶[礼盒装]','98','1000','1','非遗传承人匠心监制，花香馥郁，口感醇正。','9','5',NULL,'2052'),(61,'http://img.tea7.com/0166723_0.jpeg?x-oss-process=image/resize,w_300','浅尝-全黄芽金骏眉','600','1000','1','花蜜香久泡不减的颜值担当','85','6',NULL,'2053'),(62,'http://img.tea7.com/0153657_0.jpeg?x-oss-process=image/resize,w_300','笔花堂桐木关金骏眉','540','1000','1','严选海拔千米高山百年老树，精挑万颗芽','66','3',NULL,'2054'),(63,'http://img.tea7.com/0017170_0.jpeg?x-oss-process=image/resize,w_300','漳平水仙兰香1号','66','1000','1','兰香中夹杂桂香，清醇爽口。','54','2',NULL,'2055'),(64,'http://img.tea7.com/0173578_0.png?x-oss-process=image/resize,w_300','漳平水仙-尽善尽美','880','1000','1','核心产区手工采摘，干仓存放转化好，滋味醇厚甘甜，营养物质丰富。','41','1',NULL,'2056'),(65,'http://img.tea7.com/0156681_0.png?x-oss-process=image/resize,w_300','朝花夕拾-漳平水仙','99','1000','1','浙江优质产区，外形好看，口感上佳。','44','7',NULL,'2057');
/*!40000 ALTER TABLE `ev_like` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 19:56:17
