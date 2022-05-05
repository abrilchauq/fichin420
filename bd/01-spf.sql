DELIMITER $$
DROP PROCEDURE IF EXISTS Altarecarga $$
CREATE PROCEDURE Altarecarga (unaFechaHora DATETIME, unMonto DECIMAL (7, 2), unDNI INT UNSIGNED)
BEGIN
    INSERT INTO recarga(FechaHora, monto, dni)
                VALUES(unaFechaHora, unMonto, unDNI);
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaTransaccion $$
CREATE PROCEDURE altaTransaccion(unaFechaHora DATETIME, unDNI INT UNSIGNED, unCredito DECIMAL(7, 2), unIdFichin TINYINT UNSIGNED)
BEGIN
    INSERT INTO transaccion(FechaHora, dni, credito, IdFichin)
                VALUES(unaFechaHora, unDNI, unCredito, unIdFichin);
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaFichin $$
CREATE PROCEDURE altaFichin(unIdFichin TINYINT UNSIGNED, unNombre VARCHAR (45), unLanzamiento YEAR, unPrecio DECIMAL(7, 2)
BEGIN
    INSERT INTO fichin(IdFichin, nombre, lanzamiento, precio)
                VALUES(unIdFichin, unNombre, unLanzamiento, unPrecio);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCliente $$
CREATE PROCEDURE registrarCliente(unDNI INT UNSIGNED, unNombre VARCHAR (45), unApellido VARCHAR (45), unMail VARCHAR(50),
                                  unaTarjeta SMALLINT UNSIGNED, unaContrasena CHAR(64))
BEGIN
    INSERT INTO cliente(dni, nombre, apellido, mail, tarjeta, contrasena)
            values(unDNI, unNombre, unApellido, unMail, unaTarjeta, SHA2(unaContrasena, 256));
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS clientePorDniPass $$
CREATE PROCEDURE clientePorDniPass(unDNI INT UNSIGNED, unaContrasena CHAR(64))
BEGIN
    SELECT *
     FROM Cliente
     WHERE dni = unDNI 
     AND contrasena = SHA2(unaContrasena, 256);
END $$

DELIMITER $$
DROP FUNCTION IF EXISTS RecaudacionPara $$
CREATE FUNCTION RecaudacionPara (unIdFichin TINYINT UNSIGNED)
                                RETURNS DECIMAL (7,2)
                                READS SQL DATA 
BEGIN 
    DECLARE ganancia DECIMAL (7,2);

    SELECT SUM(credito) INTO ganancia
    FROM transaccion
    JOIN fichin USING(idFichin)
    WHERE idFichin = unIdFichin 
    BETWEEN  fechahora AND lanzamiento;

RETURN ganancia;
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS Gastos $$
CREATE PROCEDURE Gastos(undni INT UNSIGNED)
BEGIN 
    SELECT fechaHora, nombre, credito
    FROM transaccion
    JOIN Fichin USING(idFichin)
    WHERE dni = undni
    ORDER BY fechaHora DESC; 
    
END $$