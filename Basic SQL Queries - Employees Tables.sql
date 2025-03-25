
-- BASIC SQL Statments

-- 1. Select all columns from Employees Table
Select *
from employee_information;

-- 2. Select specific colomns from the table
Select first_name,
last_name
from employee_information;

-- 3. Extract Distinct Last_Name from the table
Select distinct(last_name)
from employee_information;

-- 4. Where Clause
Select first_name,
last_name,
gender,
age
from employee_information
where age >'40';

-- 5. Extract salary greater than 60000
Select first_name,
last_name
from employee_salary
where salary > '60000';

-- 6. Logical Operator "And"
Select first_name,
last_name,
Age,
gender
from employee_information
where age > '30' and gender = 'Male' ;

-- 7. Logical Operator "OR"
Select first_name,
last_name,
Age,
gender
from employee_information
where age > '30' or gender = 'Male' ;

-- 8. Using both And and Or Logical Operators
Select first_name,
last_name,
Age,
gender
from employee_information
where (age > '30' and first_name = 'Chris') or age > '40' ;

-- 9. Query using 'Like'
Select First_name
from employee_information
where first_name like 'L%';

-- 10. Orderby
Select first_name,
Last_name,
Age
from employee_information
order by Age Desc;

-- 11. Query using 'Not'
Select First_name
from employee_information
where first_name Not like 'D%';

-- 12. Query using Average
Select Occupation,
AVG(Salary) as Average_Salary
from employee_salary
group by Occupation;

-- 13. SQL Query to know the Maximum Salary
Select Occupation,
Max(Salary) as Max_Salary
from employee_salary
group by occupation
Order by Max_Salary Desc
;

-- 14. SQL Query using Having
Select Gender,
Avg(age) as average_Age
from employee_information
group by gender
Having Avg(age) > '35'
;

-- 15. Query using both Where and Having
Select Occupation,
Avg(Salary) as Average_Salary
from employee_salary
where Occupation like '%Manager'
group by Occupation
having AVG(Salary) > 50000;

-- 16. Query using Limit
Select Occupation,
Sum(Salary) as Total_Salary
from employee_salary
Group by Occupation, Salary
Order by salary Desc
Limit 2;

-- 17. String Functions - Length
select last_name,
length(last_name)
from employee_information
order by length(last_name)
;

-- 18. Upper and Lower
Select first_name,
Last_name,
upper(first_name) as uppercase,
Lower(last_name) as LowerCase
from employee_information;

-- 19. Left and Right
Select first_name,
Last_name,
left(first_name, 3) as Left_char,
right(last_name,3) as Right_char
from employee_information;

 -- 20. Substrings
 Select birth_date,
 substring(birth_date,6,2) as Month_Number
 from employee_information;
 
 -- 21. Concate
 Select first_name,
 last_name,
 concat(first_name,' ' , last_name) as full_name
 from employee_information;
 
 -- 22. Case Statements
 select first_name,
 last_name,
 birth_date,
 Case
		When birth_date <= '1985-01-01' Then "Old Age"
        When birth_date > '1985-01-01' and birth_date <= '2000-01-01' Then "Middle Age"
        When birth_date > '2000-01-01' Then " Young"
End as Age_Factor
from employee_information;

-- 23. Subquries - List the employees whos salary is more than the average salary 
Select first_name,
last_name,
salary
from employee_salary
where salary > (select Avg(salary)
                    from employee_salary)
;

--  24. Find the second highest salary
Select 
max(salary) as second_highest_salary
from employee_salary
where salary < (Select 
				max(salary)
				from employee_salary);
                
--  25. Find the second highest salary using limt and offset
Select first_name,
last_name,
salary
from employee_salary
order by salary DESC
limit 1 offset 1;



