-- Condiciones.sql

create database holamundo;
show databases;
use holamundo;
CREATE TABLE user (
	id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    primary key (id)
);

INSERT INTO user (name, edad, email) values('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) values('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) values('Nicolas', 36, 'nico@gmail.com');
INSERT INTO user (name, edad, email) values('Chanchito', 7, 'chanchito@gmail.com');

-- Condiciones en profundidad
SELECT * FROM user;
SELECT * FROM user limit 1;
SELECT * FROM user where edad > 15;
SELECT * FROM user where edad >= 15;
SELECT * FROM user where edad > 20 and email = 'nico@gmail.com';
SELECT * FROM user where edad > 20 or email = 'layla@gmail.com';
SELECT * FROM user where email != 'layla@gmail.com';
SELECT * FROM user where edad between 15 and 30; 
-- between indica dos argumento, que busca los registros del número inicial al número final.
SELECT * FROM user where email like '%gmail%'; -- like busca los registros con valor a relación de ese dato. 
-- En este caso, se va a buscar el valor 'gmail' de los emails de los usuarios
SELECT * FROM user where email like '%gmail'; -- No va a dar nada, por qué termina solo con 'gmail', mientras que en
-- realidad terminan con 'gmail.com'
SELECT * FROM user where email like 'oscar%'; -- Busca los registros de los correos que empiecen con 'oscar',
-- pero que dan exactamente lo mismo.
SELECT * FROM user order by edad asc; -- Orden ascendente en la enumeración de las edades. 
SELECT * FROM user order by edad desc; -- Orden descendente en la enumeración de las edades.
SELECT max(edad) as mayor from user; -- Selecionó el dato con mayor registro de la edad en la tabla 'user'.
SELECT min(edad) as menor from user; -- Selecionó el dato con menor registro de la edad en la tabla 'user'.

-- Selección de columnas

SELECT id, name from user;
SELECT id, name as nombre from user; -- Cambiar el nombre de las columnas con el alias as.