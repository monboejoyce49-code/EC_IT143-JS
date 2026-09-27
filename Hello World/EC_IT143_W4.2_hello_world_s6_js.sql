TRUNCATE TABLE dbo.t_HelloWorld;

INSERT INTO dbo.t_HelloWorld (MyName)
SELECT MyName
FROM dbo.v_HelloWorld;