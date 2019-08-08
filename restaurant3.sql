CREATE TABLE restaurant(
	id serial NOT NULL PRIMARY KEY,
	name VARCHAR,
	category VARCHAR,
	address VARCHAR
);

CREATE TABLE reviewer(
	id serial NOT NULL PRIMARY KEY,
	name VARCHAR,
	email VARCHAR,
	karma INTEGER CHECK (karma >= 0 AND karma <= 7)
);

CREATE TABLE review(
	id serial NOT NULL PRIMARY KEY,
	reviewer_id INTEGER REFERENCES reviewer(id),
	stars INTEGER CHECK (stars >=1 AND stars <= 5),
	title VARCHAR,
	review VARCHAR,
	restaurant_id INTEGER REFERENCES restaurant(id)
);

INSERT INTO restaurant VALUES 
(DEFAULT, 'Chick-fil-a', 'fast-food', '2580 Piedmont Rd NE'),
(DEFAULT, 'Chipotle', 'mexican', '3424 Piedmont Rd NE'),
(DEFAULT, 'Longhorn', 'steakhouse', ' 2892 N Druid Hills Rd NE'),
(DEFAULT, 'Italian Cuisine', 'italian', ' 5245 Langford Park Drive');

INSERT INTO reviewer VALUES
(DEFAULT, 'John', 'John123n@gmail.com', 7), 
(DEFAULT, 'Mel', 'Mel443@gmail.com', 5),
(DEFAULT, 'Shaggy', 'Theshagster34@gmail.com', 2),
(DEFAULT, 'Yuri', 'yu6@gmail.com', 1);

INSERT INTO review VALUES
(DEFAULT, 1, 5, 'title3', 'great', 4),
(DEFAULT, 3, 3, 'title1', 'fair', 2),
(DEFAULT, 1, 2, 'title6', 'bad', 1);
(DEFAULT, 4, 4, 'title2', 'ok', 1),
(DEFAULT, 3, 3, 'title4', 'fair', 4),
(DEFAULT, 2, 1, 'title5', 'can do better', 3),




SELECT * FROM restaurant;
SELECT * FROM reviewer;
SELECT * FROM review;



--1. List all the reviews for a given restaurant given a specific restaurant ID (3).
SELECT * 
	FROM restaurant, review 
	WHERE restaurant.id = review.restaurant_id
		AND restaurant.id = 3;
		
--2. List all the reviews for a given restaurant, given a specific restaurant name.
SELECT *
	FROM restaurant, review
	WHERE restaurant.id = review.restaurant_id
		AND restaurant.name = 'Longhorn';

--3. List all the reviews for a given reviewer, given a specific author name.
SELECT *
	FROM reviewer, review
	WHERE reviewer.id = review.reviewer_id
	 AND reviewer.name = 'John';

--4. List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT restaurant.name, review.review
	FROM restaurant, review
	WHERE restaurant.id = review.restaurant_id;

--5. Get the average stars by restaurant. The result should have the restaurant name and its average star rating.
SELECT restaurant.name, avg(review.stars)
	FROM restaurant, review
	WHERE restaurant.id = review.restaurant_id
	GROUP BY restaurant.name 
	ORDER BY avg(review.stars) desc;

--6. Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.
SELECT restaurant.name, count(review.id)
	FROM restaurant, review
	WHERE restaurant.id = review.restaurant_id
	GROUP BY restaurant.id;

--7. List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together
SELECT restaurant.name, review.review, reviewer.name
	FROM restaurant, review, reviewer
	WHERE restaurant.id = review.restaurant_id
		AND reviewer.id = review.reviewer_id;

--8. Get the average stars given by each reviewer. (reviewer name, average star rating)
SELECT reviewer.name, avg(review.stars)
	FROM reviewer, review
	WHERE reviewer.id = review.reviewer_id
	GROUP BY reviewer.id;

--9. Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)
SELECT ru.name, min(r.stars)
	FROM reviewer ru, review r
	WHERE ru.id = r.reviewer_id
	GROUP BY ru.id;

--10. Get the number of restaurants in each category. (category name, restaurant count)
SELECT rest.category, count(rest.id)
	FROM restaurant rest
	GROUP BY rest.category;

--11. Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
SELECT rest.name, count(r.id)
	FROM restaurant rest, review r
	WHERE rest.id = r.restaurant_id
		AND r.stars = 5
	GROUP BY rest.id;

--12. Get the average star rating for a food category. (category name, average star rating)
SELECT rest.category, avg(r.stars)
	FROM restaurant rest, review r
	WHERE rest.id = r.restaurant_id
	GROUP BY rest.category;





