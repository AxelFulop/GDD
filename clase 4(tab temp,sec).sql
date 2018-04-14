/* Tablas temporales: datos cuya existencia es temporal

tipos de tablas: de sesion(locales) y globales
tipos de creacion: explicita e implicita

tabla de sesion: Son tablas que solo viven en una sesion, al desconectarse de esa sesion se pierde esa tabla
tablas globales: no se borras luego de desconectarse de la sesion
*/


-- se utilizan para optimizar accesos a una consulta varias veces en una aplicacion
-- para almazenar resultados intermedios de una aplicacion 
use stores7new;
CREATE TABLE ##temporalGlobalNombre AS unaTablaTemporalGlobal;
CREATE TABLE #temporalSesionNombre AS unaTablaTemporalSesion; 

CREATE TABLE #ordenes_pendientes(


);

--EXPLICITA
INSERT INTO #ordenes_pendientes 
SELECT * FROM 
WHERE  c_estado = 1
--IMPLICITA
SELECT * FROM ordenes 
INSERT INTO #ordenes_pendientes 
WHERE  c_estado = 1

--Secuencia: prooven una serie de numeros secuenciales,para genera numeros secuenciales y unicos sin el lockeo transaccional
--sirve para implementar claves subrogadas
-- se utiliza la palabra reservada  identity
-- no se debe usar secuencia cuando un numero no puede tener huecos como por ejemplo nroFactura
--no es editable, no se puede cargar un dato en identity

--identity(constraint(restricciones) al lado del campo) que aumenta progresivamente el valor de un campo identity(1,1) (empiezo en 1 y aumento en 1)
--seq unNombre : tiene un numero, con dos consultas, nextual,currual

--INSERT: insertat filas en una tabla

INSERT INTO nomTabla VALUES (listaValores)

INSERT INTO state (code,sname) VALUES('ZZ','Axelandia')

INSERT INTO state
SELECT codigo,nombre 
FROM provinciasArgentinas;

--DELETE: borra la tabla

DELETE FROM nomTable
WHERE condicion;

--UPDATE: modifica  valores o campos de la tabla

UPDATE nomTable
SET col = valor,
    col2 = valor2
WHERE condicion;

UPDATE state 
SET code = '0982'
WHERE code = '1123'

alter table #prueba add total int -- agrega un nuevo campo al final de  la tabla