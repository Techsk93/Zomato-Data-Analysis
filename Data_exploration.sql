use zomato_project;


-- display the restaurant table
select * from restaurants;
-- checking how many rows in table
select count(*) as total_rows
from restaurants;

-- checking column name
describe restaurants;

-- finding duplicate data in restaurant table
select Name,count(*) as duplicate
from restaurants
group by Name
having count(*) >1;
