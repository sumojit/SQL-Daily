/*
--https://msbiskills.com/2015/05/06/t-sql-query-the-grouping-puzzle/
*/

;WITH CTE_CAL AS (
SELECT 
[day],leva,levb,1 as cnt
FROM 
tbl
where day=18
union all
SELECT 
t.[day],t.leva,t.levb,case when t.leva=c.leva then cnt else cnt+1 end cnt 
FROM CTE_CAL c
join tbl t
on c.[day]+1= t.[day]

)
select 
min([day]) [from],
max([day]) [to],
leva,
levb
from CTE_CAL
group by leva,
levb,cnt
order by [from]