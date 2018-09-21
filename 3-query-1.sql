SELECT student.firstname, student.lastname, year.label
FROM student 
JOIN enroiment 
ON student.id = enroiment.student_id
RIGHT JOIN year 
ON enroiment.year_id = year.id
WHERE enroiment.`from` <= "2017-01-07 00:00:00"
ORDER BY lastname ASC;