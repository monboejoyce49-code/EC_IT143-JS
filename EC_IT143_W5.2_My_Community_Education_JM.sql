/*
EC_IT143_W5.2_My_Community_Education_JM

Question 1
Original Author: Bruna Sousa
Question: What is the average GPA of students in each department?
*/

SELECT
    d.name AS department_name,
    CAST(AVG(s.gpa) AS decimal(10,2)) AS average_gpa
FROM dbo.Students s
JOIN dbo.Departments d ON s.major_dept_id = d.id
GROUP BY d.name
ORDER BY average_gpa DESC;


/*
Question 2
Original Author: Godsend Clever Glory Boutoto
Question: Can you create a report that lists each student with their
student ID, name, course ID, grade, and GPA? Then, can you rank the
students based on their GPA and create a separate table called
Honor_Roll containing the three students with the highest GPAs.
*/

SELECT
    s.id AS student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    e.course_id,
    e.grade,
    s.gpa
FROM dbo.Students s
JOIN dbo.Enrollments e ON s.id = e.student_id
ORDER BY s.gpa DESC;

SELECT * FROM dbo.Honor_Roll;


/*
Question 3
Original Author: Joyce S. Monboe
Question: Which education programs or subjects have the largest
number of students or records in the dataset?
*/

SELECT *
FROM dbo.v_Education_StudentCountByDepartment
ORDER BY student_count DESC;


/*
Question 4
Original Author: Joyce S. Monboe
Question: Which education programs or subjects have the greatest
variety of courses or learning opportunities?
*/

SELECT
    d.name AS department_name,
    COUNT(c.id) AS course_count
FROM dbo.Departments d
JOIN dbo.Courses c ON d.id = c.department_id
GROUP BY d.name
ORDER BY course_count DESC;