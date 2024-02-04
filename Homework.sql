-- 1. List all customers who live in Texas (useJOINs)
SELECT customer.first_name, customer.last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Texas';
--results = no data

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.first_name, customer.last_name, payment.amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;
--results = there is 1,423 customers with payments above $6.99

-- 3. Show all customers names who have made payments over $175 (usesubqueries)
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN (
    SELECT payment.customer_id
    FROM payment
    GROUP BY payment.customer_id
    HAVING SUM(payment.amount) > 175
);
--results there is 7 customers with payments above 175$
-- we did this one in class.



-- 4. List all customers that live in Nepal (use the citytable)
SELECT customer.first_name, customer.last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Nepal';
--results there is only 1 person from this list that lives in Nepal.


-- 5. Which staff member had the most transactions?
SELECT staff.first_name, staff.last_name, COUNT(*) AS transaction_count
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY transaction_count DESC
LIMIT 1;
--results Mike Hillyer has made the most transactions (8,040) 


-- 6. How many movies of each rating are there?
SELECT film.rating, COUNT(*) AS movie_count
FROM film
GROUP BY film.rating;
--results
--"rating","movie_count"
--"PG-13","223"
-- "G","178"
-- "R","195"
-- "NC-17","210"
-- "PG","194"



-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer.first_name, customer.last_name
FROM customer
WHERE EXISTS (
    SELECT 1
    FROM payment
    WHERE payment.customer_id = customer.customer_id AND payment.amount > 6.99
    GROUP BY payment.customer_id
    HAVING COUNT(payment.payment_id) = 1
);
-- results there is 130 customers with single payments of $6.99.


-- 8. How many free rentals did our stores give away?
SELECT COUNT(*) AS free_rentals
FROM rental
WHERE rental.rental_id NOT IN (
    SELECT payment.rental_id
    FROM payment
    WHERE payment.amount > 0
);
--results 1476 free rentals were given away.