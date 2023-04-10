-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: maratoon
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Nutrias Pantaneras','Ubrique',11000,10),(2,'Media Martoon Sevilla','Sevilla',22000,6),(3,'Media Martoon Jerez','Jerez',22000,5),(4,'Salida Sanluqueña','Sanlucar de Bda.',11500,3),(5,'Atravesando La Línea','La Línea',16500,5),(6,'Atando la Soga','Villamartín',11650,4);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'INF','Infantil','Menores de 12 años'),(2,'JUN','Junior','Menores de 15 años'),(3,'JUV','Juvenil','Menores de 18 años'),(4,'SNA','Senior A','Menores de 30 años'),(5,'SNB','Senior B','Menores de 40 años'),(6,'VTA','Veteranos A','Menores de 50 años'),(7,'VTB','Veteranos B','Menores de 60 años'),(8,'VTC','Veteranos C','A partir de 60 años');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'NUT','Nutrias Pantaneras','Ubrique','1980-04-11',150),(2,'CAV','Club Atletismo Villamartín','Villamartín','1985-04-11',200),(3,'ACG','Atletismo Campo de Gibraltar','La Línea','1987-04-11',150),(4,'ADJ','Asociación Deportiva de Arcos','Arcos de la Fra.','1970-04-11',300),(5,'CAF','Club Atletismo Fronter','Jerez de la Fra.','1975-04-11',220),(6,'JAJ','Jauría Jerezana','Jerez de la Fra.','1989-05-12',325),(7,'RMD','Club Atletismo Los Remedios','Ubrique','2001-02-09',225);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `corredores`
--

LOCK TABLES `corredores` WRITE;
/*!40000 ALTER TABLE `corredores` DISABLE KEYS */;
INSERT INTO `corredores` VALUES (1,'Juan','García Pérez','Ubrique','1965-07-31','H',57,7,1),(2,'Juan José','Pérez Morales','Ubrique','1945-08-30','H',77,8,1),(3,'Eva','Rubiales Alva','Ubrique','1980-08-25','M',42,6,1),(4,'Josefa','Rios Pérez','Villamartín','1990-10-15','M',32,5,2),(5,'Pedro','Ortega Ríos','Villamartín','1994-05-14','H',28,4,2),(6,'Francisco','Morales Almeida','Villamartín','1970-02-01','H',53,7,2),(7,'Macarena','Fernández Pérez','Villamartín','1980-05-03','M',42,6,2),(8,'Jesús','Romero Reguera','Villamartín','1970-06-05','H',52,7,2),(9,'Pedro','García Ramírez','Ubrique','1967-07-31','H',55,7,1),(10,'María','Pérez Moreno','Ubrique','1975-08-30','M',47,6,1),(11,'Almudena','Romero Alva','Arcos','1986-08-25','M',36,5,4),(12,'Francisco','Pérez Amor','Arcos','1992-10-15','H',30,5,4),(13,'Juan','Rodríguez Ríos','Ubrique','1978-05-14','H',44,6,1),(14,'Cristina','García Almeida','Villamartín','1978-02-01','M',45,6,2),(15,'Romira','Jiménez Pérez','Arcos','1984-05-03','M',38,5,4),(16,'José','Rincón Pérez','Villamartín','1960-06-05','H',62,8,2),(17,'Javier','Ortega García','Jerez','1989-05-08','H',33,5,5),(18,'Juan','Pérez Gutiérrez','Jerez','1990-11-18','H',32,5,5),(19,'Catalina','Ríos Gómez','Jerez','1989-01-30','M',34,5,5),(20,'Diego','Moreno García','Ubrique','1960-06-05','H',62,8,1),(21,'Sergio','Gallardo Galindo','Ubrique','1960-06-05','H',62,8,1),(22,'Marta','Panal Valle','Ubrique','1960-06-05','M',62,8,1),(23,'José Luis','Manzano Rodríguez','Villamartín','1991-05-16','H',31,5,2),(24,'Manuel','Olmos Escobar','Jerez','1990-02-02','H',33,5,5),(25,'Ana','Gutiérrez Pérez','Arcos','1999-02-09','M',24,4,4),(26,'Luis','Gómez Oviedo','Ubrique','1993-03-03','H',30,5,1),(27,'Francisco','Álvarez Pérez','Ubrique','1982-11-11','H',40,6,1);
/*!40000 ALTER TABLE `corredores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES (1,1,1,'2023-04-11 08:00:00.000000','2023-04-11 10:45:10.000012','00:45:10.000012'),(2,1,2,'2023-04-11 08:00:00.000000','2023-04-11 10:35:10.000670','00:35:10.000670'),(3,1,3,'2023-04-11 08:00:00.000000','2023-04-11 10:37:10.001480','00:37:10.001480'),(4,1,4,'2023-04-11 08:00:00.000000','2023-04-11 10:36:20.001546','00:36:20.001546'),(5,1,5,'2023-04-11 08:00:00.000000','2023-04-11 10:35:40.000333','00:35:40.000333'),(6,1,6,'2023-04-11 08:00:00.000000','2023-04-11 10:40:01.000164','00:40:01.000164'),(7,1,7,'2023-04-11 08:00:00.000000','2023-04-11 10:30:30.009412','00:30:30.009412'),(8,1,8,'2023-04-11 08:00:00.000000','2023-04-11 10:38:10.000754','00:38:10.000754'),(9,1,9,'2023-04-11 08:00:00.000000','2023-04-11 10:48:10.000002','00:48:10.000002'),(10,1,10,'2023-04-11 08:00:00.000000','2023-04-11 10:39:10.000003','00:39:10.000003'),(11,1,11,'2023-04-11 08:00:00.000000','2023-04-11 10:55:10.001483','00:55:10.001483'),(12,1,12,'2023-04-11 08:00:00.000000','2023-04-11 10:50:20.000004','00:50:20.000004'),(13,1,13,'2023-04-11 08:00:00.000000','2023-04-11 10:58:40.000005','00:58:40.000005'),(14,1,14,'2023-04-11 08:00:00.000000','2023-04-11 11:00:00.000000','01:00:00.000000'),(15,1,15,'2023-04-11 08:00:00.000000','2023-04-11 11:10:30.009068','01:10:30.009068'),(16,1,16,'2023-04-11 08:00:00.000000','2023-04-11 11:09:10.000500','01:09:10.000500'),(17,2,16,'2023-04-10 07:57:28.959575','2023-04-11 11:09:10.000000','26:00:35.251390'),(18,2,15,'2023-04-10 07:57:28.959575','2023-04-11 11:09:12.000000','26:00:37.251390'),(19,2,13,'2023-04-10 07:57:28.959575','2023-04-11 11:09:17.000000','26:00:42.251390'),(20,2,12,'2023-04-10 07:57:28.959575','2023-04-11 11:09:20.000000','26:00:45.251390'),(29,2,2,'2023-04-11 08:00:00.000000','2023-04-11 10:52:27.123432','00:52:27.123432'),(30,2,3,'2023-04-11 08:00:00.000000','2023-04-11 10:41:05.233341','00:41:05.233341'),(31,2,4,'2023-04-11 08:00:00.000000','2023-04-11 10:39:55.334123','00:39:55.334123'),(32,2,5,'2023-04-11 08:00:00.000000','2023-04-11 10:38:55.143234','00:38:55.143234'),(33,3,23,'2023-04-10 07:57:28.959575','2023-04-11 10:34:02.159357','00:34:02.159357'),(34,3,24,'2023-04-10 07:57:28.959575','2023-04-11 10:35:03.357159','00:35:03.357159'),(35,3,25,'2023-04-10 07:57:28.959575','2023-04-11 10:36:04.375915','00:36:04.375915'),(36,3,26,'2023-04-10 07:57:28.959575','2023-04-11 10:37:05.145875','00:37:05.145875'),(37,3,27,'2023-04-10 07:57:28.959575','2023-04-11 10:38:06.179653','00:38:06.179653');
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10 10:41:57
