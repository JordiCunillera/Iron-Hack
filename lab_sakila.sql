-- Pregunta 1
USE sakila;

-- Pregunta 2
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- Pregunta 3
SELECT title FROM film;

-- Pregunta 4
SELECT DISTINCT name AS language FROM language;

-- Pregunta 5.1
SELECT COUNT(store_id) FROM store;

-- Pregunta 5.2
SELECT COUNT(staff_id) FROM staff;

-- Pregunta 5.3
SELECT CONCAT(first_name, " ", last_name) AS names FROM staff;

-- MAS INSTRUCCIONES
-- Pregunta 1
SELECT COUNT(actor_id) FROM actor WHERE first_name="Scarlett";

-- Pregunta 2
SELECT COUNT(actor_id) FROM actor WHERE last_name="Johansson";

-- Pregunta 3
SELECT COUNT(inventory_id) FROM inventory;

-- Pregunta 4
SELECT COUNT(rental_id) FROM rental;

-- Pregunta 5
SELECT MAX(rental_duration), MIN(rental_duration) FROM film;

-- Pregunta 6
SELECT MAX(length) AS max_duration FROM film;
SELECT MIN(length) AS min_duration FROM film;

-- Pregunta 7
SELECT AVG(length) FROM film;

-- Pregunta 8
SELECT CONCAT(FLOOR(AVG(length)/60), ":", ROUND(AVG(length)-FLOOR(AVG(length)/60)*60)) FROM film;

-- Pregunta 9
SELECT COUNT(film_id) FROM film WHERE length>3*60;

-- Pregunta 10
UPDATE customer 
SET email=LOWER(email);

-- Pregunta 11
SELECT length FROM film
ORDER BY LENGTH(title)
LIMIT 1;
