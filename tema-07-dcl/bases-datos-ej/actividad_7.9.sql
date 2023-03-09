-- Actividad 7.9
-- Importación, exportación y copias de seguridad.
USE maratoon;

-- 1.Genera un fichero corredores.csv con los datos de 5 corredores.
-- coreedores.csv

-- NULL;"Rafel";Mendoza Pérez";"Ubrique";"1965-07-31";"H";NULL;NULL;1
NULL;"María José";"Moreno Morales";"Ubrique";"1945-08-30";"M";NULL;NULL;1
NULL;"Pedro";"Rodríguez Alva";"Ubrique";"1986-08-25";"H";NULL;NULL;1
NULL;"Juani";"Ríos Pérez";"Villamartín";"1995-10-15";"M";NULL;NULL;2
NULL;"Esther";"Pérez Ríos";"Villamartín";"1970-05-14";"M";NULL;NULL;2
-- 2. Importar fichero a la tabla corredores

LOAD DATA INFILE 'C:\\Users\\Juan Carlos Moreno\\Downloads\\corredores.csv' IGNORE INTO TABLE 
maratoon.corredores FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/Users/Juan Carlos Moreno/Downloads/corredores.csv' IGNORE INTO TABLE 
maratoon.corredores FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 3. Actualiza la Edad y las Categorías

-- Actualiza el campo Edad a partir de la Fecha de Nacimiento del corredor
--
UPDATE Corredores SET Edad = TIMESTAMPDIFF(YEAR,FechaNacimiento,NOW());
--
-- Actualizar la columna CodCategoría de la tabla corredor, teniendo -- -- en -
-- cuenta la Edad y el cuadrante de la tabla categorías
--
UPDATE Corredores SET categoria_id = 1 WHERE Edad<12;
UPDATE Corredores SET categoria_id = 2 WHERE Edad BETWEEN 12 AND 14;
UPDATE Corredores SET categoria_id = 3 WHERE Edad BETWEEN 15 AND 17;
UPDATE Corredores SET categoria_id = 4 WHERE Edad BETWEEN 18 AND 29;
UPDATE Corredores SET categoria_id = 5 WHERE Edad BETWEEN 30 AND 39;
UPDATE Corredores SET categoria_id = 6 WHERE Edad BETWEEN 40 AND 49;
UPDATE Corredores SET categoria_id = 7 WHERE Edad BETWEEN 50 AND 60;
UPDATE Corredores SET categoria_id = 8 WHERE Edad>=60;

-- 4. Genera un fichero registro.csv con los datos de la participación 
-- de una carrera existente de esos 5 corredores.
NULL;3;17;"2020-04-02 10:00:06.712587";"2020-04-02 10:45:10.000012";NULL
NULL;3;18;"2020-04-02 10:00:06.712587";"2020-04-02 10:35:10.000670";NULL
NULL;3;19;"2020-04-02 10:00:06.712587";"2020-04-02 10:37:10.001480";NULL
NULL;3;20;"2020-04-02 10:00:06.712587";"2020-04-02 10:36:20.001546";NULL
NULL;3;21;"2020-04-02 10:00:06.712587";"2020-04-02 10:35:40.000333";NULL

-- 5. Importar los datos del registro del fichero registro.csv
LOAD DATA INFILE 'C:/Users/Juan Carlos Moreno/Downloads/registros.csv' IGNORE INTO TABLE 
maratoon.registros FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 6. Actualizar la columna tiempo invertido de la tabla registro.
UPDATE registros 
SET 
    TiempoInvertido = TIMEDIFF(Llegada, Salida)
WHERE
    carrera_id = 3;

-- 7.Crear el fichero clubs.xml que contenga en formato xml válido los datos de 2 clubs.
-- Ojo el lenguaje XML es case sensitive

<?xml version="1.0" encoding="UTF-8"?>
<regclubs>
	<NombreCorto>AMC</NombreCorto>
	<Nombre>Atletismo Morón Club</Nombre>
	<Ciudad>Morón</Ciudad>
	<FecFundacion>1960-6-5</FecFundacion>
	<Numsocios>23</Numsocios>
</regclubs>

<regclubs>
	<NombreCorto>RAT</NombreCorto>
	<Nombre>Racing Atletismo Tarragona</Nombre>
	<Ciudad>Tarragona</Ciudad>
	<FecFundacion>1960-6-5</FecFundacion>
	<Numsocios>210</Numsocios>
</regclubs>

-- 8 Crear el fichero carrera.xml que contenga en formato xml válido los datos de 2 carreras.

<?xml version="1.0" encoding="UTF-8"?>
<regcarreras>
	<Nombre>Carrera por el coronavirus</Nombre>
	<Ciudad>Sevilla</Ciudad>
	<Distancia>20</Distancia>
	<MesCelebracion>11</MesCelebracion>
</regcarreras>
<regcarreras>
	<Nombre>Circular Sierra de Grazalema</Nombre>
	<Ciudad>Grazalema</Ciudad>
	<Distancia>90</Distancia>
	<MesCelebracion>4</MesCelebracion>
</regcarreras>

-- 9 Importar el documento clubs.xml a la tabla club de la base de datos maratoon.
LOAD XML INFILE 'C:/Users/Juan Carlos Moreno/Downloads/clubs.xml' 
INTO TABLE maratoon.clubs ROWS IDENTIFIED BY '<regclubs>';

-- 10. Importar el documento carreras.xml a la tabla carrera de la base de datos maratoon.
LOAD XML INFILE 'C:/Users/Juan Carlos Moreno/Downloads/carreras.xml' 
INTO TABLE maratoon.carreras ROWS IDENTIFIED BY '<regcarreras>';

-- 11.Exportar los datos de los corredores en un fichero llamado copiacorredores.csv.
SELECT 
    *
FROM
    maratoon.corredores INTO OUTFILE 'C:/Users/Juan Carlos Moreno/Downloads/copiacorredores.csv' 
    FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 12.Exportar los datos de los registros en un fichero llamado copiaregistros.csv.
SELECT 
    *
FROM
    maratoon.registros INTO OUTFILE 'C:/Users/Juan Carlos Moreno/Downloads/copiaregistros.csv' 
    FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 13.Exportar la clasificación de la carrera 1 en un fichero csv. La clasificación 
-- deberá mostrar: IdCorredor, Apellidos, Nombre, Club, Categoría, TiempoInvertido. 
SELECT 
    r.id Reg,
    co.id,
    co.apellidos,
    co.nombre,
    co.Club_id,
    cl.NombreCorto Club,
    co.Categoria_id,
    ca.NombreCorto Categoria,
    r.TiempoInvertido
FROM
    maratoon.corredores co
        INNER JOIN
	maratoon.clubs cl ON co.Club_id = cl.id
		INNER JOIN
	maratoon.categorias ca ON co.categoria_id = ca.id
		INNER JOIN
    maratoon.registros r ON co.id = r.corredor_id
WHERE
    r.carrera_id = 3
ORDER BY r.TiempoInvertido ASC INTO OUTFILE 'C:/Users/Juan Carlos Moreno/Desktop/clasificacion_carrera_1.csv' 
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- mysqldump -h localhost -u root -p maratoon>C:/Users/Usuario/Downloads/maratoon_copia.sql

-- 15.Realizar una copia de seguridad de las tablas carreras y registros de la base de datos maratoon.

-- mysqldump -h localhost -u root -p maratoon carreras registros>C:/Users/Usuario/Desktop/tablas_carreras_registros_copia.sql

-- -----
-- 16.Realizar una copia de seguridad de la base de datos maratoon en formato xml. Archivo de salida maratoon.xml.

-- mysqldump -h localhost -u root -p --xml maratoon>C:/Users/Usuario/Downloads/maratoon.xml

-- Para que coja nuestros caracteres en español, una vez creado el archivo, lo abrimos con un editor y le ponemos arriba: <?xml version="1.0" encoding="UTF-8"?>


-- 17.Realizar una copia de seguridad sólo de los datos de la base de datos maratoon en formato xml. Archivo de salida maratoondatos.xml.

-- mysqldump -h localhost -u root -p -t --xml maratoon>C:/Users/Usuario/Desktop/maratoondatos.xml

-- 18.Prueba ejecutar varios comandos sql en modo comando. Enviar varios ficheros de captura.


