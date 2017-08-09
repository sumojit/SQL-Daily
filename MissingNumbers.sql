
/*
--https://msbiskills.com/2015/03/31/t-sql-query-the-missing-numbers-puzzle/
*/
WITH CTE_MN AS(
SELECT MIN(ID) AS MINID,MAX(ID) MAXID FROM MissingNumbers
)

,CTE_RN AS
(
SELECT MINID,MAXID FROM CTE_MN
UNION ALL
SELECT MINID+1 MINID,MAXID FROM CTE_RN
WHERE MINID<MAXID
)
SELECT MINID FROM CTE_RN