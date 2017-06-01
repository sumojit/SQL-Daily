/*
--https://msbiskills.com/2015/03/26/t-sql-query-the-fishbone-salary-puzzle/
*/

SELECT * FROM Salaries
PIVOT(
MAX(SAL_AMT)
FOR SAL_DATE IN([1996-06-20],
[1996-07-20],
[1996-08-20],
[1996-09-20],
[1996-10-20],
[1996-12-20]) )PVT