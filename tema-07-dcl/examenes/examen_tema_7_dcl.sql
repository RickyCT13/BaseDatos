# Examen Práctico Tema 7 (SQL-DCL)
# Ricardo Moreno Cantea, 1ºDAW

# 1. Crear usuarios

SELECT 
    PASSWORD('youtuber'),
    PASSWORD('malamanera'),
    PASSWORD('golazosconlaizquierda');

CREATE USER juancanca@localhost IDENTIFIED BY PASSWORD('*E5AE74CDB958A8D312FEA47326B63D657EB3326C'), pedrosierra@localhost IDENTIFIED BY PASSWORD('*A54BC61FB04A8614D852F9E8D11935F889741945'), marcoasensio@localhost IDENTIFIED BY PASSWORD('*5AA1C69DDCD7FDAD2F376E8F80D51202DA40AA09'), irenemondeo@localhost, pedrosancho@localhost;

# 2. Asignación de privilegios

GRANT SELECT ON * TO juancanca@localhost, pedrosierra@localhost, marcoasensio@localhost;

GRANT ALL ON maratoon.* TO pedrosierra@localhost, juancanca@localhost;
GRANT ALL ON geslibros.* TO pedrosierra@localhost, juancanca@localhost;
GRANT ALL ON empresa.* TO pedrosierra@localhost, juancanca@localhost;

GRANT SELECT, UPDATE, DELETE, INSERT ON geslibros.libros TO marcoasensio@localhost;
GRANT SELECT, UPDATE, DELETE, INSERT ON geslibros.editoriales TO marcoasensio@localhost;
GRANT SELECT, UPDATE, DELETE, INSERT ON geslibros.autores TO marcoasensio@localhost;
GRANT SELECT, UPDATE, DELETE, INSERT ON geslibros.clientes TO marcoasensio@localhost;

GRANT ALL ON * TO juancanca@localhost, pedrosierra@localhost WITH GRANT OPTION;

GRANT INSERT, UPDATE, SELECT, DELETE ON geslibros.clientes TO irenemondeo@localhost;

GRANT ALTER, DELETE, INDEX, INSERT, SELECT, UPDATE ON maratoon.corredores TO irenemondeo@localhost;
GRANT ALTER, DELETE, INDEX, INSERT, SELECT, UPDATE ON maratoon.clubs TO irenemondeo@localhost;
GRANT ALTER, DELETE, INDEX, INSERT, SELECT, UPDATE ON maratoon.categorias TO irenemondeo@localhost;

GRANT SELECT(CANTIDAD, PRECIO, IMPORTE) ON geslibros.lineasventas TO pedrosancho@localhost;

GRANT SELECT(ISBN, EAN, TITULO, PRECIO_COSTE, PRECIO_VENTA, STOCK), UPDATE(PRECIO_COSTE, PRECIO_VENTA, STOCK) ON geslibros.libros TO pedrosancho@localhost;

# 3. Revocación de privilegios

REVOKE SELECT, UPDATE, DELETE ON maratoon.* FROM marcoasensio@localhost;
REVOKE SELECT, UPDATE, DELETE ON geslibros.* FROM marcoasensio@localhost;

revoke GRANT OPTION from marcoasensio@localhost;

REVOKE SELECT, INSERT, DELETE, UPDATE ON geslibros.libros FROM marcoasensio@localhost;
REVOKE SELECT, INSERT, DELETE, UPDATE ON geslibros.autores FROM marcoasensio@localhost;
REVOKE SELECT, INSERT, DELETE, UPDATE ON geslibros.editoriales FROM marcoasensio@localhost;

# 4. Cambiar password

SELECT PASSWORD('lavidaesbella');
SET PASSWORD FOR pedrosancho@localhost = PASSWORD('*CA51F59C367EBC350D023A9E4E13D09233949421');

# 5. Bloqueo

LOCK TABLES geslibros.libros READ, geslibros.autores READ, geslibros.ventas READ, geslibros.lineasventas READ;

LOCK TABLES geslibros.editoriales WRITE, geslibros.clientes WRITE, geslibros.ventas WRITE;

UNLOCK TABLES;

# 6. Bloqueo y transacción

START TRANSACTION;

SELECT 
    *
FROM
    libros
WHERE
    editorial_id = 2 OR editorial_id = 6
LOCK IN SHARE MODE;

UPDATE libros 
SET 
    precio_coste = precio_coste * 1.1,
    precio_venta = precio_venta + 15
WHERE
    editorial_id = 2;

UPDATE libros 
SET 
    precio_venta = precio_venta * 1.15,
    stock_min = stock_min - 2,
    precio_coste = precio_coste * 1.103
WHERE
    editorial_id = 6; 

COMMIT;
UNLOCK TABLES;

# 7. Funciones aleatorias

SELECT ROUND(RAND() * 9);

SELECT CEILING(RAND() * 10);

SELECT CEILING(RAND() * 55);

# 8. Funciones de Cadena

SELECT 
    SUBSTRING_INDEX(resultados, ' ', 2) equipo_casa,
    SUBSTRING_INDEX(resultados, ' ', - 1) goles_eq_fuera,
    CONCAT_WS(' - ',
            SUBSTRING_INDEX(resultados, '-', - 1),
            SUBSTRING_INDEX(resultados, '-', 1)) res_inverso
FROM
    partidos;

# 9. Importación y exportación

SELECT 
    lib.id,
    lib.titulo,
    aut.nombre autor,
    edi.nombre editorial,
    lib.fecha_edicion,
    lib.stock,
    lib.precio_coste,
    lib.precio_venta
FROM
    geslibros.libros lib
        INNER JOIN
    geslibros.autores aut ON lib.autor_id = aut.id
        INNER JOIN
    geslibros.editoriales edi ON lib.editorial_id = edi.id
ORDER BY lib.id INTO OUTFILE 'C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/libros.csv' FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n';

SELECT 
    lib.id,
    lib.titulo,
    aut.nombre autor,
    edi.nombre editorial,
    lib.fecha_edicion,
    lib.stock,
    lib.precio_coste,
    lib.precio_venta
FROM
    geslibros.libros lib
        INNER JOIN
    geslibros.autores aut ON lib.autor_id = aut.id
        INNER JOIN
    geslibros.editoriales edi ON lib.editorial_id = edi.id
WHERE
    lib.editorial_id = 3
ORDER BY lib.id INTO OUTFILE 'C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/librosrama.csv' FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/autores.csv' IGNORE INTO TABLE geslibros.autores FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

# 10. Copia de seguridad
/*
mysqldump -h localhost -u root -p --xml geslibros > C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/geslibrosfullcopy.xml
mysqldump -h localhost -u root -p --xml maratoon > C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/maratoonfullcopy.xml

mysqldump -h localhost -u root -p geslibros libros editoriales autores > C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/libroseditorialesautores.sql

mysqldump -h localhost -u root -p geslibros > C:/Users/1DAW_2223_11/Documents/BaseDatos/tema-07-dcl/examenes/geslibroscopy.sql
*/

