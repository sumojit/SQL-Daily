/*

--https://msbiskills.com/2015/10/07/sql-puzzle-convert-a-string-into-a-table-n-number-of-times-n-length-of-the-string/
*/

WITH CTE_DATA_LEN AS
(
SELECT VALUE,DATALENGTH(VALUE) LN

 FROM PrintLengthTimes
)
,CTE_PN AS
(
SELECT VALUE,1 AS CNT ,LN FROM CTE_DATA_LEN
UNION ALL
SELECT VALUE,CNT+1 AS CNT,LN FROM CTE_PN WHERE CNT+1<=LN
)

SELECT VALUE FROM CTE_PN ORDER BY VALUE