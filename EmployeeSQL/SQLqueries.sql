-- List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT primary_key, employeeid, firstname, lastname, gender, salary
    FROM allEmployees, salaries
    WHERE primary_key = employeeid;

-- List employees who were hired in 1986.
SELECT primary_key, firstname, lastname, gender, hiredate
    FROM allEmployees
    WHERE hiredate between '1986-01-01' and '1986-12-31';

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departmentmanagers.employeeid, departmentmanagers.departmentid, departments.deptname, allemployees.firstname, allemployees.lastname, departmentmanagers.managerfromdate, departmentmanagers.manageruntildate
    FROM allEmployees
	JOIN departmentmanagers
		on departmentmanagers.employeeid = allEmployees.primary_key
	JOIN departments
		on departmentmanagers.departmentid = departments.primary_key;

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT allEmployees.primary_key, departmentemployees.departmentid, departments.deptname, allemployees.firstname, allemployees.lastname
    FROM allEmployees
	JOIN departmentemployees
		on departmentemployees.employeeid = allEmployees.primary_key
	JOIN departments
		on departmentemployees.departmentid = departments.primary_key;

-- List all employees whose first name is "Hercules" and last names begin with "B."
~~~~~~~~~~~~~~~~~~~~~~~~~
-- not working? 
SELECT firstname, lastname
	FROM allEmployees
	WHERE firstname = 'Hercules' AND lastname = 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT allEmployees.primary_key, allEmployees.firstname, allEmployees.lastname, departmentemployees.departmentid, departments.deptname
    FROM allEmployees
    JOIN departmentemployees
		on allEmployees.primary_key = departmentemployees.employeeid
	JOIN departments
		on departments.primary_key = departmentemployees.departmentid
	WHERE departments.deptname = 'Sales';

-- List all employees in the Sales and Development departments
-- including their employee number, last name, first name, and department name.
SELECT allEmployees.primary_key, allEmployees.firstname, allEmployees.lastname, departmentemployees.departmentid, departments.deptname
    FROM allEmployees
    JOIN departmentemployees
		on allEmployees.primary_key = departmentemployees.employeeid
	JOIN departments
		on departments.primary_key = departmentemployees.departmentid
	WHERE departments.deptname = 'Sales' OR departments.deptname = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT allEmployees.lastname, COUNT(lastname)AS Frequency
  FROM allEmployees
  GROUP BY lastname
  ORDER BY COUNT(lastname) DESC;
