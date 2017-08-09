/*
--https://msbiskills.com/2015/04/23/t-sql-query-the-multiple-condition-puzzle/

*/
WITH CTE_GRP AS(

SELECT 
Group_id,
Group_no,
Group_name,
ROW_NUMBER() OVER(PARTITION BY GROUP_NO ORDER BY GROUP_NO) CNT,
Active
FROM 
Groups
WHERE Active=1)

,CTE_GRP1 AS(
SELECT 
Group_no,
MAX(CNT) CNT
FROM CTE_GRP
GROUP BY Group_no
HAVING MAX(CNT)>1)



SELECT C1.Group_id,C1.Group_no,C1.Group_name,C1.Active FROM CTE_GRP C1
JOIN CTE_GRP1 C2
ON C1.Group_no=C2.Group_no