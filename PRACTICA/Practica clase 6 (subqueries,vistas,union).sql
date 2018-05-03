USE stores7new


--1)

SELECT m.manu_code,manu_name,lead_time,SUM(total_price) as Monto
FROM items as i 
RIGHT JOIN manufact as m ON(i.manu_code = m.manu_code)
GROUP BY m.manu_code,manu_name,lead_time
ORDER BY m.manu_code

--2)
SELECT p1.stock_num,description,p1.manu_code,p2.manu_code
FROM products as p1
LEFT JOIN products  as p2 ON(p1.stock_num = p2.stock_num AND  p1.manu_code != p2.manu_code)
JOIN product_types as p ON ( p1.stock_num = p.stock_num);

--3)
--a)
SELECT customer_num,lname,fname
FROM customer 
WHERE customer_num IN(SELECT customer_num 
                      FROM orders
					  GROUP BY customer_num
					  HAVING COUNT(order_num) > 1);

--b)
SELECT customer_num
INTO #tmpClientes
FROM orders
GROUP BY customer_num
HAVING COUNT(order_num)> 1 

SELECT c.customer_num,fname,lname
FROM customer as c
JOIN #tmpClientes as tmp ON (tmp.customer_num = c.customer_num)

--c)

SELECT c.customer_num,fname,lname
from customer as c
JOIN orders as o ON(c.customer_num = o.customer_num)
GROUP BY c.customer_num,fname,lname
HAVING COUNT(order_num) > 1		

--4)

SELECT SUM(total_price) as MontoTotal, o.order_num
FROM orders as o
JOIN items  as i ON (i.order_num = o.order_num)
GROUP BY o.order_num
HAVING SUM(total_price) < (SELECT AVG(total_price) FROM items)

		