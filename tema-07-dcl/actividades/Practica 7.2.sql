# Práctica 7.2: Privilegios
# Ricardo Moreno Cantea, 1ºDAW

GRANT ALL ON *.* TO juan@localhost;

GRANT SELECT ON *.* TO pedro@localhost;

GRANT ALTER, CREATE, UPDATE, SELECT ON geslibros.* TO maria@localhost;
GRANT ALTER, CREATE, UPDATE, SELECT ON maratoon.* TO maria@localhost;

GRANT ALL ON *.* TO USER roberto@localhost identified by 'roberto_67' with grant option;

GRANT ALL ON geslibros.* to USER rocio@localhost IDENTIFIED BY 'rocio_69';

GRANT UPDATE(libros, editoriales, clientes), SELECT(libros, editoriales, clientes) on geslibros to USER carlos@localhost IDENTIFIED BY 'carlos_90';

GRANT SELECT(titulo, ean, isbn, precio_venta) to user anamari@localhost identified by 'anamari_2000';

GRANT SELECT(nombre, telefono, email), UPDATE(nombre, telefono, email) ON clientes to anamari@localhost;