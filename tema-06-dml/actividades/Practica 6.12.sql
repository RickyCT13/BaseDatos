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