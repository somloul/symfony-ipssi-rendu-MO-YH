-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 04 déc. 2022 à 21:56
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `buyme`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecreation` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datemodification` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `contenu`, `datecreation`, `datemodification`) VALUES
(1, 'Quels sont les sacs de luxe les plus recherchés de l’hiver 2022?', 'Selon une étude de Statista, le marché mondial des produits de luxe devrait passer de 349,1 milliards de dollars en 2022 à 419 milliards de dollars en 2027 grâce notamment à l’intérêt des millenials et de la Gen Z.\r\n\r\nDans le climat économique incertain d', '2022-12-04 20:13:47', '2022-12-04 20:13:47'),
(2, 'Les cinq tendances homewear à ne pas manquer ', 'Décontracté mais branché, confortable mais élégant, très tendance durant le période de confinement, le homewear s’est imposé au fil des saisons et est devenu aujourd’hui un incontournable. Pour télétravailler ou pour sortir, les pièces homewear ont prouvé', '2022-12-04 20:14:39', '2022-12-04 20:14:39'),
(3, 'En images : Balmain dévoile sa campagne Fine Jewelry', 'Présentée en juillet 2022 pendant la Fashion Week Haute Couture de Paris , le nouvelle collection de joaillerie de Balmain est dévoilée à travers une campagne de promotion.\r\n\r\nConçues à Paris et fabriquées dans des ateliers de France, les pièces de haute ', '2022-12-04 20:14:39', '2022-12-04 20:14:39'),
(4, 'La mode dans les médias : avec Messi et CR7, Louis Vuitton réalise l\'un des clichés les plus « likés » d\'Instagram ', 'FashionUnited vous propose de découvrir, chaque vendredi, une revue de l’actualité mode de la semaine.\r\n\r\nLorsque Louis Vuitton réunit deux des plus grandes stars du football dans une campagne, il faut être sûr que le succès sera au rendez-vous. Surtout l', '2022-12-04 20:15:10', '2022-12-04 20:15:10'),
(5, 'L\'écosystème unique du désert d\'Atacama menacé par des tonnes de vêtements usagés', 'Iquique (Chili) - Le désert d\'Atacama, dans le nord du Chili, est le réceptacle de tonnes de vêtements usagés, mais aussi de voitures et pneumatiques en fin de vie provenant du monde entier, une menace pour son écosystème unique.\r\n\r\nDes tonnes de vêtement', '2022-12-04 20:16:11', '2022-12-04 20:16:11'),
(6, 'Portrait de la mode en Tunisie à travers la Fashion Week Tunis 2022', 'Du 10 au 12 novembre 2022, la Tunisie a donné rendez-vous à l’Europe à travers une Fashion Week qui a fait le lien entre les acteurs de la mode française, portugaise, ukrainienne, hongroise, tunisienne… et un environnement qui évoque les défilés des marqu', '2022-12-04 20:16:11', '2022-12-04 20:16:11'),
(7, 'Repérées sur les catwalks : les couleurs Pantone du printemps/été 2023', 'À chaque nouvelle saison de mode, Pantone, l\'autorité mondiale en matière de couleurs, dévoile sa gamme chromatique. La société sélectionne une palette de teintes qui transparaîtront dans les collections à venir et qui, selon elle, définissent le climat a', '2022-12-04 20:16:25', '2022-12-04 20:16:25'),
(8, 'Desigual lance sa collection de bijoux ', 'Conçue par Gala Meyer, fille du fondateur de la marque, la toute première collection de bijoux de Desigual comprend 57 bijoux en plaqué or 18 carats ou argent sterling. Des bagues, des boucles d’oreilles, des pendentifs, des colliers chokers et des bracel', '2022-12-04 20:16:35', '2022-12-04 20:16:35');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'CHAUSSEUR'),
(2, 'JEAN'),
(3, 'CHAUSSETTE'),
(4, 'SOUS-VETEMENT'),
(5, 'SHORT'),
(6, 'TEE-SHIRT'),
(7, 'SURVETEMENT'),
(8, 'SWEAT'),
(9, 'VESTE');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_user`
--

CREATE TABLE `categorie_user` (
  `categorie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_user`
--

INSERT INTO `categorie_user` (`categorie_id`, `user_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite_stock` int(11) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `couleur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `vendeur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `titre`, `prix`, `description`, `quantite_stock`, `statut`, `couleur`, `image`, `categorie_id`, `vendeur_id`) VALUES
(1, 'AIRFORCE ', 150, 'Bout de la chaussure: Rond\r\nForme du talon: Plat\r\nFermeture: Laçage\r\nFermeture: Laçage\r\nMotif / Couleur: Couleur unie\r\nInformations additionnelles: Découpes\r\nRéférence: NI114D0HT-A11', 132, 1, 'NOIR', '', 1, 3),
(2, 'ORGANIC CLASSIC - Sweat à capuche', 25, 'Col: Capuche\r\nMotif / Couleur: Imprimé\r\nInformations additionnelles: Taille élastique\r\nRéférence: T6H210006-K11', 26, 1, 'JAUNE', '', 8, 3),
(3, 'Puma Jogging Polaire Core Homme\r\n', 35, 'Matière du produit\r\nExtérieur : 66 % coton/34 % polyester. Bord-côte : 97 % coton/3 % élasthanne.\r\nCouleur:\r\nBleu', 63, 1, 'BLEU', '', 7, 3),
(4, 'Nike Storm-FIT Windrunner Long Parka Jacket', 250, 'Restez au chaud, au sec et au top du style en cas d\'intempéries avec la parka Windrunner. Nous avons intégré la technologie Storm-FIT pour une bonne protection contre les intempéries et l\'isolation PRIMALOFT® Thermoplume, pour encore plus de chaleur, de p', 99, 1, 'NOIR', '', 9, 3),
(5, 'Short de sport unicolore avec cordon à la taille\r\n', 10, 'Couleur: Noir\r\nStyle: Casual\r\nType de motif: Unicolore\r\ndétails: Cordon', 1, 0, 'NOIR', '', 5, 3),
(6, 'Tommy Jeans Homme Original Jersey T-Shirt Manches Courtes\r\n', 29, '100% Coton\r\nLavage en machine\r\nType de col: Col Ras Du Cou\r\nCoupe régulière\r\nManche courte', 1, 0, '', 'BLANC', 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`, `nom`, `prenom`) VALUES
(1, 'user@user.com', '$2y$13$WlTdhbYh4IWqF/xtySq8bOuuoRee5bg4clcYrrgz/BLduOzWY6yJO', '[\"ROLE_CLIENT\"]', 'client', 'client'),
(2, 'admin@admin.com', '$2y$13$WlTdhbYh4IWqF/xtySq8bOuuoRee5bg4clcYrrgz/BLduOzWY6yJO', '[\"ROLE_ADMIN\"]', 'admin', 'admin'),
(3, 'vendeur@vendeur.com', '$2y$13$WlTdhbYh4IWqF/xtySq8bOuuoRee5bg4clcYrrgz/BLduOzWY6yJO', '[\"ROLE_VENDEUR\"]', 'vendeur', 'vendeur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie_user`
--
ALTER TABLE `categorie_user`
  ADD PRIMARY KEY (`categorie_id`,`user_id`),
  ADD KEY `IDX_FABA511EBCF5E72D` (`categorie_id`),
  ADD KEY `IDX_FABA511EA76ED395` (`user_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_29A5EC27858C065E` (`vendeur_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie_user`
--
ALTER TABLE `categorie_user`
  ADD CONSTRAINT `FK_FABA511EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FABA511EBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27858C065E` FOREIGN KEY (`vendeur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
