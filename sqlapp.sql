-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2025 a las 23:10:01
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
-- Base de datos: `administrationsdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type_file` enum('IVA','ICA','RTE') NOT NULL,
  `archivo_pdf` varchar(255) NOT NULL,
  `created_at` time DEFAULT NULL,
  `updated_at` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_company` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name_company`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'cesar saucedo salazar s.a.s', '/uploads/logos/logoCompanyCesar.jpg', '2025-04-02 20:48:08', '2025-04-02 20:48:08'),
(2, 'coca cola', '/uploads/logos/1743627214928_barca.jpg', '2025-04-02 20:53:34', '2025-04-02 20:53:34'),
(3, 'postobon', '/uploads/logos/1743627256411_barca.jpg', '2025-04-02 20:54:16', '2025-04-02 20:54:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filedetails`
--

CREATE TABLE `filedetails` (
  `id` int(10) UNSIGNED NOT NULL,
  `filesExcels_id` int(10) UNSIGNED DEFAULT NULL,
  `tp_rete` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `dv` int(11) NOT NULL,
  `name_company` varchar(255) NOT NULL,
  `name_concept` varchar(255) NOT NULL,
  `base` int(11) NOT NULL,
  `value_retained` int(11) NOT NULL,
  `percentage` decimal(7,3) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filesexcels`
--

CREATE TABLE `filesexcels` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_file` enum('IVA','ICA','RTE') NOT NULL,
  `name_file` varchar(255) NOT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `year` int(11) NOT NULL,
  `period` enum('Enero-Febrero','Marzo-Abril','Mayo-Junio','Julio-Agosto','Septiembre-Octubre','Noviembre-Diciembre','Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre') NOT NULL,
  `created_at` time DEFAULT NULL,
  `updated_at` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_rol` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name_rol`, `created_at`, `updated_at`) VALUES
(1, 'administrador', '2025-04-02 20:48:08', '2025-04-02 20:48:08'),
(2, 'empleado', '2025-04-02 20:48:08', '2025-04-02 20:48:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nit` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `rol_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nit`, `password`, `company_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 11010101, '$2b$10$pTKNb7zqyEenx8IE8Ue9...SNYdqQEzg9WaEezsCanBUMrrdEXeIa', 1, 1, '2025-04-02 20:48:08', '2025-04-02 20:48:08'),
(2, 110101021, '$2b$10$xWM4nqyOHhwhvxRKg8T/Ieu9ykLiPd0qMh4v9NWqhpQvYFZVrR1De', 1, 2, '2025-04-02 20:48:08', '2025-04-02 20:48:08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `filedetails`
--
ALTER TABLE `filedetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filesExcels_id` (`filesExcels_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `filesexcels`
--
ALTER TABLE `filesexcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nit` (`nit`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `filedetails`
--
ALTER TABLE `filedetails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `filesexcels`
--
ALTER TABLE `filesexcels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `filedetails`
--
ALTER TABLE `filedetails`
  ADD CONSTRAINT `filedetails_ibfk_1` FOREIGN KEY (`filesExcels_id`) REFERENCES `filesexcels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `filedetails_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `filesexcels`
--
ALTER TABLE `filesexcels`
  ADD CONSTRAINT `filesexcels_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
