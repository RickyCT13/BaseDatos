/* Cursores:
Son parecidos a los arrays, al almacenar varios valores en una sola variable */

-- Ejemplo18: SELECT … INTO variables
-- Uso Base de Datos Maratoon
DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.ObtenerCorredor $$
CREATE PROCEDURE maratoon.ObtenerCorredor(id_corredor INT) 
BEGIN
	DECLARE vid INT UNSIGNED;
	DECLARE vNombre vARCHAR(20);
	DECLARE vApellidos vARCHAR(45);
	DECLARE vEdad TINYINT UNSIGNED;
	DECLARE vCategoria CHAR(3);
	DECLARE vClub vARCHAR(30);
	SELECT 
		c.Id,
		c.Nombre,
		c.Apellidos,
		c.Edad,
		ca.Nombrecorto,
		cl.Nombre
	INTO
		vid,
		vNombre, 
		vapellidos, 
		vEdad, 
		vCategoria,
		vClub 
    FROM
		corredores AS c
			JOIN
		categorias AS ca on c.categoria_id = ca.id
			JOIN
		clubs AS cl on c.club_id = cl.id
	WHERE
		c.id = id_corredor;
	SELECT vid, vNombre, vapellidos, vEdad, vCategoria, vClub;
END$$

SET @NumCorredor=3;
CALL maratoon.ObtenerCorredor(@NumCorredor);


-- Cursores con estructura LOOP
/* Es necesario controlar los cursores con handlers para evitar los errores como el 1329 */
DELIMITER $$
DROP PROCEDURE IF EXISTS Corredores_Poblacion$$
CREATE procedure Corredores_Poblacion(PCiudad VARCHAR(20))
BEGIN 
	DECLARE Vid INT;
	DECLARE VNombre VARCHAR(20);
	DECLARE VApellidos VARCHAR(40);
	DECLARE VCiudad VARCHAR(20);
	DECLARE lrf BOOLEAN;
	DECLARE nreg INT;
	DECLARE Cursor01 CURSOR FOR SELECT id, Nombre, Apellidos, Ciudad FROM Corredores WHERE Ciudad=PCiudad;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;
	SET lrf=0, nreg=0;
	OPEN Cursor01;
	l_cursor: LOOP
		FETCH Cursor01 INTO Vid, VNombre, VApellidos, VCiudad;
		SELECT Vid, VNombre, VApellidos, VCiudad;
		IF lrf=1 THEN
			LEAVE l_cursor;
		END IF;
		SET nreg=nreg+1;
	END LOOP l_cursor;
	CLOSE Cursor01;
END $$

CALL Corredores_Poblacion('Ubrique');
