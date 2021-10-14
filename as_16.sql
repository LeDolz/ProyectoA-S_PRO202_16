CREATE DATABASE  IF NOT EXISTS `as_16` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `as_16`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: as_16
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `num_matricula` int NOT NULL,
  `edad_al` tinyint DEFAULT NULL,
  `nombre_1_al` varchar(50) DEFAULT NULL,
  `nombre_2_al` varchar(50) DEFAULT NULL,
  `apellido_p_al` varchar(50) DEFAULT NULL,
  `apellido_m_al` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (3321,14,'María','Guillermina','Muñoz','Díaz'),(3326,15,'Pedro','Fabián','Gómez','Fuentes'),(3411,16,'Joaquin','Eduardo','Rojas','Herrera'),(3452,17,'Helena','Maite','Figueroa','Soto'),(3461,14,'Marta','Alejandra','Molina','Cortés');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre_aut` varchar(50) DEFAULT NULL,
  `apellido_p_aut` varchar(50) DEFAULT NULL,
  `apellido_m_aut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Gabriel','Garcia','Márquez'),(2,'Ana','Frank','Frank'),(3,'Ray','Bradbury','Moberg'),(4,'Joanne','Rowling','Volant'),(5,'William','Shakespeare','Arden');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nombre_genero` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Novela policíaca'),(2,'Realismo mágico'),(3,'Tragedia'),(4,'Melodrama'),(5,'Novela filosófica'),(6,'Novela política'),(7,'Ciencia ficción'),(8,'Novela'),(9,'Diario personal'),(10,'Autobiografía');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero_libro`
--

DROP TABLE IF EXISTS `genero_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_libro` (
  `libro_gl` int NOT NULL,
  `genero_gl` int NOT NULL,
  KEY `libro_gl` (`libro_gl`),
  KEY `genero_gl` (`genero_gl`),
  CONSTRAINT `genero_libro_ibfk_1` FOREIGN KEY (`libro_gl`) REFERENCES `libro` (`id_libro`),
  CONSTRAINT `genero_libro_ibfk_2` FOREIGN KEY (`genero_gl`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_libro`
--

LOCK TABLES `genero_libro` WRITE;
/*!40000 ALTER TABLE `genero_libro` DISABLE KEYS */;
INSERT INTO `genero_libro` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(3,7),(4,8),(5,9),(5,10);
/*!40000 ALTER TABLE `genero_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `anio_pub` int DEFAULT NULL,
  `existencias` int DEFAULT NULL,
  `autor_libro` int DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `autor_libro` (`autor_libro`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`autor_libro`) REFERENCES `autor` (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Romeo y Julieta',1595,2,5),(2,'Harry Potter',1997,1,4),(3,'Crónica de una muerte anunciada',1981,7,1),(4,'Fahrenheit 451',1953,3,3),(5,'Diario de Ana Frank',1947,11,2);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int NOT NULL AUTO_INCREMENT,
  `nacionalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Colombiana'),(2,'Alemana'),(3,'Neerlandesa'),(4,'Sin nacionalidad'),(5,'Estadounidense'),(6,'Británica'),(7,'Inglesa');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad_autor`
--

DROP TABLE IF EXISTS `nacionalidad_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad_autor` (
  `nacionalidad_an` int NOT NULL,
  `autor_an` int NOT NULL,
  KEY `nacionalidad_an` (`nacionalidad_an`),
  KEY `autor_an` (`autor_an`),
  CONSTRAINT `nacionalidad_autor_ibfk_1` FOREIGN KEY (`nacionalidad_an`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `nacionalidad_autor_ibfk_2` FOREIGN KEY (`autor_an`) REFERENCES `autor` (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad_autor`
--

LOCK TABLES `nacionalidad_autor` WRITE;
/*!40000 ALTER TABLE `nacionalidad_autor` DISABLE KEYS */;
INSERT INTO `nacionalidad_autor` VALUES (1,1),(2,2),(3,2),(4,2),(5,3),(6,4),(7,5);
/*!40000 ALTER TABLE `nacionalidad_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `libro_prestado` int NOT NULL,
  `alumno_solicitante` int NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_lb_pr` (`libro_prestado`),
  KEY `fk_al_nm` (`alumno_solicitante`),
  CONSTRAINT `fk_al_nm` FOREIGN KEY (`alumno_solicitante`) REFERENCES `alumno` (`num_matricula`),
  CONSTRAINT `fk_lb_pr` FOREIGN KEY (`libro_prestado`) REFERENCES `libro` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,'2021-10-05','2021-10-25',4,3452),(2,'2021-08-23','2021-09-23',2,3326),(3,'2021-09-02','2021-09-22',5,3411),(4,'2021-06-23','2021-08-01',1,3321),(5,'2021-10-12','2021-11-12',3,3461);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actu_stock` AFTER INSERT ON `prestamo` FOR EACH ROW begin
	set @libro_e = (select existencias from libro where id_libro like new.libro_prestado);
	if @libro_e >0 then
		update libro set existencias=existencias-1 where id_libro like new.libro_prestado;
	else 
		update libro set existencias=existencias where id_libro like new.libro.prestado;
	end if; 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'as_16'
--

--
-- Dumping routines for database 'as_16'
--
/*!50003 DROP PROCEDURE IF EXISTS `prestamo_10D` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prestamo_10D`(libro_id int,alumno_id int)
begin
set @fecha = (select curdate());
set @fecha10 = (select date_add(@fecha, interval 10 day));
insert into prestamo(fecha_prestamo, fecha_devolucion, libro_prestado, alumno_solicitante) values(@fecha,@fecha10,libro_id,alumno_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 20:55:16
