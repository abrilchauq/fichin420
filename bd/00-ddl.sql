DROP DATABASE IF EXISTS ForeverLand;

SELECT 'Creando Tablas' AS Estado;

CREATE DATABASE ForeverLand;

CREATE TABLE ForeverLand.fichin(
    idFichin TINYINT UNSIGNED NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    lanzamiento YEAR NOT NULL,
    precio DECIMAL (7,2) NOT NULL,
    PRIMARY KEY (idFichin)
);

CREATE TABLE ForeverLand.cliente(
    DNI INT UNSIGNED NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    apellido VARCHAR (45) NOT NULL,
    mail VARCHAR (50) NOT NULL,
    tarjeta SMALLINT UNSIGNED NOT NULL,
    contrasena CHAR (64) NOT NULL,
    saldo DECIMAL (7, 2),
    PRIMARY KEY (DNI),
    CONSTRAINT UQ_cliente_tarjeta UNIQUE (tarjeta)
);

CREATE TABLE ForeverLand.recarga(
    fechahora DATETIME NOT NULL,
    monto DECIMAL (7,2) NOT NULL,
    DNI INT UNSIGNED NOT NULL,
    PRIMARY KEY (fechahora,DNI),
    CONSTRAINT FK_recarga_cliente FOREIGN KEY (DNI)
        REFERENCES ForeverLand.cliente (DNI)
);

CREATE TABLE ForeverLand.transaccion(
    fechahora DATETIME NOT NULL,
    DNI INT UNSIGNED NOT NULL,
    credito DECIMAL (5,2) NOT NULL,
    idFichin TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (fechahora,DNI),
    CONSTRAINT FK_transaccion_fichin FOREIGN KEY (idFichin)
        REFERENCES ForeverLand.fichin (idFichin),
    CONSTRAINT FK_transaccion_cliente FOREIGN KEY (DNI)
        REFERENCES ForeverLand.cliente (DNI)
);
