-- using HR_DATABASE

-- -- 1.	Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" from the employee
-- SELECT first_name AS "First Name", last_name AS "Last Name"
-- FROM employees;

-- -- 2.	Write a query to get unique department ID from employee table.
-- SELECT DISTINCT department_id
-- FROM employees;

-- -- 3.	Write a query to get all employee details (from employee table) who are hired in 2022 (1994 hehe)
-- SELECT *
-- FROM employees
-- WHERE EXTRACT(YEAR FROM hire_date) = 1994;

-- -- 4.	Write a query to get the names (first_name, last_name), salary, PF of the employees (PF is calculated as 15% of salary).
-- SELECT first_name || ' ' || last_name names, salary, 0.15*salary PF
-- FROM employees;

-- -- 5.	Write a query to get the names (first_name, last_name), salary, PF of the employees if PF is greater than 10000.
-- SELECT first_name || ' ' || last_name names, salary, 0.15*salary PF
-- FROM employees
-- WHERE 0.15*salary > 10000;

-- -- 6.	Write a query to get the list of employees and full information of their department
-- SELECT first_name || ' ' || last_name names, d.department_id, d.department_name, d.manager_id, d.location_id
-- FROM employees, departments d;

-- -- 7.	Write a query to calculate 171*214+625. 
-- SELECT 171*214+625 calculation;

-- -- 8.	Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.  
-- SELECT first_name || ' ' || last_name names
-- FROM employees;

-- -- 9.	Write a query to get first name from employees table after removing white spaces from both side. 
-- SELECT TRIM(first_name) first_name_trim
-- FROM employees;

-- -- 10.	Write a query to select first 10 records from a table. 
-- SELECT *
-- FROM employees
-- LIMIT 10;

-- -- 11.	Write a query to get monthly salary (round 2 decimal places) of each employee  
-- -- Note : Assume the salary field provides the 'annual salary' information.
-- SELECT first_name || ' ' || last_name names,
-- ROUND(salary/12,2) AS "monthly salary"
-- FROM employees;

-- -- 12.	Write a query to get monthly salary (round 2 decimal places) of each employee if monthly salary is smaller than 5000
-- SELECT first_name || ' ' || last_name names,
-- ROUND(salary/12,2) AS "monthly salary"
-- FROM employees
-- WHERE ROUND(salary/12,2) < 5000;


-- -- 2 cach viet 
-- -- C1
-- SELECT *
-- FROM data_table1 a, data_table2 b
-- WHERE a.ib = b.id;

-- -- C2 (sometimes take more time)
-- SELECT *
-- FROM data_table1 
-- JOIN data_table2 USING (id);