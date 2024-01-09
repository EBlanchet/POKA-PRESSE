-- Création tables POKA PRESSE

-- Drop tables

DROP TABLE IF EXISTS Article CASCADE;
DROP TABLE IF EXISTS Version_maquette CASCADE;
DROP TABLE IF EXISTS Numero CASCADE;
DROP TABLE IF EXISTS Magazine CASCADE;
DROP TABLE IF EXISTS Image_article CASCADE;
DROP TABLE IF EXISTS Rubrique CASCADE;
DROP TABLE IF EXISTS Acteurs CASCADE;
DROP TABLE IF EXISTS est_possible CASCADE;
DROP TABLE IF EXISTS figure_article CASCADE;
DROP TABLE IF EXISTS figure_maquette CASCADE;
DROP TABLE IF EXISTS illustre_maquette CASCADE;
DROP TABLE IF EXISTS Image_maquette CASCADE;
DROP TABLE IF EXISTS illustre_article CASCADE;

--
--Create table Acteurs
--

CREATE TABLE Acteurs (
	matricule varchar(6) PRIMARY KEY,
	nom varchar(25),
	prenom varchar(25),
	mail varchar(50),
	statut varchar(30),
	role varchar(20),
	notoriete int
);

--
--Create table Rubrique
--

CREATE TABLE Rubrique (
	numRubrique int PRIMARY KEY,
	titre_rubrique varchar(30)
);

--
--Create table Image_article
--

CREATE TABLE Image_article (
	numImage_article varchar(3) PRIMARY KEY,
	lien_image_article varchar(100)
);

--
--Create table Image_maquette
--

CREATE TABLE Image_maquette (
	numImage_maquette varchar(3) PRIMARY KEY,
	lien_image_maquette varchar(100)
);

-- 
--Create table Magazine
--

CREATE TABLE Magazine (
	numMagazine varchar(4) PRIMARY KEY,
	date_publication date
);

-- 
--Create table Numero
--

CREATE TABLE Numero (
	code varchar(12) PRIMARY KEY,
	numMagazine varchar(4) NOT NULL REFERENCES Magazine(numMagazine),
	titre_numero varchar(100)
);

-- 
--Create table Version_maquette
--

CREATE TABLE Version_maquette (
	numVersion int PRIMARY KEY,
	date_creation date,
	lien_maquette varchar(100),
	code varchar(12) REFERENCES Numero(code)
);

-- 
--Create table Article
--

CREATE TABLE Article (
	numArticle varchar(12) PRIMARY KEY,
	titre_article varchar(100) NOT NULL,
	chapeau text,
	lien_contenu varchar(100),
	cout decimal(10, 2),
	nb_feuillets int,
	en_attente varchar(3),
	date_attente date,
	matricule_pigiste varchar(6) REFERENCES Acteurs(matricule),
	matricule_redacteur varchar(6) REFERENCES Acteurs(matricule),
	code varchar(12) REFERENCES Numero(code)
);
	
-- 
--Create table illustre_article
--

CREATE TABLE illustre_article (
	numArticle varchar(12) REFERENCES Article(numArticle),
	numImage_article varchar(3) REFERENCES Image_article(numImage_article),
	PRIMARY KEY (numArticle, numImage_article)
);

--
--Create table illustre_maquette
--

CREATE TABLE illustre_maquette(
	code varchar(12) REFERENCES Numero(code),
	numImage_maquette varchar(3) REFERENCES Image_maquette(numImage_maquette),
	PRIMARY KEY (code, numImage_maquette)
);

--
--Create table figure_article
--

CREATE TABLE figure_article(
	numArticle varchar(12) REFERENCES Article(numArticle),
	numRubrique int REFERENCES Rubrique(numRubrique),
	PRIMARY KEY (numArticle, numRubrique)
);

--
--Create table figure_maquette
--

CREATE TABLE figure_maquette(
	code varchar(12) REFERENCES Numero(code),
	numRubrique int REFERENCES Rubrique(numRubrique),
	PRIMARY KEY (code, numRubrique)
);

-- 
--Create table est_possible
--

CREATE TABLE est_possible(
	numArticle varchar(12) REFERENCES Article(numArticle),
	numRubrique int REFERENCES Rubrique(numRubrique),
	PRIMARY KEY (numArticle, numRubrique)
);

--
-- Data for Name: Acteurs
--

INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role, notoriete) VALUES ('SAPMAE', 'Sapply', 'Mael', 'sapply.mael@poka_presse.fr', 'salarie', 'pigiste', 6);
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role) VALUES ('CHANOA', 'Chastain', 'Noah', 'chastain.noah@poka_presse.fr', 'salarie', 'maquettiste');
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role) VALUES ('DALELI', 'Dalbray', 'Elie', 'dalbray.elie@poka_presse.fr', 'travailleur independant', 'maquettiste');
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role) VALUES ('BREAND', 'Breguet', 'Andrea', 'breguet.andrea@poka_presse.fr', 'travailleur independant', 'maquettiste');
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role) VALUES ('FLAALI', 'Flandin', 'Alix', 'flandin.alix@poka_presse.fr', 'salarie', 'redacteur');
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role, notoriete) VALUES ('MESSWA', 'Messier', 'Swann', 'messier.swann@poka_presse.fr', 'travailleur independant', 'pigiste', 8);
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role, notoriete) VALUES ('REVCHA', 'Reverdin', 'Charlie', 'reverdin.charlie@poka_presse.fr', 'travailleur independant', 'pigiste', 10);
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role, notoriete) VALUES ('ANDMOR', 'Ander', 'Morgan', 'ander.morgan@poka_presse.fr', 'salarie', 'pigiste', 8);
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role) VALUES ('WOHSAS', 'Wohnner', 'Sasha', 'wohnner.sasha@poka_presse.fr', 'travailleur independant', 'redacteur');
INSERT INTO Acteurs (matricule, nom, prenom, mail, statut, role, notoriete) VALUES ('BARLOI', 'Barbieri', 'Loïs', 'barbieri.lois@poka_presse.fr', 'salarie', 'pigiste', 2);

--
-- Data for Name: Rubrique
--

INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (1, 'Challenges');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (2, 'Le dossier du mois');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (3, 'L enjeu du mois');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (4, 'Portrait');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (5, 'Interview');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (6, 'Relation clients');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (7, 'Fidélisation');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (8, 'Zapping');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (9, 'Efficacité professionnelle');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (10, 'Développement personnel');
INSERT INTO Rubrique (numRubrique, titre_rubrique) VALUES (11, 'Fiches pratiques');

--
-- Data for Name: Image_article
--

INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('001', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/001.png');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('002', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/002.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('003', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/003.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('004', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/004.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('005', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/005.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('006', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/006.png');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('007', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/007.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('008', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/008.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('009', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/009.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('010', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/010.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('011', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/011.png');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('012', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/012.png');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('013', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/013.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('014', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/014.png');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('015', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/015.jpg');
INSERT INTO Image_article (numImage_article, lien_image_article) VALUES ('016', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/016.jpg');

--
-- Data for Name: Image_maquette
--

INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('201', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/201.jpg');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('202', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/202.png');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('203', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/203.png');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('204', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/204.png');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('205', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/205.png');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('206', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/206.jpg');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('207', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/207.jpg');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('208', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/208.png');
INSERT INTO Image_maquette (numImage_maquette, lien_image_maquette) VALUES ('209', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/209.jpg');

--
-- Data for Name: Magazine
--

INSERT INTO Magazine (numMagazine, date_publication) VALUES ('0610', '2020-07-01');
INSERT INTO Magazine (numMagazine, date_publication) VALUES ('0810', '2020-09-01');
INSERT INTO Magazine (numMagazine, date_publication) VALUES ('1611', '2021-07-01');
INSERT INTO Magazine (numMagazine, date_publication) VALUES ('2311', '2021-04-01');

--
-- Data for Name: Numero
--

INSERT INTO Numero (code, numMagazine, titre_numero) VALUES ('PO20LK', '0610', 'Développement personnel et professionnel : le dossier');
INSERT INTO Numero (code, numMagazine, titre_numero) VALUES ('SA02ML', '0810', 'L alchimie du marketing');
INSERT INTO Numero (code, numMagazine, titre_numero) VALUES ('AL72RA', '1611', 'Compte-rendu des meilleures techniques de vente en 2021');
INSERT INTO Numero (code, numMagazine, titre_numero) VALUES ('JO06NE', '2311', 'Fidélisation et innovation : comment attirer l attention ?');


--
-- Data for Name: Version_maquette
--

INSERT INTO Version_maquette (numVersion, date_creation, lien_maquette, code) VALUES (6008, '2020-05-02', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-0610.pdf', 'PO20LK');
INSERT INTO Version_maquette (numVersion, date_creation, lien_maquette, code) VALUES (6009, '2020-06-20', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-0810.pdf', 'SA02ML');
INSERT INTO Version_maquette (numVersion, date_creation, lien_maquette, code) VALUES (7006, '2020-03-09', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-1611.pdf', 'AL72RA');
INSERT INTO Version_maquette (numVersion, date_creation, lien_maquette, code) VALUES (7008, '2021-03-26', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-2311.pdf', 'JO06NE');

--
-- Data for Name: Article
--

-- inclure des articles publiés dans des magazines (avec au moins un magazine avec plus de 2 articles)
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-001', 'Etre un bon vendeur, qu’est_ce_que ça veut dire ? ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-001.pdf', 2, 'SAPMAE', 'WOHSAS', 'PO20LK', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-002', 'Une marque qui plaît aux clients est une marque où les salariés s’y sentent bien ! ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-002.pdf', 5, 'BARLOI', 'WOHSAS', 'PO20LK', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-003', '“Le client est roi”, comment respecter l’adage ? ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-003.pdf', 8, 'MESSWA', 'WOHSAS', 'PO20LK', 'non');

INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-004', 'SEO, Quoi, Qui, Où, Quand, Comment, Combien, Pourquoi ? ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-004.pdf', 5, 'ANDMOR', 'WOHSAS', 'SA02ML', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-005', 'Les clés du succès : utiliser les réseaux sociaux ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-005.pdf', 5, 'ANDMOR', 'WOHSAS', 'SA02ML', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-006', '10 erreurs de content marketing à éviter ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-006.pdf', 7, 'BARLOI', 'WOHSAS', 'SA02ML', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-007', 'Les fondations du marketing relationnel', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-007.pdf', 2, 'REVCHA', 'WOHSAS', 'SA02ML', 'non');

INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-008', 'La “méthode Sandler”, le cheval de bataille des commerciaux ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-008.pdf', 5, 'REVCHA', 'FLAALI', 'AL72RA', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-009', 'Savoir bien déterminer un public cible ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-009.pdf', 2, 'SAPMAE', 'FLAALI', 'AL72RA', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-010', '“Ne vendez pas la peau du prospect avant de l’avoir vu acheter” ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-010.pdf', 5, 'MESSWA', 'FLAALI', 'AL72RA', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-011', 'Le “dropshipping”, détails sur cette méthode controversée ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-011.pdf', 2, 'ANDMOR', 'FLAALI', 'AL72RA', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-012', '20 règles d’or à respecter avant de sortir un nouveau produit ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-012.pdf', 7, 'SAPMAE', 'FLAALI', 'AL72RA', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-013', 'Diversifiez votre gamme en 5 étapes ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-013.pdf', 5, 'MESSWA', 'FLAALI', 'AL72RA', 'non');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, matricule_redacteur, code, en_attente) VALUES ('Article-014', 'Posons les bases et déterminez avec nous un calendrier éditorial ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-014.pdf', 2, 'BARLOI', 'FLAALI', 'AL72RA', 'non');

-- Articles mis en maquette mais pas publiés:
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, code) VALUES ('Article-015', 'Les clés du succès : surfer sur la tendance ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-015.pdf', 2, 'ANDMOR', 'JO06NE');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, code) VALUES ('Article-016', 'Savoir subvenir aux besoins des clients avant qu’ils ne les formulent ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-016.pdf', 7, 'MESSWA', 'JO06NE');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, code) VALUES ('Article-017', 'Comment ne pas tomber dans le piège du “duplicate content” ? ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-017.pdf', 5, 'ANDMOR', 'JO06NE');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, code) VALUES ('Article-018', 'Vendre plus ou vendre mieux ? ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-018.pdf', 5, 'SAPMAE', 'JO06NE');

-- Articles sans maquette 
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente , date_attente) VALUES ('Article-019', 'Réaffirmez votre image de marque ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-019.pdf', 5, 'BARLOI','oui', '2021-03-17');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-020', 'La règle des 7 en marketing ', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-020.pdf', 4, 'SAPMAE','oui', '2021-05-11');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-021', 'Bases de langage corporel pour le vendeur averti', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-021.pdf', 2, 'SAPMAE','oui', '2021-08-11');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-022', 'Comment bien viser son public ?', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-022.pdf', 5, 'BARLOI','oui', '2021-09-10');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-023', 'Guide d’utilisation des réseaux sociaux pour l’entrepreneur motivé', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-023.pdf', 2, 'MESSWA','oui', '2021-09-26');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-024', 'Se démarquer de la concurrence en abandonnant la vente formelle', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-024.pdf', 5, 'ANDMOR','oui', '2021-10-02');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-025', 'Les avantages de la vente dématérialisée', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-025.pdf', 2, 'REVCHA','oui', '2021-11-06');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-026', 'Surfer sur la vague du marketing ultra-digital', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-026.pdf', 5, 'REVCHA','oui', '2021-12-11');
INSERT INTO Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste,  en_attente, date_attente) VALUES ('Article-027', 'Là où le vendeur n’est pas, le client s’en va', 'chapeau', 'https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-027.pdf', 2, 'ANDMOR','oui', '2021-12-18');

--
-- Data for Name: illustre_article
--

INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-002', '016');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-004', '002');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-005', '001');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-006', '004');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-007', '007');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-009', '006');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-011', '013');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-012', '005');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-012', '012');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-013', '009');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-015', '015');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-016', '003');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-016', '010');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-016', '014');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-018', '011');
INSERT INTO illustre_article (numArticle, numImage_article) VALUES ('Article-020', '008');

--
-- Data for Name: illustre_maquette
--

INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('PO20LK', '201');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('PO20LK', '202');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('SA02ML', '203');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('SA02ML', '204');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('AL72RA', '205');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('AL72RA', '206');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('JO06NE', '207');
INSERT INTO illustre_maquette (code, numImage_maquette) VALUES ('JO06NE', '208');

--
--Data for Name: est_possible
--

INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-001', 5);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-002', 9);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-003', 6);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-003', 10);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-004', 1);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-005', 2);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-006', 11);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-007', 11);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-008', 4);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-008', 8);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-009', 2);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-009', 6);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-010', 6);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-011', 8);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-012', 11);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-013', 11);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-014', 11);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-015', 2);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-016', 1);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-016', 3);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-016', 6);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-017', 5);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-018', 2);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-018', 7);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-018', 9);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-019', 1);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-019', 3);
INSERT INTO est_possible (numArticle, numRubrique) VALUES ('Article-020', 11);

--
--Data for Name: figure_article
--

INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-001', 5);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-002', 9);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-003', 10);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-004', 1);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-005', 2);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-006', 11);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-007', 11);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-008', 4);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-009', 6);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-010', 6);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-011', 8);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-012', 11);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-013', 11);
INSERT INTO figure_article (numArticle, numRubrique) VALUES ('Article-014', 11);

--
--Data for Name: figure_maquette
--

INSERT INTO figure_maquette (code, numRubrique) VALUES ('PO20LK', 5);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('PO20LK', 9);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('PO20LK', 10);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('SA02ML', 1);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('SA02ML', 2);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('SA02ML', 11);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('AL72RA', 4);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('AL72RA', 6);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('AL72RA', 8);
INSERT INTO figure_maquette (code, numRubrique) VALUES ('AL72RA', 11);

--
-- Vues
--

-- Quels sont les 3 pigistes qui ont écrit le plus d'articles ?

CREATE VIEW NbArticles AS (
    SELECT count(matricule_pigiste) AS nbArticles, matricule_pigiste
    FROM Article
    GROUP BY matricule_pigiste
    ORDER BY nbArticles DESC
);

-- Quels articles sont en attente ?

CREATE VIEW En_Attente AS (
    SELECT count(numArticle) AS nbArticles, en_attente
    FROM Article
    WHERE en_attente = 'oui'
    GROUP BY en_attente
);

-- Est-on certain que toutes les rubriques des articles figurent bien dans les numéros où sont présents ces articles ?

CREATE VIEW Rubrique_article_maquette AS (
	SELECT numArticle FROM figure_maquette, (SELECT * FROM Article NATURAL JOIN figure_article) AS 
	figure EXCEPT (SELECT numArticle FROM figure_maquette, (SELECT * FROM Article NATURAL JOIN 
	figure_article) AS figure WHERE figure.code = figure_maquette.code AND figure.numRubrique = 
	figure_maquette.numRubrique)
);


