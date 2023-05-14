# Práctica 8.5: Triggers
# Ricardo Moreno Cantea, 1ºDAW

/* 1. bonificacion_apertura() */

DELIMITER $$
DROP TRIGGER IF EXISTS bancos.bonificacion_apertura $$
CREATE TRIGGER bancos.bonficiacion_apertura after insert on bancos.cuentas
for each row
begin

	INSERT into movimientos values(null, new.id, default, 'Bonificación Apertura Cuenta', 'I', '20.00');
	UPDATE cuentas SET saldo = saldo + 20.00 where id = new.id;

end$$

/* 2. validar_movimientos() */
DELIMITER $$
DROP TRIGGER IF EXISTS bancos.validar_movimiento $$
CREATE TRIGGER bancos.validar_movimiento BEFORE insert on bancos.movimientos
for each row
begin
	declare v_saldo DECIMAL(10,2);
    SELECT SaldoCuentas(cuenta_id) into v_saldo;
    if new.tipo = 'R' and new.cantidad >= v_saldo then set new.cantidad = 0;
	else update cuentas set saldo = saldo + new.cantidad where id = new.cuenta_id;
	end if;
end$$