-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-02-2018 a las 18:50:34
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `places`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_lugar` (IN `id` INT, IN `lugar_i` VARCHAR(100), IN `codigo_i` VARCHAR(50), IN `extension_i` DOUBLE, IN `latitud_i` DOUBLE, IN `longitud_i` DOUBLE, IN `padre_id_i` INT, IN `tipo_lugar_id_i` INT)  BEGIN
	UPDATE lugares SET lugar = lugar_i, codigo = codigo_i, extension = extension_i, latitud = latitud_i, longitud = longitud_i,
								padre_id = padre_id_i, tipo_lugar_id = tipo_lugar_id_i WHERE lugar_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_lugar` (IN `lugar_i` VARCHAR(100), IN `codigo_i` VARCHAR(50), IN `extension_i` DOUBLE, IN `latitud_i` DOUBLE, IN `longitud_i` DOUBLE, IN `padre_id_i` INT, IN `tipo_lugar_id_i` INT, OUT `id` INT)  BEGIN
	SET id = 0;
    INSERT INTO lugares(lugar, codigo, extension, latitud, longitud, padre_id, tipo_lugar_id) 
			VALUES (lugar_i, codigo_i, extension_i, latitud_i, longitud_i, padre_id_i, tipo_lugar_id_i);
	SET id = last_insert_id();
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `lugar_id` int(11) NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `extension` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `tipo_lugar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`lugar_id`, `lugar`, `codigo`, `extension`, `latitud`, `longitud`, `padre_id`, `tipo_lugar_id`) VALUES
(1, 'Honduras', '504', 112492.3, NULL, NULL, 315, 1),
(2, 'Atlántida', '1', 4251, NULL, NULL, 1, 3),
(3, 'La Ceiba', '0101', NULL, NULL, NULL, 2, 4),
(4, 'Esparta', '0102', NULL, NULL, NULL, 2, 4),
(5, 'Jutiapa', '0103', NULL, NULL, NULL, 2, 4),
(6, 'La Masica', '0104', NULL, NULL, NULL, 2, 4),
(7, 'San Francisco', '0105', NULL, NULL, NULL, 2, 4),
(8, 'Tela', '0106', NULL, NULL, NULL, 2, 4),
(9, 'Arizona', '0107', NULL, NULL, NULL, 2, 4),
(10, 'Colón', '2', 8875, NULL, NULL, 1, 3),
(11, 'Trujillo', '0201', NULL, NULL, NULL, 10, 4),
(12, 'Balfate', '0202', NULL, NULL, NULL, 10, 4),
(13, 'Iriona', '0203', NULL, NULL, NULL, 10, 4),
(14, 'Limón', '0204', NULL, NULL, NULL, 10, 4),
(15, 'Sabá', '0205', NULL, NULL, NULL, 10, 4),
(16, 'Santa Fe', '0206', NULL, NULL, NULL, 10, 4),
(17, 'Santa Rosa de Aguán', '0207', NULL, NULL, NULL, 10, 4),
(18, 'Sonaguera', '0208', NULL, NULL, NULL, 10, 4),
(19, 'Tocoa', '0209', NULL, NULL, NULL, 10, 4),
(20, 'Bonito Oriental', '0210', NULL, NULL, NULL, 10, 4),
(21, 'Comayagua', '3', 5196, NULL, NULL, 1, 3),
(22, 'Comayagua', '0301', NULL, NULL, NULL, 21, 4),
(23, 'Ajuterique', '0302', NULL, NULL, NULL, 21, 4),
(24, 'El Rosario', '0303', NULL, NULL, NULL, 21, 4),
(25, 'Esquías', '0304', NULL, NULL, NULL, 21, 4),
(26, 'Humuya', '0305', NULL, NULL, NULL, 21, 4),
(27, 'La Libertad', '0306', NULL, NULL, NULL, 21, 4),
(28, 'Lamaní', '0307', NULL, NULL, NULL, 21, 4),
(29, 'La Trinidad', '0308', NULL, NULL, NULL, 21, 4),
(30, 'Lejamaní', '0309', NULL, NULL, NULL, 21, 4),
(31, 'Meámbar', '0310', NULL, NULL, NULL, 21, 4),
(32, 'Minas de Oro', '0311', NULL, NULL, NULL, 21, 4),
(33, 'Ojos de Agua', '0312', NULL, NULL, NULL, 21, 4),
(34, 'San Jerónimo', '0313', NULL, NULL, NULL, 21, 4),
(35, 'San José de Comayagua', '0314', NULL, NULL, NULL, 21, 4),
(36, 'San José del Potrero', '0315', NULL, NULL, NULL, 21, 4),
(37, 'San Luis', '0316', NULL, NULL, NULL, 21, 4),
(38, 'San Sebastián', '0317', NULL, NULL, NULL, 21, 4),
(39, 'Siguatepeque', '0318', NULL, NULL, NULL, 21, 4),
(40, 'Villa de San Antonio', '0319', NULL, NULL, NULL, 21, 4),
(41, 'Lajas', '0320', NULL, NULL, NULL, 21, 4),
(42, 'Taulabé', '0321', NULL, NULL, NULL, 21, 4),
(43, 'Copán', '4', 3242, NULL, NULL, 1, 3),
(44, 'Santa Rosa de Copán', '0401', NULL, NULL, NULL, 43, 4),
(45, 'Cabañas', '0402', NULL, NULL, NULL, 43, 4),
(46, 'Concepción', '0403', NULL, NULL, NULL, 43, 4),
(47, 'Corquín', '0404', NULL, NULL, NULL, 43, 4),
(48, 'Cucuyagua', '0405', NULL, NULL, NULL, 43, 4),
(49, 'Dolores', '0406', NULL, NULL, NULL, 43, 4),
(50, 'Dulce Nombre', '0407', NULL, NULL, NULL, 43, 4),
(51, 'El Paraíso', '0408', NULL, NULL, NULL, 43, 4),
(52, 'Florida', '0409', NULL, NULL, NULL, 43, 4),
(53, 'La Jigua', '0410', NULL, NULL, NULL, 43, 4),
(54, 'La Unión', '0411', NULL, NULL, NULL, 43, 4),
(55, 'Nueva Arcadia', '0412', NULL, NULL, NULL, 43, 4),
(56, 'San Agustín', '0413', NULL, NULL, NULL, 43, 4),
(57, 'San Antonio', '0414', NULL, NULL, NULL, 43, 4),
(58, 'San Jerónimo', '0415', NULL, NULL, NULL, 43, 4),
(59, 'San José', '0416', NULL, NULL, NULL, 43, 4),
(60, 'San Juan de Opoa', '0417', NULL, NULL, NULL, 43, 4),
(61, 'San Nicolás', '0418', NULL, NULL, NULL, 43, 4),
(62, 'San Pedro', '0419', NULL, NULL, NULL, 43, 4),
(63, 'San Rita', '0420', NULL, NULL, NULL, 43, 4),
(64, 'Trinidad de Copán', '0421', NULL, NULL, NULL, 43, 4),
(65, 'Veracruz', '0422', NULL, NULL, NULL, 43, 4),
(66, 'Cortés', '5', 3954, NULL, NULL, 1, 3),
(67, 'San Pedro Sula', '0501', NULL, NULL, NULL, 66, 4),
(68, 'Choloma', '0502', NULL, NULL, NULL, 66, 4),
(69, 'Omoa', '0503', NULL, NULL, NULL, 66, 4),
(70, 'Pimienta', '0504', NULL, NULL, NULL, 66, 4),
(71, 'Potrerillos', '0505', NULL, NULL, NULL, 66, 4),
(72, 'Puerto Cortés', '0506', NULL, NULL, NULL, 66, 4),
(73, 'San Antonio de Cortés', '0507', NULL, NULL, NULL, 66, 4),
(74, 'San Francisco de Yojoa', '0508', NULL, NULL, NULL, 66, 4),
(75, 'San Manuel', '0509', NULL, NULL, NULL, 66, 4),
(76, 'Santa Cruz de Yojoa', '0510', NULL, NULL, NULL, 66, 4),
(77, 'Villanueva', '0511', NULL, NULL, NULL, 66, 4),
(78, 'La Lima', '0512', NULL, NULL, NULL, 66, 4),
(79, 'Choluteca', '6', 4360, NULL, NULL, 1, 3),
(80, 'Choluteca', '0601', NULL, NULL, NULL, 79, 4),
(81, 'Apacilagua', '0602', NULL, NULL, NULL, 79, 4),
(82, 'Concepción de María', '0603', NULL, NULL, NULL, 79, 4),
(83, 'Duyure', '0604', NULL, NULL, NULL, 79, 4),
(84, 'El Corpues', '0605', NULL, NULL, NULL, 79, 4),
(85, 'El Triunfo', '0606', NULL, NULL, NULL, 79, 4),
(86, 'Marcovia', '0607', NULL, NULL, NULL, 79, 4),
(87, 'Morolica', '0608', NULL, NULL, NULL, 79, 4),
(88, 'Namasigüe', '0609', NULL, NULL, NULL, 79, 4),
(89, 'Orocuina', '0610', NULL, NULL, NULL, 79, 4),
(90, 'Pespire', '0611', NULL, NULL, NULL, 79, 4),
(91, 'San Antonio de Flores', '0612', NULL, NULL, NULL, 79, 4),
(92, 'San Isidro', '0613', NULL, NULL, NULL, 79, 4),
(93, 'San José', '0614', NULL, NULL, NULL, 79, 4),
(94, 'San Marcos de Colón', '0615', NULL, NULL, NULL, 79, 4),
(95, 'Santa Ana de Yusguare', '0616', NULL, NULL, NULL, 79, 4),
(96, 'El Paraíso', '7', 7218, NULL, NULL, 1, 3),
(97, 'Yuscarán', '0701', NULL, NULL, NULL, 96, 4),
(98, 'Alauca', '0702', NULL, NULL, NULL, 96, 4),
(99, 'Danlí', '0703', NULL, NULL, NULL, 96, 4),
(100, 'El Paraíso', '0704', NULL, NULL, NULL, 96, 4),
(101, 'Güinope', '0705', NULL, NULL, NULL, 96, 4),
(102, 'Jacaleapa', '0706', NULL, NULL, NULL, 96, 4),
(103, 'Liure', '0707', NULL, NULL, NULL, 96, 4),
(104, 'Morocelí', '0708', NULL, NULL, NULL, 96, 4),
(105, 'Potrerillos', '0709', NULL, NULL, NULL, 96, 4),
(106, 'San Antonio de Flores', '0710', NULL, NULL, NULL, 96, 4),
(107, 'San Lucas', '0711', NULL, NULL, NULL, 96, 4),
(108, 'San Matías', '0712', NULL, NULL, NULL, 96, 4),
(109, 'Soledad', '0713', NULL, NULL, NULL, 96, 4),
(110, 'Teupasenti', '0714', NULL, NULL, NULL, 96, 4),
(111, 'Texiguat', '0715', NULL, NULL, NULL, 96, 4),
(112, 'Vado Ancho', '0716', NULL, NULL, NULL, 96, 4),
(113, 'Yauyupe', '0717', NULL, NULL, NULL, 96, 4),
(114, 'Trojes', '0718', NULL, NULL, NULL, 96, 4),
(115, 'Francisco Morazán', '8', 8619, NULL, NULL, 1, 3),
(116, 'Tegucigalpa D. C.', '0801', NULL, NULL, NULL, 115, 4),
(117, 'Alubarén', '0802', NULL, NULL, NULL, 115, 4),
(118, 'Cedros', '0803', NULL, NULL, NULL, 115, 4),
(119, 'Curarén', '0804', NULL, NULL, NULL, 115, 4),
(120, 'El Porvenir', '0805', NULL, NULL, NULL, 115, 4),
(121, 'Guaimaca', '0806', NULL, NULL, NULL, 115, 4),
(122, 'La Libertad', '0807', NULL, NULL, NULL, 115, 4),
(123, 'La Venta', '0808', NULL, NULL, NULL, 115, 4),
(124, 'Lepaterique', '0809', NULL, NULL, NULL, 115, 4),
(125, 'Maraita', '0810', NULL, NULL, NULL, 115, 4),
(126, 'Marale', '0811', NULL, NULL, NULL, 115, 4),
(127, 'Nueva Armenia', '0812', NULL, NULL, NULL, 115, 4),
(128, 'Ojojona', '0813', NULL, NULL, NULL, 115, 4),
(129, 'Orica', '0814', NULL, NULL, NULL, 115, 4),
(130, 'Reitoca', '0815', NULL, NULL, NULL, 115, 4),
(131, 'Sabanagrane', '0816', NULL, NULL, NULL, 115, 4),
(132, 'San Antonio de Oriente', '0817', NULL, NULL, NULL, 115, 4),
(133, 'San Buenaventura', '0818', NULL, NULL, NULL, 115, 4),
(134, 'San Ignacio', '0819', NULL, NULL, NULL, 115, 4),
(135, 'San Juan de Flores', '0820', NULL, NULL, NULL, 115, 4),
(136, 'San Miguelito', '0821', NULL, NULL, NULL, 115, 4),
(137, 'Santa Ana', '0822', NULL, NULL, NULL, 115, 4),
(138, 'Santa Lucia', '0823', NULL, NULL, NULL, 115, 4),
(139, 'Talanga', '0824', NULL, NULL, NULL, 115, 4),
(140, 'Tatumbla', '0825', NULL, NULL, NULL, 115, 4),
(141, 'Valle de Ángeles', '0826', NULL, NULL, NULL, 115, 4),
(142, 'Villa de San Francisco', '0827', NULL, NULL, NULL, 115, 4),
(143, 'Vallecillo', '0828', NULL, NULL, NULL, 115, 4),
(144, 'Gracias a Dios', '9', 16630, NULL, NULL, 1, 3),
(145, 'Puerto Lempira', '0901', NULL, NULL, NULL, 144, 4),
(146, 'Brus Laguna', '0902', NULL, NULL, NULL, 144, 4),
(147, 'Ahuas', '0903', NULL, NULL, NULL, 144, 4),
(148, 'Juan Francisco Bulnes', '0904', NULL, NULL, NULL, 144, 4),
(149, 'Villeda Morales', '0905', NULL, NULL, NULL, 144, 4),
(150, 'Wampusirpe', '0906', NULL, NULL, NULL, 144, 4),
(151, 'Intibucá', '10', 3072, NULL, NULL, 1, 3),
(152, 'La Esperanza', '1001', NULL, NULL, NULL, 151, 4),
(153, 'Camasca', '1002', NULL, NULL, NULL, 151, 4),
(154, 'Colomoncagua', '1003', NULL, NULL, NULL, 151, 4),
(155, 'Concepción', '1004', NULL, NULL, NULL, 151, 4),
(156, 'Dolores', '1005', NULL, NULL, NULL, 151, 4),
(157, 'Intibucá', '1006', NULL, NULL, NULL, 151, 4),
(158, 'Jesús de Otoro', '1007', NULL, NULL, NULL, 151, 4),
(159, 'Magdalena', '1008', NULL, NULL, NULL, 151, 4),
(160, 'Masaguara', '1009', NULL, NULL, NULL, 151, 4),
(161, 'San Antonio', '1010', NULL, NULL, NULL, 151, 4),
(162, 'San Isidro', '1011', NULL, NULL, NULL, 151, 4),
(163, 'San Juan de Flores', '1012', NULL, NULL, NULL, 151, 4),
(164, 'San Marcos de la Sierra', '1013', NULL, NULL, NULL, 151, 4),
(165, 'San Miguels Guancapla', '1014', NULL, NULL, NULL, 151, 4),
(166, 'Santa Lucia', '1015', NULL, NULL, NULL, 151, 4),
(167, 'Yamaranguila', '1016', NULL, NULL, NULL, 151, 4),
(168, 'San Francisco de Opalaca', '1017', NULL, NULL, NULL, 151, 4),
(169, 'Islas de la Bahía', '11', 260, NULL, NULL, 1, 3),
(170, 'Roatán', '1101', NULL, NULL, NULL, 169, 4),
(171, 'Guanaja', '1102', NULL, NULL, NULL, 169, 4),
(172, 'José Santos Guardiola', '1103', NULL, NULL, NULL, 169, 4),
(173, 'Utila', '1104', NULL, NULL, NULL, 169, 4),
(174, 'La Paz', '12', 2331, NULL, NULL, 1, 3),
(175, 'La Paz', '1201', NULL, NULL, NULL, 174, 4),
(176, 'Aguancaterique', '1202', NULL, NULL, NULL, 174, 4),
(177, 'Cabañas', '1203', NULL, NULL, NULL, 174, 4),
(178, 'Cane', '1204', NULL, NULL, NULL, 174, 4),
(179, 'Chinacla', '1205', NULL, NULL, NULL, 174, 4),
(180, 'Guajiquiro', '1206', NULL, NULL, NULL, 174, 4),
(181, 'Lauterique', '1207', NULL, NULL, NULL, 174, 4),
(182, 'Marcala', '1208', NULL, NULL, NULL, 174, 4),
(183, 'Mercedes de Oriente', '1209', NULL, NULL, NULL, 174, 4),
(184, 'Opatoro', '1210', NULL, NULL, NULL, 174, 4),
(185, 'San Antonio del Norte', '1211', NULL, NULL, NULL, 174, 4),
(186, 'San José', '1212', NULL, NULL, NULL, 174, 4),
(187, 'San Juan', '1213', NULL, NULL, NULL, 174, 4),
(188, 'San Pedro de Tutule', '1214', NULL, NULL, NULL, 174, 4),
(189, 'Santa Ana', '1215', NULL, NULL, NULL, 174, 4),
(190, 'Santa Elena', '1216', NULL, NULL, NULL, 174, 4),
(191, 'Santa María', '1217', NULL, NULL, NULL, 174, 4),
(192, 'Santiago Puringla', '1218', NULL, NULL, NULL, 174, 4),
(193, 'Yarula', '1219', NULL, NULL, NULL, 174, 4),
(194, 'Lempira', '13', 4228, NULL, NULL, 1, 3),
(195, 'Gracias', '1301', NULL, NULL, NULL, 194, 4),
(196, 'Belén', '1302', NULL, NULL, NULL, 194, 4),
(197, 'Candelaria', '1303', NULL, NULL, NULL, 194, 4),
(198, 'Cololaca', '1304', NULL, NULL, NULL, 194, 4),
(199, 'Erandique', '1305', NULL, NULL, NULL, 194, 4),
(200, 'Gualcinse', '1306', NULL, NULL, NULL, 194, 4),
(201, 'Guarita', '1307', NULL, NULL, NULL, 194, 4),
(202, 'La Campa', '1308', NULL, NULL, NULL, 194, 4),
(203, 'La Iguala', '1309', NULL, NULL, NULL, 194, 4),
(204, 'Las Flores', '1310', NULL, NULL, NULL, 194, 4),
(205, 'La Unión', '1311', NULL, NULL, NULL, 194, 4),
(206, 'La Virtud', '1312', NULL, NULL, NULL, 194, 4),
(207, 'Lepaera', '1313', NULL, NULL, NULL, 194, 4),
(208, 'Mapulaca', '1314', NULL, NULL, NULL, 194, 4),
(209, 'Piraera', '1315', NULL, NULL, NULL, 194, 4),
(210, 'San Andrés', '1316', NULL, NULL, NULL, 194, 4),
(211, 'San Francisco', '1317', NULL, NULL, NULL, 194, 4),
(212, 'San Juan Guarita', '1318', NULL, NULL, NULL, 194, 4),
(213, 'San Manuel Colohete', '1319', NULL, NULL, NULL, 194, 4),
(214, 'San Rafael', '1320', NULL, NULL, NULL, 194, 4),
(215, 'San Sebastián', '1321', NULL, NULL, NULL, 194, 4),
(216, 'Santa Cruz', '1322', NULL, NULL, NULL, 194, 4),
(217, 'Talgua', '1323', NULL, NULL, NULL, 194, 4),
(218, 'Tambla', '1324', NULL, NULL, NULL, 194, 4),
(219, 'Tomalá', '1325', NULL, NULL, NULL, 194, 4),
(220, 'Valladolid', '1326', NULL, NULL, NULL, 194, 4),
(221, 'Virginia', '1327', NULL, NULL, NULL, 194, 4),
(222, 'San Marcos de Caiquín', '1328', NULL, NULL, NULL, 194, 4),
(223, 'Ocotepeque', '14', 1680, NULL, NULL, 1, 3),
(224, 'Nueva Ocotepeque', '1401', NULL, NULL, NULL, 223, 4),
(225, 'Belén Gualcho', '1402', NULL, NULL, NULL, 223, 4),
(226, 'Concepción', '1403', NULL, NULL, NULL, 223, 4),
(227, 'Dolores de Merendón', '1404', NULL, NULL, NULL, 223, 4),
(228, 'Fraternidad', '1405', NULL, NULL, NULL, 223, 4),
(229, 'La Encarnación', '1406', NULL, NULL, NULL, 223, 4),
(230, 'La Labor', '1407', NULL, NULL, NULL, 223, 4),
(231, 'Lucerna', '1408', NULL, NULL, NULL, 223, 4),
(232, 'Mercedes', '1409', NULL, NULL, NULL, 223, 4),
(233, 'San Fernando', '1410', NULL, NULL, NULL, 223, 4),
(234, 'San Francisco del Valle', '1411', NULL, NULL, NULL, 223, 4),
(235, 'San Jorge', '1412', NULL, NULL, NULL, 223, 4),
(236, 'San Marcos', '1413', NULL, NULL, NULL, 223, 4),
(237, 'Santa Fé', '1414', NULL, NULL, NULL, 223, 4),
(238, 'Sensenti', '1415', NULL, NULL, NULL, 223, 4),
(239, 'Sinuapa', '1416', NULL, NULL, NULL, 223, 4),
(240, 'Olancho', '15', 23905, NULL, NULL, 1, 3),
(241, 'Juticalpa', '1501', NULL, NULL, NULL, 240, 4),
(242, 'Campamento', '1502', NULL, NULL, NULL, 240, 4),
(243, 'Catacamas', '1503', NULL, NULL, NULL, 240, 4),
(244, 'Concordia', '1504', NULL, NULL, NULL, 240, 4),
(245, 'Dulce Nombre de Culmí', '1505', NULL, NULL, NULL, 240, 4),
(246, 'El Rosario', '1506', NULL, NULL, NULL, 240, 4),
(247, 'Esquipulas del Norte', '1507', NULL, NULL, NULL, 240, 4),
(248, 'Gualaco', '1508', NULL, NULL, NULL, 240, 4),
(249, 'Guarizama', '1509', NULL, NULL, NULL, 240, 4),
(250, 'Guata', '1510', NULL, NULL, NULL, 240, 4),
(251, 'Guayape', '1511', NULL, NULL, NULL, 240, 4),
(252, 'Jano', '1512', NULL, NULL, NULL, 240, 4),
(253, 'La Unión', '1513', NULL, NULL, NULL, 240, 4),
(254, 'Manguilile', '1514', NULL, NULL, NULL, 240, 4),
(255, 'Manto', '1515', NULL, NULL, NULL, 240, 4),
(256, 'Salamá', '1516', NULL, NULL, NULL, 240, 4),
(257, 'San Esteban', '1517', NULL, NULL, NULL, 240, 4),
(258, 'San Francisco de Becerra', '1518', NULL, NULL, NULL, 240, 4),
(259, 'San Francisco de la Paz', '1519', NULL, NULL, NULL, 240, 4),
(260, 'Santa María del Real', '1520', NULL, NULL, NULL, 240, 4),
(261, 'Silca', '1521', NULL, NULL, NULL, 240, 4),
(262, 'Yocón', '1522', NULL, NULL, NULL, 240, 4),
(263, 'Patuca', '1523', NULL, NULL, NULL, 240, 4),
(264, 'Santa Bárbara', '16', 5321, NULL, NULL, 1, 3),
(265, 'Santa Bárbara', '1601', NULL, NULL, NULL, 264, 4),
(266, 'Arada', '1602', NULL, NULL, NULL, 264, 4),
(267, 'Atima', '1603', NULL, NULL, NULL, 264, 4),
(268, 'Azacualpa', '1604', NULL, NULL, NULL, 264, 4),
(269, 'Ceguaca', '1605', NULL, NULL, NULL, 264, 4),
(270, 'Colinas', '1606', NULL, NULL, NULL, 264, 4),
(271, 'Concepción del Norte', '1607', NULL, NULL, NULL, 264, 4),
(272, 'Concepción del Sur', '1608', NULL, NULL, NULL, 264, 4),
(273, 'Chinda', '1609', NULL, NULL, NULL, 264, 4),
(274, 'El Níspero', '1610', NULL, NULL, NULL, 264, 4),
(275, 'Gualala', '1611', NULL, NULL, NULL, 264, 4),
(276, 'Ilama', '1612', NULL, NULL, NULL, 264, 4),
(277, 'Macuelizo', '1613', NULL, NULL, NULL, 264, 4),
(278, 'Naranjito', '1614', NULL, NULL, NULL, 264, 4),
(279, 'Nueva Celilac', '1615', NULL, NULL, NULL, 264, 4),
(280, 'Petoa', '1616', NULL, NULL, NULL, 264, 4),
(281, 'Protección', '1617', NULL, NULL, NULL, 264, 4),
(282, 'Quimistán', '1618', NULL, NULL, NULL, 264, 4),
(283, 'San Francisco de Ojuera', '1619', NULL, NULL, NULL, 264, 4),
(284, 'San Luis', '1620', NULL, NULL, NULL, 264, 4),
(285, 'San Marcos', '1621', NULL, NULL, NULL, 264, 4),
(286, 'San Nicolás', '1622', NULL, NULL, NULL, 264, 4),
(287, 'San Pedro Zacapa', '1623', NULL, NULL, NULL, 264, 4),
(288, 'Santa Rita', '1624', NULL, NULL, NULL, 264, 4),
(289, 'San Vicente Centenario', '1625', NULL, NULL, NULL, 264, 4),
(290, 'Trinidad', '1626', NULL, NULL, NULL, 264, 4),
(291, 'Las Vegas', '1627', NULL, NULL, NULL, 264, 4),
(292, 'Nueva Frontera', '1628', NULL, NULL, NULL, 264, 4),
(293, 'Valle', '17', 1665, NULL, NULL, 1, 3),
(294, 'Nacaome', '1701', NULL, NULL, NULL, 293, 4),
(295, 'Alianza', '1702', NULL, NULL, NULL, 293, 4),
(296, 'Amapala', '1703', NULL, NULL, NULL, 293, 4),
(297, 'Aramecina', '1704', NULL, NULL, NULL, 293, 4),
(298, 'Caridad', '1705', NULL, NULL, NULL, 293, 4),
(299, 'Goascorán', '1706', NULL, NULL, NULL, 293, 4),
(300, 'Langue', '1707', NULL, NULL, NULL, 293, 4),
(301, 'San Francisco de Coray', '1708', NULL, NULL, NULL, 293, 4),
(302, 'San Lorenzo', '1709', NULL, NULL, NULL, 293, 4),
(303, 'Yoro', '18', 7781, NULL, NULL, 1, 3),
(304, 'Yoro', '1801', NULL, NULL, NULL, 303, 4),
(305, 'Arenal', '1802', NULL, NULL, NULL, 303, 4),
(306, 'El Negrito', '1803', NULL, NULL, NULL, 303, 4),
(307, 'El Progreso', '1804', NULL, NULL, NULL, 303, 4),
(308, 'Jocón', '1805', NULL, NULL, NULL, 303, 4),
(309, 'Morazán', '1806', NULL, NULL, NULL, 303, 4),
(310, 'Olanchito', '1807', NULL, NULL, NULL, 303, 4),
(311, 'Santa Rita', '1808', NULL, NULL, NULL, 303, 4),
(312, 'Sulaco', '1809', NULL, NULL, NULL, 303, 4),
(313, 'Victoria', '1810', NULL, NULL, NULL, 303, 4),
(314, 'Yorito', '1811', NULL, NULL, NULL, 303, 4),
(315, 'América', NULL, 42978000, NULL, NULL, NULL, 1),
(324, 'Asia', NULL, 44541138, NULL, NULL, NULL, 1),
(325, 'Africa', NULL, 30221535, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_lugares`
--

CREATE TABLE `tipo_lugares` (
  `tipo_lugar_id` int(11) NOT NULL,
  `tipo_lugar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_lugares`
--

INSERT INTO `tipo_lugares` (`tipo_lugar_id`, `tipo_lugar`) VALUES
(1, 'Continente'),
(2, 'País'),
(3, 'Departamento'),
(4, 'Municipio'),
(5, 'Estado'),
(6, 'Provincia'),
(8, 'Condado'),
(9, 'Planeta'),
(10, 'Aldea'),
(11, 'Cacerío'),
(12, 'Subcontinente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`lugar_id`),
  ADD KEY `fk_lugar_padre` (`padre_id`),
  ADD KEY `fk_tipo_lugar` (`tipo_lugar_id`);

--
-- Indices de la tabla `tipo_lugares`
--
ALTER TABLE `tipo_lugares`
  ADD PRIMARY KEY (`tipo_lugar_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `lugar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT de la tabla `tipo_lugares`
--
ALTER TABLE `tipo_lugares`
  MODIFY `tipo_lugar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD CONSTRAINT `fk_lugar_padre` FOREIGN KEY (`padre_id`) REFERENCES `lugares` (`lugar_id`),
  ADD CONSTRAINT `fk_tipo_lugar` FOREIGN KEY (`tipo_lugar_id`) REFERENCES `tipo_lugares` (`tipo_lugar_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
