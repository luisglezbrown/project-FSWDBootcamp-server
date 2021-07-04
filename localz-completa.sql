-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2021 a las 22:35:24
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
  `user_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `pax` smallint(6) NOT NULL,
  `status` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'París', 'card-1.png', 30),
(2, 'New York', 'card-2.png', 30),
(3, 'Barcelona', 'card-3.png', 30),
(4, 'Estambul', 'card-4.png', 30),
(5, 'Londres', 'card-5.png', 30),
(6, 'Rio de Janeiro', 'card-6.png', 15),
(7, 'Abu Dhabi', 'card-7.png', 7),
(8, 'Viena', 'card-8.png', 8),
(9, 'Roma', 'card-9.png', 9),
(10, 'Atenas', 'card-10.png', 10),
(11, 'Praga', 'card-11.png', 11),
(12, 'Budapest', 'card-12.png', 12),
(13, 'San Petersburgo', 'card-13.png', 30),
(14, 'San Francisco', 'card-14.png', 30),
(15, 'Cartagena de Indias', 'card-15.png', 30),
(16, 'Tokio', 'card-16.png', 30);

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
  `categories` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)',
  `highlight` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_time` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_point` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tour`
--

INSERT INTO `tour` (`id`, `user_id`, `city_id`, `title`, `duration`, `week_days`, `categories`, `highlight`, `starting_time`, `meeting_point`, `description`, `imgpath`, `ranking`) VALUES
(1, 32, 2, 'Las Maravillas de la Gran Manzana', 2.5, '1,7', 'alternativo,historia', 'No te pierdas lo imprescindible de la ciudad que nunca duerme con la española más bella', '10:00', 'En la puerta del Madison Square Garden, junto a la tienda de los NY Knicks.', '    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Harum rem esse voluptates deserunt labore tenetur molestiae, mollitia consequatur ullam ut repudiandae minus quae doloremque illo maiores quos iure commodi vel?\r\n    Hic aliquid placeat, vel nemo eaque assumenda ad cumque exercitationem non excepturi incidunt accusantium a tempora dolor sit saepe voluptate asperiores unde voluptates sapiente commodi natus dolores! Soluta, ipsam accusamus.\r\n    Pariatur at asperiores qui et debitis illo sequi veritatis. Aliquid quam modi tempora reprehenderit, fuga porro vel. Sapiente aliquid aspernatur distinctio alias qui porro nostrum reprehenderit, molestias illum autem! Accusamus?\r\n    Repellat qui illum beatae aut ea, quo expedita dolor doloremque enim ipsum eius, consequatur soluta maiores ut quasi ullam sit incidunt recusandae reprehenderit at cum adipisci molestiae? Quia, laboriosam pariatur!\r\n    Consequatur provident voluptatem iusto cum. Quasi magnam eveniet tempore cumque esse porro sed, accusamus repellendus suscipit? Blanditiis ut expedita sapiente a autem quos minus voluptatum quae, iusto aperiam ducimus voluptatibus.\r\n    Accusamus explicabo cupiditate exercitationem. Voluptates obcaecati consequatur similique tempora, totam fuga minima perferendis rem, at iusto accusamus voluptatum deleniti quasi optio adipisci quos a dolores repellat enim officiis! Dolorum, possimus?\r\n    Distinctio qui sed ducimus praesentium illum ex temporibus in repellendus cum blanditiis quis ea non, sapiente iure aspernatur fugiat accusantium! Earum numquam ad sunt consectetur, error dolorem nesciunt ipsa recusandae.\r\n    Quo, officiis dolore alias sequi eaque quos quasi a labore voluptas, hic similique laudantium illum expedita ipsam voluptatum, fugit ex aut quaerat tempora optio suscipit? Minima repudiandae non nesciunt ad!\r\n    Vitae, officia voluptate aspernatur consectetur perspiciatis eius non mollitia voluptatibus, accusantium repudiandae blanditiis beatae vero pariatur suscipit quod nulla aut, tempora reiciendis porro facere! Magni quis ipsam ipsa impedit molestias.\r\n    Repudiandae ad ducimus et, inventore perspiciatis dolorem explicabo, repellendus velit fugiat fuga hic! Laborum itaque doloribus nobis perspiciatis esse fuga nesciunt a enim cumque vel dolore iusto, sed cum quasi.\r\n    Impedit possimus molestias iure nisi reprehenderit, id perferendis facere magni veniam pariatur eum fuga dolorum officia vitae! Ducimus nostrum dicta repellendus velit, optio praesentium ipsa eum! Natus nihil repudiandae quam?\r\n    Vel, cumque! Harum dolorem nemo quibusdam similique beatae provident aliquam, dolor numquam tempora! Reiciendis cum officia velit quo dignissimos, quibusdam temporibus ea incidunt laboriosam, accusantium, saepe earum vitae enim pariatur.\r\n    Deserunt doloremque consequuntur reprehenderit, quas eligendi assumenda rerum sapiente nesciunt molestias dolore recusandae illum maiores debitis necessitatibus commodi tenetur adipisci sequi quod, quis similique quibusdam consequatur. Corporis ipsum deserunt dolores!\r\n    Nam obcaecati fuga officia odio fugiat? Aspernatur non in explicabo exercitationem rem tempora earum unde similique id, doloribus quisquam odio voluptatibus, quae laudantium eaque accusamus. Ullam accusantium fugit commodi laboriosam.\r\n    Voluptatibus accusantium culpa similique natus fugiat soluta nesciunt ratione. Ipsa repellat, ad praesentium perspiciatis expedita minus suscipit architecto laborum maxime, est nihil impedit earum asperiores voluptatibus et, repellendus accusamus placeat.\r\n    Rem ipsam ullam at impedit fugiat saepe vel consequuntur, aperiam non ab corporis assumenda vero molestiae, tenetur quaerat minima magni odio ea sit debitis ratione id distinctio! Sequi, autem corporis?\r\n    Sed, corporis sapiente, omnis consectetur fugit doloribus pariatur dolores commodi inventore provident cupiditate fugiat minima, similique velit necessitatibus. Molestias ullam aut eveniet harum quae numquam voluptates maiores consectetur ea? Vero!\r\n    Consectetur, aperiam iste est enim magni magnam culpa pariatur quidem velit et, architecto nam atque, praesentium ex reiciendis repellat molestiae dicta doloremque? Doloremque quod perferendis optio nulla consequuntur accusamus facere!\r\n    Explicabo molestiae dolores dolorem totam minus enim optio voluptatum natus incidunt necessitatibus repudiandae fugit exercitationem repellat, aliquam architecto aspernatur quod suscipit a! Sed excepturi debitis hic cumque beatae minus quae?\r\n    Expedita architecto rem at soluta laboriosam voluptatibus inventore quisquam perferendis labore amet aliquam enim molestiae vero tenetur illo, suscipit adipisci asperiores corrupti esse maiores et laudantium? Voluptates nesciunt maiores expedita.\r\n    Eius ullam maiores consequuntur vel, voluptatem eaque facere nisi non praesentium blanditiis magni laborum, dignissimos commodi accusantium exercitationem, excepturi accusamus facilis quibusdam quod ab cumque placeat! Impedit minima laboriosam beatae.\r\n    Qui possimus dicta obcaecati sunt nihil repudiandae adipisci, rem ad quibusdam? Laudantium ducimus adipisci sed doloremque corrupti qui facere, fuga optio architecto voluptate ipsa! Explicabo corporis fugit sit enim minima?\r\n    Facere dolore deleniti atque, expedita aspernatur mollitia sunt voluptas, blanditiis quis veniam placeat id nam, voluptates vero nulla omnis tenetur. Sint non nisi beatae. Possimus blanditiis necessitatibus consequuntur tempora iste.\r\n    Voluptate, consequuntur sed provident necessitatibus dolorum velit reprehenderit nobis vitae. Delectus ex expedita ea assumenda natus odio labore dicta vel impedit blanditiis aspernatur error commodi tenetur, obcaecati tempora est. Rerum.\r\n    Tempore dolorem repellat nulla saepe vero, eligendi ipsa quidem cumque incidunt, rerum, adipisci obcaecati doloribus porro molestiae sequi. Asperiores tenetur laboriosam aliquam sequi obcaecati id repudiandae officiis? Quam, suscipit repellendus!\r\n    Voluptate aperiam tempore nesciunt itaque consequuntur quibusdam exercitationem explicabo, nisi autem culpa mollitia esse harum. Repellendus eveniet nostrum quis quas suscipit nisi eligendi odio perferendis nesciunt ipsa? Tenetur, dicta ex.\r\n    Obcaecati aliquam saepe tempora porro deserunt, voluptate impedit ipsam, optio beatae sint enim? Itaque eveniet deleniti dolor voluptatum exercitationem recusandae dignissimos perspiciatis amet? Cumque vitae commodi illum, a repudiandae aliquam.\r\n    Sapiente beatae natus fuga eveniet nisi dolorum veritatis voluptatem aliquam non quas laudantium deleniti eos rem ex, incidunt voluptatibus asperiores deserunt placeat dignissimos explicabo doloribus sunt harum rerum blanditiis. Esse.\r\n    Fugit, perferendis aliquid! Deserunt quos neque nemo facere modi voluptate ea facilis quae nobis ratione non recusandae rerum ullam, aperiam ab necessitatibus repellat quasi amet vel ad magni molestiae ipsam?\r\n    Modi animi doloremque vel molestias hic velit qui ad autem repellendus maiores eum expedita unde et deserunt, doloribus nam illum suscipit tempora omnis. Commodi aut rerum reprehenderit perspiciatis nam illo!\r\n    Repudiandae libero consequatur officia, ad ex quidem, incidunt accusantium quod expedita quae autem quas sunt voluptatum sequi architecto molestias exercitationem ab corporis! Nihil quidem cum fugit reiciendis necessitatibus nostrum hic.\r\n    Rem quaerat reiciendis consequuntur maiores sapiente quam et. Non mollitia perspiciatis, vitae assumenda ipsum eos excepturi, molestias nam natus quasi voluptatibus nulla optio blanditiis minus qui veritatis ducimus dolor id.\r\n', '2132415646512156465.png', 1000),
(3, 1503, 15, 'Paseando por Cartagena', 3, '1,2,3,4,5', 'Panorámico', 'Un paseo inolvidable por Cartagena.', '15:30', 'Torre del Reloj, junto a la tienda de souvenirs', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, illum. Aspernatur similique molestiae quos earum suscipit nostrum consequatur, voluptatibus iure delectus laboriosam tempore vel illum dolores ut neque error maxime facilis cum. Provident quaerat impedit porro. Delectus at distinctio recusandae veritatis dolorem consectetur quas eius, perferendis labore exercitationem itaque doloribus officia odit nostrum, sed nihil. Vero aut quas facere labore laborum esse inventore dolore architecto molestiae. Harum vitae totam ut consectetur ea corrupti doloribus vero! Rem reprehenderit minima optio amet reiciendis. Corporis sint minus ipsum numquam, enim saepe quaerat porro libero adipisci reprehenderit vitae inventore, corrupti quae sapiente deserunt aut!', 'IMG_0172.jpg', 1500),
(4, 1503, 15, 'Día de playa en Islas del Rosario', 6, '1,2,3,4,5,6,7', 'Playa', 'Disfruta del placer en las Islas Corales del Rosario.', '09:30', 'Parque de la independencia, en el kiosco de helados.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, illum. Aspernatur similique molestiae quos earum suscipit nostrum consequatur, voluptatibus iure delectus laboriosam tempore vel illum dolores ut neque error maxime facilis cum. Provident quaerat impedit porro. Delectus at distinctio recusandae veritatis dolorem consectetur quas eius, perferendis labore exercitationem itaque doloribus officia odit nostrum, sed nihil. Vero aut quas facere labore laborum esse inventore dolore architecto molestiae. Harum vitae totam ut consectetur ea corrupti doloribus vero! Rem reprehenderit minima optio amet reiciendis. Corporis sint minus ipsum numquam, enim saepe quaerat porro libero adipisci reprehenderit vitae inventore, corrupti quae sapiente deserunt aut!', 'IMG_2354.jpg', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `since` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`, `lastname`, `phone`, `role`, `imgpath`, `description`, `short_desc`, `since`) VALUES
(31, 'Luis@gmail.com', '123456', 'Luis', 'González', '652038036', 'user', NULL, 'test', 'test', '2021-07-04 20:27:53'),
(32, 'Loli@gmail.com', '123456', 'Loli', 'Martín', '666555444', 'user', NULL, 'test', 'test', '2021-12-03 20:28:01'),
(33, 'Antonio@gmail.com', '123456', 'Antonio', 'Muñoz', '666555444', 'user', NULL, 'test', 'test', '2021-07-04 20:28:04'),
(1501, 'saravargas@gmail.com', '1234', 'Sara', 'Vargas', '+54 12348674564', 'guide', 'guide3.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam eos ratione vero recusandae doloribus esse aut necessitatibus, asperiores ipsam iure unde nihil sapiente aliquid? Soluta, a. Rerum id architecto laboriosam.\r\nOfficia voluptate saepe repellat ullam labore velit eum pariatur quaerat quis! Eos sed modi officia eveniet blanditiis qui veritatis vero odio, inventore aspernatur dignissimos quia quaerat ad consectetur nesciunt recusandae!\r\nOdit dicta doloribus aliquid provident voluptates in vero? Officia, optio aspernatur esse quia saepe ipsam perferendis, quaerat recusandae blanditiis, architecto reprehenderit ipsum rem dolor aut nobis accusamus fugiat beatae non?\r\nExplicabo quos odit quas harum minima architecto laboriosam tempora temporibus cum necessitatibus eius quod iste accusamus eligendi, repellat, rerum, expedita iure esse nihil id facilis aut. Illum assumenda omnis natus?\r\nPerferendis ab necessitatibus, reiciendis libero quod repudiandae, dicta officia aperiam quibusdam ipsum fuga similique! Quidem facilis debitis, pariatur qui molestiae sequi reprehenderit similique officia eaque. Expedita excepturi fuga hic similique.\r\nPlaceat voluptatibus sed repellendus voluptates rem cum labore quam illo, cumque hic! Unde velit maxime aspernatur incidunt! In nam fugiat tempora. Possimus error accusantium, sequi illum distinctio rem pariatur tenetur!\r\nSunt dolorem exercitationem culpa minima soluta, deleniti commodi laborum ratione cum. Tempora vitae sequi odio et mollitia doloremque incidunt placeat doloribus facilis. Doloremque blanditiis eos rerum sit accusamus nam incidunt!\r\nTempore maxime cumque quasi, quae repellendus nemo voluptatem nulla est error eveniet. Eius enim quo esse sed aliquid harum nesciunt amet ipsa vel qui aut maxime sint dolor, nulla aperiam.', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quae dolor voluptas molestiae expedita minus aliquam molestias vel, accusantium cumque nisi!', '2021-09-01 20:27:10'),
(1502, 'claudiarojas@gmail.com', '1234', 'Claudia', 'Rojas', '+54 123456789', 'guide', 'guide2.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam eos ratione vero recusandae doloribus esse aut necessitatibus, asperiores ipsam iure unde nihil sapiente aliquid? Soluta, a. Rerum id architecto laboriosam.\r\nOfficia voluptate saepe repellat ullam labore velit eum pariatur quaerat quis! Eos sed modi officia eveniet blanditiis qui veritatis vero odio, inventore aspernatur dignissimos quia quaerat ad consectetur nesciunt recusandae!\r\nOdit dicta doloribus aliquid provident voluptates in vero? Officia, optio aspernatur esse quia saepe ipsam perferendis, quaerat recusandae blanditiis, architecto reprehenderit ipsum rem dolor aut nobis accusamus fugiat beatae non?\r\nExplicabo quos odit quas harum minima architecto laboriosam tempora temporibus cum necessitatibus eius quod iste accusamus eligendi, repellat, rerum, expedita iure esse nihil id facilis aut. Illum assumenda omnis natus?\r\nPerferendis ab necessitatibus, reiciendis libero quod repudiandae, dicta officia aperiam quibusdam ipsum fuga similique! Quidem facilis debitis, pariatur qui molestiae sequi reprehenderit similique officia eaque. Expedita excepturi fuga hic similique.\r\nPlaceat voluptatibus sed repellendus voluptates rem cum labore quam illo, cumque hic! Unde velit maxime aspernatur incidunt! In nam fugiat tempora. Possimus error accusantium, sequi illum distinctio rem pariatur tenetur!\r\nSunt dolorem exercitationem culpa minima soluta, deleniti commodi laborum ratione cum. Tempora vitae sequi odio et mollitia doloremque incidunt placeat doloribus facilis. Doloremque blanditiis eos rerum sit accusamus nam incidunt!\r\nTempore maxime cumque quasi, quae repellendus nemo voluptatem nulla est error eveniet. Eius enim quo esse sed aliquid harum nesciunt amet ipsa vel qui aut maxime sint dolor, nulla aperiam.', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dicta eligendi fugit officiis aliquam ea animi cum ipsa veniam dolor numquam.', '2021-09-01 20:27:10'),
(1503, 'alfonsomejias@gmail.com', '1234', 'Alfonso', 'Mejías', '+52123456789', 'guide', 'guide1503.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam eos ratione vero recusandae doloribus esse aut necessitatibus, asperiores ipsam iure unde nihil sapiente aliquid? Soluta, a. Rerum id architecto laboriosam.\r\nOfficia voluptate saepe repellat ullam labore velit eum pariatur quaerat quis! Eos sed modi officia eveniet blanditiis qui veritatis vero odio, inventore aspernatur dignissimos quia quaerat ad consectetur nesciunt recusandae!\r\nOdit dicta doloribus aliquid provident voluptates in vero? Officia, optio aspernatur esse quia saepe ipsam perferendis, quaerat recusandae blanditiis, architecto reprehenderit ipsum rem dolor aut nobis accusamus fugiat beatae non?\r\nExplicabo quos odit quas harum minima architecto laboriosam tempora temporibus cum necessitatibus eius quod iste accusamus eligendi, repellat, rerum, expedita iure esse nihil id facilis aut. Illum assumenda omnis natus?\r\nPerferendis ab necessitatibus, reiciendis libero quod repudiandae, dicta officia aperiam quibusdam ipsum fuga similique! Quidem facilis debitis, pariatur qui molestiae sequi reprehenderit similique officia eaque. Expedita excepturi fuga hic similique.\r\nPlaceat voluptatibus sed repellendus voluptates rem cum labore quam illo, cumque hic! Unde velit maxime aspernatur incidunt! In nam fugiat tempora. Possimus error accusantium, sequi illum distinctio rem pariatur tenetur!\r\nSunt dolorem exercitationem culpa minima soluta, deleniti commodi laborum ratione cum. Tempora vitae sequi odio et mollitia doloremque incidunt placeat doloribus facilis. Doloremque blanditiis eos rerum sit accusamus nam incidunt!\r\nTempore maxime cumque quasi, quae repellendus nemo voluptatem nulla est error eveniet. Eius enim quo esse sed aliquid harum nesciunt amet ipsa vel qui aut maxime sint dolor, nulla aperiam.\r\n', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam animi quos corrupti eaque odit id officia magni possimus repudiandae dignissimos!', '2021-09-01 20:27:10'),
(1504, 'felipecoro@gmail.com', '1234', 'Felipe', 'Coronado', '+49 12345678', 'guide', 'guide4.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam eos ratione vero recusandae doloribus esse aut necessitatibus, asperiores ipsam iure unde nihil sapiente aliquid? Soluta, a. Rerum id architecto laboriosam.\r\nOfficia voluptate saepe repellat ullam labore velit eum pariatur quaerat quis! Eos sed modi officia eveniet blanditiis qui veritatis vero odio, inventore aspernatur dignissimos quia quaerat ad consectetur nesciunt recusandae!\r\nOdit dicta doloribus aliquid provident voluptates in vero? Officia, optio aspernatur esse quia saepe ipsam perferendis, quaerat recusandae blanditiis, architecto reprehenderit ipsum rem dolor aut nobis accusamus fugiat beatae non?\r\nExplicabo quos odit quas harum minima architecto laboriosam tempora temporibus cum necessitatibus eius quod iste accusamus eligendi, repellat, rerum, expedita iure esse nihil id facilis aut. Illum assumenda omnis natus?\r\nPerferendis ab necessitatibus, reiciendis libero quod repudiandae, dicta officia aperiam quibusdam ipsum fuga similique! Quidem facilis debitis, pariatur qui molestiae sequi reprehenderit similique officia eaque. Expedita excepturi fuga hic similique.\r\nPlaceat voluptatibus sed repellendus voluptates rem cum labore quam illo, cumque hic! Unde velit maxime aspernatur incidunt! In nam fugiat tempora. Possimus error accusantium, sequi illum distinctio rem pariatur tenetur!\r\nSunt dolorem exercitationem culpa minima soluta, deleniti commodi laborum ratione cum. Tempora vitae sequi odio et mollitia doloremque incidunt placeat doloribus facilis. Doloremque blanditiis eos rerum sit accusamus nam incidunt!\r\nTempore maxime cumque quasi, quae repellendus nemo voluptatem nulla est error eveniet. Eius enim quo esse sed aliquid harum nesciunt amet ipsa vel qui aut maxime sint dolor, nulla aperiam.', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quas quis dolores cum animi tempore pariatur ducimus sequi labore perferendis delectus?', '2021-09-01 20:27:10');

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
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6AD1F9692B36786B` (`title`),
  ADD KEY `IDX_6AD1F969A76ED395` (`user_id`),
  ADD KEY `IDX_6AD1F9698BAC62AF` (`city_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tour`
--
ALTER TABLE `tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1505;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
