/*
--https://msbiskills.com/2015/03/25/t-sql-query-fruit-count-puzzle/
*/
 
SELECT 
*
FROM FruitCount
pivot
(
count(fruit)
for fruit in([APPLE],
[LICHI],
[MANGO],
[ORANGE])
)pvt


