CREATE DATABASE biblioteca;

CREATE TABLE trabajador (
id SERIAL NOT NULL,
nombre CHARACTER VARYING(30),
apellido CHARATER VARYING(50),
nif CHARACTER VARYING(10),
CONSTRAINT pk_trabajador PRIMARY KEY (id) );

CREATE TABLE usuario (
id SERIAL  NOT NULL,
nombre CHARACTER VARYING(30),
apellido CHARACTER VARYING(50),
nif CHARACTER VARYING(10),
carnet CHARACTER VARYING(30),
CONSTRAINT pk_usuario PRIMARY KEY(id) );

CREATE TABLE autor (
id SERIAL NOT NULL,
nombre CHARACTER VARYING(30),
apellido CHARACTER VARYING(50),
CONSTRAINT pk_autor PRIMARY KEY(id) );

CREATE TABLE libro (
id SERIAL NOT NULL,
titulo CHARACTER VARYING(40),
autor INTEGER,
isbn CHARACTER VARYING(15),
usuario INTEGER,
prestado DATE,
devuelto DATE,
CONSTRAINT pk_libro PRIMARY KEY (id),
CONSTRAINT fk_autor FOREIGN KEY (autor) REFERENCES autor (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION );

--SE VAN A GENERAR 2 VISTAS, LA PRIMERA VISTA EN LA QUE SE VEAN LOS LIBROS JUNTOS A LOS AUTORES Y LOS USUARIOS

CREATE VIEW libro_completo AS
  SELECT libro.id, 
  libro.titulo,
  autor.nombre,
  autor.apellido,
  libro.isbn,
  usuario.nombre,
  usuario.apellido,
  libro.prestado,
  libro.devuelto
  FROM libro,autor, usuario
  WHERE autor.id = libro.autor
  AND usuario.id = libro.usuario ;
  
--SEGUNDA VISTA EN LA QUE SE UNAN LOS NOMBRES Y APELLIDOS DE TODAS LAS PERSONAS DE TRABAJADORES, USUARIOS Y AUTORES

CREATE VIEW personas AS
  SELECT autor.nombre AS perNombre,
    autor.apellido AS perApellido
  FROM autor
UNION
  SELECT usuario.nombre AS perNombre,
    usuario.apellido AS perApellido
  FROM usuario
UNION
  SELECT trabajador.nombre AS perNombre,
    trabajador.apellido AS perApellido
  FROM trabajador ;
  
--ELIMINACION 
