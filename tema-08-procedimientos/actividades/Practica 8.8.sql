# Práctica 8.8: Actividad Final
# Ricardo Moreno Cantea, 1ºDAW



# 1. Función importe_bruto_venta()

DELIMITER $$
DROP FUNCTION IF EXISTS geslibros.importe_bruto_venta $$
CREATE FUNCTION geslibros.importe_bruto_venta(v_id_venta INT UNSIGNED)
RETURNS DECIMAL(10,2)
BEGIN

	RETURN (SELECT SUM(importe) FROM lineasventas WHERE venta_id = v_id_venta);

END $$

# 2. Función importe_iva_ventas()

DELIMITER $$
DROP FUNCTION IF EXISTS geslibros.importe_iva_ventas $$
CREATE FUNCTION geslibros.importe_iva_venta(id_venta INT UNSIGNED)
RETURNS DECIMAL(10,2)
BEGIN

	RETURN (SELECT SUM(importe * iva) FROM lineasventas WHERE venta_id = id_venta);

END $$

# 3. Procedimiento Estudio_stock

DELIMITER $$
DROP PROCEDURE IF EXISTS geslibros.estudio_stock $$
CREATE PROCEDURE geslibros.estudio_stock()
BEGIN

	DECLARE i INT UNSIGNED;
    DECLARE v_stock INT UNSIGNED;
    DECLARE v_stock_min INT UNSIGNED;
    SET i = 1;
	WHILE i <= count(libros.id) DO
		SELECT stock INTO v_stock FROM libros;
        SELECT stock_min INTO v_stock_min FROM libros;
		IF v_stock < v_stock_min THEN
			SELECT 'Rotura de stock:', id, titulo, precio_coste, stock, stock_min, stock_max, (stock_max - stock) AS stock_necesario FROM libros WHERE id = i;
		END IF;
        SET i = i + 1;
    END WHILE;

END $$

# 4. Procedimiento Verificar_importe_total_venta

DELIMITER $$
DROP PROCEDURE IF EXISTS geslibros.verificar_importe_total_venta $$
CREATE PROCEDURE geslibros.verificar_importe_total_venta()
BEGIN

	DECLARE v_importe_bruto, v_importe_iva, v_importe_total DECIMAL(10,2);
    DECLARE v_id, i INT UNSIGNED DEFAULT 1;
    DECLARE lrf BOOLEAN DEFAULT FALSE;
    DECLARE cursor_verif CURSOR FOR SELECT id, importe_bruto, importe_iva, importe_total FROM ventas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;
    
    loop_verif: LOOP IF lrf THEN LEAVE loop_verif; END IF;
    
		FETCH cursor_verif into v_id, v_importe_bruto, v_importe_iva, v_importe_total;
    
		IF v_importe_bruto != importe_bruto_venta(v_id) THEN UPDATE ventas SET importe_bruto = importe_bruto_venta(v_id) WHERE id = v_id;
		END IF;
		IF v_importe_iva != importe_iva_venta(v_id) THEN UPDATE ventas SET importe_iva = importe_iva_venta(v_id) WHERE id = v_id;
		END IF;
		IF v_importe_total != (importe_bruto_venta(v_id) + importe_iva_venta(v_id)) THEN UPDATE ventas SET importe_total = (importe_bruto_venta(v_id) + importe_iva_venta(v_id)) WHERE id = v_id;
		END IF;
    
    END LOOP;
    
END $$

# 5. TRIGGER actualizar_stock

DELIMITER $$
DROP TRIGGER IF EXISTS geslibros.actualizar_stock $$
CREATE TRIGGER geslibros.actualizar_stock AFTER INSERT ON lineasventas
FOR EACH ROW
BEGIN

	UPDATE libros SET stock = stock - new.cantidad where id = new.libro_id;

END $$

# 6. TRIGGER fuera_de_stock

DELIMITER $$
DROP TRIGGER IF EXISTS geslibros.fuera_de_stock $$
CREATE TRIGGER geslibros.fuera_de_stock BEFORE INSERT ON lineasventas
FOR EACH ROW
BEGIN

	DECLARE v_stock INT UNSIGNED;
	SELECT stock into v_stock from libros where id = new.libro_id;
	IF new.cantidad > v_stock THEN set new.cantidad = v_stock;
    END IF;

END $$

# 7. EVENT lineas_ventas

DELIMITER $$
DROP EVENT IF EXISTS geslibros.lineas_ventas $$
CREATE EVENT geslibros.lineas_ventas ON SCHEDULE EVERY 1 DAY DO
BEGIN

	SELECT * FROM lineasventas INTO OUTFILE 'C:/lineasventasdia.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n';
    
END $$

# 8. EVENT rebajas
DELIMITER $$
DROP EVENT IF EXISTS geslibros.rebajas $$
CREATE EVENT geslibros.rebajas ON SCHEDULE AT '2020-06-01' DO
BEGIN

	UPDATE libros SET precio_venta = precio_venta * 0.9;

END $$

