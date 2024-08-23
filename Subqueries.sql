SELECT * FROM parks_and_recreation.employee_salary;

-- SUBQUERIES.
-- Give all employee id and full name from employee_salary who work in parks and recreation. 
select employee_id, concat(first_name, ' ', last_name) as full_name
from employee_demographics
where employee_id in 
(select employee_id 
	from employee_salary
    where dept_id = 1);
    
select employee_id, concat(first_name, ' ', last_name) as full_name, salary,
(select avg(salary) from employee_salary) as avg_salary
from employee_salary;

-- Preparing table from the gives table.
select gender, avg(age), min(age), max(age), count(age)
from employee_demographics
group by gender;

-- Prepararing table from the newly prepared table
-- Preparing 1st table in the subqueries and then preparing another table from the prepared table in the subqueries. 
select * -- Selected all from the agg_table. 
from
(select gender, avg(age), min(age), max(age), count(age)
from employee_demographics
group by gender) as agg_table; -- agg_table is the table prepared in the parenthesis. 

-- Niche ka dono code ka output same hoga. Observe the change in code when col name in subquaries is given a name and when it's without name. 
select gender, avg(`max(age)`)
from
(select gender, avg(age), min(age), max(age), count(age)
from employee_demographics
group by gender) as agg_table
group by gender;

select gender, avg(max_age)
from
(select gender, avg(age) as avg_age, min(age) as min_age, max(age) as max_age, count(age) as count_age
from employee_demographics
group by gender) as agg_table
group by gender;

-- Firse niche ka dono code hai. Observe the change as observes on above case. 
select avg(`max(age)`)
from
(select gender, avg(age), min(age), max(age), count(age)
from employee_demographics
group by gender) as agg_table;

select avg(max_age)
from
(select gender, avg(age) as avg_age, min(age) as min_age, max(age) as max_age, count(age) as count_age
from employee_demographics
group by gender) as agg_table;