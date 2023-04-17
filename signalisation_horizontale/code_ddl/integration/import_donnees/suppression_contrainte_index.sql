/*
Désactivation des contraintes et suppression des index.
*/
-- Linéaire
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883176;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883177;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883178;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883175;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883179;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883180;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883181;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883182;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883183;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883184;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_LINEAIRE
ENABLE CONSTRAINT SYS_C00883185;

DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_SIDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_ETAT_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_TYPE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_ID_SOURCE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_TRONCON_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_MATERIAU_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_REGISTRE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_MODULATION_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_UNITE_LARGEUR_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_LINEAIRE_FID_PNOM_MODIFICATION_IDX;

-- Surfacique
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883196;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883197;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883198;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883199;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883200;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883201;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883202;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883203;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883204;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
DISABLE CONSTRAINT SYS_C00883205;

DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_SIDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_FID_ETAT_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_FID_TYPE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_FID_MATERIAU_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_FID_REGISTRE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_FID_MODULATION_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_SURFACIQUE_FID_PNOM_MODIFICATION_IDX;

-- ponctuel
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883215;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883216;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883217;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883218;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883219;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883220;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883221;
ALTER TABLE G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_PONCTUEL
DISABLE CONSTRAINT SYS_C00883222;

DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_SIDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_FID_ETAT_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_FID_TYPE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_ID_SOURCE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_FID_TRONCON_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_FID_MATERIAU_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_FID_REGISTRE_IDX;
DROP INDEX TA_SIGNALISATION_MARQUAGE_PONCTUEL_FID_PNOM_MODIFICATION_IDX;

/

