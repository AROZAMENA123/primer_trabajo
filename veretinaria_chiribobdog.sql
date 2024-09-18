-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2024 a las 14:57:14
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
-- Base de datos: `veretinaria_chiribobdog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajero`
--

CREATE TABLE `cajero` (
  `ID_cajero` int(10) NOT NULL,
  `CI` int(10) NOT NULL,
  `nombre_ca` varchar(30) NOT NULL,
  `ap_p` varchar(30) NOT NULL,
  `ap_m` varchar(30) NOT NULL,
  `direnccion` varchar(30) NOT NULL,
  `celular` int(10) NOT NULL,
  `sueldo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_cliente` int(10) NOT NULL,
  `CI_cli` int(10) NOT NULL,
  `nombre_cli` varchar(30) NOT NULL,
  `ap_p_cli` varchar(30) NOT NULL,
  `ap_m_cli` varchar(30) NOT NULL,
  `direnccion_cli` varchar(30) NOT NULL,
  `celular_cli` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_sanitario`
--

CREATE TABLE `control_sanitario` (
  `ID_control` int(10) NOT NULL,
  `fecha_control` date NOT NULL,
  `detalle_control` varchar(30) NOT NULL,
  `ID_doc` int(10) NOT NULL,
  `ID_mascot` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `ID_doctor` int(10) NOT NULL,
  `CI_d` int(10) NOT NULL,
  `nombre_d` varchar(30) NOT NULL,
  `ap_p_d` varchar(30) NOT NULL,
  `ap_m_d` varchar(30) NOT NULL,
  `direnccion_d` varchar(30) NOT NULL,
  `celular_d` int(10) NOT NULL,
  `sueldo_d` int(10) NOT NULL,
  `titulo_d` varchar(10) NOT NULL,
  `cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `ID_mascota` int(10) NOT NULL,
  `nombre_mascota` varchar(30) NOT NULL,
  `raza` varchar(30) NOT NULL,
  `edad` int(10) NOT NULL,
  `ID_cli` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peluqueria`
--

CREATE TABLE `peluqueria` (
  `ID_peluqueria` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `tipo_corte` varchar(30) DEFAULT NULL,
  `detalle` varchar(30) NOT NULL,
  `ID_pe` int(10) NOT NULL,
  `ID_mas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peluquero`
--

CREATE TABLE `peluquero` (
  `ID_peluquero` int(10) NOT NULL,
  `CI_pel` int(10) NOT NULL,
  `nombre_pel` varchar(30) NOT NULL,
  `ap_p_pel` varchar(30) NOT NULL,
  `ap_m_pel` varchar(30) NOT NULL,
  `direnccion_pel` varchar(30) NOT NULL,
  `celular_pel` int(10) NOT NULL,
  `sueldo_pel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `ID_recibo` int(10) NOT NULL,
  `fecha_pago` date NOT NULL,
  `ID_client` int(10) NOT NULL,
  `total_pago` int(10) NOT NULL,
  `ID_t` int(10) NOT NULL,
  `ID_caj` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `ID_tipo_servicio` int(10) NOT NULL,
  `ID_p` int(10) NOT NULL,
  `ID_c` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD PRIMARY KEY (`ID_cajero`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indices de la tabla `control_sanitario`
--
ALTER TABLE `control_sanitario`
  ADD PRIMARY KEY (`ID_control`),
  ADD KEY `ID_doc` (`ID_doc`),
  ADD KEY `ID_mascot` (`ID_mascot`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID_doctor`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`ID_mascota`),
  ADD KEY `ID_cli` (`ID_cli`);

--
-- Indices de la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  ADD PRIMARY KEY (`ID_peluqueria`),
  ADD KEY `ID_pe` (`ID_pe`),
  ADD KEY `ID_mas` (`ID_mas`);

--
-- Indices de la tabla `peluquero`
--
ALTER TABLE `peluquero`
  ADD PRIMARY KEY (`ID_peluquero`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`ID_recibo`),
  ADD KEY `ID_caj` (`ID_caj`),
  ADD KEY `ID_t` (`ID_t`),
  ADD KEY `ID_client` (`ID_client`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`ID_tipo_servicio`),
  ADD KEY `ID_p` (`ID_p`),
  ADD KEY `ID_c` (`ID_c`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `control_sanitario`
--
ALTER TABLE `control_sanitario`
  ADD CONSTRAINT `control_sanitario_ibfk_1` FOREIGN KEY (`ID_doc`) REFERENCES `doctor` (`ID_doctor`),
  ADD CONSTRAINT `control_sanitario_ibfk_2` FOREIGN KEY (`ID_mascot`) REFERENCES `mascota` (`ID_mascota`);

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`ID_cli`) REFERENCES `cliente` (`ID_cliente`);

--
-- Filtros para la tabla `peluqueria`
--
ALTER TABLE `peluqueria`
  ADD CONSTRAINT `peluqueria_ibfk_1` FOREIGN KEY (`ID_pe`) REFERENCES `peluquero` (`ID_peluquero`),
  ADD CONSTRAINT `peluqueria_ibfk_2` FOREIGN KEY (`ID_mas`) REFERENCES `mascota` (`ID_mascota`);

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `recibo_ibfk_1` FOREIGN KEY (`ID_caj`) REFERENCES `cajero` (`ID_cajero`),
  ADD CONSTRAINT `recibo_ibfk_2` FOREIGN KEY (`ID_t`) REFERENCES `tipo_servicio` (`ID_tipo_servicio`),
  ADD CONSTRAINT `recibo_ibfk_3` FOREIGN KEY (`ID_client`) REFERENCES `cliente` (`ID_cliente`);

--
-- Filtros para la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD CONSTRAINT `tipo_servicio_ibfk_1` FOREIGN KEY (`ID_p`) REFERENCES `peluqueria` (`ID_peluqueria`),
  ADD CONSTRAINT `tipo_servicio_ibfk_2` FOREIGN KEY (`ID_c`) REFERENCES `control_sanitario` (`ID_control`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
