/*
--https://msbiskills.com/2015/04/07/858/
*/

WITH CTE_ID1 AS(
SELECT ID ID1,SUM(VAL) VAL1 FROM DJ1 GROUP BY ID)
, CTE_ID2 AS(
SELECT ID ID2,SUM(VAL) VAL2 FROM DJ2 GROUP BY ID)
SELECT 
COALESCE(ID1,ID2) ID,ISNULL(VAL1,0) VAL1,ISNULL(VAL2,0) VAL2
FROM CTE_ID1 C1 FULL OUTER JOIN CTE_ID2 C2 ON C1.ID1=C2.ID2