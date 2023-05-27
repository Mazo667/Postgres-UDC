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
  
--ELIMINACION DE LA TABLA USUARIOS
--PRIMEROHAY QUE ELIMINAR LA RELACION CON LA TABLA LIBROS

ALTER TABLE libro DROP CONSTRAINT fk_usuario ;

--SIGUIENTE PASO ES ELIMINAR LA VISTA PERSONAS POR QUE LA TABLA A ELIMINAR PARTICIPA EN DICHA VISTA
DROP VIEW personas;
--DE LA MISMA FORMA TAMBIEN FORMA PARTE DE LA VISTA librocompleto
DROP VIEW librocompleto;
--UNA VEZ ELIMINADO TODO LOS ELEMENTOS EXTERNOS A LA TABLA, YA SE PUEDE ELIMINAR LA TABLA
DROP TABLE usuario;

--CREACION DE DICHA TABLA PERO USANDO HERENCIA

CREATE TABLE usuario (
  carnet CHARACTER VARYING(20),
  CONSTRAINT pk_usuario PRIMARY KEY (id) ) 
  INHERITS (trabajador) ;
  
--VOLVEMOS A CREAR LA RELACIONES QUE HEMOS BORRADO CON LA CLAVE FORANEA EN LA TABLA LIBRO
ALTER TABLE libro ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario (id) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETENO ACTION;
  
--CREEMOS LA VISTA 
CREATE VIEW librocompleto AS
  SELECT libro.id,
  autor.nombre,
  autor.apellido,
  libro.isbn,
  usuario.nombre,
  usuario.apellido,
  libro.prestado,
  libro.devuelto
  FROM libro, autor, usuario
  WHERE autor.id = libro.autor
  AND usuario.id = libro.usuario ;
  
  --LA SEGUNDA VISTA HAY QUE TENER EN CUENTA QUE AL MOSTRAR LA TABLA DE LOS TRABAJADORES SE VAN HEREDAR AUTOMATICAMENTE LOS
  --DATOS DE LA TABLA DE USUARIOS POR LO QUE NO ES NECESARIO UNIR EL RESULTADO DE DICHA TABLA
  CREATE VIEW personas AS 
    SELECT autor.nombre AS pernombre,
    autor.apellidos AS perapellido
    FROM autor
  UNION 
    SELECT trabajador.nombre AS pernombre,
    trabajador.apellidos AS perapellido
    FROM trabajador ;
