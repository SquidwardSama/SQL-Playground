```sql
use mavenmovies;
```

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

```sql
SELECT 
    first_name, last_name, email, store_id
FROM
    staff;
```    

/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 

```sql
SELECT 
    store_id, COUNT(inventory_id) AS 'Inventory Count'
FROM
    inventory
GROUP BY store_id;
```

/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/

```sql
SELECT 
    store_id, COUNT(customer_id) AS 'Active Customers'
FROM
    customer
WHERE
    active = 1
GROUP BY store_id;
```

/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/

```sql
SELECT 
   COUNT(email) as 'Emails Stored'
FROM
    customer;
```

/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/

```sql
SELECT 
    store_id, COUNT(DISTINCT film_id) AS 'Unique Titles'
FROM
    inventory
GROUP BY store_id;

SELECT 
    COUNT(DISTINCT name) AS 'Unique Categories'
FROM
    category;
```

/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/

```sql
SELECT 
    MIN(replacement_cost) AS 'Least Expensive',
    MAX(replacement_cost) AS 'Most Expensive',
    AVG(replacement_cost) AS 'Average Replacement Cost'
FROM
    film;
```

/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/

```sql
SELECT 
    AVG(amount) AS 'Avg Payment Processed',
    MAX(amount) AS 'Max Payment Processed'
FROM
    payment;
```

/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

```sql
SELECT 
    customer_id, COUNT(rental_id) AS 'Rental Count'
FROM
    rental
GROUP BY customer_id
ORDER BY COUNT(rental_id) DESC;
```
