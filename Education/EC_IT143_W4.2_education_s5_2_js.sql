DROP TABLE dbo.t_Education_StudentCountByDepartment;

CREATE TABLE dbo.t_Education_StudentCountByDepartment
(
    department_name NVARCHAR(200) NOT NULL
        CONSTRAINT PK_t_Education_StudentCountByDepartment PRIMARY KEY,
    student_count INT NOT NULL
);