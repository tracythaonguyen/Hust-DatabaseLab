
-- -- 2. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
-- UPDATE employees
-- SET phone_number = REPLACE(phone_number,'124','999')
-- WHERE phone_number LIKE '%124%';

-- -- 5. Write a query to append '@example.com' to email field.
-- UPDATE employees SET email = CONCAT(email, '@example.com');

-- 6. Write a query to get the employee id, name (first name, lastname) and hire month. 
-- de qua k lam

-- -- 7. Write a query to get the employee id, email id (discard the last three characters). 
-- -- reverse, lay tu cai thu 4, xong lai reverse lai
-- SELECT employee_id, REVERSE(SUBSTR(REVERSE(email), 4)) as Email_ID 
-- from employees;

-- -- 8. Write a query to find all employees where first names are in upper case. 
-- SELECT * FROM employees 
-- WHERE first_name = BINARY UPPER(first_name);

-- -- 9. Write a query to extract the last 4 character of phone numbers. 
-- SELECT employee_id, REVERSE(SUBSTR(REVERSE(phone_number), 0, 5))
-- FROM employees
-- WHERE phone_number IS NOT NULL;

-- 10. Write a query to get the last word of the street address. 


-- 11. Write a query to get the locations that have minimum street length. 
SELECT MIN(LENGTH(street_address))
FROM locations;

-- 12. Write a query to display the first word from those job titles which contains more than one words. 


-- 13. Write a query to display the length of first name for employees where last name contains character 'c' after 2nd position. 


-- 14. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Sort the results by the employees' first names. 


-- 15. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. 


-- 16. Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary. 


-- 17. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year. 
