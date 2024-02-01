#Question
-- Write the SQL query to get the third maximum moview runtime from the movies tables.

SELECT 
	*
FROM movies
ORDER BY runtime DESC
LIMIT 1 OFFSET 2;
-- Third highest runtime movie..
