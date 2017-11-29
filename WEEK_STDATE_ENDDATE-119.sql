/*
--https://msbiskills.com/2015/12/18/sql-puzzle-get-weeks-start-date-end-date-for-a-month-year/
*/


WITH GEN_DAT AS
(
SELECT DATEFROMPARTS(2015,12,1) STDATE ,
DATENAME(DW,DATEFROMPARTS(2015,12,1)) NM,
(DATEPART(WEEK,DATEFROMPARTS(2015,12,1))) WKNUM
UNION ALL
SELECT DATEADD(D,1,STDATE) STDATE,
DATENAME(DW,DATEADD(D,1,STDATE)) NM ,
(DATEPART(WEEK,DATEADD(D,1,STDATE))) WKNUM 
FROM GEN_DAT
WHERE STDATE<DATEFROMPARTS(2015,12,31)
)


SELECT 
CASE WHEN (MONTH(DATEADD(DAY,-1,MIN(STDATE)))<MONTH(MIN(STDATE))) OR((MONTH(DATEADD(DAY,1,MIN(STDATE)))<MONTH(MIN(STDATE)))) THEN
MIN(STDATE)
ELSE 
DATEADD(DAY,1,MIN(STDATE)) END WEEKSTDATE,
CASE WHEN YEAR(DATEADD(DAY,1,MAX(STDATE)))>YEAR(DATEFROMPARTS(2015,12,1) ) THEN
MAX(STDATE)
ELSE 
DATEADD(DAY,1,MAX(STDATE)) END WEEKENDDATE
FROM GEN_DAT 
GROUP BY WKNUM
OPTION (MAXRECURSION 0)
 

 