-- WINDOW FUNCTION. 

-- here we got only two rows. One for male and other for female. 
SELECT gender, avg(salary) as avg_salary 
FROM employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

-- How to get the number of rows equal to the number of original rows after join? See below
select gender, avg(salary) over() as avg_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Can use order, group by, sum, etc queries in over function. 
select gender, avg(salary) over(order by gender) as avg_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- will order by gender. Sare rows ko count krta hai
select dem.employee_id, dem.first_name, dem.last_name, gender, salary, row_number() over(order by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Will partition between gender. Row number will start from 1 as gender changes i.e. same gender k rows ko count krta hai.  
select dem.employee_id, dem.first_name, dem.last_name, gender, salary, row_number() over(partition by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) as cumulative_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;


-- RANK : DON'T GIVE CONTINUOUS RANK IF MORE THAN TWO EQUAL VALUES ARE PRESENT IN THE COL WHICH IS DETERMINING THE RANK
-- DENSE RANK : GIVE CONTINUOUS RANK. 

select dem.employee_id, concat(dem.first_name, ' ', dem.last_name) as full_name, gender, salary,
row_number() over(order by salary) as row_num,
rank() over(order by salary) as rank_num,
dense_rank() over(order by salary) as dense_rank_num
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

select dem.employee_id, concat(dem.first_name, ' ', dem.last_name) as full_name, gender, salary, 
row_number() over(partition by gender order by salary) as rowCount,
rank() over(partition by gender order by salary) as rank_num,  -- rank 3 is missing. 
dense_rank() over(partition by gender order by salary) as dense_rank_num
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;