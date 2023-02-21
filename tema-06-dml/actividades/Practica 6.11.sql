# Práctica 6.11: Consultas Agrupación de Registros
# Ricardo Moreno Cantea, 1ºDAW

USE empresa;

# 1. Obtener el número de empleados que hay en cada departamento. Mostrar las columnas: id, Departamento y el alias NumEmpleados.

SELECT 
    dep.id, dep.nmbre Nombre, COUNT(*) Num_Empleados
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
GROUP BY dep.id;

# 2. Obtener el número de empleados que hay en cada departamento cuyo sueldo esté por encima de los 30000 anuales. Mismas columnas que el ejercicio anterior. 

SELECT 
    dep.id, dep.nmbre Nombre, COUNT(*) Num_Empleados
FROM
    departamentos dep
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
WHERE
    salario > 30000
GROUP BY dep.id;

# 3. Obtener el número total de empleados que hay en cada departamento cuyo salario esté comprendido entre 20000 y 50000. Mismas columnas que el ejercicio anterior. 

SELECT 
    dep.id, dep.nmbre Nombre, COUNT(*) Num_Empleados
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
    dep.nmbre nombre_Dept,
    dep.jefe_departamento_id,
    CONCAT_WS(', ', emp.apellidos, emp.nombre) jefe_dept,
    COUNT(*) numEmpleados,
    AVG(emp.salario),
    MAX(emp.salario),
    MIN(emp.salario),
    SUM(emp.salario)
FROM
    departamentos dep
        INNER JOIN
    empleados jef ON dep.jefe_departamento_id = jef.id
        INNER JOIN
    empleados emp ON emp.departamento_id = dep.id
GROUP BY emp.departamento_id;

# 8. 



# 9. 



# 10. 



# 11. 



# 12. 



# 13. 



# 14. 



# 15. 



# 16. 



# 17. 



# 18. 



# 19. 



# 20. 



# 21. 
