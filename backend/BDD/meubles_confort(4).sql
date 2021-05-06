-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 06 mai 2021 à 16:27
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `meubles_confort`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(50) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `titre_systeme` varchar(50) NOT NULL,
  `ImageCategorie` varchar(50) NOT NULL,
  `Description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`, `titre_systeme`, `ImageCategorie`, `Description`) VALUES
(1, 'Chambre', 'Chambre', 'Chambre.jpg', 'Découvrez nos meubles de chambre (lits, matelas, tables de chevet, etc.) et déco chambre. '),
(2, 'Salon', 'Salon', 'Salon.jpg', 'Découvrez nos meubles de salon pas chers, un large choix en promotion, différents modèles et coloris disponibles dès maintenant'),
(3, 'Bureau', 'Bureau', 'Bureau.jpg', 'Découvrez nos bureaux adultes et bureaux enfant. Un grand choix de modèles tendance. '),
(4, 'Salle à manger', 'Salle_a_manger', 'Salle_a_manger.jpg', 'Le plus grand choix en ligne de salle à manger pas chère, moderne, contemporaine, design ou classique au meilleur rapport qualité/prix.'),
(5, 'Mobilier de jardin', 'Mobilier_jardin', 'Mobilier_jardin.jpg', 'Salon et mobilier de jardin - Marques, Stock & Livraison rapide'),
(6, 'Jardin', 'Jardin', 'Jardin.jpg', 'Les meilleurs articles et accessoires pour le Jardin ou la serre'),
(7, 'Balcon', 'Balcon', 'Balcon.jpg', 'Aménager et décorer un balcon'),
(8, 'Entree', 'Entree', 'Entree.jpg', ' Idées d\'aménagement pour votre hall d\'entrée.'),
(9, 'Exterieur', 'Exterieur', 'Exterieur.jpg', 'Découvrez notre sélection de décorations de jardin et d\'extérieur'),
(10, 'Cuisine', 'Cuisine', 'Cuisine.jpg', 'Un large choix de cuisines modernes, à monter soi-même où créées sur mesure');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `titre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id`, `idProduit`, `titre`) VALUES
(9, 1, 'Matelas latex'),
(10, 5, 'Table basse random'),
(11, 5, 'Table basse random'),
(12, 5, 'Table basse random'),
(13, 5, 'Table basse random'),
(14, 6, 'Bureau d\'angle');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `poids` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `largeur` int(50) NOT NULL,
  `longueure` int(50) NOT NULL,
  `hauteur` int(50) NOT NULL,
  `id_sous_categorie` int(50) NOT NULL,
  `matiere` varchar(50) NOT NULL,
  `design` varchar(50) NOT NULL,
  `mode_livraison` varchar(50) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `sous_titre` varchar(50) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `quantite` int(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `tva` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `titre`, `poids`, `prix`, `largeur`, `longueure`, `hauteur`, `id_sous_categorie`, `matiere`, `design`, `mode_livraison`, `reference`, `sous_titre`, `couleur`, `quantite`, `image`, `tva`) VALUES
(1, 'Matelas latex', 25, 1500, 120, 180, 80, 3, 'latex', 'carre', 'non', 'hteugzgt6489419', 'matelas latex', 'blanc', 1, 'matelas-bultex-max.jpg', 20),
(3, 'Matelas à ressort', 24, 1555, 120, 180, 80, 3, 'coton', 'carre', 'oui', 'gezyugyrf987', 'matelas à ressort', 'beige', 1, 'matelas-bultex-max.jpg', 20),
(4, 'Matelas mousse', 26, 1755, 120, 180, 80, 3, 'mousse', 'carre', 'non', 'rfghueriheruigegreegt78', 'matelas mousse', 'blanc', 1, 'matelas-bultex-max.jpg', 20),
(5, 'Table basse random', 15, 1500, 120, 180, 80, 11, 'bois', 'carre', 'non', 'gfbguizegfez77', 'table teck', 'marron', 1, 'Table_basse.jpg', 20),
(6, 'Bureau d\'angle', 45, 546, 120, 80, 90, 12, 'bois', 'rectangle', 'oui', 'zrngiozdvhzioz789', 'bureau d\'angle, anguleux', 'marron', 1, 'Bureau_angle.jpg', 20);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int(50) NOT NULL,
  `id_categorie` int(50) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `titreSysteme` varchar(50) NOT NULL,
  `imageSousCategorie` varchar(50) NOT NULL,
  `Description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `id_categorie`, `titre`, `titreSysteme`, `imageSousCategorie`, `Description`) VALUES
(1, 1, 'Lit', 'Lit', 'Lit.jpg', 'Votre Lit au meilleur rapport qualité/prix c\'est ici '),
(2, 1, 'Têtes de lit', 'Tete_de_lit', 'Tete_de_lit.jpg', 'Votre Tête de lit au meilleur rapport qualité/prix c\'est ici !'),
(3, 1, 'Matelas', 'Matelas', 'Matelas.jpg', 'Matelas mousse, à ressort ou latex, découvrez un large choix de matelas parmi les plus grandes marques'),
(4, 1, 'Sommier', 'Sommier', 'Sommier.jpg', 'Découvrez nos sommiers et cadres pas chers'),
(5, 1, 'Armoire', 'Armoire', 'Armoire.jpg', 'Divers coloris de portes vous permettent d\'associer très facilement votre nouvelle armoire à votre décoration de chambre'),
(6, 1, 'Dressing', 'Dressing', 'Dressing.jpg', 'Votre Dressing au meilleur rapport qualité/prix c\'est ici !'),
(7, 1, 'Commode', 'Commode', 'Commode.jpg', 'Découvrez notre vaste gamme de commodes et chiffonnier:'),
(8, 1, 'Chiffonier', 'Chiffonier', 'Chiffonier.jpg', 'Découvrez notre vaste gamme de commodes et chiffonnier:'),
(9, 1, 'Coiffeuse', 'Coiffeuse', 'Coiffeuse.jpg', 'Découvrez nos offres Coiffeuse'),
(10, 1, 'Table de chevet', 'Table_de_chevet', 'Table_de_chevet.jpg', 'Découvrez nos tables de chevet design : avec ou sans tiroirs, en bois ou en métal'),
(11, 2, 'Table basse', 'Table_basse', 'Table_basse.jpg', ''),
(12, 3, 'Bureaux et secrétaires', 'Bureaux', 'Bureaux.jpg', ''),
(13, 4, 'Table', 'Table', 'Table.jpg', ''),
(14, 5, 'Canapé de jardin', 'Canape_jardin', 'Canape_jardin.jpg', ''),
(15, 6, 'Jardin', 'Jardin', 'Jardin.jpg', ''),
(16, 7, 'Balcon', 'Balcon', 'Balcon.jpg', ''),
(17, 8, 'Entree', 'Entree', 'Entree.jpg', ''),
(18, 9, 'Exterieur', 'Exterieur', 'Exterieur.jpg', ''),
(19, 10, 'Cuisine', 'Cuisine', 'Cuisine.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `cp` int(5) NOT NULL,
  `rue` varchar(150) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `pays` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `cp`, `rue`, `ville`, `pays`) VALUES
(1, 'azzaz', 'aaa', 456, 'az', 'aza', 0),
(2, 'ssssss', 'sssss', 321, 'sss', 'sss', 0),
(3, 'ssssss', 'sssss', 321, 'sss', 'sss', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `Foreign_key_sous_categorie` (`id_sous_categorie`) USING BTREE;

--
-- Index pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Foreign_key_categorie` (`id_categorie`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `uniq_constraint_id_sous_categorie_id` FOREIGN KEY (`id_sous_categorie`) REFERENCES `sous_categorie` (`id`);

--
-- Contraintes pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD CONSTRAINT `uniq_constraint_id_categorie_id` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
