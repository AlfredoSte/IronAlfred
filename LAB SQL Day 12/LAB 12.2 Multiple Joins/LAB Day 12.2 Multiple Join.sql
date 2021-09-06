--  LAB 2 day 12 Multiple Joins

-- question 1 Write a query to display for each store its store ID, city, and country.

select store.store_ID, city.city, country.country
from address
Inner join store
on store.address_id = address.address_id
Inner join city
on address.city_id = city.city_id
Inner join country
on city.country_id = country.country_id
group by store.store_id;

-- question 2: Write a query to display how much business, in dollars, each store brought in.

select  store.store_ID, sum(payment.amount) as USD
from store
inner join staff
on staff.store_id = store.store_id
inner join payment
on payment.staff_id = staff.staff_id
group by store.store_id
order by USD
DESC;

-- question 3: What is the average running time of films by category?


-- question 4: Which film categories are longest?

-- question 5: Display the most frequently rented movies in descending order.

-- question 6: List the top five genres in gross revenue in descending order.

-- question 7: Is "Academy Dinosaur" available for rent from Store 1?