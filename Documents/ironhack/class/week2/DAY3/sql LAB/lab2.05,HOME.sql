USE sakila;
/*
Select all the actors with the first name ‘Scarlett’.
*/

SELECT* FROM sakila.actor;


SELECT* FROM sakila.actor
WHERE (first_name= 'Scarlett');

/*
How many films (movies) are available for rent and how many films have been rented?
*/
SELECT* FROM sakila.rental;
SELECT* FROM sakila.film;
SELECT* FROM sakila.inventory;

select inventory_id from rental;
select distinct(inventory_id) from rental;
select count(distinct(inventory_id)) from rental;

/*
What are the shortest and longest movie duration? Name the values max_duration and min_duration.
*/
SELECT* FROM sakila.film;

SELECT
MIN(length) as max_duration,
MAX(length) as min_duration
FROM sakila.film;

/*
What's the average movie duration expressed in format (hours, minutes)?
*/
SELECT
avg(length) 
FROM sakila.film;

select * from film;
select avg(length) as avg_duration from film;


SELECT CONVERT (data_type(length)),Date, 'hh:mm');
SELECT convert(length, 'hh:mm' ) AS datetime from sakila.film;



/*
How many distinct (different) actors' last names are there?
*/
SELECT count(distinct(last_name))  FROM sakila.actor;


/*
Since how many days has the company been operating (check DATEDIFF() function)?
*/
select * from rental;
select min(rental_date) from rental;
select max(rental_date) from rental;
select datediff(max(last_update),min(rental_date)) from rental;


/*
Show rental info with additional columns month and weekday. Get 20 results.

*/
select * From sakila.rental;

select *, date_format(CONVERT(left(rental_date,10),date),'%M') as 'rental_date2' from sakila.rental;

select *, date_format(CONVERT(left(rental_date,10),date),'%W') as 'rental_date3' from sakila.rental;

/*
Get release years.
*/
select* from sakila.film;
select release_year from film;


/*
Get all films with ARMAGEDDON in the title.
*/

select * from sakila.film
where title like '%ARMAGEDDON%';
/*
Get all films which title ends with APOLLO.
*/
select * from sakila.film
where title like '%APOLLO';
/*
Get 10 the longest films.
*/

select * from sakila.film;
select * from sakila.film
ORDER BY length DESC
LIMIT 10;
/*
How many films include Behind the Scenes content?
*/
select* from sakila.film;
SELECT count(special_features) FROM sakila.film
where special_features like '%Behind the Scenes% ;

;
