-- ------------------------------------------------------------------------------------------------------------------
-- REQUETES TABLEAU DE BORD -----------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------

-- Chiffre d'affaires mois par mois pour une année sélectionnée -----------------------------------------------------

DROP PROCEDURE IF EXISTS `CA_annee`;

DELIMITER |

CREATE PROCEDURE CA_annee(
   In annee YEAR
   )

BEGIN

SELECT MONTH(c.commande_date) AS 'Mois', ROUND(SUM(((p.produit_prixVente * cl.client_coef)*lc.ligneCommande_quantite)*((100-c.commande_reduction)/100)),2) AS 'Chiffre d\'affaire', annee AS 'Année'
FROM Commande c
JOIN Ligne_Commande lc ON c.commande_id = lc.commande_id
JOIN Produit p ON lc.produit_id = p.produit_id
JOIN Livraison l ON c.commande_id = l.commande_id
JOIN Client cl ON l.client_id = cl.client_id
WHERE YEAR(c.commande_date) = annee
GROUP BY MONTH(c.commande_date);

END |

DELIMITER ;

-- TEST -----
CALL CA_annee(2023);


-- Chiffre d'affaires généré pour un fournisseur -----------------------------------------------------

DROP PROCEDURE IF EXISTS `CA_Fournisseur`;

DELIMITER |

CREATE PROCEDURE CA_Fournisseur(
   In idFournisseur int,
   In annee varchar(4)
   )

BEGIN

SELECT MONTH(c.commande_date) AS 'Mois', annee AS 'Année', f.fournisseur_id AS 'ID Fournisseur', f.fournisseur_nom AS 'Nom Fournisseur',
 ROUND(SUM(((p.produit_prixVente * cl.client_coef)*lc.ligneCommande_quantite)*((100-c.commande_reduction)/100)),2) AS 'Chiffre d\'affaire'
FROM Commande c
JOIN Ligne_Commande lc ON c.commande_id = lc.commande_id
JOIN Produit p ON lc.produit_id = p.produit_id
JOIN Livraison l ON c.commande_id = l.commande_id
JOIN Client cl ON l.client_id = cl.client_id
JOIN Fournisseur f ON p.fournisseur_id = f.fournisseur_id
WHERE YEAR(c.commande_date) = annee AND f.fournisseur_id = idFournisseur
GROUP BY MONTH(c.commande_date);

END |

DELIMITER ;

-- TEST -----
CALL CA_Fournisseur(8, 2023);


-- TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur) ---------------------

DROP PROCEDURE IF EXISTS `TOP_10_NbVentes_Produits_Annee`;

DELIMITER |

CREATE PROCEDURE TOP_10_NbVentes_Produits_Annee(
   In annee varchar(4)
   )

BEGIN

SELECT p.produit_id, p.produit_libelle, SUM(lc.ligneCommande_quantite) AS 'Quantité commandée', f.fournisseur_id, annee AS 'Année'
FROM Fournisseur f
JOIN Produit p ON f.fournisseur_id = p.fournisseur_id
JOIN Ligne_Commande lc ON p.produit_id = lc.produit_id
JOIN Commande c ON lc.commande_id = c.commande_id
WHERE YEAR(c.commande_date) = annee
GROUP BY p.produit_id
ORDER BY SUM(lc.ligneCommande_quantite) DESC
LIMIT 10;

END |

DELIMITER ;

-- TEST -----
CALL TOP_10_NbVentes_Produits_Annee(2023);


-- TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur) ---------------------

DROP PROCEDURE IF EXISTS `TOP_10_Marges_Produits_Annee`;

DELIMITER |

CREATE PROCEDURE TOP_10_Marges_Produits_Annee(
   In annee varchar(4)
   )

BEGIN

SELECT p.produit_id, p.produit_libelle, (p.produit_prixVente - (p.produit_prixAchat * cl.client_coef)) AS 'Marge', f.fournisseur_id, annee AS 'Année'

                            ROUND(SUM(p.produit_prixAchat -(((p.produit_prixVente * cl.client_coef)*lc.ligneCommande_quantite)*((100-c.commande_reduction)/100))),2)


FROM Produit p
WHERE YEAR(c.commande_date) = annee;

END |

DELIMITER ;

-- TEST -----
CALL TOP_10_Marges_Produits_Annee(2023);
