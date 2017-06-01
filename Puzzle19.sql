/*
--https://msbiskills.com/2015/03/26/t-sql-query-the-double-join-puzzle/
*/
;WITH CTE_EmployeeProject AS 
(
SELECT ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) RID,ID PID,PROJECT FROM EmployeeProject
)


,CTE_EmployeeSkills AS 
(
SELECT ROW_NUMBER() OVER(PARTITION BY ID ORDER BY SKILL) RID,ID [SID] , Skill FROM EmployeeSkills

)

SELECT ED.ID,ED.NAME,EP.PROJECT,ES.SKILL FROM  EmployeeDlts ED
JOIN CTE_EmployeeProject EP
ON ED.ID=EP.PID
LEFT OUTER JOIN CTE_EmployeeSkills ES
ON (EP.RID=ES.RID AND EP.PID=ES.[SID]) 
 
UNION

SELECT ED.ID,ED.NAME,EP.PROJECT,ES.SKILL FROM  EmployeeDlts ED
JOIN CTE_EmployeeSkills ES
ON ED.ID=ES.[SID]
LEFT OUTER JOIN CTE_EmployeeProject EP
ON (EP.RID=ES.RID AND EP.PID=ES.[SID]) 


