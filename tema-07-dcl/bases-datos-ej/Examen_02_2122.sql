-- 1. Crear usuarios
-- Crear los siguientes usuario con indicador de creación en el servidor 'localhost':

-- Usuario 1:
-- Usuario: juanperezgarcia
-- Password encriptado: '*E1C7E9EEC093E671C26A95F8B15156170E46068B'

create user juanperezgarcia@locahost identified by password '*E1C7E9EEC093E671C26A95F8B15156170E46068B';

-- Usuario 2:
-- Usuario: robertomendoza
-- Password: 'laplazoleta35'

select password('laplazoleta35');
create user robertomendoza@locahost identified by password '*93417A54738E178C26561D5AABB67D67F63CEDE9';
create user robertomendoza@locahost identified by'laplazoleta35';

-- Usuario 3:
-- Usuario: juanpanadero
-- password: 'panconalmendras_123';

select password('panconalmendras_123');
create user juanpanadero@locahost identified by password '*EE8D13D8D16431E593AA9341F781E4930A4EEC95';

-- 2. Asignación de privilegios
-- Los scripts no tienen porque guardar relación unos con otros, por lo tanto puede ocurrir que dos sentencias sean incompatibles y den problemas a la hora de ejecutarse, 
-- Asignar los privilegios declarados en la siguiente tabla:
-- 1 

GRANT ALL on maratoon.* to juanperezgarcia@localhost;
GRANT ALL on geslibros.* to juanperezgarcia@localhost;
GRANT ALL on bancos.* to juanperezgarcia@localhost;

-- 2

GRANT ALL on *.* to robertomendoza@localhost with grant option;

-- 3

GRANT ALL on *.* to juanpanadero@localhost;

-- 4

GRANT insert, update, delete, select on bancos.clientes to juanperezgarcia@localhost;
GRANT insert, update, delete, select on bancos.cuentas to juanperezgarcia@localhost;

-- 5
 
GRANT update(cantidad) on bancos.movimientos to robertomendoza@localhost;


-- 6 

GRANT alter,delete,index,insert,select,update on bancos.* to juanpanadero@localhost;

-- 7

GRANT select(fechahora,concepto,cantidad,cuenta_id) on bancos.movimientos to robertomendoza@localhost;

-- 8

GRANT select(apellidos,nombre,telefono,ciudad,dni) on bancos.clientes to robertomendoza@localhost;

-- 9

GRANT update(saldo) on bancos.cuentas to robertomendoza@localhost;

-- 3. Revocación de privilegios
-- Revocar los siguientes privilegios

-- 1
revoke select,update,delete on bancos.movimientos from robertomendoza@localhost;
revoke select,update,delete on bancos.cuentas from robertomendoza@localhost;

-- 2
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'juanpanadero@localhost';

-- 3
revoke select,insert,delete,update on geslibros.libros from juanperezgarcia@localhost;
revoke select,insert,delete,update on geslibros.autores from juanperezgarcia@localhost;
revoke select,insert,delete,update on geslibros.editoriales from juanperezgarcia@localhost;
revoke select,insert,delete,update on geslibros.ventas from juanperezgarcia@localhost;
revoke select,insert,delete,update on geslibros.lineasventas from juanperezgarcia@localhost;


-- 4. Cambiar perfil
-- Realizar los siguientes cambios de perfil:
-- Se desea cambiar el nombre de usuario de juanperezgarcia por el de perezgarcia
RENAME USER 'juanperezgarcia@localhost' TO 'perezgarcia@localhost';
-- Se desea cambiar el password de juanpanadero por 'vivacadizoe' 
set password for 'juanpanadero@localhost' = password('vivacadizoe');

-- 5. Transacciones
-- Se van a realizar una actualización importante sobre la tabla libros de la base de datos geslibros, con objeto de mantener la integridad y consistencia de la base de datos se desean incluir dichas actualizaciones en una transacción.
-- Las tareas a realizar son las siguientes:

START TRANSACTION;
UPDATE libros SET stock_max = stock_max + 10;
UPDATE libros SET stock_min = stock_min + 5 WHERE editorial_id = 2;
UPDATE libros SET fecha_edicion = fecha_edicion + INTERVAL 1 YEAR;
UPDATE libros SET precio_venta = precio_venta * 1.05;
COMMIT;

-- 6. Bloqueo
-- Sobre la base de datos geslibros se pide:
-- Bloquea a modo lectura las tablas autores, clientes, editoriales y libros

LOCK TABLES autores READ, clientes READ, editoriales READ, libros READ;

-- Bloquea a modo escritura libros_temas, lineasventas, provincias, temas y ventas

LOCK TABLES libros_temas write, lineasventas WRITE, provincias WRITE, temas WRITE, ventas WRITE;

-- Desbloque las tablas anteriores.

UNLOCK TABLES;

 
-- 7. Bloqueo y Transacción
-- Se desea realizar una importante actualización sobre los libros de la editorial Anaya, la selección de los libros no se puede hacer mediante id de la editorial Anaya. 
-- Por lo tanto se pide iniciar una transacción para bloquear a modo exclusivo los libros de la editorial Anaya

START TRANSACTION;

SELECT * FROM libros WHERE editorial_id = ( SELECT id FROM editoriales WHERE nombre like '%Anaya%') FOR UPDATE;

UPDATE libros SET 
	precio_venta = precio_venta * 1.005,
    precio_coste = precio_coste * 1.10,
    stock = stock + 2
WHERE editorial_id = ( SELECT id FROM editoriales WHERE nombre like '%Anaya%');

COMMIT;


-- 8. Funciones Aleatorias
-- Simular el reparto aleatorio de 3 cartas de la baraja inglesa (1 - rombo, 2 - trébol, 3 - corazón y 4 - pica, las cartas 1 al 13).
-- Número aleatorio entero del 1 al 4 (vida)
select(ceiling(rand() *4));
-- Número aleatorio entero del 1 al 13
select(ceiling(rand() *13));


-- 9. Funciones de Cadena
-- Dada la cadena correspondiente a la URL: 'https://educacionadistancia.juntadeandalucia.es/centros/cadiz/course/basedatos2122'

-- 1
select(substring_index('https://educacionadistancia.juntadeandalucia.es/centros/cadiz/course/basedatos2122', '/', 3));
-- 2
select(substring_index(substring_index('https://educacionadistancia.juntadeandalucia.es/centros/cadiz/course/basedatos2122', '/', 4), '/', -1));
-- 3
select(substring_index(substring_index('https://educacionadistancia.juntadeandalucia.es/centros/cadiz/course/basedatos2122', '/', 5), '/', -1));
-- 4
select(substring_index('https://educacionadistancia.juntadeandalucia.es/centros/cadiz/course/basedatos2122', '/', -1));

-- 10. Funciones de Fecha y Hora
-- Devuelve la fecha actual a partir de los siguientes requisitos
-- Devuelve la edad de una persona que nació el '31/07/1967'

SELECT timestampdiff(YEAR, '1967/07/31', now() );

-- Dentro de 1 año, 5 meses y 3 días, en qué día de la semana estaremos.

SELECT NOW() + interval 1 year + INTERVAL 5 MONTH + interval 3 day;

-- Devuelve sólo el nombre del mes de la fecha hora actual

SELECT monthname(now());

-- Devuelve el cuatrimestre actual

select quarter(now());



-- 11. Importación y Exportación
-- Exportar todos los clientes de Ubrique - clientesubrique.csv
SELECT 
    *
FROM
    clientes
WHERE
    poblacion like '%Ubrique%' INTO OUTFILE 'd:\clientesubrique.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- Exportar todos los libros que no se han vendido - librosnovendidos.csv
SELECT 
    *
FROM
    libros lineasventas
WHERE
    id NOT IN (SELECT DISTINCT
            libro_id
        FROM
            lineasventas) INTO OUTFILE 'd:libros_no_vendidos.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- Importar:
-- Importar los datos del archivo adjunto autores.csv a la tabla autores de la base de datos geslibros.
LOAD DATA INFILE 'C:\\autores.csv' IGNORE INTO TABLE geslibros.autores FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

-- 12. Copia de Seguridad
-- Realizar una copia de seguridad de todas las bases de datos del servidor mysql
-- mysqldump -h localhost -u root -p  --all-databases> mysql.sql

-- Realizar una copia de seguridad de la base de datos geslibros
-- mysqldump -h localhost -u root -p --databases geslibros> geslibros.sql

-- Realizar una copia de seguridad de la tabla ventas de la base la base de datos geslibros
-- mysqldump -h localhost -u root -p --xml --databases geslibros --tables ventas> ventas.sql

