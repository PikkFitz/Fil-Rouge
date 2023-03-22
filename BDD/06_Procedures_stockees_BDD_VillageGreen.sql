-- ------------------------------------------------------------------------------------------------------------------
-- PROCEDURES STOCKEES ----------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------

-- Créez une procédure stockée qui sélectionne les commandes non soldées (en cours de livraison) --------------------

DROP PROCEDURE IF EXISTS `commandes_non_soldees`;

DELIMITER |

CREATE PROCEDURE commandes_non_soldees()
BEGIN

SELECT l.commande_id AS 'Commande non soldées'
FROM Livraison l
JOIN Contient c ON l.livraison_id = c.livraison_id
WHERE c.quantite_livree < l.livraison_NbColis;

END |

DELIMITER ;


-- TEST -----
CALL commandes_non_soldees();


-- Créez une procédure stockée qui renvoie le délai moyen entre la date de commande et la date de facturation -------

DROP PROCEDURE IF EXISTS `delai_moyen_date_commande_et_facturation`;

DELIMITER |

CREATE PROCEDURE delai_moyen_date_commande_et_facturation()
BEGIN

SELECT ROUND(AVG(DATEDIFF(commande_datePaiement, commande_date)),2) AS 'Délai moyen de paiement en jours'
FROM Commande;

END |

DELIMITER ;


-- TEST -----
CALL delai_moyen_date_commande_et_facturation();
