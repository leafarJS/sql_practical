create database if not exists analisis;
use analisis;
drop table profesores;
create table if not exists profesores(
id bigint auto_increment,
nombre varchar(25) not null,
apellido varchar(50) not null,
colegio varchar(50) not null,
fecha_ing date not null,
salario decimal(10,2) not null,
primary key(id)
 );
 show tables;
 insert into profesores(nombre, apellido, colegio, fecha_ing, salario)  
 values("Janet", "Smitho", "F.D. Rooseveld", "2011-10-30", 36200.00),
 ("Lee", "Reynolds", "F.D. Rooseveld", "1996-05-22", 65000.00),
 ("Samuel", "Cole", "Myers Middle School", "2005-08-01", 43500.00),
 ("Samantha", "Bush", "Myers Middle School", "2011-10-30", 36200.00),
 ("Betty", "Diaz", "Myers Middle School", "2005-08-30", 43500.00),
 ("Kathleen", "Roush", "F.D. Rooseveld", "2010-10-22", 38500.00);
 
 describe profesores;
 select * from profesores;
 