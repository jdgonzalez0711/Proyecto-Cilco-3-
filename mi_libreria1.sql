-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.9.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para mi_libreria
CREATE DATABASE IF NOT EXISTS `mi_libreria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mi_libreria`;

-- Volcando estructura para tabla mi_libreria.biblioteca
CREATE TABLE IF NOT EXISTS `biblioteca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_seleccion` date DEFAULT NULL,
  `fecha_inicio_lectura` date DEFAULT NULL,
  `fecha_fin_lectura` date DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `meta_lectura` varchar(100) DEFAULT NULL,
  `calificacion` tinyint(4) DEFAULT NULL,
  `id_libro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `biblioteca_FK` (`id_usuario`),
  KEY `biblioteca_FK_1` (`id_libro`),
  CONSTRAINT `biblioteca_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `biblioteca_FK_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla mi_libreria.biblioteca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;

-- Volcando estructura para tabla mi_libreria.libros
CREATE TABLE IF NOT EXISTS `libros` (
  `id_libro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `sub_categoria` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL,
  `paginas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE KEY `libros_un` (`titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla mi_libreria.libros: ~99 rows (aproximadamente)
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` (`id_libro`, `titulo`, `categoria`, `sub_categoria`, `autor`, `anio_publicacion`, `paginas`) VALUES
	(1, 'La cronica', 'Biografia', 'Obra de referencia', 'Martin Caparros', 2015, 321),
	(2, 'Cien a�os de soledad', 'Novela', 'Ficcion ', 'Gabriel Garcia Marquez', 1967, 471),
	(3, 'Orgullo y prejuicio', 'Novela', 'Romance', 'Jane Austen', 1813, 384),
	(4, 'Don Quijote de la Mancha', 'Novela', 'Ficcion ', 'Miguel de Servantes Saavedra', 1605, 1345),
	(5, 'Odisea', 'Epopeya', 'Historica', 'Homero', 1906, 254),
	(6, 'Divina Comedia', 'Epopeya', 'Ficcion ', 'Dante Alighieri', 1320, 700),
	(7, 'Crimen y castigo', 'Novela', '', 'Fiodoro Dostoyevski', 1866, 650),
	(8, 'El principito', 'Novela', 'Filosofico ', 'Antoine de Saint-Exupery', 1943, 96),
	(9, 'El retrato de Dorian Gray', 'Novela', '', 'Oscar Wilde', 1890, 320),
	(10, 'Hamlet', 'Drama', 'Tragedia', 'William Shakespeare', 1603, 208),
	(11, 'Mujercitas ', 'Novela', 'Ficcion ', 'Louisa May Alcott', 1868, 432),
	(12, 'Iliada', 'Epopeya', 'Historico', 'Homero', 2004, 187),
	(13, 'Matar un ruise�or', 'Novela', '', 'Harper Lee', 1960, 281),
	(14, 'Romeo y Julieta', 'Drama', 'Tragedia ', 'William Shakespeare', 1597, 217),
	(15, 'Viaje al centro de la Tierra', 'Novela', '', 'Julio Verne', 1864, 320),
	(16, 'Moby-Dick', 'Novela', '', 'Herman Melville', 1851, 619),
	(17, 'La teoria de Todo', 'Novela', 'Cientifica ', 'Stephen Hawking', 2002, 152),
	(18, 'Cronica de una muerte anunciada ', 'Novela ', '', 'Gabriel Garcia Marquez', 1981, 128),
	(19, 'It ', 'Novela', 'Terror', 'Stephen King', 1986, 1504),
	(20, 'El perfume ', 'Novela ', '', 'Patrick Suskind', 1985, 255),
	(21, 'La insoportable levedad del ser ', 'Novela', 'Filosofico ', 'Milan Kundera', 1984, 336),
	(22, 'El codigo Da Vinci', 'Novela', '', 'Dan Brown', 2003, 656),
	(23, 'El amor en los tiempos del colera ', 'Novela', '', 'Gabriel Garcia Marquez', 1985, 490),
	(24, 'El extrangero ', 'Novela', '', 'Albert Camus ', 1942, 152),
	(25, 'La ladrona de libros ', 'Novela ', '', 'Markus Zusak', 2005, 544),
	(26, 'Frankenstein o el modelo prometeo', 'Novela ', 'Ficcion ', 'Mary Shelley', 1818, 220),
	(27, 'Las aventuras de Alicia en el pais de las maravillas ', 'Infantil', 'Fantasia ', 'Lewis Carroll', 1865, 784),
	(28, 'El guardian entre el centeno ', 'Novela', 'Ficcion ', 'J. D. Salinger ', 1951, 277),
	(29, 'Lo que el viento se llevo ', 'Novela', '', 'Margaret Mitchell', 1936, 1037),
	(30, 'Lolita', 'Novela', 'Ficcion ', 'Vladimir Nabocov', 1955, 392),
	(31, 'Ficciones ', 'Cuento', 'Fantasia ', 'Jorge Luis Borges ', 1944, 1001),
	(32, 'Grandes Esperanzas ', 'Novela ', 'Ficcion ', 'Charles Dickens ', 1860, 222),
	(33, 'Carrie', 'Novela ', 'Terror', 'Stephen King', 1974, 256),
	(34, 'Flores en el atico', 'Novela', 'Ficcion ', 'V.C Andrews', 1979, 470),
	(35, 'Prohibido', 'Novela', 'Romance', 'Tabitha Suzuma', 2010, 353),
	(36, 'Las ventajas de ser invisible ', 'Novela', 'Autoayuda ', 'Stephen Chbosky', 1999, 263),
	(37, 'El camino de los reyes ', 'Novela', 'Fantasia ', 'Brandon Sanderson ', 2010, 1200),
	(38, 'El dia que dejo de nevar en Alaska ', 'Novela', 'Autoayuda ', 'Alice Kellen ', 2017, 352),
	(39, 'Un cuento perfecto ', 'Novela', 'Romance', 'Elisabet Benavent', 2020, 640),
	(40, 'Busacando a Alaska ', 'Novela', 'Autoayuda ', 'John Green', 2005, 304),
	(41, 'El ni�o con el pijama a rayas ', 'Novela', 'Infantil', 'John Boyne', 2006, 217),
	(42, 'Las aventuras de Sherlock Holmes', 'Novela', 'Misterio', 'Arthur Conan Doyle', 1892, 342),
	(43, 'Amigo imaginario ', 'Novela', 'Terror', 'Stephen Chbosky', 2019, 819),
	(44, 'Bajo la misma estrella', 'Novela', 'Romance', 'John Green', 2012, 304),
	(45, 'Los juegos del Hambre ', 'Novela', 'Ficcion ', 'Suzanne Collins', 2008, 374),
	(46, 'Billy Elliot', 'Novela', 'Ficcion ', 'Melvin Burgess', 2001, 208),
	(47, 'Los muchachos no escriben cartas de amor ', 'Cuento', 'Ficcion ', 'Brian Keaney', 1993, 187),
	(48, 'El diario de Ana Frank ', 'Biografia', 'Historico ', 'Ana Frank ', 1947, 150),
	(49, 'Los siete maridos de Evelyn Hugo', 'Biografia', 'Autoayuda ', 'Taylor Jenkins Reid', 2017, 380),
	(50, 'Nosotros en la luna ', 'Novela ', 'Romance', 'Alice Kellen ', 2020, 480),
	(51, 'La vida invisible de Addie La Rue ', 'Novela', 'Ficcion ', 'V. E. Schwab', 2020, 504),
	(52, 'Paranormal Colombia ', 'Novela', 'Ficcion ', 'Mario Mendoza ', 2014, 308),
	(53, 'Satanas ', 'Novela', 'Ficcion ', 'Mario Mendoza ', 2002, 288),
	(54, 'El burdel de las parafilias ', 'Novela ', 'Ficcion ', 'Andrea Ramos ', 2018, 141),
	(55, 'Tan poca vida ', 'Novela ', 'Autoayuda', 'Hanya Yanagihara', 2015, 1008),
	(56, 'Aristoteles y Dante descubren los secretos de universo ', 'Novela', 'Autoayuda', 'Benjamin Alire Saenz', 2012, 359),
	(57, 'La melancolia de los feos ', 'Novela', 'Ficcion ', 'Mario Mendoza ', 2016, 256),
	(58, 'Pa que se acabe la vaina ', 'No-ficcion ', 'Historico ', 'William Ospina ', 2013, 237),
	(59, 'Relato de un asesino ', 'Novela', 'Ficcion ', 'Mario Mendoza ', 2001, 346),
	(60, 'Al final mueren los dos ', 'Novela', 'Romance', 'Adam Silvera', 2017, 352),
	(61, 'Alguien esta mintiendo ', 'Novela', 'Misterio', 'Karen M. McManus', 2017, 351),
	(62, 'Llamame por tu nombre ', 'Novela', 'Romance', 'Andre Aciman', 2007, 280),
	(63, 'La fragilidad de un corazon bajo a lluvia', 'Novela', 'Romance', 'Maria Martinez ', 2020, 480),
	(64, 'La cancion de Aquiles', 'Novela', 'Historico ', 'Madeline Miller', 2011, 392),
	(65, 'Homo deus ', 'No-ficcion ', 'Historico ', 'Yuval Noah Harari', 2015, 489),
	(66, 'Sapiens. De animales a dioses. Breve historia de la humanidad', 'No-ficcion ', 'Historico ', 'Yuval Noah Harari', 2011, 490),
	(67, 'Mi confesion: Carlos Casta�o revela sus secretos ', 'No-ficcion ', 'Historico ', 'Carlos Casta�o ', 2001, 327),
	(68, 'La civilizacion del espectaculo ', 'No-ficcion ', 'Obra de referencia', 'Mario Vargas Llosa', 2012, 220),
	(69, 'Rayuela', 'Novela ', 'Ficcion ', 'Julio Cortazar ', 1963, 1200),
	(70, 'Ciudades de papel ', 'Novela', 'Misterio', 'John Green', 2008, 368),
	(71, 'El caballero de la armadura oxidada ', 'Novela', 'Ficcion ', 'Robert Fisher', 1987, 212),
	(72, 'El mundo de Sofia', 'Novela', 'Filosofico', 'Jostien Gaardier', 1991, 656),
	(73, 'La isla del tesoro ', 'Novela ', 'Ficcion ', 'Robert Louis Stevenson', 1883, 283),
	(74, 'Nuestra se�ora de Paris ', 'Novela ', 'Romance ', 'Victor Hugo ', 1831, 472),
	(75, 'Una educacion mortal', 'Novela ', 'Fantasia ', 'Naomi Novik ', 2020, 352),
	(76, 'El imperio final ', 'Novela ', 'Fantasia ', 'Brandon Sanderson ', 2006, 672),
	(77, 'Palabras radiantes ', 'Novela ', 'Fantasia ', 'Brandon Sanderson ', 2014, 1248),
	(78, 'Juramentada ', 'Novela ', 'Fantasia ', 'Brandon Sanderson ', 2018, 1258),
	(79, 'Cazadores de sombras 1: Ciudad de hueso ', 'Novela ', 'Fantasia ', 'Cassandra Clare', 2007, 512),
	(80, 'Matilde debe morir ', 'Novela ', 'Misterio', 'Cristian Acevedo ', 2020, 128),
	(81, 'Matilde decide vivir ', 'Novela ', 'Misterio', 'Cristian Acevedo ', 2020, 144),
	(82, 'Matilda ', 'Novela ', 'Infantil', 'Roald Danl', 1988, 225),
	(83, 'Todo lo que nunca fuimos ', 'Novela ', 'Romance', 'Alice Kellen', 2019, 409),
	(84, 'Todo lo que somos juntos ', 'Novela ', 'Romance', 'Alice Kellen', 2019, 447),
	(85, 'El libro de las revelaciones ', 'Novela ', 'Ficcion ', 'Mario Mendoza ', 2017, 296),
	(86, 'Aqui dentro siempre llueve ', 'Poesia ', 'Romance', 'Chris Pueyo ', 2017, 120),
	(87, 'El dia que se perdio la cordura ', 'Novela ', 'Misterio ', 'Javier Castillo', 2017, 456),
	(88, 'Nueve perfectos desconocidos ', 'Novela ', 'Romance ', 'Liane Moriarty', 2020, 552),
	(89, 'La chica de nieve ', 'Novela ', 'Misterio', 'Javier Castillo', 2020, 332),
	(90, 'El dia que se perdio el amor ', 'Novela ', 'Misterio ', 'Javier Castillo', 2018, 227),
	(91, 'Priest', 'Novela ', 'Erotico', 'Sierra Simone ', 2015, 288),
	(92, 'El pozo de la ascencion ', 'Novela ', 'Fantasia ', 'Brandon Sanderson ', 2007, 942),
	(93, 'Una luna sin miel ', 'Novela ', 'Romance ', 'Eva M Soler e Idoia Amo', 2018, 336),
	(94, 'El chico que dibujaba constelaciones ', 'Novela ', 'Romance ', 'Alice Kellen ', 2018, 176),
	(95, 'Cincuenta sombras de Gray ', 'Novela ', 'Erotico', 'E. L James ', 2011, 521),
	(96, 'Cincuenta sombras liberadas ', 'Novela ', 'Erotico', 'E. L James ', 2012, 656),
	(97, 'Cincuenta sombras mas oscuras ', 'Novela ', 'Erotico', 'E. L James ', 2011, 632),
	(98, 'Petalos al viento ', 'Novela ', 'Ficcion ', 'V. C. Andrews', 1980, 448),
	(99, 'Si hubiera espinas ', 'Novela ', 'Ficcion ', 'V. C. Andrews', 1981, 487);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;

-- Volcando estructura para tabla mi_libreria.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuarios_un` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla mi_libreria.usuarios: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id_usuario`, `username`, `password`, `nombres`, `apellidos`, `email`) VALUES
	(1, 'jdgonzalez', '123456', 'David', 'Gonzalez', 'jdgonzalez0711@hotmail.com'),
	(2, 'pepe', 'abcd', 'pepe', 'grillo', 'pepe@hotamial.com'),
	(3, 'maria123', 'lector1', 'Maria', 'Ortiz', 'Maria.Ortiz@gmail.com'),
	(4, 'tatan', '1234', 'jonathan', 'gonzalez', 'jonathan@gmail.com'),
	(5, 'AngelaV', 'Laura123', 'Angela', 'Victoria', 'Angela.victoria@gmail.com'),
	(7, 'monica123', 'abcde', 'Monica', 'Pinzon', 'monica.pinzon@gmail.com'),
	(8, 'Laura123', '0987', 'Laura Vanessa', 'Diaz Velasquez', 'Laura.diaz@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
