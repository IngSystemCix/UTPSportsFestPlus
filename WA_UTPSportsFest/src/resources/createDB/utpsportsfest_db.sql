-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2023 a las 22:58:07
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `utpsportsfest`
--
CREATE DATABASE IF NOT EXISTS `utpsportsfest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `utpsportsfest`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia`
--
-- Creación: 26-10-2023 a las 20:44:23
--

CREATE TABLE `competencia` (
  `ID` int(11) NOT NULL,
  `EventoID` int(11) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `Participantes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `competencia`:
--   `EventoID`
--       `evento` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte`
--
-- Creación: 26-10-2023 a las 20:44:22
--

CREATE TABLE `deporte` (
  `ID` int(11) NOT NULL,
  `NombreDeporte` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `deporte`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportista`
--
-- Creación: 26-10-2023 a las 20:44:21
--

CREATE TABLE `deportista` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Genero` char(1) NOT NULL,
  `Codigo` char(9) NOT NULL,
  `CorreoElectronico` varchar(255) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `deportista`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--
-- Creación: 26-10-2023 a las 20:44:21
--

CREATE TABLE `entrenador` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `CorreoElectronico` varchar(255) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `entrenador`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--
-- Creación: 26-10-2023 a las 20:44:21
--

CREATE TABLE `equipo` (
  `ID` int(11) NOT NULL,
  `logoEquipo` varchar(255) NOT NULL,
  `NombreEquipo` varchar(255) NOT NULL,
  `EntrenadorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `equipo`:
--   `EntrenadorID`
--       `entrenador` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--
-- Creación: 26-10-2023 a las 20:44:22
--

CREATE TABLE `evento` (
  `ID` int(11) NOT NULL,
  `NombreEvento` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `SedeID` int(11) DEFAULT NULL,
  `DeporteID` int(11) DEFAULT NULL,
  `FechasHorarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `evento`:
--   `SedeID`
--       `sede` -> `ID`
--   `DeporteID`
--       `deporte` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medalla`
--
-- Creación: 26-10-2023 a las 20:44:24
--

CREATE TABLE `medalla` (
  `ID` int(11) NOT NULL,
  `AtletaID` int(11) DEFAULT NULL,
  `CompetenciaID` int(11) DEFAULT NULL,
  `TipoMedalla` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `medalla`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--
-- Creación: 26-10-2023 a las 20:44:24
--

CREATE TABLE `resultado` (
  `ID` int(11) NOT NULL,
  `CompetenciaID` int(11) DEFAULT NULL,
  `Posicion` int(11) DEFAULT NULL,
  `TiempoPuntuacion` varchar(50) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `resultado`:
--   `CompetenciaID`
--       `competencia` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--
-- Creación: 26-10-2023 a las 20:44:22
--

CREATE TABLE `sede` (
  `ID` int(11) NOT NULL,
  `NombreSede` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `sede`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablaposiciones`
--
-- Creación: 26-10-2023 a las 20:44:23
--

CREATE TABLE `tablaposiciones` (
  `ID` int(11) NOT NULL,
  `CompetenciaID` int(11) DEFAULT NULL,
  `EquipoID` int(11) DEFAULT NULL,
  `Puntaje` int(11) DEFAULT NULL,
  `TarjetasVerdes` int(11) DEFAULT NULL,
  `TarjetasRojas` int(11) DEFAULT NULL,
  `TarjetasAmarillas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `tablaposiciones`:
--   `CompetenciaID`
--       `competencia` -> `ID`
--   `EquipoID`
--       `equipo` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tresprimerospuestos`
--
-- Creación: 26-10-2023 a las 20:44:23
--

CREATE TABLE `tresprimerospuestos` (
  `ID` int(11) NOT NULL,
  `CompetenciaID` int(11) DEFAULT NULL,
  `PrimerPuestoEquipoID` int(11) DEFAULT NULL,
  `SegundoPuestoEquipoID` int(11) DEFAULT NULL,
  `TercerPuestoEquipoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `tresprimerospuestos`:
--   `CompetenciaID`
--       `competencia` -> `ID`
--   `PrimerPuestoEquipoID`
--       `equipo` -> `ID`
--   `SegundoPuestoEquipoID`
--       `equipo` -> `ID`
--   `TercerPuestoEquipoID`
--       `equipo` -> `ID`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EventoID` (`EventoID`);

--
-- Indices de la tabla `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `deportista`
--
ALTER TABLE `deportista`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EntrenadorID` (`EntrenadorID`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SedeID` (`SedeID`),
  ADD KEY `DeporteID` (`DeporteID`);

--
-- Indices de la tabla `medalla`
--
ALTER TABLE `medalla`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CompetenciaID` (`CompetenciaID`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tablaposiciones`
--
ALTER TABLE `tablaposiciones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CompetenciaID` (`CompetenciaID`),
  ADD KEY `EquipoID` (`EquipoID`);

--
-- Indices de la tabla `tresprimerospuestos`
--
ALTER TABLE `tresprimerospuestos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CompetenciaID` (`CompetenciaID`),
  ADD KEY `PrimerPuestoEquipoID` (`PrimerPuestoEquipoID`),
  ADD KEY `SegundoPuestoEquipoID` (`SegundoPuestoEquipoID`),
  ADD KEY `TercerPuestoEquipoID` (`TercerPuestoEquipoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `competencia`
--
ALTER TABLE `competencia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deporte`
--
ALTER TABLE `deporte`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deportista`
--
ALTER TABLE `deportista`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medalla`
--
ALTER TABLE `medalla`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultado`
--
ALTER TABLE `resultado`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tablaposiciones`
--
ALTER TABLE `tablaposiciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tresprimerospuestos`
--
ALTER TABLE `tresprimerospuestos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD CONSTRAINT `competencia_ibfk_1` FOREIGN KEY (`EventoID`) REFERENCES `evento` (`ID`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`EntrenadorID`) REFERENCES `entrenador` (`ID`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`SedeID`) REFERENCES `sede` (`ID`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`DeporteID`) REFERENCES `deporte` (`ID`);

--
-- Filtros para la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`CompetenciaID`) REFERENCES `competencia` (`ID`);

--
-- Filtros para la tabla `tablaposiciones`
--
ALTER TABLE `tablaposiciones`
  ADD CONSTRAINT `tablaposiciones_ibfk_1` FOREIGN KEY (`CompetenciaID`) REFERENCES `competencia` (`ID`),
  ADD CONSTRAINT `tablaposiciones_ibfk_2` FOREIGN KEY (`EquipoID`) REFERENCES `equipo` (`ID`);

--
-- Filtros para la tabla `tresprimerospuestos`
--
ALTER TABLE `tresprimerospuestos`
  ADD CONSTRAINT `tresprimerospuestos_ibfk_1` FOREIGN KEY (`CompetenciaID`) REFERENCES `competencia` (`ID`),
  ADD CONSTRAINT `tresprimerospuestos_ibfk_2` FOREIGN KEY (`PrimerPuestoEquipoID`) REFERENCES `equipo` (`ID`),
  ADD CONSTRAINT `tresprimerospuestos_ibfk_3` FOREIGN KEY (`SegundoPuestoEquipoID`) REFERENCES `equipo` (`ID`),
  ADD CONSTRAINT `tresprimerospuestos_ibfk_4` FOREIGN KEY (`TercerPuestoEquipoID`) REFERENCES `equipo` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
