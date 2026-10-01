/*
EC_IT143_W5.2_My_Community_Technology_JM
My Communities Analysis - Technology
*/


/*
Question 1
Original Author: Joyce S. Monboe

Question: Which technology categories contain the largest number of
products, and which vendors provide products within those categories?
*/

SELECT
    taxonomy_category AS category,
    COUNT(*) AS product_count,
    COUNT(DISTINCT vendor_name) AS vendor_count
FROM dbo.Products
GROUP BY taxonomy_category
ORDER BY product_count DESC;


/*
Question 2
Original Author: Joyce S. Monboe

Question: Which technology categories have the most products,
and what sub-categories are included within those categories?
*/

SELECT
    taxonomy_category AS category,
    taxonomy_sub_category AS sub_category,
    COUNT(*) AS product_count
FROM dbo.Products
GROUP BY taxonomy_category, taxonomy_sub_category
ORDER BY product_count DESC;


/*
Question 3
Original Author: Joyce S. Monboe

Question: Which vendors offer the widest variety of technology
products, and what product categories do they cover?
*/

SELECT
    vendor_name,
    COUNT(*) AS product_count,
    COUNT(DISTINCT taxonomy_category) AS category_count
FROM dbo.Products
GROUP BY vendor_name
ORDER BY category_count DESC, product_count DESC;


/*
Question 4
Original Author: Joyce S. Monboe

Stakeholder: Technology Manager responsible for evaluating technology
products and vendors.

Question: Which technology categories have the greatest variety of
products from different vendors?
*/

SELECT
    taxonomy_category AS category,
    COUNT(DISTINCT vendor_name) AS vendor_count,
    COUNT(*) AS product_count
FROM dbo.Products
GROUP BY taxonomy_category
ORDER BY vendor_count DESC;