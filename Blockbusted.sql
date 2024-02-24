EXPLAIN 
SELECT * FROM film;--

SELECT rating, AVG(rental_duration)
FROM film
GROUP BY rating; --

-- let’s find out how many films there are for each rating and rental rate combination:
SELECT rating,
       rental_rate,
       COUNT(film_id)
FROM film
GROUP BY rating,
         rental_rate;
		 	 
EXPLAIN
SELECT rating,
       release_year
FROM film
GROUP BY rating,
         release_year;
		 
EXPLAIN
SELECT DISTINCT rating,
                release_year
FROM film;




-- DUPLICATES DATA

SELECT title,
       release_year,
       language_id,
       rental_duration,
       COUNT(*)
FROM film
GROUP BY title,
         release_year,
         language_id,
         rental_duration
HAVING COUNT(*) >1; --no result set means we have no duplicates


--MODE
SELECT MODE() WITHIN GROUP (ORDER BY rating)
       AS modal_value
FROM film;

--DESCRIPTION OF DATA COUNTS
SELECT rating,
       COUNT(*)
FROM film
GROUP BY rating
ORDER BY COUNT(*);



--SUBQUERIES 
SELECT title,
       rating,
       release_year,

  (SELECT MAX(amount)
   FROM payment) AS max_amount   -- max amount
FROM film;


SELECT COUNT(shortmovies.film_ID) AS short_movie_count,
       shortmovies.rating
FROM
  (SELECT film.film_ID,
          film.rating
   FROM film
   WHERE film.length <=100) AS shortmovies -- subquery renamed shortmovies
WHERE shortmovies.rating IN ('G', 'PG', 'PG-13')   
GROUP BY shortmovies.rating;



SELECT *
FROM customer
WHERE customer_id IN
    (SELECT customer_id
     FROM rental
     WHERE return_date < '2005-07-29' );
	 
	 
	-- Comment
/*Get customer count and total payment received against each country */
SELECT country,
       COUNT(DISTINCT A.customer_id) AS customer_count,
       SUM(amount) AS total_payment
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_ID = D.country_ID
INNER JOIN payment E ON a.customer_id = E.customer_id
GROUP BY country
