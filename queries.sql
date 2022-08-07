--Retirement Eligible Employees

SELECT 
    first_name, 
    last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT 
    COUNT(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT 
    first_name, 
    last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT 
	first_name, 
	last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

 -- Retirement eligibility
SELECT 
	COUNT(*)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');   

--Retirement Eligible Employees Table
SELECT 
    first_name, 
    last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * 
FROM retirement_info;    

-- Create new table for retiring employees
SELECT 
	emp_no, 
	first_name, 
	last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT 
	departments.dept_name,
    dept_manager.emp_no,
    dept_manager.from_date,
    dept_manager.to_date
FROM departments
INNER JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no;