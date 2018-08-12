CREATE DATABASE  IF NOT EXISTS `todo_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `todo_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: todo_db
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo`
--

DROP TABLE IF EXISTS `todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo` (
  `todo_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`todo_id`),
  KEY `fk_user_idx` (`created_by`),
  KEY `index_title` (`title`),
  CONSTRAINT `FK3ogevy5q4dnc94bh1bqyb5hn3` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Has one row for each todo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo`
--

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
INSERT INTO `todo` VALUES (1,'sample todo','sample todo description',1,'2018-08-12 15:53:16','2018-08-12 10:23:16',0),(2,'todo ttitle','todo desc',1,'2018-08-12 17:12:15','2018-08-12 11:42:15',0),(3,'user 2 todo 1 title','user 2 todo 1 description\r\n\r\nasdfasdf\r\n\r\nasdfsdf',2,'2018-08-12 18:39:58','2018-08-12 16:33:07',0),(4,'Weekend TODOS','1. Get Grocery\r\n2. Get a bicycle\r\n3. Call Everyone At home',2,'2018-08-12 18:51:42','2018-08-12 16:33:07',0),(5,'asdfkjl','alsdfsdf',2,'2018-08-12 18:55:22','2018-08-12 16:33:07',0),(6,'asdfasd','asdfasdf',2,'2018-08-12 18:56:59','2018-08-12 16:33:07',0),(7,'asdf','asdf',2,'2018-08-12 18:57:29','2018-08-12 16:33:07',0),(8,'asdf','asdf asdfasdf',2,'2018-08-12 19:16:25','2018-08-12 16:33:07',0),(9,'asdf','asdf asdfasdf\r\nasdfasdf',2,'2018-08-12 19:16:56','2018-08-12 16:33:07',0),(10,'asdf','asdf asdfasdf\r\nasdfasdf lklkllkl',2,'2018-08-12 19:18:02','2018-08-12 16:33:07',0),(11,'user 2 todo 1 title','user 2 todo 1 description\r\nupdated',2,'2018-08-12 19:18:20','2018-08-12 16:33:07',0),(12,'user 2 todo 1 title','user 2 todo 1 description updated\r\nupdated again',2,'2018-08-12 19:18:40','2018-08-12 16:34:10',0),(13,'user 2 todo 1 title','user 2 todo 1 description\r\nupdate',2,'2018-08-12 19:22:15','2018-08-12 16:33:07',1),(14,'My test todo','test todo description',2,'2018-08-12 20:19:34','2018-08-12 16:33:07',1),(15,'New TODO','New TODO',2,'2018-08-12 22:04:24','2018-08-12 16:34:24',0);
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin@localhost.com','Bhartiya','Nikhil','$2a$10$Uk1EcI3Tr2FZTbzv.4RhZeTTNvvNiO8IiBfvJ/x578GjboqZfJXsK'),(2,1,'user2@localhost.com','user2lastname','user2firstname','$2a$10$QGMhmUqV2mwC1.ZCpMpSAO3jGco6KM1yumRN4UqFiR3fML46SsN1K');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-12 22:38:24
