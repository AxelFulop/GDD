use stores7new


--1)

SELECT company,o.order_num,c.customer_num
FROM orders AS o
JOIN customer AS c ON (c.customer_num = o.customer_num)
ORDER BY c.customer_num;

--2)

SELECT i.order_num,i.item_num,m.manu_code,i.quantity,i.total_price
FROM items AS i
JOIN manufact AS m ON ( i.manu_code = m.manu_code)
WHERE i.order_num = 1004


--3)

SELECT i.order_num,i.item_num,pt.description,pt.stock_num,m.manu_code,i.quantity,i.total_price,m.manu_name
FROM items AS i
JOIN manufact AS m ON ( i.manu_code = m.manu_code)
JOIN product_types AS pt ON (pt.stock_num = i.stock_num)
WHERE i.order_num = 1004

--4)
SELECT o.order_num,c.customer_num,fname,lname,company
FROM customer AS c
JOIN orders as o ON (c.customer_num = o.customer_num)

--5)

SELECT DISTINCT (o.customer_num),fname,lname,company
FROM customer as c
JOIN orders AS o ON (o.customer_num = c.customer_num);

--6)

SELECT m.manu_name,p.stock_num,description,unit,unit_price, (unit_price + 20 / 100) as PrecioJunio
FROM product_types AS pt
JOIN products AS p ON (pt.stock_num = p.stock_num)
JOIN manufact  AS m ON (m.manu_code = p.manu_code)
JOIN units as u ON (u.unit_code = p.unit_code);

--7)
SELECT i.order_num,i.item_num,pt.description,pt.stock_num,i.quantity,i.total_price,(i.total_price * i.quantity) AS precioTotal
FROM items AS i
JOIN product_types AS pt ON (pt.stock_num = i.stock_num)
WHERE i.order_num = 1004

--8)
SELECT lead_time,manu_name,o.order_num,c.customer_num
FROM products AS p
JOIN items AS i ON( i.stock_num = p.stock_num)
JOIN orders AS o on (o.order_num = i.order_num)
JOIN customer as c ON ( c.customer_num = o.customer_num)
JOIN manufact AS m ON (m.manu_code = i.manu_code)
WHERE c.customer_num= 104;

--9)
SELECT o.order_num,o.order_date,i.item_num,pt.description,i.quantity,(i.total_price * i.quantity) AS precioTotal
FROM orders AS o
JOIN items AS i ON (o.order_num = i.order_num)
JOIN product_types as pt ON (pt.stock_num = i.stock_num)

--10)
SELECT (c.lname + ',' + c.fname) AS nombreYApellido,'(' + SUBSTRING (c.phone,1,3) + ')' + SUBSTRING(c.phone,5,8),COUNT(o.order_num) AS cantDeOrdenes
FROM customer AS c
JOIN orders AS o ON (c.customer_num = o.customer_num)
GROUP BY c.lname,c.fname,c.phone

--11)
SELECT ship_date,lname + ',' + fname as apeYNombre,COUNT(order_num) as cantOrdenes
FROM orders as o
JOIN customer as c ON (o.customer_num = c.customer_num)
JOIN state as s ON (s.code = c.state)
WHERE s.sname = 'California' AND  zipcode BETWEEN 94000 and 94100
GROUP BY ship_date,lname,fname
ORDER BY ship_date,apeYNombre;



--12)
SELECT manu_name,SUM(quantity) as CantVendida,description,SUM(quantity * total_price) Total
FROM manufact as m
JOIN items as i ON(i.manu_code = m.manu_code)
JOIN product_types as pt ON(pt.stock_num= i.stock_num)
JOIN orders as o ON (o.order_num =i.order_num)
WHERE manu_name IN ('ANZ','HRO','HSK','SMT') 
AND order_date BETWEEN '2015-05-01' AND '2015-06-30'
GROUP BY manu_name,description
ORDER BY Total DESC

--13)
SELECT CAST(YEAR(order_date) AS varchar) + '/' + CAST(MONTH(order_date) AS varchar) as aniomes ,SUM(quantity), SUM(total_price * quantity) as Total
FROM orders as o
JOIN items as i ON (o.order_num = i.order_num)
GROUP BY order_date
ORDER BY Total DESC;