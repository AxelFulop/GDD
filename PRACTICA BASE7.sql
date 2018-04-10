USE stores7new;

--1)
SELECT fname,address1,address2 FROM customer;

--2)
SELECT fname,address1,address2 
FROM customer 
WHERE state = 'CA';

--3)
SELECT DISTINCT city 
FROM customer
WHERE state = 'CA';

--4)
SELECT DISTINCT city 
FROM customer 
WHERE state = 'CA' 
ORDER BY city ASC;
 
--5)

SELECT TOP 1 address1 
FROM customer 
WHERE customer_num = 103; 

--6)
SELECT stock_num ,unit_code  
FROM products 
where manu_code = 'ANZ' 
ORDER BY unit_code;

--7)
SELECT DISTINCT manu_code 
FROM items 
ORDER BY manu_code ASC;  

--8)

SELECT order_num,order_date,customer_num,ship_date
FROM orders 
WHERE paid_date IS NULL AND YEAR (ship_date) = 2015 AND MONTH(ship_date) BETWEEN 1 and 9; 

--9)
SELECT customer_num,company
FROM customer
WHERE company  LIKE '%town%';

--10)
SELECT MAX(ship_charge) AS maximoPagado,MIN(ship_charge) AS minimoPagado,AVG(ship_charge) AS promedioPagado
FROM orders;

--11)
SELECT order_num,order_date,ship_date 
FROM orders
WHERE MONTH(ship_date) = MONTH(order_date);

--12) preguntar porque hay que poner los 3 en el group by
SELECT customer_num,ship_charge,ship_date
FROM orders
GROUP  BY customer_num,ship_charge,ship_date
ORDER BY SUM(ship_charge),ship_date DESC;

--13)
SELECT ship_date,SUM(ship_weight) AS totalPeso
FROM orders
GROUP BY ship_date,ship_weight
HAVING (SUM(ship_weight) > 30)
ORDER BY  SUM(ship_weight) ASC;

--14)
