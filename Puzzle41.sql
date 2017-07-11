/*
--https://msbiskills.com/2015/04/06/t-sql-query-airplanes-and-pilots-puzzle/
*/
with cte_pl as(
SELECT pilot,count(*) cnt FROM PilotSkills p
JOIN Hangar H ON
P.Plane=H.Plane
group by pilot 
having count(*)=(select count(*) from Hangar)
)

select 
pilot 
from  cte_pl p1 

