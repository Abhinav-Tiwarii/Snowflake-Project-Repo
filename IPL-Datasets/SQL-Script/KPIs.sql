-----------------------------------------------------------------------------------------------
--1. Total number of matches played in each of the season.
select  year(date), count(id) from ipl_match group by year(date);

----------------------------------------------------------------------------------------------
--2. Most player of match
select player_of_match, count(player_of_match) as cnt_plyr_match from ipl_match 
group by player_of_match
--having count(player_of_match) > 1
order by cnt_plyr_match desc;

----------------------------------------------------------------------------------------------
--3. Most No. of Venues per match played 
select venue, count(id) as total_no_of_match from ipl_match
group by venue
order by total_no_of_match desc
limit 5;
----------------------------------------------------------------------------------------------
--4. Max Runs by any batsman
select max(total_runs_by_batsman) as Max_runs from 
(
select batsman, sum(total_runs) as total_runs_by_batsman from ipl_balls
group by batsman
order by total_runs_by_batsman desc);
----------------------------------------------------------------------------------------------

