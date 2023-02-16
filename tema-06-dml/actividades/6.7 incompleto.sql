-- Práctica 6.7: Subconsultas

USE Empresa;

SELECT 
    *
FROM
    proyectos
WHERE
    localizacion = (SELECT 
            localizacion
        FROM
            proyectos
        WHERE
            descripcion LIKE '%Carretera Madrid Toledo%');

SELECT 
    *
FROM
    empleados
WHERE
    departamento_id = (SELECT 
            departamento_id
        FROM
            empleados
        WHERE
            nombre LIKE '%Jennifer%'
				AND apellidos LIKE '%Wallace%');

SELECT 
    *
FROM
    empleados
WHERE
    salario <= (SELECT 
            salario
        FROM
            empleados
        WHERE
            nombre LIKE '%Alicia%'
                AND apellidos LIKE '%Zelaya%');

SELECT 
    *
FROM
    beneficiarios
WHERE
    YEAR(fecha_nac) = (SELECT 
            YEAR(fecha_nac)
        FROM
            beneficiarios
        WHERE
            nombre LIKE '%Alice%');

SELECT 
    *
FROM
    empleados
WHERE
    YEAR(fecha_nac) > (SELECT 
            YEAR(fecha_nac)
        FROM
            empleados
        WHERE
            nombre LIKE '%James%' AND apellidos LIKE '%Borg%');



SELECT 
    *
FROM
    empleados
WHERE
    YEAR(fecha_nac) = SOME (SELECT 
            YEAR(fecha_nac)
        FROM
            empleados
        WHERE
            departamento_id = 3);

SELECT 
    *
FROM
    empleados
WHERE
    salario = SOME (SELECT 
            salario
        FROM
            empleados
        WHERE
            departamento_id = 2);

INSERT INTO departamentos VALUES ('4', 'Relaciones inter.', '5', '30', 'Houston');

SELECT 
    *
FROM
    departamentos
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            empleados
        WHERE
            empleados.departamento_id = departamentos.id);

SELECT 
    *
FROM
    departamentos
WHERE
    id IN (SELECT DISTINCT
            departamento_id
        FROM
            empleados);

SELECT 
    *
FROM
    departamentos
WHERE
    id NOT IN (SELECT DISTINCT
            departamento_id
        FROM
            proyectos);

SELECT 
    *
FROM
    empleados
WHERE
    salario IN (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            departamento_id = 2);
            
SELECT 
    *
FROM
    empleados
WHERE
    salario < (SELECT DISTINCT
            max(salario)
        FROM
            empleados
        WHERE
            departamento_id = 2);

