-- Verify connection to DB using the Actor Table
SELECT *
FROM actor;

-- Query for first_name and last_name from the actor table
SELECT first_name, last_name
FROM actor;

-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards


-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names


-- Single Character Wild Card ( _ )


-- Query for all first_names that start with 'K__%' has two letters, anything goes after


----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table


-- Query WHERE amount GREATER THAN $10.

-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive


-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order


-- Query all payments NOT EQUAL to 2.99


----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99


-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99


-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99


-- Query to display the count of DISTINCT amounts paid


-- Query to display the MIN paid using alias


-- Query to display the MAX paid using alias


-- GROUP BY (Used with aggregate functions)


-- Query the customer that paid the most
--1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*)
FROM actor
WHERE last_name = 'Wahlberg';
--results= theres 2 people with the name Wahlberg

--2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--results= theres 5602 payments that were between $3.99 and $5.99.

--3. What film does the store have the most of? (search in inventory)
SELECT film_id, Count(film_id) AS quantity
FROM inventory
GROUP BY film_id
ORDER BY quantity DESC
LIMIT 1;
--results= film_id is 350 with a quantity of 8.

--4. Customers with the last name 'William':
SELECT COUNT(*)
FROM customer
WHERE last_name = 'William';
--results= theres "0" people with th elast name William.


--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(*) AS rental_count 
FROM rental 
GROUP BY staff_id 
ORDER BY rental_count 
DESC LIMIT 1;
--results= 1 staff_id and 8040 rental_count.

--6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address
--results= theres 378 district names.

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(*) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count
DESC LIMIT 1;
--results= film_id total 508 with 15 actor_count.

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*)
FROM customer
WHERE store_id = 1 AND last_name LIKE 'es';
--results= there are no last name that end with 'es'


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customerswith ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(*) AS rental_count
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(*) > 250;
--RESULTS= AMOUNT (2.99)= 290 RENTAL_COUNT/ AMOUNT (4.99)= 281 RENTAL_COUNT/ AMOUNT (0.99)= 269 RNETAL_COUNT


--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating, COUNT(*) AS movie_count
FROM film
group BY rating
ORDER BY movie_count DESC;
--results= PG-13= 223, NC-17= 210, R= 195, PG= 194, G=178.