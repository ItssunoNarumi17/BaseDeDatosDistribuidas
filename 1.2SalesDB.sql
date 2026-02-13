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
	addressID       INT NOT NULL,
	PRIMARY KEY(customerID),
    FOREIGN KEY(addressID) REFERENCES address(addressID)
	);

CREATE TABLE supplier(
	supplierID      INT NOT NULL,
	name            VARCHAR(80) NOT NULL,
	phone           VARCHAR(15) NOT NULL,
    email           VARCHAR(80) NOT NULL,       
	addressID       INT NOT NULL,
	PRIMARY KEY(supplierID),
    FOREIGN KEY(addressID) REFERENCES address(addressID)
	);

CREATE TABLE product(
	productID       INT NOT NULL,
	name            VARCHAR(80) NOT NULL,
  	type            VARCHAR(80) NOT NULL,
 	amount          VARCHAR(80) NOT NULL,
  	price           FLOAT NOT NULL,
	detail          VARCHAR(80) NOT NULL,      
	supplierID      INT NOT NULL,
	PRIMARY KEY(productID),
 	FOREIGN KEY(supplierID) REFERENCES supplier(supplierID)
	);

CREATE TABLE customerOrder(
  orderID         INT NOT NULL,
  date            DATE NOT NULL,
  total           FLOAT NOT NULL,     
  paymentMethod   VARCHAR(80) NOT NULL,
  status          VARCHAR(30) NOT NULL,
  customerID      INT NOT NULL,
  PRIMARY KEY(orderID),
  FOREIGN KEY(customerID) REFERENCES customer(customerID)
	);

CREATE TABLE customerAddress(
  customerAddressID       INT NOT NULL,
  type            VARCHAR(80) NOT NULL,
  position        VARCHAR(80) NOT NULL,     
  customerID      INT NOT NULL,
  addressID       INT NOT NULL,
  PRIMARY KEY(customerAddressID),
  FOREIGN KEY(customerID) REFERENCES customer(customerID),
  FOREIGN KEY(addressID) REFERENCES address(addressID)
	);

CREATE TABLE orderProduct(
  orderProductID         INT NOT NULL,
  quanty                 INT NOT NULL,
  price                  FLOAT NOT NULL,
  orderID                INT NOT NULL,
  productID              INT NOT NULL,
  PRIMARY KEY(orderProductID),
  FOREIGN KEY(orderID) REFERENCES customerOrder(orderID),
  FOREIGN KEY(productID) REFERENCES product(productID)
	);

INSERT INTO address (addressID, street, localy, city, postcode, state_s) VALUES
(1, '123 N Wacker Dr', ' West Loop', 'Chicago', '60606', 'Illinois'),
(2, '233 S Wacker Dr', 'Willis Tower', 'Chicago', ' 60611', 'Illinois'),
(3, '201 E Randolph St', 'Millennium Park', 'Chicago', ' 60602', 'Illinois'),
(4, '600 E Grand Ave', 'Navy Pier', 'Chicago', ' 60611', 'Illinois'),
(5, '220 E Chicago Ave', 'Museo de Arte Contemporáneo', 'Chicago', ' 60611', 'Illinois');

INSERT INTO customer (customerID, name, phone, email, addressID) VALUES
(1, 'Eddier Vargas', '312-555-0101', 'eddyr.va@gmail.com', 1),
(2, 'Armando Garcia', '312-555-0102', 'armando.garcia@gmail.com', 2),
(3, 'Adrian Morales', '312-555-0103', 'adrian_mo@gmail.com', 3),
(4, 'Jayson Angeles', '312-555-0104', 'jaayson@gmail.com', 4),
(5, 'Ivan Jimenez', '312-555-0105', 'maachi_31@gmail.com', 5);

INSERT INTO supplier (supplierID, name, phone, email, addressID) VALUES
(1, 'Micro Center', '312-555-0201', 'sales@microcenter.com', 1),
(2, 'Oak Brook', '312-555-0202', 'sales@oakbrook.com', 2),
(3, 'Chicago Gadgets', '312-555-0203', 'sales@gadchicago.com', 3),
(4, 'Bestbuy', '312-555-0204', 'sales@bestbuy.com', 4),
(5, 'ReVamp Electronics', '312-555-0205', 'sales@revamp.com', 5);

INSERT INTO product (productID, name, type, amount, price, detail, supplierID) VALUES
(1, 'Laptop Dell', 'Electronics', '1 unit', 1429.33, 'Dell Latitud 5431 laptop with 16GB RAM', 5),
(2, 'Office Chair', 'Furniture', '1 unit', 499.99, 'Ergonomic office chair', 2),
(3, 'Notebook Set', 'Stationery', '10 pieces', 24.99, 'Premium quality notebooks', 3),
(4, 'Wireless Mouse', 'Electronics', '1 unit', 49.99, 'Bluetooth wireless mouse', 4),
(5, 'Desk Lamp', 'Furniture', '1 unit', 89.99, 'LED desk lamp with adjustable arm', 5);

INSERT INTO customerOrder (orderID, date, total, paymentMethod, status, customerID) VALUES
(1001, '2024-01-10', 329.97, 'Credit Card', 'Delivered', 1),
(1002, '2024-01-12', 1299.99, 'PayPal', 'Shipped', 2),
(1003, '2024-03-17', 549.97, 'Credit Card', 'Processing', 3),
(1004, '2024-02-20', 74.97, 'Debit Card', 'Delivered', 4),
(1005, '2024-01-31', 199.99, 'Credit Card', 'Pending', 5);

INSERT INTO customerAddress (customerAddressID, type, position, customerID, addressID) VALUES
(1, 'Billing', 'Primary', 1, 1),
(2, 'Shipping', 'Primary', 1, 1),
(3, 'Billing', 'Primary', 2, 2),
(4, 'Shipping', 'Secondary', 2, 3),
(5, 'Billing', 'Primary', 3, 3),
(6, 'Shipping', 'Primary', 3, 3),
(7, 'Billing', 'Primary', 4, 4),
(8, 'Shipping', 'Primary', 4, 4),
(9, 'Billing', 'Primary', 5, 5),
(10, 'Shipping', 'Primary', 5, 5);

INSERT INTO orderProduct (orderProductID, quanty, price, orderID, productID) VALUES
(1, 1, 299.99, 1001, 2),
(2, 1, 29.99, 1001, 3),
(3, 1, 1299.99, 1002, 1),
(4, 1, 299.99, 1003, 2),
(5, 1, 49.99, 1003, 4),
(6, 1, 199.99, 1003, 5),
(7, 3, 24.99, 1004, 3),
(8, 1, 199.99, 1005, 2);

--Exercise 3. Sentencias de consultas
1. Listar todos los clientes: *Obtén el customerID, nombre y email de todos los clientes*.
   SELECT customerID, name, email FROM customer;

2. Direcciones en una ciudad específica: *Muestra todas las direcciones que estén en la ciudad de Chicago*.
   SELECT * FROM address WHERE city = 'Chicago';

3. Productos con precio mayor a 200: *Lista los productos cuyo precio sea mayor a 200*.
   SELECT * FROM product WHERE price > 200;

4. Pedidos ordenados por fecha: *Muestra todos los pedidos ordenados desde el más reciente al más antiguo*.
    SELECT * FROM customerOrder ORDER BY date DESC;

5. Primeros 5 proveedores: *Obtén los primeros 5 proveedores ordenados alfabéticamente por nombre*.
    SELECT * FROM supplier ORDER BY name ASC;

6. Clientes y su ciudad: *Muestra el nombre del cliente y la ciudad donde vive*.
    SELECT customer.name, address.city FROM customer JOIN address ON customer.addressID = address.addressID;

7. Productos y su proveedor: *Lista el nombre del producto y el nombre de su proveedor*.
    SELECT product.name, supplier.name FROM product JOIN supplier ON product.supplierID = supplier.supplierID;

8. Pedidos de un cliente específico: *Muestra todos los pedidos realizados por el cliente con customerID = 10*.
	SELECT * FROM customerOrder WHERE customerID = 5;

9. Cantidad de productos en cada pedido: *Muestra el ID del pedido y la cantidad de productos comprados en cada uno*.

10. Clientes con dirección de envío: *Lista los clientes que tienen una dirección de tipo Shipping*.
