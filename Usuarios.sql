-- ============================ADMINISTRACIÓN Y SEGURIDAD============================
-- Creación de usuarios con roles y permisos diferenciados
-- Usuario Administrador
CREATE USER 'admin_concesionario'@'localhost';

GRANT ALL PRIVILEGES 
ON Concesionario.* 
TO 'admin_concesionario'@'localhost';

-- Usuario Vendedor
CREATE USER 'vendedor_concesionario'@'localhost';

GRANT SELECT 
ON Concesionario.Vehiculo 
TO 'vendedor_concesionario'@'localhost';

GRANT SELECT 
ON Concesionario.Cliente 
TO 'vendedor_concesionario'@'localhost';

GRANT INSERT, SELECT 
ON Concesionario.Venta 
TO 'vendedor_concesionario'@'localhost';

-- Usuario Consulta (Auditor)
CREATE USER 'consulta_concesionario'@'localhost';

GRANT SELECT, INSERT
ON Concesionario.* 
TO 'consulta_concesionario'@'localhost';

-- Revocar permisos ejemplo de control
REVOKE INSERT 
ON Concesionario.* 
FROM 'consulta_concesionario'@'localhost';

-- Verificación de usuarios y permisos
SELECT User, Host FROM mysql.user;
SHOW GRANTS FOR 'vendedor_concesionario'@'localhost';

FLUSH PRIVILEGES;
