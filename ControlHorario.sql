-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.32 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para controldehorario
CREATE DATABASE IF NOT EXISTS `controldehorario` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `controldehorario`;

-- Volcando estructura para tabla controldehorario.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `Categ_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Categ_Nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Categ_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.categorias: ~0 rows (aproximadamente)
DELETE FROM `categorias`;

-- Volcando estructura para tabla controldehorario.controlhorario_exc
CREATE TABLE IF NOT EXISTS `controlhorario_exc` (
  `CHE_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `CHE_EmpleadoId` int unsigned NOT NULL,
  `CHE_FechaD` date DEFAULT NULL,
  `CHE_FechaH` date DEFAULT NULL,
  `CHE_NovedadId` smallint unsigned NOT NULL,
  `CHE_Horas` smallint DEFAULT NULL,
  PRIMARY KEY (`CHE_Id`),
  KEY `FK_CHE_Empleados_idx` (`CHE_EmpleadoId`),
  KEY `FK_CHE_Noved_idx` (`CHE_NovedadId`),
  CONSTRAINT `FK_CHE_Empleados` FOREIGN KEY (`CHE_EmpleadoId`) REFERENCES `empleados` (`Emp_Id`),
  CONSTRAINT `FK_CHE_Noved` FOREIGN KEY (`CHE_NovedadId`) REFERENCES `novedades` (`Noved_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.controlhorario_exc: ~0 rows (aproximadamente)
DELETE FROM `controlhorario_exc`;

-- Volcando estructura para tabla controldehorario.controlhorario_mov
CREATE TABLE IF NOT EXISTS `controlhorario_mov` (
  `CHM_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CHM_Fecha` date DEFAULT NULL,
  `CHM_Hora` time DEFAULT NULL,
  `CHM_EmpleadoID` int unsigned NOT NULL,
  PRIMARY KEY (`CHM_Id`),
  KEY `Fecha` (`CHM_Fecha`) /*!80000 INVISIBLE */,
  KEY `FechaEmp` (`CHM_Fecha`,`CHM_EmpleadoID`),
  KEY `FK_CHM_Emp_idx` (`CHM_EmpleadoID`),
  CONSTRAINT `FK_CHM_Emp` FOREIGN KEY (`CHM_EmpleadoID`) REFERENCES `empleados` (`Emp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.controlhorario_mov: ~0 rows (aproximadamente)
DELETE FROM `controlhorario_mov`;

-- Volcando estructura para tabla controldehorario.controlhorario_nov
CREATE TABLE IF NOT EXISTS `controlhorario_nov` (
  `CHN_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `CHN_Fecha` date DEFAULT NULL,
  `CHN_InfraccionID` smallint unsigned NOT NULL,
  `CHN_EmpleadosID` int unsigned NOT NULL,
  `CHN_Horas` tinyint unsigned DEFAULT NULL,
  `CHN_Minutos` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`CHN_Id`),
  KEY `Fecha` (`CHN_Fecha`) /*!80000 INVISIBLE */,
  KEY `Empleados` (`CHN_EmpleadosID`) /*!80000 INVISIBLE */,
  KEY `FechaEmpleado` (`CHN_Fecha`,`CHN_EmpleadosID`),
  KEY `FK_CHN_Infracciones_idx` (`CHN_InfraccionID`),
  CONSTRAINT `FK_CHN_Empleados` FOREIGN KEY (`CHN_EmpleadosID`) REFERENCES `empleados` (`Emp_Id`),
  CONSTRAINT `FK_CHN_Infracciones` FOREIGN KEY (`CHN_InfraccionID`) REFERENCES `infracciones` (`Infrac_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.controlhorario_nov: ~0 rows (aproximadamente)
DELETE FROM `controlhorario_nov`;

-- Volcando estructura para tabla controldehorario.controlhorario_res
CREATE TABLE IF NOT EXISTS `controlhorario_res` (
  `CHR_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CHR_Fecha` date DEFAULT NULL,
  `CHR_EmpleadosID` int unsigned NOT NULL,
  `CHR_Horas` tinyint DEFAULT NULL,
  PRIMARY KEY (`CHR_Id`),
  KEY `Fecha` (`CHR_Fecha`) /*!80000 INVISIBLE */,
  KEY `FechaEmpleado` (`CHR_Fecha`,`CHR_EmpleadosID`),
  KEY `FK_CHR_Empleado_idx` (`CHR_EmpleadosID`),
  CONSTRAINT `FK_CHR_Empleado` FOREIGN KEY (`CHR_EmpleadosID`) REFERENCES `empleados` (`Emp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.controlhorario_res: ~0 rows (aproximadamente)
DELETE FROM `controlhorario_res`;

-- Volcando estructura para tabla controldehorario.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `Emp_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Emp_Apellido` varchar(60) DEFAULT NULL,
  `Emp_Nombre` varchar(100) DEFAULT NULL,
  `Emp_FechaNac` date DEFAULT NULL,
  `Emp_FechaAlta` date DEFAULT NULL,
  `Emp_FechaBaja` date DEFAULT NULL,
  `Emp_EstadoId` tinyint unsigned DEFAULT '1',
  `Emp_LocalidadID` int unsigned DEFAULT NULL,
  `Emp_CategoriaID` smallint unsigned DEFAULT NULL,
  `Emp_SectorID` smallint unsigned DEFAULT NULL,
  `Emp_Salario` decimal(10,2) unsigned DEFAULT '0.00',
  `Emp_PoliticaHorariaID` smallint unsigned DEFAULT NULL,
  `Emp_Domicilio` varchar(150) DEFAULT NULL,
  `Emp_Email` varchar(80) DEFAULT NULL,
  `Emp_Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Emp_Id`),
  KEY `FK_Emp_Estado_idx` (`Emp_EstadoId`),
  KEY `FK_Emp_Localidad_idx` (`Emp_LocalidadID`),
  KEY `FK_Emp_PH_idx` (`Emp_PoliticaHorariaID`),
  KEY `FK_Emp_Categ_idx` (`Emp_CategoriaID`),
  KEY `FK_Emp_Sector_idx` (`Emp_SectorID`),
  CONSTRAINT `FK_Emp_Categ` FOREIGN KEY (`Emp_CategoriaID`) REFERENCES `categorias` (`Categ_Id`),
  CONSTRAINT `FK_Emp_Estado` FOREIGN KEY (`Emp_EstadoId`) REFERENCES `estados` (`Estado_Id`),
  CONSTRAINT `FK_Emp_Localidad` FOREIGN KEY (`Emp_LocalidadID`) REFERENCES `localidades` (`Local_Id`),
  CONSTRAINT `FK_Emp_PH` FOREIGN KEY (`Emp_PoliticaHorariaID`) REFERENCES `politicahoraria` (`PH_Id`),
  CONSTRAINT `FK_Emp_Sector` FOREIGN KEY (`Emp_SectorID`) REFERENCES `sectores` (`Sector_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.empleados: ~0 rows (aproximadamente)
DELETE FROM `empleados`;

-- Volcando estructura para tabla controldehorario.estados
CREATE TABLE IF NOT EXISTS `estados` (
  `Estado_Id` tinyint unsigned NOT NULL,
  `Estado_Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Estado_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.estados: ~0 rows (aproximadamente)
DELETE FROM `estados`;

-- Volcando estructura para tabla controldehorario.infracciones
CREATE TABLE IF NOT EXISTS `infracciones` (
  `Infrac_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Infrac_Nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Infrac_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.infracciones: ~0 rows (aproximadamente)
DELETE FROM `infracciones`;

-- Volcando estructura para tabla controldehorario.localidades
CREATE TABLE IF NOT EXISTS `localidades` (
  `Local_Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Local_ProvinID` mediumint unsigned NOT NULL,
  `Local_Nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Local_Id`),
  KEY `FK_Local_Provincia_idx` (`Local_ProvinID`),
  CONSTRAINT `FK_Local_Provincia` FOREIGN KEY (`Local_ProvinID`) REFERENCES `provincias` (`Provin_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.localidades: ~0 rows (aproximadamente)
DELETE FROM `localidades`;

-- Volcando estructura para tabla controldehorario.novedades
CREATE TABLE IF NOT EXISTS `novedades` (
  `Noved_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Noved_Descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Noved_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.novedades: ~0 rows (aproximadamente)
DELETE FROM `novedades`;

-- Volcando estructura para tabla controldehorario.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `Paises_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Paises_Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Paises_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.paises: ~0 rows (aproximadamente)
DELETE FROM `paises`;

-- Volcando estructura para tabla controldehorario.politicahoraria
CREATE TABLE IF NOT EXISTS `politicahoraria` (
  `PH_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `PH_HorarioFlexible` bit(1) DEFAULT NULL,
  `PH_Nombre` varchar(60) DEFAULT NULL,
  `PH_Estado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`PH_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.politicahoraria: ~0 rows (aproximadamente)
DELETE FROM `politicahoraria`;

-- Volcando estructura para tabla controldehorario.politicahoraria_detalle
CREATE TABLE IF NOT EXISTS `politicahoraria_detalle` (
  `PHD_Id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `PHD_PHID` smallint unsigned NOT NULL,
  `PHD_DiaSemana` tinyint unsigned NOT NULL,
  `PHD_HoraD` time DEFAULT NULL,
  `PHD_HoraH` time DEFAULT NULL,
  `PHD_Horas` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`PHD_Id`),
  KEY `FK_PHD_PH_idx` (`PHD_PHID`),
  CONSTRAINT `FK_PHD_PH` FOREIGN KEY (`PHD_PHID`) REFERENCES `politicahoraria` (`PH_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.politicahoraria_detalle: ~0 rows (aproximadamente)
DELETE FROM `politicahoraria_detalle`;

-- Volcando estructura para tabla controldehorario.provincias
CREATE TABLE IF NOT EXISTS `provincias` (
  `Provin_Id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Provin_PaisID` tinyint unsigned NOT NULL,
  `Provin_Nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Provin_Id`),
  KEY `FK_Provin_Pais_idx` (`Provin_PaisID`),
  CONSTRAINT `FK_Provin_Pais` FOREIGN KEY (`Provin_PaisID`) REFERENCES `paises` (`Paises_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.provincias: ~0 rows (aproximadamente)
DELETE FROM `provincias`;

-- Volcando estructura para tabla controldehorario.sectores
CREATE TABLE IF NOT EXISTS `sectores` (
  `Sector_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `Sector_Nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Sector_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla controldehorario.sectores: ~0 rows (aproximadamente)
DELETE FROM `sectores`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
