--MySchools Bucks App (Students Info)

SELECT DISTINCT 
CONCAT(6,cal.districtid)AS 'District ID',
i.firstname AS 'First Name', 
i.lastname AS 'Last Name', 
FORMAT(i.birthdate, 'd') AS 'Birthdate',
sl.number AS 'School Code', 
sy.active AS 'Active'

FROM i 
JOIN p ON p.currentIdentityID = i.identityID 
JOIN r ON r.personID = p.personID
JOIN e ON e.personID = r.personID
JOIN cal ON cal.calendarID = e.calendarID
JOIN sl ON sl.schoolid = cal.schoolid 
JOIN sy ON sy.endyear = e.endyear
LEFT JOIN ct ON ct.personid = p.personid 
LEFT JOIN ua ON ua.personid = p.personid 

WHERE 
sy.active = 1 
AND e.active = 1 
AND e.servicetype = 'p'
AND e.enddate IS NULL 









