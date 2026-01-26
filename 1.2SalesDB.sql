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

