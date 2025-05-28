CREATE DATABASE  IF NOT EXISTS `barbearia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `barbearia`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: barbearia
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `tbl_agendamentos`
--

DROP TABLE IF EXISTS `tbl_agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_agendamentos` (
  `id_agendamento` int NOT NULL AUTO_INCREMENT,
  `data_agendamento` date NOT NULL,
  `hora_agendamento` time NOT NULL,
  `fk_cliente` int DEFAULT NULL,
  `fk_barbeiro` int DEFAULT NULL,
  `fk_servico` int DEFAULT NULL,
  PRIMARY KEY (`id_agendamento`),
  KEY `fk_cliente` (`fk_cliente`),
  KEY `fk_barbeiro` (`fk_barbeiro`),
  KEY `fk_servico` (`fk_servico`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_agendamentos`
--

LOCK TABLES `tbl_agendamentos` WRITE;
/*!40000 ALTER TABLE `tbl_agendamentos` DISABLE KEYS */;
INSERT INTO `tbl_agendamentos` VALUES (1,'2025-05-24','14:00:00',1,1,1),(2,'2025-05-24','14:30:00',2,1,2),(3,'2025-05-24','15:00:00',3,1,6),(4,'2025-05-24','16:00:00',4,1,2),(5,'2025-05-24','16:30:00',5,2,2),(6,'2025-05-24','17:00:00',6,2,2),(7,'2025-05-24','18:00:00',7,2,5),(8,'2025-05-26','13:00:00',8,2,4),(9,'2025-05-26','14:00:00',9,2,3),(10,'2025-05-26','17:00:00',10,2,2);
/*!40000 ALTER TABLE `tbl_agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_barbeiros`
--

DROP TABLE IF EXISTS `tbl_barbeiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_barbeiros` (
  `id_barbeiro` int NOT NULL AUTO_INCREMENT,
  `nome_barbeiro` varchar(100) NOT NULL,
  PRIMARY KEY (`id_barbeiro`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_barbeiros`
--

LOCK TABLES `tbl_barbeiros` WRITE;
/*!40000 ALTER TABLE `tbl_barbeiros` DISABLE KEYS */;
INSERT INTO `tbl_barbeiros` VALUES (1,'Dudu'),(2,'Kaio');
/*!40000 ALTER TABLE `tbl_barbeiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clientes`
--

DROP TABLE IF EXISTS `tbl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `tel_cliente` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
INSERT INTO `tbl_clientes` VALUES (1,'Pedro','11942057677'),(2,'Rafael','11942047566'),(3,'Giovana','11957723451'),(4,'Luis','11244572381'),(5,'Miguel','11443576281'),(6,'Murilo','11856789832'),(7,'Rafaela','11956390210'),(8,'Esthefany','11934892891'),(9,'Matheus','11945627818'),(10,'Afonso','11982747582');
/*!40000 ALTER TABLE `tbl_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_servicos`
--

DROP TABLE IF EXISTS `tbl_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_servicos` (
  `id_servico` int NOT NULL AUTO_INCREMENT,
  `nome_servico` varchar(50) NOT NULL,
  `preco_servico` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_servicos`
--

LOCK TABLES `tbl_servicos` WRITE;
/*!40000 ALTER TABLE `tbl_servicos` DISABLE KEYS */;
INSERT INTO `tbl_servicos` VALUES (1,'Corte',30.00),(2,'Barba',15.00),(3,'Corte + Barba',45.00),(4,'Sobrancelha',10.00),(5,'Luzes',80.00),(6,'Alisamento',100.00);
/*!40000 ALTER TABLE `tbl_servicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23 20:50:42
