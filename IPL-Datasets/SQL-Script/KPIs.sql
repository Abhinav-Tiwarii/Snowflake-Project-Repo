--1. Total number of matches played in each of the season.
select  year(date), count(id) from ipl_match group by year(date);

--2. Most player of match

select player_of_match, count(player_of_match) as cnt_plyr_match from ipl_match 
group by player_of_match
--having count(player_of_match) > 1
order by cnt_plyr_match desc;
