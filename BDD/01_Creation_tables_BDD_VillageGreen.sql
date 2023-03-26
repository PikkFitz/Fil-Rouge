DROP DATABASE IF EXISTS BDD_VillageGreen;

CREATE DATABASE BDD_VillageGreen;

USE BDD_VillageGreen;

-- TABLE FOURNISSEUR ----------------------------------------------------------------------------------------------

CREATE TABLE Fournisseur(
   fournisseur_id INT AUTO_INCREMENT,
   fournisseur_nom VARCHAR(255)  NOT NULL,
   fournisseur_adresse VARCHAR(255)  NOT NULL,
   fournisseur_ville VARCHAR(255)  NOT NULL,
   fournisseur_cp VARCHAR(255)  NOT NULL,
   fournisseur_mail VARCHAR(255)  NOT NULL,
   fournisseur_tel VARCHAR(255) ,
   PRIMARY KEY(fournisseur_id)
);


-- TABLE COMMANDE ----------------------------------------------------------------------------------------------

CREATE TABLE Commande(
   commande_id INT AUTO_INCREMENT,
   commande_observation VARCHAR(255) ,
   commande_date DATETIME NOT NULL DEFAULT current_timestamp(),
   commande_datePaiement DATETIME NOT NULL,
   commande_facture BOOLEAN DEFAULT 0,
   commande_infoPaiement VARCHAR(255)  NOT NULL,
   commande_documents TEXT NOT NULL,
   commande_reduction DECIMAL(15,2)   NOT NULL DEFAULT 0,
   PRIMARY KEY(commande_id)
);


-- TABLE SERVICE ----------------------------------------------------------------------------------------------

CREATE TABLE Service(
   service_id INT AUTO_INCREMENT,
   service_nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(service_id)
);


-- TABLE STATUT ----------------------------------------------------------------------------------------------

CREATE TABLE Statut(
   statut_id INT AUTO_INCREMENT,
   statut_nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(statut_id)
);


-- TABLE CATEGORIE ----------------------------------------------------------------------------------------------

CREATE TABLE Categorie(
   categorie_id INT AUTO_INCREMENT,
   categorie_nom VARCHAR(255)  NOT NULL,
   PRIMARY KEY(categorie_id)
);

-- TABLE SOUS-CATEGORIE ----------------------------------------------------------------------------------------------

CREATE TABLE SousCategorie(
   sousCategorie_id INT AUTO_INCREMENT,
   sousCategorie_nom VARCHAR(255)  NOT NULL,
   categorie_id INT NOT NULL,
   PRIMARY KEY(sousCategorie_id),
   FOREIGN KEY(categorie_id) REFERENCES Categorie(categorie_id)
);

-- TABLE PRODUIT ----------------------------------------------------------------------------------------------

CREATE TABLE Produit(
   produit_id INT AUTO_INCREMENT,
   produit_referenceFournisseur VARCHAR(255)  NOT NULL,
   produit_libelle VARCHAR(255)  NOT NULL,
   produit_description TEXT,
   produit_prixAchat DECIMAL(15,2)   NOT NULL,
   produit_prixVente DECIMAL(15,2)   NOT NULL,
   produit_stock INT NOT NULL,
   produit_stockAlerte INT NOT NULL,
   produit_photo VARCHAR(255)  NOT NULL,
   sousCategorie_id INT NOT NULL,
   fournisseur_id INT NOT NULL,
   PRIMARY KEY(produit_id),
   FOREIGN KEY(sousCategorie_id) REFERENCES SousCategorie(sousCategorie_id),
   FOREIGN KEY(fournisseur_id) REFERENCES Fournisseur(fournisseur_id)
);

-- TABLE PERSONNEL ----------------------------------------------------------------------------------------------

CREATE TABLE Personnel(
   personnel_id INT AUTO_INCREMENT,
   personnel_nom VARCHAR(255)  NOT NULL,
   personnel_prenom VARCHAR(255)  NOT NULL,
   personnel_dateNaissance DATE NOT NULL,
   service_id INT NOT NULL,
   PRIMARY KEY(personnel_id),
   FOREIGN KEY(service_id) REFERENCES Service(service_id)
);

-- TABLE CLIENT ----------------------------------------------------------------------------------------------

CREATE TABLE Client(
   client_id INT AUTO_INCREMENT,
   client_nom VARCHAR(255)  NOT NULL,
   client_prenom VARCHAR(255)  NOT NULL,
   client_dateNaissance DATE NOT NULL,
   client_livraisonAdresse VARCHAR(255)  NOT NULL,
   client_livraisonVille VARCHAR(255) ,
   client_livraisonCp VARCHAR(5)  NOT NULL,
   client_facturationAdresse VARCHAR(255)  NOT NULL,
   client_facturationVille VARCHAR(255)  NOT NULL,
   client_facturationCp VARCHAR(255)  NOT NULL,
   client_mail VARCHAR(255)  NOT NULL,
   client_tel VARCHAR(255) ,
   client_mdp VARCHAR(255)  NOT NULL,
   client_coef DECIMAL(9,3)   NOT NULL,
   personnel_id INT NOT NULL,
   statut_id INT NOT NULL,
   PRIMARY KEY(client_id),
   FOREIGN KEY(personnel_id) REFERENCES Personnel(personnel_id),
   FOREIGN KEY(statut_id) REFERENCES Statut(statut_id)
);

-- TABLE LIVRAISON ----------------------------------------------------------------------------------------------

CREATE TABLE Livraison(
   livraison_id INT AUTO_INCREMENT,
   livraison_NbColis INT NOT NULL,
   livraison_dateExpedition DATE NOT NULL,
   livraison_dateLivraison DATETIME NOT NULL,
   livraison_bonLivraison BOOLEAN,
   client_id INT NOT NULL,
   commande_id INT NOT NULL,
   PRIMARY KEY(livraison_id),
   FOREIGN KEY(client_id) REFERENCES Client(client_id),
   FOREIGN KEY(commande_id) REFERENCES Commande(commande_id)
);

-- TABLE LIGNE_COMMANDE ----------------------------------------------------------------------------------------------

CREATE TABLE Ligne_Commande(
   produit_id INT,
   commande_id INT,
   ligneCommande_quantite INT NOT NULL,
   PRIMARY KEY(produit_id, commande_id),
   FOREIGN KEY(produit_id) REFERENCES Produit(produit_id),
   FOREIGN KEY(commande_id) REFERENCES Commande(commande_id)
);

-- TABLE LIGNE_LIVRAISON ----------------------------------------------------------------------------------------------

CREATE TABLE Ligne_Livraison(
   produit_id INT,
   livraison_id INT,
   quantite_livree VARCHAR(50) ,
   PRIMARY KEY(produit_id, livraison_id),
   FOREIGN KEY(produit_id) REFERENCES Produit(produit_id),
   FOREIGN KEY(livraison_id) REFERENCES Livraison(livraison_id)
);



