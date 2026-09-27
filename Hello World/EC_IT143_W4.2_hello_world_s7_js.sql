CREATE PROCEDURE dbo.usp_LoadHelloWorld
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_HelloWorld;

    INSERT INTO dbo.t_HelloWorld (MyName)
    SELECT MyName
    FROM dbo.v_HelloWorld;
END;