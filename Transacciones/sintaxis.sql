BEGIN;
........
INSERT INTO cuentas (n_cuenta, nombre, balance) VALUES (0679259, 'Pepe', 200);
UPDATE cuentas SET balance = balance - 137.00 WHERE nombre = 'Pepe';
UPDATE cuentas SET balance = balance + 137.00 WHERE nombre = 'Juan';
SELECT nombre, balance FROM cuentas WHERE nombre = 'Pepe' AND nombre = 'Juan';
........
COMMIT;


BEGIN;
......
"SENTENCIAS SQL"
......
COMMIT;

ROLLBACK;    --La sentencia que se haya ejecutado anteriormente queda desechada
--Para poder utilizar estos comando mencionados (BEGIN, COMMIT y ROLLBACK) debemos de desactivar el AUTOCOMMIT. 
--Ésta opción es a nivel de cliente y por defecto está activada. De forma que toda sentencia ejecutada queda confirmada y registrada en la base de datos.


BEGIN;
    INSERT INTO table1 VALUES (1);
    ...
    SAVEPOINT my_savepoint;
    ...
    INSERT INTO table1 VALUES (2);
    ..
    ROLLBACK TO SAVEPOINT my_savepoint;
    ..
    INSERT INTO table1 VALUES (3);
COMMIT;   --Tambien se puede dividir las transacciones en diferentes partes llamados SAVEPOINT 
