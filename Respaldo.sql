-- MySQL dump 10.13  Distrib 5.5.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: CESS
-- ------------------------------------------------------
-- Server version	5.5.61-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AbuelaMa`
--

DROP TABLE IF EXISTS `AbuelaMa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbuelaMa` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHe1` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AbuelaMa`
--

LOCK TABLES `AbuelaMa` WRITE;
/*!40000 ALTER TABLE `AbuelaMa` DISABLE KEYS */;
INSERT INTO `AbuelaMa` VALUES (14,'Vive',NULL,NULL,'Neoplasia',NULL,'TBP','Cardiopatias','Alergias',NULL,NULL,'Cancer',11);
/*!40000 ALTER TABLE `AbuelaMa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AbuelaPa`
--

DROP TABLE IF EXISTS `AbuelaPa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbuelaPa` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo2` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AbuelaPa`
--

LOCK TABLES `AbuelaPa` WRITE;
/*!40000 ALTER TABLE `AbuelaPa` DISABLE KEYS */;
INSERT INTO `AbuelaPa` VALUES (14,'Vive',NULL,NULL,'Neoplasia',NULL,NULL,'Cardiopatias',NULL,'Mal formaciones','Toxicomanias','Cancer',11);
/*!40000 ALTER TABLE `AbuelaPa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AbueloMa`
--

DROP TABLE IF EXISTS `AbueloMa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbueloMa` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo3` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AbueloMa`
--

LOCK TABLES `AbueloMa` WRITE;
/*!40000 ALTER TABLE `AbueloMa` DISABLE KEYS */;
INSERT INTO `AbueloMa` VALUES (14,NULL,'DM',NULL,NULL,'Obesidad','TBP',NULL,'Alergias',NULL,'Toxicomanias','Cancer',11);
/*!40000 ALTER TABLE `AbueloMa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AbueloPa`
--

DROP TABLE IF EXISTS `AbueloPa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbueloPa` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo4` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AbueloPa`
--

LOCK TABLES `AbueloPa` WRITE;
/*!40000 ALTER TABLE `AbueloPa` DISABLE KEYS */;
INSERT INTO `AbueloPa` VALUES (14,'Vive',NULL,'HTA',NULL,'Obesidad',NULL,'Cardiopatias',NULL,NULL,'Toxicomanias','Cancer',11);
/*!40000 ALTER TABLE `AbueloPa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alergias`
--

DROP TABLE IF EXISTS `Alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alergias` (
  `idAlergias` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Causa` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idAlergias`),
  KEY `IdPacAler_idx` (`IdPaciente`),
  CONSTRAINT `IdPacAler` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alergias`
--

LOCK TABLES `Alergias` WRITE;
/*!40000 ALTER TABLE `Alergias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cirujias`
--

DROP TABLE IF EXISTS `Cirujias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cirujias` (
  `idCirujias` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Motivo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tipo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idCirujias`),
  KEY `IdPacQ_idx` (`IdPaciente`),
  CONSTRAINT `IdPacQ` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cirujias`
--

LOCK TABLES `Cirujias` WRITE;
/*!40000 ALTER TABLE `Cirujias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cirujias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consulta`
--

DROP TABLE IF EXISTS `Consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consulta` (
  `idConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `ExploracionF` text COLLATE utf8_spanish_ci,
  `Padecimiento` text COLLATE utf8_spanish_ci,
  `Diagnostico` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Estudios` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Laboratorio` text COLLATE utf8_spanish_ci,
  `Gabinete` text COLLATE utf8_spanish_ci,
  `Tratamiento` text COLLATE utf8_spanish_ci,
  `Medico` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Costo` float DEFAULT NULL,
  `Tipo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Demanda` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Folio` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Especialidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  `IdMedico` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `PacienteCons_idx` (`IdPaciente`),
  CONSTRAINT `PacienteCons` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consulta`
--

LOCK TABLES `Consulta` WRITE;
/*!40000 ALTER TABLE `Consulta` DISABLE KEYS */;
INSERT INTO `Consulta` VALUES (21,'2018-08-03','Ematomas en la piel','Dolores abdominales y del brazo derecho','Colera no especificado','No','Ninguno','Ninguno','Domir 8 horas y beber 2 litros de agua al dia','Concepcion Leal Silva',65.5,'Poblacion Abierta','Lucero cedillo Lopez','Programada','458qw','Medico General',11,25),(22,'2018-08-03','Ronchas en la piel','Dolores estomacales y palpitaciones en el ojo','Fiebre paratifoidea a','No','Ninguno','Ninguno','Reposo absoluto por tres dias','Luis Francisco lopez',20,'Estudiante','Lucero cedillo Lopez','Programada','1245as','Medico General',11,22);
/*!40000 ALTER TABLE `Consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExploracionF`
--

DROP TABLE IF EXISTS `ExploracionF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExploracionF` (
  `idExploracionF` int(11) NOT NULL AUTO_INCREMENT,
  `Peso` float DEFAULT NULL,
  `Talla` float DEFAULT NULL,
  `IMC` float DEFAULT NULL,
  `FrecuenciaC` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `FrecuenciaR` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Temperatura` float DEFAULT NULL,
  `PresionArterial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idExploracionF`),
  KEY `Paciente1_idx` (`IdPaciente`),
  CONSTRAINT `Paciente1` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExploracionF`
--

LOCK TABLES `ExploracionF` WRITE;
/*!40000 ALTER TABLE `ExploracionF` DISABLE KEYS */;
INSERT INTO `ExploracionF` VALUES (18,72.5,168,25.69,'120/120','120/80',36.5,'120/180','2018-08-03',11),(19,68.5,170,23.7,'120/120','120/80',36.5,'120/180','2018-08-03',11);
/*!40000 ALTER TABLE `ExploracionF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ginecologo`
--

DROP TABLE IF EXISTS `Ginecologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ginecologo` (
  `idGinecologo` int(11) NOT NULL AUTO_INCREMENT,
  `Menarca` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Duracion` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Dolor` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Medicamentos` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Embarazo` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idGinecologo`),
  KEY `Paciente7_idx` (`IdPaciente`),
  CONSTRAINT `Paciente7` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ginecologo`
--

LOCK TABLES `Ginecologo` WRITE;
/*!40000 ALTER TABLE `Ginecologo` DISABLE KEYS */;
INSERT INTO `Ginecologo` VALUES (5,'si','5 dias ','si','si, en ocaciones','Si',11);
/*!40000 ALTER TABLE `Ginecologo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hermanos`
--

DROP TABLE IF EXISTS `Hermanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hermanos` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo5` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hermanos`
--

LOCK TABLES `Hermanos` WRITE;
/*!40000 ALTER TABLE `Hermanos` DISABLE KEYS */;
INSERT INTO `Hermanos` VALUES (14,'Vive','DM',NULL,NULL,'Obesidad',NULL,NULL,NULL,'Mal formaciones',NULL,'Cancer',11);
/*!40000 ALTER TABLE `Hermanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inmune`
--

DROP TABLE IF EXISTS `Inmune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inmune` (
  `idInmune` int(11) NOT NULL AUTO_INCREMENT,
  `Tetano` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Sarampion` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Rubeola` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `hepatitis` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idInmune`),
  KEY `IdPaciente_idx` (`idPaciente`),
  CONSTRAINT `IdPaci` FOREIGN KEY (`idPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inmune`
--

LOCK TABLES `Inmune` WRITE;
/*!40000 ALTER TABLE `Inmune` DISABLE KEYS */;
INSERT INTO `Inmune` VALUES (14,'02/02/1995','15/02/1987','12/03/2002','12/12/1994',11);
/*!40000 ALTER TABLE `Inmune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Madre`
--

DROP TABLE IF EXISTS `Madre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Madre` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo6` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Madre`
--

LOCK TABLES `Madre` WRITE;
/*!40000 ALTER TABLE `Madre` DISABLE KEYS */;
INSERT INTO `Madre` VALUES (14,'Vive',NULL,NULL,'Neoplasia',NULL,'TBP',NULL,NULL,'Mal formaciones','Toxicomanias','Cancer',11);
/*!40000 ALTER TABLE `Madre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NoPatologicos`
--

DROP TABLE IF EXISTS `NoPatologicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NoPatologicos` (
  `idNoPatologicos` int(11) NOT NULL AUTO_INCREMENT,
  `Aseo` int(11) DEFAULT NULL,
  `Cepillado` int(11) DEFAULT NULL,
  `Ropa` int(11) DEFAULT NULL,
  `Lacteos` int(11) DEFAULT NULL,
  `Proteinas` int(11) DEFAULT NULL,
  `Verduras` int(11) DEFAULT NULL,
  `Cereales` int(11) DEFAULT NULL,
  `Legumbres` int(11) DEFAULT NULL,
  `idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idNoPatologicos`),
  KEY `IdPaciente_idx` (`idPaciente`),
  CONSTRAINT `IdPaciente` FOREIGN KEY (`idPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NoPatologicos`
--

LOCK TABLES `NoPatologicos` WRITE;
/*!40000 ALTER TABLE `NoPatologicos` DISABLE KEYS */;
INSERT INTO `NoPatologicos` VALUES (14,7,3,7,4,5,6,7,7,11);
/*!40000 ALTER TABLE `NoPatologicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL`
--

DROP TABLE IF EXISTS `PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAL` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) CHARACTER SET utf8 NOT NULL,
  `APELLIDO` varchar(45) CHARACTER SET utf8 NOT NULL,
  `PASSWORD` varchar(45) CHARACTER SET utf8 NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Gerarquia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Cedula` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Username` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Especialidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL`
--

LOCK TABLES `PERSONAL` WRITE;
/*!40000 ALTER TABLE `PERSONAL` DISABLE KEYS */;
INSERT INTO `PERSONAL` VALUES (21,'Joel','Hermida Torres','21232f297a57a5a743894a0e4a801fc3','9398958','Admin','12021175','JHER','Medico General'),(22,'Luis Francisco','lopez','81dc9bdb52d04dc20036dbd8313ed055','9398958','Super','7897897897','LUISF','Medico General'),(23,'karina ','Utrera Gomez','21232f297a57a5a743894a0e4a801fc3','2292190703','usuario','124578969','KARINA94','Medicina Plastica'),(24,'Jose Luis ','Rosas Leal','21232f297a57a5a743894a0e4a801fc3','2299113949','usuario','124578965','LUISLEAL','Medico General'),(25,'Concepcion','Leal Silva','1896a3bf730516dd643ba67b4c447d36','9398958','usuario','7897897897','CONLS','Medico General'),(27,'Jose Manuel','Cartas Sanchez','caf1a3dfb505ffed0d024130f58c5cfa','2291437312','Admin','12021175','MCARTAS','Medico General');
/*!40000 ALTER TABLE `PERSONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pacientes`
--

DROP TABLE IF EXISTS `Pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pacientes` (
  `idPacientes` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(15) CHARACTER SET utf8 NOT NULL,
  `Nombre` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Apellido_P` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Apellido_M` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Edad` int(11) NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Ocupacion` varchar(45) CHARACTER SET utf8 NOT NULL,
  `EstadoC` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Domicilio` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Curp` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Genero` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Historial` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idPacientes`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pacientes`
--

LOCK TABLES `Pacientes` WRITE;
/*!40000 ALTER TABLE `Pacientes` DISABLE KEYS */;
INSERT INTO `Pacientes` VALUES (11,'2018-8-3','Lucero','cedillo','Lopez',25,'2868470','Maestro en Redes y Telecomunicaciones','Casado','And. Dr. Vicente F. Melo # 27','CASM791022HVZRNN08','Femenino','0');
/*!40000 ALTER TABLE `Pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Padre`
--

DROP TABLE IF EXISTS `Padre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Padre` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo7` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Padre`
--

LOCK TABLES `Padre` WRITE;
/*!40000 ALTER TABLE `Padre` DISABLE KEYS */;
INSERT INTO `Padre` VALUES (14,'Vive','DM',NULL,NULL,NULL,'TBP',NULL,NULL,'Mal formaciones','Toxicomanias','Cancer',11);
/*!40000 ALTER TABLE `Padre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patologicos`
--

DROP TABLE IF EXISTS `Patologicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patologicos` (
  `idPatologicos` int(11) NOT NULL AUTO_INCREMENT,
  `Combe` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cirujia` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Alergia` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Diabetico` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Hipertenso` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `OtrosPato` text COLLATE utf8_spanish_ci,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idPatologicos`),
  KEY `Paciente5_idx` (`IdPaciente`),
  CONSTRAINT `Paciente5` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patologicos`
--

LOCK TABLES `Patologicos` WRITE;
/*!40000 ALTER TABLE `Patologicos` DISABLE KEYS */;
INSERT INTO `Patologicos` VALUES (14,'Negativo','No','No','No','No','Ninguno',11);
/*!40000 ALTER TABLE `Patologicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receta`
--

DROP TABLE IF EXISTS `Receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `Medicamento` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Farmacia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Unidades` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Administracion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Presentacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Piezas` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Dosis` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cada` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Dias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  `IdMedico` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `IdPacReceta_idx` (`IdPaciente`),
  CONSTRAINT `IdPacReceta` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receta`
--

LOCK TABLES `Receta` WRITE;
/*!40000 ALTER TABLE `Receta` DISABLE KEYS */;
INSERT INTO `Receta` VALUES (30,'Paracetamol','Genolamab','1 caja','oral','tableta','15 tabletas','1 tableta','8 horas','5','2018-08-03',11,25),(31,'Tempra','Similares','2 cajas','oral','capsula','15 capsulas','1 capsula','12 horas','15 ','2018-08-03',11,25),(33,'omeprazon','simi','1 caja','oral','tableta','15','1 pastilla','8 horas','5','2018-08-03',11,21);
/*!40000 ALTER TABLE `Receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Referencia`
--

DROP TABLE IF EXISTS `Referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Referencia` (
  `idReferencia` int(11) NOT NULL AUTO_INCREMENT,
  `Pediatra` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ginecologia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Gastro` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neurolo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Trauma` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Endocri` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Geriatria` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Urolo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Otorri` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Genetica` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Psiqui` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardio` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Olfta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neomo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nefro` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Hemato` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Vascular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Inmuno` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idReferencia`),
  KEY `IdPaRefe_idx` (`IdPaciente`),
  CONSTRAINT `IdPaRefe` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Referencia`
--

LOCK TABLES `Referencia` WRITE;
/*!40000 ALTER TABLE `Referencia` DISABLE KEYS */;
INSERT INTO `Referencia` VALUES (9,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-03',11),(10,'1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-03',11);
/*!40000 ALTER TABLE `Referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResGineco`
--

DROP TABLE IF EXISTS `ResGineco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResGineco` (
  `idResGineco` int(11) NOT NULL AUTO_INCREMENT,
  `Gestas` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Partos` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Abortos` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Cesareas` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Complicaciones` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `UltimaRegla` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idResGineco`),
  KEY `Genecologo_idx` (`IdPaciente`),
  CONSTRAINT `Genecologo` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResGineco`
--

LOCK TABLES `ResGineco` WRITE;
/*!40000 ALTER TABLE `ResGineco` DISABLE KEYS */;
INSERT INTO `ResGineco` VALUES (2,'1','1','0','0','a la anestecia','05/12/1996',11);
/*!40000 ALTER TABLE `ResGineco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResPatologicos`
--

DROP TABLE IF EXISTS `ResPatologicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResPatologicos` (
  `idResPatologicos` int(11) NOT NULL AUTO_INCREMENT,
  `FechaDia` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `MedicamentoDia` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `ComplicacionesDia` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CuandoHi` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `MedicamentoHi` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CompliHip` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idPacientes` int(11) NOT NULL,
  PRIMARY KEY (`idResPatologicos`),
  KEY `Patologicos_idx` (`idPacientes`),
  CONSTRAINT `PacientePato` FOREIGN KEY (`idPacientes`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResPatologicos`
--

LOCK TABLES `ResPatologicos` WRITE;
/*!40000 ALTER TABLE `ResPatologicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResPatologicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResVicios`
--

DROP TABLE IF EXISTS `ResVicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResVicios` (
  `idResVicios` int(11) NOT NULL AUTO_INCREMENT,
  `EdadInicio` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CantidadAlco` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `EdadFum` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `CigarrosDia` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `EdadRela` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `NoParejas` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Proteccion` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Anticonceptivo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idResVicios`),
  KEY `IdPac_idx` (`IdPaciente`),
  CONSTRAINT `IdPa` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResVicios`
--

LOCK TABLES `ResVicios` WRITE;
/*!40000 ALTER TABLE `ResVicios` DISABLE KEYS */;
INSERT INTO `ResVicios` VALUES (14,'','','','','18','1','No','condon femenino',11);
/*!40000 ALTER TABLE `ResVicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sistema1`
--

DROP TABLE IF EXISTS `Sistema1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sistema1` (
  `idSistema1` int(11) NOT NULL AUTO_INCREMENT,
  `DolorEstomago` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Nauseas` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Tos` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `DolorPecho` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Fatiga` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `DolorCabeza` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idSistema1`),
  KEY `Paciente2_idx` (`IdPaciente`),
  CONSTRAINT `Paciente2` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sistema1`
--

LOCK TABLES `Sistema1` WRITE;
/*!40000 ALTER TABLE `Sistema1` DISABLE KEYS */;
INSERT INTO `Sistema1` VALUES (14,'No','No','No','No','No','No',11);
/*!40000 ALTER TABLE `Sistema1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sistema1_2`
--

DROP TABLE IF EXISTS `Sistema1_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sistema1_2` (
  `idSistema1_2` int(11) NOT NULL AUTO_INCREMENT,
  `Estreñimiento` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Diarrea` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  `Otros2` text COLLATE utf8_spanish_ci,
  `Otros3` text COLLATE utf8_spanish_ci,
  `Otros4` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idSistema1_2`),
  KEY `Paciente3_idx` (`IdPaciente`),
  CONSTRAINT `Paciente3` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sistema1_2`
--

LOCK TABLES `Sistema1_2` WRITE;
/*!40000 ALTER TABLE `Sistema1_2` DISABLE KEYS */;
INSERT INTO `Sistema1_2` VALUES (14,'No','No',11,'Ninguno','No','No');
/*!40000 ALTER TABLE `Sistema1_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tios`
--

DROP TABLE IF EXISTS `Tios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tios` (
  `idFamiliares` int(11) NOT NULL AUTO_INCREMENT,
  `Vive` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DM` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `HTA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Neoplasia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Obesidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TBP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cardiopatias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alergias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Formaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Toxicomanias` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cancer` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFamiliares`),
  KEY `IdPHeredo_idx` (`IdPaciente`),
  CONSTRAINT `IdPHeredo8` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tios`
--

LOCK TABLES `Tios` WRITE;
/*!40000 ALTER TABLE `Tios` DISABLE KEYS */;
INSERT INTO `Tios` VALUES (14,'Vive',NULL,NULL,'Neoplasia',NULL,'TBP','Cardiopatias',NULL,NULL,'Toxicomanias','Cancer',11);
/*!40000 ALTER TABLE `Tios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VIcios`
--

DROP TABLE IF EXISTS `VIcios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VIcios` (
  `idVIcios` int(11) NOT NULL AUTO_INCREMENT,
  `Fuma` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Toma` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Relaciones` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `IdPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idVIcios`),
  KEY `IdPac_idx` (`IdPaciente`),
  CONSTRAINT `IdPac` FOREIGN KEY (`IdPaciente`) REFERENCES `Pacientes` (`idPacientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VIcios`
--

LOCK TABLES `VIcios` WRITE;
/*!40000 ALTER TABLE `VIcios` DISABLE KEYS */;
INSERT INTO `VIcios` VALUES (14,'No','No','Si',11);
/*!40000 ALTER TABLE `VIcios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db29179_cie10`
--

DROP TABLE IF EXISTS `db29179_cie10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db29179_cie10` (
  `id10` varchar(10) NOT NULL,
  `dec10` varchar(400) DEFAULT NULL,
  `grp10` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id10`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db29179_cie10`
--

LOCK TABLES `db29179_cie10` WRITE;
/*!40000 ALTER TABLE `db29179_cie10` DISABLE KEYS */;
INSERT INTO `db29179_cie10` VALUES ('Y823','Otros dispositivos medicos, y los no especificados, asociados con incidentes adversos: instrumentos quirurgicos, dispositivos y materiales (inclusive suturas)',NULL),('Y828','Otros dispositivos medicos, y los no especificados, asociados con incidentes adversos: dispositivos diversos, no clasificados en otra parte',NULL),('Y83','Cirugia y otros procedimientos quirurgicos, como la causa de reaccion anormal del paciente o de complicacion posterior, sin mencion de incidente en el momento de efectuar el procedimiento','|XX33'),('Y830','Operacion quirurgica con trasplante de un organo completo',NULL),('Y831','Operacion quirurgica con implante de un dispositivo artificial interno',NULL),('Y832','Operacion quirurgica con anastomosis, derivacion o injerto',NULL),('Y833','Operacion quirurgica con formacion de estoma externo',NULL),('Y834','Otra cirugia reconstructiva',NULL),('Y835','Amputacion de miembro(s)',NULL),('Y836','Remocion de otro organo (parcial) (total)',NULL),('Y838','Otros procedimientos quirurgicos',NULL),('Y839','Procedimiento quirurgico no especificado',NULL),('Y84','Otros procedimientos medicos, como la causa de reaccion anormal del paciente o de complicacion posterior, sin mencion de incidente en el momento de efectuar le procedimiento','|XX33'),('Y840','Cateterizacion cardiaca',NULL),('Y841','Dialisis renal',NULL),('Y842','Procedimiento radiologico y radioterapia',NULL),('Y843','Terapia por choque',NULL),('Y844','Aspiracion de liquidos',NULL),('Y845','Insercion de sonda gastrica o duodenal',NULL),('Y846','Cateterizacion urinaria',NULL),('Y847','Muestra de sangre',NULL),('Y848','Otros procedimientos medicos',NULL),('Y849','Procedimiento medico no especificado',NULL),('Y85','Secuelas de accidente de transporte','|XX34'),('Y850','Secuelas de accidente de vehiculo de motor',NULL),('Y859','Secuelas de otros accidentes de transporte, y los no especificados',NULL),('Y86','Secuelas de otros accidentes','|XX34'),('Y87','Secuelas de lesiones autoinfligidas intencionalmente, agresiones y eventos de intencion no determinada','|XX34'),('Y870','Secuelas de lesiones autoinfligidas',NULL),('Y871','Secuelas de agresiones',NULL),('Y872','Secuelas de eventos de intencion no determinada',NULL),('Y88','Secuelas con atencion medica y quirurgica como causa externa','|XX34'),('Y880','Secuelas de efectos adversos causados por drogas, medicamentos y sustancias biologicas en su uso terapeutico',NULL),('Y881','Secuelas de incidentes ocurridos al paciente durante procedimientos medicos y quirurgicos',NULL),('Y882','Secuelas de incidentes adversos asociados con dispositivos medicos en uso diagnostico y terapeutico',NULL),('Y883','Secuelas de procedimientos medicos y quirurgicos como la causa de reaccion anormal del paciente o de complicacion posterior, sin mencion de incidente en el momento de efectuar el procedimiento',NULL),('Y89','Secuelas de otras causas externas','|XX34'),('Y890','Secuelas de intervencion legal',NULL),('Y891','Secuelas de operaciones de guerra',NULL),('Y899','Secuelas de causa externa no especificada',NULL),('Y90','Evidencia alcoholismo determinada por el nivel de alcohol en la sangre','|XX35'),('Y900','Nivel de alcohol en la sangre menor de 20 mg/100 ml',NULL),('Y901','Nivel de alcohol en la sangre de 20 a 39 mg/100 ml',NULL),('Y902','Nivel de alcohol en la sangre de 40 a 59 mg/100 ml',NULL),('Y903','Nivel de alcohol en la sangre de 60 a 79 mg/100 ml',NULL),('Y904','Nivel de alcohol en la sangre de 80 a 99 mg/100 ml',NULL),('Y905','Nivel de alcohol en la sangre de 100 a 119 mg/100 ml',NULL),('Y906','Nivel de alcohol en la sangre de 120 a 199 mg/100 ml',NULL),('Y907','Nivel de alcohol en la sangre de 200 a 239 mg/100 ml',NULL),('Y908','Nivel de alcohol en la sangre de 240 mg/100 ml o mas',NULL),('Y909','Presencia de alcohol en la sangre, nivel no especificado',NULL),('Y91','Evidencia de alcoholismo determinada por el nivel de intoxicacion','|XX35'),('Y910','Intoxicacion alcoholica leve',NULL),('Y911','Intoxicacion alcoholica moderada',NULL),('Y912','Intoxicacion alcoholica severa',NULL),('Y913','Intoxicacion alcoholica muy severa',NULL),('Y919','Alcoholismo, nivel de intoxicacion no especificado',NULL),('Y95','Afeccion nosocomial','|XX35'),('Y96','Afeccion relacionada con el trabajo','|XX35'),('Y97','Afeccion relacionada con la contaminacion ambiental','|XX35'),('Y98','Afeccion relacionada con el estilo de vida','|XX35'),('Z00','Examen general e investigacion de personas sin quejas o sin diagnostico informado','|XXI1'),('Z000','Examen medico general',NULL),('Z001','Control de salud de rutina del niño',NULL),('Z002','Examen durante el periodo de crecimiento rapido en la infancia',NULL),('Z003','Examen del estado de desarrollo del adolescente',NULL),('Z004','Examen psiquiatrico general, no clasificado en otra parte',NULL),('Z005','Examen de donante potencial de organo o tejido',NULL),('Z006','Examen para comparacion y control normales en programa de investigacion clinica',NULL),('Z008','Otros examenes generales',NULL),('Z01','Otros examenes especiales personas sin quejas o sin diagnostico informado','|XXI1'),('Z010','Examen de ojos y de la vision',NULL),('Z011','Examen de oidos y de la audicion',NULL),('Z012','Examen odontologico',NULL),('Z013','Examen de la presion sanguinea',NULL),('Z014','Examen ginecologico (general) (de rutina)',NULL),('Z015','Pruebas de sensibilizacion y diagnostico cutaneo',NULL),('Z016','Examen radiologico, no clasificado en otra parte',NULL),('Z017','Examen de laboratorio',NULL),('Z018','Otros examenes especiales especificados',NULL),('Z019','Examen especial no especificado',NULL),('Z02','Examenes y contactos fines administrativos','|XXI1'),('Z020','Examen para admision a instituciones educativas',NULL),('Z021','Examen preempleo',NULL),('Z022','Examen para admision a instituciones residenciales',NULL),('Z023','Examen para reclutamiento en las fuerzas armadas',NULL),('Z024','Examen para obtencion de licencia de conducir',NULL),('Z025','Examen para participacion en competencias deportivas',NULL),('Z026','Examen para fines de seguros',NULL),('Z027','Extension de certificado medico',NULL),('Z028','Otros examenes para fines administrativos',NULL),('Z029','Examen para fines administrativos, no especificado',NULL),('Z03','Observacion y evaluacion medicas por sospecha de enfermedades y afecciones','|XXI1'),('Z030','Observacion por sospecha de tuberculosis',NULL),('Z031','Observacion por sospecha de tumor maligno',NULL),('Z032','Observacion por sospecha de trastorno mental y del comportamiento',NULL),('Z033','Observacion por sospecha de trastorno del sistema nervioso',NULL),('Z034','Observacion por sospecha de infarto de miocardio',NULL),('Z035','Observacion por sospecha de otras enfermedades cardiovasculares',NULL),('Z036','Observacion por sospecha de efectos toxicos de sustancias ingeridas',NULL),('Z038','Observacion por sospecha de otras enfermedades y afecciones',NULL),('Z039','Observacion por sospecha de enfermedad o afeccion no especificada',NULL),('Z04','Examen y observacion por otras razones','|XXI1'),('Z040','Prueba de alcohol o drogas en la sangre',NULL),('Z041','Examen y observacion consecutivos a accidente de transporte',NULL),('Z042','Examen y observacion consecutivos a accidente de trabajo',NULL),('Z043','Examen y observacion consecutivos a otro accidente',NULL),('Z044','Examen y observacion consecutivos a denuncia de violacion y seduccion',NULL),('Z045','Examen y observacion consecutivos a otra lesion infligida',NULL),('Z046','Examen psiquiatrico general, solicitado por una autoridad',NULL),('Z048','Examen y observacion por otras razones especificadas',NULL),('Z049','Examen y observacion por razones no especificadas',NULL),('Z08','Examen de seguimiento consecutivo a tratamiento por tumor maligno','|XXI1'),('Z080','Examen de seguimiento consecutivo a cirugia por tumor maligno',NULL),('Z081','Examen de seguimiento consecutivo a radioterapia por tumor maligno',NULL),('Z082','Examen de seguimiento consecutivo a quimioterapia por tumor maligno',NULL),('Z087','Examen de seguimiento consecutivo a tratamiento combinado por tumor maligno',NULL),('Z088','Examen de seguimiento consecutivo a otro tratamiento por tumor maligno',NULL),('Z089','Examen de seguimiento consecutivo a otro tratamiento no especificado por tumor maligno',NULL),('Z09','Examen de seguimiento consecutivo a tratamiento por otras afecciones','|XXI1'),('Z090','Examen de seguimiento consecutivo a cirugia por otras afecciones',NULL),('Z091','Examen de seguimiento consecutivo a radioterapia por otras afecciones',NULL),('Z092','Examen de seguimiento consecutivo a quimioterapia por otras afecciones',NULL),('Z093','Examen de seguimiento consecutivo a psicoterapia',NULL),('Z094','Examen de seguimiento consecutivo a tratamiento de fractura',NULL),('Z097','Examen de seguimiento consecutivo a tratamiento combinado por otras afecciones',NULL),('Z098','Examen de seguimiento consecutivo a otro tratamiento por otras afecciones',NULL),('Z099','Examen de seguimiento consecutivo a tratamiento no especificado por otras afecciones',NULL),('Z10','Control general de salud de rutina de subpopoblaciones definidas','|XXI1'),('Z100','Examen de salud ocupacional',NULL),('Z101','Control general de salud de rutina de residentes de instituciones',NULL),('Z102','Control general de salud de rutina a miembros de las fuerzas armadas',NULL),('Z103','Control general de salud de rutina a integrantes de equipos deportivos',NULL),('Z108','Otros controles generales de salud de rutina de otras subpoblaciones definidas',NULL),('Z11','Examen de pesquisa especial para enfermedades infecciosas y parasitarias','|XXI1'),('Z110','Examen de pesquisa especial para enfermedades infecciosas intestinales',NULL),('Z111','Examen de pesquisa especial para tuberculosis respiratoria',NULL),('Z112','Examen de pesquisa especial para otras enfermedades bacterianas',NULL),('Z113','Examen de pesquisa especial para infecciones de transmision predominantemente sexual',NULL),('Z114','Examen de pesquisa especial para el virus de la inmunodeficiencia humana [vih]',NULL),('Z115','Examen de pesquisa especial para otras enfermedades virales',NULL),('Z116','Examen de pesquisa especial para otras enfermedades debidas a protozoarios y helmintos',NULL),('Z118','Examen de pesquisa especial para otras enfermedades infecciosas y parasitarias especificadas',NULL),('Z119','Examen de pesquisa especial para enfermedades infecciosas y parasitarias no especificadas',NULL),('Z12','Examen de pesquisa especial para tumores','|XXI1'),('Z120','Examen de pesquisa especial para tumor de estomago',NULL),('Z121','Examen de pesquisa especial para tumor de intestino',NULL),('Z122','Examen de pesquisa especial para tumores de organos respiratorios',NULL),('Z123','Examen de pesquisa especial para tumor de la mama',NULL),('Z124','Examen de pesquisa especial para tumor del cuello uterino',NULL),('Z125','Examen de pesquisa especial para tumor de la prostata',NULL),('Z126','Examen de pesquisa especial para tumor de la vejiga',NULL),('Z128','Examen de pesquisa especial para tumores de otros sitios',NULL),('Z129','Examen de pesquisa especial para tumor de sitio no especificado',NULL),('Z13','Examen de pesquisa especial para otras enfermedades y trastornos','|XXI1'),('Z130','Examen de pesquisa especial para enfermedades de la sangre y organos hematopoyeticos y ciertos trastornos del mecanismo de la inmunidad',NULL),('Z131','Examen de pesquisa especial para diabetes mellitus',NULL),('Z132','Examen de pesquisa especial para trastornos de la nutricion',NULL),('Z133','Examen de pesquisa especial para trastornos mentales y del comportamiento',NULL),('Z134','Examen de pesquisa especial para ciertos trastornos del desarrollo en el niño',NULL),('Z135','Examen de pesquisa especial para trastornos del ojo y del oido',NULL),('Z136','Examen de pesquisa especial para trastornos cardiovasculares',NULL),('Z137','Examen de pesquisa especial para malformaciones congenitas, deformidades y anomalias cromosomicas',NULL),('Z138','Examen de pesquisa especial para otras enfermedades y trastornos especificados',NULL),('Z139','Examen de pesquisa especial, no especificado',NULL),('Z20','Contacto con y exposicion a enfermedades transmisibles','|XXI2'),('Z200','Contacto con y exposicion a enfermedades infecciosas intestinales',NULL),('Z201','Contacto con y exposicion a tuberculosis',NULL),('Z202','Contacto con y exposicion a enfermedades infecciosas con un modo de transmision predominantemente sexual',NULL),('Z203','Contacto con y exposicion a rabia',NULL),('Z204','Contacto con y exposicion a rubeola',NULL),('Z205','Contacto con y exposicion a hepatitis viral',NULL),('Z206','Contacto con y exposicion al virus de la inmunodeficiencia humana [vih]',NULL),('Z207','Contacto con y exposicion a pediculosis, acariasis y otras infestaciones',NULL),('Z208','Contacto con y exposicion a otras enfermedades transmisibles',NULL),('Z209','Contacto con y exposicion a enfermedades transmisibles no especificadas',NULL),('Z21','Estado de infeccion asintomatica por el virus de la inmunodeficiencia humana [ vih ]','|XXI2'),('Z22','Portador de enfermedad infecciosa','|XXI2'),('Z220','Portador de fiebre tifoidea',NULL),('Z221','Portador de otras enfermedades infecciosas intestinales',NULL),('Z222','Portador de difteria',NULL),('Z223','Portador de otras enfermedades bacterianas especificadas',NULL),('Z224','Portador de enfermedades infecciosas con un modo de transmision predominantemente sexual',NULL),('Z225','Portador de hepatitis viral',NULL),('Z226','Portador de enfermedad infecciosa debida al virus humano t',NULL),('Z228','Portador de otras enfermedades infecciosas',NULL),('Z229','Portador de enfermedad infecciosa no especificada',NULL),('Z23','Necesidad de inmunizacion contra enfermedad bacteriana unica','|XXI2'),('Z230','Necesidad de inmunizacion solo contra el colera',NULL),('Z231','Necesidad de inmunizacion solo contra la tifoidea',NULL),('Z232','Necesidad de inmunizacion contra la tuberculosis [bcg]',NULL),('Z233','Necesidad de inmunizacion contra la peste',NULL),('Z234','Necesidad de inmunizacion contra la tularemia',NULL),('Z235','Necesidad de inmunizacion solo contra el tetanos',NULL),('Z236','Necesidad de inmunizacion solo contra la difteria',NULL),('Z237','Necesidad de inmunizacion solo contra la tos ferina',NULL),('Z238','Necesidad de inmunizacion solo contra otra enfermedad bacteriana',NULL),('Z24','Necesidad de inmunizacion contra ciertas enfermedades virales','|XXI2'),('Z240','Necesidad de inmunizacion contra la poliomielitis',NULL),('Z241','Necesidad de inmunizacion contra la encefalitis viral transmitida por artropodos',NULL),('Z242','Necesidad de inmunizacion contra la rabia',NULL),('Z243','Necesidad de inmunizacion contra la fiebre amarilla',NULL),('Z244','Necesidad de inmunizacion solo contra el sarampion',NULL),('Z245','Necesidad de inmunizacion solo contra la rubeola',NULL),('Z246','Necesidad de inmunizacion contra la hepatitis viral',NULL),('Z25','Necesidad de inmunizacion contra otras enfermedades virales unicas','|XXI2'),('Z250','Necesidad de inmunizacion solo contra la parotiditis',NULL),('Z251','Necesidad de inmunizacion contra la influenza [gripe]',NULL),('Z258','Necesidad de inmunizacion contra otras enfermedades virales unicas especificadas',NULL),('Z26','Necesidad de inmunizacion contra otras enfermedades infecciosas unicas','|XXI2'),('Z260','Necesidad de inmunizacion contra la leishmaniasis',NULL),('Z268','Necesidad de inmunizacion contra otras enfermedades infecciosas unicas especificadas',NULL),('Z269','Necesidad de inmunizacion contra enfermedad infecciosa no especificadas',NULL),('Z27','Necesidad de inmunizacion contra combinacion de enfermedades infecciosas','|XXI2'),('Z270','Necesidad de inmunizacion contra el colera y la tifoidea',NULL),('Z271','Necesidad de inmunizacion contra difteria',NULL),('Z272','Necesidad de inmunizacion contra difteria',NULL),('Z273','Necesidad de inmunizacion contra difteria',NULL),('Z274','Necesidad de inmunizacion contra sarampion',NULL),('Z278','Necesidad de inmunizacion contra otras combinaciones de enfermedades infecciosas',NULL),('Z279','Necesidad de inmunizacion contra combinaciones no especificadas de enfermedades infecciosas',NULL),('Z28','Inmunizacion no realizada','|XXI2'),('Z280','Inmunizacion no realizada por contraindicacion',NULL),('Z281','Inmunizacion no realizada por decision del paciente, por motivos de creencia o presion del grupo',NULL),('Z282','Inmunizacion no realizada por decision del paciente, por otras razones y las no especificadas',NULL),('Z288','Inmunizacion no realizada por otras razones',NULL),('Z289','Inmunizacion no realizada por razon no especificada',NULL),('Z29','Necesidad de otras medidas profilacticas','|XXI2'),('Z290','Aislamiento',NULL),('Z291','Inmunoterapia profilactica',NULL),('Z292','Otra quimioterapia profilactica',NULL),('Z298','Otras medidas profilacticas especificadas',NULL),('Z299','Medida profilactica no especificada',NULL),('Z30','Atencion para la anticoncepcion','|XXI3'),('Z300','Consejo y asesoramiento general sobre la anticoncepcion',NULL),('Z301','Insercion de dispositivo anticonceptivo (intrauterino)',NULL),('Z302','Esterilizacion',NULL),('Z303','Extraccion menstrual',NULL),('Z304','Supervision del uso de drogas anticonceptivas',NULL),('Z305','Supervision del uso de dispositivo anticonceptivo (intrauterino)',NULL),('Z308','Otras atenciones especificadas para la anticoncepcion',NULL),('Z309','Asistencia para la anticoncepcion, no especificada',NULL),('Z31','Atencion para la procreacion','|XXI3'),('Z310','Tuboplastia o vasoplastia posterior a esterilizacion',NULL),('Z311','Inseminacion artificial',NULL),('Z312','Fecundacion in vitro',NULL),('Z313','Otros metodos de atencion para la fecundacion',NULL),('Z314','Investigacion y prueba para la procreacion',NULL),('Z315','Asesoramiento genetico',NULL),('Z316','Consejo y asesoramiento general sobre la procreacion',NULL),('Z318','Otra atencion especificada para la procreacion',NULL),('Z319','Atencion no especificada relacionada con la procreacion',NULL),('Z32','Examen y prueba del embarazo','|XXI3'),('Z320','Embarazo (aun) no confirmado',NULL),('Z321','Embarazo confirmado',NULL),('Z33','Estado de embarazo incidental','|XXI3'),('Z34','Supervision de embarazo normal','|XXI3'),('Z340','Supervision de primer embarazo normal',NULL),('Z348','Supervision de otros embarazos normales',NULL),('Z349','Supervision de embarazo normal no especificado',NULL),('Z35','Supervision de embarazo de alto riesgo','|XXI3'),('Z350','Supervision de embarazo con historia de esterilidad',NULL),('Z351','Supervision de embarazo con historia de aborto',NULL),('Z352','Supervision de embarazo con otro riesgo en la historia obstetrica o reproductiva',NULL),('Z353','Supervision de embarazo con historia de insuficiente atencion prenatal',NULL),('Z354','Supervision de embarazo con gran multiparidad',NULL),('Z355','Supervision de primigesta añosa',NULL),('Z356','Supervision de primigesta muy joven',NULL),('Z357','Supervision de embarazo de alto riesgo debido a problemas sociales',NULL),('Z358','Supervision de otros embarazos de alto riesgo',NULL),('Z359','Supervision de embarazo de alto riesgo, sin otra especificacion',NULL),('Z36','Pesquisas prenatales','|XXI3'),('Z360','Pesquisa prenatal para anomalias cromosomicas',NULL),('Z361','Pesquisa prenatal para medir niveles elevados de alfafetoproteinas',NULL),('Z362','Otras pesquisas prenatales basadas en amniocentesis',NULL),('Z363','Pesquisa prenatal de malformaciones usando altrasonido y otros metodos fisicos',NULL),('Z364','Pesquisa prenatal del retardo del crecimiento fetal usando ultrasonido y otros metodos fisicos',NULL),('Z365','Pesquisa prenatal para isoinmunizacion',NULL),('Z368','Otras pesquisas prenatales especificas',NULL),('Z369','Pesquisa prenatal, sin otra especificacion',NULL),('Z37','Producto del parto','|XXI3'),('Z370','Nacido vivo, unico',NULL),('Z371','Nacido muerto, unico',NULL),('Z372','Gemelos, ambos nacidos vivos',NULL),('Z373','Gemelos, un nacido vivo y un nacido muerto',NULL),('Z374','Gemelos, ambos nacidos muertos',NULL),('Z375','Otros nacimientos multiples, todos nacidos vivos',NULL),('Z376','Otros nacimientos multiples, algunos nacidos vivos',NULL),('Z377','Otros nacimientos multiples, todos nacidos muertos',NULL),('Z379','Producto del parto no especificado',NULL),('Z38','Nacidos vivos segun lugar de nacimiento','|XXI3'),('Z380','Producto unico, nacido en hospital',NULL),('Z381','Producto unico, nacido fuera de hospital',NULL),('Z382','Producto unico, lugar de nacimiento no especificado',NULL),('Z383','Gemelos, nacidos en hospital',NULL),('Z384','Gemelos, nacidos fuera de hospital',NULL),('Z385','Gemelos, lugar de nacimiento no especificado',NULL),('Z386','Otros nacimientos multiples, en hospital',NULL),('Z387','Otros nacimientos multiples, fuera del hospital',NULL),('Z388','Otros nacimientos multiples, lugar de nacimiento no especificado',NULL),('Z39','Examen y atencion del postparto','|XXI3'),('Z390','Atencion y examen inmediatamente despues del parto',NULL),('Z391','Atencion y examen de madre en periodo de lactancia',NULL),('Z392','Seguimiento postparto, de rutina',NULL),('Z40','Cirugia profilactica','|XXI4'),('Z400','Cirugia profilactica por factores de riesgo relacionados con tumores malignos',NULL),('Z408','Otra cirugia profilactica',NULL),('Z409','Cirugia profilactica no especificada',NULL),('Z41','Procedimientos para otros propositos que no sean los de mejorar el estado de salud','|XXI4'),('Z410','Trasplante de pelo',NULL),('Z411','Otras cirugias plasticas por razones esteticas',NULL),('Z412','Circuncision ritual o de rutina',NULL),('Z413','Perforacion de la oreja',NULL),('Z418','Otros procedimientos para otros propositos que no sean los de mejorar el estado de salud',NULL),('Z419','Procedimientos no especificado para otros propositos que no sean los de mejorar el estado de salud',NULL),('Z42','Cuidados posteriores a cirugia plastica','|XXI4'),('Z420','Cuidados posteriores a la cirugia plastica de la cabeza y del cuello',NULL),('Z421','Cuidados posteriores a la cirugia plastica de la mama',NULL),('Z422','Cuidados posteriores a la cirugia plastica de otras partes especificadas del tronco',NULL),('Z423','Cuidados posteriores a la cirugia plastica de las extremidades superiores',NULL),('Z424','Cuidados posteriores a la cirugia plastica de las extremidades inferiores',NULL),('Z428','Cuidados posteriores a la cirugia plastica de otras partes especificadas del cuerpo',NULL),('Z429','Cuidados posteriores a la cirugia plastica no especificada',NULL),('Z43','Atencion de orificios artificiales','|XXI4'),('Z430','Atencion de traqueostomia',NULL),('Z431','Atencion de gastrostomia',NULL),('Z432','Atencion de ileostomia',NULL),('Z433','Atencion de colostomia',NULL),('Z434','Atencion de otros orificios artificiales de las vias digestivas',NULL),('Z435','Atencion de cistostomia',NULL),('Z436','Atencion de otros orificios artificiales de las vias urinarias',NULL),('Z437','Atencion de vagina artificial',NULL),('Z438','Atencion de otros orificios artificiales',NULL),('Z439','Atencion de orificio artificial no especificado',NULL),('Z44','Prueba y ajuste de dispositivos protesicos externos','|XXI4'),('Z440','Prueba y ajuste de brazo artificial (completo) (parcial)',NULL),('Z441','Prueba y ajuste de pierna artificial (completa) (parcial)',NULL),('Z442','Prueba y ajuste de ojo artificial',NULL),('Z443','Prueba y ajuste de protesis mamaria externa',NULL),('Z448','Prueba y ajuste de otros dispositivos protesicos externos',NULL),('Z449','Prueba y ajuste de dispositivo protesico externo no especificado',NULL),('Z45','Asistencia y ajuste de dispositivos implantados','|XXI4'),('Z450','Asistencia y ajuste de marcapaso cardiaco',NULL),('Z451','Asistencia y ajuste de bomba de infusion',NULL),('Z452','Asistencia y ajuste de dispositivos de acceso vascular',NULL),('Z453','Asistencia y ajuste de dispositivo auditivo implantado',NULL),('Z458','Asistencia y ajuste de otros dispositivos implantados',NULL),('Z459','Asistencia y ajuste de dispositivo implantado no especificado',NULL),('Z46','Prueba y ajuste de otros dispositivos','|XXI4'),('Z460','Prueba y ajuste de anteojos y lentes de contacto',NULL),('Z461','Prueba y ajuste de audifonos',NULL),('Z462','Prueba y ajuste de otros dispositivos relacionados con el sistema nervioso y los sentidos especiales',NULL),('Z463','Prueba y ajuste de protesis dental',NULL),('Z464','Prueba y ajuste de dispositivo ortodoncico',NULL),('Z465','Prueba y ajuste de ileostomia u otro dispositivo intestinal',NULL),('Z466','Prueba y ajuste de dispositivo urinario',NULL),('Z467','Prueba y ajuste de dispositivo ortopedico',NULL),('Z468','Prueba y ajuste de otros dispositivos especificados',NULL),('Z469','Prueba y ajuste de dispositivo no especificado',NULL),('Z47','Otros cuidados posteriores a la ortopedia','|XXI4'),('Z470','Cuidados posteriores a la extraccion de placa u otro dispositivo de fijacion interna en fractura',NULL),('Z478','Otros cuidados especificados posteriores a la ortopedia',NULL),('Z479','Cuidado posterior a la ortopedia, no especificado',NULL),('Z48','Otros cuidados posteriores a la cirugia','|XXI4'),('Z480','Atencion de los apositos y suturas',NULL),('Z488','Otros cuidados especificados posteriores a la cirugia',NULL),('Z489','Cuidado posterior a la cirugia, no especificado',NULL),('Z49','Cuidados relativos al procedimiento de dialisis','|XXI4'),('Z490','Cuidados preoperatorios para dialisis',NULL),('Z491','Dialisis extracorporea',NULL),('Z492','Otras dialisis',NULL),('Z50','Atencion por el uso de procedimientos de rehabilitacion','|XXI4'),('Z500','Rehabilitacion cardiaca',NULL),('Z501','Otras terapias fisicas',NULL),('Z502','Rehabilitacion del alcoholico',NULL),('Z503','Rehabilitacion del drogadicto',NULL),('Z504','Psicoterapia, no clasificada en otra parte',NULL),('Z505','Terapia del lenguaje',NULL),('Z506','Adiestramiento ortoptico',NULL),('Z507','Terapia ocupacional y rehabilitacion vocacional, no clasificada en otra parte',NULL),('Z508','Atencion por otros procedimientos de rehabilitacion',NULL),('Z509','Atencion por procedimiento de rehabilitacion, no especificada',NULL),('Z51','Otra atencion medica','|XXI4'),('Z510','Sesion de radioterapia',NULL),('Z511','Sesion de quimioterapia por tumor',NULL),('Z512','Otra quimioterapia',NULL),('Z513','Transfusion de sangre, sin diagnostico informado',NULL),('Z514','Atencion preparatoria para tratamiento subsecuente, no clasificado en otra parte',NULL),('Z515','Atencion paliativa',NULL),('Z516','Desensibilizacion a alergenos',NULL),('Z518','Otras atenciones medicas especificadas',NULL),('Z519','Atencion medica, no especificada',NULL),('Z52','Donantes de organos y tejidos','|XXI4'),('Z520','Donante de sangre',NULL),('Z521','Donante de piel',NULL),('Z522','Donante de hueso',NULL),('Z523','Donante de medula osea',NULL),('Z524','Donante de riñon',NULL),('Z525','Donante de cornea',NULL),('Z526','Donante de higado',NULL),('Z527','Donante de corazon',NULL),('Z528','Donante de otros organos o tejidos',NULL),('Z529','Donante de organo o tejido no especificado',NULL),('Z53','Persona en contacto con los servicios de salud para procedimientos especiales no realizados','|XXI4'),('Z530','Procedimiento no realizado por contraindicacion',NULL),('Z531','Procedimiento no realizado por decision del paciente, por razones de creencia o presion del grupo',NULL),('Z532','Procedimiento no realizado por decision del paciente, por otras razones y las no especificadas',NULL),('Z538','Procedimiento no realizado por otras razones',NULL),('Z539','Procedimiento no realizado por razon no especificada',NULL),('Z54','Convalecencia','|XXI4'),('Z540','Convalecencia consecutiva a cirugia',NULL),('Z541','Convalecencia consecutiva a radioterapia',NULL),('Z542','Convalecencia consecutiva a quimioterapia',NULL),('Z543','Convalecencia consecutiva a psicoterapia',NULL),('Z544','Convalecencia consecutiva a tratamiento de fractura',NULL),('Z547','Convalecencia consecutiva a tratamiento combinado',NULL),('Z548','Convalecencia consecutiva a otros tratamientos',NULL),('Z549','Convalecencia consecutiva a tratamiento no especificado',NULL),('Z55','Problemas relacionados con la educacion y la alfabetizacion','|XXI5'),('Z550','Problemas relacionados con el analfabetismo o bajo nivel de instruccion',NULL),('Z551','Problemas relacionados con la educacion no disponible o inaccesible',NULL),('Z552','Problemas relacionados con la falla en los examenes',NULL),('Z553','Problemas relacionados con el bajo rendimiento escolar',NULL),('Z554','Problemas relacionados con la inadaptacion educacional y desavenencias con maestros y compañeros',NULL),('Z558','Otros problemas relacionados con la educacion y la alfabetizacion',NULL),('Z559','Problema no especificado relacionado con la educacion y la alfabetizacion',NULL),('Z56','Problemas relacionados con el empleo y el desempleo','|XXI5'),('Z560','Problemas relacionados con el desempleo, no especificados',NULL),('Z561','Problemas relacionados con el cambio de empleo',NULL),('Z562','Problemas relacionados con amenaza de perdida del empleo',NULL),('Z563','Problemas relacionados con horario estresante de trabajo',NULL),('Z564','Problemas relacionados con desavenencias con el jefe y los compañeros de trabajo',NULL),('Z565','Problemas relacionados con el trabajo incompatible',NULL),('Z566','Otros problemas de tension fisica o mental relacionadas con el trabajo',NULL),('Z567','Otros problemas y los no especificados relacionados con el empleo',NULL),('Z57','Exposicion a factores de riesgo ocupacional','|XXI5'),('Z570','Exposicion ocupacional al ruido',NULL),('Z571','Exposicion ocupacional a la radiacion',NULL),('Z572','Exposicion ocupacional al polvo',NULL),('Z573','Exposicion ocupacional a otro contaminante del aire',NULL),('Z574','Exposicion ocupacional a agentes toxicos en agricultura',NULL),('Z575','Exposicion ocupacional a agentes toxicos en otras industrias',NULL),('Z576','Exposicion ocupacional a temperatura extrema',NULL),('Z577','Exposicion ocupacional a la vibracion',NULL),('Z578','Exposicion ocupacional a otros factores de riesgo',NULL),('Z579','Exposicion ocupacional a factor de riesgo no especificado',NULL),('Z58','Problemas relacionados con el ambiente fisico','|XXI5'),('Z580','Exposicion al ruido',NULL),('Z581','Exposicion al aire contaminado',NULL),('Z582','Exposicion al agua contaminada',NULL),('Z583','Exposicion al suelo contaminado',NULL),('Z584','Exposicion a la radiacion',NULL),('Z585','Exposicion a otras contaminaciones del ambiente fisico',NULL),('Z586','Suministro inadecuado de agua potable',NULL),('Z588','Otros problemas relacionados con el ambiente fisico',NULL),('Z589','Problema no especificado relacionado con el ambiente fisico',NULL),('Z59','Problemas relacionados con la vivienda y las circunstancias economicas','|XXI5'),('Z590','Problemas relacionados con la falta de vivienda',NULL),('Z591','Problemas relacionados con vivienda inadecuada',NULL),('Z592','Problemas caseros y con vecinos e inquilinos',NULL),('Z593','Problemas relacionados con persona que reside en una institucion',NULL),('Z594','Problemas relacionados con falta de alimentos adecuados',NULL),('Z595','Problemas relacionados con pobreza extrema',NULL),('Z596','Problemas relacionados con bajos ingresos',NULL),('Z597','Problemas relacionados con seguridad social y sostenimiento insuficientes para el bienestar',NULL),('Z598','Otros problemas relacionados con la vivienda y las circunstancias economicas',NULL),('Z599','Problemas no especificados relacionados con la vivienda y las circunstancias economicas',NULL),('Z60','Problemas relacionados con el ambiente social','|XXI5'),('Z600','Problemas relacionados con el ajuste a las transiciones del ciclo vital',NULL),('Z601','Problemas relacionados con situacion familiar atipica',NULL),('Z602','Problemas relacionados con persona que vive sola',NULL),('Z603','Problemas relacionados con la adaptacion cultural',NULL),('Z604','Problemas relacionados con exclusion y rechazo social',NULL),('Z605','Problemas relacionados con la discriminacion y persecucion percibidas',NULL),('Z608','Otros problemas relacionados con el ambiente social',NULL),('Z609','Problema no especificado relacionado con el ambiente social',NULL),('Z61','Problemas relacionados con hechos negativos en la ninez','|XXI5'),('Z610','Problemas relacionados con la perdida de relacion afectiva en la infancia',NULL),('Z611','Problemas relacionados con el alejamiento del hogar en la infancia',NULL),('Z612','Problemas relacionados con alteracion en el patron de la relacion familiar en la infancia',NULL),('Z613','Problemas relacionados con eventos que llevaron a la perdida de la autoestima en la infancia',NULL),('Z614','Problemas relacionados con el abuso sexual del niño por persona dentro del grupo de apoyo primario',NULL),('Z615','Problemas relacionados con el abuso sexual del niño por persona ajena al grupo de apoyo primario',NULL),('Z616','Problemas relacionados con abuso fisico del niño',NULL),('Z617','Problemas relacionados con experiencias personales atemorizantes en la infancia',NULL),('Z618','Problemas relacionados con otras experiencias negativas en la infancia',NULL),('Z619','Problemas relacionados con experiencia negativa no especificada en la infancia',NULL),('Z62','Otros problemas relacionados con la crianza del nino','|XXI5'),('Z620','Problemas relacionados con la supervision o el control inadecuados de los padres',NULL),('Z621','Problemas relacionados con la sobreproteccion de los padres',NULL),('Z622','Problemas relacionados con la crianza en institucion',NULL),('Z623','Problemas relacionados con hostilidad y reprobacion al niño',NULL),('Z624','Problemas relacionados con el abandono emocional del niño',NULL),('Z625','Otros problemas relacionados con negligencia en la crianza del niño',NULL),('Z626','Problemas relacionados con presiones inapropiadas de los padres y otras anormalidades en la calidad de la crianza',NULL),('Z628','Otros problemas especificados y relacionados con la crianza del niño',NULL),('Z629','Problema no especificado relacionado con la crianza del niño',NULL),('Z63','Problemas relacionados con el grupo primario de apoyo, inclusive circunstancias familiares','|XXI5'),('Z630','Problemas en la relacion entre esposos o pareja',NULL),('Z631','Problemas en la relacion con los padres y los familiares politicos',NULL),('Z632','Problemas relacionados con el apoyo familiar inadecuado',NULL),('Z633','Problemas relacionados con la ausencia de un miembro de la familia',NULL),('Z634','Problemas relacionados con la desaparicion o muerte de un miembro de la familia',NULL),('Z635','Problemas relacionados con la ruptura familiar por separacion o divorcio',NULL),('Z636','Problemas relacionados con familiar dependiente, necesitado de cuidado en la casa',NULL),('Z637','Problemas relacionados con otros hechos estresantes que afectan a la familia y al hogar',NULL),('Z638','Otros problemas especificados relacionados con el grupo primario de apoyo',NULL),('Z639','Problema no especificado relacionado con el grupo primario de apoyo',NULL),('Z64','Problemas relacionados con ciertas circunstancias psicosociales','|XXI5'),('Z640','Problemas relacionados con embarazo no deseado',NULL),('Z641','Problemas relacionados con la multiparidad',NULL),('Z642','Problemas relacionados con la solicitud o aceptacion de intervenciones fisicas, nutricionales y quimicas, conociendo su riesgo y peligro',NULL),('Z643','Problemas relacionados con la solicitud o aceptacion de intervenciones psicologicas o de la conducta, conociendo su riesgo y peligro',NULL),('Z644','Problemas relacionados con el desacuerdo con consejeros',NULL),('Z65','Problemas relacionados con otras circunstancias psicosociales','|XXI5'),('Z650','Problemas relacionados con culpabilidad en procedimientos civiles o criminales sin prision',NULL),('Z651','Problemas relacionados con prision y otro encarcelamiento',NULL),('Z652','Problemas relacionados con la liberacion de la prision',NULL),('Z653','Problemas relacionados con otras circunstancias legales',NULL),('Z654','Problemas relacionados con victima de crimen o terrorismo',NULL),('Z655','Problemas relacionados con la exposicion a desastre, guerra u otras hostilidades',NULL),('Z658','Otros problemas especificados relacionados con circunstancias psicosociales',NULL),('Z659','Problemas relacionados con circunstancias psicosociales no especificadas',NULL),('Z70','Consulta relacionada con actitud, conducta u orientacion sexual','|XXI6'),('Z700','Consulta relacionada con la actitud sexual',NULL),('Z701','Consulta relacionada con la orientacion y conducta sexual del paciente',NULL),('Z702','Consulta relacionada con la orientacion y conducta sexual de una tercera persona',NULL),('Z703','Consulta relacionada con preocupaciones combinadas sobre la actitud, la conducta y la orientacion sexuales',NULL),('Z708','Otras consultas sexuales especificas',NULL),('Z709','Consulta sexual, no especificada',NULL),('Z71','Persona en contacto con los servicios de salud por otras consultas y consejos medicos, no clasificados en otra parte','|XXI6'),('Z710','Persona que consulta en nombre de otra persona',NULL),('Z711','Persona que teme estar enferma, a quien no se hace diagnostico',NULL),('Z712','Persona que consulta para la explicacion de hallazgos de investigacion',NULL),('Z713','Consulta para instruccion y vigilancia de la dieta',NULL),('Z714','Consulta para asesoria y vigilancia por abuso de alcohol',NULL),('Z715','Consulta para asesoria y vigilancia por abuso de drogas',NULL),('Z716','Consulta para asesoria por abuso de tabaco',NULL),('Z717','Consulta para asesoria sobre el virus de la inmunodeficiencia humana [vih]',NULL),('Z718','Otras consultas especificadas',NULL),('Z719','Consulta, no especificada',NULL),('Z72','Problemas relacionados con el estilo de vida','|XXI6'),('Z720','Problemas relacionados con el uso de tabaco',NULL),('Z721','Problemas relacionados con el uso de alcohol',NULL),('Z722','Problemas relacionados con el uso de drogas',NULL),('Z723','Problemas relacionados con la falta de ejercicio fisico',NULL),('Z724','Problemas relacionados con la dieta y habitos alimentarios inapropiados',NULL),('Z725','Problemas relacionados con la conducta sexual de alto riesgo',NULL),('Z726','Problemas relacionados con el juego y las apuestas',NULL),('Z728','Otros problemas relacionados con el estilo de vida',NULL),('Z729','Problema no especificado relacionado con el estilo de vida',NULL),('Z73','Problemas relacionados con dificultades con el modo de vida','|XXI6'),('Z730','Problemas relacionados con la enfermedad consuntiva',NULL),('Z731','Problemas relacionados con la acentuacion de rasgos de la personalidad',NULL),('Z732','Problemas relacionados con la falta de relajacion y descanso',NULL),('Z733','Problemas relacionados con el estres, no clasificados en otra parte',NULL),('Z734','Problemas relacionados con habilidades sociales inadecuadas, no clasificadas en otra parte',NULL),('Z735','Problemas relacionados con el conflicto del rol social, no clasificados en otra parte',NULL),('Z736','Problemas relacionados con la limitacion de las actividades debido a discapacidad',NULL),('Z738','Otros problemas relacionados con dificultades con el modo de vida',NULL),('Z739','Problemas no especificados relacionados con dificultades con el modo de vida',NULL),('Z74','Problemas relacionados con dependencia del prestador de servicios','|XXI6'),('Z740','Problemas relacionados con movilidad reducida',NULL),('Z741','Problemas relacionados con la necesidad de ayuda para el cuidado personal',NULL),('Z742','Problemas relacionados con la necesidad de asistencia domiciliaria y que ningun otro miembro del hogar puede proporcionar',NULL),('Z743','Problemas relacionados con la necesidad de supervision continua',NULL),('Z748','Otros problemas relacionados con dependencia del prestador de servicios',NULL),('Z749','Problema no especificado relacionado con dependencia del prestador de servicios',NULL),('Z75','Problemas relacionados con facilidades de atencion medica u otros servicios de salud','|XXI6'),('Z750','Problemas relacionados con servicio medico no disponible en el domicilio',NULL),('Z751','Problemas relacionados con persona esperando admision en una institucion apropiada en otro lugar',NULL),('Z752','Problemas relacionados con persona en otro periodo de espera para investigacion y tratamiento',NULL),('Z753','Problemas relacionados con atencion de salud no disponible o inaccesible',NULL),('Z754','Problemas relacionados con otros servicios asistenciales no disponibles o inaccesibles',NULL),('Z755','Problemas relacionados con la atencion durante vacaciones de la familia',NULL),('Z758','Otros problemas relacionados con servicios medicos y de salud',NULL),('Z759','Problema no especificado relacionado con servicios medicos y de salud',NULL),('Z76','Persona en contacto con los servicios de salud por otras circunstancias','|XXI6'),('Z760','Consulta para repeticion de receta',NULL),('Z761','Consulta para atencion y supervision de la salud del niño',NULL),('Z762','Consulta para atencion y supervision de la salud de otros niños o lactantes sanos',NULL),('Z763','Persona sana que acompaña al enfermo',NULL),('Z764','Otro huesped en servicios de salud',NULL),('Z765','Persona que consulta con simulacion consciente [simulador]',NULL),('Z768','Persona en contacto con los servicios de salud en otras circunstancias especificadas',NULL),('Z769','Persona en contacto con los servicios de salud en circunstancias no especificadas',NULL),('Z80','Historia familiar de tumor maligno','|XXI7'),('Z800','Historia familiar de tumor maligno de organos digestivos',NULL),('Z801','Historia familiar de tumor maligno de traquea, bronquios y pulmon',NULL),('Z802','Historia familiar de tumor maligno de otros organos respiratorios e intratoracicos',NULL),('Z803','Historia familiar de tumor maligno de mama',NULL),('Z804','Historia familiar de tumor maligno de organos genitales',NULL),('Z805','Historia familiar de tumor maligno de vias urinarias',NULL),('Z806','Historia familiar de leucemia',NULL),('Z807','Historia familiar de otros tumores malignos del tejido linfoide, hematopoyetico y tejidos relacionados',NULL),('Z808','Historia familiar de tumor maligno de otros organos o sistemas especificados',NULL),('Z809','Historia familiar de tumor maligno, de sitio no especificado',NULL),('Z81','Historia familiar de trastornos mentales y de comportamiento','|XXI7'),('Z810','Historia familiar de retardo mental',NULL),('Z811','Historia familiar de abuso de alcohol',NULL),('Z812','Historia familiar de abuso de tabaco',NULL),('Z813','Historia familiar de abuso de otras sustancia psicoactivas',NULL),('Z814','Historia familiar de abuso de otras sustancias',NULL),('Z818','Historia familiar de otros trastornos mentales y del comportamiento',NULL),('Z82','Historia familiar de ciertas discapacidades y enfermedades cronicas incapacitantes','|XXI7'),('Z820','Historia familiar de epilepsia y de otras enfermedades del sistema nervioso',NULL),('Z821','Historia familiar de ceguera o perdida de la vision',NULL),('Z822','Historia familiar de sordera o perdida de la audicion',NULL),('Z823','Historia familiar de apoplejia',NULL),('Z824','Historia familiar de enfermedad isquemica del corazon y otras enfermedades del sistema circulatorio',NULL),('Z825','Historia familiar de asma y de otras enfermedades cronicas de las vias respiratorias inferiores',NULL),('Z826','Historia familiar de artritis y otras enfermedades del sistema osteomuscular y tejido conjuntivo',NULL),('Z827','Historia familiar de malformaciones congenitas, deformidades y otras anomalias cromosomicas',NULL),('Z828','Historia familiar de otras discapacidades y enfermedades cronicas incapacitantes no clasificadas en otra parte',NULL),('Z83','Historia familiar de otros trastornos especificos','|XXI7'),('Z830','Historia familiar de infeccion por el virus de la inmunodeficiencia humana [vih]',NULL),('Z831','Historia familiar de otras enfermedades infecciosas y parasitarias',NULL),('Z832','Historia familiar de enfermedades de la sangre y de los organos hematopoyeticos y de ciertos trastornos del mecanismo inmunologico',NULL),('Z833','Historia familiar de diabetes mellitus',NULL),('Z834','Historia familiar de otras enfermedades endocrinas, nutricionales y metabolicas',NULL),('Z835','Historia familiar de trastornos de los ojos y de los oidos',NULL),('Z836','Historia familiar de enfermedades del sistema respiratorio',NULL),('Z837','Historia familiar de enfermedades del sistema digestivo',NULL),('Z84','Historia familiar de otras afecciones','|XXI7'),('Z840','Historia familiar de enfermedades de la piel y del tejido subcutaneo',NULL),('Z841','Historia familiar de trastornos del riñon y del ureter',NULL),('Z842','Historia familiar de otras enfermedades del sistema genitourinario',NULL),('Z843','Historia familiar de consanguinidad',NULL),('Z848','Historia familiar de otras afecciones especificadas',NULL),('Z85','Historia personal de tumor maligno','|XXI7'),('Z850','Historia personal de tumor maligno de organos digestivos',NULL),('Z851','Historia personal de tumor maligno de traquea, bronquios y pulmon',NULL),('Z852','Historia personal de tumor maligno de otros organos respiratorios e intratoracicos',NULL),('Z853','Historia personal de tumor maligno de mama',NULL),('Z854','Historia personal de tumor maligno de organos genitales',NULL),('Z855','Historia personal de tumor maligno de vias urinarias',NULL),('Z856','Historia personal de leucemia',NULL),('Z857','Historia personal de otros tumores malignos del tejido linfoide, hematopoyetico y tejidos relacionados',NULL),('Z858','Historia personal de tumor maligno de otros organos y sistemas',NULL),('Z859','Historia personal de tumor maligno, de sitio no especificado',NULL),('Z86','Historia personal de algunas otras enfermedades','|XXI7'),('Z860','Historia personal de otros tumores',NULL),('Z861','Historia personal de enfermedades infecciosas y parasitarias',NULL),('Z862','Historia personal de enfermedades de la sangre y de los organos hematopoyeticos y de ciertos trastornos del mecanismo inmunologico',NULL),('Z863','Historia personal de enfermedades endocrinas, nutricionales y metabolicas',NULL),('Z864','Historia personal de abuso de sustancias psicoactivas',NULL),('Z865','Historia personal de otros trastornos mentales o del comportamiento',NULL),('Z866','Historia personal de enfermedades del sistema nervioso y de los organos de los sentidos',NULL),('Z867','Historia personal de enfermedades del sistema circulatorio',NULL),('Z87','Historia personal de otras enfermedades y afecciones','|XXI7'),('Z870','Historia personal de enfermedades del sistema respiratorio',NULL),('Z871','Historia personal de enfermedades del sistema digestivo',NULL),('Z872','Historia personal de enfermedades de la piel y del tejido subcutaneo',NULL),('Z873','Historia personal de enfermedades del sistema osteomuscular y del tejido conjuntivo',NULL),('Z874','Historia personal de enfermedades del sistema genitourinario',NULL),('Z875','Historia personal de complicaciones del embarazo, del parto y del puerperio',NULL),('Z876','Historia personal de ciertas afecciones originadas en el periodo perinatal',NULL),('Z877','Historia personal de malformaciones congenitas, deformidades y anomalias cromosomicas',NULL),('Z878','Historia personal de otras afecciones especificadas',NULL),('Z88','Historia personal de alergia a drogas, medicamentos y sustancias biologicas','|XXI7'),('Z880','Historia personal de alergia a penicilina',NULL),('Z881','Historia personal de alergia a otros agentes antibioticos',NULL),('Z882','Historia personal de alergia a sulfonamidas',NULL),('Z883','Historia personal de alergia a otros agentes antiinfecciosos',NULL),('Z884','Historia personal de alergia a agente anestesico',NULL),('Z885','Historia personal de alergia a agente narcotico',NULL),('Z886','Historia personal de alergia a agente analgesico',NULL),('Z887','Historia personal de alergia a suero o vacuna',NULL),('Z888','Historia personal de alergia a otras drogas, medicamentos y sustancias biologicas',NULL),('Z889','Historia personal de alergia a otras drogas, medicamentos y sustancias biologicas no especificadas',NULL),('Z89','Ausencia adquirida de miembros','|XXI7'),('Z890','Ausencia adquirida de dedo(s), [incluido el pulgar], unilateral',NULL),('Z891','Ausencia adquirida de mano y muñeca',NULL),('Z892','Ausencia adquirida de miembro superior por arriba de la muñeca',NULL),('Z893','Ausencia adquirida de ambos miembros superiores [cualquier nivel]',NULL),('Z894','Ausencia adquirida de pie y tobillo',NULL),('Z895','Ausencia adquirida de pierna a nivel de o debajo de la rodilla',NULL),('Z896','Ausencia adquirida de pierna por arriba de la rodilla',NULL),('Z897','Ausencia adquirida de ambos miembros inferiores [cualquier nivel, excepto dedos del pie solamente]',NULL),('Z898','Ausencia adquirida de miembros superiores e inferiores [cualquier nivel]',NULL),('Z899','Ausencia adquirida de miembros no especificados',NULL),('Z90','Ausencia adquirida de organos no clasificadas en otra parte','|XXI7'),('Z900','Ausencia adquirida de parte de la cabeza y del cuello',NULL),('Z901','Ausencia adquirida de mama(s)',NULL),('Z902','Ausencia adquirida (de parte) del pulmon',NULL),('Z903','Ausencia adquirida de parte del estomago',NULL),('Z904','Ausencia adquirida de otras partes del tubo digestivo',NULL),('Z905','Ausencia adquirida de riñon',NULL),('Z906','Ausencia adquirida de otras partes de las vias urinarias',NULL),('Z907','Ausencia adquirida de organo(s) genital(es)',NULL),('Z908','Ausencia adquirida de otros organos',NULL),('Z91','Historia personal de factores de riesgo no clasificadas en otra parte','|XXI7'),('Z910','Historia personal de alergia, no debida a drogas ni a sustancias biologicas',NULL),('Z911','Historia personal de incumplimiento del regimen o tratamiento medico',NULL),('Z912','Historia personal de higiene personal deficiente',NULL),('Z913','Historia personal del ciclo sueño',NULL),('Z914','Historia personal de trauma psicologico, no clasificado en otra parte',NULL),('Z915','Historia personal de lesion autoinfligida intencionalmente',NULL),('Z916','Historia personal de otro trauma fisico',NULL),('Z918','Historia personal de otros factores de riesgo, no clasificados en otra parte',NULL),('Z92','Historia personal de tratamiento medico','|XXI7'),('Z920','Historia personal de anticoncepcion',NULL),('Z921','Historia personal de uso (presente) de anticoagulantes por largo tiempo',NULL),('Z922','Historia personal de uso (presente) de otros medicamentos por largo tiempo',NULL),('Z923','Historia personal de irradiacion',NULL),('Z924','Historia personal de cirugia mayor, no clasificada en otra parte',NULL),('Z925','Historia personal de medidas de rehabilitacion',NULL),('Z928','Historia personal de otros tratamientos medicos',NULL),('Z929','Historia personal de tratamiento medico no especificado',NULL),('Z93','Aberturas artificiales','|XXI7'),('Z930','Traqueostomia',NULL),('Z931','Gastrostomia',NULL),('Z932','Ileostomia',NULL),('Z933','Colostomia',NULL),('Z934','Otros orificios artificiales del tubo gastrointestinal',NULL),('Z935','Cistostomia',NULL),('Z936','Otros orificios artificiales de las vias urinarias',NULL),('Z938','Otras aberturas artificiales',NULL),('Z939','Abertura artificial, no especificada',NULL),('Z94','Organos y tejidos trasplantados','|XXI7'),('Z940','Trasplante de riñon',NULL),('Z941','Trasplante de corazon',NULL),('Z942','Trasplante de pulmon',NULL),('Z943','Trasplante de corazon y pulmones',NULL),('Z944','Trasplante de higado',NULL),('Z945','Trasplante de piel',NULL),('Z946','Trasplante de hueso',NULL),('Z947','Trasplante de cornea',NULL),('Z948','Otros organos y tejidos trasplantados',NULL),('Z949','Organo y tejido trasplantado no especificado',NULL),('Z95','Presencia de inplante e injertos cardiovasculares','|XXI7'),('Z950','Presencia de marcapaso cardiaco',NULL),('Z951','Presencia de derivacion aortocoronaria',NULL),('Z952','Presencia de valvula cardiaca protesica',NULL),('Z953','Presencia de valvula cardiaca xenogenica',NULL),('Z954','Presencia de otros reemplazos de valvula cardiaca',NULL),('Z955','Presencia de angioplastia, injertos y protesis cardiovasculares',NULL),('Z958','Presencia de otros injertos y protesis cardiovasculares',NULL),('Z959','Presencia de injertos e implantes cardiovasculares no especificados',NULL),('Z96','Presencia de otros implantes funcionales','|XXI7'),('Z960','Presencia de implante urogenital',NULL),('Z961','Presencia de lentes intraoculares',NULL),('Z962','Presencia de implantes oticos y auditivos',NULL),('Z963','Presencia de laringe artificial',NULL),('Z964','Presencia de implantes endocrinos',NULL),('Z965','Presencia de implantes de raiz de diente y de mandibula',NULL),('Z966','Presencia de implante ortopedico articular',NULL),('Z967','Presencia de otros implantes de tendones y huesos',NULL),('Z968','Presencia de otros implantes funcionales especificados',NULL),('Z969','Presencia de implantes funcionales no especificados',NULL),('Z97','Presencia de otros dispositivos','|XXI7'),('Z970','Presencia de ojo artificial',NULL),('Z971','Presencia de miembro artificial (completo) (parcial)',NULL),('Z972','Presencia de dispositivo protesico dental (completo) (parcial)',NULL),('Z973','Presencia de anteojos y lentes de contacto',NULL),('Z974','Presencia de audifono externo',NULL),('Z975','Presencia de dispositivo anticonceptivo (intrauterino)',NULL),('Z978','Presencia de otros dispositivos especificados',NULL),('Z98','Otros estados postquirurgicos','|XXI7'),('Z980','Estado de derivacion intestinal o anastomosis',NULL),('Z981','Estado de artrodesis',NULL),('Z982','Presencia de dispositivo para drenaje de liquido cefalorraquideo',NULL),('Z988','Otros estados postquirurgicos especificados',NULL),('Z99','Dependencia de maquinas y dispositivos capacitantes, no clasificadas en otra parte','|XXI7'),('Z990','Dependencia de aspirador',NULL),('Z991','Dependencia de respirador',NULL),('Z992','Dependencia de dialisis renal',NULL),('Z993','Dependencia de silla de ruedas',NULL),('Z998','Dependencia de otras maquinas y dispositivos capacitantes',NULL),('Z999','Dependencia de maquina y dispositivo capacitante, no especificada',NULL),('|I1','Enfermedades infecciosas intestinales','1'),('|I10','Fiebres virales trasmitidas por artrópodos y fiebres virales hemorrágicas','1'),('|I11','Infecciones virales caracterizadas por lesiones de la piel y de las membranas mucosas','1'),('|I12','Hepatitis viral','1'),('|I13','Enfermedad por virus de la inmunodeficiencia humana (HIV)','1'),('|I14','Otras enfermedades virales','1'),('|I15','Micosis','1'),('|I16','Enfermedades debidas a protozoarios','1'),('|I17','Helmintiasis','1'),('|I18','Pediculosis. Acariasis y otras manifestaciones','1'),('|I19','Secuelas de enfermedades infecciosas y parasitarias','1'),('|I2','Tuberculosis','2'),('|I20','Bacterias, virus y otros agentes infecciosos','1'),('|I21','Otras enfermedades infecciosas','1'),('|I3','Ciertas zoonosis bacterianas','1'),('|I4','Otras enfermedades bacterianas','1'),('|I5','Infecciones con modo de transmisión predominantemente sexual','1'),('|I6','Otras enfermedades debidas a espiroquetas','1'),('|I7','Otras enfermedades causadas por clamidias','1'),('|I8','Rickettsiosis','1'),('|I9','Infecciones virales del sistema nervioso central','9'),('|II1','Tumores malignos de labio de la cavidad bucal y de la faringe','2'),('|II10','Tumores malignos de las vías urinarias','2'),('|II11','Tumores malignos del ojo del encéfalo y de otras partes del sistema nervioso','2'),('|II12','Tumores malignos de la glándula tiroides y de otras glándulas endocrinas','2'),('|II13','Tumores malignos de sitios mal definidos secundarios y de sitios no especificados','2'),('|II14','Tumores malignos del tejido linfático, de los órganos hematopoyéticos y de tejidos afines','2'),('|II15','Tumores malignos(primarios) de sitios múltiples independientes','2'),('|II16','Tumores (neoplasias) in situ','2'),('|II17','Tumores (neoplasias) benignos','2'),('|II18','Tumores (neoplasias) de comportamiento incierto o desconocido','2'),('|II2','Tumores malignos de los órganos digestivos','2'),('|II3','Tumores malignos de los órganos respiratorios e intratorácicos','2'),('|II4','Tumores malignos de los huesos y de los cartílagos articulares','2'),('|II5','Melanoma y otros tumores malignos de la piel','2'),('|II6','Tumores malignos de los tejidos mesoteliales y de los tejidos blandos','2'),('|II7','Tumor maligno de mama','2'),('|II8','Tumores malignos de los órganos genitales femeninos','2'),('|II9','Tumores malignos de los órganos genitales masculinos','2'),('|III1','Anemias nutricionales','3'),('|III2','Anemias hemolíticas','3'),('|III3','Anemias aplásticas y otras anemias','3'),('|III4','Defectos de la coagulación, púrpura y otras afecciones hemorrágicas','3'),('|III5','Otras enfermedades de la sangre y de los órganos hematopoyeticos','3'),('|III6','Ciertos trastornos que afectan el mecanismo de la inmunidad','3'),('|IV1','Trastornos de la glándula tiroides','4'),('|IV2','Diabetes mellitus','4'),('|IV3','Otros trastornos de la regulación de la glucosa y de la secreción interna del páncreas','4'),('|IV4','Trastornos de otras glándulas endocrinas.','4'),('|IV5','Desnutrición','4'),('|IV6','Otras deficiencias nutricionales','4'),('|IV7','Obesidad y otros tipo de hiperalimentación','4'),('|IV8','Trastornos metabólicos','4'),('|IX1','Fiebre reumática aguda','9'),('|IX10','Otros trastornos y los no especificados del sistema circulatorio','9'),('|IX2','Enfermedades cardíacas reumáticas crónicas','9'),('|IX3','Enfermedades hipertensivas','9'),('|IX4','Enfermedades isquémicas del corazón','9'),('|IX5','Enfermedad cardiopulmonar y enfermedades de la circulación pulmonar','9'),('|IX6','Otras formas de enfermedad del corazón','9'),('|IX7','Enfermedades cerebrovasculares','9'),('|IX8','Enfermedades de las arterias, de las arteriales y de los vasos capilares','9'),('|IX9','Enfermedades de las venas y de los vasos y ganglios linfáticos, no clasificados en otra parte','9'),('|V1','Trastornos mentales orgánicos, incluidos los trastornos sintomáticos','5'),('|V10','Trastorno mental no especificado','5'),('|v2','Esquizofrenia,trastornos esquizotípicos y trastornos delirantes',NULL),('|V3','Trastornos del humor (afectivos)','5'),('|V4','Trastornos neuróticos, trastornos relacionados con el stress y trastornos somatomorfos','5'),('|V5','Síndromes del comportamiento asociados con alteraciones fisiológicas y factores físicos','5'),('|V6','Trastornos de la personalidad y del comportamiento en adultos','5'),('|V7','Retraso mental','5'),('|V8','Trastornos del desarrollo psicológico','5'),('|V9','Trastornos emocionales y del comportamiento que aparecen habitualmente en la niñez u en la adolescencia','5'),('|VI1','Enfermedades inflamatorias del sistema nervioso central','6'),('|VI10','Parálisis cerebral y otros síndromes paralíticos','6'),('|VI11','Otros trastornos del sistema nervioso','6'),('|VI2','Atrofias sistémicas que afectan principalmente el sistema nervioso central','6'),('|VI3','Trastornos extrapiramidales y del movimiento','6'),('|VI4','Otras enfermedades degenerativas del sistema nervioso','6'),('|VI5','Enfermedades desmielinizantes del sistema nervioso central','6'),('|VI6','Trastornos episódicos y paroxístico','6'),('|VI7','Trastorno de los nervios,de las raíces y de los plexos nerviosos','6'),('|VI8','Polineuropatías y otros trastornos del sistema nervioso periférico','6'),('|VI9','Enfermedades musculares y de la unión neuromuscular','6'),('|VII1','Trastornos del párpado, aparato lagrimal y órbita','7'),('|VII10','Alteración de la visión y ceguera','7'),('|VII11','Otros trastornos del ojo y sus anexos','7'),('|VII2','Trastornos de la conjuntiva','7'),('|VII3','Trastornos de la esclerótica, córnea, iris y cuerpo ciliar','7'),('|VII4','Trastornos del cristalino','7'),('|VII5','Trastornos de la coroides y retina','7'),('|VII6','Glaucoma','7'),('|VII7','Trastornos del cuerpo vitreo y del globo ocular','7'),('|VII8','Trastornos del nervio óptico y de las vías ópticas','7'),('|VII9','Trastornos de los músculos oculares del movimiento binocular de la acomodación y de la refracción','7'),('|VIII1','Enfermedades del oído externo','8'),('|VIII2','Enfermedades del oído medio y de la mastoides','8'),('|VIII3','Enfermedades del oído interno','8'),('|VIII4','Otros trastornos del oído','8'),('|X1','Infecciones agudas de las vías respiratorias superiores','10'),('|X10','Otras enfermedades del sistema respiratorio','11'),('|X2','Influenza (gripe) y neumonía','10'),('|X3','Otras infecciones agudas de las vías respiratorias inferiores','10'),('|X4','Otras enfermedades de las vías respiratorias superiores','10'),('|X5','Enfermedades crónicas de las vías respiratorias inferiores','10'),('|X6','Enfermedades del pulmón debida a agentes externos','10'),('|X7','Otras enfermedades respiratorias que afectan principalmente al intersticio','10'),('|X8','Afecciones supurativas y necróticas de las vías respiratorias inferiores','10'),('|X9','Otras enfermedades de la pleura','10'),('|XI1','Enfermedades de la cavidad bucal de las glándulas salivales y de los maxilares','11'),('|XI10','Otras enfermedades del sistema digestivo','11'),('|XI2','Enfermedades del esófago, del estómago y del duodeno','11'),('|XI3','Enfermedades del apéndice','11'),('|XI4','Hernia','11'),('|XI5','Enteritis y colitis no infecciosa','11'),('|XI6','Otras enfermedades de los intestinos','11'),('|XI7','Enfermedades del peritoneo','11'),('|XI8','Enfermedades del hígado','11'),('|XI9','Trastornos de la vesícula biliar, de las vías biliares del páncreas','11'),('|XII1','Infecciones de la piel y del tejido subcutáneo','12'),('|XII2','Dermatitis y eczema','12'),('|XII3','Trastornos papuloescamosos','12'),('|XII4','Urticaria y eritema','12'),('|XII5','Trastornos de la piel y del tejido subcutáneo relacionados con radiación','12'),('|XII6','Trastornos de las faneras','12'),('|XII7','Otros trastornos de la piel y del tejido subcutáneo','12'),('|XIII1','Artropatías infecciosas','13'),('|XIII10','Otros trastornos de los tejidos blandos','13'),('|XIII11','Trastornos de la densidad y de la estructura óseas','13'),('|XIII12','Otras osteopatías','13'),('|XIII13','Condropatías','13'),('|XIII14','Otros trastornos del sistema osteomuscular y del tejido conjuntivo','13'),('|XIII2','Artrosis','13'),('|XIII3','Otros trastornos articulares','13'),('|XIII4','Trastornos sistémicos del tejido conjuntivo','13'),('|XIII5','Dorsopatías deformantes','13'),('|XIII6','Espondilopatías','13'),('|XIII7','Otras dorsopatias','13'),('|XIII8','Trastornos de los músculos','13'),('|XIII9','Trastornos de los tendones y de la sinovial','13'),('|XIV1','Enfermedades glomerulares','14'),('|XIV10','Trastornos no inflamatorios de los órganos pélvicos femeninos','14'),('|XIV11','Otros trastornos del sistema genitourinario','14'),('|XIV2','Enfermedad renal tubulointersticial','14'),('|XIV3','Insuficiencia renal','14'),('|XIV4','Litiasis urinaria','14'),('|XIV5','Otros trastornos del riñon y del uréter','14'),('|XIV6','Otras enfermedades del sistema urinario','14'),('|XIV7','Enfermedades de los órganos genitales masculinos','14'),('|XIV8','Trastornos de la mama','14'),('|XIV9','Enfermedades inflamatorias de los órganos pélvicos femeninos','14'),('|XIX1','Traumatismo de la cabeza','19'),('|XIX10','Traumatismos del tobillo y del pie','19'),('|XIX11','Traumatismos que afectan múltiples regiones del cuerpo','19'),('|XIX12','Traumatismos de parte no especificada del tronco, miembro o región del cuerpo','19'),('|XIX13','Efectos de cuerpos extraños que penetran por orificios naturales','19'),('|XIX14','Quemaduras y corrosiones de la superficie externa del cuerpo, especificadas por sitio','19'),('|XIX15','Quemaduras y corrosiones limitadas al ojo y órganos internos','19'),('|XIX16','Quemaduras y corrosiones de múltiples regiones del cuerpo y las no especificadas','19'),('|XIX17','Congelamiento','19'),('|XIX18','Envenenamiento por drogas, medicamentos y sustancias biológicas','19'),('|XIX19','Efectos tóxicos de sustancias de procedencia principalmente no medicinal','19'),('|XIX2','Traumatismos del cuello','19'),('|XIX20','Otros efectos y los no especificados de causas externas','19'),('|XIX21','Algunas complicaciones precoces de traumatismos','19'),('|XIX22','Complicaciones de la atención médica y quirúrgica, no clasificadas en otra parte','19'),('|XIX23','Secuela de traumatismos, de envenenamientos y de otras consecuencia de causa externa','19'),('|XIX3','Traumatismos del tórax','19'),('|XIX4','Traumatismos del abdomen, de la región lumbosacra de la columna lumbar y de la pelvis','19'),('|XIX5','Traumatismos del hombro y del brazo','19'),('|XIX6','Traumatismos del antebrazo y del codo','19'),('|XIX7','Traumatismos de la muñeca y de la mano','19'),('|XIX8','Traumatismos de la cadera y del muslo','19'),('|XIX9','Traumatismos de la rodilla y de la pierna','19'),('|XV1','Embarazo terminado en aborto','15'),('|XV2','Edema, proteinuria y trastornos hipertensivos en el embarazo, el parto y el puerperio','15'),('|XV3','Otros trastornos maternos relacionados principalmente con el embarazo','15'),('|XV4','Atención materna relacionada con el feto y la cavidad amniótica y con posibles problemas del parto','15'),('|XV5','Complicaciones del trabajo de parto y del parto','15'),('|XV6','Parto','15'),('|XV7','Complicaciones principalmente relacionadas con el puerperio','15'),('|XV8','Otras afecciones obstétricas no clasificadas en otra parte','15'),('|XVI1','Feto y recién nacido afectados por factores maternos y por complicaciones del embarazo trabajo de parto y del parto','16'),('|XVI10','Otros trastornos originados en el período perinatal','16'),('|XVI2','Trastornos relacionados con la duración de la gestación y el crecimiento fetal','16'),('|XVI3','Traumatismo del nacimiento','16'),('|XVI4','Trastornos respiratorios y cardiovasculares específicos del período perinatal','16'),('|XVI5','Infecciones específicas del período perinatral','16'),('|XVI6','Trastornos hemorrágicos y hematológicos del feto y del recién nacido','16'),('|XVI7','Trastornos endocrinos y metabólicos transitorios específicos del feto y del recién nacido','16'),('|XVI8','Trastornos del sistema digestivo del feto y del recién nacido','15'),('|XVI9','Afecciones asociadas con la regulación tegumentaria y la temperatura del feto y del recién nacido','15'),('|XVII1','Malfomaciones congénitas del sistema nervioso','17'),('|XVII10','Otras malformaciones congénitas','17'),('|XVII11','Anomalías cromosómicas no clasificadas en otra parte','17'),('|XVII2','Malformaciones congénitas del ojo, del oído de la cara y del cuello','17'),('|XVII3','Malformaciones congénitas del sistema circulatorio','17'),('|XVII4','Malformaciones congénitas del sistema respiratorio','17'),('|XVII5','Fisura del paladar y labio leporino','17'),('|XVII6','Otras malformaciones congénitas del sistema digestivo','17'),('|XVII7','Malformaciones congénitas de los órganos genitales','17'),('|XVII8','Malformaciones congénitas del sistema urinario','17'),('|XVII9','Malformaciones y deformidades congénitas del sistema osteomuscular','17'),('|XVIII1','Síntomas y signos que involucran los sistemas circulatorios y respiratorios','18'),('|XVIII10','Hallazgos anormales en el examen de orina sin diagnóstico','18'),('|XVIII11','Hallazgos anormales en el examen de otros líquidos sustancias y tejidos corporales sin diagnóstico','18'),('|XVIII12','Hallazgos anormales en diagnóstico por imágenes y en estudios funcionales, sin diagnóstico','18'),('|XVIII2','Síntomas y signos que involucran el sistema digestivo y el abdomen','18'),('|XVIII3','Síntomas y signos que involucran la piel y el tejido subcutáneo','18'),('|XVIII4','Síntomas y signos que involucran los sistemas nervioso y osteomuscular','18'),('|XVIII5','Síntomas y signos que involucran el sistema urinario','18'),('|XVIII6','Síntomas y signos que involucran el conocimiento la percepción, el estado emocional y la conducta','18'),('|XVIII7','Síntomas y signos que involucran el habla y la voz','18'),('|XVIII8','Síntomas y signos generales','18'),('|XVIII9','Hallazgos anormales en el examen de sangre sin diagnóstico','18'),('|XX1','Peatón lesionado en accidente de transporte','20'),('|XX10','Accidentes de transporte por agua','20'),('|XX11','Accidentes de transporte aéreo y espacial','20'),('|XX12','Otros accidentes de transporte y los no especificados','20'),('|XX13','Otras causas externas de traumatismos accidentales Caídas','20'),('|XX14','Exposición a fuerzas mecánicas inanimadas','20'),('|XX15','Exposición a fuerzas mecánicas animadas','20'),('|XX16','Ahogamiento y sumersión accidentales','20'),('|XX17','Otros accidentes que obstruyen la respiración','20'),('|XX18','Exposición a la corriente eléctrica radiación y temperatura y presión del aire ambientales extremas','20'),('|XX19','Exposición al fuego humo y llamas','20'),('|XX2','Ciclista lesionado en accidente de transporte','20'),('|XX20','Contacto con calor y sustancias calientes','20'),('|XX21','Contacto traumático con animales y plantas venenosas','20'),('|XX22','Exposición a fuerzas de la naturaleza','20'),('|XX23','Envenenamiento accidental por, y exposición a sustancias nocivas','20'),('|XX24','Exceso de esfuerzo, viajes y privación','20'),('|XX25','Exposición accidental a otros factores y a los no especificados','20'),('|XX26','Lesiones autoinfligidas intencionalmente','20'),('|XX27','Agresiones','20'),('|XX28','Eventos de intención no determinada','20'),('|XX29','Intervención legal y operaciones de guerra','20'),('|XX3','Motociclista lesionado en accidente de transporte','20'),('|XX30','Drogas medicamentos y sustancias biológicas causantes de efectos adversos en su uso terapéutico','20'),('|XX31','Incidentes ocurridos al paciente durante la atención médica y quirúrgica','20'),('|XX32','Dispositivos médicos de diagnóstico y de uso terapéutico asociados con incidentes adversos','20'),('|XX33','Procedimientos quirúrgicos y otros procedimientos médicos como causa de reacción anormal del paciente o complicación posterior, sin mención de incidente en el momento de efectuar el procedimiento','20'),('|XX34','Secuelas de causas externas de morbilidad y mortalidad','20'),('|XX35','Factores suplementarios relacionados con causas de morbilidad y de mortalidad clasificadas en otra parte','20'),('|XX4','Ocupante de vehículo de motor de tres ruedas lesionado en accidente de transporte','20'),('|XX5','Ocupante de automóvil lesionado en accidente de transporte','20'),('|XX6','Ocupante de camioneta o furgoneta lesionado en accidente de transporte','20'),('|XX7','Ocupante de vehículo de transporte pesado lesionado en accidente de transporte','20'),('|XX8','Ocupante de autobús lesionado en accidente de transporte','20'),('|XX9','Otros accidentes de transporte terrestre','20'),('|XXI1','Personas en contacto con los servicios de salud para investigación o exámenes','21'),('|XXI2','Personas con riesgos potenciales para su salud, relacionados con enfermedades transmisibles','21'),('|XXI3','Personas en contacto con los servicios de salud en circunstancias relacionadas con la reproducción','21'),('|XXI4','Personas en contacto con los servicios de salud para procedimientos específicos y cuidados de salud','21'),('|XXI5','Personas con riesgos potenciales para su salud, relacionados con circunstancias económicas y psicosociales','21'),('|XXI6','Personas en contacto con los servicios de salud por otras circunstancias','21'),('|XXI7','Personas con riesgos potenciales para su salud relacionados con su historia familiar y personal y algunas condiciones que influyen en su estado de salud','21'),('|XXII','Codigos para situaciones especiales','22');
/*!40000 ALTER TABLE `db29179_cie10` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-05 14:54:47