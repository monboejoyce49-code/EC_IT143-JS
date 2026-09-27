SELECT
    p.taxonomy_category,
    COUNT(*) AS product_count
FROM MyCommunities.dbo.products AS p
GROUP BY p.taxonomy_category
ORDER BY p.taxonomy_category;