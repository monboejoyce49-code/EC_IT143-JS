CREATE VIEW dbo.v_Technology_ProductCountByCategory
AS
SELECT
    p.taxonomy_category,
    COUNT(*) AS product_count
FROM MyCommunities.dbo.products AS p
GROUP BY p.taxonomy_category;