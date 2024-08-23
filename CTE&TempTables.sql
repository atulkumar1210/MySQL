-- CTEs : COMMON TABLE EXPRESSIONS
-- It is neither real table not temporary table. It can be used just after creating it. 

select gender, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(salary) as cnt_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

-- Firstly creating a common table expression and then selecting all from that. 
with cte_example as
(
select gender, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(salary) as cnt_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select *
from cte_example;

with cte_example as
(
select gender, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(salary) as cnt_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_salary)
from cte_example;

-- Diff way of writting the above code. CTE 
select avg(avg_salary)
from
(
select gender, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(salary) as cnt_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
) cte_example;

-- JOIN IN CTE 
with CTE_Example as
(
select employee_id, first_name, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 as 
(
select employee_id, salary 
from employee_salary
where salary > 50000
)

select *
from CTE_Example
join CTE_Example2
on CTE_Example.employee_id = CTE_Example2.employee_id;


-- Giving column names to CTE
with cte_example(Gender, Avg_Salary, Max_Salary, Min_Salary, Cnt_Salary) as
(
select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select *
from cte_example;

-- What will happen in the following case
-- Ans : Names gives to CTE will overwrite the cols name.

with cte_example(Gender, Avg_Salary, Max_Salary, Min_Salary, Cnt_Salary) as
(
select gender, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(salary) as cnt_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select *
from cte_example;




-- TEMP TABLES : TEMPORARY TABLES
-- It lasts as long as the session continues. 

-- Two way of creating temp tables

-- First way
create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(50)
);

select *
from temp_table;

insert into temp_table values('Ankit', 'Kumar', '3 Idiots');
insert into temp_table values('Abhishek', 'Kumar', 'Nirahua Rikshaw-wala');
insert into temp_table values('Gopal', 'Singh', 'Endgame');

select * from temp_table;


-- Second Way of creating temp table. 
create temporary table salary_over_50k
select * 
from employee_salary
where salary > 50000;

select *
from salary_over_50k;
