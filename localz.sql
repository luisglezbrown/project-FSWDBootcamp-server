-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2021 a las 12:40:21
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `localz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tour_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `pax` smallint(6) NOT NULL,
  `status` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `booking`
--

INSERT INTO `booking` (`id`, `user_id`, `tour_id`, `date`, `pax`, `status`) VALUES
(16, 1, 28, '2021-07-13', 3, 'cancelled'),
(18, 1, 29, '2021-07-20', 2, 'cancelled'),
(20, 1, 31, '2021-07-25', 2, 'cancelled'),
(22, 1, 31, '2021-07-05', 1, 'cancelled'),
(23, 1, 30, '2021-07-17', 3, 'cancelled'),
(24, 1, 28, '2021-07-27', 2, 'cancelled'),
(25, 1, 28, '2021-07-21', 2, 'cancelled'),
(26, 1, 28, '2021-07-14', 2, 'cancelled'),
(27, 1, 28, '2021-07-14', 2, 'cancelled'),
(28, 1, 31, '2021-11-17', 1, 'cancelled'),
(29, 1, 30, '2021-07-28', 2, 'cancelled'),
(30, 1, 29, '2021-07-27', 2, 'cancelled'),
(31, 1, 31, '2021-07-23', 2, 'cancelled'),
(32, 1, 29, '2021-07-20', 9, 'cancelled'),
(33, 1, 30, '2021-07-21', 8, 'cancelled'),
(39, 1, 28, '2021-07-20', 4, 'cancelled'),
(40, 1, 29, '2021-07-27', 2, 'cancelled'),
(41, 1, 28, '2021-07-20', 2, 'cancelled'),
(43, 1, 37, '2021-07-23', 2, 'cancelled'),
(44, 1, 36, '2021-08-01', 2, 'cancelled'),
(45, 1, 29, '2021-07-27', 2, 'cancelled'),
(47, 1, 28, '2021-07-27', 2, 'cancelled'),
(48, 1, 42, '2021-07-30', 3, 'cancelled'),
(49, 1569, 41, '2021-07-25', 2, 'cancelled'),
(50, 1569, 48, '2021-07-30', 2, 'active'),
(51, 1570, 46, '2021-08-01', 3, 'active'),
(52, 1573, 50, '2021-07-31', 2, 'active'),
(53, 1576, 60, '2021-08-17', 4, 'active'),
(54, 1578, 73, '2021-10-22', 2, 'active'),
(55, 1578, 57, '2021-12-22', 2, 'active'),
(56, 1581, 54, '2021-09-22', 2, 'active'),
(57, 1581, 66, '2021-11-14', 2, 'active'),
(58, 1581, 71, '2021-08-01', 4, 'active'),
(59, 1582, 85, '2021-07-30', 3, 'active'),
(60, 1582, 55, '2021-09-07', 2, 'active'),
(61, 1579, 78, '2021-07-31', 1, 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `tag` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `tag`) VALUES
(1, 'Historia'),
(2, 'Gastro'),
(3, 'Naturaleza'),
(4, 'Alternativo'),
(5, 'Playa'),
(6, 'Compras'),
(7, 'Tradiciones'),
(8, 'LGBTI+');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgpath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ranking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `name`, `imgpath`, `ranking`) VALUES
(1, 'París', 'card-1.png', 44),
(2, 'New York', 'card-2.png', 54),
(3, 'Barcelona', 'card-3.png', 38),
(4, 'Estambul', 'card-4.png', 39),
(5, 'Londres', 'card-5.png', 47),
(6, 'Rio de Janeiro', 'card-6.png', 19),
(7, 'Abu Dhabi', 'card-7.png', 7),
(8, 'Viena', 'card-8.png', 8),
(9, 'Roma', 'card-9.png', 11),
(10, 'Atenas', 'card-10.png', 14),
(11, 'Praga', 'card-11.png', 13),
(12, 'Budapest', 'card-12.png', 13),
(13, 'San Petersburgo', 'card-13.png', 33),
(14, 'San Francisco', 'card-14.png', 31),
(15, 'Cartagena de Indias', 'card-15.png', 33),
(16, 'Tokio', 'card-16.png', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210702101753', '2021-07-02 12:19:04', 243),
('DoctrineMigrations\\Version20210702214816', '2021-07-02 23:49:11', 252),
('DoctrineMigrations\\Version20210704101733', '2021-07-04 12:18:02', 445),
('DoctrineMigrations\\Version20210704102523', '2021-07-04 12:25:45', 97),
('DoctrineMigrations\\Version20210704102708', '2021-07-04 12:27:14', 53),
('DoctrineMigrations\\Version20210704115913', '2021-07-04 13:59:21', 325),
('DoctrineMigrations\\Version20210704181550', '2021-07-04 20:16:02', 216),
('DoctrineMigrations\\Version20210704182400', '2021-07-04 20:26:05', 39),
('DoctrineMigrations\\Version20210704182922', '2021-07-04 20:29:46', 110),
('DoctrineMigrations\\Version20210706111619', '2021-07-06 13:17:29', 88),
('DoctrineMigrations\\Version20210709112027', '2021-07-09 13:21:07', 291),
('DoctrineMigrations\\Version20210709112331', '2021-07-09 13:23:41', 64),
('DoctrineMigrations\\Version20210709112634', '2021-07-09 13:26:42', 225),
('DoctrineMigrations\\Version20210713103036', '2021-07-13 12:31:04', 959),
('DoctrineMigrations\\Version20210716072500', '2021-07-16 09:25:13', 235),
('DoctrineMigrations\\Version20210716143546', '2021-07-16 16:36:17', 263),
('DoctrineMigrations\\Version20210716144313', '2021-07-16 16:46:06', 96),
('DoctrineMigrations\\Version20210716144328', '2021-07-16 16:46:06', 15),
('DoctrineMigrations\\Version20210716144531', '2021-07-16 16:46:06', 11),
('DoctrineMigrations\\Version20210716144600', '2021-07-16 16:46:06', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tour`
--

CREATE TABLE `tour` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` double NOT NULL,
  `week_days` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)',
  `highlight` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_time` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_point` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `status` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tour`
--

INSERT INTO `tour` (`id`, `user_id`, `city_id`, `title`, `duration`, `week_days`, `highlight`, `starting_time`, `meeting_point`, `description`, `imgpath`, `ranking`, `status`) VALUES
(28, 1542, 2, 'Nueva York Esencial', 2.5, '2,3', 'Descubramos juntos los lugares donde todo empezó. ', '14:00', 'Nos encontraremos frente a la entrada de la terminal de ferry de Staten Island. ', 'Comenzaremos nuestro recorrido desde Battery Park, donde todo comenzó en 1624, y luego continuaremos explorando la parte más antigua visitando una de las tabernas más antiguas, Faunces Tavern, también veremos donde George Washington  vivió durante un período de tiempo. Pasaremos por el famoso Toro de Wall Street, la Bolsa de Valores de Nueva York y la Iglesia Trinity. Más tarde nos dirigiremos al World Trade Center, donde terminaremos el recorrido admirando los nuevos edificios y el monumento, recordaremos el valor y la valentía de los muchos \"héroes \"que perdieron la vida durante ese trágico día del 11 de septiembre de 2001.\n\n¡Te espero en este maravilloso tour por Manhattan!', '60eb65931262f.jpg', 0, 'enabled'),
(29, 1542, 2, 'Arte al aire libre en Nueva York', 2.5, '2', '¿Te encanta el arte callejero o tal vez solo el arte en general?  Entonces, ¡Bushwick es perfecto para ti!', '10:30', 'Afuera de la estación de Jefferson St de la Subway L. Esquina de Jefferson St y Whycoff Ave. ', 'Este barrio de Brooklyn es como un museo al aire libre, donde se pueden admirar, manzana a manzana, murales, bombas de cuerda, pequeñas esculturas y grafitis.\n\nEste es realmente un lugar especial que surgió en un momento muy difícil para esta zona, una zona industrial donde todavía hay fabricantes, almacenes, pero también pequeños comercios y edificios residenciales. En pocos años ha sido invadida por multitud de colores y se ha convertido en la meca de artistas y jóvenes que hoy en día encuentran multitud de restaurantes, bares y lugares para pasar el rato.\n\n¡Descubrámoslo juntos! Tomaremos el metro L desde Union Square y tardaremos unos 20 minutos hasta legar a este increíble vecindario, que también te brinda la oportunidad de tomar muchas fotos \"instagrameables\".\n\n\nDespués de un agradable paseo, tomamos la L-Line nuevamente para detenernos en Williamsburg , otro vecindario de Brooklyn que ha cambiado increíblemente durante los últimos 15 a 20 años y se ha convertido en una de las capillas más geniales de Nueva York. Elegido por artistas, diseñadores y fotógrafos que han elegido este escenario para sus estudios. Mientras caminamos, aprenderemos sobre la historia de Williamsburg, pero también veremos las muchas tiendas pequeñas (muchas de las cuales venden artículos hechos a mano en Brooklyn), muchos restaurantes, pastelerías y bares que se animan por la noche.\n\nTambién visitaremos el recién terminado Domino Park, que se colocó a lo largo del East River y desde donde podemos disfrutar de la impresionante vista del horizonte de Manhattan.', '60eb6a7bc153b.jpg', 0, 'enabled'),
(30, 1543, 2, 'Superhéroes de Nueva York', 2, '1,2,3,4,5,6,0', 'Sumérgete en el mundo del cómic y los superhéroes como solo Nueva York te lo puede ofrecer. Conoce lugares de rodaje de superhér', '19:00', 'Naciones Unidas, esquina de Primera Avenida y calle 42', 'Descubre dónde Batman se salvó de que lo cancelaran y cómo se creó la criptonita. Visita el lugar donde Christopher Reeve voló por primera vez como Superman. Mira dónde los Vengadores dejaron un recuerdo para la ciudad de Nueva York. Disfruta de una perspectiva única e inolvidable de la industria del cómic y sus extraordinarios personajes.\n\nEl tour de dos horas comienza enfrente de la sede de las Naciones Unidas. Cuando camines por la calle 42, verás el piso de Duende Verde, entrarás al edificio de Daily News y te detendrás en un bar frecuentado por algunos de los artistas más grandes del cómic.\n\nContempla el edificio de la Chrysler, la terminal Grand Central y el lugar donde se supone que está la torre Stark. Cuando gires a la izquierda por Park Avenue, pasarás por el histórico Publishers Row. Mira dónde nacieron algunos de los cómics más emblemáticos del mundo y las oficinas de Will Eisner y Bob Kane.\n\nTu guía te señalará los lugares donde se rodaron series televisivas como Gotham o la Daredevil de Netflix, dónde vivía el primer actor que interpretó a Superman y mucho más.\n\nDiviértete, conoce lugares increíbles, escucha historias fantásticas y conversa sobre la historia de todos los personajes que te hicieron creer que los hombres podían volar.', '60ec0b2e9211e.jpg', 0, 'enabled'),
(31, 1543, 2, 'Times Square y el distrito de Broadway', 2, '1,2,3,4,5,6,0', 'Times Square es el latido del corazón de Nueva York. Divertirse y reírse de las historias de esta joya de la ciudad.', '18:30', 'Museo de cera Madame Tussauds, 234 West 42 Street (justo al oeste de 7 Avenue)', 'Empezando por la legendaria 42nd Street, descubre por qué se llama la encrucijada del mundo. Siga la línea de tiempo desde su origen hasta su grandeza actual. \nEsta área de Times Square alberga cuatro de las ubicaciones de franquicias más concurridas del mundo (Red Lobster, McDonalds, Applebee y AMC Theatre). A continuación, visite el lugar donde se hizo la película original de Los Cazafantasmas. También es donde se filmaron las películas Sex and the City, Day After Tomorrow, Spiderman y Maid in Manhattan. Desde aquí, descubrirás cómo la ciudad de Nueva York se convirtió en la capital mundial de los rascacielos. \nHarry Houdini conquistó la magia, vea dónde por primera vez se hizo que un elefante gigante de 15,000 libras se desvaneciera en el aire. Revive los días de gloria de Sinatra, Sardi\'s, Studio 54 y el Kiss más famoso del mundo. Visite la institución legendaria donde Jennifer Aniston, Ellen Barkin, Liza Minnelli, Ving Rhames, Ben Vereen, Robert De Niro y Al Pacino perfeccionaron su oficio. Además, es donde se hizo la película \"Fame\". \nMire los \"Pilares de diamantes\" que marcan la entrada al distrito de diamantes de Nueva York. Báñese en el resplandor de la celebración de Nochevieja más famosa. Sube por la radiante \"Escalera de las estrellas\" y contempla las luces de Broadway. Escuche el divertido relato de cómo un caramelo M&M enfureció a un vaquero urbano.', '60ed4dc5321ee.jpg', 0, 'enabled'),
(36, 1557, 5, 'La Leyenda Oscura de Jack \"El Destripador\"', 2, '4,5,6,0', 'Conoce todo sobre Jack el Destripador por el Londres victoriano', '19:00', 'Enfrente de la entrada a la estación de metro de Aldgate East y de la Whitechapel Gallery', 'Pasea por las calles del East End londinense durante un tour a pie interactivo sobre Jack el Destripador. Retrocede en el tiempo a 1888 con tu guía \"destripadorólogo\" experto, intenta aclarar los asesinatos sin resolver con esta experiencia de inmersión en un grupo reducido.\n\nAnaliza pruebas fotográficas y escucha las historias reales de la investigación para descartar a los sospechosos, junto al resto de miembros de tu grupo reducido o privado. Incluso podrás usar tus propias tarjetas de sospechosos para investigar a los supuestos culpables.\n\nConoce a las víctimas, los sospechosos y la vida en Whitechapel, un barrio pobre en aquella época. Tu guía te contará curiosidades sobre el Londres victoriano, incluyendo el contexto cultural de figuras populares como Sherlock Holmes. \n\n¿Estuvieron a poco de capturar a Jack el Destripador? ¿Por qué eligió Whitechapel? ¿Dónde descubrieron las pruebas? Averigua todo esto y mucho más con tu guía \"destripadorólogo\".', '60f3ef2f2ba75.jpg', 0, 'enabled'),
(37, 1557, 5, 'Tras los Pasos de Harry Potter', 2.5, '5,6,0', 'Un mágico tour a pie por Londres sobre Harry Potter', '10:30', 'Southwark View Point, en la Plaza Minerva.', 'Sigue los pasos de tus magos y brujas preferidos a través del Londres de los muggles. Soy un auténtico fan de Harry Potter que te contaré todo tipo de anécdotas y curiosidades sobre los libros y las películas. \n\nComenzaremos esta aventura descubriendo a qué casa de Hogwarts perteneces. Después, compite contra las otras casas en un concurso de preguntas mientras visitas los lugares que más inspiraron a J. K. Rowling, desde el teatro Shakespeare\'s Globe hasta los angostos callejones londinenses a los que se parece el callejón Knockturn.\n\nEntre lo más destacado se incluye una visita al Caldero Chorreante, la posada secreta para magos. Además, exploraremos el verdadero callejón Diagon, donde Harry compró su primera varita. Incluso podrás ver el puente que destruyeron los mortífagos en \"Harry Potter y el misterio del príncipe\". \n\nNOTA: No incluye la entrada a Estudios Warner Bros', '60f3f0e97bed3.jpg', 0, 'enabled'),
(39, 1557, 5, 'Caminando por el Soho', 3, '1,2,3,4,5,6,0', 'Londres no es solo reyes, reinas y museos, y en ninguna parte es más claro que en el Soho.', '18:00', 'Entrada del Criterion Theatre en Piccadilly Circus, frente a las famosas pantallas gigantes.', 'El recorrido por el Soho nos llevará a través de Piccadilly Circus, el Time Square de Londres y un laberinto de calles que llevan a Chinatown. Descubrirás el centro de las revoluciones musicales, incluido el lugar donde Jimi Hendrix actuó por primera vez en la ciudad.\n\nLos aficionados a la música se deleitarán al descubrir el lugar donde se acuñó el término \"Beatlemania\", y donde se grabaron éxitos como \"Bohemian Rhapsody\". Más allá de la música, sabrás sobre el movimiento del sufragio femenino en Golden Square. Un brote mortal de cólera es el tema de elección en Broad Street, donde hablaremos sobre el original John Snow. Pasee por la calle griega para escuchar cómo Soho influyó en la antigua residencia, Karl Marx.\n\nEn Soho Square, aprenderás sobre la nobleza más antigua del distrito, a menudo eclipsada por los inquilinos actuales, la animada comunidad LGBT que se congrega en bares locales. Termina en Chinatown, donde olvidarás momentáneamente que estás en Londres y te relajarás con un plato o tres de bolas de masa antes de ir a la enérgica vida nocturna de Soho.', '60f5985fb76bd.jpg', 0, 'enabled'),
(41, 1542, 6, 'A ritmo de Samba', 0, '', 'Este tour ha sido eliminado', '--', '--', 'El guía ha decidido eliminar este tour, por lo que ya no está disponible', 'deleted.jpg', 0, 'inactive'),
(42, 1, 3, 'Tour para eliminar', 0, '', 'Este tour ha sido eliminado', '--', '--', 'El guía ha decidido eliminar este tour, por lo que ya no está disponible', 'deleted.jpg', 0, 'inactive'),
(43, 1543, 2, 'Manhattan bajo la Luz de la Luna', 4, '1,2,3,4,5,6,0', 'Admira las increíbles vistas de los principales monumentos y edificios de la ciudad así como el paisaje iluminado durante la noc', '17:30', 'Puerta del Times Square Hotel (790 7th Avenue)', 'Únete a una noche de vistas panorámicas espectaculares de la legendaria Nueva York. Este tour nocturno de medio día está concebido para cautivar a todo tipo de visitantes, amantes de la historia, el cine y la fotografía por igual.\n\nAprovecha la oportunidad de descubrir las increíbles vistas panorámicas desde la atracción más celosamente guardada de Nueva York, la zona costera de Nueva Jersey. Después estimula tu paladar con algunos de los mejores y más famosos dulces de la Carlo\'s Bakery. Durante tu aventura, conocerás la ciudad de Frank Sinatra, la estatua de la Libertad y el monumento conmemorativo Empty Sky.\n\nEl tour nocturno se realizará durante el crepúsculo, cuando el famoso horizonte de la ciudad revive con millones de luces que resplandecen a tu alrededor. Los visitantes sienten escalofríos, se emocionan y se quedan sin palabras cuando están frente al magnífico panorama de Manhattan y el símbolo más emblemático de la libertad. Trae tu cámara y prepárate para quedarte con la boca abierta.', '60f71fd0d9408.jpg', 0, 'enabled'),
(44, 1562, 2, 'Dos países en una ciudad: Little Italy & Chinatown', 2, '1,2,3,4,5,6,0', 'Sumérgete durante 2 horas en los barrios más auténticos de Nueva York. Descubre las fascinantes historias de SoHo, Little Italy ', '11:00', 'Calle Spring con la 6 Avenida', 'Una experiencia en la Gran Manzana no puede ser más auténtica que una visita a SoHo, Little Italy y Chinatown donde experimentarás mundos muy diferentes en una zona relativamente pequeña. Crúzate con estrellas de cine, famosos y diseñadores en el histórico barrio de SoHo con sus famosos edificios de hierro fundido.\n\nEn este tour a pie guiado de 2 horas escucharás historias sobre la lucha de los inmigrantes y la violencia de las bandas callejeras en Little Italy y Chinatown mientras pruebas comida típica.', '60f721c4899db.jpg', 0, 'enabled'),
(45, 1562, 2, 'Nuevos Iconos de NYC', 2, '1,3,5', 'Disfruta este paseo urbano lejos de las ajetreadas calles neoyorquinas por el oasis verde del High Lane de Chelsea y el lujoso H', '12:00', 'Esquina de W 34th St y Hudson Blvd E, 380-394', 'Sube al jardín lineal de High Line por el West Side de Manhattan con vistas increíbles de la ciudad de Nueva York y el río Hudson. El parque High Lane es un ejemplo perfecto de renovación urbanística, un concepto único de un parque, un oasis verde entre los gigantes de cemento.\n\nDurante el trayecto de dos horas, visita los puntos más importantes e históricos, esculturas, arte y murales por el camino. Observa las diferentes especies de plantas que se eligieron de manera específica mientras paseas por los preciosos jardines. Admira y fotografía la Vessel, una estructura pública de 45,7 metros con 2.500 escalones interconectados. Presencia arquitectura impresionante, incluyendo Hudson Yards, el edificio de Zaha Hadid, la plaza de la Décima avenida y el Chelsea Market.', '60f723dcc459e.jpg', 0, 'enabled'),
(46, 1563, 5, 'Londres auténtico: el Cambio de Guardia', 2, '1,3,5,0', 'El cambio de la Guardia Real frente de las puertas de palacio es un espectáculo famoso mundialmente, auténtico de la ciudad.', '09:30', 'Al lado de la Estatua de la diosa Diana en el Green Park', 'El cambio de guardia es algo que deberías vivir cuando visites Londres. Te explicaré cómo el cambio de guardia, también conocido como \"guardia montada\", se ha convertido en una de las atracciones turísticas de Londres.\n\nVerás cómo los soldados quedan relevados de su posición de manera muy particular, mientras los acompaña una fanfarria militar. Los guardias han protegido al rey o la reina desde el reinado de Enrique VIII, quien estableció la Guardia Real como institución permanente. La tradición ha continuado durante más de 500 años.\n\nTodos los guardias visten con la túnica roja tradicional y un casco alto de piel muy reconocible. La música que acompaña al cambio de guardia puede ser militar o más contemporánea, una atracción que no debes perderte.', '60f726ad0c8bd.jpg', 0, 'enabled'),
(47, 1563, 5, 'Paseando por el casco antiguo', 3, '2,4,6', 'Explora el casco antiguo y contempla algunos de los edificios más antiguos de Londres.', '10:00', 'Covent Garden, junto a la tienda Apple', 'Viaja de regreso a los orígenes de Londres en este tour a pie de 3 horas y descubre la milla cuadrada original, situada junto al río Támesis. Conocida por los londinenses como «La ciudad», ha sido testigo de algunos de los eventos más importantes en la historia británica y es hogar de algunos de los edificios más antiguos de Londres.\n\nA medida que transcurre el tour, pasarás por la icónica Catedral de San Pablo de Sir Christopher Wren, el teatro Globe de Shakespeare, La Torre de Londres y la Mansion House. Recorrerás el laberinto de callejuelas, patios de iglesias y los paseos del río que conforman el casco antiguo y revive una una historia que se remonta a casi 2.000 años.\n\nTambién verás algunas de las atracciones modernas, como el puente peatonal del Milenio – también conocido como el \"puente tambaleante\" – que lleva de San Pablo a la fantástica galería de arte moderno Tate, ubicada en una central energética renovada. Pasearás junto al río Támesis para ver el HMS Belfast y el Tower Bridge, escucharás historias de cómo Londres sobrevivió a los bombardeos de la Segunda Guerra Mundial, y visitarás la Iglesia de los Caballeros Templarios, del famoso Código Da Vinci.', '60f7276836e29.jpg', 0, 'enabled'),
(48, 1564, 5, 'La Noche Londinense', 2, '5,6', 'Millones de luces, monumentos iluminados y un increíble ambiente nocturno definen la capital inglesa.', '18:30', 'Piccadilly Circus (enfrente de Lillywhites)', 'Prepárate para descubrir el encanto de Londres iluminado por la noche y sumérgete en la vida nocturna de la capital británica.\n\nDurante tu recorrido escucha anécdotas interesantes, como cuál es el origen del nombre de Covent Garden y de la palabra \"pub\". Descubre secretos de Londres: a qué iglesia van los artistas famosos los domingos a rezar o dónde se estrenan las películas más importantes. Aprenderás de qué material están hechos los leones de Trafalgar y muchas otras curiosidades y anécdotas de la cultura inglesa. A continuación, te sumergirás en el fantástico Soho de Londres con un paseo por Carnaby Street, sus numerosas tiendas y restaurantes únicos.\n\nAl final del tour, haremos una parada en un legendario pub inglés para disfrutar de una cerveza o un refresco en grupo.', '60f72e80b21a7.jpg', 0, 'enabled'),
(49, 1565, 1, 'Notre Dame, Isla de la Cité y San Severino', 1.5, '1,2,3,4,5,6', 'Disfruta de un exclusivo tour guiado por la catedral de Notre Dame en el que aprenderás sobre su reconstrucción y protección.', '10:00', '7 rue Lagrange, junto a la tienda de souvenirs', 'La monumental catedral de Notre Dame es una de las catedrales góticas más impresionantes de Francia y Europa y es uno de los mayores monumentos de París. Como símbolo de una ciudad e incluso un país, su historia está formada por piedras y hombres. El 15 de abril del 2019 la aguja principal y el tejado del edificio fueron destruidos por un enorme incendio.\n\nSi participas en este tour, aprenderás más acerca de la reconstrucción de Notre Dame y los próximos pasos. Verás el renacer de la arquitectura gótica y disfrutarás un tour a pie por la Isla de la Cité, el místico lugar desde donde todo comenzó. A continuación, el tour guiado se dirigirá a la iglesia de San Severino en el barrio latino, otro gran ejemplo de la extravagante arquitectura gótica.', '60f730bb26441.jpg', 0, 'enabled'),
(50, 1565, 1, 'Montmartre y el Sagrado Corazón', 2.5, '5,6,0', 'Déjate llevar por el encanto y el ambiente del pintoresco Montmartre en este tour a pie de 2 horas y media por el singular barri', '10:00', 'salida de metro Blanche (línea 2)', 'Déjate llevar por el encanto y el ambiente del pintoresco Montmartre en este tour a pie de 2 horas y media por el singular barrio parisino, siguiendo los pasos de Van Gogh y Picasso y dejándote sorprender por la impresionante basílica del Sagrado Corazón.\n\nInformación general\nCancelación fácil\nCancela con hasta 24 horas de antelación y recibe un reembolso completo\nPrecauciones contra la Covid-19\nSe aplican medidas sanitarias y de seguridad especiales. Más información\nSe aceptan cupones digitales o impresos\nUtiliza tu móvil o imprime el cupón\nDuración 2 - 2.5 horas\nComprueba la disponibilidad para ver los horarios de inicio.\nConfirmación inmediata\nGuía\nInglés, Español, Alemán, Italiano, Francés, Ruso\nGrupos privados o reducidos disponibles\nTu experiencia\nQué harás\nDescubre el encantador y pintoresco barrio de Montmartre\nVisita la plaza de Tertre, el Moulin Rouge y la casa de Van Gogh\nVisita los pintorescos rincones de París que normalmente los turistas no ven\nVisita la espectacular basílica del Sagrado Corazón\nEn detalle\nDescubre el encantador y pintoresco barrio de Montmartre, la fascinante villa parisina situada en lo alto una colina, en este tour guiado privado a pie de 2 horas y media.\n\nPasea por sus calles adoquinadas y sigue los pasos de los famosos artistas que una vez llamaron hogar al barrio, como la antigua casa de Vincent Van Gogh, el estudio de Pablo Picasso y los antiguos refugios de Henri de Toulouse-Lautrec. Conoce de mano de tu guía experto de habla inglesa la emocionante historia de Montmartre, las cautivadoras historias de la Belle Époque y los importantes cabarets de la zona, como el Moulin Rouge.\n\nCamina hasta el Sagrado Corazón, la blanca e imponente basílica ubicada en la colina en el corazón de Montmartre y disfruta de unas espectaculares vistas panorámicas de París al atardecer.', '60f7315f0b59a.jpg', 0, 'enabled'),
(51, 1566, 1, 'Tour gourmet por París', 3, '1,3,5', 'Este tour delicioso te lleva a viajar a través de las artes culinarias de Francia, famosas en todo el mundo.', '11:00', '47 Boulevard Saint-Germain, junto a la tienda de queso', 'Durante este tour gourmet, pasearás por las zonas medievales del Barrio Latino, uno de los barrios más famosos del mundo.\n\nEl Barrio Latino fue la zona intelectual de París, donde se encuentra la famosa Universidad de la Sorbona. Recorrerás un mercado famoso por la calidad y la gran variedad de alimentos que se encuentran allí.\n\nA continuación, harás una parada en una tienda de quesos franceses auténticos. Descubrirás por qué Charles de Gaulle formuló la famosa pregunta \"¿Cómo se puede gobernar un país con 246 tipos diferentes de queso?\"\n\nAquí podrás probar diferentes tipos de queso y descubrir sabores y texturas diferentes, complementados perfectamente con delicioso vino francés.\n\nTambién visitarás varias panaderías y disfrutarás de la increíble variedad de panes y repostería francesa, de la baguette al croissant.\n\nTerminarás el tour en una tienda de especialidades regionales, donde tendrás la oportunidad de degustar el más lujoso y delicado foie gras francés.\n\nDisfruta de un paseo rico en gustos y sabores, donde conocerás el arte de la gastronomía francesa.', '60f7373406b41.jpg', 0, 'enabled'),
(52, 1565, 1, 'París de noche: la ciudad de las luces', 2, '5,6', 'Descubre por qué París es mundialmente famosa como la Ciudad de las Luces', '19:00', ' junto al Obelisco de Luxor en la Place de la Concorde', 'Descubra la magia de París de noche. La Ciudad del Amor solo se vuelve más encantadora cuando se transforma en la Ciudad de las Luces.\n\nFamosa por las historias de amor, las revoluciones y las intrigas reales, París y sus emblemáticos monumentos se erigen como recordatorios visibles de algunos de los períodos más románticos de la historia. Sin embargo, a pesar de lo impresionantes que son durante el día, la Torre Eiffel, el Arco de Triunfo, Trocadero y los otros sitios de visita obligada solo son más sorprendentes cuando están iluminados por la noche.\n\nIncluso si cree que ha visto París, no querrá perderse un paseo clásico por la hermosa ciudad con este recorrido después del anochecer.', '60f737ee7fa6c.jpg', 0, 'enabled'),
(53, 1566, 1, 'París en el cine', 2.5, '1,2,3,0', 'Descubre por qué París es una de las ciudades más grabadas del mundo', '16:00', 'salida de la estación de metro Blanche', 'Hay pocas ciudades en el mundo que hayan sido tan inmortalizadas en el cine como París. Desde \"Amélie\" hasta \"Moulin Rouge\", pasando por \"Medianoche en París\" de Woody Allen. La ciudad del amor nunca ha estado tan bonita.\n\nHaz un tour guiado por el corazón del barrio de Montmartre, el lugar favorito de muchos directores y estrellas de cine. Descubre el bar donde se rodó \"Amélie\" con la actriz francesa Audrey Tautou, pasea por el famoso Moulin Rouge, que inspiró la película con el mismo nombre, y admira los muros blancos de la legendaria basílica del Sagrado Corazón, que sale en \"Medianoche en París\".\n\nTe contaré todos los secretos de los sets de rodaje, incluidos los lugares favoritos de los actores, mientras paseas por las encantadoras calles empedradas de París y admiras los barrios llenos de vida. Termina el tour con una copa en un bar local que suelen visitar los artistas y trabajadores de la industria del cine.', '60f738ee73304.jpg', 0, 'enabled'),
(54, 1566, 1, 'La Cuna del Art Nouveau', 2, '2,3,4', 'Aprende la historia y el simbolismo del arte y la arquitectura del Art Nouveau en París', '09:00', 'estación de metro Villiers', 'Recorre las calles de París en un tour guiado privado para aprender acerca de los monumentos más importantes del Art Nouveau, así como la historia de la Belle Époque. Siendo el estilo arquitectónico más prominente en el cambio de siglo del XIX al XX, el Art Nouveau (modernismo) es famoso por su elegancia e innovación. Acogido por los pudientes, es sinónimo de opulencia y belleza refinada.\n\nEmpezarás tu paseo en las propias raíces del movimiento del Art Nouveau antes de continuar hacia la etapa madura, observando sus distintas inspiraciones y las sorprendentes influencias que tuvo en los periodos posteriores.\n\nVisita el neogótico hotel Gaillard y admira la decorativa entrada a la estación de metro. Echa un vistazo a la iglesia ortodoxa rusa de Alexandre Nevski y maravíllate ante la fachada art déco del hotel Ceramic cerca del Arco de Triunfo.\n\nVeremos flamante casa del arquitecto Jules Lavirotte en Avenue Rapp, te enseñará la imponente catedral americana de la Santísima Trinidad ¡y no se olvidará de la mítica torre Eiffel!', '60f739a786fa1.jpg', 0, 'enabled'),
(55, 1567, 4, 'Joyas de Estambul: Santa Sofía, la Mezquita Azul y el Gran Bazar', 4, '2,3,4,5,6,0', 'Visite el mundialmente famoso Museo de Santa Sofía, la Mezquita Azul, el Hipódromo y el Gran Bazar', '09:30', 'Junto a la taquilla de cisterna', 'Como la mayoría de los visitantes de Estambul, especialmente los que visitan por primera vez; querrás ver y fotografiar la Mezquita Azul. Completo con sus 6 minaretes y ventanas de vidrio adornado, este sitio es imprescindible cuando visite Estambul.\n\nDespués de eso, viajará al lado del Museo de Santa Sofía. Una magnífica iglesia bizantina, es una de las mejores y más grandes obras de arte arquitectónicas del mundo.\n\nDespués de Hagia, encontrarás el camino a la entrada del Gran Bazar, uno de los mercados cubiertos más antiguos del mundo. Además de su importancia histórica, es un bazar que tentará incluso a aquellos que no estén interesados en comprar con su rica colección de preciosas alfombras hechas a mano, joyas, cuero y recuerdos.\n\nInformación importante\nQué llevar: Velo o kipá\nNo permitido: Faldas cortas', '60f73bc2644d0.jpg', 0, 'enabled'),
(56, 1568, 4, 'Clásicos de Estambul: tour de día completo', 7, '4,5,6,0', 'Explora la historia de Estambul visitando Santa Sofía, la Mezquita Azul, el Hipódromo, el palacio de Topkapi, el Gran Bazar y mu', '09:00', 'A la derecha de la entrada al Palacio Topkapi', 'Primero visitarás Santa Sofía. Esta antigua basílica fue construida por Constantino el Grande en el siglo IV y reconstruida por Justiniano en el siglo VI. Es una de las maravillas arquitectónicas de todos los tiempos.\n\nLa Mezquita Azul es uno de los mejores ejemplos de arte turco-otomano, construida entre 1609 y 1616 por el arquitecto Mehmet Aga. La mezquita recibe su nombre por los azulejos de Iznik azules que decoran sus muros de manera extraordinaria.\n\nEl antiguo Hipódromo, donde tenían lugar carreras de carros en el centro de la vida política bizantina, está situado en el espacio abierto frente a la Mezquita Azul.\n\nEste área, ahora llamada Sultanahmet, fue una vez hogar de diversos monumentos históricos. De todos los monumentos que se erguían allí, solo quedan tres, el obelisco de Teodosio, la columna Serpentina y la columna de Constantino.\n\nTendrás la oportunidad de vivir la bulliciosa atmósfera del Gran Bazar.\n\nEn este laberinto de calles y pasadizos hay más de 4 000 tiendas con cada oficio situado en su propia área, y vendiendo principalmente oro, plata y artesanía turca.\n\nDespués contemplarás el palacio de Topkapi, el gran palacio de los sultanes otomanos entre los siglos XV al XIX. Alberga una exquisita colección de cristal, plata y porcelana china, así como el Manto Sagrado que contiene las reliquias del profeta Mahoma.\n\nOtro de los puntos culminantes de este tour es la mezquita de Suleyman, construida entre 1550 y 1557 por el famoso arquitecto Sinan.\n\nHacia el mediodía realizarás una parada para almorzar (no incluido) y al final del tour regresarás al hotel.', '60f73e02d3d83.jpg', 0, 'enabled'),
(57, 1568, 4, 'Reliquias bizantinas y otomanas de Estambul', 6, '1,3,5', 'Descubre los tesoros culturales, históricos y arquitectónicos de los imperios Otomano y Bizantino de una de las ciudades más fas', '09:30', 'Junto a la torre Galata', 'Descubrirás algunos de los lugares históricos de Estambul, entrando en contacto con las maravillas bizantinas y otomanas y descubriendo las raíces de la cultura turca tal y como la conocemos hoy en día.\n\nDescubre el corazón de la Ciudad Vieja, cuna de dos de los imperios más importantes. Visita Santa Sofía, maravilla del mundo antiguo, construida por el Emperador Justiniano en el siglo VI. Frente de Santa Sofía se erige la Mezquita Azul, con sus tradicionales azulejos azules y sus seis minaretes, construida en la época del Sultán Ahmed.\n\nEl Hipódromo ha sido sede de eventos deportivos como las carreras de carruajes, y también de actividades políticas en la Ciudad Vieja. Decorado con la Columna de las Serpientes, el Obelisco de Teodosio y la Fuente Alemana, el Hipódromo es una de las atracciones turísticas más famosas de Estambul.\n\nTambién visitarás el mundialmente famoso Gran Bazar, el \"souk\" (mercado) cubierto más grande del mundo, con casi 4.000 puestos que venden desde joyas, oro y alfombras hasta artículos de piel, y muchos cosas más. Incluso podrás aprender cómo se confecciona una alfombra tradicional turca.\n\nPor último, veremos el Palacio Topkapi, residencia de innumerables sultanes. Este suntuoso Palacio Imperial contiene reliquias islámicas sagradas del profeta Mahoma, porcelana china, armas y una infinidad de tesoros.', '60f73ea1ec2e9.jpg', 0, 'enabled'),
(58, 1568, 4, 'Regateando en el Gran Bazar', 2, '1,2,3,4,5,6,0', 'Aprende a regatear como un local y encuentra una ganga.', '11:00', 'Beyazıt, Kalpakçılar Cd. No:22', 'Con más de 60 bloques de bulliciosos puestos y tiendas, el Gran Bazar es uno de los mercados cubiertos más grandes del planeta. Pasee por este laberinto junto a su guía experto y descubra a los mejores comerciantes e incluso pruebe su suerte en la negociación de manualidades y recuerdos. Este tour está limitado a 15 personas para brindar un ambiente más íntimo.\n\nEvita perderte en este zoco de fama mundial y busca los mejores puestos y tiendas. Compre auténticos recuerdos turcos como joyas artesanales locales o ollas de alabastro.', '60f73faf9904a.jpg', 0, 'enabled'),
(59, 1572, 3, 'Barcelona, modernismo y Gaudí', 2, '1,2,3,4', 'Maravíllate al descubrir los edificios modernistas más extravagantes de Barcelona y admira el talento de Gaudí', '09:30', 'Cerca del Movistar Centre, en Plaça Catalunya', 'Aprende sobre el arquitecto modernista catalán Antoni Gaudí y sus grandes obras en este tour guiado de tres horas. Conoce las creaciones de este visionario y descubre cómo consiguió alcanzar sus objetivos.\r\n\r\nAdmira la magnífica basílica de la Sagrada Familia, un trabajo todavía en progreso. Escucha la controversia sobre la interpretación de la fachada de la Pasión, del sucesor de Gaudí, Subirachs.\r\n\r\nContemplarás otras obras e importantes edificios modernistas en l\'Eixample, parte de la Barcelona moderna que se creó a mediados del siglo XIX a medida que la ciudad se extendía más allá de sus murallas medievales. Descubre los ideales de la planificación urbana de Cerdà y su visión original en la que dentro de cada bloque había un jardín.', '60f74b96c9588.jpg', 0, 'enabled'),
(60, 1571, 3, 'La Sagrada Familia y el Parque Güell', 2, '1,2,3,4', 'Descubre las obras maestras de Gaudí, La Sagrada Familia y Parque Güell', '09:30', 'Parada de metro Urquinaona', 'El tour comienza cerca del mar Mediterráneo, donde está la playa de arena dorada de Bogatell, para luego seguir por la costa hasta Port Vell (el Puerto Viejo). Aquí el guía te enseñará las Atarazanas Reales de Barcelona y el emblemático monumento a Colón en la calle más famosa de Barcelona, La Rambla. Desde allí, el guía te llevará al Mirador del Alcalde en la montaña de Montjuic, una bella azotea con bellísimas vistas del horizonte emblemático de Barcelona. La montaña de Montjuic fue uno de los establecimientos principales de los Juegos Olímpicos 1992. Hoy todavía se puede admirar el estadio olímpico. También encontrarás un montón de ejemplos de urbanismo y arquitectura diseñados para la Exposición Internacional de Barcelona de 1929. Estos incluyen la plaza de España, la Fuente Mágica, el Pabellón Mies van der Rohe y el Palacio Nacional.\r\n\r\nEl tour continúa ladera abajo rumbo al casco antiguo. Allí dejarás el vehículo por un rato ya que las calles estrechas del encantador Barrio Gótico se deben recorrer a pie. Tu guía te llevará a uno de los rincones ocultos de este barrio mientras revela la historia romana y medieval de sus calles. Después de descubrir el casco antiguo, tu guía te llevará al barrio que se hizo para expandir la ciudad más allá de sus muros, l\'Eixample. Este barrio lo diseñó en el siglo XIX el urbanista Ildefons Cerdá. Su planificación en damero y las amplias avenidas contrastan muchísimo con el casco antiguo, mucho más caótico. La visita a l\'Eixample comenzará en plaza Cataluña, la plaza central de Barcelona. La plaza se conecta con bulevar de Paseo de Gracia, que presenta algunos de los mejores ejemplos de la arquitectura modernista. Tómate un momento para admirar las imponentes fachadas de edificios privados modernistas, como La Pedrera y Casa Batlló, famosas obras de Gaudí, Casa Lleó Morena y Casa Amatller.\r\n\r\nTu guía te llevará a ver la joya de Barcelona, la obra maestra de Gaudí, La Sagrada Familia. Después de una explicación exhaustiva de los simbolismos religiosos ocultos en la fachada de La Sagrada Familia, pasarás al interior. Te cautivará el estilo arquitectónico increíble de Gaudí, la forma peculiar de las columnas, los techos y los muros y la arquitectura orgánica de la basílica. Por último, el guía te llevará hasta Parque Güell. Este parque mágico está ubicado en la cima de una colina que ofrece vistas espectaculares de Barcelona. En los famosos parques del jardín, Gaudí combina su estilo arquitectónico sin par con los elementos de la naturaleza. El resultado es un lugar de fantasía sin límites que te cautivará.', '60f74c4ae2a13.jpg', 0, 'enabled'),
(61, 1571, 3, 'Tour fantasma por el barrio Gótico', 2, '5,6,0', 'Visita nocturna alrededor de los barrios antiguos y el centro de Barcelona, basada en el libro \"Fantasmes de Barcelona\"', '09:30', 'En la puerta de McDonald\'s de Ramblas', '¿Qué esconden las calles de Barcelona cuando cae la noche? ¿Qué historias han marcado la vida de nuestros antepasados para siempre? Déjate absorber por los misterios paranormales de Barcelona de la mano de un guía experimentado.\r\n\r\nEl tour fantasma a pie es una visita nocturna por los barrios de Sant Pere, Santa Caterina y la Ribera, y está basado en el libro \"Fantasmes de Barcelona\", escrito por Sylvia Lagarda-Mata. El tour cuenta las historias misteriosas y espeluznantes que han tenido lugar en estas áreas durante décadas.\r\n\r\nSegún lo que cuenta el libro, exorcismos, brujerías, conventos embrujados y registros de apariciones fantasmales son parte de las calles de Barcelona. Los participantes tendrán la oportunidad de descubrir esos fenómenos desconcertantes de una manera divertida y entretenida.', '60f74a7c86cf7.jpg', 0, 'enabled'),
(62, 1572, 3, 'Tour exprés de la Sagrada Familia', 2, '1,3,5,6,0', 'La Sagrada Familia es uno de los edificios más singulares del mundo.', '09:30', 'Junto a la tienda del Barça, frente a la propia iglesia.', 'La Sagrada Familia es el emblema de Barcelona. Construida por Antoni Gaudì, la Sagrada es uno de los edificios más singulares del mundo. Tan pronto como ponga sus ojos en esta majestuosa representación del movimiento modernista, comenzará a apreciar verdaderamente la iglesia más visitada de España. Con sus desafiantes agujas de gravedad e increíbles estatuas, la iglesia barcelonesa te hará sentir como si hubieras entrado en otro universo. Con este tour exprés para grupos pequeños de la Sagrada Familia, se beneficiará de boletos sin colas al obtener la entrada por la vía rápida a la iglesia. Una vez dentro, serás catapultado a la mente de Gaudí, mientras escuchas historias de su flujo creativo contadas por tu guía. Sumérjase en el increíble diseño arquitectónico, una mezcla de gótico y Art Nouveau, mientras escucha a su guía narrar anécdotas sobre la construcción de la Sagrada Familia. Disfruta del ambiente íntimo de un grupo reducido de un máximo de 10 personas, sin preocuparte por perder tu grupo o no poder escuchar a tu guía.', '60f74ba2a8940.jpg', 0, 'enabled'),
(63, 1572, 3, 'Casa Batlló, La Pedrera y degustación de chocolate', 2, '1,3,5,6,0', 'visita guiada a Casa Batlló y La Pedrera, dos de los edificios más significativos arquitectónicamente de Barcelona.', '10:30', 'Plaça Catalunya con Portal de l\'Angel', 'Obtenga más información sobre la rivalidad entre los tres arquitectos más destacados del movimiento modernista a principios del siglo XX, Gaudí, Puig i Cadafalch y Domènech i Montaner. Descubre dos de los edificios más famosos del Passeig de Gracia con tu guía. Esta calle fue conocida localmente como el \"Bloque de la discordia\", donde una serie de edificios representaban el estilo único de cada uno de los tres arquitectos.\r\n\r\nPrimero, aproveche el acceso sin colas a Casa Batlló, un sitio del Patrimonio Mundial de la UNESCO diseñado por el famoso arquitecto Antonio Gaudí. Explore el piso Noble, el museo y el loft mientras descubre la elegancia arquitectónica del edificio.\r\n\r\nLuego, visite una de las boutiques de chocolate más exclusivas de la ciudad. Disfrute de probar un poco de chocolate artesanal, antes de continuar el recorrido con una visita a La Pedrera - Casa Mila, diseñada por Gaudí. Sáltate la cola en la entrada y disfruta de una visita guiada a la azotea, donde podrás admirar hermosas vistas panorámicas de toda la ciudad.', '60f74bd4c17f7.jpg', 0, 'enabled'),
(64, 1573, 15, 'Paseando por Cartagena', 3, '1,3,5,6', 'Un paseo inolvidable por Cartagena.', '10:00', 'Junto al Hard Rock Café', 'Conoce como se vivía en una ciudad del Nuevo Mundo bajo dominio español. Admira el funcionamiento de su fortaleza militar, respira su rica cultura y sorpréndete con las maravillosas vistas y esplendor de edificios en el colorido centro histórico de Cartagena. La Plaza de San Pedro, la Plaza de la Aduana, la Catedral, el Palacio de la Gobernación, la estatua de Bolivar y el Palacio de la Inquisición se quedarán siempre en tu memoria. No te pierdas la artesanía local en la visita a las bóvedas.', '60f7c34fd0ea0.jpg', 0, 'enabled'),
(65, 1573, 15, 'Cartagena Colonial y Folklore', 4, '5,6,0', 'Descubre la magia de Cartagena de Indias.', '10:00', 'Torre del Reloj, Plaza de los Coches.', 'Disfruta de un paseo por una de las ciudades más importantes del Nuevo Mundo. Sumérgete en la belleza de las calles y plazas de su casco histórico. Déjate impresionar por el Fuerte de San Felipe, la Plaza de Bolivar, el Palacio de la Inquisición, el Monasterio de San Pedro Claver y el Museo Naval del Caribe, donde disfrutarás de un show folklorico.', '60f7c45b2f565.jpg', 0, 'enabled'),
(66, 1573, 15, 'Día de Playa en Islas del Rosario', 6, '6,0', 'Disfruta del placer en las Islas Corales del Rosario', '08:30', 'Estaré frente a la torre con una camiseta blanca', 'Colombia encierra una serie de pequeños paraísos en forma de joyas naturales. Algunos de ellos los vas a poder encontrar en las Islas Corales del Rosario, rebosantes de hermosas playas de aguas cristalinas, playas de arena blanca y palmeras. Todo esta área ha sido designada como Parque Nacional Natural y es ideal para descubrir algunos de los arrecifes de coral más deslumbrantes del mundo. \n\nAl llegar a la isla, nos situaremos en el Isleta Resort para tomar un refresco tropical, antes de disfrutar de tiempo libre para recorrer la isla, tumbarnos al sol, darnos un baño relajante y tomar el almuerzo en el buffet del resort. \n\nNunca vas a estar más cerca del paraíso que en las Islas Corales del Rosario. (Almuerzo buffet caribeño no incluido)', '60f7c4fd044ce.jpg', 0, 'enabled'),
(67, 1574, 15, 'Getsemani y los grafitis', 2.5, '1,3,4', 'Descubra el moderno barrio Getsemaní de Cartagena. Aprenda sobre su historia, cultura y escena de arte urbano', '10:00', 'Junto a la tienda Bike & Arts, en el mercado municipal.', 'Vea un nuevo lado de Cartagena mientras explora la moderna Getsemaní con un guía local. Aprenda sobre la historia de la zona a través del arte del graffiti que lo rodea. Comprende el significado que se esconde detrás de las imágenes de animales salvajes, rostros famosos y la vida cotidiana.\n\nSiga a su guía por las calles coloniales hasta los principales lugares de interés del vecindario. Visitará el parque Centenario, la Plaza de la Santísima Trinidad y la calle Umbrella. También pasará un tiempo en Las Tablitas, una tienda considerada la casa más antigua de Getsameni. Pruebe el sabor del vecindario mientras los turistas y los lugareños beben bebidas frías y juegan al dominó.\n\nTome muchas fotos de los alucinantes murales locales y representaciones de la animada cultura urbana. Pruebe un bocadillo local y un tipo diferente de helado antes de visitar los estudios de artistas locales. Explore las galerías de artistas, vea un espectáculo de pintura en vivo o incluso pruebe su propia obra (por un cargo adicional).', '60f7c6a1d075e.jpg', 0, 'enabled'),
(68, 1574, 15, 'Sabores de Cartagena', 2, '5,6,0', 'Pruebe la deliciosa y auténtica comida callejera de Cartagena en compañía de un local.', '12:30', 'Dentro de la puerta principal de la Torre del Reloj', 'Descubre el espíritu relajado de Cartagena con un tour diseñado para que degustes la cocina caribeña. Este tour le permitirá visitar y experimentar lugares que no aparecen en guías convencionales. Reúnase con su guía local en la icónica Torre del Reloj para comenzar su ruta de las mejores comidas locales y lugares de interés clave de la ciudad.\n\nDurante la mañana, visite 9 lugares de comida callejera, generalmente desapercibidos para los extranjeros pero adorados por los lugareños. Pruebe recetas originales mientras ve algunos de los lugares más importantes del centro histórico, como la Plaza de la Paz, la Plaza de los Autos y la Plaza de la Proclamación. Conoce y saluda a los guardianes del tesoro culinario local y llévate a casa sus secretos y recetas.', '60f7c70eee731.jpg', 0, 'enabled'),
(69, 1575, 13, 'Recorrido a pie por el centro', 3, '1,2,3,4,5', 'Conozca San Petersburgo con un hermoso recorrido a pie', '09:00', 'estación de metro \"Gostiny dvor\", junto a la torre rosa con un reloj.', 'Durante este recorrido a pie de tres horas, descubra algo de lo que hace que San Petersburgo sea tan grandioso. Camina por la calle principal, Nevsky Prospekt, y luego visita la Catedral de Kazan, uno de los templos más grandes y majestuosos de San Petersburgo.\n\nA lo largo de la experiencia, visite tres plazas centrales de la ciudad. El primero de ellos es la Plaza de San Isaac, que ofrece una vista maravillosa del Palacio Mariinsky y la Catedral de San Isaac.\n\nContinúe hasta la Plaza del Senado, donde se encuentra el famoso monumento a Pedro el Gran \"Jinete de Bronce\". Más adelante en la Promenade des Anglais, disfrute de las vistas panorámicas del río Neva, el palacio Menshikov, el edificio Kunstkamera y el puente del palacio.\n\nDirígete luego a la plaza principal de la ciudad, la Plaza del Palacio. Allí se encuentra el Palacio de Invierno del Hermitage, el Edificio del Estado Mayor y la Columna de Alejandro.', '60f7c9da9e08d.jpg', 0, 'enabled'),
(70, 1575, 13, 'La Fortaleza de Pedro y Pablo', 3, '1,2,3,4,5', 'Disfrute una de las principales atracciones de San Petersburgo.', '13:00', 'En la puerta de la propia Fortaleza, junto taquillas', 'Descubra la mundialmente famosa Nevsky Prospect, bordeada por los palacios de mármol de la antigua realeza rusa, así como por las boutiques y salones de arte más modernos de la ciudad dispuestos en antiguas fachadas de edificios del siglo XVIII. Admire las hermosas calles y las impresionantes catedrales clásicas y renacentistas. Luego, disfrute de una excelente oportunidad para tomar fotografías con un panorama impresionante a lo largo de los terraplenes del Neva. Junto a las columnas rostrales de la ciudad, tendrá una vista de los 5 edificios del Museo Estatal del Hermitage, el Almirantazgo y la Catedral de San Isaac.\n\nDesde aquí, visitará las obras maestras arquitectónicas más espléndidas de San Petersburgo: la Plaza de Bellas Artes, la magnífica Iglesia de la Resurrección sobre la Sangre Derramada, el Campo de Marte, el Teatro Dramático Alexanderinsky, la Catedral Smolny, el edificio del Senado Clásico, el Jinete de Bronce , y mucho más. Disfrute de la belleza de la tercera plaza más grande del mundo: la Plaza del Palacio, hogar del Palacio de Invierno y la Columna de Alejandro.\n\nDurante este recorrido, también visitará la Fortaleza de Pedro y Pablo, la construcción más antigua de San Petersburgo. La Fortaleza de Pedro y Pablo se creó originalmente para proteger la ciudad, pero finalmente se usó como prisión política. La Catedral de San Pedro y San Pablo es un ejemplo único de la arquitectura rusa del siglo XVIII que se ha mantenido intacta. Durante casi dos siglos, sirvió como lugar de enterramiento para los emperadores rusos. El último zar ruso, Nicolás II, y su familia fueron enterrados en la pequeña capilla de Santa Catalina de la catedral en 1998.', '60f7ca5c5d067.jpg', 0, 'enabled'),
(71, 1575, 13, 'Iglesia del Salvador sobre la Sangre Derramada', 1.5, '5,6,0', 'Visita uno de los monumentos más famosos de Rusia, la Iglesia del Salvador sobre la sangre derramada', '16:00', 'Griboyédov Canal Embankment 2B.', 'NO INCLUYE LA ENTRADA\n\nLa Iglesia del Salvador sobre la sangre derramada está situada a orillas del canal Griboedov. Allí, tu guía te informará acerca de los detalles de la colección de mosaicos, de las especialidades y trama de las imágenes y de la historia de este maravilloso lugar.  Sea cual sea la razón para visitar la Iglesia del Salvador sobre la sangre derramada:ver los mosaicos únicos o conocer cómo y por qué Alejandro II fue asesinado, sin duda es un lugar de visita obligada.\n\nLa Iglesia del Salvador sobre la sangre derramada es uno de los símbolos de San Petersburgo, al igual que San Basilio en Moscú. Por cierto, ambos lugares se confunden a menudo. Aun así, la Iglesia del Salvador fue construida después de San Basilio en 1881, como recuerdo de la terrible muerte del emperador Alejandro II. Es única por el mosaico, que cubre todo el interior de la catedral.', '60f7cad44f952.jpg', 0, 'enabled'),
(72, 1576, 13, 'El Hermitage al completo', 3, '2,3,4,5,6,0', 'Disfrute de una visita guiada completa por el interior del Palacio de Invierno y el museo del Hermitage', '11:00', 'Columna de Alejandro en la Plaza del Palacio', 'No incluye el ticket del museo.\n\nEl museo más grande del país tiene mucho que ofrecer, desde interiores lujosamente decorados hasta pinturas famosas y estatuas antiguas. Comenzará su recorrido con interiores infames que incluyen Jordan Staircase, St. George Hall, Armorial Hall, Pavillion Hall, donde verá el estilo de vida imperial en todo su esplendor.\n\nEncuentre su inspiración en múltiples pinturas de los viejos maestros, admire el Jardín Colgante de la Pequeña Ermita, una réplica de las Logias de Rafael del Vaticano, una escultura de un Niño agachado de Miguel Ángel, obras de Leonardo Da Vinci y Rafael. El elemento más inusual del museo Hermitage es el reloj Peacock diseñado a mediados del siglo XVIII que cautivará a cualquier visitante. Su guía profesional hará que la historia del arte cobre vida en los hermosos pasillos de esta residencia real. Después del recorrido, puede quedarse en el museo para explorar las colecciones.', '60f7cbfcb4747.jpg', 0, 'enabled'),
(73, 1576, 13, 'Mágica San Petersburgo de noche.', 2, '5,6', 'Admira los monumentos de San Petersburgo con su espectacular iluminación nocturna.', '23:00', 'Columna de Alejandro en la Plaza del Palacio, en el lado que da al Museo del Hermitage.', 'Admira los monumentos de San Petersburgo con su espectacular iluminación nocturna. En este recorrido podrás descubrir la belleza de la capital del norte en uno de sus momentos más espectaculares.\n\nEsta excursión incluye un recorrido turístico en vehículo por los monumentos de la ciudad, que se vuelven todavía más fascinantes una vez que se encienden las luces y se iluminan los palacios y plazas más impresionantes de San Petersburgo. En verano tendrás la oportunidad de disfrutar del romanticismo de las noches blancas y observarás la apertura de numerosos puentes levadizos. Durante las noches blancas, cuando el leve ocaso sustituye la oscuridad de la noche, las calles, plazas y muelles adquieren un encanto único. Aunque el periodo de las noches blancas es corto y se acaba a finales de julio, esto no quiere decir que el encanto de San Petersburgo por la noche se desvanezca. La ciudad dominada por el agua ofrece a sus invitados muchas posibilidades de sentir esa belleza.', '60f7cca31a6e9.jpg', 0, 'enabled');
INSERT INTO `tour` (`id`, `user_id`, `city_id`, `title`, `duration`, `week_days`, `highlight`, `starting_time`, `meeting_point`, `description`, `imgpath`, `ranking`, `status`) VALUES
(74, 1577, 10, 'Atenas y la Acrópolis', 6, '1,2,5,6,0', 'Descubre Atenas en todo su esplendor con este paseo guiado', '08:30', 'En la parada de metro Plaaka', 'La excursión de día completo comenzará con una visita al Estadio Panathinaikó, donde en 1896 se celebraron los primeros Juegos Olímpicos de la era moderna.\n\nPasa por la residencia del Primer Ministro y el antiguo Palacio Real, que aún está bajo la vigilancia de los coloridos soldados Evzone.\n\nVerás el Zappeion, un edificio de importancia histórica convertido en un centro de exposiciones. A continuación, llegarás al Templo de Zeus Olímpico, cuya construcción se completó en el año 131 d.C.\n\nLa excursión continúa por los Jardines Nacionales rumbo al Arco de Adriano y el Parlamento.\n\nTambién pasarás por la Academia Nacional, la Biblioteca Nacional, el antiguo parlamento, la Plaza Síntagma y la Iglesia Ortodoxa rusa.\n\nMaravíllate con la Acrópolis, construida en el siglo V a. C. Visita los Propíleos, el Templo de Atenea Niké, el Partenón y el Erecteón, con su famoso pórtico de las Cariátides.\n\nHaz un breve paseo por los teatros de Herodes Ático y de Dionisio mientras te diriges al Museo de la Acrópolis. El museo alberga más de 4.000 objetos de la Acrópolis y la exhibición cubre la Edad de Bronce griega, así como los períodos romano y bizantino.\n\nEntradas no incluidas', '60f7ceb09881f.jpg', 0, 'enabled'),
(75, 1577, 10, 'Atenas tras la puesta de sol', 2.5, '5,6,0', 'Experimenta la ciudad sin grandes multitudes en el tour nocturno', '20:00', 'Calle Apostolou Pavlou 53 (metro Thissio)', 'Explora Atenas tras la puesta de sol en un tour en bicicleta eléctrica por el centro de la ciudad. Escucha a los músicos callejeros y disfruta del aire fresco de la noche mientras admiras la iluminación de los monumentos históricos.\n\nSube a la colina de las Ninfas para disfrutar de las vistas de la Acrópolis y el monte Licabeto. Haz una parada en el arco de Adriano, el templo de Zeus y el edificio del Parlamento griego para admirar los uniformes tradicionales de los guardas evzones. Descubre el lugar en el que se celebraron los primeros Juegos Olímpicos modernos en el estadio Panathinaikó.\n\nRecorre las pintorescas calles de Plaka, llenas de cafés y restaurantes, y contempla la antigua Ágora, el templo de Hefesto y el pórtico de la estoa de Átalo.', '60f7cf48eba72.jpg', 0, 'enabled'),
(76, 1577, 10, 'Mercados de Atenas', 2.5, '1,3,5', 'Degustará especialidades regionales, probará la mejor comida callejera', '12:30', 'Plaza Monastiraki (frente a la estación de metro-salida principal)', 'Descubra la ciudad a un ritmo relajante con su experto local que compartirá su amor por los deliciosos platos y los sabrosos productos. Esta aventura gastronómica comienza con un delicioso café griego y un manjar mientras disfruta del ambiente matutino de la ciudad y la vista a la Acrópolis mientras toma el primer sorbo. Viaje a través del tiempo mientras conoce la historia de una de las cafeterías más antiguas de Atenas y descubra todo lo que necesita saber sobre el café griego. El lugar es tan instagrammable como sea posible, así que toma tus cámaras y toma algunas fotos geniales mientras disfrutas de tu relajante café de la mañana.\n\nDebes haber escuchado mucho sobre los refrigerios matutinos, pero este es definitivamente un recién llegado a la gastronomía griega. ¡Es el refrigerio saludable más querido para los griegos que vienen con un toque especial! La escena culinaria local continúa evolucionando y estará encantado de descubrir algo nuevo. Esto es una sorpresa, pero no temas ... ¡te encantará!\n\nSigue explorando los sabores más emocionantes de Grecia a través de un taller donde probarás y aprenderás más sobre algunos de los productos más deliciosos de este país. Aquí también se encuentra la parte más vibrante de la ciudad, un oasis gastronómico durante todo el año. Aquí sentirás el verdadero pulso de la ciudad, entre puestos de comida, cafeterías, mercados al aire libre y tabernas bien escondidas. Deja que tus sentidos te guíen; ¡Este es el mercado local de alimentos donde se mezclará con los lugareños y observará, olerá y tocará los ingredientes de mejor calidad que esta ciudad tiene para ofrecer!', '60f7cfe10ceed.jpg', 0, 'enabled'),
(77, 1578, 10, 'historia, filosofía y democracia de Atenas', 2.5, '6,0', 'Discutir la antigua democracia en comparación con la moderna', '10:00', 'En la parada de metro Kerameikos', 'En este recorrido, nosotros: \n\na. Caminará por muchos de los lugares más importantes de la antigua Atenas y le dará consejos para hacer turismo, actividades, comida, vida nocturna, etc. \n\nb. Proporcionará una visión general de la historia antigua de la ciudad y discutirá principalmente sobre sus logros más importantes, como Filosofía, Democracia, Ciencias, Arte, etc. \n\nc. Examinará algunas de las teorías filosóficas antiguas bajo una nueva luz debido a los sorprendentes descubrimientos científicos más recientes. ', '60f7d0de565d5.jpg', 0, 'enabled'),
(78, 1578, 10, 'Recorrido fotográfico no convencional', 3, '1,2,3,4,5,6,0', '\"Capture\" la esencia de Grecia.', '10:30', 'Plaza Syntagma frente al edificio del Parlamento griego', '¿Buscas una experiencia auténtica que combine la vida cotidiana de un ateniense local con las fotos instantáneas más antiguas? En este recorrido, su experto local le entregará una cámara instantánea y lo guiará a través del vibrante centro de Atenas, que se convertirá en un taller fotográfico creativo. Esta experiencia no solo apunta al descubrimiento de los puntos de referencia de Atenas, sino también a sentir la verdadera atmósfera de la ciudad a través de la exploración de los mercados locales y la interacción con los locales.\n\nAl participar en este tour, podrá capturar la esencia de Grecia disfrutando de un café tradicional griego por la mañana, paseando por Monastiraki, Thissio, Plaka y otros barrios centrales, y finalmente probando la comida callejera como un verdadero ateniense. Tómate el café de la mañana mientras disfrutas de la vista de la Acrópolis y prueba el bocadillo griego más famoso, aunque este viene con un toque especial. Tome fotos de algunos de los monumentos más emblemáticos de la ciudad, vea algunos de los mejores graffiti y pasee por algunos de los barrios más pintorescos de Atenas. Visite la casa más antigua de la ciudad y vea algunos de los cafés más lindos mientras se \"pierde\" en un laberinto de callejones estrechos, un escenario mágico que le recordará las islas griegas.\n\nAl final de la gira, habrás capturado 10 increíbles fotos instantáneas y habrás pasado el día como un local.', '60f7d188d0741.jpg', 0, 'enabled'),
(79, 1579, 12, 'Leyendas y Misterios de Budapest', 2.5, '5,6', 'Descubra los misterios de la ciudad en un recorrido a pie por una de las partes más emblemáticas de la ciudad.', '20:00', 'entrada de la Galería de Arte Műcsarnok', 'Rodeado de numerosas estatuas, conozca las historias de los fundadores de Budapest.\n\nCuando cae la noche, esta hermosa ciudad se transforma en algo más oscuro, donde los edificios iluminados dibujan luces y sombras siniestras, como en el castillo de Vajdahunyad. Escuche sobre las brujas, los asesinatos y los mitos populares de la ciudad, así como sobre los rituales más oscuros que han tenido lugar en Budapest.\n\nVisite City Park y Bagni Szécehnyi. Conozca los orígenes del río Danubio, los misterios de Atila, el secreto de la juventud de la condesa Elizabeth Báthory y las historias detrás de la Orden Paulina Húngara.', '60f7d34d4446a.jpg', 0, 'enabled'),
(80, 1579, 12, 'Paseo por la ciudad y el castillo', 3, '1,2,3,4,5,6,0', 'Admira edificios emblemáticos como el Parlamento y la basílica de San Esteban. ', '09:30', 'Bathory Utca 63', 'omenzarás tu tour de tres horas por la gran ciudad de Budapest pasando por el emblemático edificio del Parlamento antes de cruzar el río Danubio por el puente Margaret. El autobús te llevará al distrito del Castillo Real, en el lado de Buda, donde disfrutarás de un agradable y corto paseo hasta el Halászbástya (bastión de los pescadores) y podrás contemplar el exterior de la iglesia de Matías.\n\nA continuación, subirás la colina Géllert para poder sacar fotos y admirar las vistas espectaculares de todo Budapest. Tras esta parada, cruzarás el puente Elizabeth y recorrerás la avenida Andrássy hasta llegar a la plaza de los Héroes.\n\nPasarás por delante de la ópera y de la basílica de San Esteban de regreso al hotel Intercontinental, donde finaliza el tour.', '60f7d3e4c7c2a.jpg', 0, 'enabled'),
(81, 1579, 12, 'Budapest tras el Telón de Acero', 5, '1,3,5', 'Han pasado más de 2 décadas desde que se retiraron las tropas soviéticas de Hungría, pero quedan vestigios de la Guerra Fría', '08:45', 'Entrada del Memento Park', 'Conoce los monumentos de Budapest que conmemoran la época en que Hungría se encontraba tras el Telón de Acero y aprender acerca de la vida en aquel entonces.\n\nVisita la Citadella para conocer la historia del asedio de Budapest, hacia finales de la Segunda Guerra Mundial, que marcó el inicio de la ocupación del país. Admira la estatua de la Libertad, el colosal monumento erigido en 1947 en el monte Gellért.\n\nLa estatua de la Libertad se construyó en dedicación a las tropas rusas y sus 14 metros de altura unidos a los 26 metros de altura de su pedestal probablemente la convierten en la más alta de este tipo en Europa. Actualmente se considera un símbolo universal de la libertad y es un elemento muy importante de la ciudad.\n\nRecorre la Casa del Terror, un museo en conmemoración de las víctimas durante la época comunista (con audioguía incluida).\n\nAdemás de otros monumentos a los que te llevará el guía, verás estatuas de las personas más célebres de la época, como Marx, Lenin y Ostapenko. El monumento a la amistad húngaro-soviética y muchos otros construidos entre 1945 y 1989 fueron reubicados desde la ciudad hasta el museo al aire libre de Memento Park. La colección de 42 obras incluye la estatua de 6 metros de altura del soldado del ejército de liberación.\n\nTermina el tour con un bonito recuerdo de la época recorriendo la colina de Buda en un el Tren de los Niños. Conocido originalmente como el Tren de los Pioneros, comenzó su servicio en 1949 y eran niños de 10 a 14 años quienes se encargaban de manejarlo.', '60f7d4641414b.jpg', 0, 'enabled'),
(82, 1579, 12, 'A pie por el barrio judío', 2.5, '5,6', 'Descubre la profunda huella que la comunidad judía dejó en Budapest', '11:00', 'la fuente del Danubio, frente a la noria Budapest Eye', 'Aprende todo sobre la comunidad judía húngara y su imponente legado cultural.\n\nVisita las sinagogas más emblemáticas, como la sinagoga de la calle Dohány, que incluye el templo de los Héroes, el Museo Judío, el jardín de los Justos, el cementerio judío y el parque memorial del Holocausto \"Raoul Wallenberg\", con su simbólico árbol de la vida.\n\nPasa por la sinagoga ortodoxa de la calle Kazinczy y su mikve, donde se realizan baños rituales de purificación. Viaja a los días de la Segunda Guerra Mundial y escucha historias tristes sobre el gueto donde los judíos se vieron forzados a vivir durante el Holocausto.\n\nAprende datos curiosos sobre las tradiciones y costumbres judías, descubre qué es la comida kosher y aprende cómo el barrio se transformó en el distrito VII.', '60f7d4dda8b9a.jpg', 0, 'enabled'),
(83, 1580, 11, 'Praga: sombras oscuras del centro histórico', 1.5, '5,6', 'Recorre las sombrías calles del centro de Praga y descubre algunos de los fantasmas que atormentan la noche.', '23:00', 'Staroměstské náměstí 5', 'Recorre las calles y avenidas adoquinadas del centro histórico de Praga en la sombra de la noche y visita monumentos medievales donde se narran relatos.\n\nReúnete con tu guía en el centro de la ciudad y prepárate para emocionarte tanto como para quedarte helado con relatos de terror y terribles encantamientos, de fantasmas y demonios y cosas que se alteran por la noche. Ve a iglesias góticas que aún están bajo el hechizo de los no muertos y visita plazas de mercados y cementerios en los que tienen lugar terribles encantamientos.\n\nIrás guiado por un experto narrador que dará vida a algunas de las historias de fantasmas y relatos de terror de la zona más atmosférica de Praga. Escucha acerca de sangrientas tragedias por calles desiertas, en las que el folclore y la superstición se esconden en los rincones de la vida cotidiana.', '60f7d8e604c8d.jpg', 0, 'enabled'),
(84, 1580, 11, 'Reloj Astronómico: Icono de Praga', 1.5, '3,4,5', 'Admira las extraordinarias vistas desde la torre.', '12:00', 'Torre del Reloj Astronómico, Plaza de la Ciudad Vieja', 'Este tour guiado de 3 horas comienza delante de la torre del Reloj Astronómico, donde escucharás un breve repaso histórico sobre las ciudades vieja y nueva de Praga.\n\nDespués entrarás a la torre y subirás hasta arriba del todo, allí podrás disfrutar de las espectaculares vistas de Praga mientras tu guía te habla de los edificios y monumentos que se ven. \n\nTras la visita al Reloj, el guía te mostrará casas históricas, palacios, iglesias, teatros y mucho más. Verás los lugares donde grandes figuras como Carlos IV, Amadeus Mozart o Albert Einstein vivieron y trabajaron.\n\nVisita también la zona de la ciudad nueva y admira sitios donde sucedieron importantes eventos de la historia moderna de Praga.\n\nENTRADA NO INCLUIDA', '60f7d97331799.jpg', 0, 'enabled'),
(85, 1580, 11, 'La ciudad vieja y el castillo', 3, '5,6,0', 'El Reloj Astronómico de la Plaza Vieja, el puente de Carlos, el castillo de Praga y la iglesia de San Nicolás son algunos de los', '12:00', 'delante del reloj astronómico de la plaza de la ciudad vieja', 'Observa el espectacular puente de Praga en un tour informativo que reconoce la necesidad de recorrer todo el paisaje y la historia de la antigua Praga y el castillo.\n\nEn este paseo guiado de 3 horas empezarás en el Reloj Astronómico de la Plaza Vieja y dirígete al puente de Carlos. Esucucha el contexto histórico con las leyendas del centro histórico.\n\nDespués, cruzarás el puente de Carlos y cogerás el tranvía hasta el castillo de Praga donde aprenderás sobre el desarrollo del puente de Carlos y el castillo de Praga.\n\nMientras te diriges hacia el castillo, pararás a admirar los sitios de Hradcany, el distrito del castillo, y conocerás su historia.\n\nEntra al castillo de Praga y disfruta de algunas historias finales de Praga acompañado de unas magníficas vistas de toda la ciudad de Praga.', '60f7d9d3462d9.jpg', 0, 'enabled'),
(86, 1580, 11, 'Casco antiguo de Praga y barrio judío', 1.5, '3,4', 'Explora el casco antiguo de Praga, el barrio judío y sus sinagogas.', '16:00', 'Plaza de Jan Palach, Praga. En frente del Rudolfinum.', 'El tour guiado de 90 minutos comienza en la plaza Jan Palach, a orillas del río Vltava, frente al Rudolfinum. Desde allí te dirigirás al barrio judío, donde tu guía te contará sobre la historia de los judíos en Praga.\n\nUna vez tengas una idea general de la herencia judía de la ciudad, se te llevará por las sinagogas principales y el cementerio judío, donde Kafka escribió gran parte de sus obras.\n\nDespués, dirígete al casco antiguo de Praga y disfruta de los monumentos históricos, incluido el mundialmente famoso reloj astronómico.\n\nGracias a tu guía apasionado podrás aprender sobre historia local y mundial y el pasado judío de Praga. Disfruta de las explicaciones e historias que se esconden tras cada uno de los edificios más importantes.', '60f7da3ab5f7a.jpg', 0, 'enabled');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tour_category`
--

CREATE TABLE `tour_category` (
  `tour_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tour_category`
--

INSERT INTO `tour_category` (`tour_id`, `category_id`) VALUES
(28, 1),
(28, 6),
(29, 4),
(29, 6),
(30, 1),
(30, 4),
(31, 1),
(31, 6),
(36, 1),
(36, 4),
(37, 1),
(37, 4),
(39, 1),
(39, 4),
(39, 8),
(41, 3),
(41, 8),
(42, 1),
(42, 3),
(42, 6),
(43, 1),
(44, 1),
(44, 2),
(44, 4),
(44, 7),
(45, 4),
(45, 6),
(46, 1),
(46, 7),
(47, 1),
(47, 7),
(48, 2),
(48, 4),
(49, 1),
(50, 1),
(50, 7),
(51, 2),
(51, 7),
(52, 1),
(52, 4),
(53, 4),
(53, 7),
(54, 1),
(55, 1),
(55, 6),
(55, 7),
(56, 1),
(56, 6),
(56, 7),
(57, 1),
(58, 6),
(58, 7),
(64, 1),
(64, 7),
(65, 1),
(65, 7),
(66, 5),
(67, 4),
(68, 2),
(68, 7),
(69, 1),
(69, 7),
(70, 1),
(71, 1),
(72, 1),
(73, 4),
(74, 1),
(74, 7),
(75, 4),
(76, 2),
(76, 7),
(77, 1),
(78, 4),
(79, 1),
(79, 4),
(79, 7),
(80, 1),
(80, 7),
(81, 1),
(81, 4),
(82, 1),
(82, 4),
(82, 7),
(83, 4),
(83, 7),
(84, 1),
(85, 1),
(86, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `since` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `lastname`, `phone`, `imgpath`, `description`, `short_desc`, `since`, `roles`) VALUES
(1, 'deleted_user@localz.com', '1234', 'Usuario Eliminado', 'Usuario Eliminado', 'Usuario Eliminado', 'deleted.jpg', 'Este usuario se ha dado de baja.', 'El usuario eliminó su cuenta', '2021-07-17 23:31:37', '[\"ROLE_USER\"]'),
(1542, 'raffaelaNYC@gmail.com', '$2y$13$YEdLEjdHeV/bPbDRGFFd2OHKQhYvxAA53atcsOZXbz6kCdbAhxs6e', 'Raffaella', 'Monterosso', '+1 232 4567893', '60eb64a122b1e.jpg', 'También me llamó la atención la arquitectura asombrosa, soy una apasionada del Art Deco y Nueva York es la “Meca” de este estilo elegante y emocionante. Descubrí entonces muchos más aspectos de esta ciudad que solía conocer y que normalmente la gente que no vive aquí, realmente conoce. Hace unos años sentí la necesidad de compartir todo mi conocimiento sobre Nueva York como un \"insider\" que también tiene el punto de vista de un turista como el tuyo, para que la gente que visite la ciudad pueda apreciar un poco más de lo \"real\" Big Apple y la increíble energía que transmite a través de su gente. Así que decidí convertirme en un guía turístico con licencia de la ciudad de Nueva York y comenzar esta nueva aventura. Estoy convencida de que no hay un tour más interesante que otro, no existe una solución “One Fits All”. Cada uno de nosotros tiene intereses y necesidades diferentes, por lo que un tour a medida es siempre la mejor opción. ¡Tu inolvidable viaje en Nueva York comienza AQUÍ! ', '¿Por qué me convertí en guía? Vine hace unos años desde Florencia como turista, y luego me enamoré de esta vibrante ciudad (y no solo de la ciudad...) y decidí quedarme', '2021-07-11 23:37:36', '[\"ROLE_GUIDE\"]'),
(1543, 'dianaNYC@gmail.com', '$2y$13$aFPB4PVFMU8AT1eiDzzMOOAezBLeXLjoZtcmrAgyCqh07QN9FfMWy', 'Diana', 'Marquez', '+1 324 21546 12345', '60ec0ab37ea6e.jpg', 'Soy una persona muy extrovertida y muy sociable. Les aseguro que haremos de esta visita una gran experiencia. Espero verlos pronto en esta hermosa ciudad, \"La Gran Manzana\" 🍎🍎😉😉', 'Guía de turismo en la ciudad de Nueva York. He pasado la mitad de mi vida dedicada al turismo porque me encanta mostrar a los visitantes lo que cada sitio turístico esconde.', '2021-07-12 11:26:09', '[\"ROLE_GUIDE\"]'),
(1557, 'isaiahLHR@gmail.com', '$2y$13$tHjxIa2NpsRJV.UVo7bbVOP/6jYsoiAutKs8f3cArCDFeDbBsyrd6', 'Isaiah', 'Thomas', '+44 785 123 1224', '60f3ee1570810.jpg', '¡Hola! Me encanta la his¡Hola! Me encanta la historia de la ciudad, sus secretos y arqueología, y he pasado los últimos 4 años guiando recorridos por el Museo de Londres. Aunque técnicamente solo soy londinense (nací y crecí al final de la línea Metropolitana), he vivido aquí en el East End durante años y siempre he disfrutado compartiendo historias del pasado de Londres. ¡Todas las calles de la ciudad y el East End parecen tener una anécdota (o un buen pub) y siempre estoy feliz de hablar durante horas sobre esta maravillosa ciudad!', 'Soy Isaiah y me encanta Londres, es vibrante y quiero mostrarte todos sus rincones.', '2021-07-18 11:02:11', '[\"ROLE_GUIDE\"]'),
(1562, 'jackNYC@gmail.com', '$2y$13$R9iWLk42yK9noAOZntLY5.GABfAAex3xQJF7FtcSvU4cHIr7WPhOC', 'Jack', 'Miller', '+1 321 5798513', '60f720b029383.jpg', 'Desde entonces no he parado de explorar sus monumentos y rincones. Investigando los sucesos y cambios que esta ciudad ha sufrido a lo largo de su historia, especialmente el siglo XX. Viviendo y compartiendo continuamente mis conocimientos con mis amigos descubrí que mi verdadero talento es comunicar, vivir y socializar con la gente. También soy un apasionado del arte moderno, especialmente el arte urbano. En mi tiempo libre me gusta preparar y realizar graffitis. Incluso enseñar a la gente algunas técnicas para su iniciación. Ahora quiero compartir mis conocimientos con vosotros. Será un placer enseñaros NYC, y explicar su historia tan complicada y llena de cambios.', 'Soy de Texas pero llevo 13 años en NYC, y aunque vine porque me interesa el arte y para desarrollarme cómo artista, empezé a interesarme por la historia de esta ciudad.', '2021-07-20 21:14:54', '[\"ROLE_GUIDE\"]'),
(1563, 'benLHR@gmail.com', '$2y$13$zf9.5e/cOLF.ljvAkO4cee8rQaz9141ZzMCLYdILrciZ81RI4B9jK', 'Ben', 'Harper', '+44 7551 215214', '60f7258cd0fd4.jpg', 'Tengo un título en Historia y Política, por lo que puedo compartir mi conocimiento y amor por Londres contigo. ¡Conozco muchas gemas escondidas para comida, bebida y más que compartiré con ustedes en el recorrido!', '¡Hola, soy Ben, nacido y criado en Londres!', '2021-07-20 21:35:39', '[\"ROLE_GUIDE\"]'),
(1564, 'hindLHR@gmail.com', '$2y$13$B5LP3ZBFoC0VaeRbg63Kkubj8LzWv/ZaELm7WMkFpdQXCgjcvPwRO', 'Hind', 'Bricha', '+44 57651 1631321', '60f72db908314.jpg', 'Cuando llegué por primera vez a Londres, me enamoré instantáneamente de la ciudad. La cultura, la historia, el arte, la arquitectura, todo es maravilloso. Y eso es justo lo que puedes ver en la superficie: hay muchas más historias detrás de estos hermosos edificios, secretos escondidos en estas calles. Eso es lo que hace que mis recorridos sean los mejores para continuar, lo que me impulsa es mi pasión por aprender más sobre la historia de esta ciudad y eso es lo que quiero mostrarles en mis recorridos. Más: tengo excelentes recomendaciones sobre otras cosas increíbles que hacer en Londres y restaurantes para visitar que harán que su viaje a Londres sea muy especial.', 'Soy estudiante aquí en Londres. Soy una joven confiada, carismática y curiosa a la que le encanta aprender más sobre el mundo que la rodea.', '2021-07-20 22:10:31', '[\"ROLE_GUIDE\"]'),
(1565, 'julieCDG@gmail.com', '$2y$13$KwnKQJDy7Muw.Y8K0UhIce3YuaunzrjCb5C0yT.PufUjzUneAAmfK', 'Julie', 'Grandjean', '+33 62 58 47 12', '60f72f6d01fe9.jpg', 'Soy un guía profesional licenciado, con años de experiencia en el guiado de grandes grupos, así como turistas individuales, enamorado de la ciudad donde vivo, el arte y la arqueología. Si elige unirse a mis recorridos, estaré más que feliz de mostrarles mi ciudad. Me considero una persona a la que le encanta conocer gente nueva y un \"viajero profesional\".', 'Hola ! Soy Julie. Mis amigos me llamaban \"Parisina\", gracias a mi pasión por París.', '2021-07-20 22:17:47', '[\"ROLE_GUIDE\"]'),
(1566, 'teoCDG@gmail.com', '$2y$13$4SKEnP8KiAWD4dT0vac9wu59i8OQS/jWFAmi6RBGoSQsDXVI/yL2O', 'Teo', 'Glandut', '+33 56 45 45 98', '60f736ce87e47.jpg', 'He trabajado durante 8 años haciendo obras de teatro en España y escribiendo para un programa de televisión llamado \"El Hormiguero\", así como grabando monólogos para Comedy Central, Cadena Ser o Antena 3. Sin embargo, mi amor por la historia y el teatro me llevó a Francia consiguiendo una plaza en una de las grandes escuelas de arte dramático de Europa. Me armé de valor y decidí montar pequeños tours en forma de espectáculo para contarte la vida de una ciudad de la manera más especial posible. Espero verte pronto. Au revoir!', 'Hola! Por fin nos conocemos. Soy Teo Glandut, músico, guionista y clown residiendo en París.', '2021-07-20 22:49:16', '[\"ROLE_GUIDE\"]'),
(1567, 'gulIST@gmail.com', '$2y$13$4AdmzNsiRnAuDWRbm4/mnuG0Vrb7kFoqyvKoUTBx48rFTHmlFbaIm', 'Gul', 'Yilmaz', '+64 1554 1231 5', '60f73c08d8e37.jpg', 'He guiado a grandes grupos por toda Turquía, pero durante este período de pandemia me concentré en la ciudad de Estambul y ahora tengo tanto tiempo libre que estoy listo para mostrarte todo.', 'Soy Gül, también puedes llamarme Rose. He sido guía turístico con licencia durante 4 años', '2021-07-20 23:06:52', '[\"ROLE_GUIDE\"]'),
(1568, 'dorukIST@gmail.com', '$2y$13$doypicdQfNRZ12p8Fsm5BeWvHC9xWLZmiByly8P5s3gR8azoQwb/q', 'Dorük', 'Siçmeli', '+69 4564 13541 33', '60f73d34224bb.jpg', 'Por todo ese tiempo con la misma pasión, guío a personas interesadas en explorar Estambul que data de hace 2000 años. Me encanta presentar la historia, el arte y viajar. Es invaluable ver a los extranjeros probar comida y bebidas locales.', 'Hola, soy Dorük. He trabajado como guía local durante 13 años.', '2021-07-20 23:16:34', '[\"ROLE_GUIDE\"]'),
(1569, 'Luis@gmail.com', '$2y$13$Wl9TcEnONT3tLII9Imd3qO3.WCYvZTdbM/hpBtduXzyrVD3Ozgxc.', 'Luis', 'González', '652033144', NULL, '', '', '2021-07-20 23:33:09', '[\"ROLE_USER\"]'),
(1570, 'marita@gmail.com', '$2y$13$x0HpsNoH8EMiAnpfSmfxte3L9266hgOB20nsdEi3dizyqSTdTAf6O', 'Marita', 'Moreno', '657839316', NULL, '', '', '2021-07-20 23:49:27', '[\"ROLE_USER\"]'),
(1571, 'laiaBCN@gmail.com', '$2y$13$j3/XNZdtjQZsQYPzeWXLv.B6ohwBiNwJaFaksw4jZHt0s9aecJduu', 'Laia', 'Palau', '6475145211', '60f74a03767e0.jpg', 'Por eso he vivido en lugares tan mágicos y paradisíacos como París, Rio de Janeiro, Punta Cana, Pamplona o Barcelona... me haría muy feliz sellar el pasaporte de tu alegría enseñándote lo mejor de estos lugares y siendo tu guía turístico en todo el mundo! Guía Oficial de Turismo con credenciales: - Barcelona GT-3150 (Departament de Turisme de la Generalitat de Catalunya). - Pamplona- Iruña RTN2020/611226 UETC0102 (Registro de Turismo del Gobierno de Navarra).', 'Me gusta vivir donde la gente sueña con ir de vacaciones!', '2021-07-21 00:11:13', '[\"ROLE_GUIDE\"]'),
(1572, 'jordiBCN@gmail.com', '$2y$13$5ElzCftUg6P3vIRiAIh9Guj1R.C1tOOZGzTAyyYe0gN04kZ3C7vU.', 'Jordi', 'Busquets', '654122451', '60f74b3d5e6dc.jpg', 'Me encanta la ciudad y me apasiona que diferentes personas que lleguen a la ciudad conozcan los detalles más inhóspitos de ella. Barcelona está hecha para caminar y contemplar los monumentos, pero, ¿te has planteado alguna vez conocer al detalle aquellos lugares más famosos y que nadie te explica? Contacta conmigo y lo descubriremos juntos. ', 'Hola, soy un arquitecto capacitado y mi pasión es la historia de las ciudades, así como sus edificios y lugares interesantes. Podemos explorarlos juntos. ', '2021-07-21 00:16:27', '[\"ROLE_GUIDE\"]'),
(1573, 'fernandoCTG@gmail.com', '$2y$13$sFkVlrb2baUtOA0vXa9gTukmVuAO61CAQIOTlvBV1l8CN3fovF7sC', 'Fernando', 'Chamorro', '+245 123543 1546', '60f7c20c9054d.jpg', 'Cuento con siete años de experiencia en Bogotá, y otros destinos nacionales. Fui ganador del Laboratorio de Turismo Alcaldía de la Candelaria con la propuesta \"Del centro a tu Boca\" año 2018, soy también escritora y publicista. Te invito a descubrir lo mejor de Colombia, su cultura, su historia, su riqueza, sus mujeres, aquí en la hermosa Cartagena, ciudad de encanto y magia. Si te interesa la historia, inquisición-esclavitud, gastronomía, fantasmas y brujas, comunícate conmigo, garantizo tu sonrisa.', 'Hola soy Fernando, guía de Turismo profesional con especialización en Diseño de Producto Turístico del SENA', '2021-07-21 08:43:22', '[\"ROLE_GUIDE\"]'),
(1574, 'davidaCTG@gmail.com', '$2y$13$FetxHDGsyv7harSNjDd/ie1VCCno9E/NRGq/S2oR0g76PljKI7NQK', 'David Ángel', 'Gallardo', '+273 456 204 60121', '60f7c5ce733fc.jpg', 'Me encanta la historia, me gusta narrarla y vivir cada momento de la gira, es un momento para aprender sobre el pasado, los mitos y las leyendas de la ciudad. Te va a encantar mucho.', 'Soy Guía de Turismo, con Carnet Profesional # 2567 de Colombia.', '2021-07-21 08:59:24', '[\"ROLE_GUIDE\"]'),
(1575, 'vasiliSPT@gmail.com', '$2y$13$MW/2dn7mQXK9dfpLnQuOTu6.XoXG8EuOAepF5XOdOwgEd0SMPYEEq', 'Vasili', 'Beltrán', '+96 452156 215 2', '60f7c8df7628f.jpg', 'Hablo perfectamente español y ruso. Soy guía profesional en la ciudad de san Petersburgo y sus alrededores, además de ser guía soy amante de esta hermosa ciudad y me satisface poder mostrarle al turista toda la ciudad en su máxima expresión para que así como yo se vallan enamorados de ella. Haré todo lo posible para que la visita sea la mejor de lo que esperan.', 'Soy Vasili Beltrán. Tengo 25 años. Nací en la ciudad de San Petersburgo, soy mitad ruso y mitad colombiano', '2021-07-21 09:12:29', '[\"ROLE_GUIDE\"]'),
(1576, 'katerinaSPT@gmail.com', '$2y$13$ZBbeBV8GKIZ2UgYQb39y6OXtJoh1Xv9Qta.Zc9rNXloKiGPJgNES2', 'Katerina', 'Iliasova', '+47 54564 1 351 23', '60f7cb716fe9c.jpg', 'Que es entonces ¿No quieres ver el otro lado de San Petersburgo con todas esas leyendas y extraordinaria vida ordinaria? Pasé tiempo buscando las rutas de senderismo más interesantes e inusuales que muestran la ciudad tal como es. Luego, los revisé, agregué algunos puntos. Después los probé con mis amigos. Me dieron sus comentarios y corregí estas rutas. ¡Así que ahora tengo lo que tengo! ¿Quieres ampliar los límites de aprendizaje de la ciudad de San Petersburgo? ¡Únete a mi!', 'Hacer turismo puede ser interesante solo por primera vez.', '2021-07-21 09:23:27', '[\"ROLE_GUIDE\"]'),
(1577, 'gregoriosATH@gmail.com', '$2y$13$.PfwNpx0qrdGTxLj0YMnmOjFBEeOWt9DLH8Dby0AeBQYpZ4M4a.7S', 'Gregorios', 'Dimitriadis', '+63 524152 15 21 2', '60f7cdde865e6.jpg', 'Nací y crecí en Atenas, me gradué del Departamento de Educación Física y Ciencias del Deporte, Universidad de Tesalia. Me encantan los deportes, socializar, viajar por el mundo, explorar y experimentar cosas nuevas y, por supuesto, las actividades al aire libre son mi pasión.', 'Hola y bienvenidos a mi maravilloso país! Mi nombre es Gregory Dimitriadis.', '2021-07-21 09:33:48', '[\"ROLE_GUIDE\"]'),
(1578, 'panosATH@gmail.com', '$2y$13$yC7DDXnlScLsCIxP7xZZdOOXjPdi5B819Et3yN7s4WUwVSfvNjXHS', 'Panos', 'Diamantidis', '+45 15465 10301 ', '60f7d03f66e16.jpg', 'También me gusta hablar sobre mis materias favoritas, Historia, Filosofía, Política, Arte y Ciencias. Después de haber estado en más de 30 países, sé que lo que queda después de cada viaje es la belleza de los lugares y puntos de referencia que visitamos, pero también las historias sobre ellos. Los viajes serían la mitad de su valor sin aprenderlos, así que me gustaría compartir algunas historias interesantes sobre mi lugar de nacimiento. Oh, no debería olvidarlo. ¡Este tour también incluye preguntas! ¡Preguntas formuladas por los famosos griegos que obviamente has escuchado y me encantaría escuchar tus propias respuestas y hablar sobre ellas! Esperamos comenzar nuestro viaje.', 'Hola, soy Panos, he estado trabajando en la industria del turismo y, como tú, me encanta viajar.', '2021-07-21 09:43:57', '[\"ROLE_GUIDE\"]'),
(1579, 'klaudiaBUD@gmail.com', '$2y$13$5LAIcKfHE0Z7J6u4SHb0bOAlUymbfkT44Bk4VcqRZWZ7vk3Y0F2zm', 'Klaudia', 'Bartozs', '+87 211 221 1214545', '60f7d2a0ece08.jpg', 'Comencé a trabajar en turismo hace 6 años, dirijo free walking tours en español e inglés, y también tengo experiencia en tours en segway y scooter. Me gusta viajar dentro y fuera de Hungría, aprender sobre otras naciones, culturas y hablar con la gente. Por eso, cuando tenía 20 años decidí convertirme en guía turística. Budapest me gusta mucho, mis orígenes están en Budapest. Me interesa la historia del siglo XX, las casas termales, los museos, los lugares escondidos y, por supuesto, las fiestas y la vida nocturna. Siente Budapest en nuestro tour!', 'Mi nombre es Klaudia, nací en Budapest: esta hermosa ciudad es mi hogar. Soy un guía turístico con licencia profesional.', '2021-07-21 09:54:07', '[\"ROLE_GUIDE\"]'),
(1580, 'klaraPRG@gmail.com', '$2y$13$SB.rkNPo2GMxlsk9H7.Fne8qmOVdK5qWVQxS0.shyvLXjHaIVA73K', 'Klara', 'Welsch', '+5456 45 21 5 4545', '60f7d7f1d4951.jpg', 'Somos un grupo de jóvenes guías checos que aman la historia y compartiremos nuestra propia admiración por Praga contigo en nuestros tours.', 'Hola, mi nombre es Klara y soy la fundadora de Prague Extravaganza Free Tours.', '2021-07-21 10:16:48', '[\"ROLE_GUIDE\"]'),
(1581, 'raul@gmail.com', '$2y$13$Wl9TcEnONT3tLII9Imd3qO3.WCYvZTdbM/hpBtduXzyrVD3Ozgxc.', 'Raul', 'González Blanco', '652033144', NULL, '', '', '2021-07-20 23:33:09', '[\"ROLE_USER\"]'),
(1582, 'blanca@gmail.com', '$2y$13$.Y6tP9WMikwSVhYQROU3V.h9jp.I9UUNVMxuv5IJMy6Uyn0pobdE6', 'Blanca', 'Suarez', '1234546546', NULL, '', '', '2021-07-21 12:37:03', '[\"ROLE_USER\"]');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E00CEDDEA76ED395` (`user_id`),
  ADD KEY `IDX_E00CEDDE15ED8D43` (`tour_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6AD1F9692B36786B` (`title`),
  ADD KEY `IDX_6AD1F969A76ED395` (`user_id`),
  ADD KEY `IDX_6AD1F9698BAC62AF` (`city_id`);

--
-- Indices de la tabla `tour_category`
--
ALTER TABLE `tour_category`
  ADD PRIMARY KEY (`tour_id`,`category_id`),
  ADD KEY `IDX_9CB340F215ED8D43` (`tour_id`),
  ADD KEY `IDX_9CB340F212469DE2` (`category_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tour`
--
ALTER TABLE `tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1583;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_E00CEDDE15ED8D43` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`),
  ADD CONSTRAINT `FK_E00CEDDEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `FK_6AD1F9698BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `FK_6AD1F969A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `tour_category`
--
ALTER TABLE `tour_category`
  ADD CONSTRAINT `FK_9CB340F212469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9CB340F215ED8D43` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
