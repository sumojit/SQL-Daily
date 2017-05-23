/*

--https://msbiskills.com/2015/03/25/t-sql-query-department-wise-2nd-highest-salary-puzzle/
*/
-- SOL 1
WITH CTE_EMP_MGR AS
(
SELECT EMPID,EMPNAME,EMPSALARY,DEPTID,RANK() OVER(PARTITION BY DEPTID ORDER BY EMPSALARY) RNK FROM Emps
)
SELECT C.EMPID,C.EMPNAME,C.EMPSALARY,D.DeptName FROM CTE_EMP_MGR C
JOIN Department D
ON C.DeptID=D.DeptID
WHERE C.RNK=2 



