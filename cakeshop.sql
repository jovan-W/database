CREATE DATABASE IF NOT EXISTS cakeshop;
use cakeshop;

CREATE TABLE customer(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('m', 'f'),
    join_date DATE,
PRIMARY KEY(customer_id)
);

CREATE TABLE staff(
	staff_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('m', 'f'),
    join_date DATE,
PRIMARY KEY(staff_id)
);

CREATE TABLE menu(
	menu_id CHAR(50),
    menu_name VARCHAR(50),
    price INT,
    category ENUM('slice cake', 'bread', 'beverages', 'cupcakes'),
PRIMARY KEY(menu_id)
);

CREATE TABLE `order`(
	order_id CHAR(5),
    customer_id INT NOT NULL,
    staff_id INT NOT NULL,
    order_date TIMESTAMP,
PRIMARY KEY(order_id),
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
FOREIGN KEY(staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE order_detail(
	order_id CHAR(5),
    menu_id CHAR(5),
    qty INT,
    total_price INT,
FOREIGN KEY(order_id) REFERENCES `order`(order_id) ON DELETE CASCADE,
FOREIGN KEY(menu_id) REFERENCES menu(menu_id) ON DELETE CASCADE
);

INSERT INTO customer(first_name, last_name, gender, join_date)
VALUES
('Sindy', 'Salim', 'f', CURDATE()),
('Gabriel', 'Agus', 'm', CURDATE()),
('Leon', 'David', 'm', CURDATE()),
('Vincent', 'Budi', 'm', CURDATE()),
('Felicia', 'Ani', 'f', CURDATE()),
('Andy', 'Salim', 'm', CURDATE()),
('David', 'Lee', 'm', CURDATE()),
('Louis', 'Agus', 'm', CURDATE()),
('Ani', 'Tani', 'f', CURDATE()),
('Jenifer', 'Luis', 'f', CURDATE());

INSERT INTO staff(first_name, last_name, gender, join_date)
VALUES
('Clarissa', 'Yanti', 'f', '2023-06-07'),
('Steven', 'Yanto', 'm', '2023-06-07');

INSERT INTO menu
VALUES
('sc001', 'Mix Fruit Cheesecake', 35000, 'slice cake'),
('sc002', 'Matcha Cheesecake', 40000, 'slice cake'),
('sc003', 'Black Forest', 32000, 'slice cake'),
('sc004', 'Japanese Cheesecake', 45000, 'slice cake'),
('sc005', 'Rainbow Cheesecake', 40000, 'slice cake'),
('bd001', 'Butter Croissant', 10000, 'bread'),
('bd002', 'Cheese Croissant', 14000, 'bread'),
('bd003', 'Egg Tart', 12000, 'bread'),
('bd004', 'Apple Pie', 14000, 'bread'),
('bd005', 'Toast Bread', 20000, 'bread'),
('bv001', 'Ice Lychee Tea', 25000, 'beverages'),
('bv002', 'Ice Tea Tarik', 20000, 'beverages'),
('bv003', 'Ice / Hot Sweet Tea', 8000, 'beverages'),
('bv004', 'Ice / Hot Tea', 5000, 'beverages'),
('bv005', 'Mineral Water', 6000, 'beverages'),
('cc001', 'Blueberry Cup Cake', 20000, 'cupcakes'),
('cc002', 'Chocolate Cup Cake', 20000, 'cupcakes'),
('cc003', 'Strawberry Cup Cake', 20000, 'cupcakes'),
('cc004', 'Red Velvet Cup Cake', 20000, 'cupcakes'),
('cc005', 'Oreo Cup Cake', 20000, 'cupcakes');

INSERT INTO `order`
VALUES
('or001', 1, 1, CURRENT_TIMESTAMP()),
('or002', 2, 1, CURRENT_TIMESTAMP()),
('or003', 3, 1, CURRENT_TIMESTAMP()),
('or004', 4, 1, CURRENT_TIMESTAMP()),
('or005', 5, 1, CURRENT_TIMESTAMP()),
('or006', 6, 1, CURRENT_TIMESTAMP()),
('or007', 7, 1, CURRENT_TIMESTAMP()),
('or008', 8, 1, CURRENT_TIMESTAMP()),
('or009', 8, 1, CURRENT_TIMESTAMP()),
('or010', 9, 1, CURRENT_TIMESTAMP()),
('or011', 10, 1, CURRENT_TIMESTAMP()),
('or012', 2, 2, CURRENT_TIMESTAMP()),
('or013', 4, 2, CURRENT_TIMESTAMP()),
('or014', 7, 2, CURRENT_TIMESTAMP()),
('or015', 8, 2, CURRENT_TIMESTAMP()),
('or016', 2, 2, CURRENT_TIMESTAMP()),
('or017', 2, 2, CURRENT_TIMESTAMP()),
('or018', 10, 2, CURRENT_TIMESTAMP()),
('or019', 10, 2, CURRENT_TIMESTAMP()),
('or020', 2, 2, CURRENT_TIMESTAMP()),
('or021', 4, 2, CURRENT_TIMESTAMP()),
('or022', 4, 2, CURRENT_TIMESTAMP()),
('or023', 3, 2, CURRENT_TIMESTAMP()),
('or024', 5, 2, CURRENT_TIMESTAMP()),
('or025', 4, 2, CURRENT_TIMESTAMP()),
('or026', 4, 2, CURRENT_TIMESTAMP()),
('or027', 10, 2, CURRENT_TIMESTAMP()),
('or028', 9, 1, CURRENT_TIMESTAMP()),
('or029', 9, 1, CURRENT_TIMESTAMP()),
('or030', 3, 1, CURRENT_TIMESTAMP()),
('or031', 2, 1, CURRENT_TIMESTAMP()),
('or032', 1, 1, CURRENT_TIMESTAMP()),
('or033', 4, 1, CURRENT_TIMESTAMP()),
('or034', 5, 1, CURRENT_TIMESTAMP()),
('or035', 6, 1, CURRENT_TIMESTAMP()),
('or036', 7, 2, CURRENT_TIMESTAMP()),
('or037', 8, 2, CURRENT_TIMESTAMP()),
('or038', 10, 2, CURRENT_TIMESTAMP()),
('or039', 10, 2, CURRENT_TIMESTAMP()),
('or040', 1, 2, CURRENT_TIMESTAMP()),
('or041', 1, 2, CURRENT_TIMESTAMP()),
('or042', 2, 2, CURRENT_TIMESTAMP()),
('or043', 2, 2, CURRENT_TIMESTAMP()),
('or044', 7, 2, CURRENT_TIMESTAMP()),
('or045', 4, 1, CURRENT_TIMESTAMP()),
('or046', 4, 1, CURRENT_TIMESTAMP()),
('or047', 7, 1, CURRENT_TIMESTAMP()),
('or048', 7, 1, CURRENT_TIMESTAMP()),
('or049', 8, 2, CURRENT_TIMESTAMP()),
('or050', 2, 2, CURRENT_TIMESTAMP());

INSERT INTO order_detail(order_id, menu_id, qty, total_price)
VALUES
('or001', 'sc001', 1, (select price * 1 from menu where menu_id = 'sc001')),
('or002', 'sc002', 2, (select price * 2 from menu where menu_id = 'sc002')),
('or003', 'sc003', 1, (select price * 1 from menu where menu_id = 'sc003')),
('or004', 'sc004', 1, (select price * 1 from menu where menu_id = 'sc004')),
('or005', 'sc005', 1, (select price * 1 from menu where menu_id = 'sc005')),
('or006', 'sc001', 1, (select price * 1 from menu where menu_id = 'sc001')),
('or007', 'sc002', 1, (select price * 1 from menu where menu_id = 'sc002')),
('or008', 'cc005', 1, (select price * 1 from menu where menu_id = 'cc005')),
('or009', 'bv001', 1, (select price * 1 from menu where menu_id = 'bv001')),
('or010', 'bv001', 1, (select price * 1 from menu where menu_id = 'bv001')),
('or011', 'bd005', 2, (select price * 2 from menu where menu_id = 'bd005')),
('or012', 'bd005', 1, (select price * 1 from menu where menu_id = 'bd005')),
('or013', 'bd003', 2, (select price * 2 from menu where menu_id = 'bd003')),
('or014', 'cc002', 2, (select price * 2 from menu where menu_id = 'cc002')),
('or015', 'cc001', 2, (select price * 2 from menu where menu_id = 'cc001')),
('or016', 'sc001', 1, (select price * 1 from menu where menu_id = 'sc001')),
('or017', 'bv001', 1, (select price * 1 from menu where menu_id = 'bv001')),
('or018', 'sc001', 1, (select price * 1 from menu where menu_id = 'sc001')),
('or019', 'bv004', 1, (select price * 1 from menu where menu_id = 'bv004')),
('or020', 'sc005', 2, (select price * 2 from menu where menu_id = 'sc005')),
('or021', 'bd002', 2, (select price * 2 from menu where menu_id = 'bd002')),
('or022', 'bv004', 1, (select price * 1 from menu where menu_id = 'bv004')),
('or023', 'sc004', 2, (select price * 2 from menu where menu_id = 'sc004')),
('or024', 'sc005', 2, (select price * 2 from menu where menu_id = 'sc005')),
('or025', 'cc004', 2, (select price * 2 from menu where menu_id = 'cc004')),
('or026', 'bv001', 2, (select price * 2 from menu where menu_id = 'bv001')),
('or027', 'sc002', 2, (select price * 2 from menu where menu_id = 'sc002')),
('or028', 'bv002', 1, (select price * 1 from menu where menu_id = 'bv002')),
('or029', 'sc002', 1, (select price * 1 from menu where menu_id = 'sc002')),
('or030', 'bv001', 2, (select price * 2 from menu where menu_id = 'bv001')),
('or031', 'sc005', 1, (select price * 1 from menu where menu_id = 'sc005')),
('or032', 'bd005', 2, (select price * 2 from menu where menu_id = 'bv005')),
('or033', 'cc001', 2, (select price * 2 from menu where menu_id = 'cc001')),
('or034', 'cc005', 2, (select price * 2 from menu where menu_id = 'cc005')),
('or035', 'bd002', 4, (select price * 4 from menu where menu_id = 'bd002')),
('or036', 'bd003', 1, (select price * 1 from menu where menu_id = 'bv003')),
('or037', 'sc003', 1, (select price * 1 from menu where menu_id = 'sc003')),
('or038', 'bv002', 2, (select price * 2 from menu where menu_id = 'bv002')),
('or039', 'cc004', 2, (select price * 2 from menu where menu_id = 'cc004')),
('or040', 'bv001', 1, (select price * 1 from menu where menu_id = 'bv001')),
('or041', 'sc002', 2, (select price * 2 from menu where menu_id = 'sc002')),
('or042', 'bv002', 2, (select price * 2 from menu where menu_id = 'bv002')),
('or043', 'sc002', 2, (select price * 2 from menu where menu_id = 'sc002')),
('or044', 'bv005', 2, (select price * 2 from menu where menu_id = 'bv005')),
('or045', 'bd004', 4, (select price * 4 from menu where menu_id = 'bd004')),
('or046', 'bv001', 2, (select price * 1 from menu where menu_id = 'bv001')),
('or047', 'cc003', 2, (select price * 2 from menu where menu_id = 'cc003')),
('or048', 'bv004', 2, (select price * 2 from menu where menu_id = 'bv004')),
('or049', 'sc005', 4, (select price * 4 from menu where menu_id = 'sc005')),
('or050', 'bd002', 5, (select price * 5 from menu where menu_id = 'bd002'));

select * from order_detail;