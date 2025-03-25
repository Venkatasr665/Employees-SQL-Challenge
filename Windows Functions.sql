-- Windows Functions

-- 1. Find the Average salary by gender 
Select 
empinfo.gender,
avg(salary) over(partition by gender) as avg_salary
from employee_information empinfo
join employee_salary empsal
	on empinfo.employee_id = empsal.employee_id;

-- 2. Idenditfy rolling average
Select 
empinfo.gender,
avg(salary) over(partition by gender order by empinfo.employee_id) as avg_rolling_salary
from employee_information empinfo
join employee_salary empsal
	on empinfo.employee_id = empsal.employee_id;
    
-- 3. Identify rolling salary
Select empinfo.first_name,
empinfo.last_name,
empinfo.gender,
empsal.salary,
sum(salary) over(partition by gender order by empinfo.employee_id) as Rolling_Salary
from employee_information empinfo
join employee_salary empsal
	on empinfo.employee_id = empsal.employee_id;

-- Assigning Row number
Select empinfo.first_name,
empinfo.last_name,
empinfo.gender,
empsal.salary,
row_number() over()
from employee_information empinfo
join employee_salary empsal
	on empinfo.employee_id = empsal.employee_id;
    
-- Assigning ranks
Select empinfo.first_name,
empinfo.last_name,
empinfo.gender,
empsal.salary,
row_number() over() as RowNumber,
rank() over(partition by gender order by salary Desc) as RankNumber
from employee_information empinfo
join employee_salary empsal
	on empinfo.employee_id = empsal.employee_id;

 -- Desnse Rank
 Select empinfo.first_name,
empinfo.last_name,
empinfo.gender,
empsal.salary,
row_number() over() as RowNumber,
dense_rank() over(partition by gender order by salary Desc) as RankNumber
from employee_information empinfo
join employee_salary empsal
	on empinfo.employee_id = empsal.employee_id;