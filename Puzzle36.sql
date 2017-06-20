DECLARE @Scores TABLE
(
YearMonth   INT,
Score       INT
)
 
INSERT @Scores VALUES(200903, 100)
INSERT @Scores VALUES(200803, 95)
INSERT @Scores VALUES(200802, 99)
INSERT @Scores VALUES(200801 ,100)
INSERT @Scores VALUES(200711, 100)

;WITH CTE_DT1 
AS(
SELECT convert(date,CONVERT(varchar(10),CONCAT(YearMonth,'01'),101)) YearMonth,SCORE FROM @Scores)
,CTE_DT2 AS(
SELECT * ,ROW_NUMBER() OVER(ORDER BY YEAR(YearMonth),MONTH(YearMonth)) RNK FROM CTE_DT1 )

,dates 
as(
    select YearMonth  as dt, 1 cnt  FROM CTE_DT2 where rnk=1
    union all
    select DATEADD(mm,1,dt) AS dt,cnt+1 cnt from dates where dt<(SELECT YearMonth FROM CTE_DT2 where rnk=5) 
)
,OP_SEM AS(
SELECT 
coalesce(d.dt,cd.YearMonth) YearMonth,
Score
from dates d
LEFT OUTER JOIN CTE_DT2 CD
ON YEAR(d.dt)=YEAR(CD.YearMonth) and month(d.dt)=month(cd.YearMonth)
)

SELECT S.YearMonth,CASE WHEN S.Score IS NULL THEN (SELECT TOP 1 Score FROM OP_SEM S1 
WHERE S1.Score IS NOT NULL AND S1.YearMonth<S.YearMonth ORDER BY YearMonth DESC) 
ELSE S.SCORE END SCORE
FROM OP_SEM S