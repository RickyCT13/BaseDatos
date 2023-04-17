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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `poblacion` varchar(50) DEFAULT NULL,
  `c_postal` char(5) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `nif` char(9) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `movil` char(9) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  UNIQUE KEY `movil` (`movil`),
  UNIQUE KEY `email` (`email`),
  KEY `provincia_id` (`provincia_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'CP Rio Tajo','C/Las Flores 23','Guadalajara','19003',19,'34343434L','949876655','949876655','cpriotajo@gmail.com','2011-03-23 23:00:00','2023-03-07 12:09:07'),(2,'IES Brianda de Mendoza','C/Hnos Fernández Galiano 6','Guadalajara','19004',19,'76767667F','949772211','949256376','brianda@correo.es','2011-03-19 23:00:00','2023-03-07 12:09:07'),(3,'Manuel Fernández','Avenida del Atance 24','Guadalajara','19008',19,'22234567E','94980009','949800090','manuel@correo.es','2011-02-27 23:00:00','2023-03-07 12:09:07'),(4,'Alicia Perez González','C/La Azucena 123','Talavera de La Reina','45678',45,'56564564J','925678090','','alicia@sucorreo.es','2011-05-20 22:00:00','2023-03-07 12:09:07'),(5,'Academia Central','C/Espliego 25, Polig Industrial Balconcillo','Azuqueca de Henares','19008',19,'23124234G','949008866','949008866','academia@central.es','2011-07-11 22:00:00','2023-03-07 12:09:07'),(6,'Ayuntamiento de Ubrique','La Plaza, 1','Ubrique','11600',11,'E2333213R','956461290','956463230','info@aytoubrique.es','2012-08-10 22:00:00','2023-03-07 12:09:07'),(7,'IES Ntra. Sra. Los Remedios','Avd. Herrera Oria, s/n','Ubrique','11600',11,'E1212121R','956461293','956847841','info@ieslosremedios.org','2013-08-09 22:00:00','2023-03-07 12:09:07'),(9,'Librería Sierra Nevada','Avd. España, 20','Ubrique','11600',11,'E1218121T','956461200','956847800','info@sierrablanca.org','2017-05-12 22:00:00','2023-03-07 12:09:07');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
-- Table structure for table `libros_temas`
--

DROP TABLE IF EXISTS `libros_temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros_temas` (
  `libro_id` int(10) unsigned NOT NULL,
  `tema_id` int(10) unsigned NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`libro_id`,`tema_id`),
  KEY `tema_id` (`tema_id`),
  CONSTRAINT `libros_temas_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libros_temas_ibfk_2` FOREIGN KEY (`tema_id`) REFERENCES `temas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros_temas`
--

LOCK TABLES `libros_temas` WRITE;
/*!40000 ALTER TABLE `libros_temas` DISABLE KEYS */;
INSERT INTO `libros_temas` VALUES (1,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(2,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,2,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(4,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,4,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,4,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(7,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(8,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(9,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(10,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(10,2,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(11,1,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(11,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(12,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(13,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(14,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(14,8,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(15,5,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(16,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(17,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(18,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(19,3,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(19,8,'2023-03-07 12:09:07','2023-03-07 12:09:07'),(20,3,'2023-03-07 13:35:06','2023-03-07 13:35:06'),(20,5,'2023-03-07 13:35:06','2023-03-07 13:35:06'),(21,3,'2023-03-07 13:35:06','2023-03-07 13:35:06'),(21,5,'2023-03-07 13:35:06','2023-03-07 13:35:06');
/*!40000 ALTER TABLE `libros_temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineasventas`
--

DROP TABLE IF EXISTS `lineasventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineasventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `venta_id` int(10) unsigned NOT NULL,
  `numero_linea` smallint(5) unsigned NOT NULL,
  `libro_id` int(10) unsigned DEFAULT NULL,
  `iva` decimal(4,3) NOT NULL,
  `cantidad` mediumint(8) unsigned NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `venta_id` (`venta_id`,`numero_linea`),
  KEY `libro_id` (`libro_id`),
  CONSTRAINT `lineasventas_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lineasventas_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasventas`
--

LOCK TABLES `lineasventas` WRITE;
/*!40000 ALTER TABLE `lineasventas` DISABLE KEYS */;
INSERT INTO `lineasventas` VALUES (1,1,1,1,0.180,1,38.32,38.32,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(2,1,2,2,0.180,2,34.00,68.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(3,1,3,3,0.180,2,25.00,50.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(4,1,4,4,0.180,4,25.00,100.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(5,1,5,5,0.180,5,30.00,150.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(6,2,1,5,0.210,10,24.00,240.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(7,2,2,6,0.210,2,45.00,90.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(8,2,3,7,0.210,2,17.20,34.40,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(9,3,1,4,0.210,4,34.00,136.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(10,3,2,5,0.210,5,24.00,120.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(11,4,1,6,0.210,10,45.00,450.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(12,4,2,7,0.210,5,17.20,86.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(13,4,3,8,0.210,3,25.00,75.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(14,4,4,9,0.210,20,30.00,600.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(15,4,5,10,0.210,4,25.00,100.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(16,5,1,11,0.210,10,25.00,250.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(17,5,2,12,0.210,7,30.00,210.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(18,5,3,13,0.210,30,13.00,260.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(19,5,4,14,0.210,20,12.00,360.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(20,5,5,15,0.210,4,12.30,49.20,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(21,6,1,14,0.210,10,12.30,123.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(22,6,2,15,0.210,5,9.50,142.50,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(23,6,3,16,0.210,20,25.60,512.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(24,6,4,17,0.210,30,12.00,360.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(25,6,5,13,0.210,40,12.00,480.20,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(26,7,1,5,0.210,10,24.00,240.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(27,7,2,7,0.210,15,12.20,183.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(28,7,3,10,0.210,20,25.00,500.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(29,7,4,13,0.210,30,12.00,360.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(30,7,5,16,0.210,40,25.60,1024.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(31,7,6,17,0.210,40,12.00,480.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(32,8,1,6,0.210,10,45.00,450.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(33,8,2,7,0.210,15,12.20,183.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(34,9,1,11,0.210,10,30.00,300.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(35,9,2,12,0.210,10,13.00,130.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(36,10,1,13,0.210,10,12.00,120.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(37,10,2,14,0.210,10,12.30,123.00,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(39,11,1,17,0.210,2,12.00,29.04,'2023-03-07 13:47:19','2023-03-07 13:47:19'),(40,11,2,20,0.210,2,17.50,42.35,'2023-03-07 13:47:22','2023-03-07 13:47:22'),(41,11,3,21,0.210,2,19.34,46.80,'2023-03-07 13:47:24','2023-03-07 13:47:24'),(42,12,1,22,0.210,3,17.50,63.53,'2023-03-16 08:16:31','2023-03-16 08:16:31'),(43,12,2,11,0.210,1,28.62,34.63,'2023-03-16 08:16:31','2023-03-16 08:16:31'),(44,12,3,23,0.210,3,17.50,63.53,'2023-03-16 08:16:31','2023-03-16 08:16:31');
/*!40000 ALTER TABLE `lineasventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(40) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Álava','2023-03-07 12:09:07','2023-03-07 12:09:07'),(2,'Albacete','2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,'Alicante','2023-03-07 12:09:07','2023-03-07 12:09:07'),(4,'Almería','2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,'Ávila','2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,'Badajoz','2023-03-07 12:09:07','2023-03-07 12:09:07'),(7,'Baleares (Illes)','2023-03-07 12:09:07','2023-03-07 12:09:07'),(8,'Barcelona','2023-03-07 12:09:07','2023-03-07 12:09:07'),(9,'Burgos','2023-03-07 12:09:07','2023-03-07 12:09:07'),(10,'Cáceres','2023-03-07 12:09:07','2023-03-07 12:09:07'),(11,'Cádiz','2023-03-07 12:09:07','2023-03-07 12:09:07'),(12,'Castellón','2023-03-07 12:09:07','2023-03-07 12:09:07'),(13,'Ciudad Real','2023-03-07 12:09:07','2023-03-07 12:09:07'),(14,'Córdoba','2023-03-07 12:09:07','2023-03-07 12:09:07'),(15,'A Coruña','2023-03-07 12:09:07','2023-03-07 12:09:07'),(16,'Cuenca','2023-03-07 12:09:07','2023-03-07 12:09:07'),(17,'Girona','2023-03-07 12:09:07','2023-03-07 12:09:07'),(18,'Granada','2023-03-07 12:09:07','2023-03-07 12:09:07'),(19,'Guadalajara','2023-03-07 12:09:07','2023-03-07 12:09:07'),(20,'Guipúzcoa','2023-03-07 12:09:07','2023-03-07 12:09:07'),(21,'Huelva','2023-03-07 12:09:07','2023-03-07 12:09:07'),(22,'Huesca','2023-03-07 12:09:07','2023-03-07 12:09:07'),(23,'Jaén','2023-03-07 12:09:07','2023-03-07 12:09:07'),(24,'León','2023-03-07 12:09:07','2023-03-07 12:09:07'),(25,'Lleida','2023-03-07 12:09:07','2023-03-07 12:09:07'),(26,'La Rioja','2023-03-07 12:09:07','2023-03-07 12:09:07'),(27,'Lugo','2023-03-07 12:09:07','2023-03-07 12:09:07'),(28,'Madrid','2023-03-07 12:09:07','2023-03-07 12:09:07'),(29,'Málaga','2023-03-07 12:09:07','2023-03-07 12:09:07'),(30,'Murcia','2023-03-07 12:09:07','2023-03-07 12:09:07'),(31,'Navarra','2023-03-07 12:09:07','2023-03-07 12:09:07'),(32,'Ourense','2023-03-07 12:09:07','2023-03-07 12:09:07'),(33,'Asturias','2023-03-07 12:09:07','2023-03-07 12:09:07'),(34,'Palencia','2023-03-07 12:09:07','2023-03-07 12:09:07'),(35,'Las Palmas','2023-03-07 12:09:07','2023-03-07 12:09:07'),(36,'Pontevedra','2023-03-07 12:09:07','2023-03-07 12:09:07'),(37,'Salamanca','2023-03-07 12:09:07','2023-03-07 12:09:07'),(38,'Santa Cruz de Tenerife','2023-03-07 12:09:07','2023-03-07 12:09:07'),(39,'Cantabria','2023-03-07 12:09:07','2023-03-07 12:09:07'),(40,'Segovia','2023-03-07 12:09:07','2023-03-07 12:09:07'),(41,'Sevilla','2023-03-07 12:09:07','2023-03-07 12:09:07'),(42,'Soria','2023-03-07 12:09:07','2023-03-07 12:09:07'),(43,'Tarragona','2023-03-07 12:09:07','2023-03-07 12:09:07'),(44,'Teruel','2023-03-07 12:09:07','2023-03-07 12:09:07'),(45,'Toledo','2023-03-07 12:09:07','2023-03-07 12:09:07'),(46,'Valencia','2023-03-07 12:09:07','2023-03-07 12:09:07'),(47,'Valladolid','2023-03-07 12:09:07','2023-03-07 12:09:07'),(48,'Vizcaya','2023-03-07 12:09:07','2023-03-07 12:09:07'),(49,'Zamora','2023-03-07 12:09:07','2023-03-07 12:09:07'),(50,'Zaragoza','2023-03-07 12:09:07','2023-03-07 12:09:07'),(51,'Ceuta','2023-03-07 12:09:07','2023-03-07 12:09:07'),(52,'Melilla','2023-03-07 12:09:07','2023-03-07 12:09:07');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema` varchar(30) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
INSERT INTO `temas` VALUES (1,'Informática','2023-03-07 12:09:07','2023-03-07 12:09:07'),(2,'Matemáticas','2023-03-07 12:09:07','2023-03-07 12:09:07'),(3,'Novela','2023-03-07 12:09:07','2023-03-07 12:09:07'),(4,'Viajes','2023-03-07 12:09:07','2023-03-07 12:09:07'),(5,'Belleza','2023-03-07 12:09:07','2023-03-07 12:09:07'),(6,'Deportes','2023-03-07 12:09:07','2023-03-07 12:09:07'),(7,'Astronomía','2023-03-07 12:09:07','2023-03-07 12:09:07'),(8,'Música','2023-03-07 12:09:07','2023-03-07 12:09:07'),(9,'Ciencia','2023-03-07 12:09:07','2023-03-07 12:09:07');
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int(10) unsigned DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `importe_bruto` decimal(10,2) NOT NULL,
  `importe_iva` decimal(10,2) NOT NULL,
  `importe_total` decimal(10,2) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,3,'2012-02-18',122.32,4.89,127.21,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(2,6,'2013-01-18',364.00,76.44,440.44,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(3,4,'2014-01-15',256.00,53.71,309.76,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(4,7,'2014-01-15',1311.00,275.31,1586.31,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(5,5,'2014-03-15',1129.20,237.13,1366.33,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(6,1,'2014-03-24',1617.50,339.68,1957.18,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(7,7,'2014-03-26',2787.00,585.27,3372.27,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(8,6,'2014-03-25',633.00,132.93,765.93,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(9,7,'2014-03-25',430.00,90.30,520.30,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(10,1,'2014-03-21',243.00,51.30,294.03,'2023-03-07 12:09:08','2023-03-07 12:09:08'),(11,9,'2019-12-01',93.37,24.82,118.19,'2023-03-07 13:47:17','2023-03-07 13:47:17'),(12,3,'0000-00-00',136.12,28.59,164.71,'2023-03-16 08:16:31','2023-03-16 08:16:31'),(14,3,'0000-00-00',136.12,28.59,164.71,'2023-03-16 08:05:50','2023-03-16 08:05:50');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ventas_por_autor`
--

DROP TABLE IF EXISTS `ventas_por_autor`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_autor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ventas_por_autor` AS SELECT
 1 AS `id`,
  1 AS `autor`,
  1 AS `nacionalidad`,
  1 AS `uds_vendidas`,
  1 AS `importe_ventas_totales` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ventas_por_autor`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_autor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_autor` AS select `a`.`id` AS `id`,`a`.`nombre` AS `autor`,`a`.`nacionalidad` AS `nacionalidad`,sum(`lv`.`cantidad`) AS `uds_vendidas`,sum(`lv`.`importe`) AS `importe_ventas_totales` from ((`lineasventas` `lv` join `libros` `l` on(`lv`.`libro_id` = `l`.`id`)) join `autores` `a` on(`l`.`autor_id` = `a`.`id`)) group by `a`.`id` order by sum(`lv`.`importe`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 10:18:04
