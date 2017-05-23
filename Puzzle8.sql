/*
--https://msbiskills.com/2015/03/20/t-sql-query-developer-salary-the-manager-puzzle/
*/

--SOL 1
SELECT E1.EMPID,E1.EMPNAME,E1.EMPSALARY FROM [EmpSalaryGreaterManager] E1 
WHERE E1.EMPSALARY >(SELECT E2.EMPSALARY FROM [EmpSalaryGreaterManager] E2 WHERE E1.MGRID=E2.EMPID)

