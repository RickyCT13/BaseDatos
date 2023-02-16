-- Práctica 6.1: Sentencias Básicas de Manipulación de Datos: BD Fútbol
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW

USE futbol;

INSERT INTO equipos VALUES
(NULL, 'F.C Los Sultanes', 'Estadio Jardín Verde', 22500, 1981, 'Palacio del Sultán'),
(nULL, 'F.C Guardianes de la Presa', 'Estadio Napoleón', 18000, 1983, 'Villacastor');

INSERT INTO equipos SET
	id = NULL,
    nombre = 'Fontaneros F.C',
    estadio = 'Benito Fuentes',
    aforo = 13500,
    fundacion = 1975,
    ciudad = 'Cañerías del Reino';

INSERT INTO jugadores VALUES
(NULL, 'Ramón', '1988/9/1', 5),
(NULL, 'Paco', '1990/5/30', 6);

INSERT INTO jugadores SET
	id = NULL,
    nombre = 'Jose Juan',
    fecha_nac = '1992/8/8',
    equipo_id = 7;

INSERT INTO partidos VALUES
(NULL, 1, 2, '2022/5/6 20:30:00', 3, 2, 'Empezó a llover justo cuando terminó el partido.'),
(nULL, 5, 6, '2023/2/2 19:25:00', 2, 3, 'Gracias a una buena coordinación, los Guardianes consiguen aguantar hasta la prórroga y se llevan la victoria durante esta.');

INSERT INTO partidos SET
	id = NULL,
    id_equipo_casa = 7,
    id_equipo_fuera = 3,
    fecha = '2022/11/23 17:55:00',
    goles_casa = 3,
    goles_fuera = 4,
    observaciones = 'Ligera conmoción en el público por el resultado, tuvo que intervenir la seguridad.';

INSERT INTO goles VALUES
(NULL, 7, '00:54:23', 'Gol con gran coordinación que le dio la victoria al Villatrabuco.', 5),
(NULL, 8, '01:36:12', 'Regate ágil de Paco seguido por el gol decisivo en prórroga.', 46);

INSERT INTO goles SET
id = NULL,
id_partido = 7,
minuto = '00:50:25',
descripcion = 'De penalti.',
jugador_id = 47;