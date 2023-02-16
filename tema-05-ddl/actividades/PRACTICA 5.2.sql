-- Realizar los siguientes ejercicios de creación, modificación y eliminación de BBDD:
-- 1. Crear la base de datos ajedrez, usar siempre la cláusula IF NOT EXISTS. Indicar el juego de caracteres y la colección establecida por defecto.
-- 2. Modificar la base de datos ajedrez para establecer el juego de caracteres inglés internacional así como la colección correspondiente.
-- 3. Eliminar la base de datos ajedrez.
-- 4. Crear la base de datos futbol, usar el juego de caracteres utf16 y la colección utf16_general_ci'
-- 5. Modificar la base de datos futbol para cambiar al juego de caracteres UTF8MB4 y la colección 'utf8mb4_general_ci'
-- 6. Eliminar definitivamente la base de datos futbol

-- Creación de la base de datos 'ajedrez'
DROP DATABASE IF EXISTS ajedrez;
CREATE DATABASE IF NOT EXISTS ajedrez 
CHARACTER SET utf8mb4 collate utf8mb4_general_ci;
