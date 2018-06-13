--CURSORES
--Declarar el cursor, utilizando DECLARE 
--Abrir el cursor, utilizando OPEN  
--Leer los datos del cursor, utilizando FETCH ... INTO 
--Cerrar el cursor, utilizando CLOSE 
--Liberar el cursor, utilizando DEALLOCATE

-- Declaración del cursor 
DECLARE @fname VARCHAR(30),
        @lname VARCHAR(30),
		@company VARCHAR(40),
		@state VARCHAR(100)
DECLARE UnCursor CURSOR

 FOR SELECT fname,lname,company,state FROM customer
-- Apertura del cursor 
OPEN UnCursor
-- Lectura de la primera fila del cursor 
FETCH UnCursor INTO @fname,@lname,@company,@state
WHILE(@@FETCH_STATUS= 0)
 BEGIN 
-- Lectura de la siguiente fila de un cursor 
FETCH UnCursor INTO @fname,@lname,@company,@state
-- Fin del bucle WHILE 
END 
-- Cierra el cursor 
CLOSE UnCursor
-- Libera los recursos del cursor 
DEALLOCATE UnCursor