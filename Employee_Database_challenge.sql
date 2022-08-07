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