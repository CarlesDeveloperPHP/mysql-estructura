CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `optica`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL AUTO_INCREMENT,
  `NomClient` varchar(255) DEFAULT NULL,
  `AdrecaPostal` varchar(255) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `CorreuElectronic` varchar(255) DEFAULT NULL,
  `DataRegistre` date DEFAULT NULL,
  `ClientRecomanadorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClientID`),
  KEY `ClientRecomanadorID` (`ClientRecomanadorID`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ClientRecomanadorID`) REFERENCES `clients` (`ClientID`)
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
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `EmpleatID` int(11) NOT NULL AUTO_INCREMENT,
  `NomEmpleat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmpleatID`)
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
-- Table structure for table `marcasulleres`
--

DROP TABLE IF EXISTS `marcasulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcasulleres` (
  `MarcaID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMarca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MarcaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasulleres`
--

LOCK TABLES `marcasulleres` WRITE;
/*!40000 ALTER TABLE `marcasulleres` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcasulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ProveedorID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreProveedor` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `NIF` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ProveedorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `UlleresID` int(11) NOT NULL AUTO_INCREMENT,
  `ProveedorID` int(11) DEFAULT NULL,
  `MarcaID` int(11) DEFAULT NULL,
  `GraduacionVidres` varchar(20) DEFAULT NULL,
  `TipusMuntura` varchar(20) DEFAULT NULL,
  `ColorMuntura` varchar(20) DEFAULT NULL,
  `ColorVidre` varchar(20) DEFAULT NULL,
  `Preu` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`UlleresID`),
  KEY `ProveedorID` (`ProveedorID`),
  KEY `MarcaID` (`MarcaID`),
  CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`),
  CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`MarcaID`) REFERENCES `marcasulleres` (`MarcaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendes`
--

DROP TABLE IF EXISTS `vendes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendes` (
  `VendaID` int(11) NOT NULL AUTO_INCREMENT,
  `ClientID` int(11) DEFAULT NULL,
  `UlleresID` int(11) DEFAULT NULL,
  `DataVenda` date DEFAULT NULL,
  `EmpleatID` int(11) DEFAULT NULL,
  PRIMARY KEY (`VendaID`),
  KEY `ClientID` (`ClientID`),
  KEY `UlleresID` (`UlleresID`),
  KEY `EmpleatID` (`EmpleatID`),
  CONSTRAINT `vendes_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  CONSTRAINT `vendes_ibfk_2` FOREIGN KEY (`UlleresID`) REFERENCES `ulleres` (`UlleresID`),
  CONSTRAINT `vendes_ibfk_3` FOREIGN KEY (`EmpleatID`) REFERENCES `empleats` (`EmpleatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendes`
--

LOCK TABLES `vendes` WRITE;
/*!40000 ALTER TABLE `vendes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-22 19:25:53
