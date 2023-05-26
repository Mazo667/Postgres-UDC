CREATE DATABASE practica2 WITH ENCODING = 'UTF8' CONNECTION LIMIT -1;

CREATE TABLE cantante(id serial NOT NULL,
nombre character varying(30),
CONSTRAINT pk_id
PRIMARY KEY (id) );

CREATE TABLE cds (
id serial NOT NULL, 
titulo character varying(30), 
cantante integer, 
duracion integer, 
CONSTRAINT pk_id 
PRIMARY KEY (id),
CONSTRAINT fk_cantante 
FOREIGN KEY (cantante)
REFERENCES cantante (id) );
