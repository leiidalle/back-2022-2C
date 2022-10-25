CREATE TABLE producto (
	id SERIAL NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	precio FLOAT NOT NULL,
	fecha_creacion DATE NOT NULL,
	imagen VARCHAR(100) NULL DEFAULT NULL,
	codigo VARCHAR(7) NOT NULL,
	PRIMARY KEY (id)
);
ALTER TABLE producto ADD CONSTRAINT UN_producto_codigo unique (codigo);

INSERT INTO `22569`.`producto` 
(`codigo`, `titulo`, `precio`, `fecha_alta`, `autor`, `img`) 
VALUES ('001', 'TERMPO STANLEY', '30000', '2022-10-24', 'CARLOS', '');
