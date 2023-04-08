CREATE DATABASE skypro;
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
SELECT * FROM employee WHERE LENGHT(first_name)>4;
UPDATE employee SET first_name = 'Vadim' WHERE id = 5;
UPDATE employee SET first_name = 'Alex' WHERE id = 3;
SELECT first_name AS Имя, SUM(age) AS Суммарный возвраст FROM employee GROUP BY Имя ;
SELECT first_name, age FROM employee WHERE age(SELECT MIN(age) FROM employee);
SELECT first_name AS имя, MAX(age) AS Максимальный возраст FROM employee GROUP BY first_name HAVING COUNT(first_name)>1;