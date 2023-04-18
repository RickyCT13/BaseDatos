# Práctica 8.1: Procedimientos en MySQL
# Ricardo Moreno Cantea, 1ºDAW

# 1. Clientes

DELIMITER $$
DROP PROCEDURE IF EXISTS clientes_ciudad $$
CREATE PROCEDURE bancos.clientes_ciudad(IN pob VARCHAR(20))
BEGIN

	# SELECT * FROM clientes WHERE ciudad LIKE concat('%', pob, '%');
	SELECT * FROM clientes WHERE ciudad = pob;
END;

# 2. Movimientos

DELIMITER $$
DROP PROCEDURE IF EXISTS movimientos_cuentas $$
CREATE PROCEDURE bancos.movimientos_cuentas(IN id_cuenta_pr INT UNSIGNED)
BEGIN

	SELECT * FROM movimientos WHERE cuenta_id = id_cuenta_pr;

END;

# 3. Cuentas

DELIMITER $$
DROP PROCEDURE IF EXISTS clientes_cuentas $$
CREATE PROCEDURE bancos.clientes_cuentas(IN id_cliente_pr INT UNSIGNED)
BEGIN

	SELECT * FROM cuentas WHERE cliente_id = id_cliente_pr;

END;

# 4. SaldosBajos

DELIMITER $$
DROP PROCEDURE IF EXISTS saldosBajos $$
CREATE PROCEDURE bancos.saldosBajos()
BEGIN

	SELECT cu.id, cu.iban, cl.nombre, cl.apellidos, cl.dni, cu.saldo FROM cuentas cu INNER JOIN clientes cl ON cu.cliente_id = cl.id;

END;