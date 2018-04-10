USE bdGDD;

USE bdGDD;

CREATE TABLE fabricantes(
codigo int NOT NULL,
nombre nvarchar(20) NOT NULL,
PRIMARY KEY (codigo)
); 

CREATE TABLE articulos(
codigo int NOT NULL,
nombre nvarchar(40),
precio int,
fabricante int 
FOREIGN KEY (codigo) REFERENCES fabricantes(codigo)
);
go
INSERT INTO fabricantes VALUES (2919,'Sancor');
INSERT INTO fabricantes VALUES (1299,'Serenisima');
INSERT INTO fabricantes VALUES (0921,'Cocal-Cola');
INSERT INTO fabricantes VALUES (1019,'Pepsi');
INSERT INTO articulos VALUES (2919,'queso',20,10);
INSERT INTO articulos VALUES (2919,'muzzarela',40,10);
INSERT INTO articulos VALUES (0921,'sprite',50,9);
INSERT INTO articulos VALUES (0921,'soda',10,9);
INSERT INTO articulos VALUES (1019,'7up',60,8);
INSERT INTO articulos VALUES (1019,'pepsiCola',50,8);
INSERT INTO articulos VALUES (1219,'yogurt',10,7);
INSERT INTO articulos VALUES (1219,'queso',90,7);


--obtengo el nombre y precio  de lo productos de la tienda
--SELECT nombre,precio  FROM articulos;

--SELECT nombre,precio  FROM articulos WHERE precio >= 10 AND precio <= 50;
--SELECT nombre,precio FROM articulos WHERE precio BETWEEN 10 AND  50;
