# Práctica 8.7: Triggers II, auditorías
# Ricardo Moreno Cantea, 1ºDAW

# 1. Creación tabla

DROP TABLE IF EXISTS bancos.auditoria_movimientos;
CREATE TABLE IF NOT EXISTS bancos.auditoria_movimientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evento VARCHAR(15),
    cuenta_id_ant INT UNSIGNED,
    fechahora_ant TIMESTAMP,
    tipo_ant CHAR(1),
    cantidad_ant DECIMAL(8 , 2 ),
    cuenta_id_nuv INT UNSIGNED,
    fechahora_nuv TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_nuv CHAR(1),
    cantidad_nuv DECIMAL(10 , 2 ),
    usuario VARCHAR(40),
    fecharegsitro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# 2. Auditar inserción

x

# 3. Auditar modificación

DELIMITER $$
DROP TRIGGER IF EXISTS bancos.auditar_update_mov  $$
CREATE TRIGGER bancos.auditar_update_mov BEFORE UPDATE ON movimientos
FOR EACH ROW
BEGIN

	INSERT INTO auditoria_movimientos VALUES(NULL, 'UPDATE', OLD.cuenta_id, OLD.fechahora, OLD.tipo, OLD.cantidad, NEW.cuenta_id, DEFAULT, NEW.tipo, NEW.cantidad, CURRENT_USER(), DEFAULT);

END $$

# 4. Auditar borrado

DELIMITER $$
DROP TRIGGER IF EXISTS bancos.auditar_delete_mov  $$
CREATE TRIGGER bancos.auditar_delete_mov BEFORE DELETE ON movimientos
FOR EACH ROW
BEGIN

	INSERT INTO auditoria_movimientos (id, evento, cuenta_id_ant, fechahora_ant, tipo_ant, cantidad_ant, usuario, fecharegistro) VALUES (NULL, 'DELETE', OLD.cuenta_id, OLD.fechahora, OLD.tipo, OLD.cantidad, CURRENT_USER(), DEFAULT);

END $$

