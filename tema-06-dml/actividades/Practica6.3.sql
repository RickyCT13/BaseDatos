-- Práctica 6.3: Sentencias básicas DML: DELETE
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW


USE futbol;

-- DELETE FROM jugadores ORDER BY fecha_nac ASC LIMIT 1;

DELETE FROM jugadores 
WHERE
    id = (SELECT 
        id
    FROM
        jugadores
    ORDER BY fecha_nac ASC
    LIMIT 1) LIMIT 1;
    
DELETE FROM jugadores 
WHERE
    equipo_id = 2;

DELETE FROM jugadores 
WHERE
    fecha_nac LIKE '1970-%-%';

-- DELETE FROM goles 
-- WHERE
--     jugador_id = 12;

delete from goles
where jugador_id in (select id from (select id from jugadores where id = 12) x);