# Ejercicio 5.3: Tipos de datos Numéricos
# Eliminar, si existen, la base de datos 'tipos_datos' y la tabla 'tipos_datos_num'
# Crear, si no existen, la base de datos y la tabla mencionadas anteriormente, con charset utf8mb4 y colación utf8mb4_general_ci

-- Creación de bases de datos y eliminación de otras previas
DROP DATABASE IF EXISTS tipos_datos;
CREATE DATABASE IF NOT EXISTS tipos_datos CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

-- Creación de la tabla tipos_datos_num y eliminación de otras previas
DROP TABLE IF EXISTS tipos_datos_num;
CREATE TABLE IF NOT EXISTS tipos_datos_num (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_camiseta TINYINT(30) UNSIGNED UNIQUE,
    diferencia_goles TINYINT SIGNED,
    goles_afavor TINYINT UNSIGNED,
    goles_encontra TINYINT UNSIGNED,
    num_habitantes INT UNSIGNED,
    humedad FLOAT(1, 2) UNSIGNED,
    precipitaciones SMALLINT UNSIGNED,
    temperatura_maxima TINYINT SIGNED,
    temperatura_minima TINYINT SIGNED,
    velocidad_viento SMALLINT(300) UNSIGNED,
    altura SMALLINT UNSIGNED,
    precio SMALLINT UNSIGNED,
    sueldo SMALLINT UNSIGNED,
    seno DOUBLE(1, 10) UNSIGNED,
    coseno DOUBLE(1, 10) UNSIGNED,
    tangente DOUBLE(1, 10) UNSIGNED
);
