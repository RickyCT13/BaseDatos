-- Ejmplo04: Función que devuelve el estado de un alimento
-- Parametro es un carácter de tipo CHAR(1)
-- RETURNS – el valor que devuelve esta función es de tipo VARCHAR(20)
DELIMITER $$
DROP FUNCTION IF EXISTS test.estado$$
CREATE FUNCTION test.estado(in_estado CHAR(1))
	RETURNS VARCHAR(20)
BEGIN
	DECLARE estado VARCHAR(20);
	IF in_estado='P' THEN
		SET estado='caducado';
	ELSEIF in_estado='O' THEN
		SET estado='activo';
	ELSEIF in_estado='N' THEN
		SET estado='nuevo';
	END IF;
	RETURN(estado);
END$$