-- Práctica 6.6: Funciones de Agregado
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW

USE Empresa;

-- 1. ORDER BY, LIMIT, ALL, DISTINCT

-- Obtener los 3 empleados con mayor salario

select * from Empleados order by salario desc limit 3;
select MAX(salario) from Empleados order by salario asc limit 3;

-- Obtener los 5 empleados con menor salario

select * from Empleados order by salario asc limit 5;

-- Obtener los empleados ordenados alfabéticamente

select * from Empleados order by nombre, apellidos asc;

-- Obtener los 3 primeros departamentos



-- Obtener los 3 empleados con mayores salarios del departamento 3