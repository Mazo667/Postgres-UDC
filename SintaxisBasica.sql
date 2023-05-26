--CREACION DE UNA BASE DE DATOS

CREATE DATABASE "Nombre"  --Si quiero conservar la mayuscula coloco las comillas dobles sino sin comillas se escribe en miniscula
  WITH OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default   --es el espacio de tablas predeterminado de las bases de datos template1 y template0 
                              --(y, por lo tanto, también será el espacio de tablas predeterminado para otras bases de datos
    LC_COLLATE = 'Spanish_Spain.1252'   --Idioma
    CONNECTION LIMIT = -1; --Significa que por defecto no tiene limite de cantidad de conexiones
  
--TAMBIEN PODEMOS TENER UNA SINTAXIS MAS BASICA YA QUE LOS VALORES ANTERIORES VIENEN POR DEFECTO

CREATE DATABASE nombre_baseDeDatos ;

--CREACION DE TABLAS

CREATE TABLE nombre_tabla (
    nombre_columna  tipo_columna,
    nombre_columna  tipo_columna,
    CONSTRAINT pk_nombre_tabla  PRIMARY KEY (nombre_columna)
    CONSTRAINT fk_nombre_tabla_ref FOREIGN KEY (nombre_columna)
    REFERENCES nombre_tabla (nombre_columna_ref) );
    
--ELIMINAR UNA TABLA
DROP TABLE nombre_tabla
--ELIMINAR UNA BASE DE DATOS
DROP DATABASE nombre_BaseDeDatos;
--ELIMINAR UNA COLUMNA
ALTER TABLE nombre_tabla DROP COLUMN nombre_columna; 
--ELIMINAR UN REGRISTRO
DELETE FROM nombre_tabla WHERE condicion;

--INSERCION DE DATOS
INSERT INTO nombre_tabla (nombre_columna1, nombre_columna2,..) VALUES (valor_columna1,valor_columna2,..);
--MODIFICAR DATOS EXISTENTES
UPDATE  nombre_tabla SET nombre_columna = nuevo_valor WHERE condicion;
UPDATE puntos_viaje SET lugar = 'San Sebastian (centro)' WHERE orden = 1;

--CONSULTAS DE TABLAS
SELECT [ALL/DISTINCT] nombre_columna1,nombre_columna2,.. AS alias1,alias2,.. 
FROM nombre_tabla AS alias_tabla
WHERE condicion [AND / OR condicion]
GROUP BY nombre_columna1,nombre_columna2,..
HAVING condicion
UNION [SELECT * FROM...]
ORDER BY expresion [ASC / DESC] ;

--LIKE
SELECT nombre_columna,
FROM nombre_tabla
WHERE nombre_columna LIKE / NOT LIKE 'condicion';

--EJEMPLO con Jeniffer
SELECT nombre
FROM persona
WHERE nombre LIKE 'Jen%'; --TRUE
WHERE nombre LIKE '%niffer'; --TRUE
WHERE nombre LIKE '_eniffer'; --TRUE


