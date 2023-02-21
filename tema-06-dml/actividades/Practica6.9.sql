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
    concat_ws(' ',emp.nombre, emp.apellidos) Nombre_jefe
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
    CONCAT(sup.nombre, ' ', sup.apellidos) 'Supervisor'
FROM
    empleados emp
        INNER JOIN
    empleados sup ON emp.supervisor_id = sup.id;
    
-- 4. Empleados con beneficiarios
SELECT 
    b.id,
    b.nombre,
    b.genero,
    b.fecha_nac,
    b.empleado_id,
    CONCAT(e.nombre, ' ', e.apellidos) 'nombre apellidos empleado',
    b.parentesco
FROM
    beneficiarios b
        INNER JOIN
    empleados e ON b.empleado_id = e.id;

-- 5. Proyectos
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.localizacion,
    p.fecha_inicio,
    p.fecha_fin,
    p.departamento_id 'id dept.',
    d.nmbre 'nombre dept.'
FROM
    proyectos p
        INNER JOIN
    departamentos d ON p.departamento_id = d.id;

-- 6. Proyectos con jefe de Departamento
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.localizacion,
    p.fecha_inicio,
    p.fecha_fin,
    p.departamento_id 'id dept.',
    d.nmbre 'nombre dept.',
    CONCAT(e.nombre, ' ', e.apellidos) 'jefe dept.'
FROM
    proyectos p
        INNER JOIN
    departamentos d ON p.departamento_id = d.id
        INNER JOIN
    empleados e ON d.jefe_departamento_id = e.id;

-- 7. Informe empleados_proyectos
SELECT
    epr.empleado_id,
    epr.proyecto_id,
    CONCAT(e.nombre, ' ', e.apellidos) 'Nombre Empleado',
    epr.horas,
    p.descripcion
FROM
    empleados_proyectos epr
        INNER JOIN
    empleados e ON epr.empleado_id = e.id
        INNER JOIN
    proyectos p ON epr.proyecto_id = p.id
ORDER BY e.nombre ASC;
    

