use employees;

# Agrupación y agregación GROUP BY

# Cuantos empleados hay de cada sexo
select gender, count(*) as num_emp
from employees
group by gender;

# Cual es el salario medio actual de la empresa
select avg(salary) as avg_salary
from salaries
where to_date = "9999-01-01";

# Cuantos empleados tiene cada departamento
select d.dept_name, count(*) as num_employees
from dept_emp as de
inner join departments as d
on de.dept_no = d.dept_no
where de.to_date = "9999-01-01"
group by d.dept_name;

# Cual es el empleado que ha cobrado el salario minimo
select emp_no, concat_ws(' ',first_name,last_name) as "nombre"
from employees
where emp_no 
in (select emp_no
from salaries
where salary = (select min(salary) as min
from salaries));

# filtrar agrupaciones - HAVING
# Que nombres de empleado se repiten mas de una vez ¿cuantas veces?
select concat_ws(' ',first_name,last_name) as 'nombre', count(*)
from employees
group by first_name
having count(*) > 1
order by count(*) desc;

# ¿alguno de los empleados ha sido director de mas de un departamento?
select emp_no, count(dept_no) as num_dept
from dept_manager
group by emp_no
having count(dept_no) >= 1;

# ordenación  - ORDER BY ASC|DESC 		
# obtener un listado de empleados con su nombre apellido y cargo
# ordena el listado segun el cargo de manera ascendente
select t.title, e.first_name, e.last_name
from employees as e, titles as t
where e.emp_no = t.emp_no
and t.to_date = "9999-01-01"
order by t.title asc;

# acabar de ordenar el listado anterior por nombre y apellido de manera
# ascendente
select t.title, e.first_name, e.last_name
from employees as e, titles as t
where e.emp_no = t.emp_no
and t.to_date = "9999-01-01"
order by e.first_name asc, e.last_name asc;

select t.title, e.first_name, e.last_name
from employees as e, titles as t
where e.emp_no = t.emp_no
and t.to_date = "9999-01-01"
order by t.title asc, e.first_name desc, e.last_name desc;

# obtener un listado de los empleados segun su salario actual
# ordenar de manera descendente
select concat_ws(' ',e.first_name,e.last_name) as 'nombre', s.salary
from employees as e, salaries as s
where e.emp_no = s.emp_no
and s.to_date = "9999-01-01"
order by s.salary desc;

# combinación UNION operador
# juntar las tablas "salaries" y "dept_emp" teniedo en cuenta
# unicamente la columna "emp_no"
select emp_no
from salaries
union
select emp_no
from dept_emp;

# Repetir el apartado anterior pero permitiendo duplicados 
select emp_no
from salaries
union all
select emp_no
from dept_emp;

# Eliminación de duplicados - DISCTINCT operator
# hallar las fechas de contrato de los empleados sin repeteciones 
# y ordenalas de forma ascendente
select distinct hire_date
from employees
order by hire_date asc;


# Patrones LIKE operator
# encontrar aquellos puestos ue comienzan por 'Sen'
select title
from titles
where title like 'Sen%';

select *
from employees
where first_name like '%aa%'
or first_name like '%bb%';

# Paginación LIMIT/OFFSET operator
# hacer un ranking con los 10 empledos que ganan mas
select *
from salaries
order by salary desc
limit 10 ;

select concat_ws(' ',e.first_name,e.last_name) as 'nombre', s.salary
from employees as e, salaries as s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
order by s.salary desc
limit 10;


# ¿quienes estan entre el puesto 20 y 30?
select *
from salaries
order by salary desc
limit 20 offset 30;

select concat_ws(' ',e.first_name,e.last_name) as 'nombre', s.salary
from employees as e, salaries as s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
order by s.salary desc
limit 10 offset 20;
# Extraer los 3 ultimos empleados contratados
select *
from employees
order by hire_date desc
limit 3 offset 3;










