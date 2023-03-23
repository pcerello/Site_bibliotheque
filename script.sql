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
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Book`
--

CREATE TABLE `Book` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbr_pages` int(11) NOT NULL,
  `resume` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Editor`
--

CREATE TABLE `Editor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Reader`
--

CREATE TABLE `Reader` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `friend` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Index pour la table `Reader`
--
ALTER TABLE `Reader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Reader_email` (`email`),
  ADD KEY `friend` (`friend`);

--
-- Index pour la table `Write_`
--
ALTER TABLE `Write_`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_author` (`id_author`);

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
-- Contraintes pour la table `Reader`
--
ALTER TABLE `Reader`
  ADD CONSTRAINT `Reader_ibfk_1` FOREIGN KEY (`friend`) REFERENCES `Reader` (`id`);

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
