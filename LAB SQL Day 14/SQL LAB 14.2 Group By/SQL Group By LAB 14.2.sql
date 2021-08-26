use sakila;

-- Question 1: In the table actor, what last names are not repeated? 
select count(last_name) as counter, last_name 
from actor
group by last_name
having counter = 1;

-- Question 2: Which last names appear more than once?
select count(last_name) as counter, last_name 
from actor
group by last_name
having counter > 1;

-- Question 3: Using the rental table, find out how many rentals were processed by each employee.
select count(rental.rental_id), staff.first_name, staff.last_name
from staff
inner join rental
on staff.staff_id = rental.staff_id
group by staff.first_name;

-- Question 4: Using the film table, find out how many films were released.
select count(film_id) from film;

-- question 5: Using the film table, find out how many films there are of each rating.
select count(film_id) as film_counts, rating from film
group by rating;

-- question 6: What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select round(avg(length),2), rating from film
group by rating;

-- question 7: Which kind of movies (rating) have a mean duration of more than two hours?
select round(avg(length),2), rating from film
group by rating
having round(avg(length),2) > 120;

