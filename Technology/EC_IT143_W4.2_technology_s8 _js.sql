EXEC dbo.usp_LoadTechnologyProductCountByCategory;

SELECT *
FROM dbo.t_Technology_ProductCountByCategory
ORDER BY taxonomy_category;