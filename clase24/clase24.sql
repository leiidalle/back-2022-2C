/*insertar un registro en una tabla*/
/*script*/
INSERT INTO producto (codigo,titulo,precio,fecha_alta,autor,img) 
VALUES('abc0000001','microfono hyperx',2500,CURDATE(),'yo mismo',NULL);
/*ctrl+f9*/

/*SELECT columnas from tabla*/

SELECT * FROM producto;

/*UPPERCASE*/
INSERT INTO producto (codigo,titulo,precio,fecha_alta,autor,img) 
VALUES(UPPER('abc0000002'),UPPER('microfono hyperx'),2500,CURDATE(),UPPER('yo mismo'),NULL);

/*para actualizar un campo de una tabla*/
UPDATE producto 
SET img = 'http://mistio.com.ar/img/abc.jpg'
WHERE ID = 4;

/*consulta por un campo especifico*/
SELECT * FROM producto 
WHERE ID=4;

/*ELIMINAR UN REGISTRO DE UNA TABLA ojo, siempre poner el where primero*/
DELETE FROM producto
WHERE id=2;

/*consultar todos los registros*/
SELECT * FROM producto;


/*update de dos o mas campo*/
UPDATE producto
SET titulo = UPPER('termo lumilagro'), 
	precio = 35000, 
	img = 'http://mercadolibre.com.ar/img/termo.jpg'
WHERE ID=1

/*SELECT CON CAMPOS ESPECIFICOS*/
SELECT id,titulo,precio,img 
FROM producto
WHERE id=1;
/*DML*/


/*CREAR UNA TABLA VIA SCRIPT*/
/*DDL*/
CREATE TABLE producto (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(10) NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	precio FLOAT NOT NULL,
	fecha_creacion DATE not NULL,
	autor VARCHAR(50),
	img VARCHAR(100)
);
/*AHORA AGRREGO UNIQUE AL CAMPO CODIGO*/
ALTER TABLE producto_1 ADD CONSTRAINT UN_producto_codigo UNIQUE INDEX(CODIGO);

/*describir la tabla, viendo campos y atributos*/
DESCRIBE producto_1;

/*quiero que el campo precio >=0*/
ALTER TABLE producto_1 ADD CONSTRAINT CHECK(precio >= 0);

INSERT INTO producto_1 (codigo,titulo,precio,fecha_creacion,autor,img) 
VALUES(UPPER('abc0000003'),UPPER('microfono hyperx'),100, CURDATE(),UPPER('yo mismo'),NULL);

/*ELIMINAR TABLAS */
DROP TABLE producto_2;
DESCRIBE producto_2;


/*crear la tabla tipo producto*/
CREATE TABLE tipo_producto (
	id INT not NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(50) NOT null
);

/*insertar los datos en la tabla*/
INSERT INTO tipo_producto (descripcion)  VALUES('LIBRO')
INSERT INTO tipo_producto (descripcion)  VALUES('MUSICA');
INSERT INTO tipo_producto (descripcion)  VALUES('PELICULA');
INSERT INTO tipo_producto (descripcion)  VALUES('PASATIEMPO');

SELECT * FROM tipo_producto;

/*agregarle un campo a una tabla*/
ALTER TABLE producto ADD tipo_producto_id INT;

DESCRIBE producto;

/*agregar foreign key en tabla producto */
ALTER TABLE producto 
ADD CONSTRAINT FK_producto_tipo_producto_id 
FOREIGN KEY (tipo_producto_id)
REFERENCES tipo_producto(id);

/*intento insertar un tipo producto que no existe en tipo_producto*/
INSERT INTO producto (codigo,titulo,precio,fecha_alta,autor,img,tipo_producto_id) 
VALUES(UPPER('abc0000004'),UPPER('microfono hyperx'),100, CURDATE(),UPPER('yo mismo'),NULL,1);

SELECT * FROM producto
WHERE tipo_producto_id IS NOT NULL;

/*busco en la tabla tipo_producto el registro que tenga id=1*/
SELECT * FROM tipo_producto WHERE id = 4;

/*consultas con join*/
SELECT * 
FROM producto JOIN tipo_producto 
WHERE producto.tipo_producto_id = tipo_producto.id;

/*ALIAS DE CAMPOS Y TABLAS*/
SELECT id AS ID_PRODUCTO, 
	tipo_producto_id AS TIPO
FROM producto;

/*TABLAS*/
SELECT * 
FROM producto AS p
JOIN tipo_producto AS tp 
WHERE p.tipo_producto_id = tp.id;

/*ojo con hacer join sin especificar where*/
SELECT * 
	FROM producto AS p
		INNER JOIN tipo_producto AS tp 
			ON po_producto_id = tp.id; 
	WHERE p.id = tp.id
	AND P.PRECIO > 30000

/*mas de una condicion en WHERE*/


SELECT P.ID, P.AUTOR, P.precio,P.IMG,
	TP.DESCRIPCION
FROM producto P
INNER JOIN tipo_producto TP
ON P.TIPO_PRODUCTO_ID = TP.ID
WHERE P.ID = 1;
