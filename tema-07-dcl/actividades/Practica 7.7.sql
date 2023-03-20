# Práctica 7.7 - Funciones Cadena Caracteres
# Ricardo Moreno Cantea, 1ºDAW

USE empresa;

/* 1. Añadir a la columna apellidos de la tabla empleados un segundo apellido a cada uno de los empleados. Se ha de añadir un segundo apellido al que ya posee. */

UPDATE empleados 
SET 
    apellidos = CONCAT_WS(' ', apellidos, 'Segundoapellido');

/* 2. Realizar una consulta sobre la tabla empleados que muestre el id, nss y nombre, teniendo en cuenta que la columna nombre debe mostrar primero los apellidos, a continuación una coma y un espacio y luego el nombre. */

SELECT 
    id, nss, CONCAT_WS(', ', apellidos, nombre)
FROM
    empleados;

/* 3. Realizar una cosulta SQL que muestre id, nss, nombre, apellido1 y apellido2 de los empleados, es decir se deberá extraer de la columna apellidos el apellido1 y el apellido2 para mostrarlo en la consulta como columnas independientes. */

SELECT 
    id,
    nss,
    nombre,
    SUBSTRING_INDEX(apellidos, ' ', 1) apellido1,
    SUBSTRING_INDEX(apellidos, ' ', - 1) apellido2
FROM
    empleados;

/* 4. La columna direccion de la tabla empleados muestra la siguiente información:

código postal
ciudad
provincia
estado
Realiza una consulta sql para que muestre dicha información pero en orden invertido, es decir:

estado
provincia
ciudad
codigo postal
Los campos que deberá mostrar la consulta son:

id
nombre
apellidos
nss
estado
provincia
ciudad 
codigo postal */

SELECT 
    id,
    nombre,
    apellidos,
    nss,
    SUBSTRING_INDEX(direccion, ', ', - 1) estado,
    SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ', ', - 2),
            ', ',
            1) provincia,
    SUBSTRING_INDEX(direccion, ' ', 1) cod_postal
FROM
    empleados;

/* 5. Se deberá crear un código para cada empleado basado en las siguientes reglas:

3 últimos dígitos de NSS
Separador "/"
Dos iniciales del nombre en mayúscula
Dos iniciales del primer apellido en mayúscula
Dos iniciales del segundo apellido en mayúscula
Ejemplo para el primer empleado se obtendría el siguiente código: 789/JOSMPE en caso de que el segundo apellido que le he añadido sea Pérez

Probar con un SELECT que mostrará las siguientes columnas de los empleados:

id,
apellidos
nombre
nss
código generado */

SELECT 
    id,
    apellidos,
    nombre,
    CONCAT_WS('/',
            RIGHT(nss, 3),
            CONCAT(LEFT(UPPER(nombre), 2),
                    LEFT(UPPER(SUBSTRING_INDEX(apellidos, ' ', 1)),
                        2),
                    LEFT(UPPER(SUBSTRING_INDEX(apellidos, ' ', - 1)),
                        2))) cod_empleado
FROM
    empleados;



