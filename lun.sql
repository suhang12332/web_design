-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: luntan
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Plate`
--

DROP TABLE IF EXISTS `Plate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Plate` (
  `plateName` varchar(255) NOT NULL,
  `platePostcount` int(255) DEFAULT NULL,
  PRIMARY KEY (`plateName`),
  UNIQUE KEY `plateName` (`plateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plate`
--

LOCK TABLES `Plate` WRITE;
/*!40000 ALTER TABLE `Plate` DISABLE KEYS */;
INSERT INTO `Plate` VALUES ('HtmlCss',0),('Java',2),('Mysql',5);
/*!40000 ALTER TABLE `Plate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Post` (
  `postId` int(255) NOT NULL AUTO_INCREMENT,
  `postPlatename` varchar(255) NOT NULL,
  `postUserid` int(255) NOT NULL,
  `postReplycount` int(255) DEFAULT NULL,
  `postTitle` varchar(255) NOT NULL,
  `postContent` varchar(255) NOT NULL,
  `postTime` datetime NOT NULL,
  PRIMARY KEY (`postId`),
  KEY `postPlatename` (`postPlatename`),
  KEY `postUserid` (`postUserid`),
  CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`postPlatename`) REFERENCES `Plate` (`plateName`),
  CONSTRAINT `Post_ibfk_2` FOREIGN KEY (`postUserid`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (18,'Mysql',2,NULL,'数据库设计','详细请关注我的博客','2019-05-28 23:35:15'),(20,'Java',10,NULL,'java多态','多态是一种重要的属性','2019-05-29 10:33:37'),(34,'Mysql',2,NULL,'数据库触发器','下面是简单的SQL触发器','2019-05-30 23:51:52'),(85,'Mysql',1,NULL,'涮','想你想你尽心','2019-06-11 11:27:49'),(86,'Java',3,NULL,'cvgbhunijk','dtfyghujk','2019-06-11 16:06:21'),(87,'Mysql',3,NULL,'java数组','dfghjk','2019-06-11 16:28:00'),(88,'Mysql',1,NULL,'rtyu','ftyghuj','2019-06-11 16:30:17'),(94,'Mysql',3,NULL,'java对象浅谈','闪光灯和头发酷骨灰级；欧开盘','2019-06-14 10:54:43');
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReturnPost`
--

DROP TABLE IF EXISTS `ReturnPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ReturnPost` (
  `returnId` int(255) NOT NULL AUTO_INCREMENT,
  `returnPostid` int(255) NOT NULL,
  `returnPlatename` varchar(255) NOT NULL,
  `returnContent` varchar(255) NOT NULL,
  `returnUserid` int(255) NOT NULL,
  `returnTime` datetime NOT NULL,
  PRIMARY KEY (`returnId`),
  KEY `returnPostid` (`returnPostid`),
  KEY `returnPlatename` (`returnPlatename`),
  KEY `returnUserid` (`returnUserid`),
  CONSTRAINT `ReturnPost_ibfk_1` FOREIGN KEY (`returnPostid`) REFERENCES `Post` (`postId`),
  CONSTRAINT `ReturnPost_ibfk_2` FOREIGN KEY (`returnPlatename`) REFERENCES `Plate` (`plateName`),
  CONSTRAINT `ReturnPost_ibfk_3` FOREIGN KEY (`returnUserid`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2992 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReturnPost`
--

LOCK TABLES `ReturnPost` WRITE;
/*!40000 ALTER TABLE `ReturnPost` DISABLE KEYS */;
INSERT INTO `ReturnPost` VALUES (2973,34,'Mysql','ces ',3,'2019-06-11 00:42:03'),(2974,20,'Java','ces ',3,'2019-06-11 00:43:01'),(2976,34,'Mysql','测试',1,'2019-06-11 11:26:52'),(2977,20,'Java','测试',1,'2019-06-11 11:27:33'),(2978,85,'Mysql','回复',1,'2019-06-11 11:27:58'),(2979,20,'Java','sdcfvgbh\r\n',3,'2019-06-11 16:05:34'),(2980,86,'Java','http://localhost:8080/web_design_war_exploded/postInformationServlet?86#panel-element-673376',3,'2019-06-11 16:06:41'),(2981,87,'Mysql','rtyui',3,'2019-06-11 16:28:29'),(2982,87,'Mysql','tyujk',1,'2019-06-11 16:29:03'),(2983,87,'Mysql','etsYDTUYITUPOPO',1,'2019-06-11 16:42:23'),(2984,87,'Mysql','DTYUIOPGJIGFJIOFIFYUIU',1,'2019-06-11 16:49:17'),(2985,88,'Mysql','头发一股公平',1,'2019-06-12 11:10:14'),(2986,88,'Mysql','投诉人予以破【',1,'2019-06-12 11:10:21'),(2987,88,'Mysql','投入使用对头【i',3,'2019-06-12 11:11:01'),(2990,88,'Mysql','我来了',30,'2019-06-12 17:20:12'),(2991,34,'Mysql','打算买那多快好了',3,'2019-06-13 14:15:00');
/*!40000 ALTER TABLE `ReturnPost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User` (
  `userId` int(255) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userQQ` varchar(255) NOT NULL,
  `userBirthday` varchar(255) DEFAULT NULL,
  `userSex` varchar(255) NOT NULL,
  `userImg` varchar(255) DEFAULT NULL,
  `userSate` varchar(255) DEFAULT NULL,
  `userDate` varchar(255) DEFAULT NULL,
  `userLookhistory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'suhang','123456','123456@qq.com','123456','2019-06-06','男','004.png','很成功就会考虑；','2019-05-26 20:44:37',NULL),(2,'chenjinmei','123','123464@qq.com','123455','2019-05-10','女','003.png','我是大笨蛋','2019-05-26 20:57:03',NULL),(3,'hhh','hhh','222222222@qq.com','222222222','2019-05-31','女','007.png','我是小笨蛋','2019-05-26 20:59:22',NULL),(6,'sh','jhjklpesd','78624364@163.com','15669448876',NULL,'男',NULL,NULL,'2019-05-26 21:53:12',NULL),(8,'wujinping','98765432','1233213123@qq.com','1237129873','1998-07-07','女','003.png','我是猪','2019-05-28 22:33:19',NULL),(9,'sdfhh','6666','1447@gmail.com','147',NULL,'男',NULL,NULL,'2019-05-29 10:18:16',NULL),(10,'qwe','1999828','qqd@gmail.com','111','2015-05-29','男','001.png','贺昱是猪','2019-05-29 10:19:22',NULL),(11,'hahah','123456','1234567890@qq.com','1234567890','2019-06-02','女','003.png','你是猪','2019-05-30 18:42:17',NULL),(12,'tang','123456','12345678@qq.com','1234567','2017-06-02','女','005.png','一个小菜鸡','2019-06-02 02:16:22',NULL),(13,'zhang','zhang','1552899301@qq.com','123456789',NULL,'女',NULL,NULL,'2019-06-11 13:42:02',NULL),(14,'guo','123456','1397760689@qq.com','12345678',NULL,'男',NULL,NULL,'2019-06-11 14:21:43',NULL),(15,'wang','123456','1450677917@qq.com','123456',NULL,'女',NULL,NULL,'2019-06-11 14:30:58',NULL),(16,'ss','hhh','1552899301@qq.com','wdadsa',NULL,'女',NULL,NULL,'2019-06-11 14:35:10',NULL),(17,'hh','hhh','1552899301@qq.com','123456789',NULL,'女',NULL,NULL,'2019-06-11 14:56:37',NULL),(18,'hhhh','hhh','1552899301@qq.com','234567980',NULL,'男',NULL,NULL,'2019-06-11 15:02:33',NULL),(19,'hhhdd','hhh','2396985041@qq.com','12345678',NULL,'男',NULL,NULL,'2019-06-11 15:06:23',NULL),(20,'hhhdsasd','hhh','1552899301@qq.com','123456789',NULL,'女',NULL,NULL,'2019-06-11 15:11:00',NULL),(21,'hhh11','hhh234567','1552899301@qq.com','1234567890',NULL,'男',NULL,NULL,'2019-06-11 15:13:14',NULL),(24,'hhh67','hhh','1552899301@qq.com','asdasd',NULL,'男',NULL,NULL,'2019-06-11 15:18:18',NULL),(25,'hhhdsfsdf','hhh','1552899301@qq.com','sdffdsdfs',NULL,'男',NULL,NULL,'2019-06-11 15:19:48',NULL),(26,'suhang12332','123','1552899301@qq.com','123456',NULL,'女',NULL,NULL,'2019-06-11 15:56:10',NULL),(28,'suhang1','hhh','1552899301@qq.com','123456',NULL,'女',NULL,NULL,'2019-06-11 15:56:34',NULL),(29,'liu','123456','1552899301@qq.com','123456',NULL,'女',NULL,NULL,'2019-06-12 11:08:21',NULL),(30,'pan','hhh','577153646@qq.com','1234567','2019-06-13','女','003.png','我是大笨蛋','2019-06-12 17:17:50',NULL),(31,'zhao','123','1661429520@qq.com','123456789',NULL,'男',NULL,NULL,'2019-06-13 14:17:00',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-16  1:28:32
