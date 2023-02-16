DROP DATABASE IF EXISTS Futbol;
CREATE DATABASE if not exists Futbol;

USE FUTBOL;

DROP TABLE IF EXISTS equipos;

create table equipos(
    id int unsigned auto_increment primary key,
    nombre varchar(50) unique not null,
    estadio varchar(50) not null,
    aforo int(6),
    fundacion YEAR,
    ciudad varchar(50)
);

DROP TABLE IF EXISTS jugadores;

create table jugadores(
    id int unsigned auto_increment primary key,
    nombre varchar(50) not null,
    fecha_nac DATE,
    equipo_id int unsigned,
    foreign key (equipo_id) references equipos (id) 
    ON delete SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS partidos;

create table partidos(
	id int unsigned auto_increment primary key,
    id_equipo_casa int unsigned,
    id_equipo_fuera int unsigned,
    fecha TIMESTAMP default current_timestamp,
    goles_casa smallint,
    goles_fuera smallint,
    observaciones TEXT,
    foreign key (id_equipo_casa)
        references equipos (id) 
        on delete restrict
        on update cascade,
    foreign key (id_equipo_fuera)
        references equipos (id)
        on delete restrict
        on update cascade,
    constraint partidos_ck check (id_equipo_casa != id_equipo_fuera)
);

DROP TABLE IF EXISTS goles;

create table goles(
	id int unsigned auto_increment primary key, 
    id_partido int unsigned,
    minuto TIME,
    descripcion TEXT,
    jugador_id int unsigned,
    foreign key (id_partido)
        references partidos (id)
        on delete set null
        on update cascade,
    foreign key (jugador_id)
        references jugadores (id)
        on delete set null
        on update cascade
);

USE FUTBOL;

#Insertar Registros Equipos


INSERT INTO equipos VALUES
(1,'Villatrabuco','Los pinares',12000,1960,'Retortillo de abajo'),
(2,'Villatortas F.C.','San Isidro',35000,1970,'Villatortas'),
(3,'Athletic Formeñosa','La Huerta',3500,1963,'Formeñosa'),
(4,'Valdeajos','Municipal de valdeajos',21000,1962,'Valdeajos');

INSERT INTO jugadores VALUES
(1,'Alberto','1965/12/3',1),
(2,'Diego','1970/4/1',1),
(3,'José','1971/2/2',1),
(4,'Díez Crespo','1967/1/5',1),
(5,'Avellaneda','1970/5/2',1),
(6,'Julianillo','1976/5/3',1),
(7,'Redondela','1973/11/1',1),
(8,'Casero','1974/3/12',1),
(9,'Quirós','1975/11/3',1),
(10,'Fonseca','1971/12/3',1),
(11,'Lucín','1973/12/7',1),
(12,'Pacheco','1975/12/11',2),
(13,'Pablillo','1978/2/1',2),
(14,'Sandrelli','1979/8/7',2),
(15,'Caramiñán','1975/12/3',2),
(16,'Sondíez','1980/1/1',2),
(17,'Carrasco','1976/9/3',2),
(18,'Rodríguez','1975/7/6',2),
(19,'Mercena','1976/11/2',2),
(20,'Frasco','1977/12/7',2),
(21,'Carmona','1980/3/5',2),
(22,'Velazquez','1973/2/12',2),
(23,'Valdivia','1973/11/7',3),
(24,'Francisco','1971/11/9',3),
(25,'Casares','1972/3/4',3),
(26,'Jofaina','1969/7/9',3),
(27,'Santiago','1976/2/9',3),
(28,'Zarate','1974/9/8',3),
(29,'Solís','1978/3/1',3),
(30,'Crespo','1972/6/7',3),
(31,'Leresma','1972/8/8',3),
(32,'Juárez','1974/2/11',3),
(33,'Márquez','1975/6/1',3),
(34,'Porras','1973/12/2',4),
(35,'Paredes','1975/5/7',4),
(36,'Delarrós','1976/6/4',4),
(37,'Ramiro','1981/1/9',4),
(38,'Gonzálvez','1982/2/9',4),
(39,'Darbaño','1976/9/6',4),
(40,'Luisón','1969/9/8',4),
(41,'Carrasposa','1981/6/8',4),
(42,'Serrano','1972/12/12',4),
(43,'Unanu','1974/2/8',4),
(44,'Narvaja','1975/8/9',4);

INSERT INTO partidos VALUES
(1, 1, 2,'2004/10/8 20:00:00',1,2,'Se aplazó al día siguiente'),
(2, 1, 3,'2004/7/8 21:00:00',2,0,'4 penaltis para el equipo de casa'),
(3, 2, 4,'2004/7/8 18:00:00',4,2,'Se inundó el vestuario de billetes de 500 €'),
(4, 3, 2,'2004/5/8 20:00:00',0,2,'Las abejas no dejaron de picar al árbitro'),
(5, 3, 4,'2004/1/8 20:00:00',0,0,'Un rayo se cargó la pelota'),
(6, 4, 1,'2004/2/4 21:00:00',2,2,'Los jugadores estaban algo distraidos');

INSERT INTO goles VALUES 
(null,1,'00:9:00','Golazo de cabeza',1),
(null,1,'01:00:00','Carambola',16),
(null,1,'01:27:00','Zurdazo impresionantes',12),
(null,1,'00:28:00','De penalti',1),
(null,1,'00:57:00','De falta',1),
(null,2,'00:17:00','Gran combinación',12),
(null,2,'00:21:00','De falta',12),
(null,2,'01:15:00','Desde el medio campo',34),
(null,2,'01:18:00','Centro chut',35),
(null,2,'01:22:00','De penalti',14),
(null,2,'01:29:00','De penalti',12),
(null,4,'01:07:00','En propia puerta',34),
(null,4,'01:18:00','regate impresionante y marca tras quedarse solo',36),
(null,3,'00:27:00','De falta',12),
(null,4,'01:23:00','Cabezazo desde el borde del area pequeña',1),
(null,4,'01:28:00','De penalti',1),
(null,3,'01:18:00','De cabeza',16);