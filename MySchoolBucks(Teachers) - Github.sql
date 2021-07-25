--MySchools Bucks App (Teachers Info)

SELECT DISTINCT
CONCAT(6,e.districtid)AS 'District ID',
i.firstname AS 'First Name', 
i.lastname AS 'Last Name', 
'2_' + CAST (staff.staffnumber AS VARCHAR (15)) AS 'UserUniqueID',
'Teacher' AS 'Role',
'1/1/2000' AS 'Birthdate',
sl.name AS 'Building',
sl.schoolID AS 'SchoolID'

FROM e
   	-- consolidate staff from employment and employment assignment tables
JOIN ea ON e.personid = ea.personid
   	-- create one person id c0000olumn
LEFT JOIN p ON (e.personid = p.personid or ea.personid = p.personid)
   	-- grab personal info based on person id
JOIN i  ON p.currentIdentityID = i.identityID
LEFT JOIN ct ON ct.personid = p.personid
   	-- get employee assignments for those that have them
LEFT JOIN sl ON ea.schoolid = sl.schoolid
JOIN ua ON ua.personid=i.personid
JOIN staff ON staff.personid = e.personid

WHERE 
sl.Schoolid IN (1, 15, 9,17,32,26,7,8,27,13,20,24,33,5,3,29,25,35,30,45,2)
AND ea.endDate IS NULL or ea.endDate = GETDATE()

ORDER BY i.lastName
