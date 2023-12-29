-- Test Support

-- SELECT, GROUP BY, FILTER

--Select all columns from the film table
SELECT * 
FROM film;

-- Explain the query performance of running all queries and just 2 columns
EXPLAIN 
SELECT * 
FROM film;
-- "Seq Scan on film  (cost=0.00..64.00 rows=1000 width=384)"


-- The EXPLAIN Function
--------
EXPLAIN 
SELECT title, release_year 
FROM film
LIMIT 10;
-- "Seq Scan on film  (cost=0.00..64.00 rows=1000 width=19)"
