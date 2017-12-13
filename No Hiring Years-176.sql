/*
--https://msbiskills.com/2016/06/29/sql-server-puzzle-no-hiring-years-puzzle/
*/
WITH CTE_RN_DT 
AS
(
SELECT CAST('1975-02-21' AS DATE) ST_DATE 
UNION ALL
SELECT DATEADD(YY,1,ST_DATE) ST_DATE FROM CTE_RN_DT
WHERE DATEADD(YY,1,ST_DATE)<GETDATE()
)
,CTE_Q_DT 
AS
(
SELECT C.ST_DATE FROM CTE_RN_DT C
WHERE  NOT EXISTS(
SELECT HIRE_DATE FROM 
EMPLOYEES_N WHERE YEAR(HIRE_DATE)=YEAR(C.ST_DATE))
)

SELECT CONCAT(MIN(YEAR(ST_DATE)),'-',MAX(YEAR(ST_DATE))) YEARS FROM(
SELECT ST_DATE,YEAR(ST_DATE)-ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) GRP 
FROM CTE_Q_DT)PVT
GROUP BY GRP

