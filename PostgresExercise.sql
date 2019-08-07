CREATE TABLE restaurant(
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR,
	distance INTEGER,
	stars INTEGER CHECK (stars >=0),
	category VARCHAR,
	favorite_food VARCHAR,
	takeout BOOLEAN NOT NULL,
	last_visit DATE
);

insert into restaurant VALUES(DEFAULT, 'Chick fil a', '10', '3', 'Fast food', 'chicken sandwhich', TRUE,'08-01-2019');
insert into restaurant VALUES(DEFAULT, 'The House of BBQ', '30', '4','BBQ', 'Porkchops', TRUE, '08/04/2019');
insert into restaurant VALUES(DEFAULT, 'Taco Bell', '3', '5','fast food', 'soft shell taco', TRUE, '01/01/2019');
insert into restaurant VALUES(DEFAULT, 'Farm Burger', '15', '5','fast food', 'Steak Burger', TRUE, '05/06/2019');
insert into restaurant VALUES(DEFAULT, 'The Swordfish', '1', '3','Seafood', 'Fish and Chips', TRUE, '07/28/2019');
insert into restaurant values( DEFAULT, 'chipotle', 1, 5, 'mexican', 'Steak Burrito ', FALSE, '05-21-2012');


select * from restaurant;

--Writing Queries Exercise


--The names of the restaurants that you gave a 5 stars to
select name from restaurant where stars ='5';

--The favorite dishes of all 5-star restaurants
select favorite_food from restaurant where stars ='5';

--The the id of a restaurant by a specific restaurant name, 
select id from restaurant where name = 'Farm Burger';

--restaurants in the category of 'BBQ'
select name from restaurant where category ='BBQ';

--restaurants that do take out
select name from restaurant where takeout = TRUE;

--restaurants that do take out and is in the category of 'BBQ'
select name from restaurant where takeout = TRUE AND category = 'BBQ';

--restaurants within 2 miles
select name from restaurant where distance < 2 ;

--restaurants you haven't ate at in the last week
select * from restaurant where last_visit >= current_date - interval '7 days';

--restaurants you haven't ate at in the last week and has 5 stars
select * from restaurant where last_visit >= '07-31-2019' AND stars = 5;




--Aggregation and Sorting Queries Exercise

-- 	list restaurants by the closest distance.
SELECT * FROM restaurant ORDER BY distance ASC;

--list the top 2 restaurants by distance.
SELECT * FROM restaurant ORDER BY distance ASC LIMIT 2;

--list the top 2 restaurants by stars.
SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;

--list the top 2 restaurants by stars where the distance is less than 2 miles
SELECT * FROM restaurant WHERE distance < 2 ORDER BY stars DESC LIMIT 2;

--count the number of restaurants in the db
SELECT count(id) FROM restaurant;

--count the number of restaurants by category.
SELECT category, count(id) FROM restaurant GROUP BY category;

--	get the average stars per restaurant by category.
SELECT category, sum(stars)/count(id) FROM restaurant GROUP BY category;

-- get the max stars of a restaurant by category.
SELECT category, max(stars) FROM restaurant GROUP BY category;





































