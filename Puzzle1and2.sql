/*
--https://msbiskills.com/2012/07/19/t-sql-1/
--https://msbiskills.com/2012/07/19/t-sql-2/
Link to the puzzle.I have combined both the puzzles to come up with a single query.
*/

--Sol-1
;WITH LAG_CTE AS
(
SELECT 
BusinessEntityID,
SalesYear,
CurrentQuota,
ROW_NUMBER() OVER(ORDER BY SalesYear) r
FROM lag
)


SELECT 
L1.BusinessEntityID,
L1.SalesYear,
L1.CurrentQuota,
L2.CurrentQuota CurrentQuotaLag,
L3.CurrentQuota CurrentQuotaLead
FROM LAG_CTE L1
LEFT OUTER JOIN LAG_CTE L2 
ON L1.r=L2.R+1
LEFT OUTER JOIN LAG_CTE L3
ON L1.r+1=L3.r
ORDER BY L1.r

--sol 2

SELECT 
BusinessEntityId,
SalesYear,
CurrentQuota CurrentQuota,
LAG(CurrentQuota) OVER(ORDER BY SalesYear)  CurrentQuotaLag,
LEAD(CurrentQuota) OVER(ORDER BY SalesYear)  CurrentQuotaLead
FROM LAG