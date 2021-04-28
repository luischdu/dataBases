-- 1
SELECT * FROM movies_db.movies;
-- 2
SELECT first_name, last_name, rating FROM movies_db.actors;
-- 3
SELECT title FROM movies_db.series;
-- 4
SELECT first_name, last_name FROM movies_db.actors
WHERE rating > 7.5;
-- 5
select title, rating, awards from movies_db.movies
where rating > 7.5 and awards > 2;
-- 6
select title, rating from movies_db.movies
order by rating asc;
-- 7
select title, rating from movies_db.movies
where title like 'Toy Story';
-- 8
SELECT first_name, last_name FROM movies_db.actors 
where first_name like 'Sam%';
-- 9
select title from movies_db.movies
where release_date between '2004-01-01' and '2008-12-31';

