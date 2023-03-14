# Práctica 6.12: Repaso (Geslibros)
# Ricardo Moreno Cantea, 1ºDAW

use geslibros;

# 1. Mostrar aquellos clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org", es decir que en email contengan el nombre del servidor.

SELECT 
    id, nombre, direccion, nif, telefono, email
FROM
    clientes
WHERE
    poblacion LIKE '%Ubrique%'
        AND email LIKE '%@ieslosremedios.org'
ORDER BY nombre ASC;

# 2. Mostrar las 3 mejores ventas realizadas en el año 2014.

SELECT 
    v.id,
    c.nombre,
    v.fecha,
    v.importe_bruto,
    v.importe_iva,
    v.importe_total
FROM
    ventas v
        INNER JOIN
    clientes c ON v.cliente_id = c.id
WHERE YEAR(v.fecha) = 2014
ORDER BY v.importe_total DESC
LIMIT 3;

# 3. Mostrar detalles de todos los libros editados en 2011 cuyo stock esté entre 10 y 20 unidades.

SELECT 
    l.id,
    l.titulo,
    a.nombre,
    e.nombre,
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
    YEAR(l.fecha_edicion) = 2011
AND l.stock BETWEEN 10 AND 20
ORDER BY l.id ASC;

# 4. Mostrar detalles de los libros relacionadas con la temática PHP y Bases de Datos, además el precio de venta sea inferior a 30 €

SELECT 
    l.id,
    l.titulo,
    a.nombre,
    e.nombre,
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
    l.titulo LIKE '%PHP%'
HAVING l.precio_venta < 30
ORDER BY l.id ASC;

# 5. Mostrar detalles de los libros junto con el margen de beneficios, es decir, la diferencia entre el precio_venta y el precio_coste.

SELECT 
    l.id,
    l.titulo,
    a.nombre,
    e.nombre,
    l.stock,
    l.precio_coste,
    l.precio_venta,
    (l.precio_venta - l.precio_coste) margen_beneficios
FROM
    libros l
        INNER JOIN
    autores a ON l.autor_id = a.id
        INNER JOIN
    editoriales e ON l.editorial_id = e.id
WHERE
    e.id BETWEEN 5 AND 6
ORDER BY margen_beneficios DESC;

# 6. Mostrar detalles de los libros cuyo precio_coste sea igual al precio_coste del libro titulado 'Camboya'.

SELECT 
    l.id,
    l.titulo,
    a.nombre,
    e.nombre,
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
    e.id BETWEEN 5 AND 6
HAVING l.precio_coste = (SELECT 
        precio_coste
    FROM
        libros
    WHERE
        titulo LIKE '%Camboya%')
ORDER BY l.id ASC;

# 7. Se desea obtener el volumen total de ventas realizadas a cada cliente en 2014.

SELECT 
    c.id,
    c.nombre,
    COUNT(v.id) numero_ventas,
    MAX(v.importe_total) importe_máximo,
    MIN(v.importe_total) importe_minimo,
    SUM(v.importe_total) suma_importes
FROM
    clientes c
        INNER JOIN
    ventas v ON v.cliente_id = c.id
WHERE
    YEAR(v.fecha) = 2014
GROUP BY c.id
ORDER BY suma_importes DESC

# 8. Se desea obtener el volumen total de ventas por Editorial



