DROP TABLE IF EXISTS `absorber`;
CREATE TABLE IF NOT EXISTS `absorber` (
  `num_potion` int NOT NULL,
  `num_hab` int NOT NULL,
  `date_a` datetime NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`num_potion`,`num_hab`,`date_a`),
  KEY `num_hab` (`num_hab`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `code_cat` char(3) NOT NULL,
  `nom_categ` varchar(30) DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `nb_points` int DEFAULT NULL,
  PRIMARY KEY (`code_cat`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `fabriquer`;
CREATE TABLE IF NOT EXISTS `fabriquer` (
  `num_potion` int NOT NULL,
  `num_hab` int NOT NULL,
  PRIMARY KEY (`num_potion`,`num_hab`),
  KEY `num_habitant` (`num_hab`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `habitant`;
CREATE TABLE IF NOT EXISTS `habitant` (
  `num_hab` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `num_qualite` int DEFAULT NULL,
  `num_village` int DEFAULT NULL,
  PRIMARY KEY (`num_hab`),
  KEY `num_qualite` (`num_qualite`),
  KEY `num_village` (`num_village`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `potion`;
CREATE TABLE IF NOT EXISTS `potion` (
  `num_potion` int NOT NULL AUTO_INCREMENT,
  `lib_potion` varchar(40) DEFAULT NULL,
  `formule` varchar(30) DEFAULT NULL,
  `constituant_principal` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num_potion`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `num_province` int NOT NULL AUTO_INCREMENT,
  `nom_province` varchar(30) DEFAULT NULL,
  `nom_gouverneur` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num_province`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `qualite`;
CREATE TABLE IF NOT EXISTS `qualite` (
  `num_qualite` int NOT NULL AUTO_INCREMENT,
  `lib_qualite` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num_qualite`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `resserre`;
CREATE TABLE IF NOT EXISTS `resserre` (
  `num_resserre` int NOT NULL AUTO_INCREMENT,
  `nom_resserre` varchar(30) DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `num_village` int DEFAULT NULL,
  PRIMARY KEY (`num_resserre`),
  KEY `num_village` (`num_village`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `trophee`;
CREATE TABLE IF NOT EXISTS `trophee` (
  `num_trophee` int NOT NULL AUTO_INCREMENT,
  `date_prise` datetime DEFAULT NULL,
  `code_cat` char(3) DEFAULT NULL,
  `num_preneur` int DEFAULT NULL,
  `num_resserre` int DEFAULT NULL,
  PRIMARY KEY (`num_trophee`),
  KEY `code_cat` (`code_cat`),
  KEY `num_resserre` (`num_resserre`),
  KEY `num_preneur` (`num_preneur`)
) ENGINE=InnoDB ;
DROP TABLE IF EXISTS `village`;
CREATE TABLE IF NOT EXISTS `village` (
  `num_village` int NOT NULL AUTO_INCREMENT,
  `nom_village` varchar(30) DEFAULT NULL,
  `nb_huttes` int DEFAULT NULL,
  `num_province` int DEFAULT NULL,
  PRIMARY KEY (`num_village`),
  KEY `num_province` (`num_province`)
) ENGINE=InnoDB ;

ALTER TABLE `absorber`
  ADD CONSTRAINT `absorber_ibfk_1` FOREIGN KEY (`num_hab`) REFERENCES `habitant` (`num_hab`),
  ADD CONSTRAINT `absorber_ibfk_2` FOREIGN KEY (`num_potion`) REFERENCES `potion` (`num_potion`);

ALTER TABLE `fabriquer`
  ADD CONSTRAINT `fabriquer_ibfk_1` FOREIGN KEY (`num_hab`) REFERENCES `habitant` (`num_hab`),
  ADD CONSTRAINT `fabriquer_ibfk_2` FOREIGN KEY (`num_potion`) REFERENCES `potion` (`num_potion`);

ALTER TABLE `habitant`
  ADD CONSTRAINT `habitant_ibfk_1` FOREIGN KEY (`num_qualite`) REFERENCES `qualite` (`num_qualite`),
  ADD CONSTRAINT `habitant_ibfk_2` FOREIGN KEY (`num_village`) REFERENCES `village` (`num_village`);

ALTER TABLE `resserre`
  ADD CONSTRAINT `resserre_ibfk_1` FOREIGN KEY (`num_village`) REFERENCES `village` (`num_village`);

ALTER TABLE `trophee`
  ADD CONSTRAINT `trophee_ibfk_1` FOREIGN KEY (`code_cat`) REFERENCES `categorie` (`code_cat`),
  ADD CONSTRAINT `trophee_ibfk_2` FOREIGN KEY (`num_resserre`) REFERENCES `resserre` (`num_resserre`),
  ADD CONSTRAINT `trophee_ibfk_3` FOREIGN KEY (`num_preneur`) REFERENCES `habitant` (`num_hab`);

ALTER TABLE `village`
  ADD CONSTRAINT `village_ibfk_1` FOREIGN KEY (`num_province`) REFERENCES `province` (`num_province`);


-----------------------------------------------------------------

REGEX POUR POTION : ^([\d]+)\t([\w °]+)\t([\w]+)\t([\w ]+)$;

REGEX POUR QUALITE : ^([\d])\t([\wè ]+)$ ;

REGEX POUR PROVINCE : ^([\d])\t([\w]+)\t([\w]+)$ ;

REGEX POUR VILLAGE : ^([\d])\t([\wè ]+)\s([\w\d])+\s([\d]+)$ ;

REGEX POUR HABITANT : ^([\d]+)\s([\wèé]+)\s([\d]+)\s([\d\w]+)\s([\d]+)$ ;

REGEX POUR POTION : ^([\d])\t([\d]+)$ ;

REGEX POUR ABSORBER : ^([\d])\t([\d-]+)\s([\d:]+)\s([\d]+)\s([\d])$ ;

REGEX POUR RESSERRE : ^([\d])\t([\w]+)\s([\w\d])+\s([\d]+)$ ;

REGEX POUR CATEGORIE : ^([\w]+)\s([\wé ]+)\s([\d]+)$ ;

REGEX POUR CATEGORIE : ^([\d]+)\t([\d-]+\s[\d:]+)\s([\w]+)\s([\d]+)\s([\d])$ ;


