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
HAVING YEAR(v.fecha) = 2014
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
HAVING l.stock BETWEEN 10 AND 20
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
    COUNT(*) numero_ventas,
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
ORDER BY suma_importes DESC;

# 8. Se desea obtener el volumen total de ventas por Editorial

SELECT 
    e.id,
    e.nombre,
    COUNT(v.id) num_ventas,
    SUM(v.importe_total) suma_importes
FROM
    editoriales e
        INNER JOIN
    libros l ON l.editorial_id = e.id
        INNER JOIN
    lineasventas lv ON lv.libro_id = l.id
        INNER JOIN
    ventas v ON lv.venta_id = v.id
GROUP BY e.id
ORDER BY suma_importes DESC;

# 9. Obtener una vista llamada ventas_editoriales a partir del script anterior.

CREATE OR REPLACE VIEW ventas_editoriales AS
    SELECT 
        e.id,
        e.nombre,
        COUNT(v.id) num_ventas,
        SUM(v.importe_total) suma_importes
    FROM
        editoriales e
            INNER JOIN
        libros l ON l.editorial_id = e.id
            INNER JOIN
        lineasventas lv ON lv.libro_id = l.id
            INNER JOIN
        ventas v ON lv.venta_id = v.id
    GROUP BY e.id
    ORDER BY suma_importes DESC;
    
# 10. Insertar un libro con datos válidos en la tabla libros a partir de los requisitos mencionados.

# insert into editoriales (id, nombre, direccion, poblacion, provincia_id, c_postal, nif, telefono, movil, email, web, contacto) values (5,'Alfaguara','Calle Torrelaguna, 60','Madrid',28,'28043','A0818624X','917449060','917449224','alfaguara@santillana.es','http://www.alfaguara.com/es/', 'Isidoro Moreno');

insert into libros values (null, '9788448180833', '9788888199586', 'Introducción a la estadística y matemáticas orientadas al desarrollo de aplicaciones web', 1, 5, 15.00, 20.00, 15, 1, 25, '2019-05-13', default, default);

# 11. Insertar los registros adecuados en la tabla Libros_temas, teniendo en cuenta que el libro anterior es novela, ciencia y astronomía

insert into libros_temas (libro_id, tema_id) values (20, 3), (20, 7), (20, 9);

# 12. 

delete from ventas where id = 12;

insert into ventas values (null, 7, '2023-09-12', 226.29, 47.53, 273.81, default, default);

insert into lineasventas values (null, 12, 1, 4, 0.210, 2, 30.81, 61.62, default, default), (null, 12, 2, 2, 0.210, 2, 30.60, 61.20, default, default), (null, 12, 3, 3, 0.210, 3, 34.49, 103.47, default, default); 




