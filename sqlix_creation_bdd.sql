
DROP TABLE IF EXISTS province;
CREATE TABLE province  (
  num_province INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_province VARCHAR(30) NOT NULL DEFAULT '',
  nom_gouverneur VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB;
DROP TABLE IF EXISTS categorie; 
CREATE TABLE categorie  (
  code_cat CHAR (3) PRIMARY KEY NOT NULL,
  nom_categ VARCHAR(50),
  nb_points INT
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS qualite;
CREATE TABLE qualite  (
  num_qualite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lib_qualite VARCHAR(30)
) ENGINE=InnoDB;
DROP TABLE IF EXISTS village; 
CREATE TABLE village  (
  num_village INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_village VARCHAR(30) NOT NULL DEFAULT '',
  nb_huttes INT NOT NULL DEFAULT 0,
  num_province INT NOT NULL,
  CONSTRAINT FOREIGN KEY (num_province) REFERENCES province (num_province)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS resserre;
CREATE TABLE resserre (
  num_resserre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom_resserre VARCHAR(30) NOT NULL DEFAULT '',
  superficie INT NOT NULL DEFAULT 0,
  num_village INT NOT NULL,
  CONSTRAINT FOREIGN KEY (num_village) REFERENCES village (num_village)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS habitant;
CREATE TABLE habitant (
  num_hab INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(30),
  age INT,
  num_qualite INT,
  num_village INT,
  CONSTRAINT FOREIGN KEY (num_qualite) REFERENCES qualite (num_qualite),
  CONSTRAINT FOREIGN KEY (num_village) REFERENCES village (num_village)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS trophee; 
CREATE TABLE trophee  (
  num_trophee INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  date_prise DATETIME NOT NULL,
  code_cat CHAR(3),
  num_preneur INT,
  num_resserre INT,
  CONSTRAINT FOREIGN KEY (num_preneur) REFERENCES habitant (num_hab),
  CONSTRAINT FOREIGN KEY (num_resserre) REFERENCES resserre(num_resserre),
  CONSTRAINT FOREIGN KEY (code_cat) REFERENCES categorie (code_cat)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS potion;
CREATE TABLE potion (
  num_potion INT PRIMARY KEY AUTO_INCREMENT,
  lib_potion VARCHAR(40),
  formule VARCHAR(30),
  constituant_principal VARCHAR(30)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS absorber;
CREATE TABLE absorber  (
  num_potion INT NOT NULL,
  date_a DATETIME,
  num_hab INT,
  quantite INT,
  PRIMARY KEY (date_a, num_potion, num_hab),
  CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion (num_potion),
  CONSTRAINT FOREIGN KEY (num_hab) REFERENCES habitant (num_hab)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS fabriquer;
CREATE TABLE fabriquer (
    num_potion INT NOT NULL ,
    num_hab INT NOT NULL,  
    PRIMARY KEY (num_potion , num_hab),
    CONSTRAINT FOREIGN KEY (num_hab) REFERENCES habitant(num_hab),
    CONSTRAINT FOREIGN KEY (num_potion) REFERENCES potion(num_potion)
)ENGINE=INNODB; 

ALTER TABLE fabriquer ADD INDEX (num_potion);





-----------------------------------------------------------------

-- REGEX POUR POTION : ^([\d]+)\t([\w °]+)\t([\w]+)\t([\w ]+)$;

-- REGEX POUR QUALITE : ^([\d])\t([\wè ]+)$ ;

-- REGEX POUR PROVINCE : ^([\d])\t([\w]+)\t([\w]+)$ ;

-- REGEX POUR VILLAGE : ^([\d])\t([\wè ]+)\s([\d]+)\s([\d])$

-- REGEX POUR HABITANT : ^([\d]+)\s([\wèé]+)\s([\d]+)\s([\d\w]+)\s([\d]+)$ ;

-- REGEX POUR POTION : ^([\d])\t([\d]+)$ ;

-- REGEX POUR ABSORBER : ^([\d])\t([\d-]+)\s([\d:]+)\s([\d]+)\s([\d])$ ;

-- REGEX POUR RESSERRE : ^([\d])\t([\w]+)\s([\w\d])+\s([\d]+)$ ;

-- REGEX POUR CATEGORIE : ^([\w]+)\s([\wé ]+)\s([\d]+)$ ;

-- REGEX POUR TROPHEE : ^([\d]+)\t([\d-]+\s[\d:]+)\s([\w]+)\s([\d]+)\s([\d])$ ;


