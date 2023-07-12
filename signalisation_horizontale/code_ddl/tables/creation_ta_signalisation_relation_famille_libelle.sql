/*
La table TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE - du projet de signalisation routière - permettant de regrouper les libellés de la signalétique voirie, horizontale et verticale, par famille.
*/

-- 1. Création de la table TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE
CREATE TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE(
    fid_famille NUMBER(38,0) NOT NULL,
    fid_libelle NUMBER(38,0) NOT NULL
);

-- 2. Création des commentaires sur la table et les champs
COMMENT ON TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE IS 'Table de relation - du projet de signalisation routière - permettant de regrouper les libellés de la signalétique voirie, horizontale et verticale, par famille.';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE.fid_famille IS 'Partie de la clé primaire de la table (1/2) et clé étrangère vers la table TA_VOIRIE_FAMILLE permettant d''associer une famille à ses libellés.';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE.fid_libelle IS 'Partie de la clé primaire de la table (2/2) et clé étrangère vers la table TA_VOIRIE_LIBELLE permettant d''associer les libellés à leur famille.';

-- 3. Création de la clé primaire
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE 
ADD CONSTRAINT TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE_PK 
PRIMARY KEY("FID_FAMILLE", "FID_LIBELLE") 
USING INDEX TABLESPACE "G_ADT_INDX";

-- 4. Création des clés étrangères
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE
ADD CONSTRAINT TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE_FID_FAMILLE_FK
FOREIGN KEY (fid_famille)
REFERENCES G_BASE_VOIE.TA_SIGNALISATION_FAMILLE(objectid);

ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE
ADD CONSTRAINT TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE_FID_LIBELLE_FK
FOREIGN KEY (fid_libelle)
REFERENCES G_BASE_VOIE.TA_SIGNALISATION_LIBELLE(objectid);

-- 4. Création des index sur les clés étrangères et autres
CREATE INDEX TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE_FID_FAMILLE_IDX ON G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE(fid_famille)
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE_FID_LIBELLE_IDX ON G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE(fid_libelle)
    TABLESPACE G_ADT_INDX;

-- 8. Affectation du droit de sélection sur les objets de la table aux administrateurs
GRANT SELECT ON G_BASE_VOIE.TA_SIGNALISATION_RELATION_FAMILLE_LIBELLE TO G_ADMIN_SIG;

/

