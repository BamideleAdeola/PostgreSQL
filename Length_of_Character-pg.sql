-- Calculating the length of a character using the Length function

SELECT 
	DISTINCT country,
	LENGTH(Country) AS Country_Length 
FROM eurovision
WHERE LENGTH(Country) > 8;--
