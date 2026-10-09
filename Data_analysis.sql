-- Anlysis question
use	zomato_project;

select * from restaurants;

-- Finding restaurants have the most votes

select Name,Votes from restaurants
order by Votes desc
limit 10;

-- Finding how many restaurants acept online order
select online_order , count(*) as Restaurant_count
from restaurants
group by Online_order;

-- Finding how many restaurants acept table booking
select Book_table,count(*) as Booking_count
from restaurants
group by Book_table;

-- Which restaurant types are most common?
select Rest_type,count(*) as Restaurant_type
from restaurants
group by Rest_type
order by Rest_type desc
limit 10;


-- Which resturant type have the highesst average votes

select Rest_type, count(*) as total_records,
round(avg(votes),2) as avg_votes
from restaurants 
group by Rest_type
having count(*)>=10
order by avg_votes desc
limit 10; 

-- Compare ratings by online-order availability
SELECT
    Online_order,
    COUNT(*) AS total_records,
    ROUND(AVG(Rate), 2) AS avg_rating
FROM restaurants
GROUP BY Online_order;

-- Analyze table booking and ratings
SELECT
    Book_table,
    COUNT(*) AS total_records,
    ROUND(AVG(Rate), 2) AS avg_rating
FROM restaurants
GROUP BY Book_table;

-- Build a restaurant performance category
SELECT
    Name,
    Rate,
    Votes,
    CASE
        WHEN Votes >= 1000 THEN 'High'
        WHEN Votes >= 100 THEN  'Medium'
        ELSE 'Low'
    END AS engagement_category
FROM restaurants
ORDER BY Votes DESC
LIMIT 20;

-- Find the relationship between ratings and votes
SELECT
    Name,
    Rate,
    Votes,
    Online_order,
    Book_table
FROM restaurants
WHERE Rate IS NOT NULL
  AND Votes IS NOT NULL
ORDER BY Rate DESC, Votes DESC
LIMIT 20;

-- Compare online ordering options
SELECT
    Online_order,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(Rate), 2) AS average_rating,
    ROUND(AVG(Votes), 2) AS average_votes
FROM restaurants
WHERE Rate IS NOT NULL
GROUP BY Online_order
ORDER BY average_rating DESC;

-- Compare table booking options
SELECT
    Book_table,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(Rate), 2) AS average_rating,
    ROUND(AVG(Votes), 2) AS average_votes
FROM restaurants
WHERE Rate IS NOT NULL
GROUP BY Book_table
ORDER BY average_rating DESC;
-- compares online ordering and table booking together.
SELECT
    Online_order,
    Book_table,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(Rate), 2) AS average_rating,
    ROUND(AVG(Votes), 2) AS average_votes
FROM restaurants
WHERE Rate IS NOT NULL
GROUP BY Online_order ,Book_table
ORDER BY average_rating DESC;

-- Highest avg Rating in restaurants
SELECT
    Rest_type,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(Rate), 2) AS average_rating,
    ROUND(AVG(Votes), 0) AS average_votes
FROM restaurants
WHERE Rate IS NOT NULL
  AND Rest_type IS NOT NULL
GROUP BY Rest_type
HAVING COUNT(*) >= 10
ORDER BY average_rating DESC
LIMIT 10;