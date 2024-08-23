SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

-- JOINS : INNER JOIN (JOIN), LEFT OUTER JOIN (LEFT JOIN), RIGHT OUTER JOIN (RIGHT JOIN), SELF JOIN. 
SELECT * 
FROM employee_demographics DEM
JOIN employee_salary SAL  -- will join only the matching condition. 
ON DEM.employee_id = SAL.employee_id;

SELECT * 
FROM employee_demographics DEM
LEFT JOIN employee_salary SAL  -- all the rows from the left table and the matching rows from the right table. 
ON DEM.employee_id = SAL.employee_id;

SELECT * 
FROM employee_demographics DEM
RIGHT JOIN employee_salary SAL  -- all the rows from the right table and the matching rows from the left table. 
ON DEM.employee_id = SAL.employee_id;

SELECT * 
FROM employee_salary DEM
JOIN employee_salary SAL  -- self join. 
ON DEM.employee_id + 1 = SAL.employee_id;

SELECT DEM.employee_id, DEM.first_name, DEM.last_name, DEM.age, DEM.gender, SAL.occupation, SAL.salary, SAL.dept_id, DEM.birth_date 
FROM employee_demographics DEM
LEFT JOIN employee_salary SAL  -- all the rows from the left table and the matching rows from the right table. 
ON DEM.employee_id = SAL.employee_id;

-- JOINING MULTIPLE TABLES. 
SELECT DEM.employee_id, DEM.first_name, DEM.last_name, DEM.age, DEM.gender, SAL.occupation, SAL.salary, SAL.dept_id, DEP.department_name ,DEM.birth_date 
FROM employee_demographics DEM
JOIN employee_salary SAL 
ON DEM.employee_id = SAL.employee_id
JOIN parks_departments DEP
ON SAL.dept_id = DEP.department_id;

SELECT SAL.dept_id, DEP.department_name, AVG(SAL.salary) AS avg_salary
FROM employee_demographics DEM
JOIN employee_salary SAL 
ON DEM.employee_id = SAL.employee_id
JOIN parks_departments DEP
ON SAL.dept_id = DEP.department_id
GROUP BY dept_id
ORDER BY avg_salary desc;


-- UNIONS : USED TO COMBINE A GROUP OF ROWS. 
SELECT first_name, last_name
FROM employee_demographics
UNION  -- Give distinct value by default i.e. removes douplicate values. 
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL 
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old' as Label
FROM employee_demographics
WHERE age > 40
UNION ALL 
SELECT first_name, last_name, 'Highly Paid' as Label
FROM employee_salary
WHERE salary > 70000;

SELECT first_name, last_name, 'Old Man' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid' as Label
FROM employee_salary
WHERE salary > 70000;