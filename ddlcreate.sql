# DDL - Data Definition Lanaguage
# Ejemplo 2
-- Creación de bd
# Sintaxis: create database; / create schema;
CREATE DATABASE IF NOT EXISTS ej_badat
CHARACTER SET uTF8MB4 COLLATE uTF8MB4_GENERAL_CI;

-- Mostrar juego de caracteres disponibles
SHOW CHARACTER SET;

-- Mostrar colecciones disponibles
SHOW COLLATION;

-- Modificar BBDD (Sólo puedo modificar el juego de carcacteres o la colección)
ALTER DATABASE ej_badat
CHARACTER SET utf8 collate utf8_general_ci;

-- ELiminar una base de datos
DROP DATABASE IF EXISTS ej_badat;
# ^ Este comando, preferiblemente, se introduce antes de la creación de BBDD