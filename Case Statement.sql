-- CASE SATATEMENT

select first_name, last_name, age,
case
	when age <= 30 then 'Young'
    when age between 30 and 50 then 'Old'
    when age >= 50 then "On Death's Door"
end as Age_Bracket
from employee_demographics;

-- pay increase and bonus in employee_salary
-- If < 50000 then 5% increment
-- if >= 50000 then 8% increment
-- if finance then 10% bonus

select first_name, last_name, salary, 
case
	when salary < 50000 then salary*1.05
    when salary >= 50000 then salary*1.08
end as new_salary,
case 
	when dept_id = 6 then salary*0.1
end as bonus
from employee_salary;