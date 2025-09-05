CREATE DATABASE sales_project;

USE sales_project;

CREATE TABLE retails(
transactions_id INT PRIMARY KEY,	
sale_date DATE,	
sale_time TIME,
customer_id	INT,
gender VARCHAR(15),	
age	INT,
category VARCHAR (15),	
quantity	INT,
price_per_unit	FLOAT,
cogs FLOAT,	
total_sale FLOAT

);
ALTER TABLE retails
RENAME COLUMN quantiy TO quantity;

SELECT * FROM retails;

-- DATA CLEANING.
 
SELECT * FROM retails
WHERE transactions_id IS NULL;


SELECT * FROM retails
WHERE sale_date IS NULL;


SELECT * FROM retails
WHERE
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_date IS NULL
OR
gender IS NULL
OR 
customer_id IS NULL
OR 
age IS NULL
OR 
category IS NULL
OR 
quantity IS NULL
OR 
price_per_unit IS NULL
OR 
cogs IS NULL
OR 
total_sale IS NULL;	


-- DATA EXPLORATION.

-- How Many Transaction We Have?
SELECT COUNT(*)  AS total_tansation FROM retails;

-- How Many customers We Have?
SELECT COUNT(customer_id)  AS total_customers FROM retails;

-- How Many unique customers We Have?
SELECT  COUNT(DISTINCT customer_id) AS total_customers FROM retails;

-- How many category we have?
SELECT  COUNT(DISTINCT category)  FROM retails;


-- Data analysis & Bussiness key problems and answers 

-- Q.1 Write a SQL query to retrive all column for sales made on '2022-11-05'?
SELECT * FROM retails
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to calculate the total_sale (total_sale) for each category?
SELECT category, SUM(total_sale) AS net_sale,
COUNT(*) AS total_order 
FROM retails 
GROUP BY 1;

-- Q.3 Write a SQL to find out a average age of customer who purchased item from the "beauty" category? 
SELECT AVG(age)AS avg_age
FROM retails
WHERE category = 'Beauty';
SELECT DISTINCT category FROM retails;

-- Q.4 Write a SQL query to find all transaction where the total_sale is greater then 1000?
SELECT * FROM retails 
WHERE total_sale >1000;

-- Q.5 Write a SQL query to find the total number of transations (transation_id) made by each gender and each category?
SELECT category,gender,
COUNT(*) AS total_transaction FROM retails
GROUP BY category,gender;

-- Q.6 Write a SQL query to calculate the average sale for each month. find out the the best selling month in the year?
SELECT
EXTRACT(YEAR FROM sale_date) AS year,
EXTRACT(MONTH FROM sale_date) AS month,
AVG (total_sale) AS avg_sales
FROM retails
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total_sales ?
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retails 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5 ;

-- Q.8 Write a SQL query to find out thr number of umique customers who purchased item from each category?
 SELECT 
category,
COUNT(customer_id) AS unique_customers
FROM retails
GROUP BY category;

-- Q.9 Write a SQL query to each shift and number of orders examlple ( morning<=12, afternoon between 12 - 17, evening >17?
SELECT 
    CASE 
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retails
GROUP BY shift;

-- END OF PROJECT

