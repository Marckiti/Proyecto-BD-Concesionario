-- =========AUDITORIA=================================================
CREATE TABLE Auditoria_Venta (
    ID_Auditoria INT AUTO_INCREMENT PRIMARY KEY,
    Accion VARCHAR(10),          -- INSERT, UPDATE, DELETE
    ID_Venta INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Usuario_DB VARCHAR(100)
);

-- Trigger Insert
CREATE TRIGGER trg_venta_insert
AFTER INSERT ON Venta
FOR EACH ROW
INSERT INTO Auditoria_Venta (Accion, ID_Venta, Usuario_DB)
VALUES ('INSERT', NEW.ID_Venta, USER());

-- Trigger Update
CREATE TRIGGER trg_venta_update
AFTER UPDATE ON Venta
FOR EACH ROW
INSERT INTO Auditoria_Venta (Accion, ID_Venta, Usuario_DB)
VALUES ('UPDATE', NEW.ID_Venta, USER());

-- Trigger Delete
CREATE TRIGGER trg_venta_delete
AFTER DELETE ON Venta
FOR EACH ROW
INSERT INTO Auditoria_Venta (Accion, ID_Venta, Usuario_DB)
VALUES ('DELETE', OLD.ID_Venta, USER());


-- ======PRUEBAS========================================================
-- INSERT
INSERT INTO Venta (Precio_Final, Metodo_Pago, ID_Vehiculo, ID_Cliente, ID_Vendedor)
VALUES (30000, 'Efectivo', 1, 1, 1);

-- UPDATE
UPDATE Venta
SET Metodo_Pago = 'Crédito'
WHERE ID_Venta = 1;

-- DELETE
DELETE FROM Venta
WHERE ID_Venta = 1;

-- =============================
SELECT * FROM Auditoria_Venta;
-- =============================
