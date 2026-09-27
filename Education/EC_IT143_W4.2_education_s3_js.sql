SELECT
    d.name AS department_name,
    COUNT(*) AS student_count
FROM MyCommunities.dbo.students AS s
INNER JOIN MyCommunities.dbo.departments AS d
    ON s.major_dept_id = d.id
GROUP BY d.name
ORDER BY d.name;