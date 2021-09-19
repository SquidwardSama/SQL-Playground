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
