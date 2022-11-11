create database if not exists analisis;
use analisis;
drop table char_data_types;
# crear una tabla de datos tipo string
create table if not exists char_data_types(
char_col char(10),
varchar_col varchar(10), 
text_col text
);
describe char_data_types;

insert into char_data_types 
values('abc','abc','abc'),
('defghi','defghi','defghi');

select * from char_data_types;

drop table number_data_types;
#crear una tabla de datos tipo numeric
create table if not exists number_data_types(
num_col numeric(20,5),
real_col real,
double_col double precision
);
describe number_data_types;

insert into number_data_types 
values(.7,.7,.7),
(2.13579,2.13579,2.13579),
(2.1357987654,2.1357987654,2.1357987654);

select * from number_data_types;

select num_col * 10000000 as fixed,
real_col * 10000000 as floating
from number_data_types
where num_col = .7;


drop table date_time_types;
create table if not exists date_time_types(
date_time datetime,
interval_col numeric(2)
);
insert into date_time_types values(current_timestamp(), 1),
(current_timestamp(), 2);

select * from date_time_types;

select date_time, interval_col, date_time - interval_col as new_date
from date_time_types;


