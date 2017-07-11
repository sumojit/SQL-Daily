/*
--https://msbiskills.com/2015/04/06/t-sql-query-find-2nd-highest-salary-using-top-clause/
*/
--Check data
SELECT N.Name,N.Salary FROM (
SELECT TOP 1 * FROM(
SELECT 
TOP 2
Name,Salary 
FROM NthHighest
ORDER BY Salary DESC) A
ORDER BY SALARY ASC) B
JOIN NthHighest N
ON B.Salary=N.Salary








