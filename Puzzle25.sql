/*
--https://msbiskills.com/2015/03/24/t-sql-query-year-month-wise-data-the-pivot-puzzle/
*/
SELECT 
*
FROM 
TestTranspose
pivot
(
max(amount)
for month1 in([Jan],[Feb],[Mar])
)pvt