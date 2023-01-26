
-- -- 11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 
-- SELECT first_name, hire_date
-- FROM employees
-- WHERE hire_date BETWEEN '1987-06-01' AND '1987-07-30';

-- -- 15. Write a query to get the firstname, lastname who joined in the month of June. 
-- SELECT first_name, last_name
-- FROM employees
-- WHERE EXTRACT(MONTH FROM hire_date) = 6;

-- -- 17. Write a query to get first name of employees who joined in 1987. 
-- SELECT first_name, last_name
-- FROM employees
-- WHERE EXTRACT(YEAR FROM hire_date) = 1987;

-- -- 18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. 
-- SELECT DISTINCT d.department_name, e2.first_name, e2.employee_id, e2.salary
-- FROM employees e1
-- JOIN employees e2 ON e1.manager_id = e2.employee_id
-- JOIN departments d ON e1.manager_id = d.manager_id
-- WHERE EXTRACT(YEAR FROM e2.hire_date) < 2017;

-- -- 19. Write a query to get employee ID, last name, and date of first salary of the employees. 
-- -- hoi ngay nhan luong nma dang tinh ngay cuoi cung cua thang
-- SELECT employee_id, last_name, (DATE_TRUNC('month', hire_date) + interval '1 month - 1 day')::DATE as first_day_sal
-- FROM employees;

-- -- 20. Write a query to get first name, hire date and experience of the employees. 
-- -- dang viet kieu tru hoi ngu
-- SELECT first_name, hire_date, (EXTRACT(YEAR FROM (CURRENT_DATE)) - EXTRACT(YEAR FROM hire_date)) experience
-- FROM employees;

-- -- 21. Write a query to get the department ID, year, and number of employees joined. 
-- -- dang k hieu year me gi????
-- SELECT d.department_id, d.department_name, COUNT(d.department_id) number_of_employees
-- FROM departments d
-- JOIN employees e ON e.department_id = d.department_id
-- GROUP BY (d.department_id)
-- ORDER BY d.department_id;