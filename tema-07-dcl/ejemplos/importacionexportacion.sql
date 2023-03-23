# Inserción de datos LOAD DATA

LOAD DATA INFILE "C:\\Users\\1DAW_2223_11\\Documents\\BaseDatos\\tema-07-dcl\\ejemplos\\registrocarrera.txt" IGNORE INTO TABLE maratoon.registros FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n';

LOAD XML INFILE "C:\\Users\\1DAW_2223_11\\Documents\\BaseDatos\\tema-07-dcl\\ejemplos\\corredores.xml" INTO TABLE maratoon.corredores ROWS IDENTIFIED BY '<regcorredores>';

SELECT * FROM maratoon.corredores INTO OUTFILE 'C:\\Users\\1DAW_2223_11\\Documents\\BaseDatos\\tema-07-dcl\\ejemplos\\corredores.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';