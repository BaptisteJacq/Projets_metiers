/*
Import des données des tables d'import vers les tables finales
*/

-- Insertion des familles
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a
    USING(
        SELECT
            'état' AS valeur,
            'Etat de la signalisation, déterminé à partir d''une analyse visuelle.' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'matériau' AS valeur,
            'matériau utilisé pour la signalisation.' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'modulation' AS valeur,
            'Références permettant de connaître la longueur entre deux marquages d''une même ligne.' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'registre' AS valeur,
            'Catégories d''objets de signalisation routière.' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'unité de mesure' AS valeur,
            'Unités de mesure utilisées dans la gestion de la signalétique routière.' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'type de route' AS valeur,
            'Famille regroupant les différents types de route existant.' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'couleur' AS valeur,
            'Couleur des signalisations.' AS description
        FROM
            DUAL
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description);
-- Résultat : 7 lignes fusionnées

-- Insertion des états de la signalisation
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
    USING(
        WITH
            C_1 AS(
                SELECT DISTINCT
                    TRIM(LOWER("etat")) AS etat
                FROM
                    TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("etat")) AS etat
                FROM
                    TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("etat")) AS etat
                FROM
                    TEMP_SIGNALISATION_MEL_SH_PLACE_PMR
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("etat")) AS etat
                FROM
                    TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("etat")) AS etat
                FROM
                    TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("etat")) AS etat
                FROM
                    TEMP_SIGNALISATION_PONCTUELLE
            )
        
            SELECT DISTINCT
                TRIM(LOWER(etat)) AS valeur,
                CASE
                    WHEN TRIM(LOWER(etat)) = 'bon'
                        THEN 'Un état est considéré bon lorsque la surface du marquage ou de l''élément en bon état est ? 50% de la surface totale du marquage ou de l''élément. Pour le logo PMR Le sigle et le fond bleu doivent avoir 50% minimum de leur surface totale en bon état.'
                    WHEN TRIM(LOWER(etat)) = 'mauvais'
                        THEN 'Un état est considéré mauvais lorsque la surface du marquage ou de l''élément en mauvais état est < 50% de la surface totale du marquage ou de l''élément. Pour le logo PMR Le sigle et le fond bleu doivent avoir moins de 50% de leur surface totale en mauvais état.'
                END AS description
            FROM
                C_1
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description);
-- Résultat : 2 lignes fusionnées.

-- Insertion des matériaux utilisés pour la signalisation  
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
    USING(
        WITH
            C_1 AS(
                SELECT DISTINCT
                    TRIM(LOWER("nature_materiau")) AS nature_materiau
                FROM
                    TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("nature_materiau")) AS nature_materiau
                FROM
                    TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("nature_materiau")) AS nature_materiau
                FROM
                    TEMP_SIGNALISATION_MEL_SH_PLACE_PMR
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("nature_materiau")) AS nature_materiau
                FROM
                    TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("nature_materiau")) AS nature_materiau
                FROM
                    TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("nature_materiau")) AS nature_materiau
                FROM
                    TEMP_SIGNALISATION_PONCTUELLE
            )
        
            SELECT DISTINCT
                        TRIM(LOWER(nature_materiau)) AS valeur,
                        CASE
                            WHEN TRIM(LOWER(nature_materiau)) = 'enduit à chaud'
                                THEN 'Type de produit de marquage routier qui s’applique à chaud.'
                            WHEN TRIM(LOWER(nature_materiau)) = 'bande collée'
                                THEN 'Bande de couleur collée sur le revêtement de la chaussée ou du trottoir.'
                            WHEN TRIM(LOWER(nature_materiau)) = 'peinture'
                                THEN 'Peinture de marquage routier.'
                            WHEN TRIM(LOWER(nature_materiau)) = 'vntp'
                                THEN 'Produit de marquage en relief.'
                            WHEN TRIM(LOWER(nature_materiau)) = 'enduit à froid'
                                THEN 'Type de produit de marquage routier qui s’applique à froid.'
                        END AS description
                    FROM
                        C_1
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description); 
-- Résultat : 5 lignes fusionnés.

-- Insertion des modulations utilisées pour la signalisation  
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
    USING(
        SELECT DISTINCT
            TRIM(LOWER("modulation")) AS valeur,
            'modulation' AS description
        FROM
            TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description);
-- Résultat : 10 lignes fusionnées

-- Insertion des registres utilisés pour la signalisation      
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
    USING(
        WITH
            C_1 AS(
                SELECT DISTINCT
                    TRIM(LOWER("registre")) AS registre
                FROM
                    TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("registre")) AS registre
                FROM
                    TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("registre")) AS registre
                FROM
                    TEMP_SIGNALISATION_MEL_SH_PLACE_PMR
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("registre")) AS registre
                FROM
                    TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("registre")) AS registre
                FROM
                    TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE
                UNION ALL
                SELECT DISTINCT
                    TRIM(LOWER("registre")) AS registre
                FROM
                    TEMP_SIGNALISATION_PONCTUELLE
            )
        
            SELECT DISTINCT
                TRIM(LOWER(registre)) AS valeur,
                'registre' AS description
            FROM
                C_1
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description);
-- Résultat : 81 lignes fusionnées

-- Insertion des couleurs
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
    USING(
        SELECT DISTINCT
            TRIM(LOWER(a."couleur")) AS valeur,
            'Couleur utilisée pour la signalisation routière.' AS description
        FROM
            G_BASE_VOIE.temp_signalisation_mel_sh_surf_marque a
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description);
-- Résultat : 6 lignes fusionnée

-- Insertion des autres libellés       
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
    USING(
        SELECT
            'couleur' AS valeur,
            'couleur utilisée dans les signalisations' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'u' AS valeur,
            'Unité de largeur utilisée pour définir la largeur des lignes, différente selon le type de route' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'mre' AS valeur,
            'Unité de largeur utilisée pour définir la largeur des lignes, différente selon le type de route' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'autoroute' AS valeur,
            'autoroute' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'route à chaussées séparées' AS valeur,
            'route à chaussées séparées' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'route à 4 voies de rase campagne' AS valeur,
            'route à 4 voies de rase campagne' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'route importante' AS valeur,
            'route importante' AS description
        FROM
            DUAL
        UNION ALL
        SELECT
            'piste cyclable' AS valeur,
            'piste cyclable' AS description
        FROM
            DUAL
    )t    
ON(a.valeur = t.valeur)    
WHEN NOT MATCHED THEN
    INSERT(a.valeur, a.description)
    VALUES(t.valeur, t.description);
-- Résultat : 8 lignes fusionnée

-- Création des relations familles/libellés
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE a
    USING(
        SELECT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
        WHERE
            a.valeur = 'état'
            AND b.valeur IN('bon', 'mauvais')
        UNION ALL
        SELECT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
        WHERE
            a.valeur = 'matériau'
            AND b.valeur IN('enduit à chaud', 'bande collée', 'peinture', 'vntp', 'enduit à froid')
        UNION ALL
        SELECT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
        WHERE
            a.valeur = 'modulation'
            AND b.valeur IN('mre', 't''1', 'ligne mixte lc-t3', 't1', 't3', 't''2', 'mixte continue t''2', 't''3', 'ligne continue', 't2')
        UNION ALL
        SELECT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
        WHERE
            a.valeur = 'registre'
            AND b.valeur IN('vélo', 'pmr_d_7x2_long', 'flèche double droite', 'flèche gauche', 'dos d''ane sens unique', 'axe', 'bande eveil vigilance', 'ligne d''effet de feux', 'traversée vélo bidi', 'pmr_c_5x3.3_bataille', 'sas velo 2 voies', 'bande suggérée', 'zigzag bus 10m', 'flèche vélo simple', 'rampant plateau sens unique (5 dents)', 'texte livraison', 'aire de livraison 10m', 'texte ambulance', 'texte autopartage', 'texte p', 'rive', 'vert cycliste en section', 'zigzag bus 25m', 'croix blanche stat. interdit', 'flèche vélo droite', 'zigzag bus 20m', 'texte payant', 'flèche multiple', 'ilot central', 'rampant plateau double sens (16 dents)', 'flèche rabattement gauche', 'entrée porte z30', 'flèche vélo double gauche', 'logo double chevrons', 'flèche vélo double droite', 'logo autopartage', 'stationnement', 'stop', 'sas velo 3 voies', 'flèche simple', 'logo flèche vélo', 'texte bus', 'coussin berlinois (3 dents+rouge)', 'flèche rabattement droite', 'logo voiture électrique', 'texte réservé', 'flèche vélo gauche', 'flèche double droite et gauche', 'texte police', 'texte dépose minute crèche', 'passage piéton', 'cédez le passage', 'pmr_nc_5x2_long', 'autre', 'protection pieton', 'damier vélo vert', 'croix jaune stat. interdit', 'flèche double gauche', 'flèche droite', 'texte durée limitée', 'logo ellipse 30', 'bus', 'repere_tapis_pp', 'traversée vélo uni', 'pmr_c_7x3.3_epi', 'sas velo 1 voie', 'zébra', 'texte dépose minute', 'logo pmr sur quai bus', 'texte taxi', 'dos d''ane double sens', 'pmr_c_7x3.3_long', 'pmr_d_5x2_long', 'damier blanc', 'logo vélo', 'aplat vert vélo', 'logo piéton', 'aire de transports de fonds', 'aire de livraison 15m', 'texte ecole', 'flèche vélo double droite et gauche')
        UNION ALL
        SELECT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
        WHERE
            a.valeur = 'unité de mesure'
            AND b.valeur IN('u', 'mre')
        UNION ALL
        SELECT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
        WHERE
            a.valeur = 'type de route'
            AND b.valeur IN('autoroute', 'route à chaussées séparées', 'route à 4 voies de rase campagne', 'route importante', 'piste cyclable')
        UNION ALL
        SELECT DISTINCT
            a.objectid AS fid_famille,
            b.objectid AS fid_libelle
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_FAMILLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b
            INNER JOIN G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE c ON TRIM(LOWER(c."couleur")) = b.valeur
        WHERE
            a.valeur = 'couleur'
    )t
ON(a.fid_famille = t.fid_famille AND a.fid_libelle = t.fid_libelle)    
WHEN NOT MATCHED THEN
    INSERT(a.fid_famille, a.fid_libelle)
    VALUES(t.fid_famille, t.fid_libelle);
-- Résultat : 111 lignes fusionnées

-- Insertion des relations libellés parents / libellés enfants
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE a
    USING(
        /*SELECT
            a.objectid AS fid_libelle_parent,
            d.objectid AS fid_libelle_fils
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE b ON b.fid_libelle = a.objectid
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_FAMILLE c ON c.objectid = b.fid_famille,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d
        WHERE
            c.valeur = 'registre'
            AND d.valeur = 'couleur'
        UNION ALL*/
        SELECT
            a.objectid AS fid_libelle_parent,
            b.objectid AS fid_libelle_fils
        FROM
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE a,
            G_BASE_VOIE.TA_SIGNALISATION_LIBELLE  b
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE c ON c.fid_libelle = b.objectid
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_FAMILLE d ON d.objectid = c.fid_famille
        WHERE
            a.valeur = 'u'
            AND d.valeur = 'type de route'
        UNION ALL       
        SELECT DISTINCT
            b.objectid AS fid_libelle_parent,
            c.objectid AS fid_libelle_fils
        FROM
            G_BASE_VOIE.temp_signalisation_mel_sh_surf_marque a
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."registre"))
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."couleur"))
    )t
ON(a.fid_libelle_parent = t.fid_libelle_parent AND a.fid_libelle_fils = t.fid_libelle_fils)    
WHEN NOT MATCHED THEN
    INSERT(a.fid_libelle_parent, a.fid_libelle_fils)
    VALUES(t.fid_libelle_parent, t.fid_libelle_fils);
-- Résultat : 22 lignes fusionnées

-- Insertion des pnoms des agents
MERGE INTO G_BASE_VOIE.TA_SIGNALISATION_AGENT a
    USING(
        SELECT
            5741 AS numero_agent,
            'bjacq' AS pnom,
            1 AS validite
        FROM
            DUAL
        UNION ALL
        SELECT
            6289 AS numero_agent,
            'ljouglet' AS pnom,
            1 AS validite
        FROM
            DUAL
    )t
ON(a.numero_agent = t.numero_agent)    
WHEN NOT MATCHED THEN
    INSERT(a.numero_agent, a.pnom, a.validite)
    VALUES(t.numero_agent, t.pnom, t.validite);
-- Résultat : 2 ligne fusionnées

-- Insertion des lignes
-- Insertion des entités de TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE
INSERT INTO G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE(geom, id_source, largeur, remarque, date_livraison, fid_troncon, fid_etat, fid_registre, fid_materiau, fid_modulation, fid_unite_largeur)
SELECT
    a.geom,
    CAST(a."id_sh_longitudinale" AS NUMBER(38,0)) AS id_source,
    CASE
        WHEN TRIM(LOWER(a."largeur")) = '1u' 
            THEN 5
        WHEN TRIM(LOWER(a."largeur")) = '2u' 
            THEN 5
        WHEN TRIM(LOWER(a."largeur")) = '3u' 
            THEN 5
        WHEN TRIM(LOWER(a."largeur")) = '5u' 
            THEN 5
    END AS largeur,
    a."remarque" AS remarque,
    TO_DATE('22/02/2023', 'dd/mm/yy') AS date_livraison,
    CAST(a."num_troncon" AS NUMBER(38,0)) AS fid_troncon,
    b.objectid AS fid_etat,
    c.objectid AS fid_registre,
    d.objectid AS fid_materiau,
    e.objectid AS fid_modulation,
    f.objectid AS fid_unite_largeur
FROM
    G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."etat"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."registre"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d ON d.valeur = TRIM(LOWER(a."nature_materiau"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE e ON e.valeur = TRIM(LOWER(a."modulation")),
    G_BASE_VOIE.TA_SIGNALISATION_LIBELLE f
WHERE
    f.valeur = 'u';
-- Résultat : 49 386 lignes fusionnées

-- Insertion des entités de MEL_SH_MARQ_SECURITE
INSERT INTO G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE(geom, id_source, remarque, date_livraison, fid_troncon, fid_etat, fid_registre, fid_materiau)
        SELECT
            a.geom,
            CAST(a."id_marquage_securite" AS NUMBER(38,0)) AS id_source,
            a."remarque" AS remarque,
            TO_DATE('22/02/2023', 'dd/mm/yy') AS date_livraison,
            CAST(a."num_troncon" AS NUMBER(38,0)) AS fid_troncon,
            b.objectid AS fid_etat,
            c.objectid AS fid_registre,
            d.objectid AS fid_materiau
        FROM
            G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE a
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."etat"))
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."registre"))
            INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d ON d.valeur = TRIM(LOWER(a."nature_materiau"));
-- Résultat : 16 502 lignes fusionnées

-- Insertion des polygones
-- Insertion des entités de TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE
INSERT INTO G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE(geom, id_source, surface, date_livraison, fid_troncon, fid_etat, fid_registre, fid_materiau)
SELECT
    a.geom,
    CAST(a."id_ilot_marque" AS NUMBER(38,0)) AS id_source,
    "surface" AS surface,
    TO_DATE('22/02/2023', 'dd/mm/yy') AS date_livraison,
    CAST(a."num_troncon" AS NUMBER(38,0)) AS fid_troncon,
    b.objectid AS fid_etat,
    c.objectid AS fid_registre,
    d.objectid AS fid_materiau
FROM
    G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE a
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."etat"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."registre"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d ON d.valeur = TRIM(LOWER(a."nature_materiau"));
-- Résultat : 3 861 lignes fusionnées

-- Insertion des ponctuels
-- Insertion des entités de TEMP_SIGNALISATION_PONCTUELLE
INSERT INTO G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL(geom, id_source, remarque, date_livraison, fid_troncon, fid_etat, fid_registre, fid_materiau)
SELECT
    a.geom,
    CAST(a."id_sh_ponctuelle" AS NUMBER(38,0)) AS id_source,
    a."remarque" AS remarque,
    TO_DATE('22/02/2023', 'dd/mm/yy') AS date_livraison,
    CAST(a."num_troncon" AS NUMBER(38,0)) AS fid_troncon,
    b.objectid AS fid_etat,
    c.objectid AS fid_registre,
    d.objectid AS fid_materiau
FROM
    G_BASE_VOIE.TEMP_SIGNALISATION_PONCTUELLE a
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."etat"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."registre"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d ON d.valeur = TRIM(LOWER(a."nature_materiau"));
-- Résultat : 20 850 lignes fusionnées

-- Insertion des entités de TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE
INSERT INTO G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL(geom, id_source, remarque, date_livraison, fid_etat, fid_registre, fid_materiau)
SELECT
    a.geom,
    CAST(a."id_sas_cyclable" AS NUMBER(38,0)) AS id_source,
    a."remarque" AS remarque,
    TO_DATE('22/02/2023', 'dd/mm/yy') AS date_livraison,
    b.objectid AS fid_etat,
    c.objectid AS fid_registre,
    d.objectid AS fid_materiau
FROM
    G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE a
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."etat"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."registre"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d ON d.valeur = TRIM(LOWER(a."nature_materiau"));
-- Résultat : 256 lignes fusionnées

-- Insertion des entités de TEMP_SIGNALISATION_MEL_SH_PLACE_PMR
INSERT INTO G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL(geom, id_source, remarque, date_livraison, fid_etat, fid_registre, fid_materiau)
SELECT
    a.geom,
    CAST(a."id_place_pmr" AS NUMBER(38,0)) AS id_source,
    a."remarque" AS remarque,
    TO_DATE('22/02/2023', 'dd/mm/yy') AS date_livraison,
    b.objectid AS fid_etat,
    c.objectid AS fid_registre,
    d.objectid AS fid_materiau
FROM
    G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_PLACE_PMR a
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE b ON b.valeur = TRIM(LOWER(a."etat"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE c ON c.valeur = TRIM(LOWER(a."registre"))
    INNER JOIN G_BASE_VOIE.TA_SIGNALISATION_LIBELLE d ON d.valeur = TRIM(LOWER(a."nature_materiau"));
-- Résultat : 1 100 lignes fusionnées
