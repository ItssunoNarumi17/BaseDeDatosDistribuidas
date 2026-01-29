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
	phone           INT NOT NULL,
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
(1, 'John Smith', '312-555-0101', 'john.smith@email.com', 1),
(2, 'Maria Garcia', '312-555-0102', 'maria.garcia@email.com', 2),
(3, 'Robert Johnson', '312-555-0103', 'robert.j@email.com', 3),
(4, 'Lisa Wang', '312-555-0104', 'lisa.wang@email.com', 4),
(5, 'David Brown', '312-555-0105', 'david.brown@email.com', 5);

INSERT INTO supplier (supplierID, name, phone, email, addressID) VALUES
(1, 'Tech Supplies Inc.', '3125550201', 'sales@techsupplies.com', 1),
(2, 'Office Furniture Co.', '3125550202', 'orders@officefurn.com', 2),
(3, 'Stationery World', '3125550203', 'info@stationeryworld.com', 3),
(4, 'Electronics Plus', '3125550204', 'sales@electronicsplus.com', 4),
(5, 'Business Solutions', '3125550205', 'contact@bizsolutions.com', 5);

INSERT INTO product (productID, name, type, amount, price, detail, supplierID) VALUES
(1, 'Laptop Pro', 'Electronics', '1 unit', 1299.99, '15-inch laptop with 16GB RAM', 4),
(2, 'Office Chair', 'Furniture', '1 unit', 299.99, 'Ergonomic office chair', 2),
(3, 'Notebook Set', 'Stationery', '10 pieces', 24.99, 'Premium quality notebooks', 3),
(4, 'Wireless Mouse', 'Electronics', '1 unit', 49.99, 'Bluetooth wireless mouse', 1),
(5, 'Desk Lamp', 'Furniture', '1 unit', 89.99, 'LED desk lamp with adjustable arm', 5);

INSERT INTO customerOrder (orderID, date, total, paymentMethod, status, customerID) VALUES
(1001, '2024-01-15', 329.97, 'Credit Card', 'Delivered', 1),
(1002, '2024-01-16', 1299.99, 'PayPal', 'Shipped', 2),
(1003, '2024-01-17', 549.97, 'Credit Card', 'Processing', 3),
(1004, '2024-01-18', 74.97, 'Debit Card', 'Delivered', 4),
(1005, '2024-01-19', 199.99, 'Credit Card', 'Pending', 5);

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
(2, 1, 29.99, 1001, 6),
(3, 1, 1299.99, 1002, 1),
(4, 1, 299.99, 1003, 2),
(5, 1, 49.99, 1003, 4),
(6, 1, 199.99, 1003, 8),
(7, 3, 24.99, 1004, 3),
(8, 1, 199.99, 1005, 8);
