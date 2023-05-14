/* Práctica 8.4: Cursores
Ricardo Moreno Cantea, 1ºDAW */



/* 1. Crear el procedimiento actualizar_saldo() para la base de datos bancos teniendo en cuenta los siguientes requisitos:

- Se ha de utilizar la función SaldoCuentas() creada en apartados anteriores
- Se ha de declarar dentro del procedimiento un Cursor 
- Se ha de manejar los errores de fin de cursor
- Este procedimiento comprobará si la columna saldo de la tabla cuentas coincide con el valor que devuelve la función SaldoCuentas(), sólo en el caso de que no coincida procederá a su actualización.
- Además cada vez que encuentre un descuadre mostrará id cuenta, IBAN, Saldo Actual, Saldo que devuelve la función y saldo de descudre */

DELIMITER $$
DROP PROCEDURE IF EXISTS bancos.actualizar_saldo$$
CREATE PROCEDURE bancos.actualizar_saldo()
BEGIN

	DECLARE vid int unsigned;
    declare viban char(22);
    declare vsaldo decimal(10,2);
    declare vsaldo_real decimal(10,2);
    declare vdiferencia decimal(10,2);
	DECLARE lrf BOOLEAN;
    DECLARE i INT UNSIGNED;
    DECLARE cursor01 CURSOR FOR SELECT id, iban, saldo, SaldoCuentas(id), (saldo - SaldoCuentas(id)) diferencia FROM cuentas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;
    SET lrf = 0, i = 1;
    OPEN cursor01;
    WHILE NOT lrf DO
		FETCH cursor01 INTO vid, viban, vsaldo, vsaldo_real, vdiferencia;
        IF vdiferencia != 0 THEN
			# SELECT vid, viban, vsaldo, vsaldo_real, vdiferencia;
            UPDATE cuentas set saldo = vsaldo_real where id = vid;
        END IF;
		SET i = i + 1;
    END WHILE;
    CLOSE cursor01;
    
END$$

/* 2. Crear el procedimiento mantenimiento para la base de datos bancos que implicará aplicar una cuota de mantenimiento anual a todas las cuentas por un importe de 20 €.

Los requisitos para la realización de este procedimiento son los siguientes:

- La cuota de mantenimiento se aplicará a todas las cuentas
- Se deberá crear un cursor que almacene el id de todas las cuentas
- Por cada cuenta se deberá crear un nuevo registro en la tabla movimientos con los siguientes valores:
	- Fecha hora actual
	- Concepto será "Cuota mantenimiento 2021"
	- Tipo de movimiento "R"
	- Importe -20 € */

DELIMITER $$
DROP PROCEDURE IF EXISTS bancos.cuota_mantenimiento$$
CREATE PROCEDURE bancos.cuota_mantenimiento()
BEGIN

	DECLARE vid INT UNSIGNED;
    DECLARE lrf BOOLEAN;
    declare i INT UNSIGNED;
    DECLARE cursor_cuota cursor for select id from cuentas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;
    SET lrf = 0;
    OPEN cursor_cuota;
    loopcursor: LOOP
		FETCH cursor_cuota into vid;
        IF lrf THEN LEAVE loopcursor;
        END IF;
        INSERT INTO movimientos VALUES (NULL, vid, CURRENT_TIMESTAMP(), concat('Cuota Mantenimiento ', YEAR(CURRENT_TIMESTAMP())), 'R', '-20.00');
    DELETE FROM movimientos limit 1;
	END LOOP;
    CLOSE cursor_cuota;
END$$

/* 3. Se trata del mismo procedimiento anterior sólo que el importe de la cuota dependerá de los siguientes requisitos:

- Para saldos <2000 € el importe será de - 20
- Para saldos entre 2000 y 10000 €, el importe será de - 10 €
- Para saldos superiores a 10000, el importe será de 5 € */

DELIMITER $$
DROP PROCEDURE IF EXISTS bancos.cuota_mantenimiento_alt$$
CREATE PROCEDURE bancos.cuota_mantenimiento_alt()
BEGIN

	DECLARE vid INT UNSIGNED;
    DECLARE cuota DECIMAL(10,2);
    DECLARE lrf BOOLEAN DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE cursor_cuota cursor for select id from cuentas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;
    OPEN cursor_cuota;
    loopcursor: LOOP
		FETCH cursor_cuota into vid;
        IF lrf THEN LEAVE loopcursor;
        END IF;
		IF SaldoCuentas(vid) < 2000.00 then SET cuota = -20.00;
		ELSEIF SaldoCuentas(vid) > 10000.00 then SET cuota = -5.00;
		ELSE SET cuota = -10.00;
		END IF;
		INSERT INTO movimientos VALUES (NULL, vid, CURRENT_TIMESTAMP(), concat('Cuota Mantenimiento ', YEAR(CURRENT_TIMESTAMP())), 'R', cuota);
    END LOOP;
    CLOSE cursor_cuota;

END$$


