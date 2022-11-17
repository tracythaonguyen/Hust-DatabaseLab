
-- -- 1. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000. 
-- SELECT first_name, last_name, salary
-- FROM employees
-- WHERE salary NOT BETWEEN 10000 AND 15000;

-- -- 2. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order. 
-- -- department_id = 10, 11
-- SELECT e.first_name, e.last_name, d.department_id
-- FROM employees e
-- JOIN departments d ON e.department_id = d.department_id
-- WHERE d.department_id = 11 OR d.department_id = 10
-- ORDER BY d.department_id;

-- -- 3. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
-- -- department_id = 10, 11 
-- SELECT e.first_name, e.last_name, e.salary
-- FROM employees e
-- JOIN departments d ON e.department_id = d.department_id
-- WHERE (e.salary NOT BETWEEN 10000 AND 15000) AND d.department_id IN (11,10);

-- -- 4. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987. 
-- SELECT first_name, last_name, hire_date
-- FROM employees
-- WHERE hire_date BETWEEN '1987-01-01' AND '1987-12-31';

-- -- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name. 
-- SELECT DISTINCT first_name
-- FROM employees
-- WHERE first_name ILIKE '%c%b%' OR first_name ILIKE '%b%c%';

-- -- 6. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000. 
-- SELECT e.last_name, e.salary, j.job_title
-- FROM employees e
-- JOIN jobs j ON e.job_id = j.job_id
-- WHERE j.job_title IN ('Programmer', 'Shipping Clerk') 
--         AND e.salary NOT IN (4500, 10000, 15000);

-- -- 7. Write a query to display the last name of employees whose names have exactly 6 characters. 
-- SELECT DISTINCT first_name
-- FROM employees
-- WHERE first_name ILIKE '______';

-- -- 8. Write a query to display the last name of employees having 'e' as the third character. 
-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name ILIKE '__e%';

-- -- 9. Write a query to display the jobs/designations available in the employees table. 
-- SELECT DISTINCT j.job_title
-- FROM jobs j
-- JOIN employees e ON e.job_id = j.job_id;

-- -- 10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees. 
-- SELECT first_name, last_name, salary, ROUND(0.15*salary, 2) PF
-- FROM employees;

-- -- 11. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'. 
-- SELECT last_name, first_name
-- FROM employees
-- WHERE last_name IN ('Blake', 'Scott', 'King', 'Ford');
