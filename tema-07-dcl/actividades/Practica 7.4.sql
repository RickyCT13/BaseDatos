# Práctica 7.4 - Transacciones
# Ricardo Moreno Cantea, 1ºDAW

USE geslibros;

show variables like 'AUTOCOMMIT';
set AUTOCOMMIT = 0;

# Realizar transacciones
/* 
1. Incluye en una transacción un proceso que realice las siguientes actualizaciones:

Todos los libros de tema Novela se ponen en oferta y se decrementa el precio en un 10%
Los libros de la editorial Anaya se incrementa el precio en un 6% mientras que el resto de editoriales se reduce en un 4,5%. 
*/
START TRANSACTION;
UPDATE libros 
SET 
    precio_venta = (precio_venta * 0.9)
WHERE
    EXISTS( SELECT 
            libro_id
        FROM
            libros_temas
        WHERE
            tema_id = 3);

UPDATE libros 
SET 
    precio_venta = (precio_venta * 1.06)
WHERE
    editorial_id = (SELECT 
            id
        FROM
            editoriales
        WHERE
            nombre = 'Anaya');

UPDATE libros 
SET 
    precio_venta = (precio_venta * 0.955)
WHERE
    editorial_id = ANY (SELECT 
            id
        FROM
            editoriales
        WHERE
            nombre != 'Anaya');

SELECT 
    *
FROM
    libros;
ROLLBACK;

START TRANSACTION;
INSERT INTO libros VALUES (22, 9784848170877, null, 'Bases de datos NoSQL', 5, 6, 15.00, 17.50, 7, 5, 23, 2020-08-12, default, default), (23, 4848170897877, null, 'Programación Orientada a Objetos, Material Teórico', 5, 5, 20.34, 27.50, 12, 5, 25, 2022-05-13, default, default);
select * from libros;

insert into ventas values (12, 3, 2023-01-20, 136.12, 28.59, 164.71, now(), now());
insert into lineasventas values (42, 12, 1, 22, 0.210, 3, 17.50, 63.53, now(), now()), (43, 12, 2, 11, 0.210, 1, 28.62, 34.63, now(), now()), (44, 12, 3, 23, 0.210, 3, 17.50, 63.53, now(), now());
commit;
# Linea 1: 3 libros primero * 17.50 = 52.5 * 1.21 = 63.53
# Linea 2: 1 libro phpmysql * 28.62 = '' * 1.21 = 34.63
# Linea 3: 2 libros segundo * 27.50 = 55 * 1.21 = 66.55

# importe bruto = 136.12
# importe iva = 28.59
# importe tot = 164.71

/*
5. Incluye en una transacción las siguientes operaciones sobre la base de datos geslibros:

Insertar dos libros
Insertar dos clientes
Crear SAVEPOINT a
Actualizar los precios de todos los libros en 10% de incremento
Crear SAVEPOINT b
Eliminar los libros no vendidos
Deshacer a partir del SAVEPOINT a
Comprobar 
*/
START TRANSACTION;
select * from libros;
INSERT INTO libros VALUES (24, '6165654654145', null, 'Algoritmia Avanzada en Java', '5', '4', '12.13', '15.00', '12', '30', '10', '2023-01-25', now(), now());

select * from libros;

select * from clientes;

INSERT INTO clientes VALUES (null, 'Pedro Pérez', 'C/Huelva 4', 'Villamartín', '11650', '11', '44654645F', '645454545', '', 'perperez@sucorreo.es', now(), now()), (null, 'Ramón Pérez', 'C/Huelva 4', 'Villamartín', '11650', '11', '51457841Z', '725725725','', 'ramonperez@sucorreo.es', now(), now());

select * from clientes;

SAVEPOINT a;

UPDATE libros 
SET 
    precio_venta = (precio_venta * 1.1);
select * from libros;

SAVEPOINT b;

delete from libros where not exists (select libro_id from lineasventas);
select * from libros;

rollback to a;

select * from libros;

commit;


