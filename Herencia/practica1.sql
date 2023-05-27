CREATE TABLE localidad (
id SERIAL NOT NULL,
nombre CHARACTER VARYING (30),
poblacion REAL,
CONSTRAINT pk_localidad PRIMARY KEY (id) );

--PARA CREAR UNA SEGUNDA TABLA DE CAPITALES DE PROVINCIA, DE SILIMILAR ATRIBUTOS SE PUEDE USAR LA HERENCIA DE LA SIGUIENTE MANERA

CREATE TABLE capital (
provincia CHARACTER VARYING(30)
) INHERITS (localidad) ;

--EN ESTE CASO SE HEREDAN LAS DEMAS COLUMNAS OBTENIENDO UNA TABLA CON LA MISMA ESTRUCTURA
--PERO OTRA DIFERENCIA ES QUE LO QUE SUCEDE A LA HORA DE LOS DATOS, SI SE HACE UNA CONSULTA A LA TABLA PRINCIPAL LOS DATOS QUE SE OBTIENEN NO SON UNICAMENTE DE
--DICHA TABLA SINO TAMBIEN LOS DE LAS TABLAS QUE HAN SIDO HEREDADAS A PARTIR DE ELLA

SELECT * FROM localidad; --SI COMPLETAMOS AMBAS TABLAS, LOS DATOS QUE ESTEN EN LA TABLA capital TAMBIEN SERAN REFLEJADOS EN LA CONSULTA localidad
SELECT * FROM ONLY localidad;
