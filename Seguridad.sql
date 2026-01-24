-- ======CONTROL DE INYECCION=================================================================================
PREPARE buscarCliente FROM 
'SELECT * FROM Cliente WHERE Cedula = ?';

-- Prueba exitosa :)
SET @cedula = '1756084479';
EXECUTE buscarCliente USING @cedula;

-- Prueba de ataque :O
SET @cedula = '1756084479 OR 1=1 --';
EXECUTE buscarCliente USING @cedula;

-- =======HASH DE CONTRASEÑA==================================================================
CREATE TABLE Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50) UNIQUE NOT NULL,
    Password_Hash VARCHAR(255) NOT NULL
);
-- Ciframos la contraseña
INSERT INTO Usuario (Usuario, Password_Hash)
VALUES ('admin', SHA2('Admin123', 256));

-- Vemos la contraseña
SELECT * FROM Usuario;
-- Probamos
SELECT * FROM Usuario
WHERE Usuario = 'admin'
AND Password_Hash = SHA2('Admin123', 256);

TO 'vendedor_conc'@'localhost';

FLUSH PRIVILEGES;

