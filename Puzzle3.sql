/*

--https://msbiskills.com/2012/07/23/t-sql-5/
Link to the puzzle
*/

--sol 1
SELECT * FROM MOVIE WHERE MName IN(
SELECT
MName
FROM MOVIE 
WHERE roles='Actor' AND AName IN ('Amitabh','Vinod') 
GROUP BY MName
HAVING COUNT(MName)>1
)
AND AName IN ('Amitabh','Vinod') AND roles='Actor'



--SOL 2
;WITH CTE_MOV AS(
SELECT 
MName,
AName,
Roles,
ROW_NUMBER() OVER(PARTITION BY MName ORDER BY MName) RNUM
FROM
MOVIE WHERE
roles='Actor' AND AName IN ('Amitabh','Vinod') )


SELECT MName,AName,Roles FROM CTE_MOV WHERE MName IN(
SELECT 
MName FROM CTE_MOV WHERE RNUM>1)





