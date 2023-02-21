# Práctica 6.10: Consultas Externas
# Alumno: Ricardo Moreno Cantea, 1ºDAW

USE Empresa;

# Actividad 1
SELECT 
    emp.id,
    CONCAT(emp.apellidos, ', ', emp.nombre) 'Apellidos, Nombre',
    emp.nss 'Nº Seguridad Social',
    timestampdiff(year, emp.fecha_nac, now()) 'Edad',
    emp.salario 'Salario',
    dep.nmbre 'Nombre Dept.'
FROM
    empleados emp
        LEFT JOIN
    departamentos dep ON emp.departamento_id = dep.id
ORDER BY emp.id ASC;

# Actividad 2
SELECT 
    dep.id,
    dep.nmbre 'Nombre',
    dep.jefe_departamento_id,
    CONCAT(jef.nombre, ' ', jef.apellidos) 'Nombre Jefe Dept.',
    emp.id,
    CONCAT(emp.nombre, ' ', emp.apellidos) 'Nombre empleado'
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
        LEFT JOIN
    empleados jef ON dep.jefe_departamento_id = jef.id
ORDER BY dep.id ASC;

# Actividad 3
SELECT 
    emp.id,
    CONCAT(emp.nombre, ' ', emp.apellidos) 'Nombre',
    dep.nmbre 'Nom. Dept.',
    pr.descripcion,
    epr.horas
FROM
    empleados emp
        INNER JOIN
    departamentos dep ON emp.departamento_id = dep.id
        LEFT JOIN
    proyectos pr ON pr.departamento_id = dep.id
        LEFT JOIN
    empleados_proyectos epr ON epr.empleado_id = emp.id
ORDER BY epr.horas DESC;

# Actividad 4
SELECT 
    pr.id,
    pr.descripcion,
    pr.num_proyecto,
    pr.fecha_inicio,
    dep.nmbre 'Nombre dept.',
    CONCAT(emp.nombre, ' ', emp.apellidos) 'Nombre Empleado',
    epr.horas
FROM
    proyectos pr
        INNER JOIN
    departamentos dep ON pr.departamento_id = dep.id
        LEFT JOIN
    empleados_proyectos epr ON epr.proyecto_id = pr.id
        INNER JOIN
    empleados emp ON epr.empleado_id = emp.id
ORDER BY epr.horas desc;