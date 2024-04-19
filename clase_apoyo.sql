create database clase_apoyo;
show databases;
use clase_apoyo;

create table alumnos (
	id int not null auto_increment,
	nombre varchar(45),
	apellido varchar(45),
	fecha_nacimiento date,
	edad int,
	peso float,
	altura float,
	primary key (id),
    foreign key(id_materia) references alumnos(id)
);

create table curso1 (
    id_curso int not null auto_increment,
    n_curso int not null,
    primary key (id_curso) -- Corregido el nombre de la columna en la clave primaria
);

create table materia (
    id_materia int not null auto_increment primary key, -- Se define id_materia como la única columna auto_increment y como clave primaria
    nombre_materia varchar(45),
    nota int,
    id_curso int,
    foreign key (id_curso) references curso1(id_curso)
);

insert into alumnos(nombre, apellido, fecha_nacimiento, edad, peso, altura) 
values('Gonzalo Tomas', 'Fernandez', '2002-09-03', 21, 60.5, 1.64);
insert into alumnos(nombre, apellido, fecha_nacimiento, edad, peso, altura) 
values('Benjamín', 'rey', '1998-04-22', 25, 63.5, 1.72);
insert into alumnos(nombre, apellido, fecha_nacimiento, edad, peso, altura) 
values('Fernando Rafael', 'Perez', '1974-05-21', 49, 73.5, 1.72);
insert into alumnos(nombre, apellido, fecha_nacimiento, edad, peso, altura) 
values('Sofia', 'Gonzalez', '1999-08-04', 49, 70.3, 1.80);
insert into alumnos(nombre, apellido, fecha_nacimiento, edad, peso, altura) 
values('María', 'López', '1991-11-12', 33, 55.2, 1.63);
insert into alumnos(nombre, apellido, fecha_nacimiento, edad, peso, altura) 
values('Juan', 'Martínez', '1997-07-05', 27, 68.9, 1.75);
