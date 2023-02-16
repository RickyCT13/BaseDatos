DROP DATABASE IF EXISTS Empresa;
CREATE DATABASE Empresa;
USE Empresa;
DROP TABLE IF EXISTS Empleados;
CREATE TABLE IF NOT EXISTS Empleados(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    ini CHAR,
    apellidos VARCHAR(40) NOT NULL,
    nss CHAR(9) NOT NULL UNIQUE,
    fecha_nac DATE,
    direccion VARCHAR(30),
    salario DECIMAL(10, 2 ),
    supervisor_id INT UNSIGNED,
    departamento_id INT UNSIGNED,
    FOREIGN KEY (supervisor_id) REFERENCES Empleados(id) 
    ON DELETE RESTRICT ON UPDATE CASCADE
    
);

DROP TABLE IF EXISTS Departamentos;
CREATE TABLE  IF NOT EXISTS Departamentos(
    id INT UNSIGNED AUTO_INCREMENT primary key,
    nmbre VARCHAR(20) NOT NULL,
    jefe_departamento_id INT UNSIGNED,
    componentes tinyint unsigned,
    localizacion varchar(20),
    FOREIGN KEY (jefe_departamento_id) REFERENCES Empleados (id) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE empleados ADD FOREIGN KEY (departamento_id) REFERENCES departamentos (id)
    ON DELETE RESTRICT ON UPDATE CASCADE;

DROP TABLE IF EXISTS Proyectos;
CREATE TABLE IF NOT EXISTS Proyectos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL,
    num_proyecto INT UNSIGNED NOT NULL,
    localizacion VARCHAR(15),
    fecha_inicio DATE,
    fecha_fin DATE,
    departamento_id INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (departamento_id) REFERENCES Departamentos (id)
    ON DELETE no action ON UPDATE CASCADE
);

DROP TABLE IF EXISTS empleados_proyectos;
CREATE TABLE  IF NOT EXISTS empleados_proyectos(
    empleado_id INT UNSIGNED,
    proyecto_id INT UNSIGNED,
    horas DECIMAL(10, 2 ) NOT NULL,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Beneficiarios;
CREATE TABLE IF NOT EXISTS Beneficiarios(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT UNSIGNED NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    genero ENUM('H', 'M', 'S'),
    fecha_nac DATE,
    parentesco VARCHAR(15),
    FOREIGN KEY (empleado_id) REFERENCES Empleados (id)
    ON DELETE restrict ON UPDATE CASCADE
);
    
INSERT INTO departamentos VALUES
(1, 'Investigación', NULL, 45, 'Houston'),
(2, 'Administración', NULL, 20, 'Stafford' ),
(3, 'Dirección',NULL, 25, 'Bellaire' );

insert into empleados values
(1, 'John','B','Smith','123456789','1965-10-20','731 Fondren, Houston, TX',30000,NULL,1),
(2, 'Franklin','T','Wong','333445555', '1955-12-20', '638 Voss, Houston, TX ',40000,1,2),
(3, 'Alicia','J','Zelaya','999887777','1968-07-19','3321 Castle, Spring, TX',25000,1,2),
(4, 'Jennifer','S','Wallace','987654321','1941-12-25','291 Berry, Bellaire, TX',43000,3,3),
(5, 'Ramesh','K','Narayan','666884444','1972-5-25','975 Fire Oak, Humble, TX' ,38000,4,3),
(6, 'Joyce','A','English','453453453','1972-07-31','5631 Rice, Houston, TX', 25000,3,3),
(7, 'Ahmad','V','Jabbar','987987987','1969-08-06','980 Dallas, Houston, TX',25000,4,2),
(8, 'James','E','Borg','888775555','1937-01-02','450 Stone, Houston, TX',55000,NULL,1);

UPDATE Departamentos SET jefe_departamento_id =1 WHERE id=1;
UPDATE Departamentos SET jefe_departamento_id=3 WHERE id=2;
UPDATE Departamentos SET jefe_departamento_id=4 WHERE id=3;

INSERT INTO proyectos VALUES
(1, 'Construccion Puente la Pepa',1,'Bellaire','1990/12/24','2000/12/24',1),
(2, 'Ajuste Torre Pisa',2,'Sugarland','1980/12/24','2015/12/24',1),
(3, 'Carretera Madrid Toledo',3,'Houston','2000/12/24','2001/12/24',1),
(4, 'Molinos en la Costa',10,'Stafford','2017/12/24','2018/1/24',2),
(5, 'Reordenación Tráfico Madrid',20,'Houston','2014/12/24','2019/12/24',2),
(6, 'Huertos Solares en Estepona',30,'Stafford','2010/12/24','2018/12/24',3);

INSERT INTO empleados_proyectos VALUES
(1,1,32.5),
(1,2,7.5),
(2,3,40.0),
(8,1,20.0),
(3,2,20.0),
(4,2,10.0),
(4,3,10.0),
(4,4,10.0),
(4,6,10.0),
(5,5,30.0),
(5,3,10.0),
(6,6,35.0),
(6,2,5.0),
(7,5,20.0),
(6,5,15.0),
(8,6,10);

INSERT INTO beneficiarios VALUES
(1, 1,'Alice','M','1986-12-10','hijo'),
(2, 1,'Theodore','H','1983-10-25','hijo'),
(3, 4,'Joy','M','1958-10-12','esposa'),
(4, 3,'Abner','H','1942-04-20','esposo'),
(5, 3,'Michael','H','1988-09-30','hijo'),
(6, 2,'Alice','M','1988-07-31','hija'),
(7, 2,'Elizabeth','M','1967-10-20','esposa');
