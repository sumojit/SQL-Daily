/*
--https://msbiskills.com/2015/03/23/t-sql-query-the-running-balance-puzzle/
*/
with cte_bank as(
SELECT 
Dt,
CID,
TransactionType,
case when TransactionType='CR' THEN
Amount
ELSE 
-1 *Amount 
END CalAmount,
amount
FROM FindRunningBalance)

SELECT 
Dt,
CID c1_cid,
TransactionType, 
amount,
SUM(CalAmount) OVER(PARTITION BY CID ORDER BY DT 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) FindRunningBalance
FROM cte_bank
