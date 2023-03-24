-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : 172.16.1.2
-- Généré le : jeu. 23 mars 2023 à 12:25
-- Version du serveur :  10.3.29-MariaDB-0+deb10u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etu_bloupiac`
--

-- --------------------------------------------------------

--
-- Structure de la table `Author`
--

CREATE TABLE `Author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Book`
--

CREATE TABLE `Book` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `language` varchar(255) NOT NULL,
  `nbr_pages` int(11) NOT NULL,
  `resume` text NOT NULL,
  `year` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `editor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Borrow`
--

CREATE TABLE `Borrow` (
  `id` int(11) NOT NULL,
  `date_borrow` date NOT NULL,
  `date_return` date DEFAULT NULL CHECK (`date_borrow` < `date_return`),
  `id_book` int(11) NOT NULL,
  `id_reader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Biography & Autobiography');

-- --------------------------------------------------------

--
-- Structure de la table `Editor`
--

CREATE TABLE `Editor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Follow`
--

CREATE TABLE `Follow` (
  `id` int(11) NOT NULL,
  `id_follow` int(11) NOT NULL,
  `id_is_followed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Reader`
--

CREATE TABLE `Reader` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_Author`
--

CREATE TABLE `test_Author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Author`
--

INSERT INTO `test_Author` (`id`, `name`) VALUES
(1, 'Charles Baudelaire'),
(2, 'Jean-Luc Riva'),
(3, 'Philippe B.');

-- --------------------------------------------------------

--
-- Structure de la table `test_Book`
--

CREATE TABLE `test_Book` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `language` varchar(255) NOT NULL,
  `nbr_pages` int(11) NOT NULL,
  `resume` text NOT NULL,
  `year` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `editor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Book`
--

INSERT INTO `test_Book` (`id`, `title`, `picture`, `language`, `nbr_pages`, `resume`, `year`, `category`, `editor`) VALUES
(1, 'Edgar Poe, sa vie et ses oeuvres', 'http://books.google.com/books/content?id=8XGXEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'fr', 36, 'C\'est vers 1848 que Charles Baudelaire découvrit l\'oeuvre de Poe', 2022, 1, 1),
(2, 'GIGN : confessions d\'un OPS', NULL, 'fr', 42, 'Philippe B. n\'aurait jamais dû se trouver à la place qui fut si souvent la sienne durant ces quinze dernières années', 2010, 1, 1),
(3, 'Les fleurs du mal', 'http://books.google.com/books/content?id=HriGrgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'fr', 200, '\\\"Plonger au fond du gouffre, Enfer ou Ciel, qu\importe ? Au fond de l\inconnu, pour trouver du nouveau !\\\". Ces vers du \\\"Voyage\\\" éclairent à eux seuls l\entreprise du poète. Esprit vagabond, toujours mobile, Baudelaire explore les dédales de la conscience. Il atteint tantôt à l\extase, tantôt se perd dans les abîmes du péché. A travers ses poèmes, il nous fait partager le drame qui se joue en lui et qui n\est autre que la tragédie humaine. Baudelaire, premier poète moderne, donne à la poésie sa véritable dimension : exprimer, par-delà les mots, ce vertige absolu qui s\empare de l\âme. Tout chez lui, en lui affirme la nécessité de la souffrance, la fatalité du péché. Tout traduit en lui une âme profondément troublée mais charitable. Baudelaire fait des Fleurs du Mal un immense poème de la vie et du monde.', 2004, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `test_Borrow`
--

CREATE TABLE `test_Borrow` (
  `id` int(11) NOT NULL,
  `date_borrow` date NOT NULL,
  `date_return` date DEFAULT NULL CHECK (`date_borrow` < `date_return`),
  `id_book` int(11) NOT NULL,
  `id_reader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Borrow`
--

INSERT INTO `test_Borrow` (`id`, `date_borrow`, `date_return`, `id_book`, `id_reader`) VALUES
(1, '2023-03-24', NULL, 1, 1),
(2, '2023-03-23', '2023-03-31', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `test_Category`
--

CREATE TABLE `test_Category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Category`
--

INSERT INTO `test_Category` (`id`, `name`) VALUES
(1, 'Biography & Autobiography'),
(2, 'French poetry');

-- --------------------------------------------------------

--
-- Structure de la table `test_Editor`
--

CREATE TABLE `test_Editor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Editor`
--

INSERT INTO `test_Editor` (`id`, `name`) VALUES
(1, 'BoD - Books on Demand'),
(2, 'Editions Gallimard');

-- --------------------------------------------------------

--
-- Structure de la table `test_Follow`
--

CREATE TABLE `test_Follow` (
  `id` int(11) NOT NULL,
  `id_follow` int(11) NOT NULL,
  `id_is_followed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Follow`
--

INSERT INTO `test_Follow` (`id`, `id_follow`, `id_is_followed`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `test_Reader`
--

CREATE TABLE `test_Reader` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Reader`
--

INSERT INTO `test_Reader` (`id`, `first_name`, `last_name`, `email`, `picture`, `password`) VALUES
(1, 'maud', 'genetet', 'maud@mail.fr', NULL, '1234'),
(2, 'pauline', 'cerello', 'pauline@mail', NULL, '1234');

-- --------------------------------------------------------

--
-- Structure de la table `test_Write_`
--

CREATE TABLE `test_Write_` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_Write_`
--

INSERT INTO `test_Write_` (`id`, `id_author`, `id_book`) VALUES
(1, 1, 3),
(2, 1, 1),
(3, 2, 2),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Write_`
--

CREATE TABLE `Write_` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Author`
--
ALTER TABLE `Author`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_maTable_titlepictureyear` (`title`,`picture`,`year`),
  ADD KEY `category` (`category`),
  ADD KEY `editor` (`editor`);

--
-- Index pour la table `Borrow`
--
ALTER TABLE `Borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_reader`);

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Category_category_name` (`name`);

--
-- Index pour la table `Editor`
--
ALTER TABLE `Editor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Editor_name` (`name`);

--
-- Index pour la table `Follow`
--
ALTER TABLE `Follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Follow_id_follow_id_is_followed` (`id_follow`,`id_is_followed`),
  ADD KEY `id_follow` (`id_follow`),
  ADD KEY `id_is_followed` (`id_is_followed`);

--
-- Index pour la table `Reader`
--
ALTER TABLE `Reader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Reader_email` (`email`);

--
-- Index pour la table `test_Author`
--
ALTER TABLE `test_Author`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `test_Book`
--
ALTER TABLE `test_Book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_maTable_titlepictureyear` (`title`,`picture`,`year`),
  ADD KEY `category` (`category`),
  ADD KEY `editor` (`editor`);

--
-- Index pour la table `test_Borrow`
--
ALTER TABLE `test_Borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_reader`);

--
-- Index pour la table `test_Category`
--
ALTER TABLE `test_Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Category_category_name` (`name`);

--
-- Index pour la table `test_Editor`
--
ALTER TABLE `test_Editor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Editor_name` (`name`);

--
-- Index pour la table `test_Follow`
--
ALTER TABLE `test_Follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Follow_id_follow_id_is_followed` (`id_follow`,`id_is_followed`),
  ADD KEY `id_follow` (`id_follow`),
  ADD KEY `id_is_followed` (`id_is_followed`);

--
-- Index pour la table `test_Reader`
--
ALTER TABLE `test_Reader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Reader_email` (`email`);

--
-- Index pour la table `test_Write_`
--
ALTER TABLE `test_Write_`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Write_id_author_id_book` (`id_author`,`id_book`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_author`);

--
-- Index pour la table `Write_`
--
ALTER TABLE `Write_`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Write_id_author_id_book` (`id_author`,`id_book`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_author`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`category`) REFERENCES `Category` (`id`),
  ADD CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`editor`) REFERENCES `Editor` (`id`);

--
-- Contraintes pour la table `Borrow`
--
ALTER TABLE `Borrow`
  ADD CONSTRAINT `Borrow_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Borrow_ibfk_2` FOREIGN KEY (`id_reader`) REFERENCES `Reader` (`id`);

--
-- Contraintes pour la table `Follow`
--
ALTER TABLE `Follow`
  ADD CONSTRAINT `Follow_ibfk_1` FOREIGN KEY (`id_follow`) REFERENCES `Reader` (`id`),
  ADD CONSTRAINT `Follow_ibfk_2` FOREIGN KEY (`id_is_followed`) REFERENCES `Reader` (`id`);

--
-- Contraintes pour la table `test_Book`
--
ALTER TABLE `test_Book`
  ADD CONSTRAINT `test_Book_ibfk_1` FOREIGN KEY (`category`) REFERENCES `test_Category` (`id`),
  ADD CONSTRAINT `test_Book_ibfk_2` FOREIGN KEY (`editor`) REFERENCES `test_Editor` (`id`);

--
-- Contraintes pour la table `test_Borrow`
--
ALTER TABLE `test_Borrow`
  ADD CONSTRAINT `test_Borrow_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `test_Book` (`id`),
  ADD CONSTRAINT `test_Borrow_ibfk_2` FOREIGN KEY (`id_reader`) REFERENCES `test_Reader` (`id`);

--
-- Contraintes pour la table `test_Follow`
--
ALTER TABLE `test_Follow`
  ADD CONSTRAINT `test_Follow_ibfk_1` FOREIGN KEY (`id_follow`) REFERENCES `test_Reader` (`id`),
  ADD CONSTRAINT `test_Follow_ibfk_2` FOREIGN KEY (`id_is_followed`) REFERENCES `test_Reader` (`id`);

--
-- Contraintes pour la table `test_Write_`
--
ALTER TABLE `test_Write_`
  ADD CONSTRAINT `test_Write__ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `test_Book` (`id`),
  ADD CONSTRAINT `test_Write__ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `test_Author` (`id`);

--
-- Contraintes pour la table `Write_`
--
ALTER TABLE `Write_`
  ADD CONSTRAINT `Write__ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Write__ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `Author` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
