DROP DATABASE IF EXISTS Geslibros;
CREATE DATABASE  IF NOT EXISTS Geslibros;
USE Geslibros;

DROP TABLE IF EXISTS temas;
CREATE TABLE IF NOT EXISTS temas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tema VARCHAR(30),
    
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO temas (id, tema) VALUES
(1,'Informática'),
(2,'Matemáticas'),
(3,'Novela'),
(4,'Viajes'),
(5,'Belleza'),
(6,'Deportes'),
(7,'Astronomía'),
(8,'Música'),
(9, 'Ciencia');

DROP TABLE IF EXISTS provincias;
CREATE TABLE provincias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    provincia VARCHAR(40),
    
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Provincias (id, provincia) VALUES 
(1, 'Álava'),
(2, 'Albacete'),
(3, 'Alicante'),
(4, 'Almería'),
(5, 'Ávila'),
(6, 'Badajoz'),
(7, 'Baleares (Illes)'),
(8, 'Barcelona'),
(9, 'Burgos'),
(10, 'Cáceres'),
(11, 'Cádiz'),
(12, 'Castellón'),
(13, 'Ciudad Real'),
(14, 'Córdoba'),
(15, 'A Coruña'),
(16, 'Cuenca'),
(17, 'Girona'),
(18, 'Granada'),
(19, 'Guadalajara'),
(20, 'Guipúzcoa'),
(21, 'Huelva'),
(22, 'Huesca'),
(23, 'Jaén'),
(24, 'León'),
(25, 'Lleida'),
(26, 'La Rioja'),
(27, 'Lugo'),
(28, 'Madrid'),
(29, 'Málaga'),
(30, 'Murcia'),
(31, 'Navarra'),
(32, 'Ourense'),
(33, 'Asturias'),
(34, 'Palencia'),
(35, 'Las Palmas'),
(36, 'Pontevedra'),
(37, 'Salamanca'),
(38, 'Santa Cruz de Tenerife'),
(39, 'Cantabria'),
(40, 'Segovia'),
(41, 'Sevilla'),
(42, 'Soria'),
(43, 'Tarragona'),
(44, 'Teruel'),
(45, 'Toledo'),
(46, 'Valencia'),
(47, 'Valladolid'),
(48, 'Vizcaya'),
(49, 'Zamora'),
(50, 'Zaragoza'),
(51, 'Ceuta'),
(52, 'Melilla');
 
 
 DROP TABLE IF EXISTS editoriales;
CREATE TABLE IF NOT EXISTS editoriales (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    direccion VARCHAR(50),
    poblacion VARCHAR(25),
    provincia_id INT,
    c_postal CHAR(5),
    nif CHAR(9) UNIQUE,
    telefono CHAR(9),
    movil CHAR(9) UNIQUE,
    email VARCHAR(40) UNIQUE,
    web VARCHAR(40) UNIQUE,
    contacto VARCHAR(40),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (provincia_id) REFERENCES provincias (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Editoriales (id, nombre, direccion, poblacion, provincia_id, c_postal, nif, telefono, movil, email, web, contacto) VALUES
(1,'Ediciones Paraninfo S.A.','Avda. Filipinas, 50, Bajo, Dcha. puerta A', 'Madrid',28,'28003','A81461477','902995240',NULL, NULL, 'http://www.paraninfo.es', 'Patricia García'),
(2,'MCGRAWHILL','C/ Basauri, 17, 1ª Planta','Aravaca',28,'28023','B28914323', '911803000',NULL, NULL, 'http://www.mcgraw-hill.es/', 'Raquel Huertas'),
(3,'RA-MA, S.A. Editorial y Publicaciones','Cl. Jarama, 3A Polígono Industrial IGARSA','Paracuellos de Jarama',28, '28860','M16584280', '916628139', '916628131','editorial@ra-ma.com','http://www.ra-ma.es/', 'Rocio García'),
(4,'Editorial Planeta, S.A.U.','Avda Diagonal 662-664','Barcelona',8,'08034','A08186249','934928978',NULL,'viajeros@geoplaneta.es','www.editorial.planeta.es','Roberto Rodríguez' ),
(5,'Alfaguara','Calle Torrelaguna, 60','Madrid',28,'28043','A0818624X','917449060','917449224','alfaguara@santillana.es','http://www.alfaguara.com/es/', 'Isidoro Moreno'),
(6, 'Anaya', 'Calle San Francisco, 30 A', 'Madrid', 28, '28014', 'A0012514C', '917458458', '963547852', 'info@anaya.es', 'www.anaya.com', 'Rosario Vázquez'),
(7, 'Santillana', 'Torero Romerito, 30 A', 'Sevilla', 21, '21014', 'A0012518R', '927459458', '963597852', 'info@santillana.es', 'www.santillana.com', 'Rocío Márquez');

--
-- Table structure for table Escritores
--

DROP TABLE IF EXISTS autores;
CREATE TABLE autores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    nacionalidad VARCHAR(20),
    email VARCHAR(45) UNIQUE,
    fecha_nac DATETIME,
    fecha_def DATETIME,
    premios TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Autores (id, nombre, nacionalidad, email, fecha_nac, fecha_def, premios) VALUES 
(1, 'Gabriel García Márquez', 'Méjico', 'garciamarquez@gmail.com', '1927/12/21', '2014/12/21', 'Planeta, Cervantes, Nobel' ),
(2, 'Oscar Wilde',   'Irlanda', 'oscarwilde@gmail.com', '1854/12/21', '1900/12/21', 'Nobel' ),
(3, 'Jorge Luís Borges', 'Argentina',  'jorgeluisborges@gmail.com', '1899/12/21', '1986/12/21', 'Nobel, Cervantes' ),
(4, 'Ernest Hemingway', 'Estados Unidos',  'ernesthemingway@gmail.com', '1899/12/21', '1961/12/21', 'Nobel, Cervantes' ),
(5, 'Pablo Neruda', 'Chile',  'pabloneruda@gmail.com', '1904/12/21', '1973/12/21', 'Nobel, Cervantes, Planeta' ),
(6, 'Federico García Lorca', 'España',  'federicogarcialorca@gmail.com', '1898/12/21', '1936/12/21', 'Cervantes' );

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    direccion VARCHAR(50),
    poblacion VARCHAR(50),
    c_postal CHAR(5),
    provincia_id INT,
    nif CHAR(9) UNIQUE,
    telefono CHAR(9),
    movil CHAR(9) UNIQUE,
    email VARCHAR(45) UNIQUE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (Provincia_id)
        REFERENCES Provincias (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


--
-- Dumping data for table `clientes`
--

INSERT INTO Clientes (id, nombre, direccion, poblacion, c_postal, provincia_id, nif, telefono, movil, email, create_at) VALUES 
(1,'CP Rio Tajo','C/Las Flores 23','Guadalajara','19003',19,'34343434L','949876655','949876655','cpriotajo@gmail.com','2011/03/24'),
(2,'IES Brianda de Mendoza','C/Hnos Fernández Galiano 6','Guadalajara','19004',19,'76767667F','949772211','949256376','brianda@correo.es','2011/03/20'),
(3,'Manuel Fernández','Avenida del Atance 24','Guadalajara','19008',19,'22234567E','94980009','949800090','manuel@correo.es','2011-2-28'),
(4,'Alicia Perez González','C/La Azucena 123','Talavera de La Reina','45678',45,'56564564J','925678090','','alicia@sucorreo.es','2011-05-21'),
(5,'Academia Central','C/Espliego 25, Polig Industrial Balconcillo','Azuqueca de Henares','19008',19,'23124234G','949008866','949008866','academia@central.es','2011-07-12'),
(6, 'Ayuntamiento de Ubrique', 'La Plaza, 1', 'Ubrique', '11600', 11, 'E2333213R', '956461290', '956463230', 'info@aytoubrique.es', '2012-08-11'),
(7, 'IES Ntra. Sra. Los Remedios', 'Avd. Herrera Oria, s/n', 'Ubrique', '11600', 11, 'E1212121R', '956461293', '956847841', 'info@ieslosremedios.org', '2013-08-10'),
(9, 'Librería Sierra Nevada', 'Avd. España, 20', 'Ubrique', '11600', 11, 'E1218121T', '956461200', '956847800', 'info@sierrablanca.org', '2017-05-13');


--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    isbn CHAR(13) UNIQUE,
    ean CHAR(13) UNIQUE,
    titulo VARCHAR(80) NOT NULL,
    autor_id INT UNSIGNED,
    editorial_id INT UNSIGNED,
    precio_coste DECIMAL(10 , 2 ) DEFAULT '0.00',
    precio_venta DECIMAL(10 , 2 ) DEFAULT '0.00',
    stock INT UNSIGNED DEFAULT '0',
    stock_min INT UNSIGNED DEFAULT '0',
    stock_max INT UNSIGNED DEFAULT '0',
    fecha_edicion DATE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (Editorial_id)
        REFERENCES Editoriales (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Autor_id)
        REFERENCES Autores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Dumping data for table `libros`
--

INSERT INTO Libros (id, isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion) VALUES 
(1,'8497325524','9788497325523','Operaciones Bases de Datos',1,1,'20.00','30.00',16,1,20,'2011-05-10'),
(2,'8448199588','9788448199586','Instalación y Mantenimiento de Equipos',2, 2,'22.00','34.00',15,1,20,'2011-09-23'),
(3,'844814760X','9788448147600','Desarrollo Aplicaciones Entorno',3, 2,'24.00','38.32',18,2,21,'2011-10-30'),
(4,'8448148797','9788448148799','Sistemas Gestores de Bases de Datos',4, 2,'25.00','34.23',14,1,15,'2011-01-21'),
(5,'9788408096511',NULL,'Camboya',5, 4,'20.00','24.00',8,1,10,'2011-01-21'),
(6,'9788408086833',NULL,'Amazonas', 6,  4,'30.00','45.00',6,1,7,'2011-02-10'),
(7,'9788420405094',NULL,'CAIN',1, 5,'12.00','17.20',7,1,10,'2011-11-20'),
(8,'9788497328135',NULL,'Aplicaciones Web',2, 1,'22.00',25.00,15,1,20,'2011-10-06'),
(9,'9788448170783',NULL,'Montaje y Mantenimiento de Equipos',3, 2,25.00,30.00,5,1,10,'2011-03-20'),
(10, '9788448170785', NULL, 'Programación en PHP Orientada a Objetos', 4, 3, 17, 25, 10, 3, 30, '2014-04-10'),
(11, '9788448170786', NULL, 'Desarrollo Web con PHP y MSQL', 5,  6, 20, 30, 12, 3, 30, '2013-04-10'),
(12, '9788448170787', NULL, 'La Vida del Lazarillo de Tormes', 6, 3,  10, 13, 12, 3, 30, '2012-03-10'),
(13, '9788448170788', NULL, 'Le Petit Prince', 1, 5,  10.30, 12, 12, 3, 30, '2012-01-11'),
(14, '9788448170789', NULL, 'Pepita Jiménez',  2, 5,  9.30, 12.30, 11, 2, 16, '2014-04-11'),
(15, '9788448170790', NULL, 'Cantar de Mio cid', NULL, 6,  8.30, 9.50, 1, 1, 30, '2010-01-11'),
(16, '9788448170791', NULL, 'Cien Años de Soledad', 1, 6,  20.30, 25.60, 20, 3, 30, '2010-06-11'),
(17, '9788448170792', NULL, 'Dioses Clásicos de la Mitología', 2, 5,  5.30, 12, 6, 3, 10, '2012-12-11'),
(18, '9788448170793', NULL, 'La Historia Interminable', 3, 5,  10.30, 15, 6, 2, 10, '1985-12-11'),
(19, '9788448180800', NULL, 'La Historia del Flamenco', 4, 5,  10.30, 15, 6, 2, 10, '2000-12-11');

--
-- Table structure for table libros_temas
--
-- Un libro puede tratar de vaiors temas

DROP TABLE IF EXISTS libros_temas;
CREATE TABLE IF NOT EXISTS libros_temas (
    libro_id INT UNSIGNED,
    tema_id INT UNSIGNED,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (libro_id , tema_id),
    FOREIGN KEY (libro_id)
        REFERENCES libros (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tema_id)
        REFERENCES Temas (id)
        ON DELETE CASCADE ON UPDATE CASCADE
    
);

INSERT INTO libros_temas (libro_id, tema_id) VALUES
(1, 1), (2, 1), (3, 1), (3, 2), (4, 1), (5, 3), (5, 4), (6, 3), (6, 4), (7, 3), (8, 1), (9, 1), (10, 1),
(10, 2), (11, 1), (11, 3), (12, 3), (13, 3), (14, 8), (14, 3), (15, 5), (16, 3), (17, 3), (18, 3), (19, 8), (19, 3);



--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS ventas;
CREATE TABLE IF NOT EXISTS ventas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED,
    fecha DATE,
    importe_bruto DECIMAL(10 , 2 ) NOT NULL,
    importe_iva DECIMAL(10 , 2 ) NOT NULL,
    importe_total DECIMAL(10 , 2 ) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id)
        REFERENCES clientes (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ventas (id, cliente_id, fecha, importe_bruto, importe_iva, importe_total) VALUES 
(1, 3,'2012-02-18',122.32,4.89,127.21),
(2,6,'2013-01-18',364.00,76.44,440.44),
(3,4,'2014-01-15',256.00,53.71,309.76),
(4,7,'2014-01-15',1311.00,275.31,1586.31),
(5,5,'2014-03-15',1129.20,237.13,1366.33),
(6,1,'2014-03-24',1617.5,339.68,1957.18), 
(7,7,'2014-03-26',2787.00,585.27,3372.27),
(8,6,'2014-03-25',633.00,132.93,765.93),
(9,7,'2014-03-25',430.00,90.30,520.30),
(10,1,'2014-03-21',243.00,51.30,294.03);
--
-- Table structure for table `lineasventas`
--

DROP TABLE IF EXISTS lineasventas;
CREATE TABLE lineasventas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    venta_id INT UNSIGNED NOT NULL,
    numero_linea SMALLINT UNSIGNED NOT NULL,
    libro_id INT UNSIGNED,
    iva DECIMAL(4 , 3 ) NOT NULL,
    cantidad MEDIUMINT UNSIGNED NOT NULL,
    precio DECIMAL(10 , 2 ) NOT NULL,
    importe DECIMAL(10 , 2 ) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE (venta_id , numero_linea),
    FOREIGN KEY (venta_id)
        REFERENCES ventas (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (libro_id)
        REFERENCES libros (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO lineasventas(id, venta_id, numero_linea, libro_id, iva, cantidad, precio, importe ) VALUES 
-- Venta 1
(1,1,1,1,0.18,1, 38.32,38.32),
(2,1,2,2,0.18,2,34.00,68.00),
(3,1,3,3,0.18,2,25.00,50.00),
(4,1,4,4,0.18,4,25.00,100.00),
(5,1,5,5,0.18,5,30.00,150.00),

-- Venta 2
(6,2,1,5,0.21,10, 24.00,240.00),
(7,2,2,6,0.21,2,45.00,90.00),
(8,2,3,7,0.21,2,17.20,34.40),

-- Venta 3
 (9,3,1,4,0.21,4,34.00,136.00),
(10,3,2,5,0.21,5,24.00,120.00),

-- Venta 4
(11,4,1,6,0.21,10, 45.00,450.00),
(12,4,2,7,0.21,5,17.20,86.00),
(13,4,3,8,0.21,3,25.00,75.00),
(14,4,4,9,0.21,20,30.00,600.00),
(15,4,5,10,0.21,4,25.00,100.00),

-- Venta 5
(16,5,1,11,0.21,10, 25.00,250.00),
(17,5,2,12,0.21,7,30.00,210.00),
(18,5,3,13,0.21,30,13.00,260.00),
(19,5,4,14,0.21,20,12.00,360.00),
(20,5,5,15,0.21,4,12.30,49.20),

-- Venta 6
(21,6,1,14,0.21,10, 12.30,123.00),
(22,6,2,15,0.21,5,9.50,142.50),
(23,6,3,16,0.21,20,25.60,512.00),
(24,6,4,17,0.21,30,12.00,360.00),
(25,6,5,13,0.21,40,12.00,480.20),

-- Venta 7
(26,7,1,5,0.21,10, 24.00,240.00),
(27,7,2,7,0.21,15,12.20,183.00),
(28,7,3,10,0.21,20,25.00,500.00),
(29,7,4,13,0.21,30,12.00,360.00),
(30,7,5,16,0.21,40,25.60,1024.00),
(31,7,6,17,0.21,40,12.00,480.00),

-- Venta 8
(32,8,1,6,0.21,10, 45.00,450.00),
(33,8,2,7,0.21,15,12.20,183.00),

-- Venta 9
(34,9,1,11,0.21,10, 30.00,300.00),
(35,9,2,12,0.21,10,13.00,130.00),

-- Venta 10
(36,10,1,13,0.21,10, 12.00,120.00),
(37,10,2,14,0.21,10,12.30,123.00);