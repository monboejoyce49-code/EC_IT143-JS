CREATE TABLE dbo.t_Technology_ProductCountByCategory
(
    taxonomy_category NVARCHAR(100) NOT NULL
        CONSTRAINT PK_t_Technology_ProductCountByCategory PRIMARY KEY,
    product_count INT NOT NULL
);