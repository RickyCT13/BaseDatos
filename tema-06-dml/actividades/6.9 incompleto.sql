-- Práctica 6.9: Consultas multitabla avanzadas

USE Empresa;

-- 1. Empleados

SELECT 
    emp.id,
    emp.nombre,
    emp.apellidos,
    emp.salario,
    emp.departamento_id 'id dep.',
    dep.nmbre 'Nombre dep.'
FROM
    empleados emp
        INNER JOIN
    departamentos dep ON emp.departamento_id = dep.id
ORDER BY id ASC;

-- 2. Departamentos

SELECT 
    dep.id,
    dep.nmbre,
    dep.localizacion,
    dep.componentes,
    dep.jefe_departamento_id,
    emp.apellidos,
    emp.nombre
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON dep.jefe_departamento_id = emp.id
ORDER BY dep.nmbre ASC;

-- 3. Empleados con supervisor
SELECT 
    emp.id,
    emp.nombre,
    emp.apellidos,
    emp.nss,
    emp.salario,
    emp.nombre,
    emp.apellidos

