/*
-create
-fk

*/

producto_1


/*libro
-id: pk (autoincrement)
articulo_id fk
isbn: VARCHAR()*/
CREATE TABLE libro (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	articulo_id INT NOT NULL /*fk*/,
	isbn VARCHAR(14), /*unique*/
	sinopsis VARCHAR(500),
	editorial VARCHAR(50)
);
DESCRIBE libro; 

ALTER TABLE libro ADD CONSTRAINT UN_libro_articulo_id UNIQUE(articulo_id);

ALTER TABLE libro ADD CONSTRAINT FK_libro_producto_1_articulo_id FOREIGN KEY(articulo_id) REFERENCES producto_1(id);

/* producto no es posible agregar valores <0 */
ALTER TABLE producto_1 ADD CONSTRAINT CHECK(precio >=0);

/*consultas basicas de sql*/
/*todos los productos-libros*/
SELECT * FROM producto_1 p
	INNER JOIN libro l
		ON p.id = l.articulo_id
	WHERE p.id = 8;
	
/*FILTRAR CAMPOS*/
SELECT p.id,p.precio,
	l.isbn
FROM producto_1 p
	INNER JOlibroIN libro l
		ON p.id = l.articulo_id

/*precio del articulo*/
SELECT *
FROM producto_1 p
WHERE p.precio >= 100 AND p.precio <=5000

/*rango:between*/
SELECT *
FROM producto_1 p
WHERE p.precio BETWEEN 100 AND 500;

/*in (va1, va2, van)*/
SELECT * FROM producto_1
WHERE tipo_producto_id IN(1,3,7) OR tipo_producto_id IS NULL;
/*or*/

/*funciones*/
SELECT MAX(precio) FROM producto_1
SELECT MIN(precio) FROM producto_1

/*limit*/
/*1000000 registros! ni se les ocurra cargar en memoria*/
SELECT * FROM producto_1 LIMIT 2 OFFSET 2

/*like*/
SELECT * FROM producto_1 WHERE titulo LIKE 'ter%'
SELECT * FROM producto_1 WHERE LOWER(titulo) LIKE '%gro'
SELECT * FROM producto_1 WHERE UPPER(titulo) LIKE '%lumi%'

SELECT UPPER('iron') FROM producto_1;
SELECT LOWER('iron') FROM producto_1;

/*articulos, que sean libros, precio >= 100 && <=5000 && exista una imagen*/
SELECT * FROM producto_1 p 
INNER JOIN libro 1
ON l.articulo_id = p.id
WHERE p.precio BETWEEN 100 AND 5000
AND p.img IS NOT NULL;
OR (p.precio * 1.20 < 3000);

UPDATE producto_1
SET img = 'una url de mentira'
WHERE id = 8;

SELECT precio * 1.2;
FROM producto_1;

SELECT * FROM producto_1 ORDER BY precio ASC,id ASC

/*buscar exists, group y having*/