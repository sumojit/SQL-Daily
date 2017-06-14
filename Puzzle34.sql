/*
--https://msbiskills.com/2015/03/31/t-sql-query-the-manage-and-employee-puzzle-2/
*/
WITH CTE_MGR AS(
SELECT
id as eid,NAME CNAME,DEPT CDEPT,Manager CMGR
FROM Complex WHERE MANAGER=''

UNION ALL

SELECT id id,NAME CNAME,DEPT CDEPT,Manager  CMGR 
FROM CTE_MGR CMGR 
JOIN Complex C ON CMGR.eID=C.Manager

)

SELECT C1.CNAME,
CASE WHEN C1.CDEPT=LAG(C1.CDEPT) OVER(ORDER BY C1.CDEPT) THEN '' ELSE C1.CDEPT END CDEPT,
CASE WHEN C2.CNAME=LAG(C2.CNAME) OVER(ORDER BY C2.CNAME) THEN '' ELSE C2.CNAME END MGR
FROM CTE_MGR C1 JOIN CTE_MGR C2 ON C1.CMGR=C2.eid


