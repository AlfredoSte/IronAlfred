use sakila;

-- 1) Get release years

select distinct release_year from film
group by film_id;

-- 2) Get all films with ARMAGEDDON in the title

select title
from film
where film.title LIKE "%ARMAGEDDON%"
group by film_id;

-- 3) Get all films which title ends with APOLLO

select title
from film
where film.title LIKE "%APOLLO"
group by film_id;

-- 4) Get 10 the longest films
select length, title
from film 
group by film_id
order by length
desc
limit 10;


-- 5) How many films include Behind the Scenes content?
select title, special_features 
from film
where special_features like "%Behind the Scenes%"
group by film_id;

-- 6) Drop column picture from staff.
Alter table staff
Drop picture;

select * from staff;

-- 7) A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- get all the availalbe info from the customer table
select first_name, last_name, address_ID, email, `active`
from customer
where CONCAT(first_name, " ", last_name) = "tammy sanders";

-- create new raw with the above (and new) info in staff table
INSERT INTO sakila.staff (staff_id, first_name, last_name, 
address_id, email, store_id, `active`, username, 
`password`, last_update) values (3,"TAMMY", "SANDERS", "79",
"TAMMY.SANDERS@sakilacustomer.org", 1, 1, "Tammy", "tammy7689",
'2006-02-15 03:57:16');

select * from staff;

-- 8) Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.

-- identified the possible inventory_ids for the title in store = 1
select inventory_id, title
from inventory as i
inner join film as f
on  f.film_id = i.film_id
inner join store as s
on s.store_id = i.store_id
where title = "Academy Dinosaur" AND s.store_id = 1;

-- rental_date = '2021-08-26 15:38:16'
select current_date;

-- identify the customer_ID
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

-- return_date= '2021-09-26 15:38:16'

-- staff_id of Mike Hilyer is 1

-- what is the next rental id?

select max(rental_id) from rental;
-> 16049;

-- create new raw with the above (and new) info in rental table
INSERT INTO sakila.rental (rental_id, rental_date, inventory_id, 
customer_id, return_date, staff_id, last_update) 
values (16050,'2021-08-26 15:38:16', 1, 130,
'2021-09-26 15:38:16', 1,'2021-08-26 15:38:16');

select * from rental
group by rental_id
order by rental_id
desc
limit 10;

-- 9 Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
-- identify customer_ids of the inactive customers
select customer_id from customer
where `active` = 0;

-- create backup table called deleted_users
create table deleted_users AS Select customer_id, email, create_date
from customer
where `active` = 0;
 
select * from deleted_users;

-- delete non-active users in customer table
-- first check how many customers 
select count(*) from customer;

SET SQL_SAFE_UPDATES = 0;


-- delete the non-active customers
delete from customer
where `active` = 0;

SET SQL_SAFE_UPDATES = 1;




