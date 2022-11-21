use employees;

# FUNCIONES SQL

# crear una consulta que devuelva el nombre de un empleado en mayusculas
# y el apellido en minusculas
select upper(first_name) 
as first_name,
lower(last_name)
as last_name
from employees;

# obtener un listado de todos los empleados cuyo apellido tenga mas 
# de 10 caracteres. 
select *
from employees
where length(last_name) > 10;

# encontrar aquellos empleados que tuvieron una actualización de salario entre 2000
# y hoy ordenar el resultado por fecha de contratación de manera desendente y por el nombre 
# ascendente
select e.first_name, e.hire_date
from employees as e, salaries as s
where e.emp_no = s.emp_no
and s.from_date >= '2000-01-01'
and s.to_date <= now()
group by e.hire_date, e.first_name
order by e.hire_date desc, e.first_name asc;

# calcular el salario medio actual de los empleados y redondear a dos decimales 
select round(avg(salary), 2) as avg_salary
from salaries;