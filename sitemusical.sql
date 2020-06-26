-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 26 juin 2020 à 13:34
-- Version du serveur :  10.3.22-MariaDB-0+deb10u1
-- Version de PHP : 7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sitemusical`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE `album` (
  `codeAlbum` int(11) NOT NULL,
  `nomA` varchar(255) NOT NULL,
  `anneesortie` year(4) NOT NULL,
  `Pochette` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `album`
--

INSERT INTO `album` (`codeAlbum`, `nomA`, `anneesortie`, `Pochette`) VALUES
(1, 'Téléphone', 1977, ''),
(2, 'Si j\'avais un marteau', 1963, ''),
(3, 'With the Beatles', 1963, '');

-- --------------------------------------------------------

--
-- Structure de la table `chanson`
--

CREATE TABLE `chanson` (
  `codeChanson` int(11) NOT NULL,
  `piste` smallint(6) NOT NULL,
  `titreC` varchar(255) NOT NULL,
  `duree` time NOT NULL,
  `Auteur` varchar(255) NOT NULL,
  `note` smallint(6) NOT NULL,
  `numC` int(11) NOT NULL,
  `codeAlbum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chanson`
--

INSERT INTO `chanson` (`codeChanson`, `piste`, `titreC`, `duree`, `Auteur`, `note`, `numC`, `codeAlbum`) VALUES
(1, 1, 'Sur la route', '04:30:00', 'Téléphone', 3, 1, 1),
(2, 2, 'Belles ! Belles ! Belles !', '02:10:00', 'Claude François et Vline Buggy', 3, 2, 2),
(3, 3, 'It won\'t be long', '02:13:00', 'John Lennon et Paul McCartney', 3, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `chanteur`
--

CREATE TABLE `chanteur` (
  `numC` int(11) NOT NULL,
  `nomC` varchar(255) NOT NULL,
  `prenomC` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `biographie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chanteur`
--

INSERT INTO `chanteur` (`numC`, `nomC`, `prenomC`, `photo`, `biographie`) VALUES
(1, 'Bertignac', 'Louis', '', 'Louis Bertignac, né Louis Laurent Bertignac, le 23 février 1954 à Oran, est un musicien français, parolier, chanteur, guitariste et cofondateur du groupe de rock français Téléphone, avec lequel il a vendu près de six millions de disques. Il entame une carrière solo à partir de 1986. De 2015 à 2017, il forme avec Jean-Louis Aubert et Richard Kolinka le groupe Les Insus ? pour des concerts et des tournées où ils interprètent le répertoire de Téléphone, sans utiliser le nom du groupe, compte tenu de l\'absence de la bassiste Corine Marienneau. Il est connu dans sa carrière solo pour la chanson Ces idées-là.'),
(2, 'François', 'Claude', '', 'Claude François, surnommé « Cloclo », né le 1er février 1939 à Ismaïlia (Égypte) et mort accidentellement le 11 mars 1978 à Paris, est un chanteur, danseur, musicien et producteur musical français des années 1960 et 1970.\r\n\r\nLors de ses seize années de carrière, il est un des artistes français les plus appréciés du public. Nombre de ses chansons sont restées célèbres, comme Belles ! Belles ! Belles !, Cette année-là, Le Lundi au soleil, Le téléphone pleure, Magnolias for Ever, Alexandrie Alexandra ou encore Comme d\'habitude '),
(3, 'McCartney', 'Paul', '', ' Sir James Paul McCartney, né le 18 juin 1942 à Liverpool, est un auteur-compositeur-interprète et multi-instrumentiste britannique. Il commence sa carrière en tant que membre du groupe The Beatles, qui connaît un succès planétaire au cours des années 1960. Après l\'enregistrement de deux albums solo, McCartney fonde Wings, rencontrant également le succès au cours des années 1970, avant de continuer de nouveau en solo jusqu\'à nos jours. Nommé membre de l\'ordre de l\'Empire britannique dès 1964, il est anobli en 1996 par la reine Élisabeth II puis fait compagnon d\'honneur en 2017 pour services rendus aux arts. En 2010, il reçoit également les Kennedy Center Honors.');

-- --------------------------------------------------------

--
-- Structure de la table `inscrit`
--

CREATE TABLE `inscrit` (
  `login` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `nomI` varchar(255) NOT NULL,
  `prenomI` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inscrit`
--

INSERT INTO `inscrit` (`login`, `mdp`, `nomI`, `prenomI`, `Email`) VALUES
('yann', 'azerty', 'Pascucci', 'yannick', 'yannick.pascucci13@gmail.com'),
('yannick', 'azerty', 'Pascucci', 'yannick', 'yannick.pascucci13@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `codeChanson` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `note` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`codeAlbum`);

--
-- Index pour la table `chanson`
--
ALTER TABLE `chanson`
  ADD PRIMARY KEY (`codeChanson`);

--
-- Index pour la table `chanteur`
--
ALTER TABLE `chanteur`
  ADD PRIMARY KEY (`numC`);

--
-- Index pour la table `inscrit`
--
ALTER TABLE `inscrit`
  ADD PRIMARY KEY (`login`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`codeChanson`,`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `album`
--
ALTER TABLE `album`
  MODIFY `codeAlbum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `chanson`
--
ALTER TABLE `chanson`
  MODIFY `codeChanson` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `chanteur`
--
ALTER TABLE `chanteur`
  MODIFY `numC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
