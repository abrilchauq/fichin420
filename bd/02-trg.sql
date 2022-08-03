DELIMITER $$ 
DROP TRIGGER IF EXISTS aftUpdRecarga $$
CREATE TRIGGER aftUpdRecarga AFTER INSERT ON Recarga 
FOR EACH ROW
BEGIN 
    UPDATE cliente 
    SET saldo = saldo + new.monto
    WHERE  dni = new.dni;
END $$

DELIMITER $$
DROP TRIGGER IF EXITS befInsCliente $$
CREATE TRIGGER befInsCliente BEFORE INSERT ON Cliente
FOR EACH ROW 
BEGIN
    
END $$