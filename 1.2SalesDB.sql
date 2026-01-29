CREATE DATABASE sales;

CREATE TABLE address(
	addressID      INT NOT NULL,
	street         VARCHAR(80) NOT NULL,
	localy         VARCHAR(80) NOT NULL,
  city           VARCHAR(80) NOT NULL,
	postcode       VARCHAR(7) NOT NULL,
  state_s        VARCHAR(80) NOT NULL,
	PRIMARY KEY(addressID)
	);

CREATE TABLE customer(
	customerID      INT NOT NULL,
	name            VARCHAR(80) NOT NULL,
	phone           VARCHAR(15) NOT NULL,
  email           VARCHAR(80) NOT NULL,       
	PRIMARY KEY(customerID),
  FOREIGN KEY(addressID) REFERENCES address(addressID)
	);

CREATE TABLE supplier(
	supplierID      INT NOT NULL,
	name            VARCHAR(80) NOT NULL,
	phone           INT NOT NULL,
  email           VARCHAR(80) NOT NULL,       
	PRIMARY KEY(supplierID),
  FOREIGN KEY(addressID) REFERENCES address(addressID)
	);

CREATE TABLE product(
	productID       INT NOT NULL,
	name            VARCHAR(80) NOT NULL,
  type            VARCHAR(80) NOT NULL,
  amount          VARCHAR(80) NOT NULL,
  name            FLOAT NOT NULL,
	detail          VARCHAR(80) NOT NULL,      
	PRIMARY KEY(productID),
  FOREIGN KEY(supplierID) REFERENCES supplier(supplierID)
	);

CREATE TABLE customerOrder(
  orderID         INT NOT NULL,
  date            DATE NOT NULL,
  total           FLOAT NOT NULL,     
  paymentMethod   VARCHAR(80) NOT NULL,
  status          VARCHAR(30) NOT NULL,
	PRIMARY KEY(orderID),
  FOREIGN KEY(customerID) REFERENCES customer(customerID),
	);

CREATE TABLE customerAddress(
  customerAddressID       INT NOT NULL,
  type            VARCHAR(80) NOT NULL,
  position        VARCHAR(80) NOT NULL,     
	PRIMARY KEY(customerAddressID),
  FOREIGN KEY(customerID) REFERENCES customer(customerID),
  FOREIGN KEY(addressID) REFERENCES address(addressID)
	);

CREATE TABLE orderProduct(
  orderProductID         INT NOT NULL,
  quanty                 INT NOT NULL,
  price                  FLOAT NOT NULL,     
	PRIMARY KEY(orderProductID),
  FOREIGN KEY(orderID) REFERENCES customerOrder(orderID),
  FOREIGN KEY(productID) REFERENCES product(productID)
	);

INSERT INTO estado (addressID, street, localy, city, postcode, state_s) VALUES
(1, '123 N Wacker Dr', ' West Loop', 'Chicago', '60606', 'Illinois'),
(2, '233 S Wacker Dr', 'Willis Tower', 'Chicago', ' 60611', 'Illinois'),
(3, '201 E Randolph St', 'Millennium Park', 'Chicago', ' 60602', 'Illinois'),
(4, '600 E Grand Ave', 'Navy Pier', 'Chicago', ' 60611', 'Illinois'),
(5, '220 E Chicago Ave', 'Museo de Arte Contemporáneo', 'Chicago', ' 60611', 'Illinois');

INSERT INTO customer (customerID, name, phone, email, addressID) VALUES
(1, 'Juan Pérez', '+34 600 123 456', 'juan.perez@gmail.com', 1),
(2, 'María García', '+34 611 234 567', 'maria.garcia@hotmail.com', 2),
(3, 'Carlos López', '+34 622 345 678', 'c.lopez@empresa.com', 3),
(4, 'Ana Martínez', '+34 633 456 789', 'ana.martinez@gmail.com', 4),
(5, 'Pedro Sánchez', '+34 644 567 890', 'pedro.sanchez@yahoo.com', 5);

INSERT INTO supplier (supplierID, name, phone, email, addressID) VALUES
(1, 'ProveedorTech S.L.', '+34 900 100 200', 'info@proveedortech.com', 6),
(2, 'Suministros Globales', '+34 900 200 300', 'ventas@suministrosglobal.com', 7),
(3, 'ElectroParts S.A.', '+34 900 300 400', 'contacto@electroparts.es', 8),
(4, 'Materiales Industriales', '+34 900 400 500', 'pedidos@materialesind.com', 9),
(5, 'Componentes Digitales', '+34 900 500 600', 'info@componentesdigital.es', 10);

INSERT INTO product (productID, name, type, amount, price, detail, supplierID) VALUES
(1, 'Laptop Pro 15"', 'Electrónica', 50, 899.99, 'Portátil de alto rendimiento con 16GB RAM', 1),
(2, 'Mouse Inalámbrico', 'Periféricos', 200, 24.99, 'Mouse óptico con conexión Bluetooth', 2),
(3, 'Monitor 27" 4K', 'Monitores', 75, 349.99, 'Monitor UHD con panel IPS', 3),
(4, 'Teclado Mecánico', 'Periféricos', 150, 89.99, 'Teclado gaming con switches azules', 4),
(5, 'Disco SSD 1TB', 'Componentes', 300, 79.99, 'SSD NVMe PCIe 4.0', 5);

INSERT INTO customerAddress (customerAdressID, customerID, addressID, type, position) VALUES
(1, 1, 1, 'Casa', 1),
(2, 1, 11, 'Trabajo', 2),
(3, 2, 2, 'Casa', 1),
(4, 3, 3, 'Casa', 1),
(5, 4, 4, 'Casa', 1);

INSERT INTO orderProduct (orderProductID, orderID, productID, quantity, price) VALUES
(1, 1001, 1, 1, 899.99),
(2, 1001, 2, 1, 24.99),
(3, 1002, 3, 2, 349.99),
(4, 1003, 4, 1, 89.99),
(5, 1004, 5, 3, 79.99);
