#Question
-- Write the SQL query to get the 10th maximum movie runtime from the movies table.

SELECT * FROM
(SELECT title, genre, runtime,
	DENSE_RANK() OVER(ORDER BY runtime DESC) AS runtime_ranks
FROM movies) A
WHERE runtime_ranks = 10; --10th maximum movie ...
