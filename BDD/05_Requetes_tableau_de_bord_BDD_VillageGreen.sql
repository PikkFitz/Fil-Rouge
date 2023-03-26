-- ------------------------------------------------------------------------------------------------------------------
-- REQUETES TABLEAU DE BORD -----------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------

-- Chiffre d'affaires mois par mois pour une année sélectionnée -----------------------------------------------------

DROP PROCEDURE IF EXISTS `CA_annee`; -- !! REDUCTION SUR COMMANDE COMPRISE !! -----

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

DROP PROCEDURE IF EXISTS `CA_Fournisseur_Annee`; -- !! REDUCTION SUR COMMANDE COMPRISE !! -----

DELIMITER |

CREATE PROCEDURE CA_Fournisseur_Annee(
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
CALL CA_Fournisseur_Annee(8, 2023);


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

DROP PROCEDURE IF EXISTS `TOP_10_Marges_Produits_Annee`; -- !! REDUCTION SUR COMMANDE COMPRISE !! -----

DELIMITER |

CREATE PROCEDURE TOP_10_Marges_Produits_Annee(
   In annee varchar(4)
   )

BEGIN

SELECT p.produit_id, p.produit_libelle, 
ROUND(SUM((((p.produit_prixVente * cl.client_coef)*lc.ligneCommande_quantite)*((100-c.commande_reduction)/100))- p.produit_prixAchat),2) AS 'Marge', 
f.fournisseur_id, annee AS 'Année'
FROM Commande c
JOIN Ligne_Commande lc ON c.commande_id = lc.commande_id
JOIN Produit p ON lc.produit_id = p.produit_id
JOIN Livraison l ON c.commande_id = l.commande_id
JOIN Client cl ON l.client_id = cl.client_id
JOIN Fournisseur f ON p.fournisseur_id = f.fournisseur_id
WHERE YEAR(c.commande_date) = annee
GROUP BY p.produit_id
ORDER BY `Marge` DESC
LIMIT 10;

END |

DELIMITER ;

-- TEST -----
CALL TOP_10_Marges_Produits_Annee(2023);


-- Top 10 des clients en nombre de commandes ou chiffre d'affaires ---------------------------------------

DROP PROCEDURE IF EXISTS `TOP_10_CA_Client_Annee`; -- !! REDUCTION SUR COMMANDE COMPRISE !! -----

DELIMITER |

CREATE PROCEDURE TOP_10_CA_Client_Annee(
   In annee varchar(4)
   )

BEGIN

SELECT cl.client_id, cl.client_nom, 
ROUND(SUM((((p.produit_prixVente * cl.client_coef)*lc.ligneCommande_quantite)*((100-c.commande_reduction)/100))),2) AS 'CA Client', annee AS 'Année'
FROM Commande c
JOIN Ligne_Commande lc ON c.commande_id = lc.commande_id
JOIN Produit p ON lc.produit_id = p.produit_id
JOIN Livraison l ON c.commande_id = l.commande_id
JOIN Client cl ON l.client_id = cl.client_id
WHERE YEAR(c.commande_date) = annee
GROUP BY cl.client_id
ORDER BY `CA Client` DESC
LIMIT 10;

END |

DELIMITER ;

-- TEST -----
CALL TOP_10_CA_Client_Annee(2023);


-- Répartition du chiffre d'affaires par type de client --------------------------------------------------------

DROP PROCEDURE IF EXISTS `CA_StatutClient_Annee`; -- !! REDUCTION SUR COMMANDE COMPRISE !! -----

DELIMITER |

CREATE PROCEDURE CA_StatutClient_Annee(
   In annee varchar(4)
   )

BEGIN

SELECT s.statut_id, s.statut_nom,
ROUND(SUM((((p.produit_prixVente * cl.client_coef)*lc.ligneCommande_quantite)*((100-c.commande_reduction)/100))),2) AS 'CA Statut Client', annee AS 'Année'
FROM Commande c
JOIN Ligne_Commande lc ON c.commande_id = lc.commande_id
JOIN Produit p ON lc.produit_id = p.produit_id
JOIN Livraison l ON c.commande_id = l.commande_id
JOIN Client cl ON l.client_id = cl.client_id
JOIN Statut s ON cl.statut_id = s.statut_id
WHERE YEAR(c.commande_date) = annee
GROUP BY s.statut_id
ORDER BY `CA Statut Client` DESC;

END |

DELIMITER ;

-- TEST -----
CALL CA_StatutClient_Annee(2023);


-- Nombre de commandes en cours de livraison --------------------------------------------------------

DROP PROCEDURE IF EXISTS `Commandes_en_cours_de_livraison`; -- !! REDUCTION SUR COMMANDE COMPRISE !! -----

DELIMITER |

CREATE PROCEDURE Commandes_en_cours_de_livraison()

BEGIN

SELECT c.commande_id, p.produit_id, ll.quantite_livree AS 'Quantité livrée', lc.ligneCommande_quantite AS 'Quantité commandée', l.livraison_id
FROM Commande c
JOIN Ligne_Commande lc ON c.commande_id = lc.commande_id
JOIN Produit p ON lc.produit_id = p.produit_id
JOIN Ligne_Livraison ll ON p.produit_id = ll.produit_id
JOIN Livraison l on ll.livraison_id = l.livraison_id
WHERE ll.quantite_livree < lc.ligneCommande_quantite
ORDER BY c.commande_id;

END |

DELIMITER ;

-- TEST -----
CALL Commandes_en_cours_de_livraison();


