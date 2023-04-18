# Base de Datos - Bancos
# Módulo - Bases de Datos 13/14
# IES NTRA. SRA. LOS REMEDIOS - UBRIQUE

DROP DATABASE IF EXISTS Bancos;
CREATE DATABASE  IF NOT EXISTS Bancos;
USE bancos;

--
-- Tabla Clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    apellidos VARCHAR(45),
    nombre VARCHAR(20),
    telefono CHAR(9),
    ciudad VARCHAR(20),
    dni CHAR(9) UNIQUE,
    email VARCHAR(45) UNIQUE
);

INSERT INTO clientes VALUES
(1, 'García Pérez', 'Francisco', '956465432', 'Ubrique', '12345678A', 'francisco@perez.com'),
(2, 'Moreno Gracia', 'José Carlos', '956487896', 'Ubrique', '25693874B', 'moreno@gracia.com'),
(3, 'Romero Ramírez', 'Rocío', '956874521', 'Ubrique', '25693582C', 'rocio@romero.com');

--
-- Tabla Cuentas
DROP TABLE IF EXISTS cuentas;
CREATE TABLE IF NOT EXISTS cuentas(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    iban CHAR(24) UNIQUE,
    cliente_id INT UNSIGNED REFERENCES clientes,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(10, 2)
);

INSERT INTO cuentas VALUES
(1, 'ES22210311111234567890', 1, '2010-03-12', 200.00),
(2, 'ES22210322221234567890', 2, '2010-02-04', 20.00),
(3, 'ES34210333331234567890', 3, '2010-05-14', 270.00);

--
-- Tabla Movimientos

DROP TABLE IF EXISTS movimientos;
CREATE TABLE IF NOT EXISTS movimientos(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cuenta_id INT UNSIGNED REFERENCES cuentas (codcuenta),
    fechahora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    concepto VARCHAR(50),
    tipo CHAR(1) CHECK (tipo IN('I','R', ' ')),
    cantidad DECIMAL(10, 2 )
);


INSERT INTO movimientos VALUES
(1, 1, DEFAULT, 'Apertura', 'I', 200.00),
(2, 1, DEFAULT, 'Ingreso Caja', 'I', 120.00),
(3, 1, DEFAULT, 'Transferencia', 'R', -100.00),
(4, 1, DEFAULT, 'Reintegro Caja', 'R', -20.00),
(5, 2, DEFAULT, 'Apertura', 'I', 200.00),
(6, 2, DEFAULT, 'Ingreso Caja', 'I', 120.00),
(7, 2, DEFAULT, 'Transferencia', 'R', -100.00),
(8, 2, DEFAULT, 'Reintegro Caja', 'R', -100.00),
(9, 3, DEFAULT, 'Apertura', 'I', 300.00),
(10, 3, DEFAULT, 'Ingreso Caja', 'I', 120.00),
(11, 3, DEFAULT, 'Transferencia', 'R', -100.00),
(12, 3, DEFAULT, 'Reintegro Caja', 'R', -50.00);
