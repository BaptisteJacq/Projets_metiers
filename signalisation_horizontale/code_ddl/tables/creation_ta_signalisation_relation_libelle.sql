/*
La table TA_SIGNALISATION_RELATION_LIBELLE - du projet de signalisation routière - permettant de catégoriser les libellés entre eux (dans le cadre des couleurs de marquage notamment).
*/

-- 1. Création de la table TA_SIGNALISATION_RELATION_LIBELLE
CREATE TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE(
    fid_libelle_parent NUMBER(38,0) NOT NULL,
    fid_libelle_fils NUMBER(38,0) NOT NULL
);

-- 2. Création des commentaires sur la table et les champs
COMMENT ON TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE IS 'Table de relation - du projet de signalisation routière - permettant de catégoriser les libellés entre eux (dans le cadre des couleurs de marquage notamment).';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE.fid_libelle_parent IS 'Clé étrangère de la table TA_SIGNALISATION_LIBELLE permettant d''associer un ou plusieurs libelle parent à un ou plusieurs libelles fils.';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE.fid_libelle_fils IS 'Clé étrangère de la table TA_SIGNALISATION_LIBELLE permettant d''associer un ou plusieurs libelle fils un ou plusieurs libelles parents.';

-- 3. Création de la clé primaire
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE 
ADD CONSTRAINT TA_SIGNALISATION_RELATION_LIBELLE_PK 
PRIMARY KEY("FID_LIBELLE_PARENT", "FID_LIBELLE_FILS") 
USING INDEX TABLESPACE "G_ADT_INDX";

-- 4. Création des clés étrangères
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE
ADD CONSTRAINT TA_SIGNALISATION_RELATION_LIBELLE_FID_LIBELLE_PARENT_FK
FOREIGN KEY (fid_libelle_parent)
REFERENCES G_BASE_VOIE.TA_SIGNALISATION_LIBELLE(objectid);

ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE
ADD CONSTRAINT TA_SIGNALISATION_RELATION_LIBELLE_FID_LIBELLE_FILS_FK
FOREIGN KEY (fid_libelle_fils)
REFERENCES G_BASE_VOIE.TA_SIGNALISATION_LIBELLE(objectid);

-- 4. Création des index sur les clés étrangères et autres
CREATE INDEX TA_SIGNALISATION_RELATION_LIBELLE_FID_LIBELLE_PARENT_IDX ON G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE(fid_libelle_parent)
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_SIGNALISATION_RELATION_LIBELLE_FID_LIBELLE_FILS_IDX ON G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE(fid_libelle_fils)
    TABLESPACE G_ADT_INDX;

-- 8. Affectation du droit de sélection sur les objets de la table aux administrateurs
GRANT SELECT ON G_BASE_VOIE.TA_SIGNALISATION_RELATION_LIBELLE TO G_ADMIN_SIG;

/

