-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2024 a las 04:54:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcontactos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `Id_contacto` int(10) NOT NULL,
  `Nombres` varchar(250) NOT NULL,
  `Celular` bigint(10) NOT NULL,
  `Foto` varchar(250) NOT NULL DEFAULT 'sinfoto.jpg',
  `pais` varchar(100) NOT NULL DEFAULT 'Colombia',
  `Ciudad` varchar(250) NOT NULL DEFAULT 'Valledupar',
  `Categoria` varchar(100) NOT NULL DEFAULT 'Amigo',
  `Correo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`Id_contacto`, `Nombres`, `Celular`, `Foto`, `pais`, `Ciudad`, `Categoria`, `Correo`) VALUES
(1, 'Adelaida Maestre', 300624788, 'sinfoto.jpg', 'Colombia', 'Valledupar', 'estudios', 'adelaidamarmaestre@gmail.com'),
(2, 'Juan Maestre', 315615569, 'sinfoto.jpg', 'Colombia', 'Valledupar', 'Trabajo', 'juanlearning@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`Id_contacto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `Id_contacto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
