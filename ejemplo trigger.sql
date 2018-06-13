USE stores7new



--si no existe la tabla expediente la creamos
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name='expedientes' AND xtype='U')   

BEGIN  
    CREATE TABLE expedientes (   
      code             VARCHAR(15)  NOT NULL,
      state            VARCHAR(20)  DEFAULT 'INICIO',
      stateChangedDate DATETIME,
      PRIMARY KEY (code)     
    );   
END;  
 
-- Insertamos algunos expedientes de ejemplo
DELETE FROM expedientes WHERE code IN ('exp1','exp2', 'exp3');
INSERT INTO expedientes (code) VALUES ('exp1');
INSERT INTO expedientes (code) VALUES ('exp2');
INSERT INTO expedientes (code) VALUES ('exp3');
 
-- Si no existe la tabla de cambios de estado la creamos
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name='expStatusHistory' AND xtype='U')   
BEGIN  
    CREATE TABLE expStatusHistory (
      id    INT         IDENTITY,
      code  VARCHAR(15) NOT NULL,
      state VARCHAR(20) NOT NULL,
      date  DATETIME   DEFAULT GetDate(),
      PRIMARY KEY  (id)
	);
END;
 
 
-- Borramos el Trigger si existise
IF OBJECT_ID ('StatusChangeDateTrigger', 'TR') IS NOT NULL
BEGIN
   DROP TRIGGER StatusChangeDateTrigger;
END;
 
GO -- Necesario
 
-- Cremamos un Trigger sobre la tabla expedientes
CREATE TRIGGER StatusChangeDateTrigger
ON expedientes
--quiero que luego de modificar, se dispare el trigger
 AFTER UPDATE AS 
 -- ¿Ha cambiado el estado?
 IF UPDATE(state)
 BEGIN
	-- Actualizamos el campo stateChangedDate a la fecha/hora actual
	UPDATE expedientes SET stateChangedDate=GetDate() WHERE code=(SELECT code FROM inserted);
 
    -- A modo de auditoría, añadimos un registro en la tabla expStatusHistory
	INSERT INTO expStatusHistory  (code, state) (SELECT code, state FROM deleted WHERE code=deleted.code);
	
    -- La tabla deleted contiene información sobre los valores ANTIGUOS mientras que la tabla inserted contiene los NUEVOS valores.
    -- Ambas tablas son virtuales y tienen la misma estructura que la tabla a la que se asocia el Trigger. 
	
 END 

UPDATE expedientes SET state = 'Rosario' WHERE code = 'exp1'; 

select * from expedientes
select * from expStatusHistory

