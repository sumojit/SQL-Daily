/*
--https://msbiskills.com/2015/03/23/t-sql-query-the-case-replace-puzzle/#comments
*/

WITH CTE_RNK AS(
SELECT Vals,ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) RNUM FROM [RangeValues])


SELECT VALS,CHOOSE(RNUM ,100,300,200,100) CASEVALS FROM CTE_RNK


 