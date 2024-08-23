-- Stores Procedures 
-- It is like functions in C++ 

use parks_and_recreation;
create procedure large_salary()
select *
from employee_salary
where salary > 50000;

call large_salary();

-- Let we want to store multiple queries. 
create procedure large_salary2()
select *
from employee_salary
where salary > 50000;
select *
from employee_salary
where salary > 10000;

call large_salary2(); -- Here we did not get the table with salary > 10000 
					   -- coz delimiter (;) differentiated the two queries and large_salary2 stored only the table with salary > 50000
                       
-- Now we will change the default delimiter sign i.e. we will not use this sign(;) as delimiter sign to avoid differentiation b/w queries. 
DELIMITER $$ 
create procedure large_salary3()
begin
	select * 
	from employee_salary
	where salary > 50000;
	select *
	from employee_salary
	where salary > 10000;
end $$
DELIMITER ; -- changing delimiter sign back to its default value. 

call large_salary3();


-- Creating stored procedures with params. 
DELIMITER $$
create procedure specific_data(emp_id_params int)
BEGIN
	select *
    from employee_salary
    where employee_id = emp_id_params;
END $$
DELIMITER ;

CALL specific_data(4); -- will give output with employee_id = 4. 
CALL specific_data(1); -- will give output with employee_id = 1. 
CALL specific_data(10); -- will give output with employee_id = 10. 