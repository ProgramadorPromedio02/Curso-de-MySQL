-- Productos.sql

CREATE TABLE products (
	id int not null auto_increment,
    name varchar(50) not null,
    created_by int not null,
    marca varchar(50) not null,
    primary key(id),
    foreign key(created_by) references user(id)
);

-- rename table productos to products;

insert into products (name, created_by, marca)
values 
	('ipad', 1, 'apple'),
    ('iphone', 1, 'apple'),
    ('watch', 2, 'apple'),
    ('macbook', 1, 'apple'),
    ('imac', 3, 'apple'),
    ('ipad mini', 2, 'apple');
    
select * from products;

DELETE FROM products;

ALTER TABLE productos AUTO_INCREMENT = 1;

-- left join y right join

select u.id, u.email, p.name from user u left join products p on u.id = p.created_by; -- Llamando el id de la tabla
-- user siendo igual al created_by de la tabla products usando left join. Esto trae los registros tantos de la tabla
-- user como products y busca los registros que estén relacionados(id de user con created_by de products), todo esto
-- llamado a la izquierda.

select u.id, u.email, p.name from user u right join products p on u.id = p.created_by; -- Llamando el id de la tabla
-- user siendo igual al created_by de la tabla products usando left join. Esto trae los registros tantos de la tabla
-- user como products y busca los registros que estén relacionados(id de user con created_by de products), todo esto
-- llamado a la derecha, pero el único dato que no registra es del usuario Chanchito, porque no tiene un valor 
-- asociado a la tabla products con created_by.

-- inner join

select u.id, u.email, p.name from user u inner join products p on u.id = p.created_by; -- Intersecciona los valores
-- asociados de la tabla user a la tabla products.

-- cross join

select u.id, u.name, p.id, p.name from user u cross join products p; -- Emparejá al combinar la primera tabla(user)
-- de la segunda(products). Se tiene que tener cuidado si se almacenan muchos datos, porque puede generar colapsos
-- al combinar dos tablas y emparejarlas.

-- group by, having y drop table

select count(id), marca from products group by marca; -- Agrupa en un conjunto a las filas con valores identícos a
-- columnas en especifíco, del cual se usa para funciones de agregación como count(), sum(), avg(), max(), min(),
-- entre otros. En este caso, agrupo la cantidad de productos de todas las marcas, pero bueno, solo será apple. 

select count(p.id), u.name from products p left join user u on u.id = p.created_by group by p.created_by;

select count(p.id), u.name from products p left join user u on u.id = p.created_by group by p.created_by
having count(p.id) >= 2;
-- Se usa teniendo junto a la cláusula group by después que se haya aplicado las funciones de agregación a la tabla.
-- En este caso, después group by agrupe las filas, agrege la condición para solo si la cantidad de productos creados
-- por usuario sea mayor igual a 2, del cual solo va a imprimir dos usuarios. Nicolas no estará en la tabla, porque
-- tiene solo un producto, mientras que Chanchito no tiene ninguno.

drop table products; -- Elimina una tabla y sus datos.
drop table animales;
drop table user;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);