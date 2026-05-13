USE BOOKS;
SELECT * FROM movies;
SELECT * FROM members;

-- INNER JOIN (only common records)
-- Sequence of tables doesn't matter as it gives common records from both the tables.

SELECT * FROM movies INNER JOIN members ON movies.id = members.movieid;

SELECT id, title, category, first_name FROM movies INNER JOIN members ON movies.id = members.movieid;

-- USE of WHERE CLAUSE with JOIN

SELECT * FROM movies INNER JOIN members ON movies.id = members.movieid  WHERE
first_name = 'Eldon';

SELECT * FROM movies INNER JOIN members ON movies.id = members.movieid  WHERE
category = 'animations';

SELECT * FROM movies INNER JOIN members ON movies.id = members.movieid  WHERE
ID IN (1,2);

-- TO save the table permanently for further use
CREATE TABLE rented_movies SELECT * FROM movies INNER JOIN members ON movies.id = members.movieid;
SELECT * FROM rented_movies;

-- RIGHT JOIN
# (everything from right and common from left table)

SELECT * FROM movies; # Right table
select* FROM members; # Left table
SELECT * FROM members RIGHT JOIN movies ON members.movieid = movies.id;

-- Replace missing values temporarily.
-- IFNULL function is used
SELECT IFNULL(first_name,'-') First_name,
IFNULL(Last_name,'-') Last_name,
ID, Title, category FROM members RIGHT JOIN movies ON members.movieid = movies.id;

-- LEFT JOIN
SELECT* FROM members; # left table
SELECT * FROM movies; # right table

SELECT * FROM members LEFT JOIN movies ON  members.movieid = movies.id;

-- FULL OUTER JOIN
 # no concept officially, no commands, need to use UNION command

SELECT * FROM movies LEFT JOIN members ON movies.id = members.movieid
UNION
SELECT * FROM movies RIGHT JOIN members ON movies.id = members.movieid;
-- 13 records

-- IFNULL
SELECT first_name, last_name, IFNULL(ID,'-') id, IFNULL(title,'-') Title, IFNULL(category,'-') category
 FROM movies LEFT JOIN members ON movies.id = members.movieid
UNION
SELECT first_name, last_name, IFNULL(ID,'-') id, IFNULL(title,'-') Title, IFNULL(category,'-') category
 FROM movies RIGHT JOIN members ON movies.id = members.movieid;

-- CROSS JOIN
--  (no need of common column)
SELECT * FROM meals CROSS JOIN drinks; #(gives cartesian product)
SELECT mealname, drinkname, (meals.rate + drinks.rate) Total_rate
FROM meals CROSS JOIN drinks; # adding rate column from both tables

-- SELF JOIN()
-- no command in MYSQL, same table used as left and right table
-- Join will work as INNER Join.

SELECT * FROM myemp;
SELECT E.emp_id, E.first_name Emp_name, M.first_name Manager_name
FROM myemp AS E JOIN myemp as M ON
E.MGR_ID = M.EMP_ID;

-- count number of employees working under each manager
SELECT  M.first_name Manager_name,
COUNT(E.emp_id) as emp_count
FROM myemp AS E JOIN myemp as M ON
E.MGR_ID = M.EMP_ID GROUP BY M.first_name;

-- for emp number more than 5, manager names
SELECT  M.first_name Manager_name,
COUNT(E.emp_id) as emp_count
FROM myemp AS E JOIN myemp as M ON
E.MGR_ID = M.EMP_ID GROUP BY M.first_name having emp_count > 5;

 
