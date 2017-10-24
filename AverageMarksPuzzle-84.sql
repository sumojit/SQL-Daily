/*
--https://msbiskills.com/2015/05/10/t-sql-query-the-average-marks-puzzle/
*/


--SOL1
WITH CTE_AVG_MK AS(
SELECT 
SSubject,AVG(SMarks) AVGMRK 
FROM Neeraj GROUP BY SSubject)

SELECT N.Sname,N.SSubject,N.SMarks FROM CTE_AVG_MK A
JOIN Neeraj N
ON A.SSubject=N.SSubject
WHERE N.SMarks>A.AVGMRK

--SOL2
SELECT N.Sname,N.SSubject,N.SMarks FROM Neeraj N JOIN (
SELECT 
SSubject,AVG(SMarks) AVGMRK 
FROM Neeraj GROUP BY SSubject) A
ON A.SSubject=N.SSubject
WHERE N.SMarks>A.AVGMRK