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

-- Joining retirement_info and dept_emp tables
SELECT 
	retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
	ON retirement_info.emp_no = dept_emp.emp_no;

--Joins using aliases    
SELECT 
	ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
	ON ri.emp_no = de.emp_no;        

--Current Employee table
SELECT 
	ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
	ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT *
FROM current_emp

-- Employee count by department number
SELECT 
	COUNT(ce.emp_no), 
	de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
	ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number
SELECT 
    COUNT(ce.emp_no), 
    de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
    ON ce.emp_no = de.emp_no
GROUP BY 
    de.dept_no
ORDER BY 
    de.dept_no;

--Employee Info table
SELECT 
	e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (de.to_date = '9999-01-01');
	 
SELECT * FROM emp_info	    

-- List of managers per department
SELECT  
	dm.dept_no,
    d.dept_name,
    dm.emp_no,
    ce.last_name,
    ce.first_name,
    dm.from_date,
    dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
	ON (dm.emp_no = ce.emp_no);
	
SELECT * FROM manager_info	

--Dept Info

SELECT 
	ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no);
	
SELECT * FROM dept_info	

--Test the number of overall records
SELECT COUNT(*)
FROM employees
 
 --Added columns for checking the data
 SELECT --DISTINCT ON (t.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	t.from_date,
	t.to_date,
	CASE WHEN birth_date BETWEEN '1952-01-01' AND '1955-12-31'
		THEN 1
		ELSE 0
		END AS retirement_age
INTO retirement_titles
FROM employees e
LEFT JOIN titles t 
	ON e.emp_no = t.emp_no
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY
	t.emp_no,
	t.to_date DESC
--LIMIT 100

--Double check the count versus the employee table
SELECT  COUNT(DISTINCT emp_no)
FROM retirement_titles	

--Query for the retirement_titles.csv extract
SELECT 
	emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date
FROM retirement_titles
WHERE retirement_age = 1

--Unique titles table insert
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title,
	to_date
INTO unique_titles	
FROM retirement_titles 
WHERE retirement_age = 1
	AND to_date = '9999-01-01'
ORDER BY 
	emp_no

--Unique titles extract 
SELECT
	emp_no,
	first_name,
	last_name,
	title
FROM unique_titles

--Checkpoint Query
SELECT
	title,
	COUNT(emp_no)
FROM unique_titles
GROUP BY
	title
ORDER BY
	COUNT(emp_no) DESC

--Create retiring_titles table
SELECT
	COUNT(emp_no),
	title
INTO retiring_titles	
FROM unique_titles
GROUP BY
	title
ORDER BY
	COUNT(emp_no) DESC
	
--intermediate employee mentorship processing table
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	t.from_date,
	t.to_date,
	CASE WHEN birth_date BETWEEN '1965-01-01' AND '1965-12-31'
		THEN 1
		ELSE 0
		END AS mentorship_age
INTO mentorship_process
FROM employees e
LEFT JOIN titles t 
	ON e.emp_no = t.emp_no
ORDER BY
	t.emp_no,
	t.to_date DESC	

--Final mentorship_eligibility table
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	birth_date,
	from_date,
	to_date,
	title
INTO mentorship_eligibilty
FROM mentorship_process
WHERE to_date = '9999-01-01'
	AND mentorship_age = 1	