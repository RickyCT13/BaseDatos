# Práctica 8.6: Eventos
# Ricardo Moreno Cantea, 1ºDAW

SET GLOBAL event_scheduler=ON;
SHOW VARIABLES LIKE 'event_scheduler';

# 1. movimientos semanales

DELIMITER $$
DROP EVENT IF EXISTS bancos.movimientos_semanales $$
CREATE EVENT bancos.movimientos_semanales ON SCHEDULE EVERY 1 WEEK STARTS '2023-05-14 00:00:00' ENABLE
DO
BEGIN

	SELECT 
		*
	FROM
		bancos.movimientos INTO OUTFILE 'ruta/al/fichero.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

END $$

# 2. verificacion_saldo_diario

DELIMITER $$
DROP EVENT IF EXISTS bancos.verificacion_saldo_diario $$
CREATE EVENT bancos.verificacion_saldo_diario ON SCHEDULE EVERY 1 DAY ENABLE
DO
BEGIN

	CALL bancos.actualizar_saldo();

END $$

# 3. verificacion_cliente_mensual

DELIMITER $$
DROP EVENT IF EXISTS bancos.verificacion_cliente_mensual $$
CREATE EVENT bancos.verificacion_cliente_mensual ON SCHEDULE EVERY 1 MONTH ENABLE
DO
BEGIN

	SELECT 
		cl.id, cl.nombre, cl.apellidos, cl.email, cu.iban, cu.saldo
	FROM
		clientes cl
			INNER JOIN
		cuentas cu ON cu.cliente_id = cl.id
	WHERE
		cu.saldo < 0
	INTO OUTFILE 'ruta/clientesenrojo.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';

END $$



