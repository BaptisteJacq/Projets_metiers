/*
Création de la vue G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE - du projet de signalisation horizontale - dénombrant les erreurs de géométrie par type et par table.  
*/
/*
DROP VIEW G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE;
*/
-- 1. Création de la vue
CREATE OR REPLACE FORCE VIEW G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE(
    objectid,
    nom_table,
    type_erreur,
    nombre_entite,
    CONSTRAINT "V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE_PK" PRIMARY KEY ("OBJECTID") DISABLE
) 
AS
    WITH
        C_1 AS(
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE' AS nom_table,
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
            WHERE
                SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005)<>'TRUE'
                AND SDO_GEOM.SDO_LENGTH(a.GEOM, 0.005) > 0.01
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE',
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5)
            UNION ALL
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE' AS nom_table,
                'Taille inférieure ou égale à 1cm' AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
            WHERE
                SDO_GEOM.SDO_LENGTH(a.GEOM, 0.005) <= 0.01
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE',
                'Taille inférieure ou égale à 1cm'
            UNION ALL
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE' AS nom_table,
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE a
            WHERE
                SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005)<>'TRUE'
                AND SDO_GEOM.SDO_LENGTH(a.GEOM, 0.005) > 0.01
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE',
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5)
            UNION ALL
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE' AS nom_table,
                'Taille inférieure ou égale à 1cm' AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE a
            WHERE
                SDO_GEOM.SDO_LENGTH(a.GEOM, 0.005) <= 0.01
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE',
                'Taille inférieure ou égale à 1cm'
            UNION ALL
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_PLACE_PMR' AS nom_table,
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                TEMP_SIGNALISATION_MEL_SH_PLACE_PMR a
            WHERE
                SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005)<>'TRUE'
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_PLACE_PMR',
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5)
            UNION ALL    
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE' AS nom_table,
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE a
            WHERE
                SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005)<>'TRUE'
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE',
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) 
            UNION ALL
            SELECT
                'TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE' AS nom_table,
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE a
            WHERE
                SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005)<>'TRUE'
            GROUP BY
                'TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE',
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5)    
            UNION ALL
            SELECT
                'TEMP_SIGNALISATION_PONCTUELLE' AS nom_table,
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) AS type_erreur,
                COUNT(a.OGR_FID) AS Nombre
            FROM
                TEMP_SIGNALISATION_PONCTUELLE a
            WHERE
                SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005)<>'TRUE'
            GROUP BY
                'TEMP_SIGNALISATION_PONCTUELLE',
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5)
        )
        
        SELECT
            rownum AS objectid,
            nom_table,
            type_erreur,
            Nombre
        FROM
            C_1;

-- 2. Création des commentaires
COMMENT ON TABLE G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE IS 'Vue - du projet de signalisation horizontale - décomptant le nombre d''erreurs de géométrie par type et par table.' ;
COMMENT ON COLUMN G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE.objectid IS 'Clé primaire de la vue.';  
COMMENT ON COLUMN G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE.nom_table IS 'Nom des tables étudiées.';  
COMMENT ON COLUMN G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE.type_erreur IS 'Types d''erreur idéntifiés.';  
COMMENT ON COLUMN G_BASE_VOIE.V_TEMP_SIGNALISATION_AUDIT_ERREUR_GEOMETRIE.nombre_entite IS 'Nombre d''entités en erreur.';  

/

