PREPARE stmt FROM 
'SELECT * FROM Cliente WHERE Cedula = ?';

SET @cedula = '1756084479';
EXECUTE stmt USING @cedula;


-- ==============================================
CREATE TABLE Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50) UNIQUE NOT NULL,
    Password_Hash VARCHAR(255) NOT NULL
);

INSERT INTO Usuario (Usuario, Password_Hash)
VALUES ('admin', SHA2('Admin123', 256));

-- ====================================================

CREATE USER 'admin_conc'@'localhost' IDENTIFIED BY 'Admin123';
CREATE USER 'vendedor_conc'@'localhost' IDENTIFIED BY 'Vendedor123';

GRANT ALL PRIVILEGES ON Concesionario.* 
TO 'admin_conc'@'localhost';


GRANT SELECT, INSERT ON Concesionario.Venta 
TO 'vendedor_conc'@'localhost';

FLUSH PRIVILEGES;

