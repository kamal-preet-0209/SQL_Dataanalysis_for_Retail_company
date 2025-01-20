--1. Identify all sales transactions for "Electronics" in the South region to evaluate regional performance for this category.
SELECT * 
FROM sales
WHERE category='Electronics' AND region='South';


--2. Calculate the total revenue and units sold across all stores to measure overall business performance.
SELECT SUM(revenue) AS total_revenue, SUM(units_sold) AS total_units_sold
FROM sales;


--3. Determine the total revenue contribution of each product category to identify top-performing segments.
SELECT category, SUM(revenue) AS revenue_contribution
FROM sales
GROUP BY category;


--4. Analyze sales records for January 2024 to assess post-holiday season performance.
WITH cte1 AS(
	SELECT sr_no, store_id, product_id, category, units_sold, revenue, region, EXTRACT(MONTH FROM date) AS months
	FROM sales
)

SELECT * 
FROM cte1
WHERE months=1;



--5. Classify sales transactions based on revenue into "High," "Moderate," and "Low" categories to prioritize product performance reviews.

-- Figured out MIN(revenue)=50.2 and MAX(revenue)=492.58 first to get appropriate classification of categories
SELECT *,
CASE 
	WHEN revenue BETWEEN 0 AND 150 THEN 'Low'
	WHEN revenue BETWEEN 151 AND 350 THEN 'Moderate'
	ELSE 'High'
	END AS product_performance
FROM sales;



--6. Identify which store generated the highest total revenue to recognize the best-performing location.
SELECT store_id, SUM(revenue) AS total_reveue 
FROM sales
GROUP BY store_id
ORDER BY SUM(revenue) DESC
LIMIT 1;

