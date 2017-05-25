/*
--https://msbiskills.com/2015/03/25/t-sql-query-the-work-order-puzzle/
*/

--SOL 1

SELECT WorkOrderID FROM WorkOrders W WHERE STEP_NBR=0 AND STEP_STATUS='C'
AND W.WorkOrderID IN(SELECT WorkOrderID FROM WorkOrders C WHERE C.WorkOrderID=W.WorkOrderID AND STEP_STATUS='W')

--SOL 2

SELECT DISTINCT W1.WorkOrderID FROM WorkOrders W1
JOIN (SELECT * FROM WorkOrders WHERE STEP_NBR=0 AND STEP_STATUS='C') W2
ON W1.WorkOrderID=W2.WorkOrderID AND W1.STEP_NBR=W2.STEP_NBR AND W1.STEP_STATUS=W2.STEP_STATUS
JOIN (SELECT * FROM WorkOrders WHERE  STEP_STATUS='W') W3
ON W3.WorkOrderID=W2.WorkOrderID

