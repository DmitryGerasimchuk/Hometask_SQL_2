/*
Домашняя работа № 2 
по курсу "Базы данных и SQL"
*/

-- Задание 1: Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
# Использовангие короткого обращения к БД
USE hometask_2;

# Удаление БД, если с таким именем БД была создана ранее
DROP TABLE  IF EXISTS sales;

# Создание БД
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);

SELECT * FROM sales;

# Заполнение БД данными
INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
    
SELECT * FROM sales;


-- Задание 2: Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT id AS 'id заказа',
CASE
	WHEN count_product < 100
		THEN 'Маленький заказ'
	WHEN count_product > 300
		THEN 'Большой заказ'
	ELSE 'Средний заказ'
END AS 'Тип заказа'
FROM sales;


--  Задание 3: Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
# Удаление БД, если с таким именем БД была создана ранее
DROP TABLE  IF EXISTS orders;

# Создание БД
CREATE TABLE `orders`
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(3),
amount DECIMAL,
order_status VARCHAR(15),
FOREIGN KEY (id) REFERENCES sales (id)
);

SELECT * FROM orders;

# Заполнение БД данными
INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT * FROM orders; 

SELECT id, employee_id,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	ELSE 'Order is cancelled'
END AS full_order_status
FROM orders;


--  Задание 4: Чем 0 отличается от NULL?
/*
0 - конкретное значение (отсутсвие какого-то признака или количества), NULL - это неизвестность  
*/