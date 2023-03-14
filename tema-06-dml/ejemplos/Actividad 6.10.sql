-- Práctica 6.10 - Geslibros - repaso
USE geslibros;

-- 1. Script - clientes
-- Mostrar aquellos clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org", 
-- es decir que en email contengan el nombre del servidor.
-- Tablas: clientes
-- Condición: clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org". 
-- Columnas: id, nombre, dirección, nif, telefono y email.
-- Orden:  nombre.
SELECT 
    clientes.id,
    clientes.nombre 'Nombre Cliente',
    clientes.direccion,
    clientes.nif,
    clientes.telefono,
    clientes.email
FROM
    clientes
WHERE
    clientes.poblacion = 'Ubrique'
        AND email LIKE '%ieslosremedios.org%'
ORDER BY clientes.nombre;

-- 2. Script - ventas
-- Mostrar las 3 mejores ventas realizadas en el año 2014.
-- Tablas: ventas, clientes
-- Condición: sólo las del año 2014
-- Columnas: id, nombre cliente, fecha de la venta, importe_bruto, importe_iva e importe_total
-- Orden: por importe de mayor a menor.
SELECT 
    ventas.id,
    clientes.nombre 'Nombre Cliente',
    ventas.fecha 'Fecha de la venta',
    ventas.importe_bruto 'Bruto',
    ventas.importe_iva 'Iva',
    ventas.importe_total 'Total'
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    YEAR(ventas.fecha) = 2014
ORDER BY Total DESC
LIMIT 3;
-- 3. Script - libros
-- Mostrar detalles de todos los libros editados en 2011 cuyo stock esté entre 10 y 20 unidades.
-- Tablas: libros, autores, editoriales
-- Condición: Stock entre 10 y 20, sólo del año 2011.
-- Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta
-- Orden: id libro
SELECT 
    libros.id,
    libros.titulo,
    autores.nombre 'autor',
    editoriales.nombre 'editorial',
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    (libros
        INNER JOIN
    autores ON libros.autor_id = autores.id)
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    YEAR(libros.fecha_edicion) = 2011
        AND libros.stock BETWEEN 10 AND 20
ORDER BY libros.id;
-- 4. Script - libros
-- Mostrar detalles de los libros relacionadas con la temática PHP y Bases de Datos, además el precio de venta sea inferior a 30 €
-- Tabla principal: libros, autores, editoria
-- Condición: título esté relacionados con el lenguaje de programación PHP y que además el precio de venta sea inferior 30 €. 
-- Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta
-- Orden: id de libro
SELECT 
    libros.id,
    libros.titulo,
    autores.nombre,
    editoriales.nombre,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    (libros
        INNER JOIN
    autores ON libros.autor_id = autores.id)
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    libros.titulo LIKE '%PHP%' OR libros.titulo LIKE '%Bases de Datos%'
        AND libros.precio_venta < 30
ORDER BY libros.id;
-- 5. Script - libros
-- Mostrar detalles de los libros junto con el margen de beneficios, es decir, la diferencia entre el precio_venta y el precio_coste.
-- Tabla principal: libros, autores, editoriales
-- Condición: los libros de la editorial Anaya y Alfaguara
-- Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta, margen_beneficio (campo calculado)
-- Orden: margen_beneficio de mayor a menor.
SELECT 
    libros.id,
    libros.titulo,
    autores.nombre,
    editoriales.nombre,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta,
    (libros.precio_venta - libros.precio_coste) AS margen_beneficio
FROM
    (libros
        INNER JOIN
    autores ON libros.autor_id = autores.id)
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    editoriales.nombre IN ('Anaya','Alfaguara')
ORDER BY margen_beneficio DESC;
-- 6. Script - libros
-- Mostrar detalles de los libros cuyo precio_coste sea igual al precio_coste del libro titulado 'Camboya'.
-- Tabla principal: libros, autores, editoriales
-- Condición: los libros de la editorial Anaya y Alfaguara
-- Columnas: id, título, autor, editorial, stock, precio_costo, precio_venta
-- Orden: id libro
-- Notas: se precisa subconsulta
SELECT 
    libros.id,
    libros.titulo,
    autores.nombre,
    editoriales.nombre,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    (libros
        INNER JOIN
    autores ON libros.autor_id = autores.id)
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    editoriales.nombre IN ('Anaya' , 'Alfaguara')
        AND libros.precio_coste = (SELECT 
            precio_coste
        FROM
            libros
        WHERE
            titulo LIKE '%Camboya%'
        LIMIT 1)
ORDER BY libros.id;
-- 7. Script - ventas
-- Se desea obtener el volumen total de ventas realizadas a cada cliente en 2014.
-- Tabla principal: ventas y clientes
-- Condición: sólo las ventas 2014
-- Columnas: id del cliente, nombre cliente, número de ventas, venta máxima, venta mínima y suma. 
-- La función de agregado de estos tres últimos campos se aplicarán sobre importe_total de cada venta.
-- Orden: suma de ventas totales
-- Notas: se precisa agrupación registros
SELECT 
    clientes.id,
    clientes.nombre,
    COUNT(ventas.id) 'NumVentas',
    MAX(ventas.importe_total) 'VentaMax',
    MIN(ventas.importe_total) 'VentaMin',
    SUM(ventas.importe_total) 'VolumenTotal'
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    YEAR(ventas.fecha) = 2014
GROUP BY ventas.cliente_id

ORDER BY VolumenTotal DESC;
-- 8. Script - ventas de editoriales
-- Se desea obtener el volumen total de ventas por Editorial
-- Tabla principal: ventas, lineasventas, libros y editoriales
-- Condición:  todas las editoriales
-- Columnas: id de la editorial, nombre de la editorial, Número de libros vendidos y importe total vendido de libros de esa editorial
-- Orden: suma de ventas totales descendente
-- Notas: se precisa agrupación registros
SELECT 
    editoriales.id,
    editoriales.nombre 'Editorial',
    SUM(lineasventas.cantidad) 'Cantidad',
    SUM(lineasventas.importe) 'ImporteVentas'
FROM
    ((lineasventas
    INNER JOIN libros ON lineasventas.libro_id = libros.id)
    INNER JOIN editoriales ON libros.editorial_id = editoriales.id)
GROUP BY libros.editorial_id
ORDER BY ImporteVentas DESC;
-- 9. View - ventas editoriales
-- Obtener una vista llamada ventas_editoriales a partir del script anterior.
-- Usando la vista creada se pide: 
-- Obtener aquellas editoriales que hayan conseguido vender más de 50 libros.
CREATE OR REPLACE VIEW Ventas_editoriales AS
    SELECT 
    editoriales.id,
    editoriales.nombre 'Editorial',
    SUM(lineasventas.cantidad) 'Cantidad',
    SUM(lineasventas.importe) 'ImporteVentas'
FROM
    ((lineasventas
    INNER JOIN libros ON lineasventas.libro_id = libros.id)
    INNER JOIN editoriales ON libros.editorial_id = editoriales.id)
GROUP BY libros.editorial_id
ORDER BY ImporteVentas DESC;

-- 
SELECT 
    *
FROM
    ventas_editoriales
WHERE
    cantidad > 50;

-- 10. Insertar - Libros
-- Insertar un libro con datos válidos en la tabla libros a partir de los siguientes requisitos:
-- El autor del libro es Gabriel García Márquez
-- La editorial es Alfaguara
-- El ISBN es '9788448180833'
-- El EAN es '9788888199586'
-- Inventar resto de datos
INSERT INTO libros VALUES 
(null,9788448180833,9788888199586,'El general en su laberinto', 1,5,16,20.00,15,2,20,'1990-03-12', DEFAULT,DEFAULT);
-- 11. Insertar - Libros_Temas
-- Insertar los registros adecuados en la tabla Libros_temas, teniendo en cuenta que el libro anterior es novela, ciencia y astronomía
INSERT INTO libros_temas VALUES
(20,3,DEFAULT,DEFAULT),
(20,7,DEFAULT,DEFAULT),
(20,9,DEFAULT,DEFAULT);
-- 12. Insertar - Líneas Ventas y Ventas
-- Insertar un registro con datos válidos en la tabla ventas.
-- Insertar 3 registros en la tabla lineasventas con datos válidos relacionados con la venta anterior.
INSERT INTO ventas VALUES
(NULL,7,'2021-02-27', 144.00, 30.24, 174.24, DEFAULT,DEFAULT);
INSERT INTO lineasventas VALUES 
(NULL, 11,1,20,0.210,2,20,40,DEFAULT,DEFAULT),
(NULL, 11,2,1,0.210,3,20,60,DEFAULT,DEFAULT),
(NULL, 11,3,2,0.210,2,22,44,DEFAULT,DEFAULT);
-- 13. Update - Libros
-- Debido al incremento de costes y nuevas tasas impositivas se desea subir el precio de los libros de la editorial Anaya en un 10%.
UPDATE libros 
SET 
    precio_coste = precio_coste * 1.10
WHERE
    editorial_id = (SELECT 
            id
        FROM
            editoriales
        WHERE
            nombre LIKE '%anaya%' LIMIT 1);
-- 14. Update - Libros
-- Se desea reducir el precio de los libros que no se vendieron en 2014 en un 30%.
UPDATE libros 
SET 
    precio_venta = precio_venta - precio_venta * 0.30
WHERE
    id NOT IN (SELECT DISTINCT
            lineasventas.libro_id
        FROM
            lineasventas
                INNER JOIN
            ventas ON lineasventas.venta_id = ventas.id
        WHERE
            YEAR(ventas.fecha) = 2014);
-- 15. Delete - Libros
-- Se desea eliminar definitivamente todos los libros que contengan la temática belleza, ya que se han quedado obsoletos.
DELETE FROM libros 
WHERE
   id IN (SELECT 
        libros_temas.libro_id
    FROM
        libros_temas
            INNER JOIN
        temas ON libros_temas.tema_id = temas.id
           WHERE temas.tema like '%belleza%');