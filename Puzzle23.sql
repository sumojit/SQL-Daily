/*
--https://msbiskills.com/2015/03/23/t-sql-query-the-ticket-approver-puzzle/
*/
with cte_tkt as(
SELECT TicketID ,ID,Name,ApprovedBy FROM 
TicketDetails td join
Approver ap on
td.CreatedBy=ap.ID
)

select c.TicketID,c.Name,a.Name ApprovedBy from cte_tkt c
join Approver a
on c.ApprovedBy=a.ID
order by TicketID
