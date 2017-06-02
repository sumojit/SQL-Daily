/*
--https://msbiskills.com/2015/03/23/t-sql-query-the-company-code-puzzle/
*/ 
;with cte_cc as
(select *,ROW_NUMBER() over(order by (select null)) od from TheCompanyCode)

select a,b,c,companycode,gl from(
select * from  cte_cc where c=1
union all
SELECT case when a=b  then null else a end a,case when a=b  then null else b end b,c,case when a=b  then null else CompanyCode end CompanyCode,GL,od
FROM cte_cc where c<>1) temp
order by od


