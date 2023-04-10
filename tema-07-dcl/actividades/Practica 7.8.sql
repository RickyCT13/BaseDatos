# Práctica 7.8: Funciones de fecha y hora
# Ricardo Moreno Cantea, 1ºDAW

USE maratoon;

/* 1. Añadir 3 corredores con datos válidos. No añadir ni la edad ni la categoría. Los tres corredores pertenecen al club 5 "Club Atletismo Fronter" */

INSERT INTO corredores values ('17', 'Javier', 'Ortega García', 'Jerez', '1989-05-08', 'H', NULL, null, '5'), ('18', 'Juan', 'Pérez Gutiérrez', 'Jerez', '1990-11-18', 'H', null, null, '5'), ('19', 'Catalina', 'Ríos Gómez', 'Jerez', '1989-01-30', 'M', null, null, '5');

/* 2. Realiza una actualización de la tabla corredores para que actualice la edad a partir de cada corredor, a partir de la fecha hora actual y de la fecha de nacimiento de cada corredor. */

UPDATE corredores 
SET 
    Edad = TIMESTAMPDIFF(YEAR,
        FechaNacimiento,
        NOW());

/* 3. Actualizar la columna categoria_id a partir de la edad  teniendo en cuenta la siguiente tabla:

1 INF si es menor de 12 años
2 JUN si es menor de 15 años
3 JUV si es menor de 18 años
4 SNA si es menor de 30 años
5 SNB si es menor de 40 años
6 VTA si es menor de 50 años
7 VTB si es menor de 60 años
8 VTC mayor de 60 años inclusive */

UPDATE corredores 
SET 
    Categoria_id = CASE
        WHEN corredores.Edad < 12 THEN 1
        WHEN corredores.Edad < 15 THEN 2
        WHEN corredores.Edad < 18 THEN 3
        WHEN corredores.Edad < 30 THEN 4
        WHEN corredores.Edad < 40 THEN 5
        WHEN corredores.Edad < 50 THEN 6
        WHEN corredores.Edad < 60 THEN 7
        WHEN corredores.Edad >= 60 THEN 8
    END;

/* 4. -------------------- */
/*Realiza una consulta que muestre id, nombre, apellidos, fechaNacimiento, Edad, Categoria (nombre corto) y Club (nombre corto) de todos los corredores.*/

/* Creación de una vista para no tener que copiar la misma consulta una 
y otra vez*/

CREATE OR REPLACE VIEW vistaEj4 AS
    SELECT 
        cor.id id,
        cor.Nombre nombre,
        cor.Apellidos apellidos,
        cor.FechaNacimiento fecha_nac,
        cor.Edad edad,
        cat.Nombrecorto nom_corto_cat,
        clb.Nombrecorto nom_corto_club
    FROM
        corredores cor
            INNER JOIN
        categorias cat ON cor.Categoria_id = cat.id
            INNER JOIN
        clubs clb ON cor.Club_id = clb.id
    ORDER BY cor.id ASC;
    
SELECT 
    *
FROM
    vistaEj4;

/*Realiza una consulta que muestre los corredores que cumplen año el mes que viene, teniendo en cuenta la fecha y hora actual. Mostrar las mismas columnas que en el apartado anterior.*/

select * from vistaEj4 where vistaEj4.fecha_nac = vistaEj4.fecha_nac + interval 1 month;

/*Realiza una consulta que muestre los corredores que cumplen año la semana que viene, teniendo en cuenta también la fecha y hora actual.*/

select * from vistaEj4 where vistaEj4.fecha_nac = vistaEj4.fecha_nac + interval 1 week;

/*Mostrar aquellos corredores que nacieron en el 2 cuatrimestre del año. Mostrar mismos detalles que los apartados anteriores.*/

select * from vistaEj4 where quarter(vistaEj4.fecha_nac) = 2;

/* ----------------- */



/* 5. Añadir 5 registros con la llegada a meta en la Maraton de Sevilla correspondiente a los corredores 2, 3, 4 y 5. Además se supone que el primero en llegar a la meta fue el corredor 1 cuyo registro ya está arriba. Poner la columna llegada a vuestro criterio. */

insert into registros values (null, 2, 2, '2023-04-11 10:00:00.000000', '2023-04-11 10:52:27.123432', '00:52:27.123432'),(null, 2, 3, '2023-04-11 10:00:00.000000', '2023-04-11 10:41:05.233341', '00:41:05.233341'),(null, 2, 4, '2023-04-11 10:00:00.000000', '2023-04-11 10:39:55.334123', '00:39:55.334123'),(null, 2, 5, '2023-04-11 10:00:00.000000', '2023-04-11 10:38:55.143234', '00:38:55.143234');

/* 6. Actualizar la columna tiempoInvertido a partir de las columna salida y llegada. Sólo maratón de Sevilla. */

update registros set TiempoInvertido = timediff(Llegada, Salida) where carrera_id = 2;


/* 7. Mostrar la clasificación de la Maratón de Sevilla (id = 2) con los siguientes detalles:

id, nombre, apellidos, club (nombre completo), categoria (nombre completo), tiempoInvertido
Ordenado de menor a mayor tiempo invertido */

SELECT 
    cor.id,
    cor.nombre,
    cor.apellidos,
    clb.nombre nombre_club,
    cat.nombre categoria,
    reg.TiempoInvertido
FROM
    corredores cor
        INNER JOIN
    categorias cat ON cor.categoria_id = cat.id
        INNER JOIN
    clubs clb ON cor.club_id = clb.id
        INNER JOIN
    registros reg ON reg.corredor_id = cor.id
WHERE
    reg.carrera_id = 2
ORDER BY reg.TiempoInvertido ASC;

/* Muestra la misma clasificación anterior pero junto a la columna tiempoinvertido mostrar el total de segundos.  */

SELECT 
    cor.id,
    cor.nombre,
    cor.apellidos,
    clb.nombre nombre_club,
    cat.nombre categoria,
    reg.TiempoInvertido,
    TIME_TO_SEC(reg.TiempoInvertido) tiempo_segundos
FROM
    corredores cor
        INNER JOIN
    categorias cat ON cor.categoria_id = cat.id
        INNER JOIN
    clubs clb ON cor.club_id = clb.id
        INNER JOIN
    registros reg ON reg.corredor_id = cor.id
WHERE
    reg.carrera_id = 2
ORDER BY reg.TiempoInvertido ASC;

/* El reccord mundial de maratón lo posee el keniano Eliud Kipchoge a 2:01:39. Muestra la misma clasificación anterior pero especificando una nueva columna el tiempo que le ha faltado para batir el record mundial. */

SELECT 
    cor.id,
    cor.nombre,
    cor.apellidos,
    clb.nombre nombre_club,
    cat.nombre categoria,
    reg.TiempoInvertido,
    TIME_TO_SEC(reg.TiempoInvertido) tiempo_segundos,
    timediff(reg.TiempoInvertido, '00:02:01.390000') dif_record_mundial
FROM
    corredores cor
        INNER JOIN
    categorias cat ON cor.categoria_id = cat.id
        INNER JOIN
    clubs clb ON cor.club_id = clb.id
        INNER JOIN
    registros reg ON reg.corredor_id = cor.id
WHERE
    reg.carrera_id = 2
ORDER BY reg.TiempoInvertido ASC;

/* Mostrar la clasificación de la categoría SNA. */

SELECT 
    cor.id, cor.nombre, cor.apellidos, reg.carrera_id, reg.TiempoInvertido
FROM
    corredores cor
        INNER JOIN
    categorias cat ON cor.categoria_id = cat.id
        INNER JOIN
    registros reg ON reg.corredor_id = cor.id
WHERE
    cat.id = 4
ORDER BY reg.TiempoInvertido ASC;