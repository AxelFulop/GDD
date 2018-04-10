USE bdGDD;
--Tabla: es una estructura bidimencionales con filas(rows),columnas
--SQL:CREATE,DROP,ALTER(alterar)
--DATATYPES:
--NUMERICOS:ENTEROS:bigint(13 o 12 digitos),smallint,tinyint,int(10 o 9 digitos)
--         :DECIMALES: numeric(precision,s),decimal
--ALFANUMERICOS:char(x)(longitud fija que se cuanto ocupa),varchar(x)(ocupa x +longitud de x),nchar(x)
--BOOLEANOS: true,false
--FECHAS:DATE
--ARCHIVOS: BLOOBS o TEXT

CREATE TABLE familias (
codFamilia SMALLINT PRIMARY KEY,
descFamilia VARCHAR(100) NOT NULL
);

--Creo una FK de codFamilia entonces : uso REFERENCES nombreTablaQueReferencia
CREATE TABLE subFamilias (
codSubFamilia SMALLINT PRIMARY KEY,
descrSubFamilia VARCHAR(100) NOT NULL,
codFamilia  SMALLINT REFERENCES familias NOT NULL
);

--Utilizo UNIQUE PARA ESTABLECER QUE ESE ATRIBUTO ES UNICO Y NO SE REPITE
--Default ese atributo esta inicializado con un valor determinado
CREATE TABLE alumnos (
nroCuil BIGINT UNIQUE,
renumeracion INT DEFAULT 100
);

--CHECK: condicion o chekeo para un determinado atributo
CREATE TABLE productos(
codProd INT PRIMARY KEY,
descProd varchar(100) NOT NULL,
codFamilia SMALLINT REFERENCES familias NOT NULL,
codSubFamilia SMALLINT REFERENCES subFamilias NOT NULL,
precio DECIMAL(10,2) CHECK (precio > 0)
);


CREATE TABLE clientes (
codCliente INT PRIMARY KEY,
descrCliente varchar(100) NOT NULL
);



CREATE TABLE facturas (
nroFactura BIGINT PRIMARY KEY,
fechaEmision DATE NOT NULL,
fechaVencimiento DATE NOT NULL,
nroCliente INT NOT NULL REFERENCES clientes,
CHECK (fechaVencimiento >= fechaEmision)
);


CREATE TABLE items(
nroFactura BIGINT,
codPoducto INT,
cantidad DECIMAL(10,3) NOT NULL,
precio  DECIMAL(10,2) CHECK (precio > 0),
PRIMARY KEY(nroFactura,codPoducto)
);
--FOREIGN  KEY (campo1,campo2) REFERENCES(TABLA1,TABLA2) ->  FK COMPUESTA