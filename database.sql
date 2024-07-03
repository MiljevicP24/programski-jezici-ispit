-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: example_db
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `prezime` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `indeks` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `study_programme_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `uq_student_indeks` (`indeks`),
  KEY `fk_student_study_programme_idx` (`study_programme_id`),
  CONSTRAINT `fk_student_study_programme` FOREIGN KEY (`study_programme_id`) REFERENCES `study_programme` (`study_programme_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Petar','Miljevic','2023203623',1,'2024-07-02 16:54:04','2024-07-02 18:23:26',NULL),(2,'Andjela','Andjelic','2022154789',1,'2024-07-01 16:08:39',NULL,NULL),(3,'Aleksa','Aleksic','2023125476',1,'2024-07-01 16:09:03',NULL,NULL),(4,'Darko','Velickov','2017985467',1,'2024-07-02 11:37:47',NULL,NULL),(5,'Teodora','Sisic','2020632187',1,'2024-07-02 11:37:47',NULL,NULL),(6,'Lebron','James','2024568934',1,'2024-07-02 17:00:08','2024-07-02 17:00:08','2024-07-02 17:28:50'),(7,'Alex','Len','2024568936',1,'2024-07-02 16:56:45','2024-07-02 16:56:45',NULL),(8,'Rob','Pelinka','2023692137',9,'2024-07-02 16:59:04','2024-07-03 10:08:51',NULL),(10,'Alex','Lenny','2024568931',1,'2024-07-02 16:57:55','2024-07-02 16:57:55',NULL),(11,'Petar','Petrovic','2024254789',1,'2024-07-02 16:44:20',NULL,'2024-07-02 19:03:53'),(12,'Petar','Maljevic','2024203877',1,'2024-07-02 18:54:40',NULL,'2024-07-02 19:03:48'),(13,'Klay','Thompson','2024204444',9,'2024-07-03 10:21:08','2024-07-03 10:21:43',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_programme`
--

DROP TABLE IF EXISTS `study_programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_programme` (
  `study_programme_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`study_programme_id`),
  UNIQUE KEY `uq_sp_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_programme`
--

LOCK TABLES `study_programme` WRITE;
/*!40000 ALTER TABLE `study_programme` DISABLE KEYS */;
INSERT INTO `study_programme` VALUES (1,'Racunarske nauke','2024-07-02 19:45:13',NULL,NULL),(2,'Informacione tehnologije','2024-07-02 19:45:13',NULL,NULL),(3,'Softversko i informaciono inzenjerstvo','2024-07-02 19:45:13',NULL,NULL),(4,'Anglistika','2024-07-02 19:46:51',NULL,NULL),(5,'Menadzment u turizmu','2024-07-02 19:46:51',NULL,NULL),(6,'Poslovna ekonomija','2024-07-02 19:46:51',NULL,NULL),(7,'Vestacka inteligencija','2024-07-02 19:46:51',NULL,NULL),(8,'Farmacija','2024-07-02 19:46:51',NULL,NULL),(9,'Menadzment u sportu','2024-07-02 19:46:51',NULL,NULL),(10,'Fizicko vaspitanje i sport','2024-07-02 19:46:51','2024-07-02 22:09:27',NULL),(11,'Psihologija','2024-07-02 19:46:51',NULL,'2024-07-02 22:05:18'),(12,'Politikologija','2024-07-02 21:38:49',NULL,'2024-07-02 22:03:32'),(13,'Bezbednost','2024-07-02 22:03:25',NULL,'2024-07-02 22:05:15'),(14,'Sociologija','2024-07-02 22:05:33','2024-07-02 22:08:59','2024-07-02 22:09:17'),(15,'Bankarstvo','2024-07-02 22:23:41',NULL,'2024-07-02 22:23:44');
/*!40000 ALTER TABLE `study_programme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03 10:32:01
