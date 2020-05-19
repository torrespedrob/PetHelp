-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2020 a las 00:43:45
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pethelp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `CodMas` int(5) NOT NULL,
  `NomMas` varchar(50) NOT NULL,
  `TipoMas` varchar(50) NOT NULL,
  `RazaMas` varchar(50) DEFAULT NULL,
  `UsuMas` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`CodMas`, `NomMas`, `TipoMas`, `RazaMas`, `UsuMas`) VALUES
(14, 'Willy', 'Perro', 'Labrador', 17),
(15, 'Garfield', 'Gato', 'Persa', 17),
(16, 'Kinder', 'Gato', 'Himalayo', 18),
(17, 'Reina', 'Perro', 'Cavalier King', 18),
(18, 'Blu', 'Ave', 'Canario', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio`
--

CREATE TABLE `recordatorio` (
  `CodRec` int(5) NOT NULL,
  `NomRec` varchar(50) NOT NULL,
  `DetRec` text NOT NULL,
  `UsuRec` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recordatorio`
--

INSERT INTO `recordatorio` (`CodRec`, `NomRec`, `DetRec`, `UsuRec`) VALUES
(6, 'Vacuna', 'Visitar al veterinario el 19 para la vacuna de Willy.', 17),
(7, 'Compra', 'Comprar la medicina sugerida para Garfield. ', 17),
(8, 'Compra', 'Comprar un envase de agua nuevo para Blu.', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CodUsu` int(5) NOT NULL,
  `NomUsu` varchar(50) NOT NULL,
  `ConUsu` varchar(50) NOT NULL,
  `CorUsu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CodUsu`, `NomUsu`, `ConUsu`, `CorUsu`) VALUES
(17, 'Pepe', '81DC9BDB52D04DC20036DBD8313ED055', 'pepe@gmail.com'),
(18, 'Juan', 'D93591BDF7860E1E4EE2FCA799911215', 'juan@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`CodMas`),
  ADD KEY `propietario_de_mascota` (`UsuMas`);

--
-- Indices de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD PRIMARY KEY (`CodRec`),
  ADD KEY `propietario_de_recordatorio` (`UsuRec`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CodUsu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `CodMas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `CodRec` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CodUsu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD CONSTRAINT `propietario_de_recordatorio` FOREIGN KEY (`UsuRec`) REFERENCES `usuario` (`CodUsu`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
