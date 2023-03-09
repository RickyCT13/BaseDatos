# Examen Tema 6: SQL-DML
# Ricardo Moreno Cantea, 1ºDAW

USE geslibros;

SELECT 
    id, nombre, nacionalidad, email, fecha_nac, premios
FROM
    autores
WHERE
    YEAR(fecha_nac) < 1980
        AND premios LIKE '%Cervantes%'
ORDER BY id ASC;

# 2. Mostrar todas las ventas registradas a clientes de Ubrique en el 2014
# Tablas: ventas, clientes
# Condición: ventas del 2014 y a clientes de la población de Ubrique
# Columnas: id, nombre cliente, población del cliente, fecha de la venta, importe_bruto, importe_iva e importe_total
# Orden: por importe de mayor a menor.

SELECT 
    c.id,
    c.nombre,
    c.poblacion,
    v.fecha,
    v.importe_bruto,
    v.importe_iva,
    v.importe_total
FROM
    ventas v
        INNER JOIN
    clientes c ON v.cliente_id = c.id
WHERE
    YEAR(v.fecha) = 2014
        AND c.poblacion = 'Ubrique'
ORDER BY v.importe_total DESC;

# 3. Mostrar detalles de todos los libros de las editoriales Alfaguara, Anaya y MCGRAWHILL, editados entre 2010 y 2020 cuyo precio de venta sea inferior a 40 €
# Tablas: libros, autores, editoriales
# Condición: editorial Alfaguara, Anaya y MCGRAWHILL; editados en 2010 y 2020 y  precio de venta sea inferior a 40 €
# Columnas: id, título, autor (nombre), editorial (nombre), fecha_edicion, stock, precio_coste, precio_venta
# Orden: id libro
# Observaciones: se debe usar el operador IN

SELECT 
    l.id,
    l.titulo,
    a.nombre autor,
    e.nombre editorial,
    l.fecha_edicion,
    l.stock,
    l.precio_coste,
    l.precio_venta
FROM
    libros l
        INNER JOIN
    autores a ON l.autor_id = a.id
        INNER JOIN
    editoriales e ON l.editorial_id = e.id
WHERE
    e.nombre IN ('Alfaguara' , 'Anaya', 'MCGRAWHILL')
        AND YEAR(l.fecha_edicion) BETWEEN 2010 AND 2020
        AND l.precio_venta < 40.00
ORDER BY l.id ASC;

/* 
4. Mostrar detalles de los libros que se encuentran en stock adecuado, es decir, que su nivel de stock esté comprendido entre el stock mínimo y el stock máximo. Además de los detalles propios del libro deberá mostrar en una columna calculada el Valor_Almacen resultante de multiplicar el stock * precio_coste

Tabla principal: libros, autores, editoriales
Condición: nivel de stock esté comprendido entre stock mínimo y stock máximo 
Columnas: id, título, autor, editorial, stock, stock_min, stock_maxi, precio_coste, precio_venta, valor_almacen 
Orden: valor almacén de mayor a menor 
*/

/* 
5. Se dese saber el número de libros, el precio medio, precio máximo, precio min, stock medio, stock máximo, stock min, stock acumulado de los libros de la editorial MCGRAWHILL.

Tablas: libros y editoriales
Condición: editorial MCGRAWHILL
Columnas: número de unidades .... (las indicadas arriba)
Orden: número de unidades desc */

SELECT 
    COUNT(l.id) numero_libros,
    AVG(l.precio_venta) precio_medio,
    MAX(l.precio_venta) precio_maximo,
    MIN(l.precio_venta) precio_minimo,
    AVG(l.stock) stock_medio,
    MAX(l.stock) stock_max_absoluto,
    MIN(l.stock) stock_min_absoluto,
    SUM(l.stock) numero_unidades
FROM
    libros l
        INNER JOIN
    editoriales e ON l.editorial_id = e.id
WHERE
    e.nombre LIKE '%MCGRAWHILL%';

/*
6. Mostrar detalles autores mas jóvenes que Oscar Wilde que hayan conseguido el premio Nobel.

Tabla principal: autores
Condición: después que Oscar Wilde y que hayan conseguido el premio Nobel.
Columnas: id, nombre, nacionalidad, email, fecha_nac, Premios
Orden: fecha de nacimiento, primero el más antiguo
Nota: se precisa el uso de una subconsulta
*/

SELECT 
    id, nombre, nacionalidad, email, fecha_nac, premios
FROM
    autores
WHERE
    fecha_nac > (SELECT 
            fecha_nac
        FROM
            autores
        WHERE
            nombre = 'Oscar Wilde')
        AND premios LIKE '%Nobel%'
ORDER BY fecha_nac ASC;

/* 
7. Mostrar las ventas realizadas entre 2010 y 2020, cuyo importe total sea superior a 1.500 €. Ordenadas por importe total con criterio descendente

Tablas: ventas, clientes
Condición: entre 2010 y 2020; importe total superior a 1.500 €
Columnas: id venta, nombre cliente, fecha, importe_bruto, importe_iva, importe_total
Orden: importe total con criterio descencente
*/

SELECT 
    v.id id_venta,
    c.nombre nom_cliente,
    v.fecha,
    v.importe_bruto,
    v.importe_iva,
    v.importe_total
FROM
    ventas v
        INNER JOIN
    clientes c ON v.cliente_id = c.id
WHERE
    (YEAR(fecha) BETWEEN 2010 AND 2020)
        AND v.importe_total > 1500
ORDER BY v.importe_total DESC;

/* 
8. Mostrar todas las ventas registradas a los clientes  de la provincia de Cádiz. 

Tablas: ventas, clientes, provincias
Condición: clientes de la provincia de cádiz 
Columnas: id, cliente (nombre), población (cliente), provincia (provincias), fecha de la venta, importe_bruto, importe_iva e importe_total
Orden: por importe de mayor a menor.
*/

SELECT 
    v.id id_venta,
    c.nombre nom_cliente,
    c.poblacion,
    p.provincia,
    v.fecha,
    v.importe_bruto,
    v.importe_iva,
    v.importe_total
FROM
    ventas v
        INNER JOIN
    clientes c ON v.cliente_id = c.id
        INNER JOIN
    provincias p ON c.provincia_id = p.id
WHERE
    p.provincia = 'Cádiz'
ORDER BY v.importe_total DESC;

/* 
9. Se desea obtener el volumen total de ventas realizadas en 2014 por cliente
Tabla principal: ventas y clientes
Condición: sólo las ventas 2014
Columnas: id de cliente, nombre del cliente, numero de ventas, suma del importe bruto, suma del importe iva, suma del importe total 
Orden: importe total de mayor a menor
Notas: se precisa agrupación registros
*/

SELECT 
    c.id,
    c.nombre,
    COUNT(v.id) vol_ventas,
    SUM(v.importe_bruto) suma_importes_brutos,
    SUM(v.importe_iva) suma_importes_iva,
    SUM(v.importe_total) suma_importes_totales
FROM
    ventas v
        INNER JOIN
    clientes c ON v.cliente_id = c.id
WHERE
    YEAR(v.fecha) = 2014
GROUP BY c.id
ORDER BY suma_importes_totales DESC;

/* 
10. Se desea obtener un estudio estadístico sobre las ventas de libros autor. 
Tablas necesarias: lineasventas, libros y autores
Condición:  todos los autores
Columnas: id autor, nombre autor, nacionalidad autor, unidades vendidas (acumulado campo unidades de lineasventas), importe ventas totales (acumulado campo importe de lineasventas)
Orden: importe ventas totales descendente
Notas: se precisa agrupación registros
*/

SELECT 
    a.id,
    a.nombre autor,
    a.nacionalidad,
    SUM(lv.cantidad) uds_vendidas,
    SUM(lv.importe) importe_ventas_totales
FROM
    lineasventas lv
        INNER JOIN
    libros l ON lv.libro_id = l.id
        INNER JOIN
    autores a ON l.autor_id = a.id
GROUP BY a.id
ORDER BY importe_ventas_totales DESC;

/* 
11. Obtener una vista llamada ventas_por_autor a partir del script anterior.
*/

CREATE OR REPLACE VIEW ventas_por_autor AS
    SELECT 
        a.id,
        a.nombre autor,
        a.nacionalidad,
        SUM(lv.cantidad) uds_vendidas,
        SUM(lv.importe) importe_ventas_totales
    FROM
        lineasventas lv
            INNER JOIN
        libros l ON lv.libro_id = l.id
            INNER JOIN
        autores a ON l.autor_id = a.id
    GROUP BY a.id
    ORDER BY importe_ventas_totales DESC;

/*
Usando la vista creada se pide: 
11. 2 Obtener aquellas autores que hayan conseguido vender más libros que Federico García Lorca
*/

SELECT 
    *
FROM
    ventas_por_autor
WHERE
    uds_vendidas > (SELECT 
            uds_vendidas
        FROM
            ventas_por_autor
        WHERE
            autor = 'Federico García Lorca');

/*
11.3 Mostrar aquellos autores que hayan vendido un importe total superior al de Pablo Neruda
*/

SELECT 
    *
FROM
    ventas_por_autor
WHERE
    importe_ventas_totales > (SELECT 
            importe_ventas_totales
        FROM
            ventas_por_autor
        WHERE
            autor = 'Pablo Neruda');


/* 
12. Busca los datos en Internet y añade un autor a la tabla correspondiente con datos válidos.
*/

insert into autores values (null, 'Luis Cernuda', 'España', 'cernbidouluis@gmail.com', '1902-09-21 00:00:00', '1963-11-05 00:00:00', 'Premio Literario Lambda por Poesía para Hombres Gays', default, default);

/* 
13. Inserta dos libros con datos válidos del autor anterior. Los libros serán editados por la editorial Santillana. El resto de datos serán establecidos a vuestro criterio.
*/

insert into libros values (null, '1454781452365', '6549852541457', 'La Realidad y el Deseo', (select id from autores where nombre like '%Luis Cernuda%'), (select id from editoriales where nombre like '%Santillana%'), 15.50, 17.50, 19, 30, 5, '2014-06-06', default, default), (null, '7811454452365', '5654982541457', 'Égloga, elegía, y oda', (select id from autores where nombre like '%Luis Cernuda%'), (select id from editoriales where nombre like '%Santillana%'), 14.13, 19.34, 14, 20, 7, '2017-03-12', default, default);

/* 
14. Insertar los registros adecuados en la tabla libros_temas, para reflejar al menos 2 temas a cada uno de los libros anteriores.
*/

insert into libros_temas values (20, 3, default, default), (20, 5, default, default), (21, 3, default, default), (21, 5, default, default);

/* 
15. 
Insertar un registro con datos válidos en la tabla ventas.
Insertar 3 registros en la tabla lineasventas con datos válidos relacionados con la venta anterior.
Asignar la venta al cliente de id = 9.
Los importes bruto, importe iva e importe total deben coincidir con los valores asignados a los 3 registros de lineasventas.
*/

insert into ventas values (11, 9, '2019-12-01', 93.37, 24.82, 118.19, default, default);
insert into lineasventas values (null, 11, 1, 17, 0.210, 2, 12.00, 29.04, default, default);
insert into lineasventas values (null, 11, 2, 20, 0.210, 2, 17.50, 42.35, default, default);
insert into lineasventas values (null, 11, 3, 21, 0.210, 2, 19.34, 46.80, default, default);

/* 
16. Se desea reducir el precio de los libros en un 10%, pero sólo aquellos de la editorial MCGRAWHILL cuyo nivel de stock está por encima de las 10 unidades.
*/

UPDATE libros 
SET 
    precio_venta = precio_venta * 0.9
WHERE
    editorial_id = (SELECT 
            id
        FROM
            editoriales
        WHERE
            nombre = 'MCGRAWHILL')
        AND stock > 10;

/* 
17. Se desea incrementar el stock en 20 unidades a todos los libros vendidos en 2014.
*/


/* El 19 está mal*/
UPDATE libros 
SET 
    stock = stock + 20
WHERE EXISTS (select libro_id from lineasventas lv where year((select all fecha from ventas)) = 2014);

/* 
18. Se desea eliminar definitivamente todos los libros no vendidos
*/
delete from libros where not exists (select libro_id from lineasventas);


