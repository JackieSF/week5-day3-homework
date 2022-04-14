-- INNER JOIN on the Actor and Film_Actor Tables
SELECT actor.actor_id, first_name, last_name, COUNT(film_id)
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY actor.actor_id DESC;

-- LEFT JOIN on Customer and Payment tables
SELECT first_name, last_name, email,rental_id, amount, payment_date
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id;

-- Finding Customers that have a country of 'Angola'
SELECT *
FROM country;

SELECT *
FROM city
ORDER BY country_id ASC;

SELECT *
FROM address
WHERE city_id = 67;

SELECT *
FROM customer
WHERE address_id = 534;

-- Full Join that will produce info about a customer
-- From the country of Angola
SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';


-- RIGHT JOIN to find the amount of staff members we have
SELECT COUNT(staff_id), store.store_id
FROM staff
LEFT JOIN store
ON staff.store_id = store.store_id
GROUP BY store.store_id;

SELECT title, description, rating, store_id, rental_date
FROM film
FULL JOIN inventory
ON film.film_id = inventory.film_id
FULL JOIN rental
ON inventory.inventory_id = rental.inventory_id;




-- Basic Subquery
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Find all films with a language of 'English'
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name = 'English'
);