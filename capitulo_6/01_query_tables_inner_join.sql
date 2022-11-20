select * from employees;

select first_name, last_name, hire_date
from employees;

select first_name as nombre,
last_name as apellido,
hire_date as fecha
from employees;

select *
from dept_emp
where to_date = "9999-01-01";

select emp_no, first_name, last_name
from employees
where first_name = "Kenroku"
and last_name = "Malabarba";

select * from departments;

select * from dept_manager
where dept_no = "d003"
and from_date >= "1985-01-01"
and to_date <= "1992-03-21";

select * from employees
where emp_no = 110183;

select * 
from departments, dept_manager;

# union de tablas - INNER JOIN

select concat_ws(' ',e.first_name,e.last_name) as 'nombre', salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where s.to_date = "9999-01-01"
order by salary desc;

select concat_ws(' ',e.first_name,e.last_name) as 'nombre', salary
from employees as e, salaries as s
where e.emp_no = s.emp_no 
and s.to_date = "9999-01-01"
order by salary desc;

select concat_ws(' ', e.first_name,e.last_name) as 'name', d.dept_name, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where s.to_date = "9999-01-01"
and de.to_date = "9999-01-01";

select concat_ws(' ', e.first_name,e.last_name) as 'name', d.dept_name, s.salary
from employees as e, salaries as s, dept_emp as de, departments as d
where e.emp_no = s.emp_no
and e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and s.to_date = "9999-01-01"
and de.to_date = "9999-01-01"
order by salary desc;

# union de tablas - LEFT JOIN
#creaer una consulta que devuelva el codigo de un empleado y el codigo
#del departamento del que el empleado es responsable. la consulta debe devolver
#todos los empleados

select e.emp_no, de.dept_no
from employees as e
left join dept_manager as de
on e.emp_no = de.emp_no
and de.to_date = "9999-01-01" 
order by de.dept_no desc;

#modificar la consulta anterior para quedarte unicamente con aqueillos 
#empleados que SI son responsables. 

select e.emp_no, de.dept_no
from employees as e, dept_manager as de 
where e.emp_no = de.emp_no
and de.to_date = "9999-01-01" 
order by de.dept_no desc;

#modificar la consulta anterior para quedarte unicamente con aqueillos 
#empleados que NO son responsables. 

select e.emp_no, de.dept_no
from employees as e
left join dept_manager as de
on e.emp_no = de.emp_no
and de.to_date = "9999-01-01" 
where de.emp_no is null;

# union de tablas - RIGHT JOIN
# cambiar la consulta anterior para que funcione con un rigth join

select e.emp_no, de.dept_no
from employees as e
right join dept_manager as de
on e.emp_no = de.emp_no
and de.to_date = "9999-01-01" 
order by de.dept_no desc;

select e.emp_no, de.dept_no
from employees as e
right join dept_manager as de
on e.emp_no = de.emp_no
and de.to_date = "9999-01-01" 
where e.emp_no is null;



