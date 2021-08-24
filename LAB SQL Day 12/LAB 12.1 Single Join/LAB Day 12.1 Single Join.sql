-- LAB 12 SQL queries join two tables 

-- Question 1: 

Select category.name
from category;

Select category.name, count(film_category.film_ID)
from category
Inner join film_category
on film_category.category_id = category.category_id
group by category.name;


-- Question 2: Which actor has appeared in the most films?
Select count(Film_Actor.actor_id), Actor.first_name, actor.last_name
from actor
Inner join film_actor
on film_actor.actor_id = actor.actor_id
group by Film_Actor.actor_id 
order by count(Film_Actor.actor_id) desc
Limit 1:

-- Question 3: Most active customer -> the customer that has rented the most number of films
Select count(rental.rental_id), customer.first_name, customer.last_name
from customer
Inner join rental
on rental.customer_id = customer.customer_id
group by customer.customer_id 
order by count(rental.rental_id) desc
Limit 1;

-- Questoin 4: List number of films per category
-- wft????

-- Question 5: Display the first and last names, as well as the address, of each staff member.
Select staff.first_name, staff.last_name, address.address
from address
inner join staff
on staff.address_ID = address.address_ID;

-- Question 6: Display the total amount rung up by each staff member in August of 2005.
Select staff.first_name, staff.last_name, sum(payment.amount)
from staff
inner join payment
on payment.staff_ID = staff.staff_ID
where payment.payment_date >= "2005-08-01" AND payment.payment_date <= "2005-08-31"
group by staff.first_name
order by sum(payment.amount)
desc;

-- Question 7: List each film and the number of actors who are listed for that film.
Select film.title, count(Film_Actor.actor_id) as numb_of_act
from film
left join film_actor
on film_actor.film_id = film.film_id
group by Film.title 
order by count(numb_of_act) desc;

-- Question 8: Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name. Bonus:
Select customer.first_name, customer.last_name, sum(payment.amount) 
from customer
left join payment
on payment.customer_id = customer.customer_id
group by customer.customer_ID
order by customer.last_name;

-- Question 8: Bonus Which is the most rented film? 
Select film.title, count(rental.rental_ID) as times_rented
from film
inner join inventory
on film.film_id = inventory.film_id
inner join rental
on inventory.inventory_id = rental.inventory_id
group by film.film_id
order by times_rented
desc;
