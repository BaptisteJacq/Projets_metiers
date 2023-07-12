@echo off
echo Bienvenu dans la creation des tables du projet LITTERALIS de la Base Voie !

:: 1. Configurer le système d'encodage des caractères en UTF-8
SET NLS_LANG=AMERICAN_AMERICA.AL32UTF8

:: 2. Déclaration et valorisation des variables
SET /p chemin_code_table="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des TABLES du schema : "
SET /p chemin_code_temp="Veuillez saisir le chemin d'acces du dossier integration : "
::SET /p USER="Veuillez saisir l'utilisateur Oracle : "
::SET /p MDP="Veuillez saisir le MDP : "
::SET /p INSTANCE="Veuillez saisir l'instance Oracle : "

copy /b %chemin_code_table%\creation_ta_signalisation_agent.sql + ^
%chemin_code_table%\creation_ta_signalisation_libelle.sql + ^
%chemin_code_table%\creation_ta_signalisation_famille.sql + ^
%chemin_code_table%\creation_ta_signalisation_relation_famille_libelle.sql + ^
%chemin_code_table%\creation_ta_signalisation_relation_libelle.sql + ^
%chemin_code_table%\creation_ta_signalisation_marquage_lineaire.sql + ^
%chemin_code_table%\creation_ta_signalisation_marquage_ponctuel.sql + ^
%chemin_code_table%\creation_ta_signalisation_marquage_surfacique.sql ^
%chemin_code_temp%\temp_code_ddl_projet_signalisation_routiere.sql

:: 3. lancement de SQL plus.
::CD C:/ora12c/R1/BIN

:: 4. Execution de sqlplus. pour lancer les requetes SQL.
::sqlplus.exe %USER%/%MDP%@%INSTANCE% @%chemin_code_temp%\temp_code_ddl_projet_signalisation_routiere.sql

:: 5. MISE EN PAUSE
PAUSE