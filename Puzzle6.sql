/*
--https://msbiskills.com/2010/08/03/nth-highest-salary-in-sql-server-2005-%E2%80%93-generic-logic-2/
*/
 SELECT * FROM NthHighest
--SOL 1
WITH CTE_RNK AS(
SELECT 
Name,
Salary,
RANK() OVER(ORDER BY Salary DESC) RNK
FROM
NthHighest)

SELECT Name,Salary FROM CTE_RNK WHERE RNK=2

--SOL 2
SELECT TOP 1 * FROM(
SELECT TOP 2
Name,
Salary
FROM 
NthHighest
ORDER BY Salary Desc)A
ORDER BY Salary