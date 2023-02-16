-- Actividad 5.6
-- Título: Tablas compuestas
-- Alumno: Ricardo Moreno
-- Curso: 1DAW 22/23
-- Fecha: 10/1/23

USE test;

DROP TABLE IF EXISTS alumnos;
CREATE TABLE IF NOT EXISTS alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(15),
    apellidos VARCHAR(15),
    dni CHAR(9) UNIQUE,
    fecha_nac DATE,
    edad TINYINT UNSIGNED,
    poblacion VARCHAR(20),
    direccion VARCHAR(255),
    cpostal CHAR(5),
    provincia VARCHAR(20),
    nacionalidad VARCHAR(20),
    telefono CHAR(12),
    email VARCHAR(255)
);

DROP TABLE IF EXISTS articulos;
CREATE TABLE IF NOT EXISTS articulos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255),
    referencia VARCHAR(20),
    precio_coste DECIMAL(10 , 2) UNSIGNED,
    precio_venta DECIMAL(10 , 2) UNSIGNED,
    descuento FLOAT(2 , 2 ) UNSIGNED,
    imagen VARCHAR(255),
    categoria VARCHAR(20),
    stock INT,
    stock_min INT,
    stock_max INT
);

DROP TABLE IF EXISTS registro_llegadas;
CREATE TABLE IF NOT EXISTS registro_llegadas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_salida DATETIME,
    fecha_hora_llegada DATETIME,
    tiempo_realizado TIME,
    id_corredor INT UNSIGNED
);

insert into alumnos VALUE
(
	1,
    "Juan",
    "García Pérez",
    "36549872X",
    2004-01-01,
    19,
    "Villamartín",
    11650,
    "Cádiz",
    "Española",
    "+34622554477"
    "juangarpe109x0@correoficticio.com"
)