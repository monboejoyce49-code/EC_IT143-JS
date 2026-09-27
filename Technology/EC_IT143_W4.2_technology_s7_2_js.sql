CREATE PROCEDURE dbo.usp_LoadTechnologyProductCountByCategory
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_Technology_ProductCountByCategory;

    INSERT INTO dbo.t_Technology_ProductCountByCategory
        (taxonomy_category, product_count)
    SELECT
        taxonomy_category,
        product_count
    FROM dbo.v_Technology_ProductCountByCategory;
END;