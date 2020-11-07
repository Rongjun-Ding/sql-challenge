SELECT * FROM "Titles";
SELECT * FROM "Employees";
SELECT * FROM "Department";
SELECT * FROM "Dept_emp";
SELECT * FROM "Dept_manager";
SELECT * FROM "Salaries";

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM "Employees" E
LEFT JOIN "Salaries" S
ON E.emp_no = S.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE TO_DATE(hire_date, 'MM/DD/YYYY') BETWEEN '1/1/1986' and '12/31/1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_no, N.dept_name
FROM "Employees" E
JOIN "Dept_manager" D
ON E.emp_no = D.emp_no
JOIN "Department" N
ON D.dept_no = N.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, N.dept_name
FROM "Employees" E
JOIN "Dept_emp" D
ON E.emp_no = D.emp_no
JOIN "Department" N
ON D.dept_no = N.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name, sex
FROM "Employees"
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, N.dept_name
FROM "Employees" E
JOIN "Dept_emp" D
ON E.emp_no = D.emp_no
JOIN "Department" N
ON D.dept_no = N.dept_no
WHERE N.dept_name='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, N.dept_name
FROM "Employees" E
JOIN "Dept_emp" D
ON E.emp_no = D.emp_no
JOIN "Department" N
ON D.dept_no = N.dept_no
WHERE N.dept_name IN ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW frequency_last_name AS
SELECT E.last_name, COUNT(last_name) AS frequency
FROM "Employees" AS E
GROUP BY E.last_name
ORDER BY "frequency" DESC;

SELECT *
FROM frequency_last_name;
