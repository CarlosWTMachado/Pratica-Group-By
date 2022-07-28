-- Q1
SELECT COUNT("endDate") AS "currentExperiences"
FROM experiences
;

-- Q2
SELECT "userId" AS id, COUNT("endDate") AS educations
FROM educations
GROUP BY "userId"
;

-- Q3
SELECT u.name AS writer, COUNT(t."writerId") AS "testimonialCount"
FROM testimonials t
JOIN users u
ON t."writerId" = u.id
WHERE "writerId" = 435
GROUP BY u.name
;

-- Q4
SELECT MAX(j.salary) AS "maximumSalary", r.name AS role
FROM jobs j
JOIN roles r
ON j."roleId" = r.id
WHERE active = true
GROUP BY r.name
ORDER BY "maximumSalary" ASC
;

-- Bonus
SELECT 
	s.name AS school, 
	c.name AS course,
	COUNT(e."userId") AS "studentsCount",
	e.status AS role
FROM educations e
JOIN schools s
ON e."schoolId" = s.id
JOIN courses c
ON e."courseId" = c.id
WHERE status = 'ongoing' OR status = 'finished'
GROUP BY s.name, c.name, e.status
ORDER BY "studentsCount" DESC
LIMIT 3
;
