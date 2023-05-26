CREATE DATABASE "practica1" 
WITH ENCODING = 'UTF8' 
CONNECTION LIMIT =-1;

--A tener en cuenta los nombres se pueden poner con comillas dobles para que tome las mayusculas sino por defecto escribe en miniscula
--Creo la Tabla Dispositivo

CREATE TABLE dispositivo (
dis_id serial NOT NULL,
dis_nombre character varying(30),
CONSTRAINT pk_disid PRIMARY KEY (dis_id) );

--Creo la Tabla APlicaciones

CREATE TABLE aplicacion (
id serial NOT NULL, 
nombre character varying(30),
tamanio integer, 
dispositivo integer, 
CONSTRAINT pk_id 
PRIMARY KEY (id), 
CONSTRAINT fk_dispositivo FOREIGN KEY (dispositivo) 
REFERENCES dispositivo (id) );

--Añado 3 Dispositivos
INSERT INTO dispositivo (nombre) VALUES ('Notebook');
INSERT INTO dispositivo (nombre) VALUES ('Ipad');
INSERT INTO dispositivo (nombre) VALUES ('Celular');

--Añado 5 aplicaciones en relacion a las existentes
INSERT INTO aplicacion (nombre,tamanio,dispositivo) VALUES ('Gestion',1500,1);
INSERT INTO aplicacion (nombre,tamanio,dispositivo) VALUES ('Chess',160,2);
INSERT INTO aplicacion (nombre,tamanio,dispositivo) VALUES ('Frozen',385,2);
INSERT INTO aplicacion (nombre,tamanio,dispositivo) VALUES ('Chess 3D',87,3);
INSERT INTO aplicacion (nombre,tamanio,dispositivo) VALUES ('GPS',275,3);

--Modifico los datos de Dispositivo
UPDATE dispositivo SET nombre = 'Tablet Ipad 64gb' WHERE nombre = 'Ipad';
--Modifico los datos de APlicacion
UPDATE  aplicacion SET tamanio = 96 WHERE nombre = 'Chess 3D';

--Si queremos eliminar un registro como puede ser Celular no se podra por que la Foreing Key mantiene una relacion
--DELETE FROM dispositivo WHERE nombre = 'Celular';
--ERROR:  update o delete en «dispositivo» viola la llave foránea «fk_dispositivo» en la tabla «aplicacion»
--DETALLE:  La llave (id)=(3) todavía es referida desde la tabla «aplicacion».

--Obtener los dispositivos
SELECT * FROM dispositivo;
--Obtener las aplicaciones que ocupan mas de 50mb
SELECT * FROM aplicacion WHERE tamanio > 50;
--Obtener las aplicaciones que son para el celular
SELECT * FROM aplicacion WHERE dispositivo = 3;
--Obtener el tamaño total de todas las aplicaciones
SELECT SUM(tamanio) as Total FROM aplicacion;
--Obtener la cantidad de aplicacion para cada dispositivo
SELECT COUNT(dispositivo) FROM aplicacion GROUP BY dispositivo;


