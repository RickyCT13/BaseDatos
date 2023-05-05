# Práctica 8.2: Funciones en MySQL
# Ricardo Moreno Cantea, 1ºDAW

/* 1. Función SaldoTotal */

DELIMITER $$
DROP FUNCTION IF EXISTS bancos.SaldoTotal$$
CREATE FUNCTION bancos.SaldoTotal()
	RETURNS DECIMAL(10,2)
BEGIN

	RETURN SUM(cuentas.saldo);

END$$

/* 2. Función MejorCliente */

DELIMITER $$
DROP FUNCTION IF EXISTS bancos.MejorCliente$$
CREATE FUNCTION bancos.MejorCliente()
	RETURNS INT UNSIGNED
BEGIN

	RETURN (SELECT id from clientes cl inner join cuentas cu on cu.cliente_id = cl.id WHERE cu.saldo = MAX(clientes.saldo));

END$$

/* 3. Función SaldoCuentas  */

DELIMITER $$
DROP FUNCTION IF EXISTS bancos.SaldoCuentas$$
CREATE FUNCTION bancos.SaldoCuentas(id_cuenta INT UNSIGNED)
	RETURNS DECIMAL(10,2)
BEGIN

	RETURN (SELECT SUM(cantidad) from movimientos WHERE cuenta_id = id_cuenta);

END$$

/* 4. Procedimiento VerificarSaldo */

DELIMITER $$
DROP PROCEDURE IF EXISTS bancos.VerificarSaldo$$
CREATE PROCEDURE bancos.VerificarSaldo(IN id_cuenta INT UNSIGNED)
BEGIN

	IF (SELECT saldo FROM cuentas WHERE id = id_cuenta) != SaldoCuentas(id_cuenta) THEN
		SELECT 'ERROR DE SALDO', SaldoCuentas(id_cuenta) saldo_real, cuentas.* FROM cuentas WHERE id = id_cuenta;
	ELSE
		SELECT 'SALDO CORRECTO';
	END IF;

END$$


