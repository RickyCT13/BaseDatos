# Práctica 8.3: Estructuras de control en MySQL
# Ricardo Moreno Cantea, 1ºDAW

/* 1. Id de categoría
Crear una función Categoria() para la base de datos maratoon que devuelva el id de una categoría a partir de la edad de un corredor.
El intervalo de edad de cada categoría está registrado en la columna descripción de la tabla categorias
 */
 
DELIMITER $$
DROP FUNCTION IF EXISTS maratoon.Categoria $$
CREATE FUNCTION maratoon.Categoria(edad INT UNSIGNED)
RETURNS INT UNSIGNED
BEGIN

	CASE
    WHEN edad < 12 THEN RETURN 1;
    WHEN edad < 15 THEN RETURN 2;
    WHEN edad < 18 THEN RETURN 3;
    WHEN edad < 30 THEN RETURN 4;
    WHEN edad < 40 THEN RETURN 5;
    WHEN edad < 50 THEN RETURN 6;
    WHEN edad < 60 THEN RETURN 7;
    WHEN edad >= 60 THEN RETURN 8;
    END CASE;

END$$
 
 /* 2. Procedimiento ActualizarCategoria

Crear el procedimiento ActualizarCategoria para la base de datos maratoon que actualice la columna categoria_id de todos los corredores. En dicho procedimiento hay que utilizar obligatoriamente la función categoria() del apartado anterior. */
 
DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.ActualizarCategoria $$
CREATE PROCEDURE maratoon.ActualizarCategoria()
BEGIN

	UPDATE corredores SET categoria_id = maratoon.Categoria(edad);

END$$
 
 /* 3. Procedmiento ProximoCumpleaños

Crear el procedimiento ProximosCumpleaños para la base de datos maratoon de forma que devuelva un listado con todos los corredores que cumplen año en la semana siguiente a la actual. */
 
DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.ProximoCumple$$
CREATE PROCEDURE maratoon.ProximoCumple()
BEGIN

	SELECT * FROM maratoon.corredores WHERE WEEK(FechaNacimiento) = WEEK(now()) + 1;

END$$

 /* 4. Función Números Primos

Crear la función NumerosPrimos para la base de datos test que dado un valor numérico entero, devuelva la suma de todos los números primos que hay desde el 1 hasta ese valor.

Por ejemplo si introduzco el 7 los números primos desde el 1 al 7 serían 1, 2, 3, 5, 7 la suma de estos números es 18, valor que tendría que devolver la función. */

/* NOTA: Según varias fuentes, el 1 no es considerado un número primo, por lo que la suma de los números primos empezará desde el 2.*/


# Usamos una función auxiliar para averiguar si el número analizado en el bucle es primo.
DELIMITER $$
DROP FUNCTION IF EXISTS test.EsPrimo$$
CREATE FUNCTION test.EsPrimo(n INT UNSIGNED)
	RETURNS BOOLEAN
BEGIN

	DECLARE i INT;
    DECLARE esPrimo BOOLEAN;
    SET i = 2;
    SET esPrimo = TRUE;
    IF n = 0 OR n = 1 THEN SET esPrimo = FALSE;
    END IF;
    IF n = 2 THEN SET esPrimo = TRUE;
    END IF;
    WHILE i < n DO
		IF MOD(n, i) = 0 THEN SET esPrimo = FALSE;
		END IF;
		SET i = i + 1;
    END WHILE;
    RETURN esPrimo;

END$$

DELIMITER $$
DROP FUNCTION IF EXISTS test.NumerosPrimos$$
CREATE FUNCTION test.NumerosPrimos(n INT UNSIGNED)
	RETURNS INT UNSIGNED
BEGIN

	DECLARE i INT;
    DECLARE totPrimos INT;
    SET i = 2;
    SET totPrimos = 0;
    WHILE i <= n DO
		IF test.EsPrimo(i) THEN SET totPrimos = totPrimos + i;
        END IF;
        SET i = i + 1;
	END WHILE;
    RETURN totPrimos;

END$$
 
 /* 5. Factorial

Crear la función factorial sobre la base de datos test que dado un valor entero como parámetro devuelva el valor del factorial.

Por ejemplo si introduzco el 5 el factorial sería 1*2*3*4*5 = 120 */

DELIMITER $$
DROP FUNCTION IF EXISTS test.Factorial$$
CREATE FUNCTION test.Factorial(n INT UNSIGNED)
	RETURNS INT
BEGIN

	DECLARE i INT;
    DECLARE factorial INT;
    SET i = 1;
    SET factorial = 1;
	IF n = 0 THEN RETURN -1;
    END IF;
    WHILE i <= n DO
		SET factorial = factorial * i;
		SET i = i + 1;
    END WHILE;
    RETURN factorial;

END$$