/*
--https://msbiskills.com/2015/03/31/t-sql-query-group-by-remove-null-uom-puzzle/
*/
with cte_t1 as
(
SELECT 
id,
rank() over(order by servicetype) grp,
servicetype,
uom,
cost,
usage
FROM UOMs
)
,cte_t2 as
(
select 
grp gr,
max(grp) grp1,
max(uom) uom_ref 
from cte_t1 
group by grp
)
,cte_t3 as(
select 
servicetype,
case when uom is null then c2.uom_ref else uom end uom,
cost,
usage
from cte_t1 c1
join cte_t2 c2 on c1.grp=c2.gr)

select 
max(uom) uom,
max(servicetype) servicetype,
sum(cost) cost,
max(usage)  usage
from cte_t3
group by servicetype,uom
order by servicetype