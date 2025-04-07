-- Temporary Tables

-- 1. Create a Temporary Table to Store Employee Salaries

CREATE temporary table TempSalaries (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    Dept_id INT
);

select *
from TempSalaries;
-- Insert data into the temporary table
INSERT INTO TempSalaries (EmployeeID, FirstName, LastName, Salary, Dept_id)
SELECT 
    e.Employee_ID,
    e.First_Name,
    e.Last_Name,
    s.Salary,
    s.Dept_id
FROM 
    employee_information e
JOIN 
    employee_salary s ON e.Employee_ID = s.Employee_ID;


-- 2. Create temp table with employees salary above the AVG Salary

CREATE temporary table EmpAboveAvgSalary 
  Select first_name,
  last_name,
  salary
  from employee_salary
  where salary > (select avg(salary) 
					from employee_salary); 
;
select *
from EmpAboveAvgSalary;

-- 3. Create a temporary table to store employee details with their salary

CREATE TEMPORARY TABLE EmployeeSalaryReport
SELECT empinfo.First_Name, 
		empinfo.Last_Name, 
        empinfo.age, 
        empsal.salary
FROM employee_information empinfo
JOIN employee_salary empsal 
ON empinfo.Employee_ID = empsal.Employee_ID
WHERE empsal.salary > 50000; 

-- Select from the temporary table
SELECT * 
FROM EmployeeSalaryReport;


-- 4. List of Employees Without Department

create temporary table EmpwithoutDepartment
select 	empinfo.employee_id,
		empinfo.first_name,
		empinfo.last_name,
        empsal.dept_id
from employee_information empinfo
join employee_salary empsal
on empinfo.employee_id = empsal.employee_id
where empsal.dept_id is null;

select *
from EmpwithoutDepartment;

-- 5. Total Salary Expense Per Department
create temporary table TotalSalaryExpense
SELECT dep.department_name, 
		SUM(empsal.Salary) AS TotalSalary
FROM departments dep
JOIN employee_salary empsal 
ON dep.department_id = empsal.Dept_id
GROUP BY dep.department_name;

SELECT * FROM TotalSalaryExpense;