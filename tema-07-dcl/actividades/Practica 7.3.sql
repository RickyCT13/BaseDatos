# Práctica 7.3: Revocación de privilegios
# Ricardo Moreno Cantea, 1ºDAW

REVOKE ALL ON *.* FROM juan@localhost;

REVOKE SELECT ON geslibros.* from pedro@localhost;

REVOKE ALTER, CREATE, UPDATE ON geslibros.* from maria@localhost;
REVOKE ALTER, CREATE, UPDATE ON maratoon.* from maria@localhost;

REVOKE GRANT OPTION FROM roberto@localhost;

REVOKE INSERT ON geslibros.* FROM rocio@localhost;

REVOKE SELECT, UPDATE on geslibros.editoriales from carlos@localhost;
REVOKE SELECT, UPDATE on geslibros.clientes from carlos@localhost;

REVOKE SELECT(titulo, ean, isbn, precio_venta) on geslibros.libros from anamari@localhost;

REVOKE select(nombre, telefono, email) on geslibros.clientes from anamari@localhost;