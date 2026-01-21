-- ============================ADMINISTRACIÓN Y SEGURIDAD============================
-- Creación de usuarios con roles y permisos diferenciados
-- Usuario Administrador
CREATE USER 'admin_concesionario'@'localhost' IDENTIFIED BY 'Admin123';

GRANT ALL PRIVILEGES 
ON Concesionario.* 
TO 'admin_concesionario'@'localhost';

-- Usuario Vendedor
CREATE USER 'vendedor_concesionario'@'localhost' IDENTIFIED BY 'Vendedor123';

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
CREATE USER 'consulta_concesionario'@'localhost' IDENTIFIED BY 'Consulta123';

GRANT SELECT 
ON Concesionario.* 
TO 'consulta_concesionario'@'localhost';

-- Revocar permisos ejemplo de control
REVOKE INSERT 
ON Concesionario.Venta 
FROM 'vendedor_concesionario'@'localhost';

-- Verificación de usuarios y permisos
SELECT User, Host FROM mysql.user;
SHOW GRANTS FOR 'vendedor_concesionario'@'localhost';

