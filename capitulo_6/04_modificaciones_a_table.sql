use employees;

# insercion INSERT statement
# modificaciones a la tabla de datos 

# Actualización UPDATE statement
# actualizar registros existentes en la base de datos

# borrado DELETE statement
# eliminar registros existentes en una tabla de la base de datos 

# borrado TRUNCATE statement
# solamente es mas eficiente que DELETE

# modificar y actualizar la fecha de nacimiento del empleado # 10046
update employees
set birth_date = date("1959-06-22")
where emp_no = 10046;

select * 
from employees
where emp_no = 10046;

# eliminar el departamento customer service
select * from departments;

delete 
from departments
where dept_name = "Customer Service";

select * from departments;

