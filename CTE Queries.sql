Select * from employee_information;

-- 1. Query to Get Employee Details with Their Salary and Department Name

With EmployeeDetails AS(
	Select
			empinfo.employee_id,
			empinfo.first_name,
			empinfo.last_name,
			empinfo.age,
			empinfo.gender,
			empsal.salary,
			empsal.occupation,
			dep.department_name
	from employee_information empinfo
		join employee_salary empsal
			on empinfo.employee_id = empsal.employee_id
		join departments dep
			on empsal.dept_id = dep.department_id
)
	select 
			employee_id,
			first_name,
			last_name,
			age,
			gender,
			Occupation,
			Salary,
			department_name
from EmployeeDetails;

-- 2. Query to Calculate Average Salary by Department

With DepartmentSalary As(
Select
dept_id,
Salary
from employee_salary

)

Select
		dep.department_name,
		Avg(salary) as Average_Salary
from departments dep
join DepartmentSalary depsal
on depsal.dept_id=dep.department_id
group by dep.department_name;

-- 3.Employees with Salary Above Average Salary in Their Department

WITH AverageDepartmentSalary AS (
    SELECT 
        s.Dept_id,
        AVG(s.Salary) AS AvgSalary
    FROM 
        employee_salary s
    GROUP BY 
        s.Dept_id
),
EmployeeSalaries AS (
    SELECT 
        e.Employee_ID,
        e.First_Name,
        e.Last_Name,
        s.Salary,
        s.Dept_id
    FROM 
        employee_information e
    JOIN 
        employee_salary s ON e.Employee_ID = s.Employee_ID
)

SELECT 
    es.First_Name,
    es.Last_Name,
    es.Salary,
    d.department_name
FROM 
    EmployeeSalaries es
JOIN 
    AverageDepartmentSalary ads ON es.Dept_id = ads.Dept_id
JOIN 
    departments d ON es.Dept_id = d.department_id
WHERE 
    es.Salary > ads.AvgSalary;
    
-- 4. Get Employees with Their Age and Salary Information (Age greater than 40)

With emplyoeedetails as(
Select
	empinfo.employee_id,
    empinfo.first_name,
    empinfo.last_name,
    empinfo.age,
    empsal.salary
from employee_information empinfo
	JOIN employee_salary empsal
    ON empinfo.employee_id=empsal.employee_id
)
Select
	employee_id,
    first_name,
    last_name,
    age
from emplyoeedetails
where age > '40';

-- 5.