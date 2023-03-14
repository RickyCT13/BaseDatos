-- Solución Examen
-- Tema 7: Lenguaje SQL - DCL. Funciones y administración
-- BASE DE DATOS - 1DAW - 21/22

-- 1. Crear usuarios
-- Crear los siguientes usuario sin privilegios:

SELECT PASSWORD('1234567');
create user rodrigotriana@localhost identified by password '*6A7A490FB9DC8C33C2B025A91737077A7E9CC5E5';
SELECT PASSWORD('124356');
create user juansierra@localhost identified by password '*8F2F128E09BA8D0C0AD53B0EB770FB7693FE3AF2';
SELECT PASSWORD('764323');
create user romerocurro@localhost identified by password '*DE2B598A838D2A0FC6B9C4E8499F54A7A896D793';

-- 2. Asignación de privilegios
-- Los scripts no tienen porque guardar relación unos con otros, por lo tanto puede ocurrir que dos sentencias sean incompatibles y den problemas a la hora de ejecutarse, 

-- 2.1
GRANT SELECT on maratoon TO 'juansierra'@'localhost';
GRANT SELECT on geslibros TO 'juansierra'@'localhost';

-- 2.2
GRANT ALL PRIVILEGES ON *.* TO 'romerocurro'@'localhost' WITH GRANT OPTION;

-- 2.3
GRANT ALL PRIVILEGES ON *.* TO 'rodrigotriana'@'localhost';

-- 2.4
GRANT ALL PRIVILEGES ON geslibros TO 'rodrigotriana'@'localhost';

-- 2.5
GRANT INSERT, UPDATE, SELECT, DELETE ON geslibros.clientes TO 'rodrigotriana'@'localhost';

-- 2.6
GRANT ALTER, DELETE, INDEX, INSERT, SELECT, UPDATE ON geslibros.libros TO 'rodrigotriana'@'localhost';

-- 2.7
GRANT SELECT(cantidad, precio, importe)
	ON geslibros.lineasventas TO 'romerocurro'@'localhost';
    
-- 2.8

GRANT SELECT(isbn, ean, titulo, precio_coste, previo_venta, stock),
	UPDATE(precio_coste, previo_venta, stock)
	ON geslibros.libros TO 'romerocurro'@'localhost';


-- 3. Revocación de privilegios
-- Revocar los siguientes privilegios al usuario juansierra

-- 3.1
REVOKE SELECT, UPDATE, DELETE on maratoon from 'juansierra'@'localhost';
revoke SELECT, UPDATE, DELETE on geslibros from 'juansierra'@'localhost';

-- 3.2
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'juansierra'@'localhost';

-- 3.3
revoke select, insert, delete, update on geslibros.libros from 'juansierra'@'localhost';
revoke select, insert, delete, update on geslibros.autores from 'juansierra'@'localhost';
revoke select, insert, delete, update on geslibros.editoriales from 'juansierra'@'localhost';


-- 4. Cambiar password
-- Se desea cambiar el password al usuario rodrigotriana siendo el nuevo password '21436587'.

SET PASSWORD FOR 'rodrigotriana'@'localhost' = PASSWORD('21436587');


-- 5. Transacciones
-- Se van a realizar una actualización importante sobre la tabla libros de la base de datos geslibros, con objeto de mantener la integridad y consistencia de la base de datos se desean incluir dichas actualizaciones en una transacción.
-- Las tareas a realizar son las siguientes:

use geslibros;
-- Inicia una transacción
start transaction;
-- Actualiza el stock de todos los libros de la editorial paraninfo en 10 unidades.
update libros set stock = stock + 10 where editorial_id in (select id from editoriales where nombre like '%paraninfo%' limit 1);
-- Disminuye el precio de coste de todos los libros en un 0,5 %.
update libros set precio_coste = precio_coste * 0.995;
-- Disminuye el precio de venta de todos los libros, excepto los de la editorial paraninfo, en un 5%
update libros set precio_coste = precio_coste * 0.95 where editorial_id != (select id from editoriales where nombre like '%paraninfo%' limit 1);
-- Elimina todos los libros que no se hayan vendido (no se encuentren en líneas ventas)
delete from libros where id not in (select libro_id from lineasventas);
-- Acabar de forma satisfactoria esta transacción.
commit;


-- 6. Bloqueo
-- Sobre la base de datos geslibros se pide:
use geslibros;

-- Bloquea a modo lectura las tablas libros, autores, ventas y lineasventas
LOCK TABLES libros READ, autores READ, ventas READ, lineasventas READ;

-- Bloquea a modo escritura editoriales, clientes, ventas
LOCK TABLES editoriales WRITE, clientes WRITE, ventas WRITE;

-- Desbloque las tablas anteriores.
UNLOCK TABLES;

-- 7. Bloqueo y Transacción

-- Se desea realizar una importante actualización sobre los libros de la editorial MCGRAWHILL. 
-- El proceso a realizar consiste en incrementar su precio de coste en un 10% e incrementar el precio de venta en 10 €. 
-- El proceso ha de estar incluido en una transacción y durante dicha transacción se deberá bloquear de modo exclusivo todos los libros de la editorial MCGRAWHILL, y a continuación proceder a la actualización de los precios. 

START TRANSACTION;
SELECT * FROM libros WHERE editorial_id = 2 FOR UPDATE;
UPDATE libros SET precio_coste = precio_coste * 1.10,
precio_venta = precio_venta + 10 WHERE editorial_id = 2;
COMMIT;

-- 8. Funciones Aleatorias
-- Realizar con SELECT para que devuelva las siguientes expresiones:

-- Devolver número aleatorio entre 0 y 10
select floor(rand() * 11);
-- Devolver número aleatorio 1 y 49
select ceiling(rand() * 49);
-- Devolver número aleatorio entre 0 y 1
select floor(rand() * 2);
-- Devolver número aleatorio entre 1 y 100
select ceiling(rand() * 100);
--  Devolver número aleatorio entre 0 y 99
select floor(rand() * 100);

-- 9. Funciones de Cadena
-- Dada como cadena el siguiente resultado de un partido de fútbol 'Real Madrid 3 - Manchester City 1' se pide:

-- Devolver la cadena en orden inverso - Manchester City 1 - Real Madrid 3
select concat_ws(	' - ', 
					substring_index('Manchester City 1 - Real Madrid 3', ' ', 3),
					substring_index('Manchester City 1 - Real Madrid 3', ' ', -3));
-- Devolver los goles del equipo de casa - 3
select SUBSTRING_INDEX(SUBSTRING_INDEX('Real Madrid 3 - Manchester City 1', ' ', 3), ' ', -1);
-- Devolver los goles del equipo de fuera - 1
select SUBSTRING_INDEX('Real Madrid 3 - Manchester City 1', ' ', -1);
-- Devolver el nombre del equipo que pasó la eliminatoria con un nuevo milagro - Real Madrid
select SUBSTRING_INDEX('Real Madrid 3 - Manchester City 1', ' ', 2);


-- 10. Funciones de Fecha y Hora
-- Devuelve la fecha actual a partir de los siguientes requisitos

-- Con el siguiente formato 'Friday 05 may 2022'
select DATE_FORMAT(NOW(), '%W %d %M %Y');
-- Que fecha corresponde si le sumamos a la fecha actual 20 años 1 mes 3 días y 6 horas.
select NOW() + interval 20 year + interval 1 month + interval 3 day + interval 6 hour; 
-- Devuelve el último día del mes en curso
select LAST_DAY(NOW());
-- Devuelve el número de día del año
select DAYOFYEAR(NOW());

-- 11. Importación y exportación
-- 11.1
SELECT 
    l.id,
    l.titulo,
    a.nombre autor,
    e.nombre editorial,
    l.fecha_edicion,
    l.precio_coste,
    l.Precio_venta
FROM
    libros AS l
        INNER JOIN
    autores AS a ON l.autor_id = a.id
        INNER JOIN
    editoriales AS e ON l.editorial_id = e.id
WHERE
    e.nombre LIKE '%MCGRAWHILL%'
ORDER BY l.id INTO OUTFILE 'C:\librosmcgrawhill.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';


-- 11.2
SELECT 
    l.id,
    l.titulo,
    a.nombre autor,
    e.nombre editorial,
    l.fecha_edicion,
    l.precio_coste,
    l.Precio_venta
FROM
    libros AS l
        INNER JOIN
    autores AS a ON l.autor_id = a.id
        INNER JOIN
    editoriales AS e ON l.editorial_id = e.id
WHERE
    e.nombre LIKE '%RA-MA%'
ORDER BY l.id INTO OUTFILE 'C:\\Users\\Juan Carlos\\Downloads\\librosrama.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 11.3
-- C:\Users\Juan Carlos\Downloads
LOAD DATA INFILE 'C:\\Users\\Juan Carlos\\Downloads\\autores.csv' IGNORE INTO TABLE geslibros.autores FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 11.4
-- fichero adjunto clientes.xml

-- 11.5
LOAD XML INFILE 'C:\\Users\\Juan Carlos\\Downloads\\clientes.xml' INTO TABLE geslibros.clientes ROWS
IDENTIFIED BY '<regclientes>';

-------------------------------

-- 12.1 

-- mysqldump -h localhost -u root -p --xml --databases geslibros maratoon> ejercicio121.xml
-- mysqldump -h localhost -u root -p --all-databases>ejercicio22.sql
