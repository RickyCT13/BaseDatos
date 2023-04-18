-- Ejemplo 2.
-- Clasificación general de una carrera
-- Base de datos maratoon
# Especificación del delimitador del procedimiento
DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.clasificacion $$ # Borramos el proc. si existe
CREATE PROCEDURE maratoon.clasificacion(IN id_carrera INT UNSIGNED)
BEGIN # Cuerpo del procedimiento

	SELECT 
		r.id Reg,
		co.id,
		co.apellidos,
		co.nombre,
		co.Club_id,
		cl.NombreCorto Club,
		co.Categoria_id,
		ca.NombreCorto Categoria,
		r.TiempoInvertido
	FROM
		maratoon.corredores co
			INNER JOIN
		maratoon.clubs cl ON co.Club_id = cl.id
			INNER JOIN
		maratoon.categorias ca ON co.categoria_id = ca.id
			INNER JOIN
		maratoon.registros r ON co.id = r.corredor_id
	WHERE
		r.carrera_id = id_carrera
	ORDER BY r.TiempoInvertido ASC;
    
END $$ # Fin del procedimiento
select * from maratoon.corredores;