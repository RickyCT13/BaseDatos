# Práctica 7.5 Parte 1: Operaciones del usuario ubrique01
# Ricardo Moreno Cantea, 1ºDAW

USE geslibros;

LOCK TABLE clientes read;

SELECT * from libros;

unlock tables;

select * from libros;

lock table libros read;

START TRANSACTION;
BEGIN;

SELECT precio_venta from libros for update;

UPDATE libros set precio_venta = precio_venta * 0.7;

commit;
exit;
