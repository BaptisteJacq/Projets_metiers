/*
Correction des erreurs de géométrie
*/
-- Correction de l'erreur 13356 pour les entités dont le type de géométrie après correction est égal au type de géométrie originel
MERGE INTO G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
USING(
    WITH
        C_1 AS(
            SELECT
                a.OGR_FID,
                a.GEOM.sdo_gtype AS start_type_geom,
                SDO_UTIL.RECTIFY_GEOMETRY(a.GEOM, 0.005).sdo_gtype AS end_type_geom,
                SDO_UTIL.RECTIFY_GEOMETRY(a.GEOM, 0.005) AS geom
            FROM
                G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
            WHERE
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) = '13356'
        )

        SELECT
            a.OGR_FID,
            a.geom,
            a.end_type_geom
        FROM
            C_1 a
        WHERE
            SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.geom, 0.005) = 'TRUE'
            AND a.start_type_geom = a.end_type_geom
    )f
ON (a.OGR_FID = f.OGR_FID)
WHEN MATCHED THEN
    UPDATE
    SET a.GEOM = f.GEOM;

-- Correction de l'erreur 13356 pour les entités dont le type de géométrie après correction est 2002 alors que le type de géométrie originel est 2006
MERGE INTO G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
USING(
    WITH
        C_1 AS(
            SELECT
                a.OGR_FID,
                a.GEOM.sdo_gtype AS start_type_geom,
                SDO_UTIL.RECTIFY_GEOMETRY(a.GEOM, 0.005).sdo_gtype AS end_type_geom,
                SDO_UTIL.RECTIFY_GEOMETRY(a.GEOM, 0.005) AS geom
            FROM
                G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE a
            WHERE
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) = '13356'
        )

        SELECT
            a.OGR_FID,
            a.geom,
            a.end_type_geom
        FROM
            C_1 a
        WHERE
            SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.geom, 0.005) = 'TRUE'
            AND a.start_type_geom = '2006'
            AND a.end_type_geom = '2002'
    )f
ON (a.OGR_FID = f.OGR_FID)
WHEN MATCHED THEN
    UPDATE
    SET a.GEOM = f.GEOM;
-- Résultat : 5 lignes fusionnées

-- Correction des erreurs de géométrie de la table TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE
-- Correction de l'erreur 13356 de sorte que la géométrie résultante soit de type 2007 ou 2003 et la surface égale à celle de la géométrie originelle au décimètre près.
MERGE INTO G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE a
USING(
    WITH
        C_1 AS(
            SELECT
                a.OGR_FID,
                a.geom.sdo_gtype AS start_type_geom,
                SDO_UTIL.RECTIFY_GEOMETRY(a.geom, 0.005).sdo_gtype AS end_type_geom,
                ROUND(SDO_GEOM.SDO_AREA(a.geom, 0.005), 1) AS start_surface,
                ROUND(SDO_GEOM.SDO_AREA(SDO_UTIL.RECTIFY_GEOMETRY(a.geom, 0.005), 0.005), 1) AS end_surface,
                SDO_UTIL.RECTIFY_GEOMETRY(a.geom, 0.005) AS geom
            FROM
                G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE a
            WHERE
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) = '13349'
        )

        SELECT
            a.OGR_FID,
            a.geom,
            a.end_type_geom
        FROM
            C_1 a
        WHERE
            SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.geom, 0.005) = 'TRUE'
            AND a.end_type_geom IN('2007', '2003')
            AND a.start_surface = end_surface
    )f
ON (a.OGR_FID = f.OGR_FID)
WHEN MATCHED THEN
    UPDATE
    SET a.geom = f.geom;
-- Résultat : 119 lignes fusionnées

-- Correction de l'erreur 13356 de sorte que la géométrie résultante soit de type 2007 ou 2003 et la surface égale à celle de la géométrie originelle au mètre près.
MERGE INTO G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE a
USING(
    WITH
        C_1 AS(
            SELECT
                a.OGR_FID,
                a.geom.sdo_gtype AS start_type_geom,
                SDO_UTIL.RECTIFY_GEOMETRY(a.geom, 0.005).sdo_gtype AS end_type_geom,
                ROUND(SDO_GEOM.SDO_AREA(a.geom, 0.005)) AS start_surface,
                ROUND(SDO_GEOM.SDO_AREA(SDO_UTIL.RECTIFY_GEOMETRY(a.geom, 0.005), 0.005)) AS end_surface,
                SDO_UTIL.RECTIFY_GEOMETRY(a.geom, 0.005) AS geom
            FROM
                G_BASE_VOIE.TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE a
            WHERE
                SUBSTR(SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.GEOM, 0.005), 0, 5) = '13349'
        )

        SELECT
            a.OGR_FID,
            a.geom,
            a.end_type_geom
        FROM
            C_1 a
        WHERE
            SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(a.geom, 0.005) = 'TRUE'
            AND a.end_type_geom IN('2007', '2003')
            AND a.start_surface = end_surface
    )f
ON (a.OGR_FID = f.OGR_FID)
WHEN MATCHED THEN
    UPDATE
    SET a.geom = f.geom;
-- Résultat : 9 lignes fusionnées

/

