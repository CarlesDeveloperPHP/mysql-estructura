CREATE DATABASE  IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `begudes`
--

DROP TABLE IF EXISTS `begudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `begudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_beguda` varchar(255) DEFAULT NULL,
  `id_producte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producte` (`id_producte`),
  CONSTRAINT `begudes_ibfk_1` FOREIGN KEY (`id_producte`) REFERENCES `productes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `begudes`
--

LOCK TABLES `begudes` WRITE;
/*!40000 ALTER TABLE `begudes` DISABLE KEYS */;
/*!40000 ALTER TABLE `begudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `botigues`
--

DROP TABLE IF EXISTS `botigues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botigues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adreca` varchar(255) DEFAULT NULL,
  `codi_postal` varchar(10) DEFAULT NULL,
  `localitat` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botigues`
--

LOCK TABLES `botigues` WRITE;
/*!40000 ALTER TABLE `botigues` DISABLE KEYS */;
/*!40000 ALTER TABLE `botigues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriespizzes`
--

DROP TABLE IF EXISTS `categoriespizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriespizzes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categoria` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriespizzes`
--

LOCK TABLES `categoriespizzes` WRITE;
/*!40000 ALTER TABLE `categoriespizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriespizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `cognoms` varchar(255) DEFAULT NULL,
  `adreca` varchar(255) DEFAULT NULL,
  `codi_postal` varchar(10) DEFAULT NULL,
  `localitat` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandes`
--

DROP TABLE IF EXISTS `comandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT NULL,
  `tipus_comanda` varchar(50) DEFAULT NULL,
  `preu_total` decimal(10,2) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `comandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandes`
--

LOCK TABLES `comandes` WRITE;
/*!40000 ALTER TABLE `comandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `cognoms` varchar(255) DEFAULT NULL,
  `nif` varchar(15) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `tipus_empleat` varchar(50) DEFAULT NULL,
  `id_botiga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_botiga` (`id_botiga`),
  CONSTRAINT `empleats_ibfk_1` FOREIGN KEY (`id_botiga`) REFERENCES `botigues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamburgueses`
--

DROP TABLE IF EXISTS `hamburgueses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamburgueses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_hamburguesa` varchar(255) DEFAULT NULL,
  `id_producte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producte` (`id_producte`),
  CONSTRAINT `hamburgueses_ibfk_1` FOREIGN KEY (`id_producte`) REFERENCES `productes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamburgueses`
--

LOCK TABLES `hamburgueses` WRITE;
/*!40000 ALTER TABLE `hamburgueses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hamburgueses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lliuraments`
--

DROP TABLE IF EXISTS `lliuraments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lliuraments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora_lliurament` datetime DEFAULT NULL,
  `id_repartidor` int(11) DEFAULT NULL,
  `id_comanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_repartidor` (`id_repartidor`),
  KEY `id_comanda` (`id_comanda`),
  CONSTRAINT `lliuraments_ibfk_1` FOREIGN KEY (`id_repartidor`) REFERENCES `empleats` (`id`),
  CONSTRAINT `lliuraments_ibfk_2` FOREIGN KEY (`id_comanda`) REFERENCES `comandes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lliuraments`
--

LOCK TABLES `lliuraments` WRITE;
/*!40000 ALTER TABLE `lliuraments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lliuraments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzes`
--

DROP TABLE IF EXISTS `pizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pizza` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_producte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_producte` (`id_producte`),
  CONSTRAINT `pizzes_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoriespizzes` (`id`),
  CONSTRAINT `pizzes_ibfk_2` FOREIGN KEY (`id_producte`) REFERENCES `productes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzes`
--

LOCK TABLES `pizzes` WRITE;
/*!40000 ALTER TABLE `pizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `descripcio` text,
  `imatge` varchar(255) DEFAULT NULL,
  `preu` decimal(10,2) DEFAULT NULL,
  `tipus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23  9:58:01
