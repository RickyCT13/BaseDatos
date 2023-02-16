-- Práctica 6.2: Sentencias básicas de manipulación de datos, UPDATE (futbol)
-- Alumno: Ricardo Moreno Cantea
-- Curso: 1ºDAW

USE futbol;

-- Para realizar una actualización se usa el id del registro

-- Estadio de Villatrabuco pasa a llamarse Miraflores
UPDATE equipos 
SET 
    estadio = 'Miraflores'
WHERE
    id = 1 LIMIT 1;
-- Uso de limit en caso de habernos equivocado con la actualización

-- El estadio de Valdeajos tiene ahora una capacidad de 30000 espectadores
UPDATE equipos 
SET 
    aforo = 30000
WHERE
    id = 4 LIMIT 1;

-- Todos los estadios sufren una merma de capacidad de 100 espectadores (reservas federativas)
UPDATE equipos 
SET 
    aforo = aforo - 100;

-- El Athletic Formeñosa se funda 10 años más tarde
UPDATE equipos 
SET 
    fundacion = 1973
WHERE
    id = 3 LIMIT 1;

-- El jugador Diez Crespo ha fichado ahora por el Villatortas
UPDATE jugadores 
SET 
    equipo_id = 2
WHERE
    id = 4 LIMIT 1;

-- El jugador Julianillo nació finalmente el 8/4/1976.
UPDATE jugadores 
SET 
    fecha_nac = '1976-4-8'
WHERE
    id = 6 LIMIT 1;

-- El partido entre el Villatrabuco y el Formeñosa quedó finalmente 3-1.
UPDATE partidos 
SET 
    goles_casa = 3,
    goles_fuera = 1
WHERE
    id = 2 LIMIT 1;
	
