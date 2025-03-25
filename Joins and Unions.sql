-- Joins

Select * from employee_information;
Select * from employee_salary;

-- Inner Joins

Select empInfo.age, empSal.occupation
from employee_information as empInfo
Join employee_salary as empSal
	on empInfo.employee_id = empSal.employee_id;
    
-- Left Joins
Select empInfo.age, empSal.occupation
from employee_information as empInfo
Left Join employee_salary as empSal
	on empInfo.employee_id = empSal.employee_id;
    
-- Right Joins

Select *
from employee_information as empInfo
Right Join employee_salary as empSal
	on empInfo.employee_id = empSal.employee_id;
    
-- Self Join
Select *
from employee_information Emp1
join employee_information Emp2
on Emp1.employee_id = Emp2.employee_id;

-- Multiple Tables Joins
Select *
from employee_information as empInfo
 Join employee_salary as empSal
	on empInfo.employee_id = empSal.employee_id
join departments DP
on empSal.dept_id=DP.department_id
    ;

-- Unions - Find high salary employee who is older than 60 years
Select first_name,
last_name,
'Old_Age' as lable
from employee_information
where age >'60'
union 
select first_name,
last_name,
'High_Salary' as lable
from employee_salary
where salary > '70000'
;


