USE sakila;
/*
In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, 
Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
So we do not want to include this last name in our output. 
Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
*/

/*
kjhzufgzujilkhzghjklhjklkjljkuhhujkdlddd
*/

SELECT * FROM sakila.actor;


SELECT distinct(last_name)  as Unique_districts FROM sakila.actor;
SELECT distinct(last_name)  FROM sakila.actor;


SELECT count(distinct(last_name))  as Unique_last_name FROM sakila.actor;

/*
Which last names appear more than once? We would use the same logic as in the previous question but this
 time we want to include the last names of the actors where the last name was present more than once
*/

SELECT * FROM sakila.actor;


SELECT last_name FROM sakila.actor;

SELECT (last_name)
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

/*
Using the rental table, find out how many rentals were processed by each employee.
*/
select * FROM sakila.rental;
Select rental_id, staff_id from sakila.rental;
SELECT staff_id, count(distinct(rental_id)) as Total_rent FROM sakila.rental
GROUP BY  staff_id ;

/*
Using the film table, find out how many films were released each year
*/
select * FROM sakila.film;
select release_year , count(distinct(title)) as total_film from sakila.film
group by release_year;


/*
Using the film table, find out for each rating how many films were there.
*/
select * FROM sakila.film;

select 
	rating, 
    count(rating) as total_rating 
from sakila.film
group by rating; 


/*
What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
*/

select length FROM sakila.film;
SELECT round(avg(length),2) FROM sakila.film;

/*
Which kind of movies (rating) have a mean duration of more than two hours?
*/

select * FROM sakila.film;
SELECT avg(rental_duration) FROM sakila.film;

SELECT
Floor(avg(length)/60) as hours
FROM sakila.film
having hours > 2  ;





/*
Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
*/
select title, length,
rank () OVER (ORDER BY length DESC) as Ranking
FROM sakila.film
where not isnull(length) or not (length= 0) ;

