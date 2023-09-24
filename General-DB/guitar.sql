-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 172.17.0.2    Database: product_catalog
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `acoustic_guitars`
--

DROP TABLE IF EXISTS `acoustic_guitars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acoustic_guitars` (
  `product_code` varchar(5) NOT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `neck_shape` char(1) DEFAULT NULL,
  `woods` json DEFAULT NULL,
  `num_of_frets` int DEFAULT NULL,
  `num_of_strings` int DEFAULT NULL,
  `num_of_pickups` int DEFAULT NULL,
  `pickup_type` varchar(15) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_code`),
  CONSTRAINT `acoustic_guitars_chk_1` CHECK (regexp_like(`product_code`,_utf8mb4'^#[A-Z]\\d[A-Z]\\d$')),
  CONSTRAINT `acoustic_guitars_chk_2` CHECK (((`neck_shape` >= _utf8mb4'A') and (`neck_shape` <= _utf8mb4'Z'))),
  CONSTRAINT `acoustic_guitars_chk_3` CHECK (((`num_of_frets` >= 15) and (`num_of_frets` <= 30))),
  CONSTRAINT `acoustic_guitars_chk_4` CHECK (((`num_of_strings` >= 4) and (`num_of_strings` <= 12))),
  CONSTRAINT `acoustic_guitars_chk_5` CHECK (((`num_of_pickups` >= 0) and (`num_of_pickups` <= 5))),
  CONSTRAINT `acoustic_guitars_chk_6` CHECK (((`price` >= 0) and (`price` <= 100000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acoustic_guitars`
--

LOCK TABLES `acoustic_guitars` WRITE;
/*!40000 ALTER TABLE `acoustic_guitars` DISABLE KEYS */;
INSERT INTO `acoustic_guitars` VALUES ('#A2A3','Taylor','Baby Taylor','D','{\"top\": \"Maple\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Ebony\"}',20,6,1,'Piezo',1500,0),('#D1A1','Taylor','Grand Concert','C','{\"top\": \"Sitka Spruce\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Ebony\"}',20,6,0,'',1999,0),('#G2A1','Washburn','WD7S','D','{\"top\": \"Maple\", \"body\": \"Mahogany\", \"neck\": \"Maple\", \"fretboard\": \"Rosewood\"}',20,6,1,'',1000,0),('#Q9V4','Epiphone','Jumbo','C','{\"top\": \"Maple\", \"body\": \"Maple\", \"neck\": \"Mahagony\", \"fretboard\": \"Rosewood\"}',18,6,0,'Piezo',1500,0),('#S9V1','Gibson','J-35','C','{\"top\": \"Maple\", \"body\": \"Mahagony\", \"neck\": \"Mahogany\", \"fretboard\": \"Rosewood\"}',20,12,1,'P90',5000,0);
/*!40000 ALTER TABLE `acoustic_guitars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_insert_product` AFTER INSERT ON `acoustic_guitars` FOR EACH ROW INSERT INTO product_catalog.all_products (product_code, brand, model)
VALUES (NEW.product_code, NEW.brand, NEW.model) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `all_products`
--

DROP TABLE IF EXISTS `all_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_products` (
  `product_code` varchar(5) NOT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`product_code`),
  CONSTRAINT `all_products_chk_1` CHECK (regexp_like(`product_code`,_utf8mb4'^#[A-Z]\\d[A-Z]\\d$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_products`
--

LOCK TABLES `all_products` WRITE;
/*!40000 ALTER TABLE `all_products` DISABLE KEYS */;
INSERT INTO `all_products` VALUES ('#A1A1','Cordoba','GB32'),('#A1F1','Gibson','Les Paul'),('#A2A1','Fender','Stratocaster'),('#A3A1','Gibson','SG'),('#B1B1','Fender','Precision'),('#B1B2','Guild','Starfire I'),('#B6G4','Fender','Jazzmaster'),('#C1C1','Cordoba','C7'),('#C3F3','Epiphone','SG'),('#D1A1','Taylor','Grand Concert'),('#G2A1','Washburn','WD7S'),('#G5A5','Fender','adf123'),('#G7Y1','Gibson','SlitySlide'),('#H2B5','Squire','Stratocaster '),('#J5I2','Gibson','Flying V'),('#J9U3','Fender','Telecaster'),('#N2J2','Fender','חראדבר '),('#Q9V4','Epiphone','Jumbo'),('#R6L1','Gibson','Les Paul Studio'),('#S3A4','Fender','Jazz Bass'),('#S9V1','Gibson','J-35'),('#T3B1','Fender','FT-100'),('#T3B2','Dunlop','G123'),('#U7P4','Ibanez','GRG121DX'),('#Y5B2','Gibson','Les Paul Studio'),('#Z3F5','Epiphone','SG'),('#Z6S6','Gibson','Jazz Bass'),('#Z8J1','Admira','Paloma');
/*!40000 ALTER TABLE `all_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bass_guitars`
--

DROP TABLE IF EXISTS `bass_guitars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bass_guitars` (
  `product_code` varchar(5) NOT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `type_` varchar(15) DEFAULT NULL,
  `neck_shape` char(1) DEFAULT NULL,
  `woods` json DEFAULT NULL,
  `num_of_frets` int DEFAULT NULL,
  `num_of_strings` int DEFAULT NULL,
  `num_of_pickups` int DEFAULT NULL,
  `pickup_type` varchar(15) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_code`),
  CONSTRAINT `bass_guitars_chk_1` CHECK (regexp_like(`product_code`,_utf8mb4'^#[A-Z]\\d[A-Z]\\d$')),
  CONSTRAINT `bass_guitars_chk_2` CHECK (((`type_` = _utf8mb4'acoustic') or (`type_` = _utf8mb4'electric'))),
  CONSTRAINT `bass_guitars_chk_3` CHECK (((`neck_shape` >= _utf8mb4'A') and (`neck_shape` <= _utf8mb4'Z'))),
  CONSTRAINT `bass_guitars_chk_4` CHECK (((`num_of_frets` >= 15) and (`num_of_frets` <= 30))),
  CONSTRAINT `bass_guitars_chk_5` CHECK (((`num_of_strings` >= 4) and (`num_of_strings` <= 7))),
  CONSTRAINT `bass_guitars_chk_6` CHECK (((`num_of_pickups` >= 1) and (`num_of_pickups` <= 5))),
  CONSTRAINT `bass_guitars_chk_7` CHECK (((`price` >= 0) and (`price` <= 100000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bass_guitars`
--

LOCK TABLES `bass_guitars` WRITE;
/*!40000 ALTER TABLE `bass_guitars` DISABLE KEYS */;
INSERT INTO `bass_guitars` VALUES ('#B1B1','Fender','Precision','electric','C','{\"body\": \"Alder\", \"neck\": \"Maple\", \"fretboard\": \"Rosewood\"}',20,4,2,'Single Coil',1499,1),('#B1B2','Guild','Starfire I','electric','U','{\"body\": \"Maple\", \"neck\": \"Mahagony\", \"fretboard\": \"Indian Rosewood\"}',20,4,2,'Single Coil',1500,0),('#S3A4','Fender','Jazz Bass','electric','D','{\"body\": \"Alder\", \"neck\": \"Maple\", \"fretboard\": \"Rosewood\"}',20,4,2,'Single Coil',6000,0),('#Z6S6','Fender','Jazz Bass','Electric','C','{\"top\": \"Maple\", \"body\": \"Mahagony\", \"neck\": \"Mahagony\", \"fretboard\": \"Rosewood\"}',18,5,2,'Single Coil',2000,0);
/*!40000 ALTER TABLE `bass_guitars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_insert_productb` AFTER INSERT ON `bass_guitars` FOR EACH ROW INSERT INTO product_catalog.all_products (product_code, brand, model)
VALUES (NEW.product_code, NEW.brand, NEW.model) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `classical_guitars`
--

DROP TABLE IF EXISTS `classical_guitars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classical_guitars` (
  `product_code` varchar(5) NOT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `neck_shape` char(1) DEFAULT NULL,
  `woods` json DEFAULT NULL,
  `num_of_frets` int DEFAULT NULL,
  `num_of_strings` int DEFAULT NULL,
  `num_of_pickups` int DEFAULT NULL,
  `pickup_type` varchar(15) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_code`),
  CONSTRAINT `classical_guitars_chk_1` CHECK (regexp_like(`product_code`,_utf8mb4'^#[A-Z]\\d[A-Z]\\d$')),
  CONSTRAINT `classical_guitars_chk_2` CHECK (((`neck_shape` >= _utf8mb4'A') and (`neck_shape` <= _utf8mb4'Z'))),
  CONSTRAINT `classical_guitars_chk_3` CHECK (((`num_of_frets` >= 15) and (`num_of_frets` <= 30))),
  CONSTRAINT `classical_guitars_chk_4` CHECK (((`num_of_strings` >= 4) and (`num_of_strings` <= 9))),
  CONSTRAINT `classical_guitars_chk_6` CHECK (((`price` >= 0) and (`price` <= 100000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classical_guitars`
--

LOCK TABLES `classical_guitars` WRITE;
/*!40000 ALTER TABLE `classical_guitars` DISABLE KEYS */;
INSERT INTO `classical_guitars` VALUES ('#C1C1','Cordoba','C7','C','{\"top\": \"Cedar\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Rosewood\"}',19,6,1,'Piezo',1499,1),('#Z8J1','Admira','Paloma','D','{\"top\": \"Maple\", \"body\": \"Rosewood\", \"neck\": \"Rosewood\", \"fretboard\": \"Rosewood\"}',16,6,0,'Piezo',800,0);
/*!40000 ALTER TABLE `classical_guitars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_insert_productc` AFTER INSERT ON `classical_guitars` FOR EACH ROW INSERT INTO product_catalog.all_products (product_code, brand, model)
VALUES (NEW.product_code, NEW.brand, NEW.model) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `electric_guitars`
--

DROP TABLE IF EXISTS `electric_guitars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electric_guitars` (
  `product_code` varchar(5) NOT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `neck_shape` char(1) DEFAULT NULL,
  `woods` json DEFAULT NULL,
  `num_of_frets` int DEFAULT NULL,
  `num_of_strings` int DEFAULT NULL,
  `num_of_pickups` int DEFAULT NULL,
  `pickup_type` varchar(15) DEFAULT NULL,
  `bridge_type` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_code`),
  CONSTRAINT `electric_guitars_chk_1` CHECK (regexp_like(`product_code`,_utf8mb4'^#[A-Z]\\d[A-Z]\\d$')),
  CONSTRAINT `electric_guitars_chk_2` CHECK (((`neck_shape` >= _utf8mb4'A') and (`neck_shape` <= _utf8mb4'Z'))),
  CONSTRAINT `electric_guitars_chk_3` CHECK (((`num_of_frets` >= 15) and (`num_of_frets` <= 30))),
  CONSTRAINT `electric_guitars_chk_4` CHECK (((`num_of_strings` >= 4) and (`num_of_strings` <= 12))),
  CONSTRAINT `electric_guitars_chk_5` CHECK (((`num_of_pickups` >= 1) and (`num_of_pickups` <= 5))),
  CONSTRAINT `electric_guitars_chk_6` CHECK (((`price` >= 0) and (`price` <= 100000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_guitars`
--

LOCK TABLES `electric_guitars` WRITE;
/*!40000 ALTER TABLE `electric_guitars` DISABLE KEYS */;
INSERT INTO `electric_guitars` VALUES ('#A1F1','Gibson','Les Paul','C','{\"top\": \"Maple\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Rosewood\"}',22,6,2,'Humbucker','Tune-O-Matic',2499,0),('#A2A1','Fender','Stratocaster','C','{\"top\": \"\", \"body\": \"Alder\", \"neck\": \"Maple\", \"fretboard\": \"Rosewood\"}',22,6,2,'Humbucker','Tune-O-Matic',2499,0),('#A3A1','Gibson','SG','C','{\"top\": \"Maple\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Rosewood\"}',22,6,2,'Humbucker','Tune-O-Matic',2499,0),('#B6G4','Fender','Jazzmaster','C','{\"top\": \"Alder\", \"body\": \"Alder\", \"neck\": \"Maple\", \"fretboard\": \"Maple\"}',22,6,2,'P90','Ashtray',3500,0),('#C3F3','Epiphone','SG','D','{\"top\": \"Maple\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Rosewood\"}',22,6,NULL,NULL,'Tune-O-Matic',500,0),('#H2B5','Squire','Stratocaster ','C','{\"top\": \"Maple\", \"body\": \"Alder\", \"neck\": \"Maple\", \"fretboard\": \"Rosewood \"}',22,6,3,'Single Coil','Floyd-Rose',6000,0),('#J5I2','Gibson','Flying V','D','{\"top\": \"Maple\", \"body\": \"Mahagony\", \"neck\": \"Mahagony\", \"fretboard\": \"Rosewood\"}',22,6,2,'Humbucker','ABR1',8000,0),('#J9U3','Fender','Telecaster','C','{\"top\": \"Maple\", \"body\": \"Maple\", \"neck\": \"Maple\", \"fretboard\": \"Maple\"}',22,6,2,'Humbucker','Ashtray',4500,0),('#R6L1','Gibson','Les Paul Studio','D','{\"top\": \"Maple\", \"body\": \"Mahagony\", \"neck\": \"Mahagony\", \"fretboard\": \"Rosewood\"}',22,6,2,'Humbucker','ABR1',500,0),('#U7P4','Ibanez','GRG121DX','C','{\"top\": \"Poplar \", \"body\": \"Poplar \", \"neck\": \"Maple\", \"fretboard\": \"Purpleheart\"}',24,6,2,'Humbucker','Fixed',1150,0),('#Y5B2','Gibson','Les Paul Studio','C','{\"top\": \"Maple\", \"body\": \"Mahagony\", \"neck\": \"Mahagony\", \"fretboard\": \"Rosewood\"}',22,6,2,'Humbucker','ABR1',2500,0),('#Z3F5','Epiphone','SG','D','{\"top\": \"Maple\", \"body\": \"Mahogany\", \"neck\": \"Mahogany\", \"fretboard\": \"Rosewood\"}',22,6,NULL,NULL,'Tune-O-Matic',1000,0);
/*!40000 ALTER TABLE `electric_guitars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_insert_producte` AFTER INSERT ON `electric_guitars` FOR EACH ROW INSERT INTO product_catalog.all_products (product_code, brand, model)
VALUES (NEW.product_code, NEW.brand, NEW.model) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `other`
--

DROP TABLE IF EXISTS `other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other` (
  `product_code` varchar(5) NOT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `type_` varchar(10) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_code`),
  CONSTRAINT `other_chk_1` CHECK (regexp_like(`product_code`,_utf8mb4'^#[A-Z]\\d[A-Z]\\d$')),
  CONSTRAINT `other_chk_2` CHECK (((`price` >= 0) and (`price` <= 100000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other`
--

LOCK TABLES `other` WRITE;
/*!40000 ALTER TABLE `other` DISABLE KEYS */;
INSERT INTO `other` VALUES ('#G5A5','Fender','adf123','Capo',50,0),('#G7Y1','Gibson','SlitySlide','Slide',50,0),('#T3B1','Fender','FT-100','Tuner',29,1),('#T3B2','Dunlop','G123','Strap',50,1),('#V1A1','Cordoba','GB32','Stand',150,1);
/*!40000 ALTER TABLE `other` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_insert_productall` AFTER INSERT ON `other` FOR EACH ROW INSERT INTO product_catalog.all_products (product_code, brand, model)
VALUES (NEW.product_code, NEW.brand, NEW.model) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'product_catalog'
--

--
-- Dumping routines for database 'product_catalog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-24 18:42:25
