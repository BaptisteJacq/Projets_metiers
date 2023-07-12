/*
La table TA_SIGNALISATION_AGENT - du projet de signalisation routière -  regroupant les matricules et pnoms de tous les agents travaillant ou ayant travaillé sur la signalétique horizontale et verticale de la voirie.
*/

-- 1. Création de la table TA_SIGNALISATION_AGENT
CREATE TABLE G_BASE_VOIE.TA_SIGNALISATION_AGENT(
    numero_agent NUMBER(38,0) NOT NULL,
    pnom VARCHAR2(100 BYTE),
    validite NUMBER(1,0)
);

-- 2. Création des commentaires sur la table et les champs
COMMENT ON TABLE G_BASE_VOIE.TA_SIGNALISATION_AGENT IS 'Table - du projet de signalisation routière -  regroupant les matricules et pnoms de tous les agents travaillant ou ayant travaillé sur la signalétique horizontale et verticale de la voirie.';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_AGENT.numero_agent IS 'Matricule des agents travaillant ou ayant travaillé sur la signalétique horizontale et verticale de la voirie.';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_AGENT.pnom IS 'Pnom des agents travaillant ou ayant travaiilé sur la signalétique horizontale et verticale de la voirie.';
COMMENT ON COLUMN G_BASE_VOIE.TA_SIGNALISATION_AGENT.validite IS 'Champ permettant d''indiquer si un agent travaille ou non sur la signalétique horizontale et verticale de la voirie : 0 : non ; 1 : oui.';

-- 3. Création de la clé primaire
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_AGENT 
ADD CONSTRAINT TA_SIGNALISATION_AGENT_PK 
PRIMARY KEY("NUMERO_AGENT") 
USING INDEX TABLESPACE "G_ADT_INDX";

-- 4. Création des index sur les clés étrangères et autres
CREATE INDEX TA_SIGNALISATION_AGENT_PNOM_IDX ON G_BASE_VOIE.TA_SIGNALISATION_AGENT(pnom)
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_SIGNALISATION_AGENT_VALIDITE_IDX ON G_BASE_VOIE.TA_SIGNALISATION_AGENT(validite)
    TABLESPACE G_ADT_INDX;

-- 8. Affectation du droit de sélection sur les objets de la table aux administrateurs
GRANT SELECT ON G_BASE_VOIE.TA_SIGNALISATION_AGENT TO G_ADMIN_SIG;

/

