SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name, age 
FROM parks_and_recreation.employee_demographics;

select gender
from parks_and_recreation.employee_demographics;

select distinct gender
from parks_and_recreation.employee_demographics;

select distinct first_name, gender
from parks_and_recreation.employee_demographics;

select first_name, age, age+10 as newAge, (age+10)*10 - 10 as Age
from parks_and_recreation.employee_demographics;

-- WHERE clause
select * 
from parks_and_recreation.employee_salary;

-- Comparison Operators : equal to (=), not equal to (!=), greter than (>), less than (<), greater than or equal to (>=), less than or equal to (<=)
select * 
from parks_and_recreation.employee_salary
where salary > 50000;

select *
from parks_and_recreation.employee_salary
where salary >= 50000;

select *
from parks_and_recreation.employee_salary
where salary < 50000;

select * 
from parks_and_recreation.employee_demographics
where gender != 'Female';

select * 
from parks_and_recreation.employee_demographics
where birth_date > '1986-01-01';

-- Logical Operator : AND, OR, NOT
select * 
from parks_and_recreation.employee_demographics
where birth_date > '1986-01-01'
and age >= 30;

select * 
from parks_and_recreation.employee_demographics
where birth_date > '1986-01-01'
or gender = 'Female';

select * 
from parks_and_recreation.employee_demographics
where birth_date > '1986-01-01'
or not gender = 'male';

-- Like Statement : '%' -> any number of times. '_' -> specific number of times. 
select * 
from parks_and_recreation.employee_demographics
where first_name like 'a%'; -- Any name which starts with 'a'.

select * 
from parks_and_recreation.employee_demographics
where first_name like '%a%'; -- Any name which contains 'a'.

select * 
from parks_and_recreation.employee_demographics
where first_name like '_a%'; -- Any name has one charachter before 'a' and any number of char after 'a'.

select * 
from parks_and_recreation.employee_demographics
where first_name like '__a%'; -- Any name has two charachter before 'a' and any number of char after 'a'.

select * 
from parks_and_recreation.employee_demographics
where first_name like 'a__'; -- Any name which starts with 'a' and have two characters after 'a'.

select * 
from parks_and_recreation.employee_demographics
where first_name like 'a___%'; -- Any name which starts with 'a' and must have atleast three characters after 'a'.

-- GROUP BY
select gender, avg(age) as avg_age, max(age) as max_age, min(age) as min_age, count(age)
from parks_and_recreation.employee_demographics
group by gender;

select occupation
from parks_and_recreation.employee_salary
group by occupation;

-- we can group by on multiple cols 
select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary;


-- ORDER BY : Arrange in ascending order or descending order. By default : Ascending order
select * 
from parks_and_recreation.employee_demographics
order by  first_name; -- By default it will order in ascending order

select * 
from parks_and_recreation.employee_demographics
order by  first_name asc; -- It will order in ascending order

select * 
from parks_and_recreation.employee_demographics
order by  gender desc; -- It will order by gender in descending order

-- Can use order by on multiple cols and can order each and every col the way we want. 
select * 
from parks_and_recreation.employee_demographics
order by  gender, age desc; -- It will order by gender in asceding order and then within that it will order by age in descending order

-- Can use ORDER BY by col position also
select * 
from parks_and_recreation.employee_demographics
order by  5, 3 desc; -- It will order by col pos at 5 in asceding order and then within that it will order by col pos at 3 in descending order

-- WHERE VS HAVING : WHERE -> used on individual rows, HAVING -> used on aggregated rows. 
select occupation, avg(salary) as avg_salary
from parks_and_recreation.employee_salary
where occupation like '%manager%' -- Here occupation col is not aggregated till now. 
group by occupation
having avg_salary > 60000; -- Here occupation col is aggregated to having will work here, where won't work here on occupation col. 

-- LIMIT : Limit the number of rows. 
-- Ourput required : three oldest employee in employee_dempgraphic table. 
select *
from parks_and_recreation.employee_demographics
order by age desc
limit 3;

-- -- Ourput required : third oldest employee in employee_dempgraphic table. 
select *
from parks_and_recreation.employee_demographics
order by age desc
limit 2, 1; -- It will give 1 row after 2nd row. 

-- -- Ourput required : third, fourth, and fifth oldest employee in employee_dempgraphic table. 
select *
from parks_and_recreation.employee_demographics
order by age desc
limit 2, 3; -- It will give 3 rows after 2nd row. 