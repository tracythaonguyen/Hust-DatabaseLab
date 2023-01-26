
-- -- 1. Write a query to list the number of jobs available in the employees table. 
-- -- (chua hieu y cau nay lam)
-- SELECT e.job_id, j.job_title, COUNT(e.job_id) number_of_job
-- FROM employees e
-- JOIN jobs j ON e.job_id = j.job_id
-- GROUP BY e.job_id, j.job_title
-- ORDER BY e.job_id;

-- -- 2. Write a query to get the total salaries payable to employees in each department. 
-- SELECT d.department_id, SUM(e.salary) AS total_salary
-- FROM employees e
-- JOIN departments d ON d.department_id = e.department_id
-- GROUP BY d.department_id
-- ORDER By d.department_id;

-- -- 3. Write a query to get the minimum salary for each job 
-- -- (??)
-- SELECT job_id, job_title, min_salary
-- FROM jobs;

-- -- 4. Write a query to get the maximum salary of an employee working as a Programmer (job title)
-- SELECT max_salary
-- FROM jobs
-- WHERE job_title = 'Programmer';

-- -- 5. Write a query to get the average salary and number of employees working the department 90 (department id). 
-- -- department_id = 10
-- SELECT ROUND(AVG(salary),2) avg_salary, COUNT(employee_id) number_of_employee
-- FROM employees
-- WHERE department_id = 10; 

-- -- 6. Write a query to get the highest, lowest, sum, and average salary of all employees. 
-- SELECT MAX(salary) max_sal, MIN(salary) min_sal, SUM(salary) sum, ROUND(AVG(salary),2) avg_sal
-- FROM employees;

-- -- 8. Write a query to get the difference between the highest and lowest salaries. 
-- SELECT (MAX(salary)-MIN(salary)) difference_max_min
-- FROM employees;

-- -- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
-- SELECT e2.manager_id, MIN(e2.salary)
-- FROM employees e2
-- JOIN employees e1 ON e2.manager_id = e1.employee_id
-- GROUP BY e2.manager_id
-- ORDER BY e2.manager_id;

-- -- 11. Write a query to get the average salary for each job ID excluding programmer. 
-- SELECT ROUND(AVG(e.salary), 2) avg_salary, j.job_title
-- FROM employees e
-- JOIN jobs j ON e.job_id = j.job_id
-- WHERE j.job_title <> 'Programmer'
-- GROUP BY(j.job_title);

-- -- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000. 
-- SELECT j.job_id, MAX(e.salary)
-- FROM jobs j
-- JOIN employees e ON e.job_id = j.job_id
-- GROUP BY(j.job_id)
-- HAVING MAX(e.salary) >= 4000;

-- -- 14. Write a query to get the average salary for all departments employing more than 10 employees. 
-- -- 6 nguoi
-- SELECT ROUND(AVG(e.salary), 2) avg_sal, COUNT(e.employee_id) number_of_employee, d.department_name
-- FROM employees e
-- JOIN departments d ON e.department_id = d.department_id
-- GROUP BY (d.department_id, d.department_name)
-- HAVING COUNT(e.employee_id) >= 6;