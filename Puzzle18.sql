
/*
--https://msbiskills.com/2015/03/25/t-sql-query-ignore-duplicate-values-while-selecting-data/
*/ 
SELECT a,b FROM Test2DistinctCount group by a,b having count(*)>=1