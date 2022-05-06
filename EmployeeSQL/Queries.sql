-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year',	hire_date) = 1986

-- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT department_mgr.dept_no, departments.dept_name, department_mgr.emp_no, employees.last_name, employees.first_name
FROM department_mgr
JOIN departments ON departments.dept_no = department_mgr.dept_no
JOIN employees ON department_mgr.emp_no = employees.emp_no

-- List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_no
FROM employees
JOIN department_emp ON employees.emp_no = department_emp.emp_no
JOIN departments ON department_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules"
--and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT * from departments;

--sales = d007

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_no
FROM employees
JOIN department_emp ON employees.emp_no = department_emp.emp_no
JOIN departments ON department_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT * from departments;

--development = d005

SELECT employees.emp_no, employees.last_name, employees.first_name,  departments.dept_name
FROM employees
JOIN department_emp ON employees.emp_no = department_emp.emp_no
JOIN departments ON department_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' or departments.dept_no = 'd005'

--List the frequency count of employee last names 
--(i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;

