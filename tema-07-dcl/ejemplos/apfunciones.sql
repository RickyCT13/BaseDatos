# apapap
# Funciones en mySQL

# Funciones de lista
# GREATEST: Devuelve el mayor
# LEAST: Devuelve el menor
# COALESCE: Devuelve el 1er elto. no nulo
select greatest(1, 5, 6, 7), least(1, 5, 6, 7), coalesce(null, 5, 6, 7, 1);

# Funciones matemáticas
# Funciones de trigonometría
# SIN, COS, TAN, ASIN, ACOS, ATAN ((arco)seno, coseno y tangente)
# Nota: Arc(sin, cos, tan) (x) = (sin, cos, tan)^-1 (x), Arc(sin, cos, tan) ((sin, cos, tan) (x)) = x. se pasa, en sin, cos y tan, en radianes;
# RADIANS: Pasa el ángulo a radianes
select sin(radians(45));

# CEILING/CEIL y FLOOR = redondeo por exceso y defecto respectivamente

# RAND: Devuelve, por defecto, un nº aleatorio entre [0,1)
select rand(), rand()*100;

# Número aleatorio entre 1 y 10:
select ceiling(rand()*10);
# '' entre 0 y 9
select floor(rand()*10);

# Simular lanzamiento de un dado de 6 caras (nº rand entre el 1 y 6):
select ceiling(rand()*6);

# Otros ejemplos:
# Tirar dos dados de 6 caras;
select concat_ws('-', ceiling(rand()*6), ceiling(rand()*6));

# ROUND: Selecciona el entero más cercano.


/* Ejemplos */
SELECT 
 'Ángulo de:',
 45,
 RADIANS(45) radianes,
 SIN(RADIANS(45)) seno;
