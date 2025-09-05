## 🛒 Sales_Data_Analysis_using_SQL

This project demonstrates how to use **SQL** for end-to-end **retail sales data analysis**.  
The analysis is based on a `retails` table created in MySQL and covers **data cleaning, exploration, and solving business problems**.

---

## 📂 Project Overview
- Created database `sales_project` and table `retails`.
- 
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

- Cleaned data by checking for null values and inconsistencies.
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

- Performed **Exploratory Data Analysis (EDA)** such as:
  ## Number of transactions
SELECT COUNT(*)  AS total_tansation FROM retails;

 ## Number of unique customers
SELECT  COUNT(DISTINCT customer_id) AS total_customers FROM retails;

  ## Number of categories
SELECT  COUNT(DISTINCT category)  FROM retails;

 
- Answered **business-driven questions** with SQL queries.
---

## 🔑 Business Questions Solved
## Retrieve sales on a specific date.
 SELECT * FROM retails
WHERE sale_date = '2022-11-05';

## Calculate total sales per category.
SELECT category, SUM(total_sale) AS net_sale,
COUNT(*) AS total_order 
FROM retails 
GROUP BY 1;
   
## Find average customer age for the *Beauty* category.
SELECT AVG(age)AS avg_age
FROM retails
WHERE category = 'Beauty';
SELECT DISTINCT category FROM retails;
  
## Transactions where sales > 1000.
SELECT * FROM retails 
WHERE total_sale >1000;

## Number of transactions by gender and category.
COUNT(*) AS total_transaction FROM retails
GROUP BY category,gender;

## Average sales per month → identify best-selling month.
SELECT
EXTRACT(YEAR FROM sale_date) AS year,
EXTRACT(MONTH FROM sale_date) AS month,
AVG (total_sale) AS avg_sales
FROM retails
GROUP BY 1, 2
ORDER BY 1, 3 DESC;
 
## Top 5 customers by sales.
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retails 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5 ;

## Unique customers per category.
SELECT 
category,
COUNT(customer_id) AS unique_customers
FROM retails
GROUP BY category;
      
## Orders by shift (Morning, Afternoon, Evening).  
SELECT 
    CASE 
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retails
GROUP BY shift;
---

## 📊 Skills Highlighted
- **SQL (MySQL)**: DDL, DML, Aggregate Functions, GROUP BY, CASE.  
- **Data Cleaning**: Handling missing values.  
- **Data Analysis**: Extracting business insights with queries.  
- **Problem Solving**: Answering real-world sales-related questions.  

---

## 🚀 How to Run
1. Clone the repo:
   ```bash
   git clone https://github.com/Prashantsony0870-web/sales-data-sql.git

## analyzed by = Prashant sony 
   
