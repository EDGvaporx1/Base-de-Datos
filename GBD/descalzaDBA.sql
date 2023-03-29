CREATE TABLE Constructor
(
    IdConstructor NUMBER NOT NULL,
    NombreConstructor VARCHAR2(15),
    Pais VARCHAR2(20) DEFAULT 'SPAIN',
    CONSTRAINT clavePrimaria PRIMARY KEY (IdConstructor),
    CONSTRAINT mayuscNombreConstructor Check (NombreConstructor=upper(NombreConstructor)),
    CONSTRAINT mayuscPais check (Pais=upper(Pais)),
    CONSTRAINT compruebaID Check (IdConstructor BETWEEN 1 and 255)
);

DROP TABLE Productos;

CREATE TABLE Productos
(
    IdProducto NUMBER NOT NULL,
    NombreProducto VARCHAR2(20),
    peso NUMBER,
    categoria VARCHAR2(10) NOT NULL,
    precioVenta NUMBER(6,2),
    precioCompra NUMBER(6,2),
    CantidadStock INTEGER,
    IdConstructor NUMBER NOT NULL,
    CONSTRAINT pesoc CHECK (peso BETWEEN 0 and 9999),
    CONSTRAINT clavec PRIMARY KEY (IdProducto,categoria),
    CONSTRAINT ajenaE FOREIGN KEY (IdConstructor) REFERENCES  Constructor (IdConstructor),
    CONSTRAINT precioCompra CHECK (precioCompra BETWEEN 0 and 999),
    CONSTRAINT precioVenta CHECK (precioVenta BETWEEN 0 and 999),
    CONSTRAINT IdProducto CHECK (IdProducto BETWEEN 1 and 255),
    CONSTRAINT categoria CHECK (categoria in ('first','second','third'))
    );
    
CREATE TABLE accounts (
 account_id NUMBER,
 first_name VARCHAR2(25),
 last_name VARCHAR2(25) NOT NULL,
 email VARCHAR2(100),
 phone VARCHAR2(12) ,
 status NUMBER( 1, 0 ) DEFAULT 1 NOT NULL,
 CONSTRAINT pkAccounts PRIMARY KEY(account_id)
);
ALTER table accounts
MODIFY status DEFAULT 0;

ALTER table accounts
Modify phone VARCHAR2 (15);

Create table inventario
(
IdProducto number(12,0),
IdWarehouse number(12,0),
CONSTRAINT Clave PRIMARY KEY (IdProducto,IdWarehouse)
);
DROP TABLE inventario;

CREATE TABLE Product3
(
    IdProducto NUMBER,
    NombreProducto VARCHAR2(255) NOT NULL,
    descripcion VARCHAR2(200)DEFAULT 'TO',
    StandarCost NUMBER(9,2),
    ListaPrecio NUMBER(9,2),
    IdCategoria NUMBER,
    CONSTRAINT clavecita PRIMARY KEY (IdProducto)
    );

ALTER TABLE Product3
MODIFY IdCategoria NOT NULL;

ALTER TABLE Product3
MODIFY IdProducto NUMERIC(50,500);