@echo off
:: utilisation de ogr2ogr pour exporter des tables d'un GeoPackage vers oracle 12c
echo Bienvenu dans l'import des donnees de signalisation horizontale en base ! 
:: 1. gestion des identifiants Oracle
SET /p USER_D="Veuillez saisir l'utilisateur Oracle de destination : "
SET /p MDP_D="Veuillez saisir le mot de passe de l'utilisateur Oracle de destination : "
SET /p INSTANCE_D="Veuillez saisir l'instance Oracle de destination: "

:: 2. se mettre dans l'environnement QGIS
cd C:\Program Files\QGIS 3.24.2\bin

:: 3. Configurer le système d'encodage des caractères en UTF-8
SET NLS_LANG=AMERICAN_AMERICA.AL32UTF8

:: 4. Rediriger la variable PROJ_LIB vers le bon fichier proj.db afin qu'ogr2ogr trouve le bon scr
setx PROJ_LIB "C:\Program Files\QGIS 3.24.2\share\proj"

:: 5. commande ogr2ogr pour exporter les couches du geopackage X@X vers le schéma X@X
::ogr2ogr -f OCI OCI:%USER_D%/%MDP_D%@%INSTANCE_D% C:\Users\bjacq\Documents\Projets\signalisation_horizontale\MEL_SH_2022_catalogage.gpkg -sql "SELECT GEOM, id_sh_longitudinale, modulation, largeur, registre, etat, nature_materiau, remarque, num_troncon, num_iti_cyclable, auteur, couleur FROM MEL_sh_longitudinale" -nln TEMP_SIGNALISATION_MEL_SH_LONGITUDINALE -nlt MULTILINESTRING -lco SRID=2154 -dim 2 -skipfailures
ogr2ogr -f OCI OCI:%USER_D%/%MDP_D%@%INSTANCE_D% C:\Users\bjacq\Documents\Projets\signalisation_horizontale\MEL_SH_2022_catalogage.gpkg -sql "SELECT GEOM, id_marquage_securite, nom_image, registre, etat, nature_materiau, remarque, auteur, num_troncon, num_iti_cyclable FROM MEL_sh_marq_securite" -nln TEMP_SIGNALISATION_MEL_SH_MARQ_SECURITE -nlt MULTILINESTRING -lco SRID=2154 -dim 2 -skipfailures
::ogr2ogr -f OCI OCI:%USER_D%/%MDP_D%@%INSTANCE_D% C:\Users\bjacq\Documents\Projets\signalisation_horizontale\MEL_SH_2022_catalogage.gpkg -sql "SELECT GEOM, id_place_pmr, nom_image, etat, nature_materiau, angle_nord, remarque, auteur, registre FROM MEL_sh_place_pmr" -nln TEMP_SIGNALISATION_MEL_SH_PLACE_PMR -nlt POINT -lco SRID=2154 -dim 2 -skipfailures
::ogr2ogr -f OCI OCI:%USER_D%/%MDP_D%@%INSTANCE_D% C:\Users\bjacq\Documents\Projets\signalisation_horizontale\MEL_SH_2022_catalogage.gpkg -sql "SELECT GEOM, id_sas_cyclable, nom_image, etat, nature_materiau, angle_nord, remarque, auteur, registre FROM MEL_sh_sas_cyclable" -nln TEMP_SIGNALISATION_MEL_SH_SAS_CYCLABLE -nlt POINT -lco SRID=2154 -dim 2 -skipfailures
::ogr2ogr -f OCI OCI:%USER_D%/%MDP_D%@%INSTANCE_D% C:\Users\bjacq\Documents\Projets\signalisation_horizontale\MEL_SH_2022_catalogage.gpkg -sql "SELECT GEOM, id_ilot_marque, etat, registre, nature_materiau, nom_image, auteur, num_troncon, num_iti_cyclable, surface, couleur FROM MEL_sh_surf_marque" -nln TEMP_SIGNALISATION_MEL_SH_SURF_MARQUE -nlt MULTIPOLYGON -lco SRID=2154 -dim 2 -skipfailures
::ogr2ogr -f OCI OCI:%USER_D%/%MDP_D%@%INSTANCE_D% C:\Users\bjacq\Documents\Projets\signalisation_horizontale\MEL_SH_2022_catalogage.gpkg -sql "SELECT GEOM, id_sh_ponctuelle, nom_image, angle_nord, registre, etat, nature_materiau, remarque, auteur, num_troncon, num_iti_cyclable FROM ponctuelle" -nln TEMP_SIGNALISATION_PONCTUELLE -nlt POINT -lco SRID=2154 -dim 2 -skipfailures

:: 6. MISE EN PAUSE
PAUSE

