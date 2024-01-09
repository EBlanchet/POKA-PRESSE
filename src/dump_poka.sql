--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 11.7 (Debian 11.7-0+deb10u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acteurs; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.acteurs (
    matricule character varying(6) NOT NULL,
    nom character varying(25),
    prenom character varying(25),
    mail character varying(50),
    statut character varying(30),
    role character varying(20),
    notoriete integer
);


ALTER TABLE public.acteurs OWNER TO "elise.blanchet";

--
-- Name: article; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.article (
    numarticle character varying(12) NOT NULL,
    titre_article character varying(100) NOT NULL,
    chapeau text,
    lien_contenu character varying(100),
    cout numeric(10,2),
    nb_feuillets integer,
    en_attente character varying(3),
    date_attente date,
    matricule_pigiste character varying(6),
    matricule_redacteur character varying(6),
    code character varying(12)
);


ALTER TABLE public.article OWNER TO "elise.blanchet";

--
-- Name: en_attente; Type: VIEW; Schema: public; Owner: elise.blanchet
--

CREATE VIEW public.en_attente AS
 SELECT count(article.numarticle) AS nbarticles,
    article.en_attente
   FROM public.article
  WHERE ((article.en_attente)::text = 'oui'::text)
  GROUP BY article.en_attente;


ALTER TABLE public.en_attente OWNER TO "elise.blanchet";

--
-- Name: est_possible; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.est_possible (
    numarticle character varying(12) NOT NULL,
    numrubrique integer NOT NULL
);


ALTER TABLE public.est_possible OWNER TO "elise.blanchet";

--
-- Name: figure_article; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.figure_article (
    numarticle character varying(12) NOT NULL,
    numrubrique integer NOT NULL
);


ALTER TABLE public.figure_article OWNER TO "elise.blanchet";

--
-- Name: figure_maquette; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.figure_maquette (
    code character varying(12) NOT NULL,
    numrubrique integer NOT NULL
);


ALTER TABLE public.figure_maquette OWNER TO "elise.blanchet";

--
-- Name: illustre_article; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.illustre_article (
    numarticle character varying(12) NOT NULL,
    numimage_article character varying(3) NOT NULL
);


ALTER TABLE public.illustre_article OWNER TO "elise.blanchet";

--
-- Name: illustre_maquette; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.illustre_maquette (
    code character varying(12) NOT NULL,
    numimage_maquette character varying(3) NOT NULL
);


ALTER TABLE public.illustre_maquette OWNER TO "elise.blanchet";

--
-- Name: image_article; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.image_article (
    numimage_article character varying(3) NOT NULL,
    lien_image_article character varying(100)
);


ALTER TABLE public.image_article OWNER TO "elise.blanchet";

--
-- Name: image_maquette; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.image_maquette (
    numimage_maquette character varying(3) NOT NULL,
    lien_image_maquette character varying(100)
);


ALTER TABLE public.image_maquette OWNER TO "elise.blanchet";

--
-- Name: magazine; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.magazine (
    nummagazine character varying(4) NOT NULL,
    date_publication date
);


ALTER TABLE public.magazine OWNER TO "elise.blanchet";

--
-- Name: nbarticles; Type: VIEW; Schema: public; Owner: elise.blanchet
--

CREATE VIEW public.nbarticles AS
 SELECT count(article.matricule_pigiste) AS nbarticles,
    article.matricule_pigiste
   FROM public.article
  GROUP BY article.matricule_pigiste
  ORDER BY (count(article.matricule_pigiste)) DESC;


ALTER TABLE public.nbarticles OWNER TO "elise.blanchet";

--
-- Name: numero; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.numero (
    code character varying(12) NOT NULL,
    nummagazine character varying(4) NOT NULL,
    titre_numero character varying(100)
);


ALTER TABLE public.numero OWNER TO "elise.blanchet";

--
-- Name: rubrique; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.rubrique (
    numrubrique integer NOT NULL,
    titre_rubrique character varying(30)
);


ALTER TABLE public.rubrique OWNER TO "elise.blanchet";

--
-- Name: rubrique_article_maquette; Type: VIEW; Schema: public; Owner: elise.blanchet
--

CREATE VIEW public.rubrique_article_maquette AS
 SELECT figure.numarticle
   FROM public.figure_maquette,
    ( SELECT article.numarticle,
            article.titre_article,
            article.chapeau,
            article.lien_contenu,
            article.cout,
            article.nb_feuillets,
            article.en_attente,
            article.date_attente,
            article.matricule_pigiste,
            article.matricule_redacteur,
            article.code,
            figure_article.numrubrique
           FROM (public.article
             JOIN public.figure_article USING (numarticle))) figure
EXCEPT
 SELECT figure.numarticle
   FROM public.figure_maquette,
    ( SELECT article.numarticle,
            article.titre_article,
            article.chapeau,
            article.lien_contenu,
            article.cout,
            article.nb_feuillets,
            article.en_attente,
            article.date_attente,
            article.matricule_pigiste,
            article.matricule_redacteur,
            article.code,
            figure_article.numrubrique
           FROM (public.article
             JOIN public.figure_article USING (numarticle))) figure
  WHERE (((figure.code)::text = (figure_maquette.code)::text) AND (figure.numrubrique = figure_maquette.numrubrique));


ALTER TABLE public.rubrique_article_maquette OWNER TO "elise.blanchet";

--
-- Name: version_maquette; Type: TABLE; Schema: public; Owner: elise.blanchet
--

CREATE TABLE public.version_maquette (
    numversion integer NOT NULL,
    date_creation date,
    lien_maquette character varying(100),
    code character varying(12)
);


ALTER TABLE public.version_maquette OWNER TO "elise.blanchet";

--
-- Data for Name: acteurs; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.acteurs (matricule, nom, prenom, mail, statut, role, notoriete) FROM stdin;
SAPMAE	Sapply	Mael	sapply.mael@poka_presse.fr	salarie	pigiste	6
CHANOA	Chastain	Noah	chastain.noah@poka_presse.fr	salarie	maquettiste	\N
DALELI	Dalbray	Elie	dalbray.elie@poka_presse.fr	travailleur independant	maquettiste	\N
BREAND	Breguet	Andrea	breguet.andrea@poka_presse.fr	travailleur independant	maquettiste	\N
FLAALI	Flandin	Alix	flandin.alix@poka_presse.fr	salarie	redacteur	\N
MESSWA	Messier	Swann	messier.swann@poka_presse.fr	travailleur independant	pigiste	8
REVCHA	Reverdin	Charlie	reverdin.charlie@poka_presse.fr	travailleur independant	pigiste	10
ANDMOR	Ander	Morgan	ander.morgan@poka_presse.fr	salarie	pigiste	8
WOHSAS	Wohnner	Sasha	wohnner.sasha@poka_presse.fr	travailleur independant	redacteur	\N
BARLOI	Barbieri	Loïs	barbieri.lois@poka_presse.fr	salarie	pigiste	2
\.


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.article (numarticle, titre_article, chapeau, lien_contenu, cout, nb_feuillets, en_attente, date_attente, matricule_pigiste, matricule_redacteur, code) FROM stdin;
Article-001	Etre un bon vendeur, qu’est_ce_que ça veut dire ? 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-001.pdf	\N	2	non	\N	SAPMAE	WOHSAS	PO20LK
Article-002	Une marque qui plaît aux clients est une marque où les salariés s’y sentent bien ! 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-002.pdf	\N	5	non	\N	BARLOI	WOHSAS	PO20LK
Article-003	“Le client est roi”, comment respecter l’adage ? 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-003.pdf	\N	8	non	\N	MESSWA	WOHSAS	PO20LK
Article-004	SEO, Quoi, Qui, Où, Quand, Comment, Combien, Pourquoi ? 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-004.pdf	\N	5	non	\N	ANDMOR	WOHSAS	SA02ML
Article-005	Les clés du succès : utiliser les réseaux sociaux 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-005.pdf	\N	5	non	\N	ANDMOR	WOHSAS	SA02ML
Article-006	10 erreurs de content marketing à éviter 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-006.pdf	\N	7	non	\N	BARLOI	WOHSAS	SA02ML
Article-007	Les fondations du marketing relationnel	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-007.pdf	\N	2	non	\N	REVCHA	WOHSAS	SA02ML
Article-008	La “méthode Sandler”, le cheval de bataille des commerciaux 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-008.pdf	\N	5	non	\N	REVCHA	FLAALI	AL72RA
Article-009	Savoir bien déterminer un public cible 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-009.pdf	\N	2	non	\N	SAPMAE	FLAALI	AL72RA
Article-010	“Ne vendez pas la peau du prospect avant de l’avoir vu acheter” 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-010.pdf	\N	5	non	\N	MESSWA	FLAALI	AL72RA
Article-011	Le “dropshipping”, détails sur cette méthode controversée 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-011.pdf	\N	2	non	\N	ANDMOR	FLAALI	AL72RA
Article-012	20 règles d’or à respecter avant de sortir un nouveau produit 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-012.pdf	\N	7	non	\N	SAPMAE	FLAALI	AL72RA
Article-013	Diversifiez votre gamme en 5 étapes 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-013.pdf	\N	5	non	\N	MESSWA	FLAALI	AL72RA
Article-014	Posons les bases et déterminez avec nous un calendrier éditorial 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-014.pdf	\N	2	non	\N	BARLOI	FLAALI	AL72RA
Article-015	Les clés du succès : surfer sur la tendance 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-015.pdf	\N	2	\N	\N	ANDMOR	\N	JO06NE
Article-016	Savoir subvenir aux besoins des clients avant qu’ils ne les formulent 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-016.pdf	\N	7	\N	\N	MESSWA	\N	JO06NE
Article-017	Comment ne pas tomber dans le piège du “duplicate content” ? 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-017.pdf	\N	5	\N	\N	ANDMOR	\N	JO06NE
Article-018	Vendre plus ou vendre mieux ? 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-018.pdf	\N	5	\N	\N	SAPMAE	\N	JO06NE
Article-019	Réaffirmez votre image de marque 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-019.pdf	\N	5	oui	2021-03-17	BARLOI	\N	\N
Article-020	La règle des 7 en marketing 	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-020.pdf	\N	4	oui	2021-05-11	SAPMAE	\N	\N
Article-021	Bases de langage corporel pour le vendeur averti	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-021.pdf	\N	2	oui	2021-08-11	SAPMAE	\N	\N
Article-022	Comment bien viser son public ?	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-022.pdf	\N	5	oui	2021-09-10	BARLOI	\N	\N
Article-023	Guide d’utilisation des réseaux sociaux pour l’entrepreneur motivé	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-023.pdf	\N	2	oui	2021-09-26	MESSWA	\N	\N
Article-024	Se démarquer de la concurrence en abandonnant la vente formelle	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-024.pdf	\N	5	oui	2021-10-02	ANDMOR	\N	\N
Article-025	Les avantages de la vente dématérialisée	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-025.pdf	\N	2	oui	2021-11-06	REVCHA	\N	\N
Article-026	Surfer sur la vague du marketing ultra-digital	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-026.pdf	\N	5	oui	2021-12-11	REVCHA	\N	\N
Article-027	Là où le vendeur n’est pas, le client s’en va	chapeau	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/articles/Article-027.pdf	\N	2	oui	2021-12-18	ANDMOR	\N	\N
\.


--
-- Data for Name: est_possible; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.est_possible (numarticle, numrubrique) FROM stdin;
Article-001	5
Article-002	9
Article-003	6
Article-003	10
Article-004	1
Article-005	2
Article-006	11
Article-007	11
Article-008	4
Article-008	8
Article-009	2
Article-009	6
Article-010	6
Article-011	8
Article-012	11
Article-013	11
Article-014	11
Article-015	2
Article-016	1
Article-016	3
Article-016	6
Article-017	5
Article-018	2
Article-018	7
Article-018	9
Article-019	1
Article-019	3
Article-020	11
\.


--
-- Data for Name: figure_article; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.figure_article (numarticle, numrubrique) FROM stdin;
Article-001	5
Article-002	9
Article-003	10
Article-004	1
Article-005	2
Article-006	11
Article-007	11
Article-008	4
Article-009	6
Article-010	6
Article-011	8
Article-012	11
Article-013	11
Article-014	11
\.


--
-- Data for Name: figure_maquette; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.figure_maquette (code, numrubrique) FROM stdin;
PO20LK	5
PO20LK	9
PO20LK	10
SA02ML	1
SA02ML	2
SA02ML	11
AL72RA	4
AL72RA	6
AL72RA	8
AL72RA	11
\.


--
-- Data for Name: illustre_article; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.illustre_article (numarticle, numimage_article) FROM stdin;
Article-002	016
Article-004	002
Article-005	001
Article-006	004
Article-007	007
Article-009	006
Article-011	013
Article-012	005
Article-012	012
Article-013	009
Article-015	015
Article-016	003
Article-016	010
Article-016	014
Article-018	011
Article-020	008
\.


--
-- Data for Name: illustre_maquette; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.illustre_maquette (code, numimage_maquette) FROM stdin;
PO20LK	201
PO20LK	202
SA02ML	203
SA02ML	204
AL72RA	205
AL72RA	206
JO06NE	207
JO06NE	208
\.


--
-- Data for Name: image_article; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.image_article (numimage_article, lien_image_article) FROM stdin;
001	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/001.png
002	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/002.jpg
003	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/003.jpg
004	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/004.jpg
005	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/005.jpg
006	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/006.png
007	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/007.jpg
008	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/008.jpg
009	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/009.jpg
010	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/010.jpg
011	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/011.png
012	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/012.png
013	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/013.jpg
014	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/014.png
015	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/015.jpg
016	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/016.jpg
\.


--
-- Data for Name: image_maquette; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.image_maquette (numimage_maquette, lien_image_maquette) FROM stdin;
201	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/201.jpg
202	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/202.png
203	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/203.png
204	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/204.png
205	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/205.png
206	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/206.jpg
207	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/207.jpg
208	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/208.png
209	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/img/209.jpg
\.


--
-- Data for Name: magazine; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.magazine (nummagazine, date_publication) FROM stdin;
0610	2020-07-01
0810	2020-09-01
1611	2021-07-01
2311	2021-04-01
\.


--
-- Data for Name: numero; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.numero (code, nummagazine, titre_numero) FROM stdin;
PO20LK	0610	Développement personnel et professionnel : le dossier
SA02ML	0810	L alchimie du marketing
AL72RA	1611	Compte-rendu des meilleures techniques de vente en 2021
JO06NE	2311	Fidélisation et innovation : comment attirer l attention ?
\.


--
-- Data for Name: rubrique; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.rubrique (numrubrique, titre_rubrique) FROM stdin;
1	Challenges
2	Le dossier du mois
3	L enjeu du mois
4	Portrait
5	Interview
6	Relation clients
7	Fidélisation
8	Zapping
9	Efficacité professionnelle
10	Développement personnel
11	Fiches pratiques
\.


--
-- Data for Name: version_maquette; Type: TABLE DATA; Schema: public; Owner: elise.blanchet
--

COPY public.version_maquette (numversion, date_creation, lien_maquette, code) FROM stdin;
6008	2020-05-02	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-0610.pdf	PO20LK
6009	2020-06-20	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-0810.pdf	SA02ML
7006	2020-03-09	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-1611.pdf	AL72RA
7008	2021-03-26	https://raw.githubusercontent.com/EBlanchet/POKA-PRESSE/main/magazines/Magazine-2311.pdf	JO06NE
\.


--
-- Name: acteurs acteurs_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.acteurs
    ADD CONSTRAINT acteurs_pkey PRIMARY KEY (matricule);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (numarticle);


--
-- Name: est_possible est_possible_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.est_possible
    ADD CONSTRAINT est_possible_pkey PRIMARY KEY (numarticle, numrubrique);


--
-- Name: figure_article figure_article_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.figure_article
    ADD CONSTRAINT figure_article_pkey PRIMARY KEY (numarticle, numrubrique);


--
-- Name: figure_maquette figure_maquette_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.figure_maquette
    ADD CONSTRAINT figure_maquette_pkey PRIMARY KEY (code, numrubrique);


--
-- Name: illustre_article illustre_article_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.illustre_article
    ADD CONSTRAINT illustre_article_pkey PRIMARY KEY (numarticle, numimage_article);


--
-- Name: illustre_maquette illustre_maquette_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.illustre_maquette
    ADD CONSTRAINT illustre_maquette_pkey PRIMARY KEY (code, numimage_maquette);


--
-- Name: image_article image_article_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.image_article
    ADD CONSTRAINT image_article_pkey PRIMARY KEY (numimage_article);


--
-- Name: image_maquette image_maquette_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.image_maquette
    ADD CONSTRAINT image_maquette_pkey PRIMARY KEY (numimage_maquette);


--
-- Name: magazine magazine_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.magazine
    ADD CONSTRAINT magazine_pkey PRIMARY KEY (nummagazine);


--
-- Name: numero numero_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.numero
    ADD CONSTRAINT numero_pkey PRIMARY KEY (code);


--
-- Name: rubrique rubrique_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.rubrique
    ADD CONSTRAINT rubrique_pkey PRIMARY KEY (numrubrique);


--
-- Name: version_maquette version_maquette_pkey; Type: CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.version_maquette
    ADD CONSTRAINT version_maquette_pkey PRIMARY KEY (numversion);


--
-- Name: article article_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_code_fkey FOREIGN KEY (code) REFERENCES public.numero(code);


--
-- Name: article article_matricule_pigiste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_matricule_pigiste_fkey FOREIGN KEY (matricule_pigiste) REFERENCES public.acteurs(matricule);


--
-- Name: article article_matricule_redacteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_matricule_redacteur_fkey FOREIGN KEY (matricule_redacteur) REFERENCES public.acteurs(matricule);


--
-- Name: est_possible est_possible_numarticle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.est_possible
    ADD CONSTRAINT est_possible_numarticle_fkey FOREIGN KEY (numarticle) REFERENCES public.article(numarticle);


--
-- Name: est_possible est_possible_numrubrique_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.est_possible
    ADD CONSTRAINT est_possible_numrubrique_fkey FOREIGN KEY (numrubrique) REFERENCES public.rubrique(numrubrique);


--
-- Name: figure_article figure_article_numarticle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.figure_article
    ADD CONSTRAINT figure_article_numarticle_fkey FOREIGN KEY (numarticle) REFERENCES public.article(numarticle);


--
-- Name: figure_article figure_article_numrubrique_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.figure_article
    ADD CONSTRAINT figure_article_numrubrique_fkey FOREIGN KEY (numrubrique) REFERENCES public.rubrique(numrubrique);


--
-- Name: figure_maquette figure_maquette_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.figure_maquette
    ADD CONSTRAINT figure_maquette_code_fkey FOREIGN KEY (code) REFERENCES public.numero(code);


--
-- Name: figure_maquette figure_maquette_numrubrique_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.figure_maquette
    ADD CONSTRAINT figure_maquette_numrubrique_fkey FOREIGN KEY (numrubrique) REFERENCES public.rubrique(numrubrique);


--
-- Name: illustre_article illustre_article_numarticle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.illustre_article
    ADD CONSTRAINT illustre_article_numarticle_fkey FOREIGN KEY (numarticle) REFERENCES public.article(numarticle);


--
-- Name: illustre_article illustre_article_numimage_article_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.illustre_article
    ADD CONSTRAINT illustre_article_numimage_article_fkey FOREIGN KEY (numimage_article) REFERENCES public.image_article(numimage_article);


--
-- Name: illustre_maquette illustre_maquette_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.illustre_maquette
    ADD CONSTRAINT illustre_maquette_code_fkey FOREIGN KEY (code) REFERENCES public.numero(code);


--
-- Name: illustre_maquette illustre_maquette_numimage_maquette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.illustre_maquette
    ADD CONSTRAINT illustre_maquette_numimage_maquette_fkey FOREIGN KEY (numimage_maquette) REFERENCES public.image_maquette(numimage_maquette);


--
-- Name: numero numero_nummagazine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.numero
    ADD CONSTRAINT numero_nummagazine_fkey FOREIGN KEY (nummagazine) REFERENCES public.magazine(nummagazine);


--
-- Name: version_maquette version_maquette_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: elise.blanchet
--

ALTER TABLE ONLY public.version_maquette
    ADD CONSTRAINT version_maquette_code_fkey FOREIGN KEY (code) REFERENCES public.numero(code);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

