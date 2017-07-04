/*
--https://msbiskills.com/2015/04/06/t-sql-query-the-student-and-the-marks-puzzle/
*/
with cte_mks as(
SELECT BM.STUID,BM.STUNAME,bmarks,SMARKS,EMARKS,(sum(bmarks) +sum(SMARKS) +sum(EMARKS))/2 tot_EMARKS
FROM BM 
JOIN SM ON BM.STUID=SM.STUID
JOIN EM ON SM.STUID=EM.STUID
group by 
BM.STUID,BM.STUNAME,bmarks,SMARKS,EMARKS)

SELECT STUID,STUNAME,
CASE WHEN tot_EMARKS <=40 THEN 'FAIL' 
WHEN tot_EMARKS>40 AND tot_EMARKS<=120 THEN 'PASS'
ELSE
'EXCELLENT' END PERFORMANCE
FROM cte_mks

