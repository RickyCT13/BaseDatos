-- Trabajo Tema 7. Lenguaje SQL-DCL. Funciones y Administración
-- Alumno: Juana María Cañamaque Sánchez 1ºDAW

-- SI QUEREMOS ELIMINAR USUARIO:
-- DROP USER juanicañamaque@localhost;

-- 1. Crear usuarios
-- *****************
-- Se pide crear un usuario mediante la sentencia SQL correspondiente a partir de los siguientes requisitos:
-- 		- Nombre de usuario: tu propio nombre seguido del primer apellido, todo junto y en minúsculas. Por ejemplo en mi caso el nombre de usuario sería juancarlosmoreno
-- 		- Password: el password será 1234567 pero ha de ejecutarse cifrado, por lo que deberá obtenerse la cadena cifrada.
-- 		- Privilegios: este usuario no tendrá ningún privilegio, sólo podrá acceder a la base de datos de testeo
-- 		- Nota: se ha de adjuntar la sentencia SQL usada para obtener la cadena encriptada del password.
-- --------------
-- ==>PASO 1: Obtener la cadena encriptada:
-- en un script aparte ponermos lo siguiente:
-- SELECT PASSWORD('1234567');
-- la password encriptada que nos devuelve es: *6A7A490FB9DC8C33C2B025A91737077A7E9CC5E5
-- ==>PASO 2: Creamos el usuario:
CREATE USER juanicañamaque@localhost IDENTIFIED BY PASSWORD '*6A7A490FB9DC8C33C2B025A91737077A7E9CC5E5'; -- utilizamos la cadena encriptada de arriba
-- ==>PASO 3: Comprobamos que haya creado el usuario:
SELECT * FROM mysql.user;
-- ==>PASO 4: Creamos la conexión y comprobamos que funciona:
-- En Home (casita), le damos al signo +, ponemos Connection Name: juanicañamaque, y User Name: juanicañamaque
-- Al abrir la conexión nos pide la contraseña: 1234567, y vemos que en SCHEMAS a la izquierda sólo tiene la base de datos test
-- --------------




-- 2. Asignación de privilegios
-- ****************************
-- Los scripts no tienen porque guardar relación unos con otros, por lo tanto puede ocurrir que dos sentencias sean incompatibles y den problemas a la hora de ejecutarse, de todas formas si queremos comprobar que funciona un scripts deberá reinstalarse de nuevo la base de datos para que no conste la anterior.
USE geslibros;

-- Sobre el usuario creado en el apartado anterior se pide:


-- 2.1.Asignar al usuario privilegios de superadministrador, es decir, todos los privilegios, sobre todas las bases de datos, incluyendo el privilegio GRANT
-- --------------
-- ==>PASO 1: Compruebo los privilegios que tiene antes de modificarlos:
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de columnas, tablas y base de datos
-- ==PASO 2: Le otorgo todos los privilegios, incluído Grant:
GRANT ALL PRIVILEGES ON *.* TO juanicañamaque@localhost WITH GRANT OPTION;
-- ==>PASO 3: Vuelvo a comprobar privilegios:
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de columnas, tablas y base de datos
-- También se puede ver en el MENÚ -> SERVER, USERS AND PRIVILEGES
-- (Seleccionamos el usuario juanicañamaque y pulsamos Administrative Roles; vemos que tiene todos los privilegios incluído GRANT) -- *****PARA VER TODOS LOS PRIVILEGIOS
-- --------------


-- 2.2.Asignar todos los privilegios sobre la base de datos geslibros.
-- --------------
-- ==>PASO 1: Otorgar todos los privilegios sobre base de datos geslibros y comprobar:
GRANT ALL ON geslibros.* TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de columnas, tablas y base de datos
select * from mysql.db;
-- --------------


-- 2.3.Asignar todos los privilegios sobre las tablas libros, editoriales y clientes de la base de datos geslibros.
-- --------------
-- ==>PASO 1: Asignar privilegios sobre tablas libros, editoriales y clientes de geslibros y comprobar:
GRANT ALL ON geslibros.libros TO juanicañamaque@localhost;
GRANT ALL ON geslibros.editoriales TO juanicañamaque@localhost;
GRANT ALL ON geslibros.clientes TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de columnas, tablas y base de datos
select * from mysql.tables_priv;
-- --------------


-- 2.4.Asignar privilegios para que sólo pueda consultar en la tabla libros, editoriales y clientes de la base de datos geslibros
-- --------------
-- ¡¡¡OJO!!!=================>PASO 1: Para poder hacer este ejercicio necesito quitarle los privilegios del ejercicio anterior y compruebo que se los quite
-- (SI NOS LOS ELIMINO ANTES, COMO SE PISAN LOS PRIVILEGIOS LOS NUEVOS NO APARECEN):
REVOKE ALL ON geslibros.libros FROM juanicañamaque@localhost;
REVOKE ALL ON geslibros.editoriales FROM juanicañamaque@localhost;
REVOKE ALL ON geslibros.clientes FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de tabla vemos que ya no tiene privilegios
-- ==>PASO 1: Asignar privilegios a tablas libros, editoriales y clinetes, pero sólo de consulta:
GRANT SELECT ON geslibros.libros TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.editoriales TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.clientes TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;  -- a nivel de columnas, tablas y base de datos
-- --------------


-- 2.5.Asignar privilegios para que pueda acceder a consultar y actualizar las columnas nombre, direccion, poblacion, codpostal, telefono y email de la tabla clientes correspondiente a la base de datos geslibros.
-- --------------
-- ==>PASO 1: Asignar privilegios de columnas para consultar y actualizar las columnas
GRANT SELECT (Nombre, Direccion, Poblacion, c_postal, Telefono, Email), UPDATE (Nombre, Direccion, Poblacion, c_Postal, Telefono, Email) ON geslibros.clientes TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;  -- a nivel de columnas, tablas y base de datos
select * from mysql.columns_priv;
-- --------------


-- 2.6.Asignar privilegios de forma que sólo podrá consultar las columnas id, titulo, precio_venta, fechaedicion y actualizar la columna precio_venta y titulo de la tabla libros correspondiente a la base de datos geslibros.
-- --------------
-- ==>PASO 1: Asignar privilegios de columnas para consultar(id, titulo, precio_venta, fechaedicion) y actualizar(precio_venta, titulo)
GRANT SELECT (id, Titulo, Precio_venta, fecha_edicion), UPDATE (Precio_venta, Titulo) ON geslibros.libros TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de columnas, tablas y base de datos
-- --------------


-- 2.7.Asignar todos los privilegios para que pueda acceder a modo consulta a todas las tablas de la base de datos geslibros excepto a ventas y lineasventas
-- --------------
-- ==>PASO 1: Asignar privilegios de consulta a todas las tablas (escepto ventas y lineasventas):
GRANT SELECT ON geslibros.autores TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.clientes TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.editoriales TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.libros TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.libros_temas TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.provincias TO juanicañamaque@localhost;
GRANT SELECT ON geslibros.temas TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost; -- a nivel de columnas, tablas y base de datos
-- --------------





-- 3. Eliminar privilegios
-- ***********************
-- Eliminar los siguientes privilegios al usuario creado en el primer apartado:


-- 3.1.Quitar privilegio GRANT
-- --------------
-- ==>PASO 1: Eliminar privilegio GRANT, el resto de privilegios de le dejan:
REVOKE GRANT OPTION ON *.* FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- --------------


-- 3.2.Quitar todos los privilegios sobre todas las bases de datos
-- --------------
-- ==>PASO 1: Como arriba se habían quedado el resto de privilegios, sólo tengo que quitarlos ahora y comprobar:
REVOKE ALL PRIVILEGES ON *.* FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- --------------


-- 3.3.Quitar todos los privilegios sobre la base de datos geslibros
-- --------------
-- ==>PASO 1: Quito todos los privilegios sobre geslibros
REVOKE ALL ON geslibros.* FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- --------------


-- 3.4.Quitar el privilegio de actualización (UPDATE) sobre la tabla libros de la base de datos geslibros.
-- --------------
-- ==>PASO 1: Quito el privilegio UPDATE sobre libros de geslibros
REVOKE UPDATE ON geslibros.libros FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost; -- Se quedan todos menos update
-- --------------


-- 3.5.Quitar el privilegio de consulta sobre las columnas id, titulo, precio_venta de la tabla libros correspondiente a la base de datos geslibros.
-- --------------
-- ==>PASO 1: Quitamos el privilegio de consulta de esas tres columnas
REVOKE SELECT (id, Titulo, Precio_venta) ON geslibros.libros FROM juanicañamaque@localhost; -- (se queda FechaEdicion)
SHOW GRANTS FOR juanicañamaque@localhost;
-- --------------


-- 3.6.Quitar el privilegio de acceso a todas las tablas de la base de datos geslibros excepto a las tablas libros y clientes.
-- --------------
-- ==>PASO 1: Quitamos el privilegio de todas las tablas de geslibros, escepto libros y clientes (son las que se quedan)
REVOKE SELECT ON geslibros.autores FROM juanicañamaque@localhost;
REVOKE SELECT ON geslibros.editoriales FROM juanicañamaque@localhost;
REVOKE SELECT ON geslibros.libros_temas FROM juanicañamaque@localhost;
REVOKE SELECT ON geslibros.provincias FROM juanicañamaque@localhost;
REVOKE SELECT ON geslibros.temas FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- ¡¡¡OJO!!!====================>PASO 2: Para que el ejercicio siguiente se vea más claro, voy a eliminar el resto de permisos que nos quedan:
REVOKE SELECT (FechaEdicion) ON geslibros.libros FROM juanicañamaque@localhost;
REVOKE SELECT ON geslibros.libros FROM juanicañamaque@localhost;
REVOKE SELECT (Direccion, Nombre, Email, Poblacion, CodPostal, Telefono), UPDATE (Direccion, Nombre, Email, Poblacion, CodPostal, Telefono) ON geslibros.clientes FROM juanicañamaque@localhost;
REVOKE SELECT ON geslibros.clientes FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- --------------


-- 3.7.Quitar el privilegio de consulta, actualización y eliminación sobre las tablas libros, clientes, editoriales y autores de la base de datos geslibros.
-- --------------
-- ¡¡¡OJO!!!=========>PASO 1: COMO EN EL EJERCICIO ANTERIOR (2.4) LOS TUVE QUE QUITAR PARA QUE FUNCIONARA, NO NOS APARECEN. VOY A INSERTAR ESTOS PRIVILEGIOS PARA DESPUÉS QUITARLOS:
GRANT SELECT, UPDATE, DELETE ON geslibros.libros TO juanicañamaque@localhost;
GRANT SELECT, UPDATE, DELETE ON geslibros.clientes TO juanicañamaque@localhost;
GRANT SELECT, UPDATE, DELETE ON geslibros.editoriales TO juanicañamaque@localhost;
GRANT SELECT, UPDATE, DELETE ON geslibros.autores TO juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- ==>PASO 2: Quitamos los privilegios de consulta, actualización y eliminación
REVOKE SELECT, UPDATE, DELETE ON geslibros.libros FROM juanicañamaque@localhost;
REVOKE SELECT, UPDATE, DELETE ON geslibros.clientes FROM juanicañamaque@localhost;
REVOKE SELECT, UPDATE, DELETE ON geslibros.editoriales FROM juanicañamaque@localhost;
REVOKE SELECT, UPDATE, DELETE ON geslibros.autores FROM juanicañamaque@localhost;
SHOW GRANTS FOR juanicañamaque@localhost;
-- --------------




-- 4. Cambiar password
-- *******************
-- Se desea cambiar el password al usuario creado en el apartado 1. El nuevo password será '21436587'. Se ha de mostrar la obtención del password cifrado.
-- --------------
-- ==>PASO 1: Cambiamos la password en un script APARTE (--> ¡¡¡OJO!!! NO SE ENCRIPTA ANTES, LO HACE DIRECTAMENTE):
SET PASSWORD FOR juanicañamaque@localhost = PASSWORD('21436587');
SELECT * FROM mysql.user; -- vemos que se ha guardado encriptada ya: *1DEB27DD74919473A2C69FDFA8E46B08E9F16547
-- ==>PASO 2: Abrimos la conexión para ver si funciona:
-- En Home, doble clic sobre la conexión y ya nos pide la contraseña nueva
-- --------------




-- 5. Sorteo lotería primitiva
-- ***************************
-- Descargar el fichero loteriaprimitiva.sql e instalar la base de datos loteriaprimitiva.
USE loteriaprimitiva;

-- Se pide incluir en una transacción una simulación de dos sorteos, es decir, añadir dos nuevos registros en la tabla sorteos de la base de datos loteriaprimitiva. Se tendrán en cuenta los siguientes requisitos:
-- 		- Se ha de iniciar una transacción
-- 		- La fecha se ha de corresponder con la fecha y hora actual
-- 		- Los números de la lotería primitiva (num1, num2, ...) se han de corresponder con números aleatorios entre 1 y 49. No se tendrá en cuenta si el número se ha repetido.
-- 		- El número complementario es un número aleatorio entre 1 y 49 también
-- 		- El reintegro es un número aleatorio entre 0 y 9
-- 		- Confirmar una vez finalizada la transacción
-- --------------
START TRANSACTION; -- Iniciamos la transacción

INSERT INTO sorteos VALUES -- ceiling redonda por lo alto (1 a 49) y floor redondea por lo bajo (0 a 9)
(null, NOW(), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), FLOOR(RAND()*10)),
(null, NOW(), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), CEILING(RAND()*49), FLOOR(RAND()*10));

COMMIT; -- Confirmamos la transacción
-- --------------




-- 6. Base de datos maratoon.
-- *************************
-- Todos los script de esta sección se realizarán sobre la base de datos maratoon.
USE maratoon;

-- 6.1.Mediante un ALTER TABLE se deben añadir a la tabla corredores las siguientes columnas:
-- 		- apellido1 - tipo cadena 40
-- 		- apellido2 - tipo cadena 40
-- 		- codigo - tipo CHAR 11
-- --------------
ALTER TABLE corredores
	ADD COLUMN
    (apellido1 VARCHAR(40), apellido2  VARCHAR(40), codigo CHAR(13));
    -- PARA LOS NOMBRES COMPUESTOS EL CODIGO NECESITA LONGITUD ==> 13
    -- Añade tres columnas nuevas a corredores
-- --------------


-- 6.2.Actualiza las columnas apellidos1 y apellido2 a partir de la columna apellidos de la tabla corredores.
-- --------------
UPDATE Corredores 
SET 
    apellido1 = SUBSTRING_INDEX(Apellidos, ' ', 1), -- Para el apellido 1 muestro la cadena de izquierda a derecha hasta llegar al primer espacio (iz -> der porque el 1 es positivo)
    apellido2 = SUBSTRING_INDEX(Apellidos, ' ', - 1); -- Para el apellido 2 muestro la cadena de derecha a izquierda hasta llegar al primer espacio (der -> iz porque el 1 es negativo)
-- --------------


-- 6.3.Actualizar la columna código de todos los corredores, teniendo en cuenta el siguiente criterio:
-- 		- todos los caracteres deben ir en mayúscula
-- 		- año de nacimiento (4 digitos)
-- 		- /
-- 		- iniciales nombre (2 caracteres)
-- 		- iniciales apellido1 (2 caracteres)
-- 		- iniciales apellido2 (2 caracteres)
-- --------------
-- OPCIÓN A: Sin tener en cuenta Nombres Compuestos
UPDATE Corredores 
SET 
    codigo = UPPER(CONCAT(YEAR(FechaNacimiento), -- Muestro todo en mayúsculas y comienzo a contatenar. Primero el año extraído de FechaNacimiento
                    '/', -- segundo le concateno la barra
                    LEFT(Nombre, 2), -- tercero le concateno los dos primeros dígitos de la izquierza del Nombre
                    LEFT(apellido1, 2), -- cuatro le concateno los dos primeros dígitos de la izquierza del apellido1
                    LEFT(apellido2, 2))); -- quinto le concateno los dos primeros dígitos de la izquierza del apellido2


-- OPCIÓN B:Teniendo en cuenta NOMBRES COMPUESTOS
-- IGUAL PERO CONTROLANDO QUE EL NOMBRE SALGA TAMBIÉN CUANDO SEA COMPUESTO
UPDATE Corredores 
SET 
    codigo = UPPER(CONCAT(YEAR(FechaNacimiento), -- Muestro todo en mayúsculas y comienzo a contatenar. Primero el año extraído de FechaNacimiento
                    '/', -- segundo le concateno la barra
                    CONCAT(LEFT(Nombre, 2), TRIM(SUBSTRING(nombre,LOCATE(' ', Nombre), 3))), -- tercero añade los dos caracteres del nombre y si es compuesto también añade los dos caracteres del compuesto
                    LEFT(apellido1, 2), -- cuatro le concateno los dos primeros dígitos de la izquierza del apellido1
                    LEFT(apellido2, 2))); -- quinto le concateno los dos primeros dígitos de la izquierza del apellido2
-- --------------


-- 6.4.Crear un script para actualizar la columna edad a partir de la fecha de nacimiento.
-- --------------
UPDATE Corredores 
SET 
    Edad = TIMESTAMPDIFF(YEAR, FechaNacimiento, NOW());
    -- Nos devuelve la diferencia (TIMESTAMDIFF) entre las dos fechas en formato de AÑOS (YEAR). ¡¡¡OJO!!! La fecha actual siempre va a la derecha
-- --------------


-- 6.5.Actualizar la columna categoria_id a partir de la edad, teniendo en cuenta el campo descripción de la tabla categorías.
-- --------------
UPDATE Corredores 
SET 
    Categoria_id = 1
    WHERE Edad < 12;

UPDATE Corredores 
SET 
    Categoria_id = 2
    WHERE Edad BETWEEN 12 AND 14; -- CON BETWEEN ENTRAN EL 12 Y EL 14 (menores de 15)

UPDATE Corredores 
SET 
    Categoria_id = 3
    WHERE Edad BETWEEN 15 AND 17; -- (menores de 18)

UPDATE Corredores 
SET 
    Categoria_id = 4
    WHERE Edad BETWEEN 18 AND 29; -- (menores de 30)

UPDATE Corredores 
SET 
    Categoria_id = 5
    WHERE Edad BETWEEN 30 AND 39; -- (menores de 40)
    
UPDATE Corredores 
SET 
    Categoria_id = 6
    WHERE Edad BETWEEN 40 AND 49; -- (menores de 50)

UPDATE Corredores 
SET 
    Categoria_id = 7
    WHERE Edad BETWEEN 50 AND 59; -- (menores de 60)
    
UPDATE Corredores 
SET 
    Categoria_id = 8
    WHERE Edad >= 60; -- (60 años o mayores)
-- --------------


-- 6.6.Ejecutar el proceso 6.4 y 6.5 dentro de una transacción en la que previamente a la actualización de la tabla corredores (edad y categoria_id)
-- se deberá bloquear en modo UPDATE todos los registros de la tabla categorias para que no pueda ser modificada durante dicho proceso.
-- --------------
 
 
START TRANSACTION; -- Empezamos la transacción

SELECT * FROM categorias FOR UPDATE; -- Boqueo exclusivo(ix) (bloqueamos los registros de categorias mientras que los vamos a estar actualizando)   

-- A continuación hacemos las actualizaciones
UPDATE Corredores 
SET 
    Edad = TIMESTAMPDIFF(YEAR, FechaNacimiento, NOW());
    
UPDATE Corredores 
SET 
    Categoria_id = 1
    WHERE Edad < 12;

UPDATE Corredores 
SET 
    Categoria_id = 2
    WHERE Edad BETWEEN 12 AND 14; -- CON BETWEEN ENTRAN EL 12 Y EL 14 (menores de 15)

UPDATE Corredores 
SET 
    Categoria_id = 3
    WHERE Edad BETWEEN 15 AND 17; -- (menores de 18)

UPDATE Corredores 
SET 
    Categoria_id = 4
    WHERE Edad BETWEEN 18 AND 29; -- (menores de 30)

UPDATE Corredores 
SET 
    Categoria_id = 5
    WHERE Edad BETWEEN 30 AND 39; -- (menores de 40)
    
UPDATE Corredores 
SET 
    Categoria_id = 6
    WHERE Edad BETWEEN 40 AND 49; -- (menores de 50)

UPDATE Corredores 
SET 
    Categoria_id = 7
    WHERE Edad BETWEEN 50 AND 59; -- (menores de 60)
    
UPDATE Corredores 
SET 
    Categoria_id = 8
    WHERE Edad >= 60; -- (60 años o mayores)    

-- UNLOCK TABLES; -- El bloqueo exclusivo las desbloquea automáticamente al hacer el commit (no hace falta el unlock)

COMMIT; -- Por último confirmamos para que guarde los cambios de la transacción
-- --------------




-- 7. Exportar/Importar datos
-- **************************
-- Todos los ejercicios están basados en la base de datos geslibros.
USE geslibros;


-- 7.1.Exportar en el fichero clientesUbrique.csv todos los clientes de Ubrique.
-- El fichero de exportación como se indica ha de estar en formato csv, separación de campos ';' y '\n' como separador de líneas o registros,
-- además se usará "" para expresar los varlores no numéricos.
-- --------------
SELECT * FROM geslibros.clientes WHERE Poblacion LIKE '%Ubrique%'
INTO OUTFILE 'C:/Users/Usuario/Desktop/clientesUbrique.csv' -- exportar a formato csv en el escritorio
FIELDS TERMINATED BY ';' -- separador de campos
OPTIONALLY ENCLOSED BY '\"' -- separador de campos que necesitan comillas como texto y fecha y hora
LINES TERMINATED BY '\n'; -- saltos de línea
-- --------------


-- 7.2.Exportar todos los autores en el fichero autores.xml, formato xml
-- --------------
SELECT * FROM geslibros.autores
INTO OUTFILE 'C:/Users/Usuario/Desktop/autores.xml' -- exportar a formato csv en el escritorio
FIELDS TERMINATED BY ';' -- separador de campos
OPTIONALLY ENCLOSED BY '\"' -- separador de campos que necesitan comillas como texto y fecha y hora
LINES TERMINATED BY '\n'; -- saltos de línea

-- para verlo lo puedo abrir facilmente con el notepad o con excel
-- --------------


-- 7.3.Realizar una copia de seguridad de la base de datos geslibros incluir tanto datos como estructura.
-- --------------
		-- (si quiero guardar los datos y la estructura no hay que poner ningún parámetro específico)
		-- (si quiero sólo los datos y no la estructura ponemos -t)(-t copia sólo los datos, no la estructura como create table,...)
		-- (si sólo quiero la estructura ponemos --no-data)

-- Para realizar copias de seguridad hay que hacerlo con mysqldump (DESDE LA CONSOLA DE COMANDOS)
-- 1º Nos vamos a la carpeta C:\xampp\mysql\bin
-- 2º En esta carpeta, borro la ruta y escribo cmd, y pulso Intro
-- 3º Nos aparecerá la consola de comandos en ms-dos
-- 4º Escribimos en la consola:
-- (En este caso exportamos en formato .sql, pero si quisiéramos exportarlo en formato XML, le ponemos destrás de la-p  --xml geslibros>)

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||| mysqldump -h localhost -u root -p geslibros>C:/Users/Usuario/Desktop/geslibros_copia.sql |||
-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

 -- cuando ponga Enter password le damos a Intro porque el usuario root que estamos usando no tiene contraseña
 -- Y ya nos ha generado en el escritorio nuestro copia de seguridad de geslibros
 -- Para salir de la consola ponemos exit y pulsamos Intro
-- --------------


-- 7.4.Crear un fichero libros.csv donde se incluyan datos válidos de al menos 4 libros.
-- --------------
-- Abrimos el notepad por ejemplo y escribimos los siguientes registros (sin las celdillas).
-- Una vez terminado guardamos el archivo en el escritorio con el nombre libros.csv

-- ################################################################################################################
-- NULL;"8498631124897";"7894287968881";"Vivir en tiempos del Coronavirus";3;5;12.05;14.58;17;1;32;2020-4-11
-- NULL;"1234997855672";"3122233696748";"Los que acabaron el curso";1;2;30;36.3;10;1;24;2020-4-15
-- NULL;"9722966778969";"5226444978446";"Este año sin vacaciones";3;2;8.25;9.98;15;1;21;2008-3-1
-- NULL;"9783397874326";"6229877777787";"Y a ver en invierno";2;5;6.1;7.38;16;1;21;2006-1-27
-- ################################################################################################################
-- (LOS CAMPOS DE TIPO DATE SE PONEN SIN COMILLAS)
-- --------------


-- 7.5.Importar los datos del archivo libros.csv a la tabla libros de la base de datos.
-- --------------
LOAD DATA INFILE 'C:/Users/Usuario/Desktop/libros.csv' IGNORE INTO TABLE geslibros.libros FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';
-- separación de campos por ; separación de campos de texto y fecha con ' ' (con lo que lo haya separado arriba) y final del registro salto de línea, hay que poner la ruta correcta
-- --------------



