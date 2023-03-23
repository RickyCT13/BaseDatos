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

select * from vistaEj4 where month(vistaEj4.fecha_nac) = month(current_date()) + 1;
/* Aunque el comando funcione, no muestra registros ya que puede no haber gente que cumpla años el mes que viene*/

/*Realiza una consulta que muestre los corredores que cumplen año la semana que viene, teniendo en cuenta también la fecha y hora actual.*/



/*Mostrar aquellos corredores que nacieron en el 2 cuatrimestre del año. Mostrar mismos detalles que los apartados anteriores.*/



/* ----------------- */



/* 5. Añadir 5 registros con la llegada a meta en la Maraton de Sevilla correspondiente a los corredores 2, 3, 4 y 5. Además se supone que el primero en llegar a la meta fue el corredor 1 cuyo registro ya está arriba. Poner la columna llegada a vuestro criterio. */



/* 6. Actualizar la columna tiempoInvertido a partir de las columna salida y llegada. Sólo maratón de Sevilla. */

update registros set TiempoInvertido = timediff(Llegada, Salida);


/* 7. Mostrar la clasificación de la Maratón de Sevilla (id = 2) con los siguientes detalles:

id, nombre, apellidos, club (nombre completo), categoria (nombre completo), tiempoInvertido
Ordenado de menor a mayor tiempo invertido */



/* Muestra la misma clasificación anterior pero junto a la columna tiempoinvertido mostrar el total de segundos.  */




/* El reccord mundial de maratón lo posee el keniano Eliud Kipchoge a 2:01:39. Muestra la misma clasificación anterior pero especificando una nueva columna el tiempo que le ha faltado para batir el record mundial. */


/* Mostrar la clasificación de la categoría SNA. */
