CREATE DATABASE  IF NOT EXISTS `walletjs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `walletjs`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: walletjs
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesstoken`
--

DROP TABLE IF EXISTS `accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accesstoken` (
  `id` varchar(255) NOT NULL,
  `ttl` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesstoken`
--

LOCK TABLES `accesstoken` WRITE;
/*!40000 ALTER TABLE `accesstoken` DISABLE KEYS */;
INSERT INTO `accesstoken` VALUES ('2EwuUA7lgnZj7r5H1z8XKaVheh8uzc9wd6GOBs0uF4xL0DcGtziFRucL3ekBBL58',1209600,'2019-05-07 01:09:57',7),('3pZ7udynyZj8PVsIWCOoCYI6HfRqPEivVhY7SfXEaRXqoYNBz6hujEFpTaUFpBqq',1209600,'2019-05-06 14:15:37',7),('4u1GseDFrFjiOhMBd9oK0gw2KKD9hQK8hwwETNpn6q1Nu5J9yPV6cflQds5CrocJ',1209600,'2019-05-07 01:07:58',7),('4zee06znXlDZUmcU1RafIZqSWwefaFieZeCYhpsNXa12pwx7QSMa1lCyYjqcaA6w',1209600,'2019-05-06 13:40:25',7),('5GWim39Gjw6x2EQzaqQrWeoYIyXh603InsopU5WowkDTjaUaySarZ08w0HNuHGdL',1209600,'2019-05-06 12:42:54',7),('5yMCni3SUfw27Um4Vim9U7YKY4pW04YFC9Sdl1k72CKUMp5hZktnncGv9LwOlkgz',1209600,'2019-05-06 22:41:25',7),('5ZMZHhKVqcUN6i3FNjAg0WrWIQdjABIlFumyj5jHDgopiwALGyzBSG1BAbQgGOSQ',1209600,'2019-05-04 21:36:23',1),('7IVvxNOt1vZvTugJf8Td9EKONwdB7Usfb4SAl7avDhiOdTCE9tSWeAEzzAPe8nTG',1209600,'2019-05-04 23:53:49',3),('80bACBRAFeUAee314rlngBNlegmGEYDnZkuoj0dF5Xy6hbzUTQNMQxo8HI36umyu',1209600,'2019-05-05 00:47:21',3),('9TCYhS80EGRrHBgiEchKIZexO802dwH1icCbzTdfJOKoLxmonYLlypy0297I7oRg',1209600,'2019-05-05 22:51:03',3),('a3VBXbTMLbX7ENPWG6QZS9WsvbywBXvPticFjkxMZARfRw4FOC7PfFTQamTePO6S',1209600,'2019-05-07 15:59:27',7),('ab2MGlYhxCX3AgLo5QYFmGMQjfJtHVULDYJAbZVslbfQ3rKpBVyJYVYd3OD6M1Pp',1209600,'2019-05-07 01:12:43',7),('bxBzGlhztAaf8XUFAa9vb48XJoKNNgEL4T3wRLXaJxhd8fUT8IpWs0JAyblxAVBG',1209600,'2019-05-07 01:23:07',7),('CliYOWAuAGowbO6gGgETDlBQ4dEv2Ynp9jUsdHrxO5qRcvwdlxEQUYopHrp9vO8F',900,'2019-05-07 16:23:30',7),('CUJxelGUszAIvhGmFlhAKPIyGqvfbZ5BwfdIRi0BtjWXlT1OFWcHRWOxs7EelUfD',1209600,'2019-05-07 01:20:21',7),('da0PgCPO5YGftsZLHqrmliTrgOFFrwy1PB5WXFig7WJYDmQpxT2UuCPRBNVGPeH2',1209600,'2019-05-04 23:29:10',1),('DpDTwKWDXYxLp2vDBEAUGfj7Ee0smLMHNxL8oyKXymNyoVBrjutqJM7JBjeR1GB4',1209600,'2019-05-07 01:15:54',7),('DrZhc3QWAOUFHxJ06lT1UkVPy2z1vFPBv3pchDXqs2FamSdTsFUA2JfSxzExHN14',1209600,'2019-05-04 23:46:19',2),('duE5Lru02GAtyVqVPi1aWqXdccfeg9GfSFE3xD68UlMlChCIJu3GnKSW0PEl8EAZ',1209600,'2019-05-07 15:56:48',7),('f9Jg69LDDBZdcna8bj6XviJQ0mNdYBu6T46PVWwnNpXo9qLiUCJVJQJev9nKjjTT',1209600,'2019-05-07 15:57:15',7),('FmLllU8sKiqv2KmSxDCiBkGVagL2ZyAZjC2R8QPUUF4sDeuhfIaBB8oSLr9UCIde',900,'2019-05-07 16:23:38',7),('FxFPFd6pmvAinoIRVPme5bYEDREYHchHlc2fJ1AApykRfd34fpFOHCBmvTDqC6aB',1209600,'2019-05-04 23:50:25',3),('gDBxgfgAEFBptzNUFVEiCqd1B6GqV2AeSgRvmHEgf2xNY31O2a2mX2ds2SFrrZEt',1209600,'2019-05-07 01:12:21',7),('GL9EOhKLABSaHw3SMs6BogJsEIvoCIQ54rlHinUjSTp4s1VCDgadjDdb7LalGE9x',900,'2019-05-06 12:36:27',7),('hhZjJFlIqA4SqneRENg5E8xyqLeyWFM7G0A9o2tNFN9P5i8ozSAYGV2B2XQS5SMB',1209600,'2019-05-07 01:17:50',7),('hTo6xTcSjiZMUm1fSAgaB9YNP52j1OtEa4EjObAesfdhGzCnOCZZRdAZ4prrur6w',1209600,'2019-05-04 21:32:09',1),('hu3TkehGqGEWoSBknxPA2zsSPhPOmJHPnpYs3HMJFsLs34QlgU4LGrDBSLAZJSFF',1209600,'2019-05-04 23:55:55',3),('i1zqz3urnZWl3geiipbCStQYuyACDogWo5pq1S5rPbg1rd23ZYrljBJfD0yKyZFu',1209600,'2019-05-07 16:35:35',7),('jf2Y1yXolB2OKJnxQDa28R8fmDIj8PjAYaP5HxUDahsa6PPogP3pOyThM3YA8NCp',1209600,'2019-05-07 01:17:17',7),('jOVMPdNrTwIUuldC2dzIY7RcKl2aH1HrGF7XqKYX8BL5izQCwnVcLpemAfBpOZi5',1209600,'2019-05-07 01:13:39',7),('KCa4Se19pH8tFGTU4bbchaHsV1F779UM2JFlacygpkuDwbaoEA1VPCVMuD1TBXfh',1209600,'2019-05-06 12:35:25',7),('kDGVv2iYZOTswrKd2XpAEA42c3pLstSDl8Y44FlAGtvLwkentslX9cQv8HeySM2M',1209600,'2019-05-07 16:17:42',7),('kLgGWtgjCxwZ35ZvSF34g5pmhDItD1LoblX2WJzTeXjgUXnz0WGCyxeIXeyTvKoZ',1209600,'2019-05-04 23:40:13',1),('l3EmseLm3FkBBXn3hX6qRbEnt8YkkJbst0Dvrm6vWmXZ12gJCLc0TM8vtQdUc9Gw',1209600,'2019-05-04 23:47:04',1),('lftm0Lmq8UWhDBqOLsB7Mk81O4k6Rk29QDFueAkgiD5mFKvUlfDRL1FgT8cdrwD2',1209600,'2019-05-06 12:28:58',7),('lIqZ7gMPSdqJW89JH00DSow9EaDcCTlOJvZtG34dgiUF7P3kczWbYUgRBYomWuCl',1209600,'2019-05-07 01:10:50',7),('lUQJQ5HUUvcgzDsghHyRHJBoz7tf2zSWEfIvJTFANlC6qnQiJbLeU6VHsHrfZfzL',1209600,'2019-05-04 21:17:52',1),('mt42Bw2Uz8dZgqtrOsjRAxEEvZz1KVd3IJYZ5r39idBQhifZRexDEia5Yi5QiXKY',1209600,'2019-05-04 21:19:48',1),('NgwtuDD1RNdrQxPJMLTqWDPBnlT8SZVR2xalvmKFBSBeB5MNskcudCX4XaDGMgtj',1209600,'2019-05-06 11:13:08',3),('O9l51qGlFESPbQhALAb3nYVI9TcGiFFXJkwO2E96QEuwFHH056Jnh6ZB0294QjNe',900,'2019-05-07 16:18:28',7),('p4eICObVUrufMZMOxfz4Tu4Bm7F9hL19gZY7xWFNQraE2t9yFTiMML2ryxCBHG2v',1209600,'2019-05-07 01:16:54',7),('paPBGGosxufcH1jp0n7NZVD4bkBJBjE9HG9wHPvy52eZXeCGs9A0LSdNQZwuYLDy',900,'2019-05-07 16:51:32',7),('PLlZDUOKqwwVyS9NlSKI01sxURrlSEwWMbfPcUVsoY1DZMcdCFRzGZ02TWWH9eDo',1209600,'2019-05-04 23:52:25',3),('pOAQ55xK6MpTa2GZCfRiFHa4rYvr60413jBsN6hBjzYD0L7I8YXI1OtLgyyyeB4U',1209600,'2019-05-07 01:17:45',7),('QkXlm55bw8UyBe2q81t8mKC47DTaUnUN9cNfOBlQr4jC6JPVALxZhox9DGJYrOxE',1209600,'2019-05-07 01:05:45',7),('QNXr8NpG29IuLigveZrW5c8KkJHdEOpCMvOi7Qk73AMNWDeberDrufIFxCrIHN08',1209600,'2019-05-07 01:19:00',7),('rErMTXjInKiBVMQ9pvuavvxhNzDX4AcNAVF9u7LYv0GtEE1aYNGaUKFwW9ctzRor',1209600,'2019-05-07 16:36:46',7),('rKmVgTUBHLJf3bHOCVVGPXrOZSCAJPBnNnjFxIW7OOuCfBwoC0YuO8sgnH9n4Ybd',1209600,'2019-05-06 12:30:41',7),('sbezHVqRrB5JjT0EQ7GFFCw2bhEB7nMS1gLPZE90Yja9e5kZCjFxwSfAE1fI7Jh4',1209600,'2019-05-07 01:12:00',7),('sbPqk0RBCVBlLbzKLRKF4iGzPTFtMYDuvJfqZXzwUXdZ0Yxw3tfm596b7bOdArsF',1209600,'2019-05-04 23:44:08',2),('SCUE9CrOMCyRZvye12ioAL7NAau2jwNarT7irQQO8TPjN0QI9BxSsuNeW7MW6CA7',1209600,'2019-05-07 01:21:38',7),('SgKjQsyQnz4ChCfWSjxhMmUpEAZEUOkUn4zfllzMnDLfI8EFcrq607AAqwVzFuDO',1209600,'2019-05-06 14:35:04',7),('smGWGy8rQSpmDWxgkyEKfx5sLgymU1UaCE4vPKwEUj0zEn4Hp2XORaWigEwxkpdd',1209600,'2019-05-07 01:20:52',7),('v6m9uqH7JIK6XzA5QZcrA40Twf0fvkUPfQxpnfUpl7nF2GFEtqrkFqvOhBK2mExV',1209600,'2019-05-07 01:20:38',7),('VvP8m5vSAoRwxdZPqc5tzcErqYoG1CFHi9xPsC432kQiXs2QRvWqt9yUNqNUoGZG',1209600,'2019-05-06 12:38:56',7),('w5zVKbYTVKL7l7Lfx4mqbKcJXnKhC0TscqtVzXBZcVxixwrGwc8aG25qINKB6cT1',1209600,'2019-05-06 14:37:26',7),('WWVrEjeCKZETIGiFqexpcOhJaiDU0xNGR3yEkt7nGCdAtpE8tKQDzx1d9WVNH7Vp',1209600,'2019-05-07 01:27:45',7),('X3WVaNHmArwBM7YbHZHaog6Y4Dkyc81LHtqblrGlNL3WRv0XFXI1yEY9wHKMFJ9g',1209600,'2019-05-04 23:47:44',2),('xeAQivB5AU6BsH8Bh61bAJRXvPUh7sPCVQIufkqHU3XLLWurOSFWvzC7c5x3IKrJ',1209600,'2019-05-07 01:16:33',7),('YN6GLw2b3q4MUy6l9Z0bVNJMRsWdZhEpkhGboEZ4EA37es0ldMxkuzg2AWxwDiL0',1209600,'2019-05-04 23:52:40',3),('YOQNaNSV5bI5GqAf0zAtOqPHAL4p05QooL4E54BNkZ7EaPeKLyoY99JhhEUA4umK',1209600,'2019-05-06 12:36:07',7),('zB5OKYxxxDpxf8IoB0FNEQuzCCsKtnXv9tLknWQY4wMDZvCVjpRtvW0Qd7xyzkRg',1209600,'2019-05-05 00:58:41',4),('zG1z19Ir2z8gIQZa3XRIdDZkESKrnK5Ud4sq8Z58YpuBTLjClnRL9jBDrGtOu0MI',1209600,'2019-05-04 23:43:50',1),('ZXjsggCedYXzm6pjSQlsSQRz98DfPuNTQ6taYD8JTFV3IGJCpjJ0qNe4qSJCKBtr',1209600,'2019-05-07 01:22:36',7);
/*!40000 ALTER TABLE `accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(512) DEFAULT NULL,
  `property` varchar(512) DEFAULT NULL,
  `accessType` varchar(512) DEFAULT NULL,
  `permission` varchar(512) DEFAULT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `CategoryID` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EventDate` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('0',NULL,NULL,NULL),('10001','Wedding','2019-01-02','7'),('10003','Birthday','2019-01-02','7'),('null',NULL,NULL,NULL),('老人过寿','老人过寿','2019-05-06','4'),('老人过寿12','老人过寿12','2019-05-14','7'),('老人过寿13','老人过寿13','2019-05-14','7'),('老人过寿14','老人过寿14','2019-05-08','7'),('老人过寿15','老人过寿15','2019-05-23','7'),('老人过寿3','老人过寿3','2019-05-07',NULL),('老人过寿4','老人过寿4','2019-05-21','7'),('老人过寿5','老人过寿5','2019-05-08','7'),('老人过寿6','老人过寿6','2019-05-21','7'),('老人过寿7','老人过寿7','2019-05-21','7'),('老人过寿8','老人过寿8','2019-05-06','7'),('老人过寿9','老人过寿9','2019-05-29','7'),('老人过寿90','老人过寿90','2019-05-22','7');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `PostID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Category` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Price` decimal(23,4) DEFAULT NULL,
  `Flagged` int(11) DEFAULT NULL,
  `Timestamp` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserID` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`PostID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (49,'李四','李四送礼','Wedding','1329929299','',100.0000,NULL,'20190507 15:02:01','7'),(50,'李四','李四送礼','老人过寿4','1329929299','',100.0000,NULL,'20190507 15:02:07','7'),(51,'李四','李四送礼','老人过寿6','1329929299','',100.0000,NULL,'20190507 15:13:03','7'),(52,'李四','李四送礼','老人过寿8','1329929299','',100.0000,NULL,'20190507 15:23:25','7'),(53,'李四','李四送礼','老人过寿90','1329929299','',100.0000,NULL,'20190507 15:33:47','7'),(54,'张三','三送礼','老人过寿7','1329929299','',100.0000,NULL,'20190507 15:38:57','7'),(55,'马佳俊','李四送礼','老人过寿15','1329929299','',100.0000,NULL,'20190507 17:10:49','7'),(56,'李四','李四送礼','老人过寿15','1329929299','',-200.0000,NULL,'20190507 17:11:04','7');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `postsum`
--

DROP TABLE IF EXISTS `postsum`;
/*!50001 DROP VIEW IF EXISTS `postsum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `postsum` AS SELECT 
 1 AS `Category`,
 1 AS `UserID`,
 1 AS `EventDate`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (3,'r_business_access','grants general access to businesstrips','2019-05-04 23:50:09','2019-05-04 23:50:09'),(4,'r_businesstrips_access','grants general access to businesstrips','2019-05-05 00:58:06','2019-05-05 00:58:06');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolemapping`
--

DROP TABLE IF EXISTS `rolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rolemapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principalId` (`principalId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemapping`
--

LOCK TABLES `rolemapping` WRITE;
/*!40000 ALTER TABLE `rolemapping` DISABLE KEYS */;
INSERT INTO `rolemapping` VALUES (3,'USER','3',3),(4,'USER','4',4),(5,'USER','8',4);
/*!40000 ALTER TABLE `rolemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realm` varchar(512) DEFAULT NULL,
  `username` varchar(512) DEFAULT NULL,
  `password` varchar(512) NOT NULL,
  `credentials` text,
  `challenges` text,
  `email` varchar(512) NOT NULL,
  `emailVerified` tinyint(1) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL,
  `status` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,NULL,NULL,'$2a$10$R5cEIqPFPRAQRCb/tanE6.OlKgq9REQaAmzC6MNpsh2w1F2xtsWK2',NULL,NULL,'liuhoubing@gmail.com',1,NULL,NULL,NULL,NULL),(8,NULL,'user1','$2a$10$qzXMzYS42eeNCMBPN54h8OWfcSjaLLgGs/XDC5Ckzix0WtmkfdTC6',NULL,NULL,'user1@tammen-it-solutions.de',NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,'$2a$10$melFt86GNsn57JGND.c5UOOLikZLiUDhnLzc0EHyOAI.zQmry4E1K',NULL,NULL,'liuhoubing@gmail.com1',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `postsum`
--

/*!50001 DROP VIEW IF EXISTS `postsum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `postsum` AS select `category`.`Name` AS `Category`,`category`.`UserID` AS `UserID`,`category`.`EventDate` AS `EventDate`,sum(`post`.`Price`) AS `Price` from (`category` left join `post` on((`post`.`Category` = `category`.`Name`))) group by `category`.`Name`,`category`.`UserID`,`category`.`EventDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07 17:23:07
