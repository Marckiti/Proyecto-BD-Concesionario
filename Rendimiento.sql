-- ==============RENDIMIENTO==================================================================
CREATE INDEX idx_venta_cliente
ON Venta (ID_Cliente);

EXPLAIN
SELECT v.ID_Venta, c.Nombre, c.Apellido, v.Precio_Final
FROM Venta v
INNER JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente;

-- Filtros por estado del vehículo
CREATE INDEX idx_vehiculo_estado
ON Vehiculo (Estado);

-- Filtros por precio del vehículo
CREATE INDEX idx_vehiculo_precio
ON Vehiculo (Precio);

-- JOIN Venta → Vendedor
CREATE INDEX idx_venta_vendedor
ON Venta (ID_Vendedor);

-- JOIN Venta → Vehiculo
CREATE INDEX idx_venta_vehiculo
ON Venta (ID_Vehiculo);

-- JOIN Venta → Cliente
CREATE INDEX idx_venta_cliente
ON Venta (ID_Cliente);

-- Subconsultas y búsquedas por cliente
CREATE INDEX idx_cliente_id
ON Cliente (ID_Cliente);

-- Conteo y sumatoria sobre ventas (optimiza lecturas)
CREATE INDEX idx_venta_precio_final
ON Venta (Precio_Final);