/*
--https://msbiskills.com/2016/03/07/sql-puzzle-the-sum-puzzle/
*/
--sol 1
SELECT C.ID, C.COST,Q.QUANTITY FROM
(
SELECT ID,SUM(COST) COST FROM TheSumPuzzle
GROUP BY ID)C
JOIN(
SELECT ID,SUM(QUANTITY) QUANTITY FROM(
SELECT ID,QUANTITY FROM TheSumPuzzle
GROUP BY ID,QUANTITY)PVT2
GROUP BY ID)Q
ON C.ID=Q.ID

--sol 2
WITH CTE_AS AS(
SELECT *,ROW_NUMBER() OVER(ORDER BY ID) RNUM FROM TheSumPuzzle
)

,CTE_AS1 AS(
SELECT A1.ID,sum(isnull(A1.COST,0))+sum(isnull(a2.cost,0)) Cost,
CASE WHEN sum(A1.QUANTITY)=sum(A2.QUANTITY )
THEN MAX(A1.QUANTITY) ELSE SUM(isnull(A1.QUANTITY,0))+sum(isnull(a2.quantity,0))  END  Quantity
FROM CTE_AS A1
 JOIN CTE_AS A2
ON A1.RNUM<A2.RNUM AND A1.ID=A2.ID
GROUP BY A1.ID)

SELECT ID,COST,Quantity FROM CTE_AS1
UNION
SELECT ID,COST,Quantity FROM CTE_AS WHERE ID NOT IN (SELECT ID FROM CTE_AS1)




