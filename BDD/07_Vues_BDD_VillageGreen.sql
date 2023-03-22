-- ------------------------------------------------------------------------------------------------------------------
-- VUES -------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------

-- Vue correspondant à la jointure Produits - Fournisseurs ----------------------------------------------------------

DROP VIEW IF EXISTS v_liste_produits_fournisseurs;
CREATE VIEW v_liste_produits_fournisseurs
AS
SELECT f.*, p.produit_id, p.produit_referenceFournisseur, p.produit_description, p.produit_libelle, p.produit_prixAchat, p.produit_prixVente, p.produit_stock, p.produit_stockAlerte, p.produit_photo, p.sousCategorie_id
FROM Fournisseur f
JOIN Produit p ON f.fournisseur_id = p.fournisseur_id
ORDER BY f.fournisseur_id ASC;

-- TEST -----

SELECT * FROM v_liste_produits_fournisseurs;



-- Vue correspondant à la jointure Produits - Catégorie/Sous catégorie ----------------------------------------------

DROP VIEW IF EXISTS v_liste_produits_sousCategorie;
CREATE VIEW v_liste_produits_sousCategorie
AS
SELECT p.*, scat.sousCategorie_nom, scat.categorie_id
FROM Produit p
JOIN SousCategorie scat ON p.sousCategorie_id = scat.sousCategorie_id
ORDER BY p.produit_id ASC;

-- TEST -----

SELECT * FROM v_liste_produits_sousCategorie;