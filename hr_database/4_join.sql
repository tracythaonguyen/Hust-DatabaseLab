-- using HR_DATABASE

-- -- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
-- SELECT location_id, street_address, city, state_province, country_name
-- FROM locations 
-- JOIN countries USING (country_id);

-- -- 2. Write a query to find the name (first_name, last name), department ID and name of all the employees. 
-- SELECT first_name || ' ' || last_name names, d.department_id
-- FROM employees
-- LEFT JOIN departments d USING (department_id);

-- -- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London. 
-- SELECT first_name || ' ' || last_name names, job_title, department_id, city
-- FROM employees
-- INNER JOIN jobs USING (job_id)
-- INNER JOIN departments USING (department_id)
-- INNER JOIN locations l USING (location_id)
-- WHERE city = 'London';

-- -- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name). 
-- SELECT a.employee_id, a.last_name, b.manager_id, b.last_name
-- FROM employees a
-- INNER JOIN employees b ON b.employee_id = a.manager_id;

-- -- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
-- -- Jack (vi k co thang Jones)
-- SELECT first_name || ' ' || last_name names, hire_date
-- FROM employees e
-- WHERE hire_date > 
-- (
--   SELECT e.hire_date 
--   FROM employees e
--   WHERE e.first_name = 'Jack'  
-- );

-- 6. Write a query to get the department name and number of employees in the department. (bỏ)

-- -- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
-- -- department_id: 10 (k co 90)
-- SELECT j.employee_id, jb.job_title, (j.end_date - j.start_date) AS amount
-- FROM job_history j
-- JOIN employees e ON e.employee_id = j.employee_id
-- JOIN departments d ON d.department_id = e.department_id
-- JOIN jobs jb ON jb.job_id = j.job_id
-- WHERE d.department_id = 10;

-- -- 8. Write a query to display the department ID and name and first name of manager. 
-- SELECT d.department_id, d.department_name, e.first_name AS manager
-- FROM departments d
-- JOIN employees e ON e.employee_id = d.manager_id;

-- -- 9. Write a query to display the department name, manager name, and city. 
-- SELECT d.department_name, e.first_name, l.city
-- FROM departments d
-- JOIN employees e ON d.manager_id = e.employee_id
-- JOIN locations l ON l.location_id = d.location_id;

-- 10. Write a query to display the job title and average salary of employees. (bo) 

-- -- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
-- SELECT j.job_title, e.employee_id, e.first_name, (e.salary-j.min_salary) AS differencence
-- FROM jobs j
-- JOIN employees e ON j.job_id = e.job_id;

-- -- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
-- SELECT j.job_id, jb.job_title, e.salary
-- FROM job_history j
-- JOIN jobs jb ON j.job_id = jb.job_id
-- JOIN employees e ON e.employee_id = j.employee_id
-- WHERE e.salary > 10000
-- ORDER BY j.job_id;

-- -- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 
-- SELECT d.department_id, d.department_name, e.first_name, e.last_name, e.hire_date, e.salary
-- FROM departments d
-- JOIN employees e ON d.manager_id = e.employee_id
-- WHERE hire_date <= '2007-11-14';
