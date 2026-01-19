-- ======================CONSULTAS======================
-- Listar todos los vehículos disponibles
SELECT * 
FROM Vehiculo
WHERE Estado = 'Disponible';

-- Vehículos con precio mayor a 40.000SELECT Marca, Modelo, Precio
SELECT Marca, Modelo, Precio
FROM Vehiculo
WHERE Precio > 40000;

-- Ventas con datos del cliente
SELECT v.ID_Venta, c.Nombre, c.Apellido, v.Precio_Final
FROM Venta v
INNER JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente;

-- Ventas con datos del vendedor
SELECT v.ID_Venta, ven.Nombre, ven.Apellido, v.Metodo_Pago
FROM Venta v
INNER JOIN Vendedor ven ON v.ID_Vendedor = ven.ID_Vendedor;

-- Ventas con información del vehículo
SELECT v.ID_Venta, ve.Marca, ve.Modelo, v.Precio_Final
FROM Venta v
INNER JOIN Vehiculo ve ON v.ID_Vehiculo = ve.ID_Vehiculo;

-- Venta completa Cliente + Vehículo + Vendedor
SELECT 
    v.ID_Venta,
    c.Nombre AS Cliente,
    ve.Marca,
    ve.Modelo,
    ven.Nombre AS Vendedor,
    v.Precio_Final
FROM Venta v
INNER JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente
INNER JOIN Vehiculo ve ON v.ID_Vehiculo = ve.ID_Vehiculo
INNER JOIN Vendedor ven ON v.ID_Vendedor = ven.ID_Vendedor;

-- Clientes que han comprado vehículos
SELECT DISTINCT c.Nombre, c.Apellido
FROM Cliente c
INNER JOIN Venta v ON c.ID_Cliente = v.ID_Cliente;

-- Vehículos vendidos y su comprador
SELECT ve.Marca, ve.Modelo, c.Nombre, c.Apellido
FROM Venta v
INNER JOIN Vehiculo ve ON v.ID_Vehiculo = ve.ID_Vehiculo
INNER JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente;

-- Total de ventas realizadas
SELECT COUNT(*) AS Total_Ventas
FROM Venta;

-- Suma total de ingresos
SELECT SUM(Precio_Final) AS Ingresos_Totales
FROM Venta;
 
 -- Precio promedio de los vehículos
 SELECT AVG(Precio) AS Precio_Promedio
FROM Vehiculo;

-- Nombre completo del cliente en mayúsculas
SELECT UPPER(CONCAT(Nombre, ' ', Apellido)) AS Nombre_Completo
FROM Cliente;

-- Cantidad de caracteres del VIN
SELECT VIN, LENGTH(VIN) AS Longitud_VIN
FROM Vehiculo;

-- Vehículos más caros que el promedio
SELECT Marca, Modelo, Precio
FROM Vehiculo
WHERE Precio > (SELECT AVG(Precio) FROM Vehiculo);

-- Clientes que han realizado ventas
SELECT Nombre, Apellido
FROM Cliente
WHERE ID_Cliente IN (SELECT ID_Cliente FROM Venta);

-- Vista de ventas detalladas
CREATE VIEW Vista_Ventas_Detalladas AS
SELECT 
    v.ID_Venta,
    c.Nombre AS Cliente,
    ve.Marca,
    ve.Modelo,
    ven.Nombre AS Vendedor,
    v.Precio_Final,
    v.Fecha
FROM Venta v
INNER JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente
INNER JOIN Vehiculo ve ON v.ID_Vehiculo = ve.ID_Vehiculo
INNER JOIN Vendedor ven ON v.ID_Vendedor = ven.ID_Vendedor;

SELECT * FROM Vista_Ventas_Detalladas;



-- ======================Inserción, actualización y eliminación======================
-- Insertar un nuevo cliente
INSERT INTO Cliente (Cedula, Nombre, Apellido, Telefono, Email)
VALUES ('1799999999', 'Carlos', 'Pérez', '0999999999', 'c.perez@email.com');

-- Actualizar el estado de un vehículo
UPDATE Vehiculo
SET Estado = 'Vendido'
WHERE ID_Vehiculo = 1;

-- Eliminar un cliente sin ventas
DELETE FROM Cliente
WHERE ID_Cliente = 3;
