# Práctica 6.13: Repaso Geslibros II
# Ricardo Moreno Cantea, 1ºDAW

USE geslibros;

# 1. Mostrar todos los libros ordenados por id donde se muestre entre otros detalles el nombre del autor.
-- Tabla principal: libros
-- Condición: todos los libros
-- Columnas: id, titulo, nombre del autor, fechaedicion, unidades (stock), precio_coste, precio_venta
-- Orden: id

SELECT 
    l.id,
    l.titulo 'Título',
    a.nombre 'Nombre autor',
    l.fecha_edicion 'Fecha de edición',
    l.stock,
    l.precio_coste 'Precio Coste',
    l.precio_venta 'Precio de Venta'
FROM
    libros l
        INNER JOIN
    autores a ON l.autor_id = a.id
ORDER BY l.id ASC;

# 2. Mostrar todos los libros ordenados por id donde se muestre entre otros detalles el nombre del autor y el nombre de la editorial.
-- Tabla principal: libros
-- Condición: todos los libros
-- Columnas: id, titulo, nombre del autor, nombre de la editorial, fechaedicion, unidades (stock), precio_coste, precio_venta
-- Orden: id

SELECT 
    l.id,
    l.titulo 'Título',
    a.nombre 'Nombre autor',
    e.nombre 'Nombre editorial',
    l.fecha_edicion 'Fecha de edición',
    l.stock,
    l.precio_coste 'Precio Coste',
    l.precio_venta 'Precio de Venta'
FROM
    libros l
        INNER JOIN
    autores a ON l.autor_id = a.id
        INNER JOIN
    editoriales e ON l.editorial_id = e.id
ORDER BY l.id ASC;

# 3. Mostrar los detalles de la ventas en las que el importe total sea superior 500 €. Las ventas han de mostrar el nombre del cliente.
-- Tabla principal: ventas
-- Condición: importe total superior a 500 €
-- Columnas: id, nombre cliente, fecha, importe_bruto, importe_iva, importe_total
-- Orden: id

SELECT 
    v.id,
    c.nombre 'Cliente',
    v.fecha,
    v.importe_bruto 'Importe Bruto',
    v.importe_iva 'Importe IVA',
    v.importe_total 'Total'
FROM
    ventas v
        INNER JOIN
    clientes c ON v.cliente_id = c.id
WHERE
    v.importe_total > 500
ORDER BY v.id ASC;

# 4. Mostrar de cada cliente el importe total de ventas.
-- Tabla principal: ventas y clientes
-- Condición: todas las ventas
-- Columnas: id (cliente), nombre_cliente, importe total de las ventas realizadas
-- Orden: suma importe total

SELECT 
    c.id, c.nombre, SUM(v.importe_total) total_ventas
FROM
    clientes c
        INNER JOIN
    ventas v ON v.cliente_id = c.id
    group by c.id
ORDER BY total_ventas ASC;