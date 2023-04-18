/*
Déclencheur permettant de récupérer dans la table TA_SIGNALISATION_MARQUAGE_SURFACIQUE, les dates de modification des entités ainsi que le pnom de l'agent les ayant effectués.
*/

CREATE OR REPLACE TRIGGER G_BASE_VOIE.B_UXX_TA_SIGNALISATION_MARQUAGE_SURFACIQUE_DATE_PNOM
BEFORE UPDATE ON G_BASE_VOIE.TA_SIGNALISATION_MARQUAGE_SURFACIQUE
FOR EACH ROW
DECLARE
    username VARCHAR2(100);
    v_id_agent NUMBER(38,0);
    
BEGIN
    -- Sélection du pnom
    SELECT sys_context('USERENV','OS_USER') into username from dual;

    -- Sélection de l'id du pnom correspondant dans la table TA_AGENT
    SELECT numero_agent INTO v_id_agent FROM G_BASE_VOIE.TA_SIGNALISATION_AGENT WHERE pnom = username;

            :new.date_modification := TO_DATE(sysdate, 'dd/mm/yy');
            :new.fid_pnom_modification := v_id_agent;

    EXCEPTION
        WHEN OTHERS THEN
            mail.sendmail('bjacq@lillemetropole.fr',SQLERRM,'ERREUR TRIGGER - B_UXX_TA_SIGNALISATION_MARQUAGE_SURFACIQUE_DATE_PNOM','bjacq@lillemetropole.fr');
END;

/

