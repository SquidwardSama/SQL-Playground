-- Using the 'Big 6' of SQL Syntax to solve simple, single table, business problems.

/*Issue: A change in management has occurred and we want to notify our customers via email
Solution: We will use a SELECT statement to pull all customer emails from the customer table*/
SELECT 
    first_name, last_name, email
FROM
    customer;
    
/*Issue: We want to know what the range of the rental durations for our films are
	Solution: We use SELECT DISTINCT  to find out how many days people are renting our movies for*/
SELECT DISTINCT
    rental_duration
FROM
    film;
    
/*Issue: We want to know the purchasing patterns of our oldest customers. Specifically, the first 100 customers
	Solution: We use WHERE clause to filter for customers that have customer_ids between 1 and 100*/

SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    customer_id BETWEEN 1 AND 100;
    
/*Issue: We want to drill down on the data previously retrieved. We want to look at customers who made payments greater than $5 after Jan 1st
	Solution: We use the AND logical operator to drill down on the information*/

SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    amount > 5
        AND payment_date > '2006-01-01'
        AND customer_id BETWEEN 1 AND 100;

/*Issue: We want to see payments from certain customers or any payments that were iver $5 in values
	Solution: We use the IN logical operator to return necessary results*/
    
SELECT 
    customer_id, rental_id, amount, payment_date
FROM
    payment
WHERE
    customer_id IN (42 , 53, 60, 75)
        OR amount > 5;
        
/*Issue: We are looking for films that have a 'Behind The Scenes' special feature
	Solution: We can use the pattern matching to pull any records with the needed criteria*/
    
SELECT 
    title, special_features
FROM
    film
WHERE
    special_features LIKE '%Behind The Scenes%';
    
/*Issue: We want to know how long (retal_duration)  movies in the rental  store are typically rented for
	Solution: We use COUNT and GROUP BY to find out the which rental duration(s) have the hoghest counts*/
        
SELECT 
    rental_duration AS 'Days Rented',
    COUNT(film_id) AS 'Movies Rented'
FROM
    film
GROUP BY rental_duration;

/*Issue: We want to know which movie ratings (rating) are getting rented the longest, and how many movies are being rented at those durations.
	Solution: We use COUNT and GROUP BY to slice our resutls by rating and duration*/
    
SELECT 
    rating AS 'Rating',
    rental_duration AS 'Days Rented',
    COUNT(film_id) AS 'Movies Rented'
FROM
    film
GROUP BY rating , rental_duration
ORDER BY rental_duration DESC , COUNT(film_id) DESC;

/*Issue: We want to know if we charge more for movie rentals when the replacement cost is higher
	Solution: We use COUNT and GROUP BY to slice results by replacement cost*/
    
SELECT 
    replacement_cost,
    COUNT(film_id) AS 'Movies Rented',
    MIN(rental_rate) AS 'Cheapest Rental',
    MAX(rental_rate) AS 'Most Expensive Rental',
    AVG(rental_rate) AS 'Average Rental'
FROM
    film
GROUP BY replacement_cost
ORDER BY replacement_cost DESC;

/*Issue: We want to reach out to our customers with low rental numbers to find out how we can improve
	Solution: Using COUNT, GROUP BY and HAVING, we can filter for customers whose rental numbers are below the threshold (15)*/
    
SELECT 
    customer_id, COUNT(rental_id) AS 'Total Rentals'
FROM
    rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 15;

/*Issue: We want to find out if our longest films are also our most expensive to rent out
	Solution: We use ORDER BY to sort our data from highest (longest) to lowest (shortest)*/
    
SELECT 
    title, length, rental_rate
FROM
    film
ORDER BY length DESC;

-- Using more complex SQL Syntax (CASE) to solve simple, single table, business problems.

/*Issue: We want to know which stores our rental customers go to, and if the are still active patrons of said store
	Solution: We use a CASE statement to create buckets for our customers*/
    
SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    CASE
        WHEN store_id = 1 AND active = 1 THEN 'Store 1 and Active'
        WHEN store_id = 1 AND active = 0 THEN 'Store 1 and Inactive'
        WHEN store_id = 2 AND active = 1 THEN 'Store 2 and Active'
        WHEN store_id = 2 AND active = 0 THEN 'Store 2 and Inactive'
        ELSE 'Check Logic'
    END AS 'Store and Status'
FROM
    customer;
    
    