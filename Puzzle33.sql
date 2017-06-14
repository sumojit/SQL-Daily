/*
--https://msbiskills.com/2015/03/31/t-sql-query-the-range-puzzle/
*/
WITH CTE_LG AS(
SELECT 
ISNULL(LAG(VALS) OVER(ORDER BY VALS),0) Lower_Range,VALS  UpperRange
FROM 
RangeValues 
)

SELECT * FROM CTE_LG
UNION ALL
SELECT MAX(UpperRange) Lower_Range,0 UpperRange FROM CTE_LG
