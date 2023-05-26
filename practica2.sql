CREATE DATABASE practica2 WITH ENCODING = 'UTF8' CONNECTION LIMIT -1;

CREATE TABLE cantante(
id serial NOT NULL,
nombre character varying(30),
CONSTRAINT pk_id
PRIMARY KEY (id) );

CREATE TABLE cds (
id serial NOT NULL, 
titulo character varying(30), 
cantante integer, 
duracion integer, 
CONSTRAINT pk_cds PRIMARY KEY (id),
CONSTRAINT fk_cantante FOREIGN KEY (cantante) REFERENCES cantante (id)
);

INSERT INTO cantante (nombre) VALUES ('BSO');
INSERT INTO cantante (nombre) VALUES ('Mike Oldfield');
INSERT INTO cantante (nombre) VALUES ('Sting');
INSERT INTO cantante (nombre) VALUES ('Madonna');

INSERT INTO cds (titulo, cantante, duracion) VALUES ('Lord of the Rings', 1, 54);
INSERT INTO cds (titulo, cantante, duracion) VALUES ('Star Wars', 1, 57);
INSERT INTO cds (titulo, cantante, duracion) VALUES ('Tubular Bells', 2, 73);
INSERT INTO cds (titulo, cantante, duracion) VALUES ('Elements', 2, 68);
INSERT INTO cds (titulo, cantante, duracion) VALUES ('Sting & The Police', 3, 56);
INSERT INTO cds (titulo, cantante, duracion) VALUES ('Ray of light', 4, 55);
