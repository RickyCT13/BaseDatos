-- Práctica 5.8: Restricciones PRIMARY KEY y FOREIGN KEY
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW
-- Creación de Base de Datos para un centro educativo

DROP DATABASE IF EXISTS centro_educativo;
CREATE DATABASE IF NOT EXISTS centro_educativo CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

USE centro_educativo;

-- Tabla depts.
DROP TABLE IF EXISTS departamentos;
CREATE TABLE IF NOT EXISTS departamentos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    cod_departamento CHAR(3) NOT NULL UNIQUE
);

-- Tabla profesores
DROP TABLE IF EXISTS profesores;
CREATE TABLE IF NOT EXISTS profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    email VARCHAR(255) UNIQUE,
    fecha_ingreso DATE NOT NULL,
    especialidad VARCHAR(20) NOT NULL,
    nrp CHAR(16) NOT NULL UNIQUE,
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_departamento)
        REFERENCES departamentos (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla asignaturas
DROP TABLE IF EXISTS asignaturas;
CREATE TABLE IF NOT EXISTS asignaturas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    nivel CHAR(4) NOT NULL,
    cod_asignatura CHAR(7) NOT NULL UNIQUE,
    horas SMALLINT UNSIGNED,
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_departamento)
        REFERENCES departamentos (id)
        ON DELETE RESTRICT ON UPDATE CASCADE

);

-- Tabla horarios
DROP TABLE IF EXISTS horarios;
CREATE TABLE IF NOT EXISTS horarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT UNSIGNED,
    FOREIGN KEY (id_profesor)
        REFERENCES profesores (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    dia TINYINT(5) UNSIGNED NOT NULL,
    tramo TINYINT(6) UNSIGNED NOT NULL,
    turno BOOL,
    id_asignatura INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_asignatura)
        REFERENCES asignaturas (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    horas TINYINT(6)
);