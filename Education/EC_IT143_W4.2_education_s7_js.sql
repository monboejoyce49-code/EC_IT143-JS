CREATE PROCEDURE dbo.usp_LoadEducationStudentCountByDepartment
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_Education_StudentCountByDepartment;

    INSERT INTO dbo.t_Education_StudentCountByDepartment
        (department_name, student_count)
    SELECT
        department_name,
        student_count
    FROM dbo.v_Education_StudentCountByDepartment;
END;