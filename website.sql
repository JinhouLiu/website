-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `MENU`
--

DROP TABLE IF EXISTS `MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MENU` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) NOT NULL,
  `IS_LEAF` int(1) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU`
--

LOCK TABLES `MENU` WRITE;
/*!40000 ALTER TABLE `MENU` DISABLE KEYS */;
INSERT INTO `MENU` VALUES (1,'绯荤粺绠＄悊',0,NULL,0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(2,'涓汉璁剧疆',0,NULL,0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(3,'鐢ㄦ埛绠＄悊',1,1,0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(4,'瑙掕壊绠＄悊',1,1,0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(5,'鑿滃崟绠＄悊',1,1,0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(6,'鏉冮檺绠＄悊',1,1,0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(7,'淇敼瀵嗙爜',1,2,0,'2015-07-06 00:00:00','2015-07-06 00:00:00');
/*!40000 ALTER TABLE `MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION`
--

DROP TABLE IF EXISTS `PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PNAME` varchar(100) NOT NULL,
  `PMENU_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PERMISSION_MENU` (`PMENU_ID`),
  CONSTRAINT `FK_PERMISSION_MENU` FOREIGN KEY (`PMENU_ID`) REFERENCES `MENU` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION`
--

LOCK TABLES `PERMISSION` WRITE;
/*!40000 ALTER TABLE `PERMISSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RNAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATOR_ID` int(11) DEFAULT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'系统管理员角色','系统管理员',1,0,'2015-07-06 00:00:00','2015-07-06 00:00:00');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_PERMISSION`
--

DROP TABLE IF EXISTS `ROLE_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_PERMISSION` (
  `ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `PERMISSION_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLEPERMISSION_ROLE` (`ROLE_ID`),
  KEY `FK_ROLEPERMISSION_PERMISSION` (`PERMISSION_ID`),
  CONSTRAINT `FK_ROLEPERMISSION_PERMISSION` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`ID`),
  CONSTRAINT `FK_ROLEPERMISSION_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_PERMISSION`
--

LOCK TABLES `ROLE_PERMISSION` WRITE;
/*!40000 ALTER TABLE `ROLE_PERMISSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(50) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `REAL_NAME` varchar(50) DEFAULT NULL,
  `SEX` int(1) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'admin','root','系统管理员',0,'1991-03-27','13040818614','www.975764577@qq.com',0,'2015-07-06 00:00:00','2015-07-06 00:00:00'),(2,'user','root','普通用户',0,'1991-03-27','13040818614','www.975764577@qq.com',0,'2015-07-06 00:00:00','2015-07-06 00:00:00');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE`
--

DROP TABLE IF EXISTS `USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `IS_DELETE` int(1) NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USERROLE_ROLE` (`ROLE_ID`),
  KEY `FK_USERROLE_USER` (`USER_ID`),
  CONSTRAINT `FK_USERROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`),
  CONSTRAINT `FK_USERROLE_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE`
--

LOCK TABLES `USER_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resource`
--

DROP TABLE IF EXISTS `t_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `res_code` varchar(100) NOT NULL,
  `res_name` varchar(100) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `parent_code` varchar(100) NOT NULL,
  `res_depth` int(11) NOT NULL,
  `res_url` varchar(100) NOT NULL,
  `res_type` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  `attribute1` varchar(100) DEFAULT NULL,
  `attribure2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resource`
--

LOCK TABLES `t_resource` WRITE;
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  `attribute1` varchar(100) DEFAULT NULL,
  `attribure2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'ROLE_ADMIN','???',0,1,'0000-00-00 00:00:00',1,'0000-00-00 00:00:00',NULL,NULL,NULL),(2,'ROLE_USER','????',0,1,'2015-07-16 09:52:51',1,'2015-07-16 09:52:56',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_resource`
--

DROP TABLE IF EXISTS `t_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `res_id` bigint(20) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  `attribute1` varchar(100) DEFAULT NULL,
  `attribure2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_resource`
--

LOCK TABLES `t_role_resource` WRITE;
/*!40000 ALTER TABLE `t_role_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) NOT NULL,
  `username_email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nick_name` varchar(100) DEFAULT NULL,
  `user_status` int(11) NOT NULL,
  `register_time` datetime NOT NULL,
  `locked_time` datetime NOT NULL,
  `login_status` int(11) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `delete_flag` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  `attribute1` varchar(100) DEFAULT NULL,
  `attribute2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  `errornumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'wanxing','www.975764577@qq.com','$2a$10$OI5OKThTNX36eJClmZtMCOVg6IPWTL8YljwqOBvDE.NjoNb.LZo5i','??',1,'2015-07-16 00:22:17','2015-07-16 00:22:21',2,'2015-07-16 00:22:54',NULL,1,1,'2015-07-16 00:23:30',1,'2015-07-16 00:23:36',NULL,NULL,NULL,NULL),(2,'liujinhou','18070156983@163.com','$2a$10$7uJUXpOCHa57gZD/fOE1Me/PDD8dpctHKtUQ1wKo0JfWHl4Va7dJq','liujinhou',1,'2015-07-16 00:25:16','2015-07-16 00:25:20',2,'2015-07-16 00:25:41',NULL,1,1,'2015-07-16 00:26:06',1,'2015-07-16 00:26:17',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_addition`
--

DROP TABLE IF EXISTS `t_user_addition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_addition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `sex` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `real_name` varchar(100) DEFAULT NULL,
  `id_card` varchar(100) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  `attribute1` varchar(100) DEFAULT NULL,
  `attribute2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_addition`
--

LOCK TABLES `t_user_addition` WRITE;
/*!40000 ALTER TABLE `t_user_addition` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_addition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime NOT NULL,
  `attribute1` varchar(100) DEFAULT NULL,
  `attribure2` varchar(100) DEFAULT NULL,
  `attribute3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,1,1,0,1,'2015-07-16 00:59:53',1,'2015-07-16 00:59:59',NULL,NULL,NULL),(2,2,2,0,1,'2015-07-16 09:55:33',1,'2015-07-16 09:55:44',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-16 11:57:58
