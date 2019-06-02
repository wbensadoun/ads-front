-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 02 juin 2019 à 15:07
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ads`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `id` bigint(20) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `prix` decimal(19,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id`, `date_creation`, `date_modification`, `description`, `titre`, `type`, `categories`, `prix`) VALUES
(20, '2019-05-23 18:11:52', '2019-05-23 18:11:52', 'tata', 'toto', 0, 'voiture', '200.00'),
(21, '2019-05-23 18:12:11', '2019-05-23 18:12:11', 'titi', 'tATA', 0, 'avion', '250.00'),
(23, '2019-05-23 18:19:51', '2019-05-23 18:19:51', 'titi', 'BO', 0, 'PELUCHE', '199.00'),
(38, '2019-05-29 15:00:26', '2019-05-29 15:00:26', '          demandes', 'test9', 1, 'akgjagkjga', '3.00'),
(39, '2019-05-29 15:01:01', '2019-05-29 15:01:01', '    offre      ', 'test8', 1, 'akgjagkjga', '3.00'),
(36, '2019-05-28 18:59:51', '2019-05-28 18:59:51', '          fsgesqgesgeg', 'Premiere annonce', 1, 'akgjagkjga', '222.00'),
(37, '2019-05-28 19:00:20', '2019-05-28 19:00:20', '          fqfqfeqzf', 'Premiere annonce', 1, 'jgjgjgirhja', '112.00'),
(40, '2019-05-29 15:02:16', '2019-05-29 15:02:16', '          type offre', 'try', 1, 'akgjagkjga', '6.00');

-- --------------------------------------------------------

--
-- Structure de la table `annonce_commentaires`
--

CREATE TABLE `annonce_commentaires` (
  `annonce_id` bigint(20) NOT NULL,
  `commentaires_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `sujet` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conversations_messages`
--

CREATE TABLE `conversations_messages` (
  `conversations_id` bigint(20) NOT NULL,
  `messages_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conversations_users`
--

CREATE TABLE `conversations_users` (
  `conversations_id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(41),
(41),
(41),
(41),
(41);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `login`, `password`) VALUES
(17, 'admin@gg.com', 'admin', 'azerty'),
(18, 'riccisat@gmail.com', 'admin1', 'azerty'),
(15, 'test@gmail.com', 'test2', 'test2'),
(19, 'wissal.bensadoun@hotmail.fr', 'admin3', 'azert');

-- --------------------------------------------------------

--
-- Structure de la table `user_annonces`
--

CREATE TABLE `user_annonces` (
  `user_id` bigint(20) NOT NULL,
  `annonces_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_conversations`
--

CREATE TABLE `user_conversations` (
  `user_id` bigint(20) NOT NULL,
  `conversations_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `annonce_commentaires`
--
ALTER TABLE `annonce_commentaires`
  ADD UNIQUE KEY `UK_r56cqcg3oit184w6aang1uvfp` (`commentaires_id`),
  ADD KEY `FKmauip9gn0xeglu60j59k7yh76` (`annonce_id`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpqkeppedaih6uv790lhvv26qh` (`author_id`);

--
-- Index pour la table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `conversations_messages`
--
ALTER TABLE `conversations_messages`
  ADD UNIQUE KEY `UK_n1dubntbgo9kg381b5x9dl7fj` (`messages_id`),
  ADD KEY `FKr5fcf5qr345qpw0t4x3h0e7gm` (`conversations_id`);

--
-- Index pour la table `conversations_users`
--
ALTER TABLE `conversations_users`
  ADD UNIQUE KEY `UK_nrtfiwxurtm9sbsvugy7j6qt5` (`users_id`),
  ADD KEY `FKlgu0v2a0k5xqc66gns5784280` (`conversations_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_annonces`
--
ALTER TABLE `user_annonces`
  ADD UNIQUE KEY `UK_9hpdofnrl4ktyqf9v6ka3pcoq` (`annonces_id`),
  ADD KEY `FKcssko0dprmlbl8lxf7nl419hk` (`user_id`);

--
-- Index pour la table `user_conversations`
--
ALTER TABLE `user_conversations`
  ADD UNIQUE KEY `UK_2y8qdls2s9ufpuhhn7o9rw4r9` (`conversations_id`),
  ADD KEY `FKkhd8y4qpgq1yikgmcvebbtmub` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
