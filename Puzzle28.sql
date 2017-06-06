/*
--https://msbiskills.com/2015/03/26/t-sql-query-male-and-female-count-puzzle/
*/ 
--Verify Data
with cte_rnk as (
SELECT 
NAME,
Gender,
row_number() over(partition by gender order by gender)  cnt
FROM 
GenderCount)

select F FemaleCount ,M as MaleCount 
from (select gender,cnt from cte_rnk ) a
pivot
(
max(cnt)
for Gender in([M],[F])
)pvt





