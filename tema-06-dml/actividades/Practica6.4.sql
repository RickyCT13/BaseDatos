-- Práctica 6.4 Sentencias Basicas DML - Geslibros
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW

USE geslibros;

INSERT INTO ventas VALUES 
(11, 6, CURRENT_DATE, 289.50, 60.80, 350.30, current_timestamp, current_timestamp);

INSERT INTO lineasventas VALUES
(38, 11, 1, 11, 0.21, 5, 30.00, 150.00, current_timestamp, current_timestamp),
(39, 11, 2, 12, 0.21, 10, 13.00, 130.00, current_timestamp, current_timestamp),
(40, 11, 3, 15, 0.21, 1, 9.50, 9.50, current_timestamp, current_timestamp);

UPDATE clientes 
SET 
    direccion = 'Pollígono Ansu Fati, Calle Messi, Nave 20'
WHERE
    nif = '23124234G' LIMIT 1;

UPDATE autores 
SET 
    premios = premios + ', Planeta'
WHERE
    id = 2 LIMIT 1;
  
UPDATE libros 
SET 
    precio_venta = precio_venta * 0.9;

UPDATE libros 
SET 
    precio_coste = precio_coste * 1.1
WHERE
    editorial_id = 5 AND editorial_id = 6;

UPDATE libros 
SET 
    precio_venta = precio_venta - 2.00
WHERE
    fecha_edicion < '2000-1-1';

DELETE FROM libros 
WHERE
    editorial_id = 5;

DELETE FROM editoriales 
WHERE
    id = 5;