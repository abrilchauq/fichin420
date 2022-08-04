delimiter ;
SELECT 'Dump' AS Estado;
USE ForeverLand;

CALL registrarCliente(24567892, 'Fabian', 'Perez', 'fabianpeerez@gmail.com', 520, 'ABC12');
CALL registrarCliente(36924187, 'Abril', 'Chauque', 'abrilchauq@gmail.com', 1486, 'ZDG23'); 

CALL altaFichin(14, 'Space Invaders', 1978, 10.3);
CALL altaFichin(34, 'Rastan Saga', 1987, 23.50);
CALL altaFichin(3, 'Street Fighter 2', 1991, 35.25);

CALL altaRecarga('2021/05/11 13:15:20', 500, 24567892);
CALL altaRecarga('2022/05/12 12:45:37', 400, 36924187); 

CALL altaTransaccion('2021/05/11 14:30:10', 24567892, 500, 14);
CALL altaTransaccion('2022/05/12 13:10:40', 36924187, 400, 3);

-- ejemplos que no funcionan para probar triggers
SELECT 'Ejemplo para abortar por triggers' AS Estado;
CALL altaTransaccion('2021/05/11 14:30:10', 24567892, 1000, 14);