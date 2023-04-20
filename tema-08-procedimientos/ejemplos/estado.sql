-- Ejmplo04: Función que devuelve el estado de un alimento
-- Parametro es un carácter de tipo CHAR(1)
-- RETURNS – el valor que devuelve esta función es de tipo VARCHAR(20)
DELIMITER $$
DROP FUNCTION IF EXISTS test.estado$$
CREATE FUNCTION test.estado(in_estado CHAR(1))
	RETURNS VARCHAR(20)
BEGIN
	DECLARE estado VARCHAR(20);
	IF in_estado = 'P' THEN
		SET estado = 'caducado';
	ELSEIF in_estado = 'O' THEN
		SET estado = 'activo';
	ELSEIF in_estado = 'N' THEN
		SET estado = 'nuevo';
	END IF;
	RETURN(estado);
END$$

-- Ejmplo05 Modificado: Función EsPar()
-- Parámetro de entrada será un valor de tipo INT
-- RETURNS – Devolverá un valor de tipo BOOLEAN
DELIMITER $$
DROP FUNCTION IF EXISTS test.espar$$
CREATE FUNCTION test.espar(numero INT)
	RETURNS BOOLEAN
BEGIN
	IF MOD(numero, 2) = 0 THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END$$

-- Ampliación: Procedimiento que usa espar()
DELIMITER $$
DROP PROCEDURE IF EXISTS test.escribirpar$$
CREATE PROCEDURE test.escribirpar(IN numero INT)
BEGIN
	DECLARE str VARCHAR(20);
	IF (espar(numero)) THEN SET str = "es par.";
    ELSE SET str = "es impar";
	END IF;
    SELECT concat_ws(' ', numero, str);
END$$

-- Ejemplo07: importeventa
-- RETURNS: el importe total de una venta a partir de los registros lineeasventa asociados
-- Parémtros: id de la venta
DELIMITER $$
DROP FUNCTION IF EXISTS geslibros.importeventa$$
CREATE FUNCTION geslibros.importeventa(id_venta INT UNSIGNED)
	RETURNS DECIMAL(10, 2)
BEGIN
	DECLARE importe_venta DECIMAL(10, 2);
	SET importe_venta = (SELECT SUM(importe) FROM geslibros.lineasventas WHERE venta_id = id_venta);
	RETURN(importe_venta);
END$$

-- Ejemplo08: actualizar_importe_ventas
-- Parémtros: id venta
-- Descripción: usando la función importeventa para actualizar la columna
-- importetotal de la tabla ventas.
DELIMITER $$
DROP PROCEDURE IF EXISTS geslibros.actualizar_importe_bruto $$
CREATE PROCEDURE geslibros.actualizar_importe_bruto(IN venta_id INT UNSIGNED)
BEGIN
UPDATE geslibros.ventas SET importe_bruto = geslibros.importeventa(venta_id) WHERE
id = venta_id;
END $$

-- Devolver importe iva
DELIMITER $$
DROP FUNCTION IF EXISTS geslibros.devolver_importe_iva$$
CREATE FUNCTION geslibros.devolver_importe_iva(id_venta INT UNSIGNED)
	RETURNS DECIMAL(10, 2)
BEGIN
	DECLARE importe_iva_f DECIMAL(10, 2);
	SET importe_iva_f = (SELECT sum(importe * iva) FROM geslibros.lineasventas WHERE venta_id = id_venta);
	RETURN(importe_iva_f);
END$$

-- Hacer un procedimiento que calcule el importe total a partir de las dos funciones anteriores
DELIMITER $$
DROP PROCEDURE IF EXISTS geslibros.actualizar_importe_total$$
CREATE PROCEDURE geslibros.actualizar_importe_total (IN id_venta_f INT UNSIGNED)
BEGIN

	UPDATE geslibros.ventas SET importe_total = (geslibros.importeventa(id_venta_f) + geslibros.devolver_importe_iva(id_venta_f)) where id = id_venta_f;

END$$

