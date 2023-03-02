# Práctica 6.11: Consultas Agrupación de Registros
# Ricardo Moreno Cantea, 1ºDAW

USE empresa;

# 1. Obtener el número de empleados que hay en cada departamento. Mostrar las columnas: id, Departamento y el alias NumEmpleados.

SELECT 
    dep.id, dep.nombre, COUNT(*) Num_Empleados
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
GROUP BY dep.id;

# 2. Obtener el número de empleados que hay en cada departamento cuyo sueldo esté por encima de los 30000 anuales. Mismas columnas que el ejercicio anterior. 

SELECT 
    dep.id, dep.nombre Nombre, COUNT(*) Num_Empleados
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
WHERE
    salario > 30000
GROUP BY dep.id;

# 3. Obtener el número total de empleados que hay en cada departamento cuyo salario esté comprendido entre 20000 y 50000. Mismas columnas que el ejercicio anterior. 

SELECT 
    dep.id, dep.nombre, COUNT(*) Num_Empleados
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
WHERE
    salario BETWEEN 20000 AND 50000
GROUP BY dep.id;

# 4. Obtener el número de empleados que nacieron en cada año. Mostrar las columnas con el alias Año y Nempleados.

SELECT 
    YEAR(fecha_nac) Año, COUNT(*) N_Empleados
FROM
    empleados
GROUP BY Año;

# 5. Sobre la tabla Empleados_proyectos, obtener la suma total de horas trabajadas en cada proyecto. Mostrar id, Proyecto y HorasAcumuladas. 

SELECT 
    epr.proyecto_id,
    pr.descripcion,
    SUM(epr.horas) Horas_Acumuladas
FROM
    empleados_proyectos epr
        INNER JOIN
    proyectos pr ON epr.proyecto_id = pr.id
GROUP BY epr.proyecto_id;

# 6. Obtener el número de empleados que tiene a su cargo cada supervisor. Mostrar id, Apellidos, Nombre, y el alias numDependientes

SELECT 
    sup.id,
    CONCAT_WS(', ', sup.apellidos, sup.nombre) Apellidos_Nombre,
    COUNT(*) numDependientes
FROM
    empleados sup
        INNER JOIN
    empleados emp ON emp.supervisor_id = sup.id
GROUP BY sup.id;

# 7. Obtener para cada departamento la siguiente información estadística:
# a. Número de Departamento
# b. Nombre del Departamento
# c. Jefe del Departamento
# d. Numero de Empleados
# e. Salario Medio 
# f. Salario Máximo
# g. Salario Mínimo
# h. Suma Salarios

SELECT 
    emp.departamento_id id_dept,
    dep.nombre,
    dep.jefe_departamento_id,
    CONCAT_WS(', ', emp.apellidos, emp.nombre) jefe_dept,
    COUNT(*) numEmpleados,
    AVG(emp.salario) Salario_medio,
    MAX(emp.salario) Salario_maximo,
    MIN(emp.salario) Salario_minimo,
    SUM(emp.salario) Suma_salarios
FROM
    departamentos dep
        INNER JOIN
    empleados jef ON dep.jefe_departamento_id = jef.id
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
GROUP BY emp.departamento_id;

# 8. Obtener la siguiente información:
# a. id, NSS de la tabla empleados
# b. Nombre del empleado
# c. Número total de beneficiarios

SELECT 
    emp.id,
    emp.nss,
    CONCAT_WS(' ', emp.nombre, emp.apellidos) as Nombre,
    COUNT(*) as Num_Beneficiarios
FROM
    empleados emp
        INNER JOIN
    beneficiarios b ON b.empleado_id = emp.id
GROUP BY emp.id;

# 9. Mostrar el número de beneficiarios de cada departamento (intervienen las tablas Empleados, Departamento y Beneficiarios). Mostrará la siguiente información.
# a. id de Departamento 
# b. Nombre del Departamento
# c. Función de Agregación. Número de Beneficiarios

SELECT 
    d.id, d.nombre, COUNT(*) as Num_Beneficiarios
FROM
    departamentos d
        INNER JOIN
    empleados e ON e.departamento_id = d.id
        INNER JOIN
    beneficiarios b ON b.empleado_id = e.id
GROUP BY d.id;

# 10. Obtener el número de horas acumuladas en cada proyecto, mostrando la siguiente información:
# a. Id de Proyecto
# b. nombre de Proyecto
# c. Nombre de Departamento
# d. Función Agregación SUM a partir de empleados_proyecto

SELECT 
    p.id,
    p.descripcion,
    p.departamento_id,
    d.nombre,
    SUM(ep.horas) AS Horas_acumuladas
FROM
    proyectos AS p
        INNER JOIN
    departamentos AS d ON p.departamento_id = d.id
        INNER JOIN
    empleados_proyectos AS ep ON ep.proyecto_id = p.id
GROUP BY p.id;

# 11. Mostrar el número de horas acumuladas por cada trabajador:
# a. empleado_id de empleado_proyecto
# b. Función de Agregación correspondiente

SELECT 
    e.id,
    CONCAT_WS(' ', e.nombre, e.apellidos) AS Nombre_empleado,
    SUM(ep.horas) AS Horas_acumuladas
FROM
    empleados AS e
        INNER JOIN
    empleados_proyectos AS ep ON ep.empleado_id = e.id
GROUP BY e.id;

# 12. Mostrar el número de horas acumuladas por cada trabajador en cada proyecto. Mostrar:
# a. id de empleado_proyecto
# b. IdProyecto de trabaja_en
# c. Función de agregación correspondiente

SELECT * FROM empleados_proyectos; # En la tabla, las id de empleado y proyecto forman la clave primaria, por lo que se muestra el número de horas que el empleado ha invertido en cada proyecto en total. (No pueden haber dos registros del mismo empleado trabajando en el mismo proyecto)

# 13. Mostrar el número de horas acumuladas por cada trabajador en cada proyecto pero mostrando:
# a. empleado_id de empleado_proyecto
# b. Nombre de Empleado
# c. Apellidos de Empleado
# d. proyecto_id de empleado_proyecto

SELECT 
    ep.empleado_id,
    CONCAT_WS(' ', e.nombre, e.apellidos) AS Nombre_empleado,
    ep.proyecto_id,
    ep.horas
FROM
    empleados_proyectos AS ep
        INNER JOIN
    empleados AS e ON ep.empleado_id = e.id;

# 14. Misma consulta anterior pero mostrando la columna Descripción del Proyecto

SELECT 
    ep.empleado_id,
    CONCAT_WS(' ', e.nombre, e.apellidos) AS Nombre_empleado,
    ep.proyecto_id,
    p.descripcion,
    ep.horas
FROM
    empleados_proyectos AS ep
        INNER JOIN
    empleados AS e ON ep.empleado_id = e.id
        INNER JOIN
    proyectos as p ON ep.proyecto_id = p.id;

# 15. Obtener el sueldo medio de los empleados del departamento 3. Realizar este ejercicio usando la cláusula WHERE. 

SELECT 
    d.id, d.nombre, AVG(e.salario) AS Salario_medio
FROM
    departamentos AS d
        INNER JOIN
    empleados AS e ON e.departamento_id = d.id
WHERE
    d.id = 3;

# 16. Obtener el mismo ejercicio anterior pero usando la cláusula HAVING con GROUP BY

SELECT 
    d.id, d.nombre, AVG(e.salario) AS Salario_medio
FROM
    departamentos AS d
        INNER JOIN
    empleados AS e ON e.departamento_id = d.id
GROUP BY d.id
HAVING d.id = 3;

# 17. Obtener el sueldo medio, sueldo máximo y sueldo mínimo de los empleados del departamento 1 y 2. Mostrar las columnas id del departamento y las correspondientes funciones de agregación.

SELECT 
    d.id,
    d.nombre,
    AVG(e.salario) AS Salario_medio,
    MAX(e.salario) AS Salario_maximo,
    MIN(e.salario) AS Salario_minimo
FROM
    departamentos AS d
        INNER JOIN
    empleados AS e ON e.departamento_id = d.id
GROUP BY d.id
HAVING d.id < 3;

# 18. Mostrar el id de departamento en los que el número total de horas trabajadas sea superior o igual a 50.

SELECT 
    d.id, d.nombre, SUM(ep.horas) AS Horas_trabajadas
FROM
    departamentos AS d
        INNER JOIN
    empleados AS e ON e.departamento_id = d.id
        INNER JOIN
    proyectos AS p ON p.departamento_id = d.id
        INNER JOIN
    empleados_proyectos AS ep ON ep.empleado_id = e.id
GROUP BY d.id
HAVING Horas_trabajadas >= 50;

# 19. Obtener aquellos departamentos en los que el salario medio de sus empleados sea superior a 40000. Mostrar número de departamento y salario medio. 

SELECT 
    d.id, d.nombre, AVG(e.salario) AS Salario_medio
FROM
    departamentos AS d
        INNER JOIN
    empleados AS e ON e.departamento_id = d.id
GROUP BY d.id
HAVING Salario_medio > 40000;

# 20. Obtener el salario medio por año de nacimiento, pero mostrar sólo aquellos en los que el salario medio sea superior a 45000. Columnas Año, Salario Medio y Número de Empleados. 

SELECT 
    YEAR(fecha_nac) Año,
    AVG(e.salario) Salario_medio,
    COUNT(*) N_Empleados
FROM
    empleados AS e
GROUP BY Año
HAVING Salario_medio > 45000;

# 21. Número de beneficiarios por sexo.

SELECT 
    genero, COUNT(*) Num_beneficiarios
FROM
    beneficiarios
GROUP BY genero;
