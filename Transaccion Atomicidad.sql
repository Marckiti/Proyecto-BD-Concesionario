-- ========TRANSACCION=======================================================
START TRANSACTION;

INSERT INTO Venta (Precio_Final, Metodo_Pago, ID_Vehiculo, ID_Cliente, ID_Vendedor)
VALUES (35000, 'Crédito', 1, 1, 1);

UPDATE Vehiculo
SET Estado = 'Vendido'
WHERE ID_Vehiculo = 1;

COMMIT;