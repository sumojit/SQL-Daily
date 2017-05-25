/*
--https://msbiskills.com/2015/03/19/310/
*/
--SOL 1
WITH CTE_MAXVAL AS(

SELECT 
*
FROM TestMax
UNPIVOT([VALUE]
FOR MAXTXT IN([Max1],[Max2],[Max3])
) PVT)

SELECT 
Year1,
MAX(VALUE) MAXVAL
FROM CTE_MAXVAL
GROUP BY Year1