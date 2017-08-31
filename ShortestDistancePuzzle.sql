/*
--https://msbiskills.com/2015/04/29/t-sql-query-the-shortest-distance-puzzle-graph-shortest-path-puzzle/
*/



DECLARE @ST_PT VARCHAR(10)
DECLARE @ED_PT VARCHAR(10)
SET @ST_PT='SECTOR 5'
SET @ED_PT='SECTOR 14'
;WITH CTE_S1 AS
(
SELECT FromPoinT,ToPoint,CAST(CONCAT('.',FromPoinT,'..',ToPoint,'..') AS VARCHAR(MAX)) PAT,Distance
FROM Area WHERE FromPoinT=@ST_PT

UNION ALL

SELECT A.FromPoinT,A.ToPoint,CAST(CONCAT(C.PAT,A.ToPoint,'..') AS VARCHAR(MAX)) PAT,A.Distance+C.Distance Distance
FROM CTE_S1 C JOIN Area A
ON C.ToPoint=A.FromPoinT
AND A.ToPoint=@ED_PT
)

,CTE_S2 AS(
SELECT PAT,DISTANCE,RANK() OVER(ORDER BY DISTANCE ASC) RNK FROM CTE_S1 WHERE ToPoint=@ED_PT)

SELECT PAT,DISTANCE FROM CTE_S2 WHERE RNK=1

