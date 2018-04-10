CREATE DATABASE gddPractico1;
use gddPractico1;

CREATE TABLE   provincia  (
codProvinicia SMALLINT PRIMARY KEY  NOT NULL ,
nombreProvincia VARCHAR(15) NOT NULL,
);


CREATE TABLE clientes (
codCliente INT PRIMARY KEY,
nombre  VARCHAR(10) NOT NULL,
apellido VARCHAR (15 )NOT NULL,
nroCuilt BIGINT NOT NULL,
telefono1 SMALLINT NOT NULL,
telefono2 SMALLINT NOT NULL,
codProvincia SMALLINT NOT NULL REFERENCES provincia,
direccion VARCHAR(20) NOT NULL,
ciudad VARCHAR(15) NOT NULL,
codigoPostal SMALLINT NOT NULL
);



CREATE TABLE tipollamado (
tipoLlamado varchar(10) PRIMARY KEY  NOT NULL,
descripcionTipoLlamado varchar(20),

);

CREATE TABLE llamadas (
idLlamado SMALLINT  PRIMARY KEY,
tipoLlamado varchar(10) REFERENCES tipollamado  NOT NULL,
duracionLlamado INT,
fechaLlamado DATE NOT NULL,
telefonoLlamado SMALLINT NOT NULL
);

CREATE TABLE productos (
codProducto SMALLINT PRIMARY KEY NOT NULL,
nomProducto VARCHAR(30) NOT NULL,
codFabricante SMALLINT NOT  NULL,
);


CREATE TABLE items (
numFactura INT,
numItem INT,
precio
cantidad
cosProducto
);

CREATE TABLE facturas 
nroFacturas
fechFacturas

);