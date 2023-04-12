CREATE DATABASE skyPro;
\c skypro;
CREATE TABLE employee(
                         id BIGSERIAL, NOT NULL, PRIMARY KEY,
                         first_name VARCHAR(50), NOT NULL,
                         last_name VARCHAR(50), NOT NULL,
                         gender VARCHAR(6), NOT NULL,
                         age INT NOT NULL
);
INSERT INTO employee(first_name, last_name, gender,age)
VALUES (Petr, Petrod, men, 29);
INSERT INTO employee(first_name, last_name, gender,age)
VALUES (Igor, Igorev, men, 21);
INSERT INTO employee(first_name, last_name, gender,age)
VALUES (Dariy, Galkiba, women, 20);
SELECT * FROM employee;
UPDATE skypro SET first_name = Kirill, last_name = Liskiv, gender = men, age = 20 id = 1;
SELECT * FROM employee;
DELETE FROM employee WHERE id = 2;
SELECT * FROM employee;
INSERT INTO employee(first_name, last_name, gender,age)
VALUES('Alexx',  'Karmanovich', 'men', 32);
INSERT INTO employee(first_name, last_name, gender,age)
VALUES('Vadim',  'Galkin', 'men', 3);
INSERT INTO employee(first_name, last_name, gender,age)
VALUES('Roman',  'Malishev', 'men', 3);
SELECT first_name AS имя, last_name AS Фамилия FROM employee;
SELECT * FROM employee WHERE age <30 OR age>50;
SELECT * FROM employee WHERE age>30 AND age<50;
SELECT * FROM employee WHERE age BETWEEN 30 and 50;//либо так
SELECT * FROM employee ORDER BY last_name DESC;
SELECT * FROM employee WHERE LENGHT(fir st_name)>4;
UPDATE employee SET first_name = 'Vadim' WHERE id = 5;
UPDATE employee SET first_name = 'Alex' WHERE id = 3;
SELECT first_name AS Имя, SUM(age) AS Суммарный возвраст FROM employee GROUP BY Имя ;
SELECT first_name, age FROM employee WHERE age(SELECT MIN(age) FROM employee);
SELECT first_name AS имя, MAX(age) AS Максимальный возраст FROM employee GROUP BY first_name HAVING COUNT(first_name)>1;
CREATE TABLE CITY( city_id INT primary key NOT NULL, city_name VARCHAR(20) NOT NULL);
ALTER TABLE employee
ADD city_id INT REFERENCES CITY(city_id);
INSERT INTO city VALUES (1, 'Samara'),(2, 'Moskva'),(3, 'Tolliaty');
UPDATE employee SET city_id = 1 WHERE id = 2;
UPDATE employee SET city_id = 1 WHERE id = 3;
UPDATE employee SET city_id = 1 WHERE id = 1;
UPDATE employee SET city_id = 2 WHERE id = 4;
UPDATE employee SET city_id = 3 WHERE id = 5;
SELECT employee.first_name, employee.last_name, city.city_name FROM employee INNER JOIN city
ON employee.city_id = city.city_id;
SELECT city_name, employee.first_name, employee.last_name FROM employee RIGHT JOIN city
ON employee.city_id = city.city_id;
SELECT * FROM employee FULL OUTER JOIN city
ON employee.city_id = city.city_id;
SELECT employee.first_name, city.city_name FROM employee CROSS JOIN city;
SELECT city_name FROM city WHERE city_id NOT IN(SELECT city_id FROM employee);
