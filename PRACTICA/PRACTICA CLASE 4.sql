--1)
use stores7new

SELECT * 
INTO #clientes 
FROM customer;
 

 --2)

 INSERT INTO #clientes (customer_num,fname,lname,company,state,city)  
 VALUES (144,'Agustin','Creevy','Jaguares SA','CA','Los angeles');

 --3)
Select TOP 0 * 
into #clientesCalifornia
FROM customer

DROP TABLE #clientesCalifornia

SELECT *
INTO #clientesCalifornia
FROM customer
WHERE  state = 'CA'

SELECT * FROM #clientesCalifornia

--4)
INSERT INTO #clientes
SELECT 155,fname,lname,company,address1,address2,city,state,zipcode,phone,customer_num_referedBy
FROM #clientes
WHERE customer_num = 103

--SELECT *  FROM #clientes

--5)
DELETE FROM #clientes
WHERE zipcode BETWEEN 94000 and 94500 and city LIKE 'M%'

--7)

SELECT customer_num
FROM #clientes
WHERE state = 'CO';

UPDATE #clientes
SET state = 'AK',
    address2 = 'Barrio Las Heras'
WHERE state = 'CO';

--8)
UPDATE #clientes
SET phone = '1' + phone

--9)
BEGIN TRAN -- empieza a ejecutar consultas

 
 INSERT INTO #clientes (customer_num,lname,company,state)  
 VALUES (166,'apellido','nombre empresa','CA');

 DELETE #clientesCalifornia

 SELECT * 
 FROM #clientes

 SELECT *
 FROM #clientesCalifornia

 ROLLBACK TRAN -- termina de ejecutar consultas, puedo volver a lo que estaba antes

  SELECT * 
 FROM #clientes

 SELECT *
 FROM #clientesCalifornia

 --10)

 BEGIN TRAN

 
 INSERT INTO #clientes (customer_num,lname,company,state)  
 VALUES (166,'apellido','nombre empresa','CA');

 DELETE #clientesCalifornia

COMMIT -- no permite realizar ninguna accion con las tran empezada

ROLLBACK TRAN -- no se va a poder ejecutar

 SELECT * 
 FROM #clientes

 SELECT *
 FROM #clientesCalifornia

