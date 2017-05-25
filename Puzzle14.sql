/*
--https://msbiskills.com/2015/03/26/t-sql-query-the-football-puzzle/
*/
--SOL 1
SELECT f1.club_name  FROM tr_football_league f1
where year_100th_champion=1 and f1.club_id in 
(SELECT club_id FROM tr_football_league GROUP BY CLUB_ID HAVING COUNT(CLUB_ID)>=
(SELECT TOP 1 COUNT(CLUB_ID) FROM tr_football_league  GROUP BY CLUB_ID ORDER BY COUNT(CLUB_ID) DESC)  )