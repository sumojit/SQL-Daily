/*
--https://msbiskills.com/2015/03/23/473/
*/

with cte_sol1 as(
SELECT 
PatientID,
AdmissionDate,
DischargeDate,
isnull(DATEDIFF(DD,LAG(DischargeDate) OVER(PARTITION BY PatientID ORDER BY AdmissionDate),AdmissionDate)
,DATEDIFF(DD,DischargeDate,Lead(AdmissionDate) OVER(PARTITION BY PatientID ORDER BY AdmissionDate))) grp
,Cost 
FROM PatientProblem)

,ctesol2 AS(
select PatientID,
AdmissionDate,
DischargeDate,
case when DATEDIFF(DD,LAG(DischargeDate) OVER(PARTITION BY PatientID ORDER BY AdmissionDate),AdmissionDate)=1
then
grp*lag(grp) OVER(PARTITION BY PatientID ORDER BY AdmissionDate)
else grp
end  grpsum,
cost
from  cte_sol1)

SELECT PatientID,MIN(AdmissionDate) AdmissionDate,MAX(DischargeDate) DischargeDate ,SUM(COST) COST
FROM ctesol2
GROUP BY PatientID,grpsum
ORDER BY PatientID

