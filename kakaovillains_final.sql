-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: kakaovillains_db
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `detailed_address` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `request` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL,
  `zipcode` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_d930d1dc_fk_users_id` (`user_id`),
  CONSTRAINT `addresses_user_id_d930d1dc_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
  CONSTRAINT `carts_product_id_02913eac_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'리빙'),(5,'문구'),(9,'생활테크'),(11,'식품'),(8,'여행/레져'),(6,'의류'),(4,'잡화'),(1,'테마 기획전'),(2,'토이'),(7,'파자마'),(10,'폰 액세서리');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (11,'고냥이'),(12,'꾀돌이'),(13,'단무지'),(14,'두부'),(1,'아몬드'),(2,'자이제'),(4,'죠르디'),(3,'준식'),(5,'칸'),(6,'타이거'),(7,'토끼'),(8,'팬다어덜트'),(9,'프라다'),(10,'피치피치');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_products`
--

DROP TABLE IF EXISTS `characters_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `characters_products_character_id_7530d752_fk_characters_id` (`character_id`),
  KEY `characters_products_product_id_d1884643_fk_products_id` (`product_id`),
  CONSTRAINT `characters_products_character_id_7530d752_fk_characters_id` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  CONSTRAINT `characters_products_product_id_d1884643_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_products`
--

LOCK TABLES `characters_products` WRITE;
/*!40000 ALTER TABLE `characters_products` DISABLE KEYS */;
INSERT INTO `characters_products` VALUES (1,10,1),(2,4,2),(3,1,3),(4,1,4),(5,5,5),(6,7,6),(7,3,7),(8,9,8),(9,11,9),(10,14,10),(11,8,11),(12,12,12),(13,13,13),(14,2,14),(15,5,15),(16,7,16),(17,1,17),(18,4,18),(19,9,19),(20,7,20),(21,6,21),(22,11,22),(23,13,23),(24,14,24),(25,9,25),(26,3,26),(27,1,27),(28,5,28),(29,10,29),(30,4,30),(31,11,31),(32,12,32),(33,7,33),(34,1,34),(35,13,35),(36,9,36),(37,14,37),(38,2,38),(39,3,39),(40,6,40),(41,8,41),(42,14,42),(43,9,43),(44,6,44),(45,1,45),(46,2,46),(47,8,47),(48,11,48),(49,12,49),(50,6,50),(51,13,51),(52,14,52),(53,1,53),(54,2,54),(55,3,55),(56,4,56),(57,5,57),(58,6,58),(59,7,59),(60,4,60),(61,10,61),(62,12,62),(63,8,63);
/*!40000 ALTER TABLE `characters_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `card_number` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `expiration` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `default` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_cards_user_id_c0ec35c3_fk_users_id` (`user_id`),
  CONSTRAINT `credit_cards_user_id_c0ec35c3_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'account','user'),(1,'contenttypes','contenttype'),(4,'feed','feed'),(9,'feed','feedimage'),(8,'feed','feedlike'),(7,'feed','recommendedproduct'),(5,'feed','reply'),(6,'feed','replylike'),(10,'product','category'),(11,'product','character'),(17,'product','characterproduct'),(12,'product','product'),(16,'product','productimage'),(13,'product','review'),(15,'product','reviewlike'),(14,'product','subcategory'),(18,'purchase','address'),(22,'purchase','cart'),(19,'purchase','creditcard'),(21,'purchase','purchasedproduct'),(23,'purchase','status'),(20,'purchase','transaction'),(2,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'account','0001_initial','2021-03-26 04:09:47.324004'),(2,'product','0001_initial','2021-03-26 04:09:47.561335'),(3,'purchase','0001_initial','2021-03-26 04:09:47.953031'),(4,'product','0002_character_product','2021-03-26 04:09:48.248289'),(5,'purchase','0002_transaction_product','2021-03-26 04:09:48.268304'),(6,'purchase','0003_auto_20210318_0547','2021-03-26 04:09:48.422304'),(7,'product','0003_product_updated_at','2021-03-26 04:09:48.482304'),(8,'product','0004_auto_20210318_0729','2021-03-26 04:09:48.510021'),(9,'purchase','0004_auto_20210318_0729','2021-03-26 04:09:48.652481'),(10,'feed','0001_initial','2021-03-26 04:09:48.837233'),(11,'feed','0002_feed_product','2021-03-26 04:09:49.170945'),(12,'feed','0003_auto_20210318_0729','2021-03-26 04:09:49.191924'),(13,'account','0002_auto_20210318_0530','2021-03-26 04:09:49.241600'),(14,'account','0003_user_liked_feed','2021-03-26 04:09:49.263902'),(15,'account','0004_auto_20210318_0729','2021-03-26 04:09:49.316906'),(16,'contenttypes','0001_initial','2021-03-26 04:09:49.350513'),(17,'contenttypes','0002_remove_content_type_name','2021-03-26 04:09:49.416715'),(18,'feed','0004_auto_20210321_0857','2021-03-26 04:09:49.452496'),(19,'feed','0004_auto_20210319_0058','2021-03-26 04:09:49.470247'),(20,'feed','0005_merge_20210325_1508','2021-03-26 04:09:49.477432'),(21,'product','0005_auto_20210324_1158','2021-03-26 04:09:49.614332'),(22,'purchase','0005_auto_20210318_0731','2021-03-26 04:09:49.620973'),(23,'sessions','0001_initial','2021-03-26 04:09:49.643303');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_images`
--

DROP TABLE IF EXISTS `feed_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `feed_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_images_feed_id_0a8dcad9_fk_feeds_id` (`feed_id`),
  CONSTRAINT `feed_images_feed_id_0a8dcad9_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_images`
--

LOCK TABLES `feed_images` WRITE;
/*!40000 ALTER TABLE `feed_images` DISABLE KEYS */;
INSERT INTO `feed_images` VALUES (1,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201231213914.jpg',1),(2,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201231213914.jpg',1),(3,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201231213915.jpg',1),(4,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201231213915.jpg',1),(5,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20210311111702.jpg',2),(6,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210315113851.jpg',2),(7,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210315113851.jpg',2),(8,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210315113851.jpg',2),(9,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210315113851.jpg',2),(10,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210315113851.jpg',2),(11,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210315113851.jpg',2),(12,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210315113851.jpg',2),(13,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308175813.jpg',3),(14,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308175948.jpg',3),(15,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308175948.jpg',3),(16,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308175948.jpg',3),(17,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210308175948.jpg',3),(18,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210308175948.jpg',3),(19,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210308175949.jpg',3),(20,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210308175949.jpg',3),(21,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210308175949.jpg',3),(22,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308152636.jpg',4),(23,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308152636.jpg',4),(24,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308152636.jpg',4),(25,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210218165255.jpg',5),(26,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210218165301.jpg',5),(27,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210218165301.jpg',5),(28,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210218165301.jpg',5),(29,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210218165301.jpg',5),(30,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210218165301.jpg',5),(31,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210218165302.jpg',5),(32,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210218165302.jpg',5),(33,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210218165302.jpg',5),(34,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210315175259.jpg',6),(35,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210315175259.jpg',6),(36,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210315175259.jpg',6),(37,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210315175259.jpg',6),(38,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210315175259.jpg',6),(39,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210315175300.jpg',6),(40,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210315175300.jpg',6),(41,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210315175300.jpg',6),(42,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308185146.jpg',7),(43,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308185146.jpg',7),(44,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308185146.jpg',7),(45,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210308185146.jpg',7),(46,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210308185146.jpg',7),(47,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210308185147.jpg',7),(48,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210308185147.jpg',7),(49,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210308185147.jpg',7),(50,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308152918.jpg',8),(51,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308152919.jpg',8),(52,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308152919.jpg',8),(53,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210308152919.jpg',8),(54,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210308152919.jpg',8),(55,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210308152919.jpg',8),(56,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210308152919.jpg',8),(57,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210308152919.jpg',8),(58,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210315175537.jpg',9),(59,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210315175537.jpg',9),(60,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210315175537.jpg',9),(61,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210315175537.jpg',9),(62,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210315175537.jpg',9),(63,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210315175537.jpg',9),(64,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210209144126.jpg',10),(65,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210209144126.jpg',10),(66,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210209144126.jpg',10),(67,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210209144126.jpg',10),(68,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210209144126.jpg',10),(69,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210209144126.jpg',10),(70,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210304094857.jpg',11),(71,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210304095039.jpg',11),(72,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210304095039.jpg',11),(73,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210304095039.jpg',11),(74,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210304095039.jpg',11),(75,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210304095039.jpg',11),(76,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210304095047.jpg',11),(77,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210304095047.jpg',11),(78,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210304095048.jpg',11),(79,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210304095048.jpg',11),(80,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210312132115.jpg',12),(81,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210312132115.jpg',12),(82,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210312132115.jpg',12),(83,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210312132115.jpg',12),(84,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095852.jpg',13),(85,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095915.jpg',13),(86,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095918.jpg',13),(87,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095920.jpg',13),(88,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095923.jpg',13),(89,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210205144838.jpg',14),(90,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210205144842.jpg',14),(91,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210205144842.jpg',14),(92,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210205144842.jpg',14),(93,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210205144842.jpg',14),(94,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210205144842.jpg',14),(95,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210205144842.jpg',14),(96,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310192444.jpg',15),(97,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210310192444.jpg',15),(98,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210310192444.jpg',15),(99,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210310192444.jpg',15),(100,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210310192444.jpg',15),(101,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210310192444.jpg',15),(102,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210310192444.jpg',15),(103,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210310192444.jpg',15),(104,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_8_20210310192444.jpg',15),(105,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_9_20210310192445.jpg',15),(106,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310143228.jpg',16),(107,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310143231.jpg',16),(108,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210310143232.jpg',16),(109,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201210105805.jpg',17),(110,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201210105825.jpg',17),(111,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201210105825.jpg',17),(112,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201210105825.jpg',17),(113,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201210105826.jpg',17),(114,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201210105826.jpg',17),(115,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201217095707.jpg',18),(116,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201217095707.jpg',18),(117,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201217095707.jpg',18),(118,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201217095707.jpg',18),(119,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201217095710.jpg',18),(120,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129160044.jpg',19),(121,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20210209083419.jpg',19),(122,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_1_20210209083419.jpg',19),(123,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_2_20210209083419.jpg',19),(124,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_3_20210209083420.jpg',19),(125,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_5_20210209083420.jpg',19),(126,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_6_20210209083420.jpg',19),(127,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_7_20210209083420.jpg',19),(128,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201229133336.jpg',20),(129,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201229133353.jpg',20),(130,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201229133353.jpg',20),(131,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201229133353.jpg',20),(132,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201229133353.jpg',20),(133,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210302145914.jpg',21),(134,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20201123185847.jpg',22),(135,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210201102239.jpg',23),(136,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223151142.jpg',24),(137,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223151242.jpg',24),(138,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210223151242.jpg',24),(139,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210223151242.jpg',24),(140,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210223151242.jpg',24),(141,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210223151243.jpg',24),(142,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210223151243.jpg',24),(143,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210223151243.jpg',24),(144,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210223151243.jpg',24),(145,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214144245.jpg',25),(146,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214144246.jpg',25),(147,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145836.jpg',25),(148,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145839.jpg',25),(149,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145842.jpg',25),(150,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145845.jpg',25),(151,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145855.jpg',25),(152,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201130082416.jpg',26),(153,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201130082416.jpg',26),(154,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201130082416.jpg',26),(155,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201130082416.jpg',26),(156,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201130082416.jpg',26),(157,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310182049.jpg',27),(158,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210226152322.jpg',28),(159,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210226152335.jpg',28),(160,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210226152335.jpg',28),(161,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210226152335.jpg',28),(162,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210226152335.jpg',28),(163,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210226152335.jpg',28),(164,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210226152335.jpg',28),(165,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210119180310.jpg',29),(166,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210119180310.jpg',29),(167,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210119180310.jpg',29),(168,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210119180310.jpg',29),(169,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210119180310.jpg',29),(170,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210204175203.jpg',30),(171,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210204175415.jpg',30),(172,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210204175415.jpg',30),(173,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210204175415.jpg',30),(174,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210204175416.jpg',30),(175,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210204175423.jpg',30),(176,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210204175423.jpg',30),(177,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210204175423.jpg',30),(178,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210204175423.jpg',30),(179,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210204175423.jpg',30),(180,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210302145222.jpg',31),(181,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210112123819.jpg',32),(182,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210112123819.jpg',32),(183,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210115101335.jpg',32),(184,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210115101339.jpg',32),(185,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201216142443.jpg',33),(186,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201216142443.jpg',33),(187,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201216142548.jpg',33),(188,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201216142548.jpg',33),(189,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201216142549.jpg',33),(190,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201216142552.jpg',33),(191,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210303114652.jpg',34),(192,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210303114652.jpg',34),(193,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210303114652.jpg',34),(194,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210303114652.jpg',34),(195,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210303114652.jpg',34),(196,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210219170810.jpg',35),(197,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210219170810.jpg',35),(198,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210219170810.jpg',35),(199,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210219170811.jpg',35),(200,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210114163611.jpg',36),(201,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210114163625.jpg',36),(202,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210114163625.jpg',36),(203,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210114163625.jpg',36),(204,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210114163625.jpg',36),(205,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_1_20210114140115.jpg',37),(206,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_2_20210114140116.jpg',37),(207,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_3_20210114140116.jpg',37),(208,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210108112239.jpg',38),(209,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210104151954.jpg',39),(210,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210104152009.jpg',39),(211,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210104152009.jpg',39),(212,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210104152014.jpg',39),(213,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210104152014.jpg',39),(214,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210126174747.jpg',40),(215,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210219153319.jpg',41),(216,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210208174024.jpg',42),(217,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210208174042.jpg',42),(218,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210208174042.jpg',42),(219,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210208174043.jpg',42),(220,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210208174043.jpg',42),(221,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210208174043.jpg',42),(222,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201222121548.jpg',43),(223,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201222121554.jpg',43),(224,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201222121554.jpg',43),(225,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201222121554.jpg',43),(226,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201222121554.jpg',43),(227,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152102.jpg',44),(228,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152105.jpg',44),(229,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152107.jpg',44),(230,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201229114254.jpg',45),(231,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201229114254.jpg',45),(232,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201229114254.jpg',45),(233,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201229114254.jpg',45),(234,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201229114254.jpg',45),(235,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201229114255.jpg',45),(236,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_1_20201119145817.jpg',46),(237,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_2_20201119145817.jpg',46),(238,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_3_20201119145817.jpg',46),(239,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_4_20201119145818.jpg',46),(240,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_5_20201119145818.jpg',46),(241,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_6_20201119145818.jpg',46),(242,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_7_20201119145818.jpg',46),(243,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210209141439.jpg',47),(244,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210209141439.jpg',47),(245,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210209141439.jpg',47),(246,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210209141439.jpg',47),(247,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210209141439.jpg',47),(248,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141102.jpg',48),(249,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141115.jpg',48),(250,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141119.jpg',48),(251,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210129141119.jpg',48),(252,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210129141119.jpg',48),(253,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141122.jpg',48),(254,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210129141122.jpg',48),(255,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210129141122.jpg',48),(256,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210202160736.jpg',49),(257,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210202174630.jpg',49),(258,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210202174630.jpg',49),(259,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210202174630.jpg',49),(260,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210202174630.jpg',49),(261,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210202174630.jpg',49),(262,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210125085532.jpg',50),(263,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210125085532.jpg',50),(264,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210125085532.jpg',50),(265,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201221091151.jpg',51),(266,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201223093210.jpg',52),(267,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201223093210.jpg',52),(268,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201223093210.jpg',52),(269,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201223093210.jpg',52),(270,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201223093211.jpg',52),(271,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201223093211.jpg',52),(272,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201202162648.jpg',53),(273,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201202162704.jpg',53),(274,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201202162704.jpg',53),(275,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201202162704.jpg',53),(276,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201202162705.jpg',53),(277,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201202162705.jpg',53),(278,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201202162705.jpg',53),(279,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20201202162706.jpg',53),(280,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083214.jpg',54),(281,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214083214.jpg',54),(282,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201214083214.jpg',54),(283,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201214083215.jpg',54),(284,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083223.jpg',54),(285,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083233.jpg',54),(286,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214083233.jpg',54),(287,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083242.jpg',54),(288,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214083242.jpg',54),(289,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20201123185505.jpg',55),(290,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20201123185521.jpg',55),(291,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_1_20201123185521.jpg',55),(292,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_2_20201123185521.jpg',55),(293,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_3_20201123185521.jpg',55),(294,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_4_20201123185521.jpg',55),(295,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201224121615.jpg',56),(296,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151746.jpg',57),(297,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151748.jpg',57),(298,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151755.jpg',57),(299,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151758.jpg',57),(300,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151801.jpg',57),(301,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151804.jpg',57),(302,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201202145154.jpg',58),(303,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152348.jpg',59),(304,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_1_20201119152348.jpg',59),(305,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_2_20201119152348.jpg',59);
/*!40000 ALTER TABLE `feed_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_likes`
--

DROP TABLE IF EXISTS `feed_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_likes_feed_id_f8552b3e_fk_feeds_id` (`feed_id`),
  KEY `feed_likes_user_id_ae0bf962_fk_users_id` (`user_id`),
  CONSTRAINT `feed_likes_feed_id_f8552b3e_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `feed_likes_user_id_ae0bf962_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_likes`
--

LOCK TABLES `feed_likes` WRITE;
/*!40000 ALTER TABLE `feed_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `reply_count` int NOT NULL,
  `like_count` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feeds_user_id_7f2e31f5_fk_users_id` (`user_id`),
  CONSTRAINT `feeds_user_id_7f2e31f5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (1,'1. 샤워하고 거울 볼 때 \"오 나 쫌 갠찮은데?\"(👇이어서 달아 주기)',9,2,'2021-03-26 04:25:39.213777','크으 내가 생각해도 내가 쫌 멋있는 순간!',1),(2,'우리와 함께라면 집도 카페처럼 💝',17,2,'2021-03-26 04:25:39.220757','집이야? 브런치 카페야?',2),(3,'어피치의 이뻐지기 프로젝트 어피치 X 에스더버니.',14,5,'2021-03-26 04:25:39.222806','피치피치 어피치! 핑크빛 만남 💖',3),(4,'일회용 컵 사용은 줄이고우리와 함께 시작해볼래?',9,1,'2021-03-26 04:25:39.225079','지구를 사랑하는 마음을텀블러로 표현해봐',4),(5,'라이언과 프릳츠 한잔 어때요?',15,3,'2021-03-26 04:25:39.227119','커피 한 잔 할래요 ☕️',5),(6,'숨겨왔던 스카피의 비-밀은? 🔍',10,4,'2021-03-26 04:25:39.228677','스카피는 집토끼니🐰 산토끼니? 🐇',6),(7,'🗣(웅성웅성) 3월 19일 죠르디 사원증이 출시된다구!👥',10,4,'2021-03-26 04:25:39.230490','나만의 멋진 사원증언젠간 꼭 걸고 말거죨 💚',7),(8,'이번주엔 뭐해? 가벼운 차림으로 나가볼까?',19,3,'2021-03-26 04:25:39.232576','점점 설레는 봄에코백 매고 나들이 떠나볼까?',8),(9,'나의 첫 번째 비밀을 말해줄게 🤫',14,3,'2021-03-26 04:25:39.234559','반가워, 내 이름은 꿈돌이 ⭐️',9),(10,'꿈년배들의 새로운 꿈, 꿈돌이가 응원할게 ✨',14,3,'2021-03-26 04:25:39.236141','꿈돌이 IS BACK',10),(11,'프렌즈와 함께 업무 효율 뿜뿜 올려봐요 🆙',10,2,'2021-03-26 04:25:39.238202','프로 재택러가 되고 싶다면?',11),(12,'빠냐 & 죠르디 진지하게 고민중 🤔',12,5,'2021-03-26 04:25:39.239828','맛있고 귀여운 도시락은 없을까?',12),(13,'동글동글 말랑말랑 포옥 껴안아줘요.',9,6,'2021-03-26 04:25:39.241689','폭신폭신 구름같은 편안함 ☁️',13),(14,'우리와 함께라면 스르르 잠들거예요 🌝',7,4,'2021-03-26 04:25:39.243734','잠 못드는 밤은 안녕 💤',14),(15,'나한테 정말 왜이러냐구우우우 😡',8,4,'2021-03-26 04:25:39.245750','오늘은 운수가 좋더라니 🍦',1),(16,'세계최고 귀여운 빵을 만들어볼까?',14,4,'2021-03-26 04:25:39.247620','많이 기다렸지?노릇노릇 라이언표 샌드위치',2),(17,'죠르디가 소독해주께~요기 딱 올려두기만 해',12,2,'2021-03-26 04:25:39.249643','삶아 빨수 없는 내 소중템! 살균 소독 비법 알려준다',3),(18,'베오베&스테디 셀러 라이언 오토손세정기에 이어 이젠 어피치가 접수할게!',14,4,'2021-03-26 04:25:39.251233','손대면 토-옥하고떨어지는 거품 그대',4),(19,'새해 의욕 상승엔 책상 꾸미기가 최고죨 💚',12,1,'2021-03-26 04:25:39.253653','죠-하, 내 최애 데스크템 한번 볼래?',5),(20,'어디서든 귀엽게 끓여줄게',14,1,'2021-03-26 04:25:39.255450','보글보글따듯한 물이 필요하니?',6),(21,'하루종일 편안한 파자마는 어때?',8,1,'2021-03-26 04:25:39.257591','뒹굴뒹굴 집콕러 모여라',7),(22,'소중한 사이일수록 서로 챙겨주기!!',8,2,'2021-03-26 04:25:39.259498','어때요, 우리 제법 잘 어울리나요?',8),(23,'한 개를 알려줘도 열을 아는 나만의 홈 스마트 홈! 구경할래?',12,1,'2021-03-26 04:25:39.261234','똑똑- 누구세요?',9),(24,'라이언 시계는 훨씬 더 콩닥콩닥 ⏰',8,4,'2021-03-26 04:25:39.262970','친구를 만나는 시간은 언제나 설레여 💓',10),(25,'몇번째 표정이 제일 마음에 들어?😋',12,2,'2021-03-26 04:25:39.265190','리치 리치 아엠어 표정 리치',11),(26,'왕 큰 빅 자이언트 소파 필요한 집돌 피플 지금 당장 클릭!',17,3,'2021-03-26 04:25:39.267046','집순/집돌 특)이런 쇼파 다들 한번쯤 상상해봄😘',12),(27,'3월의 배경화면이 도착했어요 🎁',11,3,'2021-03-26 04:25:39.268856','📱어느새 폰에도 봄이왔어 🌱',13),(28,'호호 ~ 손목아 아프지마 보호 인형 필요한 사람?',18,6,'2021-03-26 04:25:39.270725','어피치를 꼭 끌어안을래 🍑',14),(29,'라이언이 따뜻한 불빛을 비출게☺️ 오늘 하루 고생했다고, 자기전 스스로에게 꼭 말해주기!',12,3,'2021-03-26 04:25:39.272674','차가운 형광등 불빛 대신',1),(30,'책상 위, 신년 맞이 신상템 입양할 때!💞',13,1,'2021-03-26 04:25:39.274635','음 때가 됐다! 엣헴😛',2),(31,'상큼한 아이들을 득템해야 할 때야 🛒',12,5,'2021-03-26 04:25:39.276544','봄오니까 설레여 🍋',3),(32,'초록이 돋는 봄을 기다려🌱',12,4,'2021-03-26 04:25:39.278270','챡챡챡🌿 정원사 죠르디는 가드닝 중',4),(33,'집사들아 나 많이 기다렸지?',13,1,'2021-03-26 04:25:39.280061','애용~ 내 이름은 춘식이🐈',5),(34,'새 학기엔 역시 신상 문구템이지!',9,2,'2021-03-26 04:25:39.281998','공부는 역시 장비빨이지 📚',6),(35,'춘하 😺 새학기는 나와 열공해 📝',13,4,'2021-03-26 04:25:39.284166','(축) 춘식이 문구템 등장 👏🏻',7),(36,'핸드폰 충전하면서 우리 기분도 충전중..😍',8,4,'2021-03-26 04:25:39.285948','우왕...이거 빛이나 헤헤',8),(37,'제일 맘에 드는걸로 우리 같이 골라 볼까-',17,2,'2021-03-26 04:25:39.287965','오늘 새로 장만한 내 책상 뉴비 아이템! 어때?',9),(38,'무지&콘 베스트셀러 모음👇',12,5,'2021-03-26 04:25:39.289982','무지무지 무지&콘을 좋아하는 프렌즈들 요기 있는고 다 알앙',10),(39,'워머, 이건 꼭 사야해🌝 라이언&춘식 캔들워머로 매일 저녁 셀프 힐링🐾',13,5,'2021-03-26 04:25:39.291954','애용~ 좋은 향기에 은은한 불빛 좋다냥💫',11),(40,'1일 1사과는 죠르디의 하루 루틴💕 다들 무슨 과일 제일 좋아해?',15,1,'2021-03-26 04:25:39.293942','한 입 가-득 사과 냠냠🍎',12),(41,'라이언의 꿈 🦁 을 담은 콜라보레이션 ✍🏻',11,5,'2021-03-26 04:25:39.295684','냥냥 라이언 갈기가 생겼다 🎉',13),(42,'귀염뽀쨕 차량용품 신상 나가신다 길을비켜라 🚖',11,4,'2021-03-26 04:25:39.297953','왕초보운전자 필수템 🚨',14),(43,'체온 재는 습관으로 서로의 일상 지켜주기!',8,3,'2021-03-26 04:25:39.299776','오늘의 체온은 몇 도!? 라이언이랑 점검하기👌',1),(44,'라이언 웹캠과 함께라면 원격강의도, 재택근무도 문제 없을 무!',11,3,'2021-03-26 04:25:39.301319','라 전무가 보고 있다 👀',2),(45,'LED 스탠드 + 무선충전 + 펜꽂이 되는  만능템 말이야 ✌️😆',10,3,'2021-03-26 04:25:39.303540','네 책상에 이런거 있어? 😮?',3),(46,'세상을 빛내는 내 후광⚡ 스치기만 해도 깨끗해진다구!',12,7,'2021-03-26 04:25:39.305620','받아라 세균, 깨끗민둥빔!',4),(47,'세젤귀 맥세이프 케이스가 여기있다구 📱',14,1,'2021-03-26 04:25:39.307984','애플 매니아는 주목 🍏',5),(48,'이름하여 꿀잠 메가 바디 필로우🤟 어디 한번 내가 누워 볼까아?',10,1,'2021-03-26 04:25:39.309912','불면증이 뭐죠? 먹는건가요?😜 꿀잠 소환 치트키의 귀환',6),(49,'멀리 갈 수 없는 요즘 😷 우리와 함께 전주 한옥 마을로 GO GO',12,2,'2021-03-26 04:25:39.311769','전주로 랜선 여행 떠나볼까?',7),(50,'죨디 new 버즈 라이브 케이스 압도적 미모에  반했습니다🤗',10,3,'2021-03-26 04:25:39.313530','버즈인들 대동단결 시키는😍',8),(51,'상하이 상하이 트위스틀🎵추면서🎵',10,1,'2021-03-26 04:25:39.315781','상하이에서만 만날 수 있던 타이거 에디션을 데려왔지',9),(52,'이번 달 제 책상 위 주인공으로 모셨습니다 💕',9,5,'2021-03-26 04:25:39.318102','탐나는 LED 허브 + 케이블 🤭',10),(53,'러블리 어피치는 언제나 정답입니다.',14,3,'2021-03-26 04:25:39.319766','삐-삑!🚨 오늘도 사랑스러움 한도 초과💕',11),(54,'한 쪽 눈 그렇게 감아버리면 설레서 어떡행',10,1,'2021-03-26 04:25:39.321691','(빰)완전체로 돌아왔다(빰) 윙크 날려~뽀짝함 날려 힛',12),(55,'세상은 넓고 이어폰 케이스는 많으니까  혹시 고민된다면, 우리와 함께',9,3,'2021-03-26 04:25:39.323803','무선 이어폰 쓰는 사람 손 🙋‍♀',13),(56,'이것도 이쁘고, 저것도 맘에 드는데 오또켕',13,4,'2021-03-26 04:25:39.326715','Q. 집콕하면서 늘어난 것은?',14),(57,'나의 픽은 러버덕과 노는 라이언 욕조가습기? @넌?',11,2,'2021-03-26 04:25:39.332079','요즘 피부 상한거 같아서ㅠㅠ 가습기 분양했어(헷)',1),(58,'누가 나 씻는거 싫어한다 그랬오. 누구야 나와봐바.',11,3,'2021-03-26 04:25:39.334282','욕실에 힐링템 구비 완료!🤟',2),(59,'이 시국에 버킹엄궁 다녀온 프렌즈 사연 쫑긋👂',8,4,'2021-03-26 04:25:39.336053','이렇게 된 이상 올해는 랜선 여행으로 간다!',3);
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_28ebf5f0_fk_products_id` (`product_id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/1.jpeg',4),(2,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/2.jpeg',4),(3,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/3.jpeg',4),(4,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/4.jpeg',17),(5,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/5.jpeg',17),(6,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/6.jpeg',17),(7,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/7.jpeg',27),(8,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/8.jpeg',27),(9,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/9.jpeg',27),(10,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/10.jpeg',45),(11,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/11.jpeg',45),(12,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/12.jpeg',45),(13,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/13.jpeg',53),(14,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/14.jpeg',53),(15,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/15.jpeg',53),(16,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/16.jpeg',34),(17,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/17.jpeg',34),(18,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/18.jpeg',34),(19,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/19.jpeg',14),(20,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/20.jpeg',14),(21,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/22.jpeg',14),(22,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/23.jpeg',46),(23,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/24.jpeg',46),(24,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/25.jpeg',46),(25,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/26.jpeg',54),(26,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/27.jpeg',54),(27,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/28.jpeg',54),(28,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/29.jpeg',38),(29,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/30.jpeg',38),(30,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/31.jpeg',38),(31,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/32.jpeg',3),(32,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/33.jpeg',3),(33,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/34.jpeg',3),(34,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/35.jpeg',7),(35,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/36.jpeg',7),(36,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/37.jpeg',7),(37,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/38.jpeg',26),(38,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/39.jpeg',26),(39,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/40.jpeg',26),(40,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/41.jpeg',55),(41,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/42.jpeg',55),(42,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/43.jpeg',55),(43,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/44.jpeg',39),(44,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/45.jpeg',39),(45,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/46.jpeg',39),(46,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/47.jpeg',2),(47,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/48.jpeg',2),(48,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/49.jpeg',2),(49,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/50.jpeg',18),(50,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/51.jpeg',18),(51,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/52.jpeg',18),(52,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/53.jpeg',30),(53,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/54.jpeg',30),(54,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/55.jpeg',30),(55,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/56.jpeg',56),(56,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/57.jpeg',56),(57,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/58.jpeg',56),(58,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/59.jpeg',52),(59,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/60.jpeg',52),(60,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/61.jpeg',52),(61,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/62.jpeg',42),(62,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/63.jpeg',42),(63,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/64.jpeg',42),(64,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/65.jpeg',37),(65,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/66.jpeg',37),(66,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/67.jpeg',37),(67,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/68.jpeg',24),(68,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/69.jpeg',24),(69,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/70.jpeg',24),(70,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/71.jpeg',10),(71,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/72.jpeg',10),(72,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/73.jpeg',10),(73,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/74.jpeg',51),(74,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/75.jpeg',51),(75,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/76.jpeg',51),(76,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/77.jpeg',35),(77,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/78.jpeg',35),(78,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/79.jpeg',35),(79,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/80.jpeg',23),(80,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/81.jpeg',23),(81,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/82.jpeg',23),(82,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/83.jpeg',13),(83,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/84.jpeg',13),(84,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/85.jpeg',13),(85,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/86.jpeg',62),(86,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/87.jpeg',62),(87,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/88.jpeg',62),(88,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/89.jpeg',49),(89,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/90.jpeg',49),(90,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/91.jpeg',49),(91,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/92.jpeg',32),(92,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/93.jpeg',32),(93,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/94.jpeg',32),(94,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/95.jpeg',12),(95,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/96.jpeg',12),(96,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/97.jpeg',12),(97,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/98.jpeg',48),(98,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/99.jpeg',48),(99,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/100.jpeg',48),(100,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/101.jpeg',31),(101,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/102.jpeg',31),(102,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/103.jpeg',31),(103,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/104.jpeg',22),(104,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/105.jpeg',22),(105,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/106.jpeg',22),(106,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/107.jpeg',9),(107,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/108.jpeg',9),(108,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/109.jpeg',9),(109,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/110.jpeg',61),(110,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/111.jpeg',61),(111,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/112.jpeg',61),(112,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/113.jpeg',29),(113,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/114.jpeg',29),(114,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/115.jpeg',29),(115,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/116.jpeg',1),(116,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/117.jpeg',1),(117,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/118.jpeg',1),(118,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/119.jpeg',43),(119,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/120.jpeg',43),(120,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/121.jpeg',43),(121,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/122.jpeg',36),(122,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/123.jpeg',36),(123,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/124.jpeg',36),(124,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/125.jpeg',25),(125,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/126.jpeg',25),(126,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/127.jpeg',25),(127,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/128.jpeg',19),(128,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/129.jpeg',19),(129,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/130.jpeg',19),(130,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/131.jpeg',8),(131,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/132.jpeg',8),(132,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/133.jpeg',8),(133,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/134.jpeg',47),(134,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/135.jpeg',47),(135,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/136.jpeg',47),(136,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/137.jpeg',41),(137,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/138.jpeg',41),(138,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/139.jpeg',41),(139,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/140.jpeg',11),(140,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/141.jpeg',11),(141,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/142.jpeg',11),(142,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/143.jpeg',59),(143,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/144.jpeg',59),(144,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/145.jpeg',59),(145,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/146.jpeg',33),(146,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/147.jpeg',33),(147,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/148.jpeg',33),(148,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/149.jpeg',20),(149,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/150.jpeg',20),(150,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/151.jpeg',20),(151,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/152.jpeg',16),(152,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/153.jpeg',16),(153,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/154.jpeg',16),(154,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/155.jpeg',6),(155,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/166.jpeg',6),(156,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/167.jpeg',6),(157,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/168.jpeg',60),(158,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/170.jpeg',60),(159,'https://kakaovillains.s3.ap-northeast-2.amazonaws.com/product_image/171.jpeg',60);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `average_rating` decimal(2,1) NOT NULL,
  `review_count` int NOT NULL,
  `discount_rate` decimal(3,1) NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `created_at` datetime(6) NOT NULL,
  `sub_category_id` int DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int DEFAULT NULL,
  `sell_count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_sub_category_id_f08b7711_fk_sub_categories_id` (`sub_category_id`),
  KEY `products_category_id_a7a3a156_fk_categories_id` (`category_id`),
  CONSTRAINT `products_category_id_a7a3a156_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_sub_category_id_f08b7711_fk_sub_categories_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'피치피치 텀블러',20000.00,3.7,3,0.0,'html','2021-03-26 04:26:27.020719',14,'2021-03-26 04:26:27.020656',3,0),(2,'죠르디 큰컵',10000.00,3.0,3,0.0,'html','2021-03-26 04:26:27.026792',14,'2021-03-26 04:26:27.026744',3,0),(3,'아몬드 작은컵',5000.00,3.7,6,0.0,'html','2021-03-26 04:26:27.029539',14,'2021-03-26 04:26:27.029480',3,0),(4,'아몬드 뜨거운 텀블러',15000.00,5.0,1,0.0,'html','2021-03-26 04:26:27.031749',14,'2021-03-26 04:26:27.031707',3,0),(5,'칸 차가운 텀블러',15000.00,4.2,6,0.0,'html','2021-03-26 04:26:27.034337',14,'2021-03-26 04:26:27.034198',3,0),(6,'토끼 티셔츠',35000.00,3.3,3,0.0,'html','2021-03-26 04:26:27.036827',31,'2021-03-26 04:26:27.036777',6,0),(7,'준식 바지',60000.00,3.0,6,0.0,'html','2021-03-26 04:26:27.039011',32,'2021-03-26 04:26:27.038962',6,0),(8,'프라다 구두',150000.00,3.8,5,0.0,'html','2021-03-26 04:26:27.041450',19,'2021-03-26 04:26:27.041402',4,0),(9,'고냥이 양말',3000.00,4.0,5,0.0,'html','2021-03-26 04:26:27.043515',31,'2021-03-26 04:26:27.043473',6,0),(10,'두부 점퍼',150000.00,3.7,3,0.0,'html','2021-03-26 04:26:27.045564',32,'2021-03-26 04:26:27.045520',6,0),(11,'팬다어덜트 충전기',48000.00,4.0,1,0.0,'html','2021-03-26 04:26:27.047493',45,'2021-03-26 04:26:27.047433',10,0),(12,'꾀돌이 노트북',1250000.00,4.7,7,0.0,'html','2021-03-26 04:26:27.049634',40,'2021-03-26 04:26:27.049586',9,0),(13,'단무지 모니터',350000.00,4.4,5,0.0,'html','2021-03-26 04:26:27.051869',40,'2021-03-26 04:26:27.051824',9,0),(14,'자이제 자',10000.00,3.8,5,0.0,'html','2021-03-26 04:26:27.054148',25,'2021-03-26 04:26:27.054099',5,0),(15,'칸 볼펜',18000.00,4.2,6,0.0,'html','2021-03-26 04:26:27.056412',25,'2021-03-26 04:26:27.056363',5,0),(16,'토끼 샤프',1000.00,5.0,1,0.0,'html','2021-03-26 04:26:27.058839',25,'2021-03-26 04:26:27.058789',5,0),(17,'아몬드 서랍',80000.00,4.4,5,0.0,'html','2021-03-26 04:26:27.061161',29,'2021-03-26 04:26:27.061111',5,0),(18,'죠르디 책상',320000.00,3.7,6,0.0,'html','2021-03-26 04:26:27.063118',29,'2021-03-26 04:26:27.063072',5,0),(19,'프라다 휴지통',3000.00,4.3,3,0.0,'html','2021-03-26 04:26:27.064958',17,'2021-03-26 04:26:27.064903',3,0),(20,'토끼 큰인형',200000.00,3.9,8,0.0,'html','2021-03-26 04:26:27.067045',10,'2021-03-26 04:26:27.066999',2,0),(21,'타이거 작은인형',60000.00,4.0,3,0.0,'html','2021-03-26 04:26:27.069305',8,'2021-03-26 04:26:27.069254',2,0),(22,'고냥이 쿠션',45000.00,3.7,3,0.0,'html','2021-03-26 04:26:27.071432',8,'2021-03-26 04:26:27.071381',2,0),(23,'단무지 열쇠고리',12000.00,4.2,5,0.0,'html','2021-03-26 04:26:27.073240',11,'2021-03-26 04:26:27.073194',2,0),(24,'두부 열쇠고리',13000.00,4.5,4,0.0,'html','2021-03-26 04:26:27.075477',11,'2021-03-26 04:26:27.075425',2,0),(25,'프라다 키체인',150000.00,4.1,8,0.0,'html','2021-03-26 04:26:27.077304',11,'2021-03-26 04:26:27.077255',2,0),(26,'준식 피규어',450000.00,4.3,3,0.0,'html','2021-03-26 04:26:27.079385',12,'2021-03-26 04:26:27.079332',2,0),(27,'아몬드 피규어',320000.00,4.2,5,0.0,'html','2021-03-26 04:26:27.081354',12,'2021-03-26 04:26:27.081314',2,0),(28,'칸 브릭',620000.00,3.7,3,0.0,'html','2021-03-26 04:26:27.082864',12,'2021-03-26 04:26:27.082824',2,0),(29,'피치피치 방석',7800.00,4.4,5,0.0,'html','2021-03-26 04:26:27.084610',13,'2021-03-26 04:26:27.084568',3,0),(30,'죠르디 쿠션',18000.00,4.0,3,0.0,'html','2021-03-26 04:26:27.086231',13,'2021-03-26 04:26:27.086186',3,0),(31,'고냥이 걸레',3000.00,5.0,2,0.0,'html','2021-03-26 04:26:27.087774',15,'2021-03-26 04:26:27.087733',3,0),(32,'꾀돌이 수세미',2500.00,5.0,3,0.0,'html','2021-03-26 04:26:27.089277',15,'2021-03-26 04:26:27.089238',3,0),(33,'토끼 세제',4500.00,4.5,6,0.0,'html','2021-03-26 04:26:27.090841',15,'2021-03-26 04:26:27.090804',3,0),(34,'아몬드 식기세척기',780000.00,5.0,3,0.0,'html','2021-03-26 04:26:27.092368',15,'2021-03-26 04:26:27.092328',3,0),(35,'단무지 냉장고',1850000.00,4.0,4,0.0,'html','2021-03-26 04:26:27.093828',15,'2021-03-26 04:26:27.093788',3,0),(36,'프라다 커피머신',12000000.00,4.0,6,0.0,'html','2021-03-26 04:26:27.095140',15,'2021-03-26 04:26:27.095103',3,0),(37,'두부 정수기',800000.00,4.0,3,0.0,'html','2021-03-26 04:26:27.096501',15,'2021-03-26 04:26:27.096464',3,0),(38,'자이제 가글',4000.00,3.8,5,0.0,'html','2021-03-26 04:26:27.097969',16,'2021-03-26 04:26:27.097931',3,0),(39,'준식 비누',7000.00,3.7,6,0.0,'html','2021-03-26 04:26:27.099251',16,'2021-03-26 04:26:27.099212',3,0),(40,'타이거 치약',3000.00,3.4,5,0.0,'html','2021-03-26 04:26:27.100627',16,'2021-03-26 04:26:27.100589',3,0),(41,'팬다어덜트 치약',5000.00,3.3,4,0.0,'html','2021-03-26 04:26:27.102120',16,'2021-03-26 04:26:27.102084',3,0),(42,'두부 지갑',80000.00,3.3,4,0.0,'html','2021-03-26 04:26:27.103442',20,'2021-03-26 04:26:27.103409',4,0),(43,'프라다 가방',4500000.00,4.6,5,0.0,'html','2021-03-26 04:26:27.104604',20,'2021-03-26 04:26:27.104571',4,0),(44,'타이거 사원증 케이스',7000.00,4.7,3,0.0,'html','2021-03-26 04:26:27.105945',21,'2021-03-26 04:26:27.105909',4,0),(45,'아몬드 시계',450000.00,4.0,2,0.0,'html','2021-03-26 04:26:27.107329',21,'2021-03-26 04:26:27.107295',4,0),(46,'자이제 마스크',2000.00,4.0,3,0.0,'html','2021-03-26 04:26:27.108506',23,'2021-03-26 04:26:27.108473',4,0),(47,'팬다어덜트 미니선풍기',12000.00,3.2,5,0.0,'html','2021-03-26 04:26:27.109676',23,'2021-03-26 04:26:27.109643',4,0),(48,'고냥이 장갑',200.00,4.5,4,0.0,'html','2021-03-26 04:26:27.111267',23,'2021-03-26 04:26:27.111230',4,0),(49,'꾀돌이 미니우산',4000.00,4.1,8,0.0,'html','2021-03-26 04:26:27.112509',22,'2021-03-26 04:26:27.112475',4,0),(50,'타이거 필통',7000.00,4.7,3,0.0,'html','2021-03-26 04:26:27.113702',24,'2021-03-26 04:26:27.113669',5,0),(51,'단무지 노트',3000.00,4.6,7,0.0,'html','2021-03-26 04:26:27.115324',26,'2021-03-26 04:26:27.115284',5,0),(52,'두부 종이',30.00,4.3,6,0.0,'html','2021-03-26 04:26:27.116790',26,'2021-03-26 04:26:27.116752',5,0),(53,'아몬드 투명화일',50.00,3.7,3,0.0,'html','2021-03-26 04:26:27.118015',27,'2021-03-26 04:26:27.117981',5,0),(54,'자이제 스티커',1200.00,3.5,4,0.0,'html','2021-03-26 04:26:27.119242',28,'2021-03-26 04:26:27.119207',5,0),(55,'준식 스티커',12000.00,3.4,5,0.0,'html','2021-03-26 04:26:27.120472',28,'2021-03-26 04:26:27.120438',5,0),(56,'죠르디 마우스패드',35000.00,4.0,5,0.0,'html','2021-03-26 04:26:27.121945',29,'2021-03-26 04:26:27.121909',5,0),(57,'칸 휴지통',7000.00,4.5,2,0.0,'html','2021-03-26 04:26:27.123487',29,'2021-03-26 04:26:27.123450',5,0),(58,'타이거 커터칼',5000.00,3.7,3,0.0,'html','2021-03-26 04:26:27.124853',29,'2021-03-26 04:26:27.124817',5,0),(59,'토끼 신년봉투',1500.00,3.0,2,0.0,'html','2021-03-26 04:26:27.126069',30,'2021-03-26 04:26:27.126036',5,0),(60,'죠르디 탈취제',10000.00,3.7,6,0.0,'html','2021-03-26 04:26:27.127290',18,'2021-03-26 04:26:27.127258',3,0),(61,'피치피치 운동화',150000.00,3.8,5,0.0,'html','2021-03-26 04:26:27.128419',19,'2021-03-26 04:26:27.128388',4,0),(62,'꾀돌이 슬리퍼',3000.00,4.0,2,0.0,'html','2021-03-26 04:26:27.129697',19,'2021-03-26 04:26:27.129665',4,0),(63,'팬다어덜트 파우치',80000.00,4.0,6,0.0,'html','2021-03-26 04:26:27.130876',20,'2021-03-26 04:26:27.130844',4,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_products`
--

DROP TABLE IF EXISTS `purchased_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchased_products_product_id_03998cfa_fk_products_id` (`product_id`),
  KEY `purchased_products_transaction_id_c0327239_fk_transactions_id` (`transaction_id`),
  CONSTRAINT `purchased_products_product_id_03998cfa_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `purchased_products_transaction_id_c0327239_fk_transactions_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_products`
--

LOCK TABLES `purchased_products` WRITE;
/*!40000 ALTER TABLE `purchased_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchased_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_products`
--

DROP TABLE IF EXISTS `recommended_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_recommendedproduct_feed_id_b8faab0a_fk_feeds_id` (`feed_id`),
  KEY `feed_recommendedproduct_product_id_6a9073bb_fk_products_id` (`product_id`),
  CONSTRAINT `feed_recommendedproduct_feed_id_b8faab0a_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `feed_recommendedproduct_product_id_6a9073bb_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_products`
--

LOCK TABLES `recommended_products` WRITE;
/*!40000 ALTER TABLE `recommended_products` DISABLE KEYS */;
INSERT INTO `recommended_products` VALUES (1,1,13),(2,2,26),(3,3,63),(4,4,23),(5,5,44),(6,6,21),(7,7,52),(8,8,43),(9,9,50),(10,10,46),(11,11,4),(12,12,4),(13,13,28),(14,14,10),(15,15,35),(16,16,45),(17,17,7),(18,18,3),(19,19,29),(20,20,12),(21,21,61),(22,22,18),(23,23,50),(24,24,27),(25,25,4),(26,26,62),(27,27,8),(28,28,31),(29,29,21),(30,30,36),(31,31,2),(32,32,24),(33,33,54),(34,34,38),(35,35,41),(36,36,25),(37,37,61),(38,38,43),(39,39,10),(40,40,30),(41,41,59),(42,42,8),(43,43,13),(44,44,8),(45,45,19),(46,46,3),(47,47,8),(48,48,44),(49,49,57),(50,50,31),(51,51,47),(52,52,62),(53,53,30),(54,54,1),(55,55,53),(56,56,17),(57,57,5),(58,58,23),(59,59,57),(60,59,7),(61,1,11),(62,2,14),(63,3,17),(64,4,24),(65,5,17),(66,6,40),(67,7,58),(68,8,58),(69,9,53),(70,10,25),(71,11,63),(72,12,1),(73,13,26),(74,14,20),(75,15,22),(76,16,18),(77,17,50),(78,18,44),(79,19,24),(80,20,7),(81,21,26),(82,22,7),(83,23,50),(84,24,57),(85,25,6),(86,26,23),(87,27,47),(88,28,23),(89,29,58),(90,30,13),(91,31,1),(92,32,50),(93,33,12),(94,34,63),(95,35,42),(96,36,23),(97,37,63),(98,38,20),(99,39,39),(100,40,24),(101,41,7),(102,42,3),(103,43,13),(104,44,41),(105,45,51),(106,46,28),(107,47,44),(108,48,16),(109,49,9),(110,50,34),(111,51,1),(112,52,32),(113,53,56),(114,54,36),(115,55,27),(116,56,10),(117,57,34),(118,58,24),(119,59,14),(120,57,1),(121,1,19),(122,2,3),(123,3,19),(124,4,35),(125,5,30),(126,6,62),(127,7,34),(128,8,60),(129,9,58),(130,10,13),(131,11,32),(132,12,60),(133,13,25),(134,14,38),(135,15,44),(136,16,58),(137,17,34),(138,18,55),(139,19,33),(140,20,27),(141,21,41),(142,22,38),(143,23,43),(144,24,57),(145,25,27),(146,26,1),(147,27,44),(148,28,27),(149,29,31),(150,30,10),(151,31,18),(152,32,15),(153,33,32),(154,34,50),(155,35,19),(156,36,5),(157,37,49),(158,38,14),(159,39,28),(160,40,2),(161,41,41),(162,42,4),(163,43,35),(164,44,26),(165,45,21),(166,46,31),(167,47,50),(168,48,2),(169,49,13),(170,50,30),(171,51,58),(172,52,62),(173,53,44),(174,54,38),(175,55,40),(176,56,27),(177,57,26),(178,58,57),(179,59,63),(180,42,2),(181,1,29),(182,2,16),(183,3,33),(184,4,24),(185,5,23),(186,6,26),(187,7,48),(188,8,28),(189,9,36),(190,10,11),(191,11,11),(192,12,21),(193,13,58),(194,14,9),(195,15,8),(196,16,43),(197,17,38),(198,18,45),(199,19,34),(200,20,42),(201,21,46),(202,22,55),(203,23,34),(204,24,38),(205,25,58),(206,26,36),(207,27,34),(208,28,26),(209,29,38),(210,30,26),(211,31,11),(212,32,26),(213,33,7),(214,34,34),(215,35,17),(216,36,26),(217,37,50),(218,38,2),(219,39,49),(220,40,11),(221,41,6),(222,42,60),(223,43,29),(224,44,63),(225,45,8),(226,46,22),(227,47,21),(228,48,30),(229,49,40),(230,50,30),(231,51,48),(232,52,38),(233,53,27),(234,54,34),(235,55,62),(236,56,33),(237,57,4),(238,58,10),(239,59,35),(240,3,49),(241,1,41),(242,2,56),(243,3,59),(244,4,4),(245,5,39),(246,6,28),(247,7,4),(248,8,12),(249,9,61),(250,10,1),(251,11,12),(252,12,9),(253,13,44),(254,14,21),(255,15,48),(256,16,61),(257,17,56),(258,18,62),(259,19,37),(260,20,60),(261,21,50),(262,22,12),(263,23,1),(264,24,54),(265,25,47),(266,26,61),(267,27,16),(268,28,63),(269,29,48),(270,30,41),(271,31,15),(272,32,58),(273,33,3),(274,34,29),(275,35,55),(276,36,28),(277,37,25),(278,38,55),(279,39,13),(280,40,13),(281,41,10),(282,42,40),(283,43,52),(284,44,13),(285,45,26),(286,46,48),(287,47,30),(288,48,53),(289,49,62),(290,50,35),(291,51,62),(292,52,6),(293,53,62),(294,54,26),(295,55,10),(296,56,38),(297,57,11),(298,58,17),(299,59,39),(300,39,30),(301,1,36),(302,2,54),(303,3,11),(304,4,8),(305,5,10),(306,6,36),(307,7,22),(308,8,10),(309,9,22),(310,10,49),(311,11,43),(312,12,32),(313,13,4),(314,14,60),(315,15,2),(316,16,9),(317,17,48),(318,18,18),(319,19,51),(320,20,1),(321,21,23),(322,22,62),(323,23,23),(324,24,41),(325,25,35),(326,26,41),(327,27,56),(328,28,44),(329,29,42),(330,30,9),(331,31,15),(332,32,29),(333,33,51),(334,34,52),(335,35,47),(336,36,29),(337,37,18),(338,38,56),(339,39,24),(340,40,14),(341,41,16),(342,42,41),(343,43,47),(344,44,29),(345,45,39),(346,46,52),(347,47,34),(348,48,49),(349,49,62),(350,50,36),(351,51,40),(352,52,16),(353,53,34),(354,54,59),(355,55,4),(356,56,30),(357,57,32),(358,58,49),(359,59,48),(360,26,40),(361,1,10),(362,2,37),(363,3,31),(364,4,36),(365,5,58),(366,6,61),(367,7,49),(368,8,50),(369,9,6),(370,10,25),(371,11,3),(372,12,10),(373,13,14),(374,14,23),(375,15,9),(376,16,57),(377,17,41),(378,18,52),(379,19,59),(380,20,38),(381,21,46),(382,22,29),(383,23,28),(384,24,6),(385,25,23),(386,26,45),(387,27,30),(388,28,27),(389,29,13),(390,30,25),(391,31,36),(392,32,54),(393,33,35),(394,34,39),(395,35,40),(396,36,25),(397,37,33),(398,38,51),(399,39,15),(400,40,25),(401,41,50),(402,42,41),(403,43,35),(404,44,15),(405,45,9),(406,46,10),(407,47,57),(408,48,32),(409,49,30),(410,50,38),(411,51,18),(412,52,60),(413,53,19),(414,54,16),(415,55,54),(416,56,23),(417,57,30),(418,58,13),(419,59,45),(420,21,48);
/*!40000 ALTER TABLE `recommended_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `like_count` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `feed_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_feed_id_9841cc2e_fk_feeds_id` (`feed_id`),
  KEY `replies_parent_id_68a8feeb_fk_replies_id` (`parent_id`),
  KEY `replies_user_id_69326151_fk_users_id` (`user_id`),
  CONSTRAINT `replies_feed_id_9841cc2e_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `replies_parent_id_68a8feeb_fk_replies_id` FOREIGN KEY (`parent_id`) REFERENCES `replies` (`id`),
  CONSTRAINT `replies_user_id_69326151_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (1,'공부 열심히 하자',1,'2021-03-26 04:27:36.612056',25,NULL,18),(2,'구독',2,'2021-03-26 04:27:36.616518',33,NULL,16),(3,'더 보고싶은데 ㅜㅜ',0,'2021-03-26 04:27:36.619047',16,NULL,16),(4,'벌써 끝이라니',0,'2021-03-26 04:27:36.620523',29,NULL,16),(5,'아니에요',3,'2021-03-26 04:27:36.621802',57,NULL,20),(6,'아앙',5,'2021-03-26 04:27:36.623615',51,NULL,18),(7,'알람설정',0,'2021-03-26 04:27:36.626291',3,NULL,16),(8,'앞으로 더욱 친하게 지내요',3,'2021-03-26 04:27:36.633024',31,NULL,20),(9,'잉?',5,'2021-03-26 04:27:36.634895',57,NULL,20),(10,'좋아요',2,'2021-03-26 04:27:36.637349',2,NULL,16),(11,'굳굳굳',0,'2021-03-26 04:27:36.640262',50,NULL,20),(12,'귀여워',1,'2021-03-26 04:27:36.642080',18,NULL,18),(13,'귀엽다',3,'2021-03-26 04:27:36.645142',12,NULL,16),(14,'냠냠',1,'2021-03-26 04:27:36.646923',29,NULL,20),(15,'네',2,'2021-03-26 04:27:36.649866',9,NULL,15),(16,'모샃ㅁ겠다',2,'2021-03-26 04:27:36.653341',15,NULL,18),(17,'브런치먹을사람?',2,'2021-03-26 04:27:36.654765',1,NULL,20),(18,'어피치',1,'2021-03-26 04:27:36.656446',23,NULL,18),(19,'우리와 같이살자',2,'2021-03-26 04:27:36.658095',49,NULL,15),(20,'좋네요',3,'2021-03-26 04:27:36.659635',27,NULL,18),(21,'같고싶다',4,'2021-03-26 04:27:36.661360',56,NULL,15),(22,'대박귀여워',4,'2021-03-26 04:27:36.662711',38,NULL,19),(23,'맛있겠다',2,'2021-03-26 04:27:36.664421',1,NULL,20),(24,'사고싶당',5,'2021-03-26 04:27:36.665956',34,NULL,18),(25,'사진찍어',3,'2021-03-26 04:27:36.667421',50,NULL,16),(26,'엄청 귀여워요',4,'2021-03-26 04:27:36.669330',54,NULL,16),(27,'오귀엽',4,'2021-03-26 04:27:36.671399',45,NULL,20),(28,'이거예뻐워',3,'2021-03-26 04:27:36.673338',47,NULL,19),(29,'이벤트해주세요',4,'2021-03-26 04:27:36.675198',58,NULL,16),(30,'핵귀',3,'2021-03-26 04:27:36.676564',45,NULL,20),(31,'공부 열심히 하자',0,'2021-03-26 04:27:36.677867',31,NULL,19),(32,'구독',0,'2021-03-26 04:27:36.679111',16,NULL,17),(33,'냠냠',2,'2021-03-26 04:27:36.680361',25,NULL,15),(34,'더 보고싶은데 ㅜㅜ',0,'2021-03-26 04:27:36.681487',9,NULL,17),(35,'벌써 끝이라니',2,'2021-03-26 04:27:36.683019',53,NULL,17),(36,'아앙',2,'2021-03-26 04:27:36.684342',11,NULL,19),(37,'알람설정',1,'2021-03-26 04:27:36.685753',11,NULL,17),(38,'오신기하다',9,'2021-03-26 04:27:36.686854',27,NULL,18),(39,'잉?',3,'2021-03-26 04:27:36.687938',26,NULL,15),(40,'좋아요',1,'2021-03-26 04:27:36.689039',58,NULL,17),(41,'굳굳굳',1,'2021-03-26 04:27:36.690062',40,NULL,15),(42,'귀여워',2,'2021-03-26 04:27:36.691078',28,NULL,19),(43,'귀엽다',1,'2021-03-26 04:27:36.692084',44,NULL,17),(44,'냠냠',5,'2021-03-26 04:27:36.693461',15,NULL,16),(45,'네',1,'2021-03-26 04:27:36.695526',30,NULL,16),(46,'맛있겠다',1,'2021-03-26 04:27:36.697858',46,NULL,15),(47,'모샃ㅁ겠다',3,'2021-03-26 04:27:36.699898',22,NULL,19),(48,'브런치먹을사람?',4,'2021-03-26 04:27:36.702008',8,NULL,15),(49,'아니에요',4,'2021-03-26 04:27:36.703734',40,NULL,15),(50,'앞으로 더욱 친하게 지내요',1,'2021-03-26 04:27:36.705841',48,NULL,15),(51,'어피치',0,'2021-03-26 04:27:36.707708',52,NULL,19),(52,'엄청 귀여워요',1,'2021-03-26 04:27:36.709749',39,NULL,17),(53,'우리와 같이살자',1,'2021-03-26 04:27:36.711896',9,NULL,16),(54,'좋네요',1,'2021-03-26 04:27:36.713619',20,NULL,19),(55,'같고싶다',3,'2021-03-26 04:27:36.715012',9,NULL,16),(56,'냠냠',2,'2021-03-26 04:27:36.716847',23,NULL,17),(57,'대박귀여워',1,'2021-03-26 04:27:36.718846',53,NULL,20),(58,'사고싶당',3,'2021-03-26 04:27:36.720490',1,NULL,19),(59,'사진찍어',1,'2021-03-26 04:27:36.721848',41,NULL,17),(60,'오귀엽',1,'2021-03-26 04:27:36.723071',27,NULL,15),(61,'오신기하다',2,'2021-03-26 04:27:36.724148',21,NULL,19),(62,'이거예뻐워',2,'2021-03-26 04:27:36.725426',39,NULL,20),(63,'이벤트해주세요',2,'2021-03-26 04:27:36.727236',51,NULL,17),(64,'좋아요',1,'2021-03-26 04:27:36.729382',8,NULL,18),(65,'핵귀',1,'2021-03-26 04:27:36.730851',53,NULL,15),(66,'공부 열심히 하자',1,'2021-03-26 04:27:36.732981',26,NULL,20),(67,'구독',1,'2021-03-26 04:27:36.735106',22,NULL,18),(68,'네',1,'2021-03-26 04:27:36.736846',11,NULL,17),(69,'더 보고싶은데 ㅜㅜ',4,'2021-03-26 04:27:36.738549',5,NULL,18),(70,'벌써 끝이라니',3,'2021-03-26 04:27:36.740813',38,NULL,18),(71,'아니에요',0,'2021-03-26 04:27:36.742844',26,NULL,16),(72,'아앙',2,'2021-03-26 04:27:36.744587',28,NULL,20),(73,'알람설정',2,'2021-03-26 04:27:36.746454',37,NULL,18),(74,'앞으로 더욱 친하게 지내요',1,'2021-03-26 04:27:36.748369',32,NULL,16),(75,'잉?',1,'2021-03-26 04:27:36.750238',47,NULL,16),(76,'굳굳굳',1,'2021-03-26 04:27:36.752553',10,NULL,16),(77,'귀여워',1,'2021-03-26 04:27:36.754876',28,NULL,20),(78,'귀엽다',1,'2021-03-26 04:27:36.756928',19,NULL,18),(79,'냠냠',1,'2021-03-26 04:27:36.758723',46,NULL,18),(80,'맛있겠다',0,'2021-03-26 04:27:36.760098',42,NULL,16),(81,'모샃ㅁ겠다',4,'2021-03-26 04:27:36.761350',43,NULL,20),(82,'브런치먹을사람?',3,'2021-03-26 04:27:36.762578',10,NULL,16),(83,'어피치',2,'2021-03-26 04:27:36.763794',26,NULL,20),(84,'엄청 귀여워요',0,'2021-03-26 04:27:36.765069',16,NULL,18),(85,'우리와 같이살자',3,'2021-03-26 04:27:36.766727',23,NULL,17),(86,'좋네요',0,'2021-03-26 04:27:36.768208',40,NULL,20),(87,'핵귀',2,'2021-03-26 04:27:36.770178',50,NULL,16),(88,'같고싶다',1,'2021-03-26 04:27:36.772319',57,NULL,17),(89,'냠냠',3,'2021-03-26 04:27:36.774393',22,NULL,19),(90,'대박귀여워',7,'2021-03-26 04:27:36.775927',29,NULL,15),(91,'사고싶당',2,'2021-03-26 04:27:36.777955',57,NULL,20),(92,'사진찍어',0,'2021-03-26 04:27:36.779726',35,NULL,18),(93,'알람설정',0,'2021-03-26 04:27:36.781671',18,NULL,19),(94,'오귀엽',1,'2021-03-26 04:27:36.783493',7,NULL,16),(95,'오신기하다',1,'2021-03-26 04:27:36.785716',24,NULL,20),(96,'이거예뻐워',2,'2021-03-26 04:27:36.787839',4,NULL,15),(97,'이벤트해주세요',9,'2021-03-26 04:27:36.789552',46,NULL,18),(98,'좋아요',1,'2021-03-26 04:27:36.790792',44,NULL,19),(99,'공부 열심히 하자',2,'2021-03-26 04:27:36.792148',26,NULL,15),(100,'구독',1,'2021-03-26 04:27:36.793631',2,NULL,19),(101,'냠냠',1,'2021-03-26 04:27:36.795141',25,NULL,20),(102,'네',1,'2021-03-26 04:27:36.796705',18,NULL,18),(103,'더 보고싶은데 ㅜㅜ',3,'2021-03-26 04:27:36.798166',26,NULL,19),(104,'벌써 끝이라니',0,'2021-03-26 04:27:36.799666',5,NULL,19),(105,'아니에요',1,'2021-03-26 04:27:36.801027',6,NULL,17),(106,'아앙',1,'2021-03-26 04:27:36.802307',20,NULL,15),(107,'앞으로 더욱 친하게 지내요',3,'2021-03-26 04:27:36.803563',10,NULL,17),(108,'우리와 같이살자',0,'2021-03-26 04:27:36.804740',40,NULL,18),(109,'잉?',4,'2021-03-26 04:27:36.805983',45,NULL,17),(110,'굳굳굳',2,'2021-03-26 04:27:36.807209',47,NULL,17),(111,'귀여워',1,'2021-03-26 04:27:36.808391',34,NULL,15),(112,'귀엽다',1,'2021-03-26 04:27:36.809531',57,NULL,19),(113,'맛있겠다',3,'2021-03-26 04:27:36.810624',22,NULL,17),(114,'모샃ㅁ겠다',2,'2021-03-26 04:27:36.811690',45,NULL,15),(115,'브런치먹을사람?',1,'2021-03-26 04:27:36.812834',3,NULL,17),(116,'사고싶당',1,'2021-03-26 04:27:36.814081',23,NULL,15),(117,'사진찍어',4,'2021-03-26 04:27:36.815594',2,NULL,19),(118,'어피치',2,'2021-03-26 04:27:36.816697',21,NULL,15),(119,'엄청 귀여워요',0,'2021-03-26 04:27:36.817803',16,NULL,19),(120,'오귀엽',6,'2021-03-26 04:27:36.818902',19,NULL,17),(121,'이벤트해주세요',1,'2021-03-26 04:27:36.819977',20,NULL,19),(122,'좋네요',2,'2021-03-26 04:27:36.821257',42,NULL,15),(123,'핵귀',2,'2021-03-26 04:27:36.823074',18,NULL,17),(124,'같고싶다',1,'2021-03-26 04:27:36.824664',12,NULL,18),(125,'공부 열심히 하자',1,'2021-03-26 04:27:36.826482',8,NULL,16),(126,'구독',3,'2021-03-26 04:27:36.827722',2,NULL,20),(127,'냠냠',2,'2021-03-26 04:27:36.829159',2,NULL,15),(128,'대박귀여워',2,'2021-03-26 04:27:36.830438',28,NULL,16),(129,'더 보고싶은데 ㅜㅜ',4,'2021-03-26 04:27:36.831933',7,NULL,20),(130,'벌써 끝이라니',1,'2021-03-26 04:27:36.833122',17,NULL,20),(131,'아앙',1,'2021-03-26 04:27:36.834280',30,NULL,16),(132,'알람설정',1,'2021-03-26 04:27:36.835482',53,NULL,20),(133,'앞으로 더욱 친하게 지내요',0,'2021-03-26 04:27:36.836672',25,NULL,18),(134,'오신기하다',1,'2021-03-26 04:27:36.837834',26,NULL,15),(135,'이거예뻐워',5,'2021-03-26 04:27:36.839021',2,NULL,16),(136,'잉?',3,'2021-03-26 04:27:36.840239',28,NULL,18),(137,'좋아요',0,'2021-03-26 04:27:36.841274',41,NULL,20),(138,'굳굳굳',4,'2021-03-26 04:27:36.842261',18,NULL,18),(139,'귀여워',1,'2021-03-26 04:27:36.843258',50,NULL,16),(140,'귀엽다',6,'2021-03-26 04:27:36.844254',1,NULL,20),(141,'냠냠',0,'2021-03-26 04:27:36.845271',22,NULL,16),(142,'네',2,'2021-03-26 04:27:36.846292',35,NULL,19),(143,'모샃ㅁ겠다',2,'2021-03-26 04:27:36.847322',6,NULL,16),(144,'브런치먹을사람?',5,'2021-03-26 04:27:36.848455',5,NULL,18),(145,'아니에요',4,'2021-03-26 04:27:36.849506',48,NULL,18),(146,'어피치',0,'2021-03-26 04:27:36.850564',36,NULL,16),(147,'엄청 귀여워요',2,'2021-03-26 04:27:36.851544',8,NULL,20),(148,'우리와 같이살자',3,'2021-03-26 04:27:36.852564',9,NULL,19),(149,'좋네요',1,'2021-03-26 04:27:36.853568',44,NULL,16),(150,'같고싶다',2,'2021-03-26 04:27:36.854707',12,NULL,19),(151,'대박귀여워',2,'2021-03-26 04:27:36.856268',25,NULL,17),(152,'맛있겠다',3,'2021-03-26 04:27:36.861076',23,NULL,18),(153,'사고싶당',1,'2021-03-26 04:27:36.862670',39,NULL,16),(154,'사진찍어',3,'2021-03-26 04:27:36.864384',46,NULL,20),(155,'오귀엽',1,'2021-03-26 04:27:36.867175',37,NULL,18),(156,'이거예뻐워',1,'2021-03-26 04:27:36.868850',50,NULL,17),(157,'이벤트해주세요',3,'2021-03-26 04:27:36.870594',32,NULL,20),(158,'핵귀',2,'2021-03-26 04:27:36.872102',59,NULL,18),(159,'공부 열심히 하자',3,'2021-03-26 04:27:36.873960',13,NULL,17),(160,'구독',2,'2021-03-26 04:27:36.876094',33,NULL,15),(161,'냠냠',1,'2021-03-26 04:27:36.878733',16,NULL,17),(162,'더 보고싶은데 ㅜㅜ',2,'2021-03-26 04:27:36.881120',49,NULL,15),(163,'벌써 끝이라니',0,'2021-03-26 04:27:36.883627',23,NULL,15),(164,'아앙',2,'2021-03-26 04:27:36.885983',45,NULL,17),(165,'알람설정',1,'2021-03-26 04:27:36.887515',12,NULL,15),(166,'오신기하다',3,'2021-03-26 04:27:36.889201',1,NULL,16),(167,'잉?',5,'2021-03-26 04:27:36.890770',44,NULL,19),(168,'좋아요',3,'2021-03-26 04:27:36.892250',52,NULL,15),(169,'굳굳굳',5,'2021-03-26 04:27:36.893913',27,NULL,19),(170,'귀여워',0,'2021-03-26 04:27:36.895819',37,NULL,17),(171,'귀엽다',6,'2021-03-26 04:27:36.897611',21,NULL,15),(172,'냠냠',1,'2021-03-26 04:27:36.899172',7,NULL,18),(173,'네',2,'2021-03-26 04:27:36.900830',13,NULL,20),(174,'모샃ㅁ겠다',2,'2021-03-26 04:27:36.902772',7,NULL,17),(175,'브런치먹을사람?',1,'2021-03-26 04:27:36.904364',51,NULL,19),(176,'아니에요',2,'2021-03-26 04:27:36.905799',10,NULL,19),(177,'앞으로 더욱 친하게 지내요',2,'2021-03-26 04:27:36.906994',40,NULL,19),(178,'어피치',4,'2021-03-26 04:27:36.908270',34,NULL,17),(179,'엄청 귀여워요',1,'2021-03-26 04:27:36.909827',56,NULL,15),(180,'우리와 같이살자',2,'2021-03-26 04:27:36.911117',1,NULL,20),(181,'좋네요',5,'2021-03-26 04:27:36.912351',11,NULL,17),(182,'공부 열심히 하자',2,'2021-03-26 04:27:36.913606',43,NULL,18),(183,'구독',1,'2021-03-26 04:27:36.914848',38,NULL,16),(184,'귀엽다',3,'2021-03-26 04:27:36.916038',5,NULL,16),(185,'냠냠',2,'2021-03-26 04:27:36.917203',34,NULL,20),(186,'네',3,'2021-03-26 04:27:36.918342',17,NULL,15),(187,'더 보고싶은데 ㅜㅜ',0,'2021-03-26 04:27:36.919617',26,NULL,16),(188,'벌써 끝이라니',1,'2021-03-26 04:27:36.920706',35,NULL,16),(189,'브런치먹을사람?',2,'2021-03-26 04:27:36.921788',52,NULL,20),(190,'아니에요',2,'2021-03-26 04:27:36.922872',47,NULL,20),(191,'아앙',3,'2021-03-26 04:27:36.923923',26,NULL,18),(192,'앞으로 더욱 친하게 지내요',1,'2021-03-26 04:27:36.925002',35,NULL,20),(193,'우리와 같이살자',2,'2021-03-26 04:27:36.926059',44,NULL,15),(194,'잉?',2,'2021-03-26 04:27:36.927088',12,NULL,20),(195,'같고싶다',5,'2021-03-26 04:27:36.928101',3,NULL,20),(196,'냠냠',2,'2021-03-26 04:27:36.929179',37,NULL,19),(197,'대박귀여워',2,'2021-03-26 04:27:36.930991',52,NULL,18),(198,'맛있겠다',3,'2021-03-26 04:27:36.932910',41,NULL,19),(199,'사고싶당',1,'2021-03-26 04:27:36.934259',9,NULL,17),(200,'사진찍어',0,'2021-03-26 04:27:36.935811',37,NULL,15),(201,'알람설정',2,'2021-03-26 04:27:36.937153',11,NULL,16),(202,'오귀엽',2,'2021-03-26 04:27:36.938472',24,NULL,19),(203,'오신기하다',1,'2021-03-26 04:27:36.939672',39,NULL,17),(204,'이거예뻐워',6,'2021-03-26 04:27:36.941096',19,NULL,18),(205,'이벤트해주세요',1,'2021-03-26 04:27:36.943392',53,NULL,15),(206,'좋아요',2,'2021-03-26 04:27:36.945307',30,NULL,16),(207,'핵귀',2,'2021-03-26 04:27:36.947104',58,NULL,19),(208,'굳굳굳',1,'2021-03-26 04:27:36.949365',45,NULL,20),(209,'귀여워',3,'2021-03-26 04:27:36.952592',54,NULL,18),(210,'대박귀여워',3,'2021-03-26 04:27:36.956086',52,NULL,19),(211,'맛있겠다',1,'2021-03-26 04:27:36.957817',56,NULL,20),(212,'모샃ㅁ겠다',3,'2021-03-26 04:27:36.959663',8,NULL,18),(213,'사고싶당',3,'2021-03-26 04:27:36.961544',42,NULL,18),(214,'사진찍어',0,'2021-03-26 04:27:36.963440',31,NULL,16),(215,'어피치',0,'2021-03-26 04:27:36.965346',26,NULL,18),(216,'엄청 귀여워요',0,'2021-03-26 04:27:36.967340',10,NULL,16),(217,'오귀엽',2,'2021-03-26 04:27:36.970966',41,NULL,20),(218,'이거예뻐워',2,'2021-03-26 04:27:36.973036',30,NULL,19),(219,'이벤트해주세요',2,'2021-03-26 04:27:36.974994',12,NULL,16),(220,'좋네요',3,'2021-03-26 04:27:36.977066',29,NULL,18),(221,'핵귀',2,'2021-03-26 04:27:36.979314',2,NULL,20),(222,'같고싶다',2,'2021-03-26 04:27:36.981272',58,NULL,15),(223,'공부 열심히 하자',2,'2021-03-26 04:27:36.983016',14,NULL,19),(224,'구독',2,'2021-03-26 04:27:36.989223',40,NULL,17),(225,'냠냠',3,'2021-03-26 04:27:36.991565',55,NULL,15),(226,'더 보고싶은데 ㅜㅜ',6,'2021-03-26 04:27:36.993842',53,NULL,17),(227,'벌써 끝이라니',6,'2021-03-26 04:27:36.995834',6,NULL,17),(228,'아니에요',2,'2021-03-26 04:27:36.997659',2,NULL,15),(229,'아앙',0,'2021-03-26 04:27:36.999672',51,NULL,19),(230,'알람설정',2,'2021-03-26 04:27:37.001771',18,NULL,17),(231,'앞으로 더욱 친하게 지내요',3,'2021-03-26 04:27:37.004122',39,NULL,15),(232,'오신기하다',1,'2021-03-26 04:27:37.006307',13,NULL,18),(233,'잉?',2,'2021-03-26 04:27:37.008589',21,NULL,15),(234,'좋아요',6,'2021-03-26 04:27:37.010514',41,NULL,17),(235,'굳굳굳',6,'2021-03-26 04:27:37.012901',19,NULL,15),(236,'귀여워',1,'2021-03-26 04:27:37.014792',3,NULL,19),(237,'귀엽다',0,'2021-03-26 04:27:37.017011',30,NULL,17),(238,'냠냠',4,'2021-03-26 04:27:37.018934',55,NULL,16),(239,'네',3,'2021-03-26 04:27:37.021702',46,NULL,16),(240,'맛있겠다',1,'2021-03-26 04:27:37.023861',17,NULL,15),(241,'모샃ㅁ겠다',2,'2021-03-26 04:27:37.025675',35,NULL,19),(242,'브런치먹을사람?',2,'2021-03-26 04:27:37.027861',32,NULL,15),(243,'사고싶당',2,'2021-03-26 04:27:37.029890',37,NULL,19),(244,'사진찍어',2,'2021-03-26 04:27:37.031795',4,NULL,17),(245,'어피치',3,'2021-03-26 04:27:37.035087',5,NULL,19),(246,'엄청 귀여워요',1,'2021-03-26 04:27:37.037768',38,NULL,17),(247,'우리와 같이살자',1,'2021-03-26 04:27:37.039922',42,NULL,16),(248,'이벤트해주세요',3,'2021-03-26 04:27:37.042130',5,NULL,17),(249,'좋네요',3,'2021-03-26 04:27:37.043873',38,NULL,19),(250,'핵귀',0,'2021-03-26 04:27:37.046095',37,NULL,15),(251,'같고싶다',1,'2021-03-26 04:27:37.048162',2,NULL,16),(252,'구독',0,'2021-03-26 04:27:37.050108',5,NULL,18),(253,'냠냠',2,'2021-03-26 04:27:37.052496',6,NULL,17),(254,'대박귀여워',4,'2021-03-26 04:27:37.055193',31,NULL,20),(255,'더 보고싶은데 ㅜㅜ',1,'2021-03-26 04:27:37.057367',27,NULL,18),(256,'벌써 끝이라니',3,'2021-03-26 04:27:37.059793',13,NULL,18),(257,'아앙',4,'2021-03-26 04:27:37.061821',3,NULL,20),(258,'알람설정',2,'2021-03-26 04:27:37.063469',23,NULL,18),(259,'오귀엽',4,'2021-03-26 04:27:37.065737',19,NULL,15),(260,'오신기하다',2,'2021-03-26 04:27:37.069099',37,NULL,19),(261,'이거예뻐워',1,'2021-03-26 04:27:37.071531',9,NULL,20),(262,'잉?',1,'2021-03-26 04:27:37.073649',8,NULL,16),(263,'좋아요',4,'2021-03-26 04:27:37.075818',8,NULL,18),(264,'공부 열심히 하자',2,'2021-03-26 04:27:37.077840',7,NULL,20),(265,'귀여워',1,'2021-03-26 04:27:37.080129',51,NULL,20),(266,'귀엽다',1,'2021-03-26 04:27:37.082793',9,NULL,18),(267,'냠냠',4,'2021-03-26 04:27:37.084583',23,NULL,18),(268,'네',1,'2021-03-26 04:27:37.087796',27,NULL,17),(269,'모샃ㅁ겠다',0,'2021-03-26 04:27:37.090333',56,NULL,20),(270,'브런치먹을사람?',5,'2021-03-26 04:27:37.091999',3,NULL,16),(271,'아니에요',3,'2021-03-26 04:27:37.093828',28,NULL,16),(272,'앞으로 더욱 친하게 지내요',1,'2021-03-26 04:27:37.095437',34,NULL,16),(273,'어피치',2,'2021-03-26 04:27:37.097047',2,NULL,20),(274,'우리와 같이살자',3,'2021-03-26 04:27:37.098921',40,NULL,17),(275,'좋네요',5,'2021-03-26 04:27:37.102472',10,NULL,20),(276,'같고싶다',1,'2021-03-26 04:27:37.104322',59,NULL,17),(277,'굳굳굳',2,'2021-03-26 04:27:37.106200',37,NULL,16),(278,'냠냠',2,'2021-03-26 04:27:37.108414',23,NULL,19),(279,'대박귀여워',2,'2021-03-26 04:27:37.111241',34,NULL,15),(280,'맛있겠다',2,'2021-03-26 04:27:37.113274',32,NULL,16),(281,'사고싶당',1,'2021-03-26 04:27:37.115317',42,NULL,20),(282,'사진찍어',4,'2021-03-26 04:27:37.117555',4,NULL,18),(283,'엄청 귀여워요',1,'2021-03-26 04:27:37.119283',47,NULL,18),(284,'오귀엽',0,'2021-03-26 04:27:37.121298',30,NULL,16),(285,'이거예뻐워',2,'2021-03-26 04:27:37.123181',36,NULL,15),(286,'이벤트해주세요',1,'2021-03-26 04:27:37.125202',18,NULL,18),(287,'핵귀',3,'2021-03-26 04:27:37.126987',8,NULL,16),(288,'공부 열심히 하자',6,'2021-03-26 04:27:37.129053',54,NULL,15),(289,'구독',1,'2021-03-26 04:27:37.131363',6,NULL,19),(290,'네',0,'2021-03-26 04:27:37.133535',21,NULL,18),(291,'더 보고싶은데 ㅜㅜ',2,'2021-03-26 04:27:37.136693',15,NULL,19),(292,'벌써 끝이라니',3,'2021-03-26 04:27:37.138456',59,NULL,19),(293,'아니에요',1,'2021-03-26 04:27:37.140216',42,NULL,17),(294,'아앙',7,'2021-03-26 04:27:37.142114',50,NULL,15),(295,'알람설정',4,'2021-03-26 04:27:37.143762',43,NULL,19),(296,'앞으로 더욱 친하게 지내요',2,'2021-03-26 04:27:37.146071',13,NULL,17),(297,'오신기하다',1,'2021-03-26 04:27:37.148216',11,NULL,20),(298,'우리와 같이살자',4,'2021-03-26 04:27:37.150000',2,NULL,18),(299,'잉?',0,'2021-03-26 04:27:37.152542',40,NULL,17),(300,'좋아요',3,'2021-03-26 04:27:37.158453',20,NULL,19),(301,'굳굳굳',3,'2021-03-26 04:27:37.160042',58,NULL,17),(302,'귀여워',4,'2021-03-26 04:27:37.161941',4,NULL,15),(303,'귀엽다',3,'2021-03-26 04:27:37.164018',43,NULL,19),(304,'냠냠',2,'2021-03-26 04:27:37.165884',7,NULL,20),(305,'맛있겠다',2,'2021-03-26 04:27:37.167513',40,NULL,17),(306,'모샃ㅁ겠다',2,'2021-03-26 04:27:37.168827',17,NULL,15),(307,'브런치먹을사람?',1,'2021-03-26 04:27:37.170176',34,NULL,17),(308,'사고싶당',1,'2021-03-26 04:27:37.171430',35,NULL,15),(309,'어피치',3,'2021-03-26 04:27:37.172931',36,NULL,15),(310,'엄청 귀여워요',1,'2021-03-26 04:27:37.174421',47,NULL,19),(311,'이벤트해주세요',2,'2021-03-26 04:27:37.176210',8,NULL,19),(312,'좋네요',2,'2021-03-26 04:27:37.177954',40,NULL,15),(313,'핵귀',4,'2021-03-26 04:27:37.179829',26,NULL,17),(314,'같고싶다',4,'2021-03-26 04:27:37.181707',7,NULL,18),(315,'구독',1,'2021-03-26 04:27:37.183402',3,NULL,20),(316,'냠냠',3,'2021-03-26 04:27:37.185039',55,NULL,15),(317,'대박귀여워',0,'2021-03-26 04:27:37.187468',27,NULL,16),(318,'더 보고싶은데 ㅜㅜ',3,'2021-03-26 04:27:37.189200',40,NULL,20),(319,'사진찍어',1,'2021-03-26 04:27:37.190767',29,NULL,19),(320,'아앙',2,'2021-03-26 04:27:37.192078',7,NULL,16),(321,'알람설정',1,'2021-03-26 04:27:37.193738',16,NULL,20),(322,'오귀엽',1,'2021-03-26 04:27:37.195556',58,NULL,17),(323,'오신기하다',2,'2021-03-26 04:27:37.197221',10,NULL,15),(324,'이거예뻐워',3,'2021-03-26 04:27:37.198837',6,NULL,16),(325,'잉?',1,'2021-03-26 04:27:37.200376',49,NULL,18),(326,'좋아요',7,'2021-03-26 04:27:37.201770',28,NULL,20),(327,'공부 열심히 하자',4,'2021-03-26 04:27:37.203067',8,NULL,16),(328,'귀여워',2,'2021-03-26 04:27:37.204254',18,NULL,16),(329,'귀엽다',4,'2021-03-26 04:27:37.205504',40,NULL,20),(330,'냠냠',3,'2021-03-26 04:27:37.206740',38,NULL,16),(331,'네',1,'2021-03-26 04:27:37.208061',26,NULL,19),(332,'모샃ㅁ겠다',2,'2021-03-26 04:27:37.209379',46,NULL,16),(333,'벌써 끝이라니',1,'2021-03-26 04:27:37.210696',25,NULL,20),(334,'브런치먹을사람?',3,'2021-03-26 04:27:37.211979',32,NULL,18),(335,'아니에요',5,'2021-03-26 04:27:37.213184',54,NULL,18),(336,'앞으로 더욱 친하게 지내요',2,'2021-03-26 04:27:37.214285',13,NULL,18),(337,'어피치',2,'2021-03-26 04:27:37.215375',37,NULL,16),(338,'우리와 같이살자',3,'2021-03-26 04:27:37.216465',2,NULL,19),(339,'좋네요',3,'2021-03-26 04:27:37.217538',11,NULL,16),(340,'같고싶다',0,'2021-03-26 04:27:37.218599',16,NULL,19),(341,'굳굳굳',2,'2021-03-26 04:27:37.219666',21,NULL,18),(342,'냠냠',1,'2021-03-26 04:27:37.220718',31,NULL,17),(343,'대박귀여워',1,'2021-03-26 04:27:37.222040',19,NULL,17),(344,'맛있겠다',1,'2021-03-26 04:27:37.223196',16,NULL,18),(345,'사고싶당',2,'2021-03-26 04:27:37.224284',13,NULL,16),(346,'사진찍어',4,'2021-03-26 04:27:37.225350',58,NULL,20),(347,'엄청 귀여워요',1,'2021-03-26 04:27:37.226455',33,NULL,20),(348,'오귀엽',2,'2021-03-26 04:27:37.227516',9,NULL,18),(349,'오신기하다',2,'2021-03-26 04:27:37.228571',53,NULL,16),(350,'이거예뻐워',2,'2021-03-26 04:27:37.229695',32,NULL,17),(351,'이벤트해주세요',1,'2021-03-26 04:27:37.230782',23,NULL,20),(352,'좋아요',1,'2021-03-26 04:27:37.231902',5,NULL,15),(353,'핵귀',2,'2021-03-26 04:27:37.233008',8,NULL,18),(354,'공부 열심히 하자',1,'2021-03-26 04:27:37.234156',52,NULL,17),(355,'구독',5,'2021-03-26 04:27:37.235642',27,NULL,15),(356,'귀엽다',3,'2021-03-26 04:27:37.237053',35,NULL,15),(357,'냠냠',0,'2021-03-26 04:27:37.238204',47,NULL,18),(358,'네',3,'2021-03-26 04:27:37.239326',24,NULL,20),(359,'더 보고싶은데 ㅜㅜ',2,'2021-03-26 04:27:37.240397',12,NULL,15),(360,'벌써 끝이라니',1,'2021-03-26 04:27:37.241454',4,NULL,15),(361,'브런치먹을사람?',2,'2021-03-26 04:27:37.242498',11,NULL,19),(362,'아니에요',3,'2021-03-26 04:27:37.243720',27,NULL,19),(363,'아앙',1,'2021-03-26 04:27:37.244930',39,NULL,17),(364,'알람설정',1,'2021-03-26 04:27:37.246089',46,NULL,15),(365,'앞으로 더욱 친하게 지내요',4,'2021-03-26 04:27:37.247152',28,NULL,19),(366,'우리와 같이살자',3,'2021-03-26 04:27:37.248211',48,NULL,20),(367,'잉?',1,'2021-03-26 04:27:37.249272',48,NULL,19),(368,'굳굳굳',3,'2021-03-26 04:27:37.250343',28,NULL,19),(369,'귀여워',4,'2021-03-26 04:27:37.251414',24,NULL,17),(370,'대박귀여워',4,'2021-03-26 04:27:37.252485',35,NULL,18),(371,'맛있겠다',3,'2021-03-26 04:27:37.253641',10,NULL,19),(372,'모샃ㅁ겠다',0,'2021-03-26 04:27:37.254693',10,NULL,17),(373,'사고싶당',2,'2021-03-26 04:27:37.255782',28,NULL,17),(374,'사진찍어',3,'2021-03-26 04:27:37.257120',15,NULL,15),(375,'어피치',0,'2021-03-26 04:27:37.258697',8,NULL,17),(376,'엄청 귀여워요',3,'2021-03-26 04:27:37.260093',56,NULL,15),(377,'오귀엽',3,'2021-03-26 04:27:37.261382',16,NULL,19),(378,'이거예뻐워',0,'2021-03-26 04:27:37.262495',28,NULL,18),(379,'이벤트해주세요',0,'2021-03-26 04:27:37.263592',19,NULL,15),(380,'좋네요',3,'2021-03-26 04:27:37.264672',39,NULL,17),(381,'핵귀',2,'2021-03-26 04:27:37.265860',31,NULL,19),(382,'같고싶다',1,'2021-03-26 04:27:37.267003',53,NULL,20),(383,'공부 열심히 하자',1,'2021-03-26 04:27:37.268115',44,NULL,18),(384,'구독',1,'2021-03-26 04:27:37.269146',2,NULL,16),(385,'냠냠',3,'2021-03-26 04:27:37.270144',20,NULL,19),(386,'네',2,'2021-03-26 04:27:37.271195',33,NULL,15),(387,'더 보고싶은데 ㅜㅜ',2,'2021-03-26 04:27:37.272204',9,NULL,16),(388,'벌써 끝이라니',1,'2021-03-26 04:27:37.273225',55,NULL,16),(389,'아니에요',3,'2021-03-26 04:27:37.274236',20,NULL,20),(390,'아앙',3,'2021-03-26 04:27:37.275333',4,NULL,18),(391,'알람설정',5,'2021-03-26 04:27:37.276344',35,NULL,16),(392,'앞으로 더욱 친하게 지내요',2,'2021-03-26 04:27:37.277303',55,NULL,20),(393,'오신기하다',2,'2021-03-26 04:27:37.278491',20,NULL,17),(394,'잉?',3,'2021-03-26 04:27:37.279589',31,NULL,20),(395,'좋아요',2,'2021-03-26 04:27:37.280634',34,NULL,16),(396,'굳굳굳',4,'2021-03-26 04:27:37.281622',20,NULL,20),(397,'귀여워',1,'2021-03-26 04:27:37.282807',6,NULL,18),(398,'귀엽다',1,'2021-03-26 04:27:37.284379',56,NULL,16),(399,'냠냠',1,'2021-03-26 04:27:37.285432',45,NULL,20),(400,'맛있겠다',2,'2021-03-26 04:27:37.286445',49,NULL,20),(401,'모샃ㅁ겠다',2,'2021-03-26 04:27:37.287439',16,NULL,18),(402,'브런치먹을사람?',1,'2021-03-26 04:27:37.288413',30,NULL,20),(403,'사고싶당',2,'2021-03-26 04:27:37.289517',39,NULL,18),(404,'어피치',2,'2021-03-26 04:27:37.290573',58,NULL,18),(405,'엄청 귀여워요',1,'2021-03-26 04:27:37.291597',6,NULL,16),(406,'우리와 같이살자',3,'2021-03-26 04:27:37.292603',45,NULL,15),(407,'이벤트해주세요',3,'2021-03-26 04:27:37.293592',49,NULL,16),(408,'좋네요',1,'2021-03-26 04:27:37.294549',57,NULL,18),(409,'핵귀',1,'2021-03-26 04:27:37.295550',14,NULL,20),(410,'같고싶다',3,'2021-03-26 04:27:37.296573',39,NULL,15),(411,'구독',0,'2021-03-26 04:27:37.297730',25,NULL,17),(412,'냠냠',0,'2021-03-26 04:27:37.298705',43,NULL,15),(413,'대박귀여워',1,'2021-03-26 04:27:37.299634',10,NULL,19),(414,'더 보고싶은데 ㅜㅜ',1,'2021-03-26 04:27:37.300616',37,NULL,17),(415,'사진찍어',4,'2021-03-26 04:27:37.301742',41,NULL,16),(416,'아앙',3,'2021-03-26 04:27:37.302772',53,NULL,19),(417,'알람설정',3,'2021-03-26 04:27:37.303907',5,NULL,17),(418,'오귀엽',2,'2021-03-26 04:27:37.305019',22,NULL,20),(419,'오신기하다',1,'2021-03-26 04:27:37.305998',5,NULL,18),(420,'이거예뻐워',3,'2021-03-26 04:27:37.306969',32,NULL,19),(421,'잉?',2,'2021-03-26 04:27:37.308123',19,NULL,15),(422,'좋아요',3,'2021-03-26 04:27:37.309109',58,NULL,17),(423,'공부 열심히 하자',2,'2021-03-26 04:27:37.310055',59,NULL,19),(424,'귀엽다',1,'2021-03-26 04:27:37.311203',15,NULL,17),(425,'냠냠',2,'2021-03-26 04:27:37.312141',1,NULL,16),(426,'네',3,'2021-03-26 04:27:37.313044',28,NULL,16),(427,'벌써 끝이라니',1,'2021-03-26 04:27:37.314035',48,NULL,17),(428,'브런치먹을사람?',0,'2021-03-26 04:27:37.314990',38,NULL,15),(429,'아니에요',2,'2021-03-26 04:27:37.315928',29,NULL,15),(430,'앞으로 더욱 친하게 지내요',2,'2021-03-26 04:27:37.316891',42,NULL,15),(431,'어피치',1,'2021-03-26 04:27:37.317867',17,NULL,19),(432,'우리와 같이살자',4,'2021-03-26 04:27:37.318859',10,NULL,16),(433,'굳굳굳',3,'2021-03-26 04:27:37.319803',43,NULL,15),(434,'귀여워',1,'2021-03-26 04:27:37.320739',33,NULL,19),(435,'대박귀여워',1,'2021-03-26 04:27:37.321659',9,NULL,20),(436,'맛있겠다',1,'2021-03-26 04:27:37.322573',54,NULL,15),(437,'모샃ㅁ겠다',1,'2021-03-26 04:27:37.323549',8,NULL,19),(438,'사고싶당',3,'2021-03-26 04:27:37.324646',29,NULL,19),(439,'사진찍어',2,'2021-03-26 04:27:37.325565',51,NULL,17),(440,'엄청 귀여워요',2,'2021-03-26 04:27:37.326542',49,NULL,17),(441,'오귀엽',0,'2021-03-26 04:27:37.327456',22,NULL,15),(442,'이벤트해주세요',0,'2021-03-26 04:27:37.328366',24,NULL,17),(443,'좋네요',1,'2021-03-26 04:27:37.329454',24,NULL,19),(444,'핵귀',3,'2021-03-26 04:27:37.330401',8,NULL,15),(445,'같고싶다',0,'2021-03-26 04:27:37.331442',19,NULL,16),(446,'구독',0,'2021-03-26 04:27:37.332461',16,NULL,18),(447,'냠냠',2,'2021-03-26 04:27:37.333469',41,NULL,17),(448,'더 보고싶은데 ㅜㅜ',4,'2021-03-26 04:27:37.334708',26,NULL,18),(449,'벌써 끝이라니',5,'2021-03-26 04:27:37.336439',47,NULL,18),(450,'아앙',4,'2021-03-26 04:27:37.338253',10,NULL,20),(451,'알람설정',2,'2021-03-26 04:27:37.339915',44,NULL,18),(452,'오신기하다',0,'2021-03-26 04:27:37.341865',28,NULL,19),(453,'이거예뻐워',1,'2021-03-26 04:27:37.343853',42,NULL,20),(454,'잉?',0,'2021-03-26 04:27:37.345780',8,NULL,16),(455,'좋아요',0,'2021-03-26 04:27:37.348158',5,NULL,18),(456,'공부 열심히 하자',3,'2021-03-26 04:27:37.350004',7,NULL,20),(457,'귀엽다',2,'2021-03-26 04:27:37.351804',47,NULL,18),(458,'냠냠',1,'2021-03-26 04:27:37.353628',3,NULL,18),(459,'네',1,'2021-03-26 04:27:37.355884',55,NULL,17),(460,'브런치먹을사람?',2,'2021-03-26 04:27:37.357559',33,NULL,16),(461,'아니에요',2,'2021-03-26 04:27:37.359521',29,NULL,16),(462,'앞으로 더욱 친하게 지내요',1,'2021-03-26 04:27:37.361523',26,NULL,16),(463,'어피치',0,'2021-03-26 04:27:37.363472',30,NULL,20),(464,'우리와 같이살자',2,'2021-03-26 04:27:37.365504',38,NULL,17),(465,'굳굳굳',3,'2021-03-26 04:27:37.367449',37,NULL,16),(466,'귀여워',4,'2021-03-26 04:27:37.369378',33,NULL,20),(467,'맛있겠다',1,'2021-03-26 04:27:37.371314',58,NULL,16),(468,'모샃ㅁ겠다',3,'2021-03-26 04:27:37.373276',29,NULL,20),(469,'사고싶당',1,'2021-03-26 04:27:37.375396',9,NULL,20),(470,'엄청 귀여워요',2,'2021-03-26 04:27:37.377169',18,NULL,18),(471,'이벤트해주세요',3,'2021-03-26 04:27:37.379287',48,NULL,18),(472,'좋네요',2,'2021-03-26 04:27:37.381329',52,NULL,20),(473,'핵귀',0,'2021-03-26 04:27:37.383343',38,NULL,16),(474,'같고싶다',1,'2021-03-26 04:27:37.385513',16,NULL,17),(475,'구독',0,'2021-03-26 04:27:37.387493',28,NULL,19),(476,'냠냠',0,'2021-03-26 04:27:37.389517',18,NULL,19),(477,'대박귀여워',1,'2021-03-26 04:27:37.391554',7,NULL,15),(478,'더 보고싶은데 ㅜㅜ',1,'2021-03-26 04:27:37.393483',56,NULL,19),(479,'사진찍어',0,'2021-03-26 04:27:37.395507',31,NULL,18),(480,'알람설정',4,'2021-03-26 04:27:37.397055',26,NULL,19),(481,'오귀엽',2,'2021-03-26 04:27:37.398398',31,NULL,16),(482,'오신기하다',2,'2021-03-26 04:27:37.400388',56,NULL,20),(483,'이거예뻐워',2,'2021-03-26 04:27:37.402270',16,NULL,15),(484,'잉?',1,'2021-03-26 04:27:37.404625',54,NULL,17),(485,'좋아요',5,'2021-03-26 04:27:37.406719',15,NULL,19),(486,'공부 열심히 하자',2,'2021-03-26 04:27:37.408497',59,NULL,15),(487,'귀여워',3,'2021-03-26 04:27:37.410391',14,NULL,15),(488,'귀엽다',2,'2021-03-26 04:27:37.412134',3,NULL,19),(489,'냠냠',2,'2021-03-26 04:27:37.413830',39,NULL,20),(490,'네',1,'2021-03-26 04:27:37.415237',41,NULL,18),(491,'모샃ㅁ겠다',4,'2021-03-26 04:27:37.416751',51,NULL,15),(492,'벌써 끝이라니',1,'2021-03-26 04:27:37.418707',50,NULL,19),(493,'브런치먹을사람?',2,'2021-03-26 04:27:37.420421',56,NULL,17),(494,'아니에요',0,'2021-03-26 04:27:37.421660',43,NULL,17),(495,'아앙',1,'2021-03-26 04:27:37.422863',32,NULL,15),(496,'앞으로 더욱 친하게 지내요',4,'2021-03-26 04:27:37.424114',30,NULL,17),(497,'어피치',0,'2021-03-26 04:27:37.425630',17,NULL,15),(498,'우리와 같이살자',0,'2021-03-26 04:27:37.426965',41,NULL,18),(499,'좋네요',3,'2021-03-26 04:27:37.428110',40,NULL,15),(500,'같고싶다',0,'2021-03-26 04:27:37.429310',35,NULL,18),(501,'굳굳굳',1,'2021-03-26 04:27:37.430507',14,NULL,17),(502,'냠냠',3,'2021-03-26 04:27:37.431626',37,NULL,15),(503,'대박귀여워',4,'2021-03-26 04:27:37.432982',44,NULL,16),(504,'맛있겠다',5,'2021-03-26 04:27:37.434139',32,NULL,17),(505,'사고싶당',2,'2021-03-26 04:27:37.435241',11,NULL,15),(506,'사진찍어',2,'2021-03-26 04:27:37.436612',49,NULL,19),(507,'엄청 귀여워요',1,'2021-03-26 04:27:37.437722',22,NULL,19),(508,'오귀엽',1,'2021-03-26 04:27:37.439096',33,NULL,17),(509,'오신기하다',2,'2021-03-26 04:27:37.440452',31,NULL,15),(510,'이거예뻐워',2,'2021-03-26 04:27:37.441593',35,NULL,16),(511,'이벤트해주세요',1,'2021-03-26 04:27:37.442664',57,NULL,19),(512,'핵귀',2,'2021-03-26 04:27:37.443711',51,NULL,17),(513,'공부 열심히 하자',1,'2021-03-26 04:27:37.444913',44,NULL,16),(514,'구독',3,'2021-03-26 04:27:37.445992',48,NULL,20),(515,'냠냠',2,'2021-03-26 04:27:37.447144',4,NULL,16),(516,'네',3,'2021-03-26 04:27:37.448290',14,NULL,19),(517,'더 보고싶은데 ㅜㅜ',0,'2021-03-26 04:27:37.449450',32,NULL,20),(518,'벌써 끝이라니',1,'2021-03-26 04:27:37.450568',58,NULL,20),(519,'아니에요',3,'2021-03-26 04:27:37.451806',56,NULL,18),(520,'아앙',1,'2021-03-26 04:27:37.453030',36,NULL,16),(521,'알람설정',2,'2021-03-26 04:27:37.454253',57,NULL,20),(522,'앞으로 더욱 친하게 지내요',1,'2021-03-26 04:27:37.455452',20,NULL,18),(523,'우리와 같이살자',1,'2021-03-26 04:27:37.456566',10,NULL,19),(524,'잉?',3,'2021-03-26 04:27:37.457650',57,NULL,18),(525,'좋아요',4,'2021-03-26 04:27:37.458869',9,NULL,20),(526,'굳굳굳',2,'2021-03-26 04:27:37.460153',43,NULL,18),(527,'귀여워',2,'2021-03-26 04:27:37.461233',27,NULL,16),(528,'귀엽다',2,'2021-03-26 04:27:37.462253',30,NULL,20),(529,'맛있겠다',2,'2021-03-26 04:27:37.463275',18,NULL,18),(530,'모샃ㅁ겠다',0,'2021-03-26 04:27:37.464290',49,NULL,16),(531,'브런치먹을사람?',4,'2021-03-26 04:27:37.465320',14,NULL,18),(532,'사고싶당',1,'2021-03-26 04:27:37.466514',53,NULL,16),(533,'사진찍어',3,'2021-03-26 04:27:37.467758',29,NULL,20),(534,'어피치',1,'2021-03-26 04:27:37.468795',48,NULL,16),(535,'엄청 귀여워요',1,'2021-03-26 04:27:37.470257',29,NULL,20),(536,'이벤트해주세요',1,'2021-03-26 04:27:37.471326',46,NULL,20),(537,'좋네요',2,'2021-03-26 04:27:37.472372',6,NULL,16),(538,'핵귀',3,'2021-03-26 04:27:37.473550',37,NULL,18),(539,'같고싶다',1,'2021-03-26 04:27:37.474550',5,NULL,19),(540,'구독',0,'2021-03-26 04:27:37.475738',5,NULL,15),(541,'냠냠',6,'2021-03-26 04:27:37.476778',4,NULL,17),(542,'대박귀여워',1,'2021-03-26 04:27:37.477732',28,NULL,17),(543,'더 보고싶은데 ㅜㅜ',2,'2021-03-26 04:27:37.478963',2,NULL,15),(544,'알람설정',1,'2021-03-26 04:27:37.480771',3,NULL,15),(545,'오귀엽',3,'2021-03-26 04:27:37.482938',55,NULL,18),(546,'오신기하다',2,'2021-03-26 04:27:37.484754',40,NULL,16),(547,'이거예뻐워',2,'2021-03-26 04:27:37.486272',55,NULL,17),(548,'잉?',1,'2021-03-26 04:27:37.487680',54,NULL,19),(549,'좋아요',1,'2021-03-26 04:27:37.489270',12,NULL,15),(550,'공부 열심히 하자',1,'2021-03-26 04:27:37.490692',38,NULL,17),(551,'귀엽다',1,'2021-03-26 04:27:37.492185',52,NULL,15),(552,'냠냠',0,'2021-03-26 04:27:37.494043',41,NULL,18),(553,'네',0,'2021-03-26 04:27:37.495796',39,NULL,20),(554,'모샃ㅁ겠다',1,'2021-03-26 04:27:37.497359',2,NULL,17),(555,'벌써 끝이라니',4,'2021-03-26 04:27:37.498669',56,NULL,15),(556,'브런치먹을사람?',2,'2021-03-26 04:27:37.500210',36,NULL,19),(557,'아니에요',2,'2021-03-26 04:27:37.501591',28,NULL,19),(558,'아앙',1,'2021-03-26 04:27:37.503020',36,NULL,17),(559,'앞으로 더욱 친하게 지내요',2,'2021-03-26 04:27:37.504503',8,NULL,19),(560,'어피치',2,'2021-03-26 04:27:37.505654',32,NULL,17),(561,'우리와 같이살자',2,'2021-03-26 04:27:37.506891',40,NULL,20),(562,'굳굳굳',1,'2021-03-26 04:27:37.508182',17,NULL,19),(563,'귀여워',3,'2021-03-26 04:27:37.509276',26,NULL,17),(564,'대박귀여워',2,'2021-03-26 04:27:37.510511',20,NULL,18),(565,'맛있겠다',4,'2021-03-26 04:27:37.511702',11,NULL,19),(566,'사고싶당',0,'2021-03-26 04:27:37.512820',2,NULL,17),(567,'사진찍어',1,'2021-03-26 04:27:37.514154',3,NULL,15),(568,'엄청 귀여워요',3,'2021-03-26 04:27:37.515655',25,NULL,15),(569,'오귀엽',3,'2021-03-26 04:27:37.516778',12,NULL,19),(570,'이벤트해주세요',1,'2021-03-26 04:27:37.517913',33,NULL,15),(571,'좋네요',3,'2021-03-26 04:27:37.518954',33,NULL,17),(572,'핵귀',4,'2021-03-26 04:27:37.520016',19,NULL,19),(573,'같고싶다',1,'2021-03-26 04:27:37.521068',54,NULL,20),(574,'구독',0,'2021-03-26 04:27:37.522298',53,NULL,16),(575,'냠냠',1,'2021-03-26 04:27:37.523319',33,NULL,19),(576,'더 보고싶은데 ㅜㅜ',2,'2021-03-26 04:27:37.524351',20,NULL,16),(577,'알람설정',1,'2021-03-26 04:27:37.525505',49,NULL,16),(578,'오신기하다',4,'2021-03-26 04:27:37.526733',33,NULL,17),(579,'이거예뻐워',1,'2021-03-26 04:27:37.527957',49,NULL,18),(580,'잉?',2,'2021-03-26 04:27:37.529014',14,NULL,20),(581,'좋아요',2,'2021-03-26 04:27:37.530062',57,NULL,16),(582,'공부 열심히 하자',3,'2021-03-26 04:27:37.531096',47,NULL,18),(583,'귀엽다',3,'2021-03-26 04:27:37.532155',9,NULL,16),(584,'냠냠',4,'2021-03-26 04:27:37.533247',2,NULL,20),(585,'네',2,'2021-03-26 04:27:37.534339',46,NULL,15),(586,'벌써 끝이라니',1,'2021-03-26 04:27:37.535364',41,NULL,16),(587,'브런치먹을사람?',1,'2021-03-26 04:27:37.536351',10,NULL,20),(588,'아니에요',4,'2021-03-26 04:27:37.537520',17,NULL,20),(589,'아앙',3,'2021-03-26 04:27:37.538592',54,NULL,18),(590,'앞으로 더욱 친하게 지내요',0,'2021-03-26 04:27:37.539614',45,NULL,20),(591,'우리와 같이살자',1,'2021-03-26 04:27:37.540595',34,NULL,15),(592,'굳굳굳',1,'2021-03-26 04:27:37.541578',12,NULL,20),(593,'귀여워',2,'2021-03-26 04:27:37.542740',46,NULL,18),(594,'맛있겠다',0,'2021-03-26 04:27:37.543738',12,NULL,20),(595,'모샃ㅁ겠다',4,'2021-03-26 04:27:37.544759',56,NULL,18),(596,'사고싶당',0,'2021-03-26 04:27:37.545776',15,NULL,18),(597,'어피치',2,'2021-03-26 04:27:37.546782',48,NULL,18),(598,'엄청 귀여워요',1,'2021-03-26 04:27:37.548068',28,NULL,16),(599,'이벤트해주세요',1,'2021-03-26 04:27:37.549460',17,NULL,16),(600,'좋네요',3,'2021-03-26 04:27:37.550651',38,NULL,18),(601,'핵귀',2,'2021-03-26 04:27:37.551709',56,NULL,20),(602,'같고싶다',4,'2021-03-26 04:27:37.552701',24,NULL,15),(603,'구독',3,'2021-03-26 04:27:37.553809',3,NULL,17),(604,'냠냠',2,'2021-03-26 04:27:37.554920',17,NULL,15),(605,'대박귀여워',0,'2021-03-26 04:27:37.555951',33,NULL,19),(606,'사진찍어',6,'2021-03-26 04:27:37.556984',49,NULL,16),(607,'알람설정',2,'2021-03-26 04:27:37.558165',5,NULL,17),(608,'오귀엽',1,'2021-03-26 04:27:37.559269',20,NULL,20),(609,'오신기하다',4,'2021-03-26 04:27:37.560341',16,NULL,18),(610,'이거예뻐워',1,'2021-03-26 04:27:37.561328',28,NULL,19),(611,'좋아요',2,'2021-03-26 04:27:37.562317',25,NULL,17),(612,'공부 열심히 하자',1,'2021-03-26 04:27:37.563320',20,NULL,19),(613,'네',1,'2021-03-26 04:27:37.564347',18,NULL,16),(614,'더 보고싶은데 ㅜㅜ',1,'2021-03-26 04:27:37.565358',1,NULL,17),(615,'벌써 끝이라니',5,'2021-03-26 04:27:37.566355',25,NULL,17),(616,'아니에요',1,'2021-03-26 04:27:37.567357',59,NULL,15),(617,'아앙',2,'2021-03-26 04:27:37.568503',37,NULL,19),(618,'앞으로 더욱 친하게 지내요',0,'2021-03-26 04:27:37.569562',31,NULL,15),(619,'잉?',2,'2021-03-26 04:27:37.570687',39,NULL,15),(620,'굳굳굳',5,'2021-03-26 04:27:37.571949',51,NULL,15),(621,'귀여워',4,'2021-03-26 04:27:37.573126',3,NULL,19),(622,'귀엽다',2,'2021-03-26 04:27:37.574097',35,NULL,17),(623,'냠냠',4,'2021-03-26 04:27:37.575059',23,NULL,16),(624,'모샃ㅁ겠다',2,'2021-03-26 04:27:37.576055',21,NULL,19),(625,'브런치먹을사람?',1,'2021-03-26 04:27:37.577024',17,NULL,15),(626,'어피치',1,'2021-03-26 04:27:37.578039',30,NULL,19),(627,'엄청 귀여워요',3,'2021-03-26 04:27:37.579008',32,NULL,17),(628,'우리와 같이살자',6,'2021-03-26 04:27:37.580033',13,NULL,16),(629,'좋네요',1,'2021-03-26 04:27:37.581003',49,NULL,19),(630,'같고싶다',3,'2021-03-26 04:27:37.582035',36,NULL,16),(631,'냠냠',1,'2021-03-26 04:27:37.583064',47,NULL,17),(632,'대박귀여워',1,'2021-03-26 04:27:37.584027',42,NULL,20),(633,'맛있겠다',2,'2021-03-26 04:27:37.585156',20,NULL,15),(634,'사고싶당',2,'2021-03-26 04:27:37.586525',47,NULL,19),(635,'사진찍어',2,'2021-03-26 04:27:37.587810',18,NULL,17),(636,'오귀엽',1,'2021-03-26 04:27:37.588947',47,NULL,15),(637,'이거예뻐워',2,'2021-03-26 04:27:37.589952',25,NULL,20),(638,'이벤트해주세요',4,'2021-03-26 04:27:37.590936',4,NULL,17),(639,'핵귀',2,'2021-03-26 04:27:37.592077',19,NULL,15),(640,'공부 열심히 하자',1,'2021-03-26 04:27:37.593282',50,NULL,20),(641,'구독',1,'2021-03-26 04:27:37.594357',42,NULL,18),(642,'더 보고싶은데 ㅜㅜ',5,'2021-03-26 04:27:37.595600',21,NULL,18),(643,'벌써 끝이라니',0,'2021-03-26 04:27:37.597099',26,NULL,18),(644,'아앙',2,'2021-03-26 04:27:37.598167',44,NULL,20),(645,'알람설정',1,'2021-03-26 04:27:37.599240',31,NULL,18),(646,'앞으로 더욱 친하게 지내요',5,'2021-03-26 04:27:37.600224',55,NULL,16),(647,'오신기하다',0,'2021-03-26 04:27:37.601198',15,NULL,19),(648,'잉?',3,'2021-03-26 04:27:37.602151',36,NULL,16),(649,'좋아요',3,'2021-03-26 04:27:37.603196',24,NULL,18),(650,'굳굳굳',1,'2021-03-26 04:27:37.604409',30,NULL,16),(651,'귀여워',2,'2021-03-26 04:27:37.605522',52,NULL,20),(652,'귀엽다',3,'2021-03-26 04:27:37.606534',5,NULL,18),(653,'냠냠',1,'2021-03-26 04:27:37.607720',59,NULL,18),(654,'네',1,'2021-03-26 04:27:37.608681',12,NULL,17),(655,'모샃ㅁ겠다',4,'2021-03-26 04:27:37.609884',59,NULL,20),(656,'브런치먹을사람?',3,'2021-03-26 04:27:37.611200',6,NULL,16),(657,'아니에요',1,'2021-03-26 04:27:37.612307',8,NULL,16),(658,'어피치',2,'2021-03-26 04:27:37.613376',8,NULL,20),(659,'우리와 같이살자',2,'2021-03-26 04:27:37.614542',44,NULL,17),(660,'좋네요',5,'2021-03-26 04:27:37.615713',27,NULL,20),(661,'같고싶다',1,'2021-03-26 04:27:37.616921',17,NULL,17),(662,'대박귀여워',4,'2021-03-26 04:27:37.618413',37,NULL,15),(663,'맛있겠다',0,'2021-03-26 04:27:37.619739',18,NULL,16),(664,'사고싶당',2,'2021-03-26 04:27:37.620972',57,NULL,20),(665,'사진찍어',0,'2021-03-26 04:27:37.622023',53,NULL,18),(666,'엄청 귀여워요',2,'2021-03-26 04:27:37.623031',37,NULL,18),(667,'오귀엽',0,'2021-03-26 04:27:37.624082',51,NULL,16),(668,'이거예뻐워',2,'2021-03-26 04:27:37.625128',45,NULL,15),(669,'이벤트해주세요',2,'2021-03-26 04:27:37.626314',38,NULL,18),(670,'핵귀',2,'2021-03-26 04:27:37.627688',1,NULL,16),(671,'공부 열심히 하자',1,'2021-03-26 04:27:37.628805',25,NULL,15),(672,'구독',2,'2021-03-26 04:27:37.629851',46,NULL,19),(673,'냠냠',2,'2021-03-26 04:27:37.630936',53,NULL,19),(674,'더 보고싶은데 ㅜㅜ',0,'2021-03-26 04:27:37.632024',48,NULL,19),(675,'벌써 끝이라니',3,'2021-03-26 04:27:37.633038',39,NULL,19),(676,'아앙',2,'2021-03-26 04:27:37.634272',13,NULL,15),(677,'알람설정',0,'2021-03-26 04:27:37.635314',46,NULL,19),(678,'오신기하다',1,'2021-03-26 04:27:37.636307',23,NULL,20),(679,'잉?',1,'2021-03-26 04:27:37.637417',47,NULL,17),(680,'좋아요',1,'2021-03-26 04:27:37.638625',53,NULL,19),(681,'귀여워',1,'2021-03-26 04:27:37.639744',29,NULL,15),(682,'귀엽다',5,'2021-03-26 04:27:37.640860',30,NULL,19),(683,'냠냠',1,'2021-03-26 04:27:37.642062',3,NULL,20),(684,'네',4,'2021-03-26 04:27:37.643061',50,NULL,18),(685,'모샃ㅁ겠다',0,'2021-03-26 04:27:37.644257',19,NULL,15),(686,'브런치먹을사람?',2,'2021-03-26 04:27:37.645279',54,NULL,17),(687,'아니에요',1,'2021-03-26 04:27:37.646254',42,NULL,17),(688,'앞으로 더욱 친하게 지내요',5,'2021-03-26 04:27:37.647254',8,NULL,17),(689,'어피치',5,'2021-03-26 04:27:37.648291',35,NULL,15),(690,'우리와 같이살자',2,'2021-03-26 04:27:37.649539',50,NULL,18);
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply_likes`
--

DROP TABLE IF EXISTS `reply_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reply_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_likes_reply_id_752d0176_fk_replies_id` (`reply_id`),
  KEY `reply_likes_user_id_cddae393_fk_users_id` (`user_id`),
  CONSTRAINT `reply_likes_reply_id_752d0176_fk_replies_id` FOREIGN KEY (`reply_id`) REFERENCES `replies` (`id`),
  CONSTRAINT `reply_likes_user_id_cddae393_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_likes`
--

LOCK TABLES `reply_likes` WRITE;
/*!40000 ALTER TABLE `reply_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_likes`
--

DROP TABLE IF EXISTS `review_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `review_likes_review_id_5eb31dcf_fk_reviews_id` (`review_id`),
  KEY `review_likes_user_id_fea3a517_fk_users_id` (`user_id`),
  CONSTRAINT `review_likes_review_id_5eb31dcf_fk_reviews_id` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  CONSTRAINT `review_likes_user_id_fea3a517_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_likes`
--

LOCK TABLES `review_likes` WRITE;
/*!40000 ALTER TABLE `review_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `like_count` int NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_d4b78cfe_fk_products_id` (`product_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_product_id_d4b78cfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,5,'2021-03-26 04:28:00.005797',1,'좋아요',34,15),(2,4,'2021-03-26 04:28:00.010607',3,'최고에요',60,16),(3,3,'2021-03-26 04:28:00.012862',1,'그저그래요',25,17),(4,5,'2021-03-26 04:28:00.015388',0,'짱이에요',3,18),(5,3,'2021-03-26 04:28:00.017501',3,'쏘쏘',25,19),(6,4,'2021-03-26 04:28:00.019640',1,'짱짱맨',25,20),(7,2,'2021-03-26 04:28:00.021707',1,'구려요',42,15),(8,4,'2021-03-26 04:28:00.023605',4,'나이스',43,16),(9,5,'2021-03-26 04:28:00.025357',4,'퍼펙트',18,17),(10,5,'2021-03-26 04:28:00.028448',1,'아주좋아요',32,18),(11,5,'2021-03-26 04:28:00.030771',2,'좋아요',17,19),(12,4,'2021-03-26 04:28:00.032258',2,'최고에요',45,20),(13,3,'2021-03-26 04:28:00.033940',4,'그저그래요',39,15),(14,5,'2021-03-26 04:28:00.035868',0,'짱이에요',43,16),(15,3,'2021-03-26 04:28:00.038090',4,'쏘쏘',20,17),(16,4,'2021-03-26 04:28:00.040054',1,'짱짱맨',62,18),(17,2,'2021-03-26 04:28:00.041845',2,'구려요',18,19),(18,4,'2021-03-26 04:28:00.043908',1,'나이스',49,20),(19,5,'2021-03-26 04:28:00.045563',1,'퍼펙트',4,15),(20,5,'2021-03-26 04:28:00.047461',1,'아주좋아요',48,16),(21,5,'2021-03-26 04:28:00.049371',2,'좋아요',35,17),(22,4,'2021-03-26 04:28:00.051299',3,'최고에요',40,18),(23,3,'2021-03-26 04:28:00.053446',2,'그저그래요',58,19),(24,5,'2021-03-26 04:28:00.055244',2,'짱이에요',49,20),(25,3,'2021-03-26 04:28:00.057021',3,'쏘쏘',23,15),(26,4,'2021-03-26 04:28:00.058954',3,'짱짱맨',59,16),(27,2,'2021-03-26 04:28:00.060622',1,'구려요',59,17),(28,4,'2021-03-26 04:28:00.062562',3,'나이스',12,18),(29,5,'2021-03-26 04:28:00.064758',2,'퍼펙트',27,19),(30,5,'2021-03-26 04:28:00.066626',1,'아주좋아요',26,20),(31,5,'2021-03-26 04:28:00.068615',1,'좋아요',15,15),(32,4,'2021-03-26 04:28:00.070882',2,'최고에요',63,16),(33,3,'2021-03-26 04:28:00.073060',2,'그저그래요',7,17),(34,5,'2021-03-26 04:28:00.075294',2,'짱이에요',31,18),(35,3,'2021-03-26 04:28:00.077298',1,'쏘쏘',55,19),(36,4,'2021-03-26 04:28:00.079549',5,'짱짱맨',33,20),(37,2,'2021-03-26 04:28:00.082123',0,'구려요',27,15),(38,4,'2021-03-26 04:28:00.084320',0,'나이스',10,16),(39,5,'2021-03-26 04:28:00.086535',5,'퍼펙트',42,17),(40,5,'2021-03-26 04:28:00.088519',3,'아주좋아요',18,18),(41,5,'2021-03-26 04:28:00.089959',1,'좋아요',19,19),(42,4,'2021-03-26 04:28:00.091756',3,'최고에요',61,20),(43,3,'2021-03-26 04:28:00.094184',5,'그저그래요',56,15),(44,5,'2021-03-26 04:28:00.096040',2,'짱이에요',27,16),(45,3,'2021-03-26 04:28:00.097878',0,'쏘쏘',47,17),(46,4,'2021-03-26 04:28:00.099542',0,'짱짱맨',63,18),(47,2,'2021-03-26 04:28:00.101474',6,'구려요',30,19),(48,4,'2021-03-26 04:28:00.103450',3,'나이스',14,20),(49,5,'2021-03-26 04:28:00.105463',2,'퍼펙트',20,15),(50,5,'2021-03-26 04:28:00.107185',0,'아주좋아요',33,16),(51,5,'2021-03-26 04:28:00.108495',0,'좋아요',33,17),(52,4,'2021-03-26 04:28:00.109907',2,'최고에요',43,18),(53,3,'2021-03-26 04:28:00.111281',2,'그저그래요',2,19),(54,5,'2021-03-26 04:28:00.112828',2,'짱이에요',23,20),(55,3,'2021-03-26 04:28:00.114110',3,'쏘쏘',61,15),(56,4,'2021-03-26 04:28:00.115308',1,'짱짱맨',36,16),(57,2,'2021-03-26 04:28:00.116663',1,'구려요',36,17),(58,4,'2021-03-26 04:28:00.118058',3,'나이스',35,18),(59,5,'2021-03-26 04:28:00.119258',5,'퍼펙트',9,19),(60,5,'2021-03-26 04:28:00.120426',0,'아주좋아요',33,20),(61,5,'2021-03-26 04:28:00.121687',4,'좋아요',43,15),(62,4,'2021-03-26 04:28:00.122848',0,'최고에요',23,16),(63,3,'2021-03-26 04:28:00.124010',2,'그저그래요',20,17),(64,5,'2021-03-26 04:28:00.125142',0,'짱이에요',38,18),(65,3,'2021-03-26 04:28:00.126318',4,'쏘쏘',6,19),(66,4,'2021-03-26 04:28:00.127555',2,'짱짱맨',26,20),(67,2,'2021-03-26 04:28:00.128741',2,'구려요',46,15),(68,4,'2021-03-26 04:28:00.130012',2,'나이스',8,16),(69,5,'2021-03-26 04:28:00.131192',0,'퍼펙트',31,17),(70,5,'2021-03-26 04:28:00.132293',1,'아주좋아요',22,18),(71,5,'2021-03-26 04:28:00.133360',2,'좋아요',13,19),(72,4,'2021-03-26 04:28:00.134596',2,'최고에요',35,20),(73,3,'2021-03-26 04:28:00.135690',3,'그저그래요',49,15),(74,5,'2021-03-26 04:28:00.136782',1,'짱이에요',52,16),(75,3,'2021-03-26 04:28:00.137849',1,'쏘쏘',35,17),(76,4,'2021-03-26 04:28:00.139100',1,'짱짱맨',51,18),(77,2,'2021-03-26 04:28:00.140180',2,'구려요',14,19),(78,4,'2021-03-26 04:28:00.141210',2,'나이스',40,20),(79,5,'2021-03-26 04:28:00.142311',5,'퍼펙트',41,15),(80,5,'2021-03-26 04:28:00.143345',0,'아주좋아요',24,16),(81,5,'2021-03-26 04:28:00.144369',1,'좋아요',25,17),(82,4,'2021-03-26 04:28:00.145349',1,'최고에요',61,18),(83,3,'2021-03-26 04:28:00.146389',2,'그저그래요',61,19),(84,5,'2021-03-26 04:28:00.147395',3,'짱이에요',52,20),(85,3,'2021-03-26 04:28:00.148580',2,'쏘쏘',37,15),(86,4,'2021-03-26 04:28:00.149634',1,'짱짱맨',29,16),(87,2,'2021-03-26 04:28:00.150727',3,'구려요',53,17),(88,4,'2021-03-26 04:28:00.151791',3,'나이스',37,18),(89,5,'2021-03-26 04:28:00.152818',3,'퍼펙트',8,19),(90,5,'2021-03-26 04:28:00.153787',3,'아주좋아요',16,20),(91,5,'2021-03-26 04:28:00.154944',2,'좋아요',1,15),(92,4,'2021-03-26 04:28:00.155906',1,'최고에요',8,16),(93,3,'2021-03-26 04:28:00.156884',4,'그저그래요',38,17),(94,5,'2021-03-26 04:28:00.158223',1,'짱이에요',30,18),(95,3,'2021-03-26 04:28:00.159437',2,'쏘쏘',28,19),(96,4,'2021-03-26 04:28:00.160473',0,'짱짱맨',41,20),(97,2,'2021-03-26 04:28:00.161515',2,'구려요',47,15),(98,4,'2021-03-26 04:28:00.162542',3,'나이스',25,16),(99,5,'2021-03-26 04:28:00.163699',2,'퍼펙트',7,17),(100,5,'2021-03-26 04:28:00.164696',4,'아주좋아요',44,18),(101,5,'2021-03-26 04:28:00.165706',2,'좋아요',32,19),(102,4,'2021-03-26 04:28:00.166694',5,'최고에요',50,20),(103,3,'2021-03-26 04:28:00.167734',1,'그저그래요',2,15),(104,5,'2021-03-26 04:28:00.168757',2,'짱이에요',34,16),(105,3,'2021-03-26 04:28:00.169771',2,'쏘쏘',54,17),(106,4,'2021-03-26 04:28:00.170745',1,'짱짱맨',3,18),(107,2,'2021-03-26 04:28:00.171731',0,'구려요',7,19),(108,4,'2021-03-26 04:28:00.172934',2,'나이스',57,20),(109,5,'2021-03-26 04:28:00.173995',0,'퍼펙트',52,15),(110,5,'2021-03-26 04:28:00.174975',4,'아주좋아요',25,16),(111,5,'2021-03-26 04:28:00.175920',0,'좋아요',12,17),(112,4,'2021-03-26 04:28:00.176926',2,'최고에요',38,18),(113,3,'2021-03-26 04:28:00.177894',1,'그저그래요',63,19),(114,5,'2021-03-26 04:28:00.178879',1,'짱이에요',28,20),(115,3,'2021-03-26 04:28:00.179855',3,'쏘쏘',49,15),(116,4,'2021-03-26 04:28:00.180768',1,'짱짱맨',39,16),(117,2,'2021-03-26 04:28:00.181723',3,'구려요',55,17),(118,4,'2021-03-26 04:28:00.182661',1,'나이스',60,18),(119,5,'2021-03-26 04:28:00.183675',1,'퍼펙트',27,19),(120,5,'2021-03-26 04:28:00.184595',2,'아주좋아요',17,20),(121,5,'2021-03-26 04:28:00.185600',1,'좋아요',51,15),(122,4,'2021-03-26 04:28:00.186565',4,'최고에요',48,16),(123,3,'2021-03-26 04:28:00.187725',4,'그저그래요',2,17),(124,5,'2021-03-26 04:28:00.188675',2,'짱이에요',5,18),(125,3,'2021-03-26 04:28:00.189622',5,'쏘쏘',42,19),(126,4,'2021-03-26 04:28:00.190590',1,'짱짱맨',51,20),(127,2,'2021-03-26 04:28:00.191627',4,'구려요',39,15),(128,4,'2021-03-26 04:28:00.192803',0,'나이스',55,16),(129,5,'2021-03-26 04:28:00.193762',3,'퍼펙트',33,17),(130,5,'2021-03-26 04:28:00.194739',1,'아주좋아요',56,18),(131,5,'2021-03-26 04:28:00.195699',2,'좋아요',15,19),(132,4,'2021-03-26 04:28:00.196860',1,'최고에요',23,20),(133,3,'2021-03-26 04:28:00.197838',1,'그저그래요',20,15),(134,5,'2021-03-26 04:28:00.198777',3,'짱이에요',53,16),(135,3,'2021-03-26 04:28:00.199750',2,'쏘쏘',3,17),(136,4,'2021-03-26 04:28:00.200690',4,'짱짱맨',5,18),(137,2,'2021-03-26 04:28:00.201713',3,'구려요',41,19),(138,4,'2021-03-26 04:28:00.202703',3,'나이스',12,20),(139,5,'2021-03-26 04:28:00.203644',2,'퍼펙트',20,15),(140,5,'2021-03-26 04:28:00.204662',3,'아주좋아요',51,16),(141,5,'2021-03-26 04:28:00.205645',2,'좋아요',29,17),(142,4,'2021-03-26 04:28:00.206575',1,'최고에요',56,18),(143,3,'2021-03-26 04:28:00.207588',0,'그저그래요',17,19),(144,5,'2021-03-26 04:28:00.208535',0,'짱이에요',13,20),(145,3,'2021-03-26 04:28:00.209492',1,'쏘쏘',18,15),(146,4,'2021-03-26 04:28:00.210468',3,'짱짱맨',6,16),(147,2,'2021-03-26 04:28:00.211424',1,'구려요',40,17),(148,4,'2021-03-26 04:28:00.212376',0,'나이스',17,18),(149,5,'2021-03-26 04:28:00.213327',3,'퍼펙트',21,19),(150,5,'2021-03-26 04:28:00.214273',3,'아주좋아요',25,20),(151,5,'2021-03-26 04:28:00.215196',1,'좋아요',21,15),(152,4,'2021-03-26 04:28:00.216152',0,'최고에요',63,16),(153,3,'2021-03-26 04:28:00.217059',2,'그저그래요',33,17),(154,5,'2021-03-26 04:28:00.217980',4,'짱이에요',56,18),(155,3,'2021-03-26 04:28:00.219191',3,'쏘쏘',6,19),(156,4,'2021-03-26 04:28:00.225801',1,'짱짱맨',14,20),(157,2,'2021-03-26 04:28:00.227642',3,'구려요',41,15),(158,4,'2021-03-26 04:28:00.229151',4,'나이스',25,16),(159,5,'2021-03-26 04:28:00.230616',2,'퍼펙트',12,17),(160,5,'2021-03-26 04:28:00.232015',4,'아주좋아요',3,18),(161,5,'2021-03-26 04:28:00.233276',2,'좋아요',57,19),(162,4,'2021-03-26 04:28:00.234371',1,'최고에요',8,20),(163,3,'2021-03-26 04:28:00.235368',2,'그저그래요',5,15),(164,5,'2021-03-26 04:28:00.236465',2,'짱이에요',12,16),(165,3,'2021-03-26 04:28:00.237632',2,'쏘쏘',28,17),(166,4,'2021-03-26 04:28:00.238723',3,'짱짱맨',49,18),(167,2,'2021-03-26 04:28:00.240067',0,'구려요',60,19),(168,4,'2021-03-26 04:28:00.241753',2,'나이스',26,20),(169,5,'2021-03-26 04:28:00.243573',1,'퍼펙트',60,15),(170,5,'2021-03-26 04:28:00.245284',0,'아주좋아요',50,16),(171,5,'2021-03-26 04:28:00.246848',1,'좋아요',40,17),(172,4,'2021-03-26 04:28:00.248304',4,'최고에요',24,18),(173,3,'2021-03-26 04:28:00.249670',2,'그저그래요',3,19),(174,5,'2021-03-26 04:28:00.250894',1,'짱이에요',10,20),(175,3,'2021-03-26 04:28:00.252416',2,'쏘쏘',19,15),(176,4,'2021-03-26 04:28:00.255792',3,'짱짱맨',49,16),(177,2,'2021-03-26 04:28:00.257753',1,'구려요',18,17),(178,4,'2021-03-26 04:28:00.260313',1,'나이스',52,18),(179,5,'2021-03-26 04:28:00.262823',2,'퍼펙트',51,19),(180,5,'2021-03-26 04:28:00.264927',3,'아주좋아요',32,20),(181,5,'2021-03-26 04:28:00.266809',2,'좋아요',17,15),(182,4,'2021-03-26 04:28:00.268523',2,'최고에요',38,16),(183,3,'2021-03-26 04:28:00.270641',4,'그저그래요',36,17),(184,5,'2021-03-26 04:28:00.272877',2,'짱이에요',24,18),(185,3,'2021-03-26 04:28:00.274538',0,'쏘쏘',38,19),(186,4,'2021-03-26 04:28:00.276212',3,'짱짱맨',53,20),(187,2,'2021-03-26 04:28:00.278043',1,'구려요',9,15),(188,4,'2021-03-26 04:28:00.279619',1,'나이스',39,16),(189,5,'2021-03-26 04:28:00.281620',3,'퍼펙트',30,17),(190,5,'2021-03-26 04:28:00.283597',2,'아주좋아요',47,18),(191,5,'2021-03-26 04:28:00.285315',3,'좋아요',23,19),(192,4,'2021-03-26 04:28:00.287283',2,'최고에요',39,20),(193,3,'2021-03-26 04:28:00.288977',1,'그저그래요',7,15),(194,5,'2021-03-26 04:28:00.290574',0,'짱이에요',36,16),(195,3,'2021-03-26 04:28:00.292378',2,'쏘쏘',54,17),(196,4,'2021-03-26 04:28:00.293769',1,'짱짱맨',13,18),(197,2,'2021-03-26 04:28:00.295057',1,'구려요',8,19),(198,4,'2021-03-26 04:28:00.296672',1,'나이스',13,20),(199,5,'2021-03-26 04:28:00.299681',5,'퍼펙트',19,15),(200,5,'2021-03-26 04:28:00.301105',4,'아주좋아요',55,16),(201,5,'2021-03-26 04:28:00.302502',2,'좋아요',60,17),(202,4,'2021-03-26 04:28:00.303771',2,'최고에요',29,18),(203,3,'2021-03-26 04:28:00.305441',3,'그저그래요',42,19),(204,5,'2021-03-26 04:28:00.306834',3,'짱이에요',46,20),(205,3,'2021-03-26 04:28:00.308500',2,'쏘쏘',1,15),(206,4,'2021-03-26 04:28:00.312345',1,'짱짱맨',48,16),(207,2,'2021-03-26 04:28:00.314730',2,'구려요',3,17),(208,4,'2021-03-26 04:28:00.316225',1,'나이스',27,18),(209,5,'2021-03-26 04:28:00.317879',0,'퍼펙트',20,19),(210,5,'2021-03-26 04:28:00.319475',2,'아주좋아요',18,20),(211,5,'2021-03-26 04:28:00.321275',4,'좋아요',39,15),(212,4,'2021-03-26 04:28:00.323297',2,'최고에요',9,16),(213,3,'2021-03-26 04:28:00.325119',3,'그저그래요',20,17),(214,5,'2021-03-26 04:28:00.327077',3,'짱이에요',15,18),(215,3,'2021-03-26 04:28:00.328489',2,'쏘쏘',54,19),(216,4,'2021-03-26 04:28:00.330633',4,'짱짱맨',51,20),(217,2,'2021-03-26 04:28:00.333297',3,'구려요',10,15),(218,4,'2021-03-26 04:28:00.334854',2,'나이스',11,16),(219,5,'2021-03-26 04:28:00.336231',1,'퍼펙트',34,17),(220,5,'2021-03-26 04:28:00.337817',1,'아주좋아요',12,18),(221,5,'2021-03-26 04:28:00.339723',2,'좋아요',37,19),(222,4,'2021-03-26 04:28:00.345318',4,'최고에요',15,20),(223,3,'2021-03-26 04:28:00.347573',1,'그저그래요',47,15),(224,5,'2021-03-26 04:28:00.349280',2,'짱이에요',50,16),(225,3,'2021-03-26 04:28:00.350622',1,'쏘쏘',15,17),(226,4,'2021-03-26 04:28:00.351904',4,'짱짱맨',20,18),(227,2,'2021-03-26 04:28:00.353641',2,'구려요',60,19),(228,4,'2021-03-26 04:28:00.355853',4,'나이스',44,20),(229,5,'2021-03-26 04:28:00.357517',3,'퍼펙트',9,15),(230,5,'2021-03-26 04:28:00.359479',2,'아주좋아요',44,16),(231,5,'2021-03-26 04:28:00.361414',3,'좋아요',54,17),(232,4,'2021-03-26 04:28:00.363560',2,'최고에요',13,18),(233,3,'2021-03-26 04:28:00.365494',4,'그저그래요',55,19),(234,5,'2021-03-26 04:28:00.367700',1,'짱이에요',51,20),(235,3,'2021-03-26 04:28:00.369744',2,'쏘쏘',1,15),(236,4,'2021-03-26 04:28:00.371513',3,'짱짱맨',63,16),(237,2,'2021-03-26 04:28:00.373390',1,'구려요',21,17),(238,4,'2021-03-26 04:28:00.375546',1,'나이스',14,18),(239,5,'2021-03-26 04:28:00.377183',5,'퍼펙트',43,19),(240,5,'2021-03-26 04:28:00.379385',1,'아주좋아요',29,20),(241,5,'2021-03-26 04:28:00.383934',6,'좋아요',61,15),(242,4,'2021-03-26 04:28:00.386405',1,'최고에요',45,16),(243,3,'2021-03-26 04:28:00.388708',0,'그저그래요',15,17),(244,5,'2021-03-26 04:28:00.391509',1,'짱이에요',49,18),(245,3,'2021-03-26 04:28:00.393868',3,'쏘쏘',56,19),(246,4,'2021-03-26 04:28:00.395991',2,'짱짱맨',52,20),(247,2,'2021-03-26 04:28:00.398162',3,'구려요',40,15),(248,4,'2021-03-26 04:28:00.401459',1,'나이스',22,16),(249,5,'2021-03-26 04:28:00.403698',2,'퍼펙트',5,17),(250,5,'2021-03-26 04:28:00.406278',1,'아주좋아요',14,18),(251,5,'2021-03-26 04:28:00.408199',2,'좋아요',48,19),(252,4,'2021-03-26 04:28:00.410240',2,'최고에요',9,20),(253,3,'2021-03-26 04:28:00.412932',2,'그저그래요',52,15),(254,5,'2021-03-26 04:28:00.414818',1,'짱이에요',5,16),(255,3,'2021-03-26 04:28:00.416848',4,'쏘쏘',47,17),(256,4,'2021-03-26 04:28:00.418756',3,'짱짱맨',24,18),(257,2,'2021-03-26 04:28:00.420392',1,'구려요',22,19),(258,4,'2021-03-26 04:28:00.422406',1,'나이스',58,20),(259,5,'2021-03-26 04:28:00.424640',4,'퍼펙트',36,15),(260,5,'2021-03-26 04:28:00.427619',2,'아주좋아요',49,16),(261,5,'2021-03-26 04:28:00.429421',3,'좋아요',46,17),(262,4,'2021-03-26 04:28:00.431183',3,'최고에요',62,18),(263,3,'2021-03-26 04:28:00.433291',1,'그저그래요',5,19),(264,5,'2021-03-26 04:28:00.435122',1,'짱이에요',36,20),(265,3,'2021-03-26 04:28:00.437105',4,'쏘쏘',7,15),(266,4,'2021-03-26 04:28:00.438750',1,'짱짱맨',29,16),(267,2,'2021-03-26 04:28:00.440479',0,'구려요',7,17),(268,4,'2021-03-26 04:28:00.442292',3,'나이스',58,18),(269,5,'2021-03-26 04:28:00.443749',2,'퍼펙트',63,19),(270,5,'2021-03-26 04:28:00.445022',3,'퍼펙트',12,20);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `condition` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sub_categories_category_id_dc42080e_fk_categories_id` (`category_id`),
  CONSTRAINT `sub_categories_category_id_dc42080e_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'피치피치X에스더버니',1),(2,'러블리 어피치',1),(3,'얌얌프렌즈',1),(4,'레몬테라스',1),(5,'베이비드리밍',1),(6,'해피위크',1),(7,'강다니엘 에디션',1),(8,'미니인형',2),(9,'중형인형',2),(10,'대형인형',2),(11,'키체인인형',2),(12,'피규어/브릭',2),(13,'쿠션/방석',3),(14,'컵/텀블러',3),(15,'주방용품',3),(16,'미용/욕실용품',3),(17,'생활소품/잡화',3),(18,'탈취/방향제',3),(19,'신발',4),(20,'파우치/지갑/가방',4),(21,'패션소품',4),(22,'우산',4),(23,'시즌잡화',4),(24,'필기구',5),(25,'필통/케이스',5),(26,'노트/메모',5),(27,'파일',5),(28,'스티커',5),(29,'데스크 소품',5),(30,'카드/엽서',5),(31,'여성복',6),(32,'남성복',6),(33,'양말',6),(34,'여성잠옷',7),(35,'남성잠옷',7),(36,'키즈',7),(37,'여행',8),(38,'레져',8),(39,'노트북 액세서리',9),(40,'소형 전자',9),(41,'에어팟 케이스',9),(42,'에어팟 액세서리',9),(43,'휴대폰 케이스',10),(44,'휴대폰 액세서리',10),(45,'충전기',10),(46,'스낵',11),(47,'음료',11);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `status_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `credit_card_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_address_id_00bad6fb_fk_addresses_id` (`address_id`),
  KEY `transactions_credit_card_id_a7763267_fk_credit_cards_id` (`credit_card_id`),
  KEY `transactions_user_id_766cc893_fk_users_id` (`user_id`),
  KEY `transactions_status_id_3cc9c580` (`status_id`),
  CONSTRAINT `transactions_address_id_00bad6fb_fk_addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `transactions_credit_card_id_a7763267_fk_credit_cards_id` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_cards` (`id`),
  CONSTRAINT `transactions_status_id_3cc9c580_fk_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `transactions_user_id_766cc893_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `profile_picture_url` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'아몬드','$2b$12$4VZS2frR6E8YbXbiZXcfK..T4x8VgvBwzpvoW.C7DF3Th6OTHDbCe',1,'https://i.imgur.com/g6EO7M8.jpeg','2021-03-26 04:13:43.803218','아몬드@gmail.com'),(2,'자이제','$2b$12$btkBJLqTlxOzHI0M1VnWguPH3/XKZJyQahWx0wxq.V0azutk.hciK',1,'https://i.imgur.com/SmnwZ5k.jpeg','2021-03-26 04:13:44.087170','자이제@gmail.com'),(3,'준식','$2b$12$YJq.RI3O676k0JWO3MaKXuGam6EO78ufadcNmkBFNHZfDoLteZQo2',1,'https://i.imgur.com/afE3B1w.jpeg','2021-03-26 04:13:44.369674','준식@gmail.com'),(4,'죠르디','$2b$12$2FU4v5GcrvWfu6Cyjkowne0F.iVJojH8AfffkrWwQjfW3pzsfcHU2',1,'https://i.imgur.com/0D7b1Gt.jpeg','2021-03-26 04:13:44.652238','죠르디@gmail.com'),(5,'칸','$2b$12$zthdjfNvyqzueN.x1T60OurEbWD0jKxOhvU/c390GKiBpZxjApq3G',1,'https://i.imgur.com/aBgta2g.jpeg','2021-03-26 04:13:44.936499','칸@gmail.com'),(6,'타이거','$2b$12$zLj7ItE0pQe/RrmpQsFzT./pU1/tE6Awd/JeV4wJ6zO.VcuOARG7i',1,'https://i.imgur.com/gS2qkRm.jpeg','2021-03-26 04:13:45.222287','타이거@gmail.com'),(7,'토끼','$2b$12$CNSwO4.xgKq9VkQt5NW6M.206vsDex/a5KxyDPIBfu7lcNR7b0B9G',1,'https://i.imgur.com/GUYCYz3.jpeg','2021-03-26 04:13:45.492309','토끼@gmail.com'),(8,'팬다어덜트','$2b$12$32AzDnV79iRjbdJcL0o6rOgrctOSGYbhJbgX1lUM4CyGdHoYyJItq',1,'https://i.imgur.com/TU1FnCc.jpeg','2021-03-26 04:13:45.756973','팬다어덜트@gmail.com'),(9,'프라다','$2b$12$0yLZ6BxstxtrVGfokaJAle52qpQmFrtz9qjrWaPP1/XuLgTGKQM.O',1,'https://imgur.com/aVZRvOM.jpeg','2021-03-26 04:13:46.036969','프라다@gmail.com'),(10,'피치피치','$2b$12$sePjCccQ9Hfho/Dt76w2lOwnoee1KhT3AwkMgsKkIogQePRwuaDpG',1,'https://i.imgur.com/nWND0Ix.jpeg','2021-03-26 04:13:46.332792','피치피치@gmail.com'),(11,'고냥이','$2b$12$2rZz364rvSrKQ3PXPil8Ue2oMex6ZkF.N.jsQNZ/2S0c6dWHnt5Ia',1,'https://i.imgur.com/Wp2Sekm.jpeg','2021-03-26 04:13:46.614869','고냥이@gmail.com'),(12,'꾀돌이','$2b$12$es.H1bwIN/qVrobes8cKHOuNSTVt6KnjHnJgwGdQu9/sRqR/Uuhqa',1,'https://i.imgur.com/zsRgvbU.jpeg','2021-03-26 04:13:46.899362','꾀돌이@gmail.com'),(13,'단무지','$2b$12$6VAMtia2LP7gRBCovuZOy.rU5Eo8h9VUqcL8eQ0ahMQeRSEmmjyL6',1,'https://i.imgur.com/9b6bpMt.jpeg','2021-03-26 04:13:47.197136','단무지@gmail.com'),(14,'두부','$2b$12$lcRvItAQ2SmuhnhC4uRTruyfA7Ow.0NnMd5MFLFO/1mnOYdEj8aW6',1,'https://i.imgur.com/Qn3dhMl.jpeg','2021-03-26 04:13:47.523371','두부@gmail.com'),(15,'이왕록','$2b$12$zDapZkomtHDRpGDDoQNFdutY0Mgo24YxMqSa4yCN/141HKws2aH4C',0,'','2021-03-26 04:13:48.062799','wanglee@wemail.com'),(16,'허정원','$2b$12$ots4NFve.QZ6in2U5txb1O8K6RNUE0A6jXVyB6ybBhSg4I67LWphe',0,'','2021-03-26 04:13:48.334358','jungwon@wemail.com'),(17,'강준우','$2b$12$Q9kCFoRxIwB/reCHVijmUugNlBatZYWxU02AeepuW7X9pSFtKsqmu',0,'','2021-03-26 04:13:48.598980','junwoo@wemail.com'),(18,'송나은','$2b$12$pjwgpUjrr97HnZJoo7rereBaWcJcjeilMzx2IqjE0/Ymk9hpRI/U2',0,'','2021-03-26 04:13:48.862266','naeun@wemail.com'),(19,'배성훈','$2b$12$CTV7CW0GpIYrheC3viDGkOZMtCB.mtpT/Djx46lOhpJ7qHnZ5h8/W',0,'','2021-03-26 04:13:49.142686','seonghoon@wemail.com'),(20,'양지은','$2b$12$lM4bq6I3Dvv6YswyKJxqZeBmJTmPP/YveZqRFBa0ZNqf6LIl4.0mq',0,'','2021-03-26 04:13:49.410985','jieun@wemail.com');
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

-- Dump completed on 2021-03-26 13:49:31
