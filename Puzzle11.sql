/*
--https://msbiskills.com/2015/03/26/t-sql-query-group-by-on-multiple-columns-puzzle/
*/
--SOL 1
WITH CTE_MUL_COLS AS
(
SELECT 
* 
FROM 
GroupbyMultipleColumns
UNPIVOT
(
VAL
FOR TXT IN([VALUE1],[VALUE2],[VALUE3])

) PVT)

SELECT 
TYP,
VAL,
COUNT(VAL) CNT
FROM 
CTE_MUL_COLS
WHERE VAL<>''
GROUP BY 
TYP,
VAL
ORDER BY TYP

