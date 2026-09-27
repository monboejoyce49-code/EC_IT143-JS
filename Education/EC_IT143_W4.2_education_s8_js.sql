EXEC dbo.usp_LoadEducationStudentCountByDepartment;

SELECT *
FROM dbo.t_Education_StudentCountByDepartment
ORDER BY department_name;