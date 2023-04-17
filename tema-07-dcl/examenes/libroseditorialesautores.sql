-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: geslibros
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isbn` char(13) DEFAULT NULL,
  `ean` char(13) DEFAULT NULL,
  `titulo` varchar(80) NOT NULL,
  `autor_id` int(10) unsigned DEFAULT NULL,
  `editorial_id` int(10) unsigned DEFAULT NULL,
  `precio_coste` decimal(10,2) DEFAULT 0.00,
  `precio_venta` decimal(10,2) DEFAULT 0.00,
  `stock` int(10) unsigned DEFAULT 0,
  `stock_min` int(10) unsigned DEFAULT 0,
  `stock_max` int(10) unsigned DEFAULT 0,
  `fecha_edicion` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  UNIQUE KEY `ean` (`ean`),
  KEY `editorial_id` (`editorial_id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`editorial_id`) REFERENCES `editoriales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'8497325524','9788497325523','Operaciones Bases de Datos',1,1,20.00,27.00,16,1,20,'2011-05-10','2023-03-07 12:09:07','2023-03-07 12:09:07'),(2,'8448199588','9788448199586','Instalación y Mantenimiento de Equipos',2,2,22.00,27.54,15,1,20,'2011-09-23','2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,'844814760X','9788448147600','Desarrollo Aplicaciones Entorno',3,2,24.00,31.04,18,2,21,'2011-10-30','2023-03-07 12:09:07','2023-03-07 12:09:07'),(4,'8448148797','9788448148799','Sistemas Gestores de Bases de Datos',4,2,25.00,27.73,14,1,15,'2011-01-21','2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,'9788408096511',NULL,'Camboya',5,4,20.00,21.60,8,1,10,'2011-01-21','2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,'9788408086833',NULL,'Amazonas',6,4,30.00,40.50,6,1,7,'2011-02-10','2023-03-07 12:09:07','2023-03-07 12:09:07'),(7,'9788420405094',NULL,'CAIN',1,5,12.00,15.48,7,1,10,'2011-11-20','2023-03-07 12:09:07','2023-03-07 12:09:07'),(8,'9788497328135',NULL,'Aplicaciones Web',2,1,22.00,22.50,15,1,20,'2011-10-06','2023-03-07 12:09:07','2023-03-07 12:09:07'),(9,'9788448170783',NULL,'Montaje y Mantenimiento de Equipos',3,2,25.00,27.00,5,1,10,'2011-03-20','2023-03-07 12:09:07','2023-03-07 12:09:07'),(10,'9788448170785',NULL,'Programación en PHP Orientada a Objetos',4,3,17.00,22.50,10,3,30,'2014-04-10','2023-03-07 12:09:07','2023-03-07 12:09:07'),(11,'9788448170786',NULL,'Desarrollo Web con PHP y MSQL',5,6,20.00,28.62,12,3,30,'2013-04-10','2023-03-07 12:09:07','2023-03-07 12:09:07'),(12,'9788448170787',NULL,'La Vida del Lazarillo de Tormes',6,3,10.00,11.70,12,3,30,'2012-03-10','2023-03-07 12:09:07','2023-03-07 12:09:07'),(13,'9788448170788',NULL,'Le Petit Prince',1,5,10.30,10.80,12,3,30,'2012-01-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(14,'9788448170789',NULL,'Pepita Jiménez',2,5,9.30,11.07,11,2,16,'2014-04-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(15,'9788448170790',NULL,'Cantar de Mio cid',NULL,6,8.30,9.06,1,1,30,'2010-01-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(16,'9788448170791',NULL,'Cien Años de Soledad',1,6,20.30,24.42,20,3,30,'2010-06-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(17,'9788448170792',NULL,'Dioses Clásicos de la Mitología',2,5,5.30,10.80,6,3,10,'2012-12-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(18,'9788448170793',NULL,'La Historia Interminable',3,5,10.30,13.50,6,2,10,'1985-12-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(19,'9788448180800',NULL,'La Historia del Flamenco',4,5,10.30,13.50,6,2,10,'2000-12-11','2023-03-07 12:09:07','2023-03-07 12:09:07'),(20,'1454781452365','6549852541457','La Realidad y el Deseo',7,7,15.50,15.75,19,30,5,'2014-06-06','2023-03-07 13:30:02','2023-03-07 13:30:02'),(21,'7811454452365','5654982541457','Égloga, elegía, y oda',7,7,14.13,17.41,14,20,7,'2017-03-12','2023-03-07 13:30:02','2023-03-07 13:30:02'),(22,'9784848170877',NULL,'Bases de datos NoSQL',5,6,15.00,17.50,7,5,23,'0000-00-00','2023-03-16 08:05:50','2023-03-16 08:05:50'),(23,'4848170897877',NULL,'Programación Orientada a Objetos, Material Teórico',5,5,20.34,27.50,12,5,25,'0000-00-00','2023-03-16 08:05:50','2023-03-16 08:05:50'),(24,'6165654654145',NULL,'Algoritmia Avanzada en Java',5,4,12.13,15.00,12,30,10,'2023-01-25','2023-03-16 08:17:10','2023-03-16 08:17:10');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `poblacion` varchar(25) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `c_postal` char(5) DEFAULT NULL,
  `nif` char(9) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `movil` char(9) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `web` varchar(40) DEFAULT NULL,
  `contacto` varchar(40) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  UNIQUE KEY `movil` (`movil`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `web` (`web`),
  KEY `provincia_id` (`provincia_id`),
  CONSTRAINT `editoriales_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'Ediciones Paraninfo S.A.','Avda. Filipinas, 50, Bajo, Dcha. puerta A','Madrid',28,'28003','A81461477','902995240',NULL,NULL,'http://www.paraninfo.es','Patricia García','2023-03-07 12:09:07','2023-03-07 12:09:07'),(2,'MCGRAWHILL','C/ Basauri, 17, 1ª Planta','Aravaca',28,'28023','B28914323','911803000',NULL,NULL,'http://www.mcgraw-hill.es/','Raquel Huertas','2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,'RA-MA, S.A. Editorial y Public','Cl. Jarama, 3A Polígono Industrial IGARSA','Paracuellos de Jarama',28,'28860','M16584280','916628139','916628131','editorial@ra-ma.com','http://www.ra-ma.es/','Rocio García','2023-03-07 12:09:07','2023-03-07 12:09:07'),(4,'Editorial Planeta, S.A.U.','Avda Diagonal 662-664','Barcelona',8,'08034','A08186249','934928978',NULL,'viajeros@geoplaneta.es','www.editorial.planeta.es','Roberto Rodríguez','2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,'Alfaguara','Calle Torrelaguna, 60','Madrid',28,'28043','A0818624X','917449060','917449224','alfaguara@santillana.es','http://www.alfaguara.com/es/','Isidoro Moreno','2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,'Anaya','Calle San Francisco, 30 A','Madrid',28,'28014','A0012514C','917458458','963547852','info@anaya.es','www.anaya.com','Rosario Vázquez','2023-03-07 12:09:07','2023-03-07 12:09:07'),(7,'Santillana','Torero Romerito, 30 A','Sevilla',21,'21014','A0012518R','927459458','963597852','info@santillana.es','www.santillana.com','Rocío Márquez','2023-03-07 12:09:07','2023-03-07 12:09:07');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `nacionalidad` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fecha_nac` datetime DEFAULT NULL,
  `fecha_def` datetime DEFAULT NULL,
  `premios` text DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Gabriel García Márquez','Méjico','garciamarquez@gmail.com','1927-12-21 00:00:00','2014-12-21 00:00:00','Planeta, Cervantes, Nobel','2023-03-07 12:09:07','2023-03-07 12:09:07'),(2,'Oscar Wilde','Irlanda','oscarwilde@gmail.com','1854-12-21 00:00:00','1900-12-21 00:00:00','Nobel','2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,'Jorge Luís Borges','Argentina','jorgeluisborges@gmail.com','1899-12-21 00:00:00','1986-12-21 00:00:00','Nobel, Cervantes','2023-03-07 12:09:07','2023-03-07 12:09:07'),(4,'Ernest Hemingway','Estados Unidos','ernesthemingway@gmail.com','1899-12-21 00:00:00','1961-12-21 00:00:00','Nobel, Cervantes','2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,'Pablo Neruda','Chile','pabloneruda@gmail.com','1904-12-21 00:00:00','1973-12-21 00:00:00','Nobel, Cervantes, Planeta','2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,'Federico García Lorca','España','federicogarcialorca@gmail.com','1898-12-21 00:00:00','1936-12-21 00:00:00','Cervantes','2023-03-07 12:09:07','2023-03-07 12:09:07'),(7,'Luis Cernuda','España','cernbidouluis@gmail.com','1902-09-21 00:00:00','1963-11-05 00:00:00','Premio Literario Lambda por Poesía para Hombres Gays','2023-03-07 13:22:15','2023-03-07 13:22:15'),(9,'\"Ana María Matutes\"','\"España\"','\"anamariamatutes@gmail.com\"','0000-00-00 00:00:00','0000-00-00 00:00:00','\"Cervantes\"','2023-04-17 08:05:09','2023-04-17 08:05:09'),(10,'\"Dan Brown\"','\"Inglaterra\"','\"danbrown@gmail.com\"','0000-00-00 00:00:00','0000-00-00 00:00:00','\"Nobel\"','2023-04-17 08:05:09','2023-04-17 08:05:09'),(11,'\"George RR Martin\"','\"Estados Unidos\"','\"georgerrmartin@gmail.com\"','0000-00-00 00:00:00','0000-00-00 00:00:00','\"Nobel, Cervantes\"','2023-04-17 08:05:09','2023-04-17 08:05:09');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 10:16:51
