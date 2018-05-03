USE bdGDD;

/* metadata: guardar lo que define al dato (CREATE,USE,definicion de datos int,varchar etc) 
el select remplaza a las funciones del tipo join,select,etc de algebra relacional*/

--la funcion SELECT:

--SELECT *  FROM nombreTabla; -> mostraria todas las columnas de la tabla en su orden(NO ESTA COPADO)
--SELECT col1,col2,etc FROM nombreTabla;

CREATE TABLE alumnos(
codigo varchar(30) ,
nombre  varchar(30),
apellido  varchar(30)
);

INSERT INTO alumnos VALUES ('08002','AXEL','FULOP');
INSERT INTO alumnos VALUES ('08003','MATIAS','MORSA');
INSERT INTO alumnos VALUES ('08004','PAULA','SALAZAR');

SELECT codigo,nombre FROM alumnos;
SELECT codigo FROM alumnos WHERE nombre  = 'AXEL';

--ALIAS: NOMBRE FICTICIO QUE NO ES EL QUE RECIBE LA APLICACION,se utiliza en el SELECT con AS
SELECT codigo,apellido + ',' + nombre 'APELLIDOYNOMBRE' FROM alumnos; --Concateno dos STRINGS,me devuelve una sola columna


CREATE TABLE itemss(
codProducto varchar(30),
cantidad  INT,
precio  SMALLINT,
cantidadXprecio SMALLINT
);

SELECT DISTINCT codProducto AS cod ,cantidad FROM itemss;
SELECT DISTINCT apellido FROM alumnos; -- DISTINC  no permite traer columnas  repetidas,un representante de cada clase


--TOP: Muestras los n Primeras columnas

SELECT TOP 3 nombre,apellido FROM alumnos;

/* > < >=  <= != <> and or not
condiciones del SELECT WHERE: BETWEEN,IN,LIKE,IS NULL, IS NOT NULL  */
SELECT codProducto,cantidad,precio FROM itemss WHERE cantidad >= 10 and codProducto BETWEEN 17 and 20
and codProducto NOT IN (10,21,31);--Encontrar codProducto que sean de 10,21 y 31

SELECT codProducto FROM itemss WHERE precio IS NOT NULL;

--% remplaza a 0 caracteres o mas
--_ 1 caracter, evaluar un caracter en particular o posicion en particular
--[] 1 caracter
--like: trae aquellos campos que matchen con el token ingresado
--UPPER: convierte a mayuscula

SELECT nombre,apellido FROM alumnos WHERE nombre LIKE 'M%';
SELECT nombre,apellido FROM alumnos WHERE nombre LIKE '%NA';
SELECT nombre,apellido FROM alumnos WHERE nombre LIKE '[Pp][Ee][Pp][Ee]';
SELECT nombre,apellido FROM alumnos WHERE nombre LIKE '%LA%';--Buscara aquellos que tenga LA en cualquier lado
SELECT nombre,apellido FROM alumnos WHERE nombre LIKE '[A-F]';--Busca aquellos que empiezen desde la A hasta la F
SELECT nombre FROM alumnos WHERE UPPER (nombre) LIKE '[A-Z]%';-- Los nombres en mininuscala pasaran a MAYUSCULAS


--ORDER BY permite ordenar las columnas de forma ascendete o descendente, segun como vengan las columnas
--condiciones del SELECT ORDER BY

SELECT nombre,apellido FROM alumnos ORDER BY apellido DESC;-- de A..Z

SELECT nombre,apellido FROM alumnos ORDER BY apellido ASC;-- de Z..A

--primero ordena los nombres y luego los apellidos

--GROUP BY: Permite agrupar,ordena los datos de la tabla y agrupa una determinada columna para aplicar las determinadas condiciones
--se selecciona aquella columna de la cual se quieren agrupar los datos
--se usa con funciones agregadas para agrupar el conjunto de resultados por una o mas columnas

--Funciones agregadas: SUM,COUNT,MAX,MIN,AVG,COUNT(*),COUNT(CAMPO),COUNT(DISTINCT CAMPO)


SELECT COUNT(*)  FROM alumnos; -- lo que hace count  es contar filas,con * va a ser de todas las columnas

SELECT COUNT(*) AS cantItems,MAX (precio) AS precioMax,MIN (precio) AS precioMin,
AVG(cantidad) cantPromedio FROM itemss GROUP BY codProducto;

SELECT COUNT(nombre) FROM alumnos;
SELECT COUNT(DISTINCT nombre)  FROM alumnos;

--AVG saca el promedio: suma la cantidad y lo divide por la cant de filas

SELECT codProducto,SUM(cantidad) AS totalComprado,AVG(cantidad) AS promedio FROM itemss;

SELECT fechaEmision,COUNT(nroFactura) FROM facturas  WHERE  YEAR(fechaEmision) = 2018 GROUP BY fechaEmision;

--PRIMERO SE UTILIZA EL WHERE Y LUEGO EL GROUP,ESTO UTILIZA MENOS RECURSOS

--HAVING:"TENER", ES COMO EL WHERE PERO PARA LO AGRUPADO, ACTUA SOBRE EL GROUP BY
--SE USAN CON FUNCIONES AGREGADAS Y CON LAS COLUMNAS DEL GROUP BY
--establece cpndiciones en lso grupos creados por GROUP BY

SELECT column1 FROM nombrTabla GROUP BY columna2  HAVING COUNT(COLUMNA3 > 1) ORDER BY columna4;