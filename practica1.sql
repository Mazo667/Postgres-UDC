CREATE DATABASE "practica1" 
WITH ENCODING = 'UTF8' 
CONNECTION LIMIT =-1;
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


