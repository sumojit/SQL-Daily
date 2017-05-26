/*
--https://msbiskills.com/2015/03/24/t-sql-query-consecutive-wins-for-india-puzzle/
*/
with cte_ser as
(
SELECT TeamA,TeamB,MatchDate,WinsBy,row_number() over(order by matchdate asc) as cnt FROM IndAusSeries 
)
,cte_ser1 as(
select TeamA,TeamB,WinsBy,MatchDate,count(*) freq,1 blk from cte_ser where cnt<(select cnt from cte_ser where Winsby='Aus')
group by TeamA,TeamB,WinsBy,MatchDate
union all
select TeamA,TeamB,WinsBy,MatchDate,count(*) freq,2 blk from cte_ser where cnt>(select cnt from cte_ser where Winsby='Aus')
group by TeamA,TeamB,WinsBy,MatchDate
)

,cte_ser2 as
(
select top 1 * from (
select sum(freq) cntwins,blk from cte_ser1 group by blk) a
order by cntwins desc
)

select s1.TeamA,s1.TeamB,s1.matchdate,s1.WinsBy from cte_ser1 s1 join cte_ser2 s2
on s1.blk=s2.blk