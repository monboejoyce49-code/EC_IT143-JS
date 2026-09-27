SELECT
    taxonomy_category,
    COUNT(*) AS product_count
FROM MyCommunities.dbo.products
GROUP BY taxonomy_category
ORDER BY taxonomy_category;