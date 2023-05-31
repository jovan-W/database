CREATE DATABASE IF NOT EXISTS cafe;
use cafe;

CREATE TABLE product(
	product_id VARCHAR(5),
    name VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    category ENUM('food', 'drink'),
PRIMARY KEY(product_id)
);

CREATE TABLE customer(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('m', 'f'),
    birth_date DATE,
    join_date TIMESTAMP,
PRIMARY KEY(customer_id)
);

CREATE TABLE staff(
	staff_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('m', 'f'),
    birth_date DATE,
    hire_date DATE,
PRIMARY KEY(staff_id)
);

CREATE TABLE `order`(
	order_id INT AUTO_INCREMENT,
    customer_id INT,
    product_id VARCHAR(5),
    qty INT,
    transaction_date TIMESTAMP,
PRIMARY KEY(order_id),
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

CREATE TABLE payment(
	payment_id INT AUTO_INCREMENT,
    customer_id INT,
    order_id INT,
    staff_id INT,
    price NUMERIC(10, 2),
    payment_date TIMESTAMP,
PRIMARY KEY(payment_id),
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
FOREIGN KEY(order_id) REFERENCES `order`(order_id) ON DELETE CASCADE,
FOREIGN KEY(staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE
);

INSERT INTO product
VALUES
('f0001', 'Rainbow Cake', 40000, 'food'),
('f0002', 'French Fries', 25000, 'food'),
('f0003', 'Nasi Ayam Bakar', 25000, 'food'),
('f0004', 'Nasi Goreng Seafood', 45000, 'food'),
('f0005', 'Nasi Goreng Ayam', 40000, 'food'),
('f0006', 'Mie Ayam', 25000, 'food'),
('f0007', 'Spaghetti Carbonara', 500000, 'food'),
('f0008', 'Spaghetti Bolognese', 50000, 'food'),
('f0009', 'Butter Croissant', 14000, 'food'),
('f0010', 'Croffle', 12000, 'food'),
('d0001', 'Americano', 20000, 'drink'),
('d0002', 'Caffe Latte', 25000, 'drink'),
('d0003', 'Cappuccino', 25000, 'drink'),
('d0004', 'Matcha Latte', 25000, 'drink'),
('d0005', 'Matcha Frappuccino', 45000, 'drink'),
('d0006', 'Cookies and Cream Frappuccino', 45000, 'drink'),
('d0007', 'Lemon Tea', 16000, 'drink'),
('d0008', 'Tea', 4000, 'drink'),
('d0009', 'Sweet Tea', 6000, 'drink'),
('d0010', 'Water', 6000, 'drink');

INSERT INTO customer(first_name, last_name, gender, birth_date, join_date)
VALUES
('Jacob', 'Budi', 'm', '2001-01-01', CURRENT_TIMESTAMP),
('Stella', 'Salim', 'f', '2004-10-2', CURRENT_TIMESTAMP),
('Sindy', 'Tina', 'f', '2005-01-10', CURRENT_TIMESTAMP),
('Gabriel', 'Agus', 'm', '2000-04-20', CURRENT_TIMESTAMP),
('Jean', 'Tino', 'm', '2002-09-02', CURRENT_TIMESTAMP),
('Agus', 'Rendy', 'm', '2002-08-05', CURRENT_TIMESTAMP),
('Budi', 'William', 'm', '2004-9-20', CURRENT_TIMESTAMP),
('Tono', 'Stefan', 'm', '2005-10-28', CURRENT_TIMESTAMP),
('Timo', 'Jonathan', 'm', '2001-12-20', CURRENT_TIMESTAMP),
('William', 'Agus', 'm', '1998-04-28', CURRENT_TIMESTAMP);

INSERT INTO staff(first_name, last_name, gender, birth_date, hire_date)
VALUES
('Antony', 'Salim','m', '1996-04-10', '2020-01-05'),
('Sinta', 'Alim','f', '1998-06-20', '2020-01-05');

SELECT * FROM `order`;
INSERT INTO `order`(customer_id, product_id, qty, transaction_date)
VALUES
(1, 'f0001', 1, CURRENT_TIMESTAMP),
(10, 'd0001', 1, CURRENT_TIMESTAMP),
(2, 'f0001', 1, CURRENT_TIMESTAMP),
(5, 'f0004', 1, CURRENT_TIMESTAMP),
(9, 'f0007', 1, CURRENT_TIMESTAMP),
(10, 'f0002', 1, CURRENT_TIMESTAMP),
(3, 'f0004', 1, CURRENT_TIMESTAMP),
(4, 'f0005', 1, CURRENT_TIMESTAMP),
(6, 'f0001', 1, CURRENT_TIMESTAMP),
(8, 'f0002', 1, CURRENT_TIMESTAMP),
(7, 'f0004', 1, CURRENT_TIMESTAMP),
(9, 'd0004', 1, CURRENT_TIMESTAMP),
(2, 'd0001', 1, CURRENT_TIMESTAMP),
(4, 'f0005', 1, CURRENT_TIMESTAMP),
(5, 'f0005', 1, CURRENT_TIMESTAMP),
(1, 'd0004', 1, CURRENT_TIMESTAMP),
(2, 'd0009', 1, CURRENT_TIMESTAMP),
(5, 'd0009', 1, CURRENT_TIMESTAMP),
(4, 'd0009', 1, CURRENT_TIMESTAMP),
(9, 'd0009', 1, CURRENT_TIMESTAMP),
(1, 'd0004', 2, CURRENT_TIMESTAMP),
(4, 'f0004', 2, CURRENT_TIMESTAMP),
(5, 'f0004', 1, CURRENT_TIMESTAMP),
(6, 'f0001', 2, CURRENT_TIMESTAMP),
(10, 'f0006', 4, CURRENT_TIMESTAMP),
(2, 'd0006', 2, CURRENT_TIMESTAMP),
(4, 'd0002', 5, CURRENT_TIMESTAMP),
(5, 'f0001', 2, CURRENT_TIMESTAMP),
(8, 'd0010', 1, CURRENT_TIMESTAMP),
(7, 'd0009', 5, CURRENT_TIMESTAMP),
(4, 'd0002', 4, CURRENT_TIMESTAMP),
(5, 'f0001', 2, CURRENT_TIMESTAMP),
(2, 'f0001', 1, CURRENT_TIMESTAMP),
(5, 'd0005', 5, CURRENT_TIMESTAMP),
(10, 'd0002', 4, CURRENT_TIMESTAMP),
(2, 'd0001', 2, CURRENT_TIMESTAMP),
(5, 'f0004', 1, CURRENT_TIMESTAMP),
(4, 'f0004', 1, CURRENT_TIMESTAMP),
(4, 'd0008', 2, CURRENT_TIMESTAMP),
(2, 'f0002', 1, CURRENT_TIMESTAMP),
(1, 'd0002', 2, CURRENT_TIMESTAMP),
(4, 'f0010', 4, CURRENT_TIMESTAMP),
(5, 'd0010', 5, CURRENT_TIMESTAMP),
(1, 'd0001', 1, CURRENT_TIMESTAMP),
(2, 'f0002', 2, CURRENT_TIMESTAMP),
(9, 'd0002', 2, CURRENT_TIMESTAMP),
(8, 'd0001', 4, CURRENT_TIMESTAMP),
(7, 'd0001', 2, CURRENT_TIMESTAMP),
(6, 'f0001', 1, CURRENT_TIMESTAMP),
(5, 'f0001', 2, CURRENT_TIMESTAMP);
INSERT INTO payment(order_id, customer_id, staff_id, price, payment_date)
VALUES
(1, 1, 1, (SELECT price FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(2, 10, 1, (SELECT price FROM product WHERE product_id = 'd0001'), CURRENT_TIMESTAMP),
(3, 2, 1, (SELECT price FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(4, 5, 1, (SELECT price FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(5, 9, 1, (SELECT price FROM product WHERE product_id = 'f0007'), CURRENT_TIMESTAMP),
(6, 10, 1, (SELECT price FROM product WHERE product_id = 'f0002'), CURRENT_TIMESTAMP),
(7, 3, 1, (SELECT price FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(8, 4, 2, (SELECT price FROM product WHERE product_id = 'f0005'), CURRENT_TIMESTAMP),
(9, 6, 2, (SELECT price FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(10, 8, 2, (SELECT price FROM product WHERE product_id = 'f0002'), CURRENT_TIMESTAMP),
(11, 7, 2, (SELECT price FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(12, 9, 2, (SELECT price FROM product WHERE product_id = 'd0004'), CURRENT_TIMESTAMP),
(13, 2, 2, (SELECT price FROM product WHERE product_id = 'd0001'), CURRENT_TIMESTAMP),
(14, 4, 2, (SELECT price FROM product WHERE product_id = 'f0005'), CURRENT_TIMESTAMP),
(15, 5, 1, (SELECT price FROM product WHERE product_id = 'f0005'), CURRENT_TIMESTAMP),
(16, 1, 2, (SELECT price FROM product WHERE product_id = 'd0004'), CURRENT_TIMESTAMP),
(17, 9, 1, (SELECT price FROM product WHERE product_id = 'd0009'), CURRENT_TIMESTAMP),
(18, 2, 1, (SELECT price FROM product WHERE product_id = 'd0009'), CURRENT_TIMESTAMP),
(19, 5, 2, (SELECT price FROM product WHERE product_id = 'd0009'), CURRENT_TIMESTAMP),
(20, 4, 2, (SELECT price FROM product WHERE product_id = 'd0009'), CURRENT_TIMESTAMP),
(21, 1, 2, (SELECT price * 2 FROM product WHERE product_id = 'd0004'), CURRENT_TIMESTAMP),
(22, 4, 1, (SELECT price * 2 FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(23, 5, 1, (SELECT price FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(24, 6, 1, (SELECT price * 2 FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(25, 10, 2, (SELECT price * 4 FROM product WHERE product_id = 'f0006'), CURRENT_TIMESTAMP),
(26, 2, 2, (SELECT price * 2 FROM product WHERE product_id = 'd0006'), CURRENT_TIMESTAMP),
(27, 4, 1, (SELECT price * 5 FROM product WHERE product_id = 'd0002'), CURRENT_TIMESTAMP),
(28, 5, 1, (SELECT price * 2 FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(29, 8, 2, (SELECT price FROM product WHERE product_id = 'd0010'), CURRENT_TIMESTAMP),
(30, 7, 2, (SELECT price * 5 FROM product WHERE product_id = 'd0009'), CURRENT_TIMESTAMP),
(31, 4, 1, (SELECT price * 4 FROM product WHERE product_id = 'd0002'), CURRENT_TIMESTAMP),
(32, 5, 1, (SELECT price * 2 FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(33, 2, 1, (SELECT price FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(34, 5, 1, (SELECT price * 5 FROM product WHERE product_id = 'd0005'), CURRENT_TIMESTAMP),
(35, 10, 2, (SELECT price * 4 FROM product WHERE product_id = 'd0002'), CURRENT_TIMESTAMP),
(36, 2, 2, (SELECT price * 2 FROM product WHERE product_id = 'd0001'), CURRENT_TIMESTAMP),
(37, 5, 2, (SELECT price FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(38, 4, 2, (SELECT price FROM product WHERE product_id = 'f0004'), CURRENT_TIMESTAMP),
(39, 4, 2, (SELECT price * 2 FROM product WHERE product_id = 'd0008'), CURRENT_TIMESTAMP),
(40, 2, 1, (SELECT price FROM product WHERE product_id = 'f0002'), CURRENT_TIMESTAMP),
(41, 1, 2, (SELECT price * 2 FROM product WHERE product_id = 'd0002'), CURRENT_TIMESTAMP),
(42, 4, 2, (SELECT price * 4 FROM product WHERE product_id = 'f0010'), CURRENT_TIMESTAMP),
(43, 5, 2, (SELECT price * 5 FROM product WHERE product_id = 'd0010'), CURRENT_TIMESTAMP),
(44, 1, 2, (SELECT price FROM product WHERE product_id = 'd0001'), CURRENT_TIMESTAMP),
(45, 2, 1, (SELECT price * 2 FROM product WHERE product_id = 'f0002'), CURRENT_TIMESTAMP),
(46, 9, 2, (SELECT price * 2 FROM product WHERE product_id = 'd0002'), CURRENT_TIMESTAMP),
(47, 8, 2, (SELECT price * 4 FROM product WHERE product_id = 'd0001'), CURRENT_TIMESTAMP),
(48, 7, 1, (SELECT price * 2 FROM product WHERE product_id = 'd0001'), CURRENT_TIMESTAMP),
(49, 6, 2, (SELECT price FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP),
(50, 5, 2, (SELECT price * 2 FROM product WHERE product_id = 'f0001'), CURRENT_TIMESTAMP);