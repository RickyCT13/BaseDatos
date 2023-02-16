-- Práctica 6.8: Consultas Mutitabla Básicas

USE Empresa;
-- 1. Realiza un producto cartesiano entre las tablas departamentos y empleados.

SELECT 
    *
FROM 
	empleados,
    departamentos;

-- 2. A partir del ejercicio anterior obtén sólo los registros válidos, es decir, aquellos donde el empleado sólo está relacionado con el departamento al que pertenece.

SELECT 
    *
FROM
	empleados, 
	departamentos
   
WHERE
    empleados.departamento_id = departamentos.id;

-- 3. Realiza un producto cartesiano entre las tablas departamento y proyecto.

SELECT 
    *
FROM
	proyectos,
    departamentos;

-- 4. A partir del ejercicio anterior obtener los registros válidos, es decir, relacionar proyecto sólo con el departamento que lo está realizando.

SELECT 
    *
FROM
    proyectos,
    departamentos
    
WHERE
    proyectos.departamento_id = departamentos.id;

-- 5. Realiza un producto cartesiano entre las tablas empleados, departamentos y proyecto.

SELECT 
    *
FROM
    empleados,
    proyectos,
    departamentos;
    

-- 6. Realizar el producto cartesiano entre las tablas Empleado y Departamento en la que sólo se relacione a cada empleado con el departamento al que pertenece y además sólo mostrará aquellos cuyo Salario sea superior a 30000. 

SELECT 
    *
FROM
    empleados emp,
    departamentos dep
WHERE
    emp.departamento_id = dep.id
        AND salario > 30000;

-- Realización de las consultas anteriores con INNER JOIN;


-- 1. Realiza un producto cartesiano entre las tablas departamentos y empleados.

SELECT 
    *
FROM
    empleados
        INNER JOIN
    departamentos;

-- 2. A partir del ejercicio anterior obtén sólo los registros válidos, es decir, aquellos donde el empleado sólo está relacionado con el departamento al que pertenece.

SELECT 
    *
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id;

-- 3. Realiza un producto cartesiano entre las tablas departamento y proyecto.

SELECT 
    *
FROM
    proyectos
        INNER JOIN
    departamentos;

-- 4. A partir del ejercicio anterior obtener los registros válidos, es decir, relacionar proyecto sólo con el departamento que lo está realizando.

SELECT 
    *
FROM
    proyectos
        INNER JOIN
    departamentos ON proyectos.departamento_id = departamentos.id;

-- 5. Realiza un producto cartesiano entre las tablas empleados, departamentos y proyecto.

SELECT 
    *
FROM
    empleados
        INNER JOIN
    departamentos
        INNER JOIN
    proyectos;

-- 6. Realizar el producto cartesiano entre las tablas Empleado y Departamento en la que sólo se relacione a cada empleado con el departamento al que pertenece y además sólo mostrará aquellos cuyo Salario sea superior a 30000. 

SELECT 
    *
FROM
    empleados emp
        INNER JOIN
    departamentos dep ON emp.departamento_id = dep.id
        AND salario > 30000;