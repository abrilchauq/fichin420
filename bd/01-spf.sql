DELIMITER $$
DROP PROCEDURE IF EXISTS recarga$$
CREATE PROCEDURE recarga (unaFechaHora DATETIME, unMonto DECIMAL (7, 2), unDNI INT UNSIGNED)
BEGIN
    INSERT INTO recarga(FechaHora, monto. dni)
                VALUES(unaFechaHora, unMonto, unDNI)
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS transaccion$$
CREATE PROCEDURE transaccion(unaFechaHora DATETIME, unDNI INT UNSIGNED, unCredito DECIMAL(7, 2), unIdFichin TINYINT UNSIGNED)
BEGIN
    INSERT INTO transaccion(FechaHora, dni, credito, IdFichin)
                VALUES(unaFechaHora, unDNI, unCredito, unIdFichin)
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS fichin$$
CREATE PROCEDURE fichin(unIdFichin TINYINT UNSIGNED, unNombre VARCHAR (45), unLanzamiento YEAR, unPrecio DECIMAL(7, 2)
BEGIN
    INSERT INTO fichin(IdFichin, nombre, lanzamiento, precio)
                VALUES(unIdFichin, unNombre, unLanzamiento, unPrecio)
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS registrarCliente$$
CREATE PROCEDURE registrarCliente(unDNI INT UNSIGNED, unNombre VARCHAR (45), unApellido VARCHAR (45), unMail VARCHAR(50),
                                  unaTarjeta SMALLINT UNSIGNED, unaContrasena CHAR(64))
BEGIN
    INSERT INTO registrarCliente(dni, nombre, apellido, mail, tarjeta, contrasena)
            SELECT(unDNI, unNombre, unApellido, unMail, unaTarjeta, SHA2(unaContrasena, 256))
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS clientePorDniPass$$
CREATE PROCEDURE clientePorDniPass(unDNI INT UNSIGNED, unaContrasena CHAR(64))
BEGIN
    (SELECT dni, contrasena
     FROM Cliente
     WHERE dni = unDNI 
     AND contrasena = SHA2(unaContrasena, 256)

