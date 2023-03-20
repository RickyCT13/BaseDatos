# Práctica 7.6: Operaciones matemáticas
# Ricardo Moreno Cantea, 1ºDAW
/* 1. Crear la base de datos fmatematicas 

Dentro de esta base de datos crear la tabla Angulos con las siguientes columnas:

id - es la clave principal
grados - unidad del ángulo se expresa en grados sus valores van desde 0 a 360
radianes - unidad también de ángulo los valores van de [0 a 1] con máxima precisión
seno - valores van de [0 a 1] con máxima precisión
coseno - valores van de [0 a 1] con máxima precisión
tangente - valores van de [0 a 1] con  máxima precisión */
drop database if exists fmatematicas;
create database if not exists fmatematicas charset utf8mb4 collate utf8mb4_general_ci;
use fmatematicas;
drop table if exists angulos;
CREATE TABLE IF NOT EXISTS angulos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    grados SMALLINT UNSIGNED CHECK (grados BETWEEN 0 AND 360),
    radianes DOUBLE(31, 30) UNSIGNED,
    seno DOUBLE(31, 30) UNSIGNED CHECK (seno BETWEEN 0 AND 1),
    coseno DOUBLE(31, 30) UNSIGNED CHECK (coseno BETWEEN 0 AND 1),
    tangente DOUBLE(31, 30) UNSIGNED CHECK (tangente BETWEEN 0 AND 1)
);
# 2. Insertar registros
insert into angulos values (null, 0, radians(0), sin(radians(0)), cos(radians(0)), tan(radians(0))), (null, 45, radians(45), sin(radians(45)), cos(radians(45)), tan(radians(45))), (null, 90, radians(90), sin(radians(90)), cos(radians(90)), tan(radians(90))), (null, 135, radians(135), sin(radians(135)), cos(radians(135)), tan(radians(135))), (null, 180, radians(180), sin(radians(180)), cos(radians(180)), tan(radians(180))), (null, 225, radians(225), sin(radians(225)), cos(radians(225)), tan(radians(225))), (null, 270, radians(270), sin(radians(270)), cos(radians(270)), tan(radians(270))), (null, 315, radians(315), sin(radians(315)), cos(radians(315)), tan(radians(315))), (null, 360, radians(360), sin(radians(360)), cos(radians(360)), tan(radians(360)));

# Actualizar radianes
update angulos set radianes = radians(grados);

# Actualizar seno, coseno, tangente
update angulos set seno = sin(radianes), coseno = cos(radianes), tangente = tan(radianes);
