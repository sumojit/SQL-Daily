--Verify Data

/*
--https://msbiskills.com/2015/03/25/t-sql-query-the-friday-salary-puzzle/
*/
SELECT 
ID,
Name,
Salary,
DOJ,
CASE WHEN 
DATEDIFF(DD,DATEADD(DD,1,EOMONTH(DOJ,-1)),DOJ) >=15
THEN
  --DATEADD(MM,1,DATEADD(DD,CHOOSE(DATEPART(weekday,EOMONTH(DOJ)),-2,-3,-4,-5,-6,0),EOMONTH(DOJ) ) )
  DATEADD(DD,CHOOSE(DATEPART(weekday,EOMONTH(DATEADD(MM,1,DOJ))),-2,-3,-4,-5,-6,0,-1),EOMONTH(DATEADD(MM,1,DOJ))) 
ELSE
DATEADD(DD,CHOOSE(DATEPART(weekday,EOMONTH(DOJ)),-2,-3,-4,-5,-6,0),EOMONTH(DOJ) )   
END LWF
FROM [EmployeeSalary]
ORDER BY DATEPART(weekday,EOMONTH(DOJ))
