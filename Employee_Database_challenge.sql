--Deliverable 1: The Number of Retiring Employees by Title

--Determine the most recent department current employees work in
SELECT DISTINCT ON (d.emp_no)
	d.emp_no,
	d.dept_no,
	d.to_date
INTO current_emp_dept	
FROM dept_emp d
INNER JOIN current_emp c
	ON (d.emp_no = c.emp_no)
ORDER BY
	d.emp_no,
	d.to_date DESC;

--Validate only to_date of '9999-01-01' exists
SELECT distinct to_date
FROM current_emp_dept;

--Determine the most recent title for current employees
SELECT DISTINCT ON (t.emp_no)
	t.emp_no,
	t.title,
	t.to_date
INTO current_emp_title	
FROM titles t
INNER JOIN current_emp c
	ON (t.emp_no = c.emp_no)
ORDER BY
	t.emp_no,
	t.to_date DESC;

--Validate only to_date of '9999-01-01' exists
SELECT distinct to_date
FROM current_emp_title;

--Last Title of Every Employee
SELECT DISTINCT ON (t.emp_no)
	t.emp_no,
	t.title,
	t.from_date,
	t.to_date
INTO last_emp_title	
FROM titles t
ORDER BY
	t.emp_no,
	t.to_date DESC;

--Visual Check of the data
SELECT *
FROM last_emp_title;

--To Create the table with Employee Titles Export
SELECT 
	r.emp_no,
	r.first_name,
	r.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM retirement_info r
INNER JOIN titles t 
	ON r.emp_no = t.emp_no
ORDER BY emp_no	

--Find the most recent Title
SELECT DISTINCT ON (r.emp_no)
	r.emp_no,
	r.first_name,
	r.last_name,
	r.title,
	r.from_date,
	r.to_date
FROM retirement_titles r
--WHERE to_date = '9999-01-01'
ORDER BY emp_no	

--Most Recent Title for current employees
SELECT DISTINCT ON (r.emp_no)
	r.emp_no,
	r.first_name,
	r.last_name,
	r.title,
	r.from_date,
	r.to_date
FROM retirement_titles r
WHERE to_date = '9999-01-01'
ORDER BY emp_no	