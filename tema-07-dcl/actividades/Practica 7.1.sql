# Práctica 7.1: Usuarios y conexiones
# Ricardo Moreno Cantea, 1ºDAW

# 1. Crear usuarios

CREATE USER juan@localhost identified by PASSWORD '*DBEA713660EAA6053C71DCAD75AFBC96A73ECA0F', pedro@localhost identified by PASSWORD '*63058EE0D2496A67E1B947A59809A732758516FF', maria@localhost identified by password '*610163669DEF78BB9ABD9FF46C482F1235C7B03D', miguel@localhost identified by password '*FD1C9AE91857DAED605342CF3B9B1EBA5B1E4A46', rocio@localhost identified by password '*8D4F0AFD37706EF85EE95411E70503B0C33027DF';

/* Al no establecer permisos, tendrán acceso solamente a la BBDD test */

# 3.
SELECT * FROM mysql.user;

insert into mysql.user (host, user, password) values ('localhost', 'roberto', 'roberto_79');

/* Intentar insertar en la tabla user nos dará el error 1471, indicando que dicha tabla no permite la inserción. */

# 4.

DROP USER miguel@localhost, rocio@localhost;
