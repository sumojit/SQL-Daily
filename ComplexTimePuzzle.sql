/*
--https://msbiskills.com/2015/04/23/t-sql-query-the-complex-time-puzzle/
*/
with cte as 
(
select ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - ID  rnum,
id,
tim

from Flag
)

SELECT 
isnull([1],'00:00:00') Time1,
isnull([2],'00:00:00') Time2
FROM 
cte
pivot
(
max(tim)
for id in ([1],[2])
)pvt






 