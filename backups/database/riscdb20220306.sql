-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: riscdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `coins`
--

DROP TABLE IF EXISTS `coins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(45) DEFAULT NULL,
  `image` longtext,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coins`
--

LOCK TABLES `coins` WRITE;
/*!40000 ALTER TABLE `coins` DISABLE KEYS */;
INSERT INTO `coins` VALUES (1,'Tron','TRX',NULL,NULL,NULL);
/*!40000 ALTER TABLE `coins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,2,'testing comments',NULL,1645581415149,1645581415149),(2,2,2,'second comment',NULL,1645581415149,1645581415149),(3,4,2,'third comment',NULL,1645581415149,1645581415149),(4,4,2,'testing',NULL,1645581415149,1645581415149),(5,5,2,'testing',NULL,1645581415149,1645581415149);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `follower_id` int DEFAULT NULL,
  `followed_id` int DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (1,4,2,1645582285740,1645582285740),(2,4,1,1645582500488,1645582500488),(3,4,5,1645582728837,1645582728837),(4,2,4,1645582728837,1645582728837),(5,1,4,1645582728837,1645582728837),(6,2,1,1645582728837,1645582728837),(7,1,2,1645582728837,1645582728837),(8,2,5,1645582728837,1645582728837);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_coins`
--

DROP TABLE IF EXISTS `post_coins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_coins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `coin_id` int DEFAULT NULL,
  `trade_type` int DEFAULT NULL,
  `value` decimal(10,5) DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_coins`
--

LOCK TABLES `post_coins` WRITE;
/*!40000 ALTER TABLE `post_coins` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_coins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` longtext,
  `image` longtext,
  `status` int DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,NULL,1,'For first post',NULL,0,1645581471149,1645581415149),(2,NULL,1,'Description of post',NULL,1,1645581415149,1645581415149),(3,NULL,1,'Description of post asdasdas',NULL,1,1645581415149,1645581415149),(4,NULL,1,'Description of post asdasd',NULL,1,1645581415149,1645581415149),(5,NULL,1,' asb aasd asadsadasd',NULL,1,1645581415149,1645581415149),(6,NULL,1,'Description of post asdsa d',NULL,1,1645581415149,1645581415149),(7,NULL,1,'Description of post asdsadas',NULL,1,1645581415149,1645581415149),(8,NULL,2,'Description of post asdasdas',NULL,1,1645581415149,1645581415149),(9,NULL,1,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(10,NULL,2,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(11,NULL,1,'Some description',NULL,1,1645581415149,1645581415149),(12,NULL,1,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(13,NULL,2,'Changing description',NULL,1,1645581415149,1645581415149),(14,NULL,1,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(15,NULL,1,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(16,NULL,1,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(17,NULL,2,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(18,NULL,2,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(19,NULL,4,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,0,1645581415149,1645581415149),(20,NULL,2,'TRX is going up now, TRX is going up now, TRX is going up now, TRX is going up now',NULL,1,1645581415149,1645581415149),(21,NULL,2,'Just picked up some xrp',NULL,1,1645581415149,1645581415149),(22,NULL,2,'Just picked up some xrp',NULL,1,1645581415149,1645581415149),(23,NULL,2,'Second post created on mobile',NULL,1,1645581415149,1645581415149),(24,NULL,2,'Just picked up some testing',NULL,1,1645581415149,1645581415149),(25,NULL,2,'Just picked up some testing',NULL,1,1645581415149,1645581415149),(26,NULL,2,'Testinc create update date',NULL,1,1645581415149,1645581415149),(27,NULL,4,'Testinc create update date',NULL,1,1645581475149,1645581475149),(28,NULL,4,'testing create with date',NULL,1,1645670032275,1645670032275),(29,NULL,4,NULL,NULL,NULL,1645581415149,1645670032275),(30,NULL,1,'test',NULL,1,1645673249180,1645673249180),(31,NULL,2,'Just picked up some xrp',NULL,1,1645673267771,1645673267771),(32,NULL,2,'Testing create posts',NULL,1,1645673638345,1645673638345),(33,NULL,2,'Testing',NULL,1,1645674269186,1645674269186),(34,NULL,2,'Testing',NULL,1,1645674308593,1645674308593),(35,NULL,2,'Testing',NULL,1,1645674334664,1645674334664),(36,NULL,2,'Testing',NULL,1,1645674348827,1645674348827),(37,NULL,2,'Testing drafts',NULL,0,1645674358806,1645674358806),(38,NULL,2,'Testing drafts save',NULL,0,1645674498131,1645674498131),(39,NULL,2,'Testing drafts save',NULL,0,1645674573244,1645674573244),(40,NULL,2,'Testing create post',NULL,1,1645674623921,1645674623921),(41,NULL,2,'Testing',NULL,0,1645674869356,1645674869356),(42,NULL,2,'Create post',NULL,1,1645674888603,1645674888603),(43,NULL,2,'Post create final test',NULL,1,1645674915555,1645674915555),(44,2,2,'Post create final test',NULL,0,1645674940596,1645674940596),(45,NULL,1,'testing',NULL,1,1646275468903,1646275468903);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
INSERT INTO `reactions` VALUES (1,1,1,2,NULL,1645581415149,1645581415149),(2,1,2,2,NULL,1645581415149,1645581415149),(3,1,2,45,NULL,1645581415149,1645581415149),(6,1,2,35,NULL,1646342415898,1646342415898),(7,1,2,34,NULL,1646342425701,1646342425701),(8,1,2,36,NULL,1646342527671,1646342527671),(9,1,2,33,NULL,1646342536335,1646342536335),(12,1,2,40,NULL,1646342591048,1646342591048),(13,1,2,30,NULL,1646342596080,1646342596080),(14,1,2,43,NULL,1646343216599,1646343216599),(16,1,2,18,NULL,1646343230734,1646343230734);
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ratings`
--

DROP TABLE IF EXISTS `user_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rater_id` int DEFAULT NULL,
  `rated_id` int DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ratings`
--

LOCK TABLES `user_ratings` WRITE;
/*!40000 ALTER TABLE `user_ratings` DISABLE KEYS */;
INSERT INTO `user_ratings` VALUES (1,1,2,4,1645581415149,1645581415149),(2,5,2,5,1645581415149,1645581415149);
/*!40000 ALTER TABLE `user_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` longtext,
  `bio` longtext,
  `confirmed` tinyint DEFAULT NULL,
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'veton','meqa','vetonmeqa','meqaveton@gmail.com','$2b$10$h.4oTOS.dDrAitTGFvA7hOYzbFOQKZt712IFTBZV.oZCDro/QabcO',NULL,NULL,NULL,NULL,NULL),(2,'veton','meqa','vtnmq','veton@arcadequest.app','$2b$10$P56kf3FFkqPp/Uvd4F0Cde9Der63GzPlYfFJ/JfAyn8X0wXCnxyCm',NULL,'Risc Financial Software Engeneer',NULL,NULL,NULL),(4,'daniel','baraghoush','danielbrg','daniel@arcadequest.app','$2b$10$lV/pXIVKuoG3l8VauBJgyuTXDroNlLvhgrfX3NPX0xeW0blAjrt0W',NULL,NULL,NULL,NULL,NULL),(5,'olivia','chung','olivia','olivia@risc.app','$2b$10$hSW5rL4ZbOC18tmHiH9zbek96hYnLPIxsKrwIsKmx5ngrt3JZ09je',NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,'testing@risc.app','$2b$10$kBgmmTkXRim2hpEztbYmEeegWqlZ5DdGFjRfWncbOc4DjmIlX5ZIG',NULL,NULL,0,1645583948710,1645583948710);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-06  1:52:50
