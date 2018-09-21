SELECT student.firstname, student.lastname, ROUND(AVG(assessment.grade), 2) AS moyenne
FROM assessment 
JOIN student ON assessment.student_id = student.id
JOIN enroiment ON student.id = enroiment.student_id
JOIN year ON enroiment.year_id = year.id
WHERE year.id = 2
GROUP BY student.id
ORDER BY enroiment.from, moyenne, student.firstname, student.lastname;