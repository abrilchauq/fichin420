SELECT 'Creando Triggers' AS Estado;
USE ForeverLand;
DELIMITER $$
DROP TRIGGER IF EXISTS aftUpdRecarga $$
CREATE TRIGGER aftUpdRecarga AFTER UPDATE ON Recarga 
FOR EACH ROW
BEGIN 
    UPDATE cliente 
    SET saldo = saldo + new.monto
    WHERE  dni = new.dni;
END $$

DELIMITER $$
DROP TRIGGER IF EXISTS befInsTransaccion $$
CREATE TRIGGER befInsTransaccion BEFORE INSERT ON Transaccion
FOR EACH ROW 
BEGIN
    IF(EXISTS(SELECT *
            FROM Cliente
            WHERE dni = new.dni
            AND saldo < new.credito)) THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Saldo insuficiente';
    END IF;
END $$