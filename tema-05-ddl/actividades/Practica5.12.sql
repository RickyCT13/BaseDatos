-- Práctica 5.12: Base de Datos Videoclub
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW
-- Nota: Los datos personales de todos los registros son ficticios

DROP DATABASE IF EXISTS Videoclub;
CREATE DATABASE IF NOT EXISTS Videoclub CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

USE Videoclub;

-- DROP TABLE IF EXISTS
-- CREATE TABLE IF NOT EXISTS  ();

DROP TABLE IF EXISTS Actores;
CREATE TABLE IF NOT EXISTS Actores (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (20),
    apellidos VARCHAR(20),
    nacionalidad VARCHAR(20),
    sexo ENUM('Masculino', 'Femenino', 'Otro'),
    fecha_nac DATE,
    num_peliculas SMALLINT UNSIGNED
);

INSERT INTO Actores VALUES (
	NULL,
    'José',
    'Ramirez Nuevo',
    'España',
    'Masculino',
    '1987-04-23',
    7
);

INSERT INTO Actores VALUES (
	NULL,
    'Anna',
    'Parker',
    'Estados Unidos',
    'Femenino',
    '1991-01-13',
    12
);

DROP TABLE IF EXISTS Directores;
CREATE TABLE IF NOT EXISTS Directores (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (20),
    apellidos VARCHAR(20),
    nacionalidad VARCHAR(20),
    fecha_nac DATE,
    num_peliculas SMALLINT UNSIGNED
);

INSERT INTO Directores VALUES (
	NULL,
    'Alexander',
    'Smith',
    'Reino Unido',
    '1974-12-01',
    18
);

INSERT INTO Directores VALUES (
	NULL,
    'Ana',
    'Jímenez',
    'Chile',
    '1980-11-30',
    12
);

DROP TABLE IF EXISTS Peliculas;
CREATE TABLE IF NOT EXISTS Peliculas (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(40),
    nacionalidad VARCHAR(20),
    productora VARCHAR(20),
    presupuesto INT UNSIGNED,
    anno_produccion YEAR,
    valoracion TINYINT UNSIGNED CHECK(valoracion BETWEEN 0 AND 10),
    premios VARCHAR(255),
    director_id INT UNSIGNED,
    FOREIGN KEY (director_id) REFERENCES Directores(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Peliculas VALUES (
	NULL,
    'Dinero y poder a cambio de tu humanidad',
    'Estados Unidos',
    'Blue Light Studios',
    '2018',
    '650000',
    '8',
    'Mejor película de Drama del año 2018',
    '1'
);

INSERT INTO Peliculas VALUES (
	NULL,
    'Puños de Titanio',
    'Estados Unidos',
    'Gray Clouds Studios',
    '2020',
    '230000',
    '9',
    'Mejor película de Acción de 2020',
    '2'
);

DROP TABLE IF EXISTS Ejemplares;
CREATE TABLE IF NOT EXISTS Ejemplares (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT UNSIGNED,
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    codigo_ejemplar INT UNSIGNED NOT NULL UNIQUE,
    formato VARCHAR(15),
    fecha_ejemplar DATE,
    estado ENUM('Disponible', 'No Devuelta', 'Alquilada', 'Baja')
);

INSERT INTO Ejemplares VALUES (
	NULL,
    '1',
    12838,
    'Blu-Ray',
    '2018-05-12',
    'Disponible'
);

INSERT INTO Ejemplares VALUES (
	NULL,
    '2',
    98231,
    'Digital',
    '2021-03-12',
    'Alquilada'
);

DROP TABLE IF EXISTS Socios;
CREATE TABLE IF NOT EXISTS Socios (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    direccion VARCHAR(255),
    poblacion VARCHAR(30),
    provincia VARCHAR(20),
    cod_post CHAR(5),
    telefono CHAR(9),
    email VARCHAR(255) UNIQUE CHECK (email LIKE '%@%'),
    id_socio_avalista INT UNSIGNED,
    FOREIGN KEY (id_socio_avalista) REFERENCES Socios(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Socios VALUES (
	NULL,
    'Juan Cobos Gómez',
    'Calle Extramuros 92 2ºB',
    'Villamartín',
    'Cádiz',
    '11650',
    '325987123',
    'JCobGom237@emailficticio.com',
    null
);

INSERT INTO Socios VALUES (
	NULL,
    'Victor Cobos Gomez',
    'Calle Extramuros 92 2ºB',
    'Villamartín',
    'Cádiz',
    '11650',
    '442365741',
    'v1c2g3@emailficticio.com',
    NULL
);

DROP TABLE IF EXISTS Participan;
CREATE TABLE IF NOT EXISTS Participan (
	id_pelicula INT UNSIGNED,
    id_actor INT UNSIGNED,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_actor) REFERENCES Actores(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha_incio DATE,
    fecha_fin DATE,
    papel VARCHAR(255),
    sueldo INT UNSIGNED,
    premios VARCHAR(255),
    valoracion TINYINT UNSIGNED CHECK (valoracion BETWEEN 0 AND 9)
);

INSERT INTO Participan VALUES (
	 1,
    '1',
    '2017-01-12',
    '2018-02-14',
    'Vagabundo 5',
    '35000',
    'Mejor Actor de Vagabundo',
    '9'
);

INSERT INTO Participan VALUES (
	 2,
    '2',
    '2018-09-23',
    '2019-08-12',
    'Alice',
    '45000',
    NULL,
    8
);

DROP TABLE IF EXISTS Alquila;
CREATE TABLE IF NOT EXISTS Alquila (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_ejemplar INT UNSIGNED,
    FOREIGN KEY (id_ejemplar) REFERENCES Ejemplares (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    id_socio INT UNSIGNED,
    FOREIGN KEY (id_socio) REFERENCES Socios (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha_alquiler DATE,
    fecha_devolucion DATE,
    precio TINYINT UNSIGNED,
    observaciones VARCHAR(255)
);

INSERT INTO Alquila VALUES (
	NULL,
    1,
    1,
    '2021-02-13',
    '2021-02-20',
    12,
    'Devuelto en buen estado'
);

INSERT INTO Alquila VALUES (
	NULL,
    2,
    2,
    '2022-05-13',
    '2022-05-21',
    7,
    'Devuelto con un día de retraso'
);
