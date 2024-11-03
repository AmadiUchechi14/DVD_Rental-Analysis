-- 1. How many payment transactions were greater than $5.00?
SELECT COUNT(*) AS payment_count
FROM payment
WHERE amount > 5.00;

-- 2. How many actors have a first name that starts with the letter P?
SELECT COUNT(*) AS actor_count
FROM actor
WHERE first_name LIKE 'P%';

-- 3. How many unique districts are our customers from?
SELECT COUNT(DISTINCT district) AS unique_district_count
FROM address;

-- 4. Retrieve the list of names for those distinct districts from the previous question.
SELECT DISTINCT district
FROM address;

-- 5. How many films have the word Truman somewhere in the title?
SELECT COUNT(*) AS truman_films_count
FROM film
WHERE title LIKE '%Truman%';

-- 6. Create a table to organize our potential leads.
CREATE TABLE potential_leads (
    lead_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE,
    minutes_spent INT
);

-- 7. What customer has the highest customer ID number whose name starts with an ‘E’ and has an address ID lower than 500?
SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

-- 8. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

-- 9. How many films have a rating of R and a replacement cost between $5 and $15?
SELECT COUNT(*) AS r_rated_film_count
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- 10. What is the maximum payment transaction done by the customer?
SELECT MAX(amount) AS max_payment
FROM payment;
