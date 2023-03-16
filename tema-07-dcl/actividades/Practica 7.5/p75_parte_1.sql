# Práctica 7.5: Bloqueos de tablas
# Ricardo Moreno Cantea, 1ºDAW

# 1. Creacoón Usuarios
CREATE USER ubrique01@localhost IDENTIFIED BY password '*EC0574FECB8D62FA502D1BC2165A7BBE8754D0F7';
CREATE USER arcos01@localhost IDENTIFIED BY password '*9D46406132E2344139C9028FFEA6CE31213E83F2';

# Asignación de permisos
GRANT ALL ON *.* TO ubrique01@localhost, arcos01@localhost;
FLUSH PRIVILEGES;