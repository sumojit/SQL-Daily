/*
--https://msbiskills.com/2016/03/07/sql-puzzle-remove-duplicate-uom-puzzle/
*/

;WITH CTE_AS AS (
SELECT max(id) ID,uom FROM Measure group by uom 
)
SELECT * FROM CTE_AS ORDER BY ID


