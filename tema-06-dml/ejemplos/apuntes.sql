-- Ejemplo de 6.8: Consultas multitabla.

-- select * from corredores, clubs;
-- ^ Esto nos devolverá el producto cartesiano (Todos los registros de A por todos los de B)

-- Para conectar dos tablas que están relacionadas, establecemos la condición de que la FK de una tabla sea igual a la PK de la otra. En otras palabras, conectamos las FK y PK.
USE maratoon;
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    corredores.Sexo,
    corredores.Edad,
    clubs.Nombre 'Nombre Club',
    corredores.Categoria_id
FROM
    corredores,
    clubs
WHERE
    corredores.Club_id = clubs.id;
-- ^ Este comando sí genera registros válidos.

-- Igual que el anterior, pero solo las mujeres:
USE maratoon;
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    corredores.Sexo,
    corredores.Edad,
    clubs.Nombre 'Nombre Club',
    corredores.Categoria_id
FROM
    corredores,
    clubs
WHERE
    corredores.Club_id = clubs.id
        AND corredores.Sexo = 'M';

-- En 'futbol': Listado de jugadores en el que aparezca el nombre, id de jugador y de equipo, y nombre del equipo.
USE futbol;
SELECT 
    jug.id,
    jug.nombre Nombre,
    jug.equipo_id,
    eq.nombre 'Nombre Equipo'
FROM
    jugadores jug,
    equipos eq
WHERE
    jug.equipo_id = eq.id
ORDER BY id ASC;


-- INNER JOIN devuelve un subconjunto INTERNO del producto cartesiano de las tablas. Así, realizamos la misma función pero con mayor rapidez.
USE maratoon;
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    corredores.Sexo,
    corredores.Edad,
    clubs.Nombre 'Nombre Club',
    corredores.Categoria_id
FROM
    corredores
        INNER JOIN
    clubs ON corredores.Club_id = clubs.id
        AND corredores.Sexo = 'M';

-- Consulta multitabla de 'futbol' con INNER JOIN
USE futbol;
SELECT 
    jug.id,
    jug.nombre Nombre,
    jug.fecha_nac 'Fecha de Nacimiento (YYYY-MM-DD)',
    jug.equipo_id,
    eq.nombre 'Nombre Equipo'
FROM
    jugadores jug
        INNER JOIN
    equipos eq ON jug.equipo_id = eq.id;
    
-- Ahora eleccionar solo los jug que nacieron entre 1970 y 1990
USE futbol;
SELECT 
    jug.id,
    jug.nombre Nombre,
    jug.equipo_id,
    jug.fecha_nac,
    eq.nombre 'Nombre Equipo'
FROM
    jugadores jug
        INNER JOIN
    equipos eq ON jug.equipo_id = eq.id and YEAR(jug.fecha_nac) between 1970 and 1990;
    -- ^ la función YEAR() extrae el año de una fecha.

-- Ejemplo 66
-- Mostrar IdCorredor, Apellidos, Nombre, Edad, Nombre del Club y Nombre 
-- de la categoría a la que pertenece cada corredor.
USE maratoon;

SELECT 
    co.id,
    co.Apellidos,
    co.Nombre,
    co.Edad,
    cl.nombre AS Club,
    ca.nombre AS Categoría
FROM
    Corredores co
        INNER JOIN
    Clubs cl ON Co.club_id = Cl.id
        INNER JOIN
    Categorias ca ON co.categoria_id = ca.id
ORDER BY co.apellidos , co.nombre;
-- Como vemos se trata de un DOBLE JOIN donde primero conecto Corredor con
-- Club y a su vez el resultado lo conecto con Categoría. Como condición de los
-- JOINS uso las correspondientes claves ajenas.

SELECT 
    cdr.id,
    CONCAT(cdr.Nombre, ' ', cdr.Apellidos) 'Corredor',
    cdr.Edad,
    cdr.Sexo,
    cdr.Categoria_id,
    cat.Nombre 'Categoría',
    cdr.Club_id,
    clb.Nombre 'Nombre Club',
    reg.TiempoInvertido
FROM
    registros reg
        INNER JOIN
    corredores cdr ON reg.corredor_id = cdr.id
        INNER JOIN
    categorias cat ON cdr.Categoria_id = cat.id
        INNER JOIN
    clubs clb ON cdr.Club_id = clb.id
ORDER BY reg.TiempoInvertido ASC;

# Union, intersección y diferencia
USE Maratoon;
(SELECT 
    id, Apellidos, Nombre, Ciudad
FROM
    Corredores
WHERE
    Ciudad = 'Ubrique') UNION (SELECT 
    id, Apellidos, Nombre, Ciudad
FROM
    Corredores
WHERE
    Ciudad = 'Villamartín') ORDER BY Apellidos , Nombre;

# Para poder aplicar el operador de unión, los dos select deben devolver las mismas columnas en el mismo orden;

# Agrupación de Registros: GROUP BY

# Num corredores de cada club; CADA -> Agrupación.

SELECT 
    COUNT(*)
FROM
    corredores
GROUP BY club_id; 
# En la lista de columnas sólo puedo poner funciones de agregado o la columna por la que se ha agrupado.

# Saber el numero de corredores de cada ciudad, además de la edad media, máxima y mínima.
SELECT 
    ciudad,
    COUNT(*) Num_Corredores,
    AVG(edad) Edad_Media,
    MAX(edad) Edad_Max,
    MIN(edad) Edad_Min
FROM
    corredores
GROUP BY ciudad; 

# Saber el num de corredores de cada categoría.
SELECT 
    categoria_id,
    categorias.nombre,
    COUNT(*) Num_Corredores
FROM
    corredores
        INNER JOIN
    categorias ON corredores.categoria_id = categorias.id
    where ciudad = 'Villamartin'
GROUP BY categoria_id;

# Primero selecciona a aquellos de villamartin, luego los agrupa por categoría.
# Orden: ON -> WHERE -> GROUP BY

# Num corredores de cada ciudad que sea mayor de 50 años.

SELECT 
    ciudad, COUNT(*) numero, edad
FROM
    corredores
WHERE
    (TIMESTAMPDIFF(YEAR,
        FechaNacimiento,
        NOW())) > 50
GROUP BY ciudad;

SELECT 
    Sexo, COUNT(*)
FROM
    corredores
GROUP BY Sexo;

# num hombres cada ciudad
SELECT 
    ciudad, COUNT(*)
FROM
    corredores
WHERE
    Sexo = 'H'
GROUP BY ciudad;

-- Mostrar el Código de Club, Nombre del Club, la Edad Media, Máxima, Mínima y -- Nº de Miembros de cada club

SELECT 
    co.club_id,
    cl.nombre,
    COUNT(*) Num_miembros,
    AVG(edad) Edad_Media,
    MAX(edad) Edad_Max,
    MIN(edad) Edad_Min
FROM
    corredores co
        INNER JOIN
    clubs cl ON co.club_id = cl.id
GROUP BY club_id;

# Mismo pero con categorías
SELECT 
    co.Categoria_id id_cat,
    cat.Nombre,
    COUNT(*) Num_corredores,
    AVG(edad) Edad_Media,
    MAX(edad) Edad_Max,
    MIN(edad) Edad_Min
FROM
    corredores co
        INNER JOIN
    categorias cat
WHERE
    co.Categoria_id = cat.id
GROUP BY co.Categoria_id;

# Agrupar los corredores por población/ciudad
Use maratoon;

SELECT 
    ciudad, COUNT(*) num_corredores
FROM
    corredores
GROUP BY ciudad;


# (HAVING) quiero mostrar las ciudades que tengan más de tres hombres inscritos
SELECT 
    ciudad, COUNT(*) num_corredores
FROM
    corredores
WHERE
    Sexo = 'H'
GROUP BY ciudad
HAVING num_corredores > 3; # se puede poner el count directamente, pero se usa alias para poder entenderlo mejor.
# Orden:(...) -> WHERE -> GROUP BY -> HAVING

# Mostrar solo aquellas categorías que tengan más de 3 corredores.
SELECT 
    co.Categoria_id id_cat, cat.Nombre, COUNT(*) Num_corredores
FROM
    corredores co
        INNER JOIN
    categorias cat
WHERE
    co.Categoria_id = cat.id
GROUP BY co.Categoria_id
HAVING Num_corredores > 3;

# Solo mostrar aquellos veteranos
SELECT 
    co.Categoria_id id_cat, cat.Nombre, COUNT(*) Num_corredores
FROM
    corredores co
        INNER JOIN
    categorias cat
WHERE
    co.Categoria_id = cat.id
GROUP BY co.Categoria_id
HAVING cat.Nombre like "Veteranos%";

# Mostrar num corredores cada club mayores de 40 años
SELECT 
    co.club_id, cl.nombre, COUNT(*) Num_corredores
FROM
    corredores co
        INNER JOIN
    clubs cl ON co.club_id = cl.id
WHERE
    edad > 30
GROUP BY co.club_id;

# Aquellos clubs que tienen más de 5 corredores mayores de 30 años
SELECT 
    co.club_id, cl.nombre, COUNT(*) Num_corredores
FROM
    corredores co
        INNER JOIN
    clubs cl ON co.club_id = cl.id
WHERE
    edad > 30
GROUP BY co.club_id
HAVING Num_corredores > 5;

# Creación de vistas
CREATE OR REPLACE VIEW Clasificacion AS
    SELECT 
        co.id,
        co.Apellidos,
        co.Nombre,
        co.Edad,
        cl.nombre AS Club,
        ca.nombre AS Categoria,
        r.tiempoinvertido
    FROM
        corredores co
            INNER JOIN
        clubs cl ON co.club_id = cl.id
            INNER JOIN
        categorias ca ON co.categoria_id = ca.id
            INNER JOIN
        registros r ON r.corredor_id = co.id
    WHERE
        r.carrera_id = 1
    ORDER BY tiempoinvertido;

# Mostrar los 3 primeros
SELECT 
    *
FROM
    Clasificacion
LIMIT 3;

# Clasificacion de VTA
SELECT 
    *
FROM
    Clasificacion
WHERE
    Categoria LIKE 'Veteranos A';
    
# Num corredores de cada categoría
SELECT 
    Categoria, COUNT(*) num_corredores
FROM
    Clasificacion
GROUP BY Categoria;

