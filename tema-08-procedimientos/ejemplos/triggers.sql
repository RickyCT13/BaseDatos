-- Trigger: actualizar_saldo
-- Momento: AFTER (después de)
-- Evento: INSERT
-- Tabla: movimientos
-- Descripción: Actualiza la columna saldo de la tabla cuentas, cada vez que se inserte
-- un registro en la tabla Movimientos.
DELIMITER $$
DROP TRIGGER IF EXISTS bancos.trigger_saldo$$
CREATE TRIGGER bancos.trigger_saldo AFTER INSERT ON bancos.movimientos
FOR EACH ROW
BEGIN
	UPDATE bancos.cuentas SET saldo = saldo + NEW.cantidad WHERE id = NEW.cuenta_id;
END$$

DELIMITER ;
INSERT movimientos VALUE (NULL, 1, NULL, 'Transferencia','R', -50.10)

-- Trigger: act_mov_act_saldo
-- Momento: AFTER (después de)
-- Evento: UPDATE
-- Tabla: movimientos
-- Descripción: Actualiza la columna saldo de la tabla cuentas, cada vez que se ACTUALICE
-- un registro en la tabla Movimientos.
DELIMITER $$
DROP TRIGGER IF EXISTS bancos.act_mov_act_saldo$$
CREATE TRIGGER bancos.act_mov_act_saldo AFTER UPDATE ON bancos.movimientos
FOR EACH ROW
BEGIN
DECLARE act_saldo DECIMAL(10,2);
 SET act_saldo = NEW.cantidad - OLD.cantidad;
UPDATE bancos.cuentas SET saldo = saldo + act_saldo WHERE id=OLD.cuenta_id;
END$$
-- Ejemplos
UPDATE movimientos SET cantidad = 100 WHERE id = 24;
UPDATE movimientos SET cantidad = -20.10 WHERE id = 25;
