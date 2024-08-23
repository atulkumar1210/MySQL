SELECT * FROM employee_demographics;

-- In SQL string can be in single quotation or double quotation. In SQL, both syntax is same. 
-- LENGTH : gives length of any string.
select length('Asit') as Len; -- will give output = 4
select length('I am an engineering student') as Len; -- will give output = 27. 

select first_name, length(first_name) as Length
from employee_demographics;

-- UPPER and LOWER : Change upper case into lower case and Lower case into upper case resp. 
select upper('Asit');
select upper("I am an engineering student");

select lower('aSIT');
select lower("I aM An eNginEering Student");

select first_name, last_name, upper(first_name), lower(last_name)
from employee_demographics;

-- TRIM : Removes left and right spaces present in the string.
-- LTRIM : Removes left spaces present in the string.
-- RTRIM : Removes right spaces present in the string. 
select trim('      Asit   ');
select trim("    I am an engineering student");
select ltrim("    Asit   ");
select rtrim('    Asit    ');

-- LEFT : LEFT(STRING, NUM) -> will give the string of length num from the left. 
-- RIGHT : RIGHT(STRING, NUM) -> will give the string of length num from the right. 
-- SUBSTRING : SUBSTRING(STRING, INT1, INT2) -> will give a srtring starting from pos int1 to the length of int2.

select first_name, left(first_name, 2), right(first_name, 2), substring(first_name, 2, 2),
birth_date, 
right(birth_date, 2) as birth_day,
substring(birth_date, 6, 2) as birth_month,
left(birth_date, 4) as birth_year
from employee_demographics;

-- REPLACE : REPLACE(STRING, string1, string2) -> will replace string1 with string2 in string.
-- Replace function is case sensitive. 
select 'tarun', replace('tarun', 't', 'v') as replaced;
select 'tarun', replace('tarun', 't', 'V') as replaced;
select 'tarun', replace('tarun', 'ta', 'A') as replaced;

select 'I am an engineering student' as Original, replace('I am an engineering student', 'an engineering', 'a medical') as replaced;

select first_name, replace(first_name, 'A', 'B') as replaced_first_name
from employee_demographics;

-- LOCATE : LOCATE(STRING1, STRING2) -> will give position of string1 in string2. 
-- Locate function is not case sensitive. 
select 'Alexender' as Original, locate('x', 'Alexender') as pos_of_st;
select 'Alexender' as Original, locate('e', 'Alexender') as pos_of_st; -- will give 1st location of e 
select 'Alexender' as Original, locate('dx', 'Alexender') as pos_of_st; -- not present so zero
select 'Alexender' as Original, locate('end', 'Alexender') as pos_of_st;
select 'Alexender' as Original, locate('al', 'Alexender') as pos_of_st;

select first_name, locate('a', first_name) as pos_of_a
from employee_demographics;


-- CONCAT : CONCAT(STRING1, STRING2) -> will combine string1 and string2 without any space.
-- CONCAT : CONCAT(STRING1, ' ', STRING2) -> will combine string1 and string2 with space. 
select first_name, last_name, concat(first_name, last_name) as fName, concat(first_name, ' ', last_name) as full_name
from employee_demographics;