CREATE DATABASE vistas_ejer1 WITH ENCODING = 'UTF8' CONNECTION LIMIT=-1;

CREATE TABLE coleccion (id serial NOT NULL, 
nombre character varying(30),
cromos integer,
CONSTRAINT pk_coleccion PRIMARY KEY (id) );

CREATE TABLE cromo (id serial NOT NULL, 
numero integer, 
obtenido boolean, 
coleccion integer, 
CONSTRAINT pk_cromo PRIMARY KEY (id), 
CONSTRAINT fk_coleccion FOREIGN KEY (coleccion) 
REFERENCES coleccion (id) );

INSERT INTO cromo (numero,obtenido,coleccion) VALUES (76,true,1);
INSERT INTO coleccion (nombre,cromos) VALUES ('Frozen',2);

--Las vistas permiten obtener informacion concreta de la base de datos 
-- a partir de cualquier consulta, se pueden encapsular los detalles de la tablas
--si por ejemplo se cambie por que se añaden nuevos campos la vista permanecera igual

CREATE VIEW coleccion_frozen as SELECT nombre, numero, obtenido FROM coleccion, cromo  
WHERE coleccion.id = cromo.coleccion AND coleccion.nombre = 'Frozen';
