DELIMITER $$
DROP FUNCTION IF EXISTS test.fib$$
CREATE FUNCTION test.fib(n INT UNSIGNED)
	RETURNS INT UNSIGNED
BEGIN

	DECLARE a INT UNSIGNED;
    DECLARE b INT UNSIGNED;
    DECLARE c INT UNSIGNED;
    DECLARE i INT UNSIGNED;
    SET a = 0, b = 1, i = 0;
    WHILE i < n DO
		SET c = b + a;
        SET a = b;
        SET b = c;
        SET i = i + 1;
	END WHILE;
    RETURN a;

END$$

DROP FUNCTION IF EXISTS test.gcd$$

SELECt test.fib(7);