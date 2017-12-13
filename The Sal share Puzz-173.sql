/*
--https://msbiskills.com/2016/06/24/sql-puzzle-the-salary-share-puzzle/
*/
--SOLN1 USING WINDOWS FUNCTION...
SELECT 
distinct 
deptno,
round((sum(empsal) over(partition by deptno) /
sum(empsal) over(order by (select null)))*100,2) '% share'
FROM SalaryDistributionAcrossDept

--SOLN2 USING GROUP BY FUNCTION...
SELECT 
DEPTNO,
ROUND((SUM(EMPSAL)/(SELECT SUM(EMPSAL) FROM SalaryDistributionAcrossDept))*100,2) '% Share'
FROM SalaryDistributionAcrossDept
GROUP BY DEPTNO
