# Práctica 7.5 Parte 2: Operaciones del usuario arcos01
# Ricardo Moreno Cantea, 1ºDAW

USE geslibros;

SELECT * FROM clientes where poblacion = 'Guadalajara';

INSERT INTO clientes values(NULL, 'CEIP Torrevieja', 'C/Torrevieja 17', 'Villamartín', '11650', '11', '1919919Z', '999012021', '912012032', 'ceiptvieja@gmail.com', default, default);

lock table libros write;

insert into libros (id) values (null);

unlock tables;

SET AUTOCOMMIT = OFF;
SHOW VARIABLES LIKE 'autocommit';

START TRANSACTION;
BEGIN;

SELECT * from edtoriales lock in share mode;
SELECT * from autores lock in share mode;

insert into libros(id, titulo) values (null, 'libro1'), (null, 'libro2');
commit;
exit;