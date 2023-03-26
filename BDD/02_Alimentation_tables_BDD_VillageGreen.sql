-- ------------------------------------------------------------------------------------------------------------------
-- ALIMENTATION BASE ------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------

-- ALIMENTATION TABLE FOURNISSEUR ----------------------------------------------------------------------------------

INSERT INTO `Fournisseur` (`fournisseur_id`, `fournisseur_nom`, `fournisseur_adresse`, `fournisseur_ville`, `fournisseur_cp`, 
`fournisseur_mail`, `fournisseur_tel`) 
VALUES
  (1,"Thane Joseph","Ap #660-1348 Vitae Rd.","Pavone del Mella","39686","thanejoseph7028@google.com","02 85 11 18 80"),
  (2,"Noah Hughes","Ap #268-8766 Enim. St.","Hạ Long","32425","noahhughes8689@protonmail.com","06 25 47 69 57"),
  (3,"Melvin Owen","Ap #666-5122 Fringilla Avenue","Morro d'Alba","87129","melvinowen5540@protonmail.com","06 56 47 14 26"),
  (4,"Megan Boone","P.O. Box 457, 7398 Arcu Ave","Bicinicco","72652","meganboone3923@aol.com","06 33 45 55 78"),
  (5,"Rooney Mooney","Ap #574-7839 Ac Av.","Kimberley","63713","rooneymooney@outlook.com","08 86 35 61 86"),
  (6,"Ria Richardson","2810 Tortor Rd.","Sangju","86833","riarichardson@google.com","03 16 84 24 04"),
  (7,"Garrett Hill","Ap #863-9120 Dis Rd.","Galway","67457","garretthill1283@protonmail.com","07 59 37 15 09"),
  (8,"Gwendolyn Hodge","114-3600 Id Av.","Ijebu Ode","93151","gwendolynhodge@outlook.com","04 96 14 94 95"),
  (9,"Shelley O'donnell","225-9046 Malesuada Road","Cork","66745","shelleyodonnell9192@protonmail.com","06 91 80 24 72"),
  (10,"Bryar Nichols","154-5974 At Rd.","Itanagar","98320","bryarnichols@protonmail.com","06 16 31 12 83");

  -- ALIMENTATION TABLE COMMANDE ----------------------------------------------------------------------------------------------

INSERT INTO `Commande` (`commande_id`,`commande_observation`,`commande_date`,`commande_datePaiement`,`commande_facture`,`commande_infoPaiement`,`commande_documents`,`commande_reduction`)
VALUES
  (1,"Nullam feugiat placerat velit.","2023-1-9 00:00:00","2023-1-22 00:00:00","0","magna. Cras convallis convallis dolor.","odio. Nam",14.58),
  (2,"ac mattis velit justo","2023-1-17 00:00:00","2023-2-18 00:00:00","0","dui. Cras pellentesque. Sed","pede et risus.",16.64),
  (3,"Lorem ipsum dolor sit","2023-1-22 00:00:00","2023-1-22 00:00:00","1","lorem vitae odio sagittis semper.","interdum. Nunc sollicitudin",14.29),
  (4,"dolor sit amet, consectetuer adipiscing","2023-2-5 00:00:00","2023-2-20 00:00:00","0","arcu. Vestibulum ante ipsum","cubilia Curae Phasellus",22.99),
  (5,"placerat, orci lacus vestibulum lorem,","2023-1-12 00:00:00","2023-2-11 00:00:00","0","Maecenas ornare egestas ligula. Nullam","nec orci.",13.12),
  (6,"Sed eu eros.","2023-1-14 00:00:00","2023-3-6 00:00:00","0","quis turpis","tristique neque venenatis lacus.",12.89),
  (7,"accumsan convallis, ante","2023-2-15 00:00:00","2023-2-15 00:00:00","1","iaculis enim, sit amet ornare","In nec orci. Donec nibh.",11.97),
  (8,"quam. Pellentesque","2023-2-3 00:00:00","2023-1-13 00:00:00","1","0n, lacinia at, iaculis","ut, nulla. Cras eu",13.21),
  (9,"at, velit. Pellentesque ultricies dignissim","2023-2-3 00:00:00","2023-2-3 00:00:00","0","lobortis quam a","nec quam. Curabitur",16.88),
  (10,"libero est, congue","2023-1-19 00:00:00","2023-2-13 00:00:00","1","Aenean sed pede","lorem, auctor quis, tristique",17.76);

  -- ALIMENTATION TABLE SERVICE ----------------------------------------------------------------------------------

INSERT INTO `Service` (`service_id`, `service_nom`) 
VALUES
  (1,"Sales and Marketing"),
  (2,"Media Relations"),
  (3,"Legal Department"),
  (4,"Media Relations"),
  (5,"Quality Assurance"),
  (6,"Customer Relations"),
  (7,"Asset Management"),
  (8,"Advertising"),
  (9,"Tech Support"),
  (10,"Research and Development");

-- ALIMENTATION TABLE STATUT ----------------------------------------------------------------------------------------------

INSERT INTO `Statut` (`statut_id`,`statut_nom`)
VALUES
  (1,"Particulier"),
  (2,"Professionnel");

-- ALIMENTATION TABLE CATEGORIE ----------------------------------------------------------------------------------------------

INSERT INTO `Categorie` (`categorie_id`,`categorie_nom`)
VALUES
  (1,"sandwiches"),
  (2,"soups"),
  (3,"noodles"),
  (4,"pasta"),
  (5,"pies"),
  (6,"cereals"),
  (7,"salads");
  
-- ALIMENTATION TABLE SOUS-CATEGORIE ----------------------------------------------------------------------------------------------

INSERT INTO `SousCategorie` (`sousCategorie_id`,`sousCategorie_nom`,`categorie_id`)
VALUES
  (1,"red",1),
  (2,"orange",1),
  (3,"yellow",1),
  (4,"green",3),
  (5,"blue",3),
  (6,"indigo",5),
  (7,"violet",7);

-- ALIMENTATION TABLE PRODUIT ----------------------------------------------------------------------------------------------

INSERT INTO `Produit` (`produit_id`,`produit_referenceFournisseur`,`produit_description`,`produit_libelle`,`produit_prixAchat`,
`produit_prixVente`,`produit_stock`,`produit_stockAlerte`,`produit_photo`,`sousCategorie_id`,`fournisseur_id`)
VALUES
  (1,"29294969-3","quis, tristique ac, eleifend vitae, erat. Vivamus nisi.","iaculis aliquet","10.46","15.21",964,100,"picture_1",1,1),
  (2,"49643873-6","gravida mauris ut mi. Duis risus odio, auctor","quam","12.97","13.74",431,100,"picture_2",2,2),
  (3,"26298484-2","id, mollis nec,","dapibus quam","14.54","17.02",550,100,"picture_3",3,3),
  (4,"41106774-2","amet luctus vulputate, nisi sem semper erat,","enim.","7.46","14.94",218,100,"picture_4",4,4),
  (5,"24134222-0","lacinia orci, consectetuer euismod est arcu ac","eget, venenatis a,","11.15","15.23",964,100,"picture_5",5,5),
  (6,"2019511-8","fringilla cursus","sem. Nulla","10.61","17.11",464,100,"picture_6",6,6),
  (7,"1685794-7","sed turpis nec mauris blandit mattis. Cras","consectetuer, cursus","6.86","15.42",645,100,"picture_7",7,7),
  (8,"14491650-6","Vestibulum ante ipsum primis in faucibus orci luctus","eleifend","9.33","16.11",523,100,"picture_8",1,8),
  (9,"41153732-3","ipsum nunc id enim. Curabitur massa. Vestibulum accumsan","id, blandit at,","12.36","15.09",700,100,"picture_9",2,9),
  (10,"27817776-9","vulputate eu, odio.","magna,","4.95","11.94",736,100,"picture_10",3,10);

-- ALIMENTATION TABLE PERSONNEL ----------------------------------------------------------------------------------------------

INSERT INTO `Personnel` (`personnel_id`,`personnel_nom`,`personnel_prenom`,`personnel_dateNaissance`,`service_id`)
VALUES
  (1,"Ellison","Tamara","1965-8-15",3),
  (2,"Acosta","Akeem","1984-3-13",2),
  (3,"Mooney","Slade","1975-6-3",8),
  (4,"Reyes","Dara","1998-11-9",4),
  (5,"Mayo","Lionel","1968-6-14",1),
  (6,"Burton","Britanni","1984-12-28",6),
  (7,"Todd","Ocean","1978-4-4",2),
  (8,"Bradford","Jacqueline","1968-5-10",5),
  (9,"Barlow","Harding","1979-10-7",8),
  (10,"Simpson","Reese","1998-7-7",9);

-- ALIMENTATION TABLE CLIENT ----------------------------------------------------------------------------------------------

INSERT INTO `Client` (`client_id`,`client_nom`,`client_prenom`,`client_dateNaissance`,`client_livraisonAdresse`,`client_livraisonVille`,
`client_livraisonCp`,`client_facturationAdresse`,`client_facturationVille`,`client_facturationCp`,`client_mail`,`client_tel`,`client_mdp`,`client_coef`,
`personnel_id`,`statut_id`)
VALUES
  (1,"Castro","Shana","1961-5-14","Ap #408-442 Consectetuer Road","Asigliano Veneto","67481","Ap #408-442 Consectetuer Road","Asigliano Veneto","67481","shanacastro7777@yahoo.com","01 38 33 92 64","HTV33AOX3GJ","0.746",2,1),
  (2,"Adkins","Bell","1994-4-22","Ap #753-4153 Ultrices. Rd.","Tanjay","84794","Ap #753-4153 Ultrices. Rd.","Tanjay","84794","bell-adkins8977@protonmail.com","06 44 14 48 41","OLO42WKV3ET","0.824",5,2),
  (3,"Cross","Gage","1989-6-6","5086 Sed Ave","Hilversum","52169","5086 Sed Ave","Hilversum","52169","crossgage8864@aol.com","08 77 46 99 63","EVR64FYH6ON","0.963",10,1),
  (4,"Thomas","Isaiah","1973-9-30","Ap #951-182 Nunc Rd.","Marabá","48864","Ap #951-182 Nunc Rd.","Marabá","48864","isaiah.thomas8141@aol.com","08 52 23 26 74","GSH52BXB7NN","1.039",5,1),
  (5,"Bernard","Elijah","1956-8-17","740-952 Nunc Ave","Curridabat","16870","740-952 Nunc Ave","Curridabat","16870","b-elijah@protonmail.com","06 53 14 44 95","JCQ61CVD4UQ","1.201",4,2),
  (6,"Garza","Xanthus","2005-1-14","P.O. Box 359, 549 Dolor St.","Sioux City","42686","P.O. Box 359, 549 Dolor St.","Sioux City","42686","x.garza@protonmail.com","08 86 50 20 54","KXQ00CKI4CP","0.902",2,1),
  (7,"Foley","Serina","1967-1-3","Ap #862-892 Dui. Ave","Daman","89177","Ap #862-892 Dui. Ave","Daman","89177","f_serina@outlook.com","07 82 32 41 13","KZI20HST3FF","0.914",4,1),
  (8,"Barr","Harrison","1973-5-3","Ap #863-406 Tincidunt, Rd.","Alice","43885","Ap #863-406 Tincidunt, Rd.","Alice","43885","b_harrison8779@aol.com","02 73 61 40 15","SEU78DRF5FM","1.356",7,2),
  (9,"Chambers","Kyra","1966-9-23","Ap #639-9002 Etiam Street","Iguala","82218","Ap #639-9002 Etiam Street","Iguala","82218","kchambers@protonmail.com","03 54 53 26 87","GMK20TMW4CI","0.856",8,1),
  (10,"Brown","Doris","1956-5-29","Ap #281-2421 Habitant St.","Itajaí","58963","Ap #281-2421 Habitant St.","Itajaí","58963","doris.brown1760@outlook.com","04 22 84 67 16","FGA73LBJ8HY","1.593",2,2);

-- ALIMENTATION TABLE LIVRAISON ----------------------------------------------------------------------------------------------

INSERT INTO `Livraison` (`livraison_NbColis`,`livraison_dateExpedition`,`livraison_dateLivraison`,`livraison_bonLivraison`,`client_id`, `commande_id`)
VALUES
  (1,"2023-1-3","2023-1-6","1",1,1),
  (2,"2023-1-3","2023-1-6","1",1,1),

  (1,"2023-1-12","2023-1-15","1",2,2),
  (2,"2023-1-24","2023-1-27","0",3,3),
  (3,"2023-1-31","2023-2-3","0",4,4),
  (2,"2023-2-5","2023-2-8","0",5,5),
  (3,"2023-2-15","2023-2-18","1",6,6),
  (2,"2023-2-16","2023-2-19","0",7,7),
  (2,"2023-2-25","2023-2-28","0",8,8),
  (3,"2023-3-2","2023-3-5","1",9,9),
  (3,"2023-3-24","2023-3-27","0",10,10);

  -- ALIMENTATION TABLE LIGNE_COMMANDE ----------------------------------------------------------------------------------------------

INSERT INTO `Ligne_Commande` (`produit_id`,`commande_id`,`ligneCommande_quantite`)
VALUES
  (1,1,3),
  (2,1,3),
  (3,1,3),

  (2,2,3),
  (3,3,3),
  (4,4,3),
  (5,5,3),
  (6,6,3),
  (7,7,3),
  (8,8,3),
  (9,9,3),
  (10,10,3);

-- ALIMENTATION TABLE LIGNE_LIVRAISON ----------------------------------------------------------------------------------------------

INSERT INTO `Ligne_Livraison` (`produit_id`,`livraison_id`,`quantite_livree`)
VALUES
  (1,1,1),
  (2,1,3),
  (3,2,1),
  
  (2,3,1),
  (3,4,2),
  (4,5,3),
  (5,6,1),
  (6,7,2),
  (7,8,2),
  (8,9,2),
  (9,10,3),
  (10,11,3);


