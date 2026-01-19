CREATE DATABASE Concesionario;
USE Concesionario;

-- 1. Tabla Vehiculo
CREATE TABLE Vehiculo (
    ID_Vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) UNIQUE NOT NULL, -- El VIN debe ser único
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Año INT CHECK (Año > 1885), -- Restricción lógica de fecha
    Precio DECIMAL(10, 2) NOT NULL CHECK (Precio > 0),
    Estado ENUM('Disponible', 'Vendido', 'Reservado') DEFAULT 'Disponible'
);

-- 2. Tabla Vendedor
CREATE TABLE Vendedor (
    ID_Vendedor INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(10) UNIQUE NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Comision DECIMAL(5, 2) DEFAULT 0.00
);

-- 3. Tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Cedula VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- 4. Tabla Venta (Tabla Relacional)
CREATE TABLE Venta (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME DEFAULT CURRENT_TIMESTAMP not null,
    Precio_Final DECIMAL(10, 2) NOT NULL,
    Metodo_Pago VARCHAR(30),
    -- Claves Foráneas
    ID_Vehiculo INT NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Vendedor INT NOT NULL,
    -- Relaciones
    CONSTRAINT fk_vehiculo FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo),
    CONSTRAINT fk_cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    CONSTRAINT fk_vendedor FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor)
);

-- Insertar Vehículos
INSERT INTO Vehiculo (VIN, Marca, Modelo, Año, Precio, Estado) VALUES
('1A2B3C4D5E6F7G8H9', 'Chevrolet', 'Camaro SS', 2010, 40000.00, 'Disponible'),
('9H8G7F6E5D4C3B2A1', 'Ford', 'Mustang', 2022, 45000.00, 'Disponible');

-- Insertar Vendedores
INSERT INTO Vendedor (Codigo, Nombre, Apellido, Comision) VALUES
('VEND01', 'Javi', 'Hoyos', 4.00),
('VEND02', 'Rosmy', 'De la Rosa', 4.00);

-- Insertar Clientes
INSERT INTO Cliente (Cedula, Nombre, Apellido, Telefono, Email) VALUES
('1756084479', 'Marcos', 'Araya', '0987653880', 'm.araya@email.com'),
('1787654321', 'Maria', 'López', '098765432', 'm.lopez@email.com');

-- Insertar una Venta (Validación de integridad)
INSERT INTO Venta (Precio_Final, Metodo_Pago, ID_Vehiculo, ID_Cliente, ID_Vendedor) VALUES
(35000.00, 'Crédito', 1, 1, 1);


