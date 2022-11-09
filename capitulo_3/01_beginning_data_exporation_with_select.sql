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
 
 #querying a subset of columns
 select apellido, nombre, salario from profesores;
 
 #sorting data with ORDER BY
select nombre, apellido, salario
from profesores
order by salario desc;
 
select nombre, apellido, salario
from profesores
order by nombre desc;
 
select nombre, apellido, salario
from profesores
order by 2 desc;

select apellido, colegio, fecha_ing
from profesores
order by colegio asc, fecha_ing desc;

#using distinct to find unique values
select colegio
from profesores
order by colegio;

select distinct colegio
from profesores
order by colegio;

select fecha_ing
from profesores
order by fecha_ing;

select distinct fecha_ing
from profesores
order by fecha_ing;

select colegio, salario
from profesores
order by colegio, salario;

select distinct colegio, salario
from profesores
order by colegio, salario;

#filtering rows with where
select apellido, colegio, fecha_ing
from profesores
where colegio = "Myers Middle School";

select apellido, colegio, fecha_ing
from profesores
where colegio <> "Myers Middle School";

select apellido, colegio, fecha_ing
from profesores
where colegio != "Myers Middle School";

select apellido, colegio, fecha_ing
from profesores
where salario > 20000;

select apellido, colegio, fecha_ing, salario
from profesores
where salario < 60500;

select apellido, colegio, fecha_ing, salario
from profesores
where salario >= 20000;

select apellido, colegio, fecha_ing, salario
from profesores
where salario <= 60500;

select nombre, colegio, salario
from profesores
where salario between 20000 and 40000;

select apellido, fecha_ing
from profesores
where apellido in ("Bush", "Roush");

select distinct apellido, fecha_ing
from profesores
where apellido in ("Bush", "Roush");

#match a pattern (case sensitive)
select nombre, salario, fecha_ing
from profesores
where nombre like 'Sam%';

select nombre, apellido, fecha_ing, salario
from profesores
where nombre not like 'sam%';

select nombre, apellido, colegio
from profesores
where nombre = 'Janet';

select colegio
from profesores
where colegio <> 'F.D. Rooseveld';

select nombre, apellido, fecha_ing
from profesores
where fecha_ing < '2000-01-01';

select nombre, apellido, salario
from profesores
where salario >= 43500;

select nombre, apellido, colegio, salario
from profesores
where salario between 40000 and 65000;

#using like and not like with where
select nombre
from profesores
where nombre like 'sam%';

select nombre
from profesores
where nombre not like 'sam%';

#combining operators with AND and OR
select *
from profesores
where colegio = 'Myers Middle School'
and salario < 40000;

select *
from profesores
where apellido = 'Cole'
or apellido = 'Bush'
order by nombre desc;

#putting it all together
select nombre, apellido colegio, fecha_ing, salario
from profesores
where colegio like '%Roos%'
order by fecha_ing desc;
