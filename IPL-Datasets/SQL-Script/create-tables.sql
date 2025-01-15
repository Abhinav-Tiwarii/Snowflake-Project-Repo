

create stage sql_project_prac_stg;

--Creating Table--
create or replace table ipl_match
(
id number primary key,
city varchar,
date date,
player_of_match varchar(25),
venue varchar(100),
neutral_venue varchar(50),
team1 string,
team2 string,
toss_winner string,
toss_decision varchar(5),
winner string ,
result string,
result_margin VARCHAR(10),
eliminator string,
method string,
umpire1 string,
umpire2 string);

--Create File Format--
create OR REPLACE file format sql_project_prac.csv_file_format 
        type = 'csv' 
        date_format = 'DD-MM-YYYY'
        compression = 'auto' 
        field_delimiter = ',' 
        record_delimiter = '\n' 
        skip_header = 1 
        field_optionally_enclosed_by = '\042' 
        null_if = ('\\N');

--Copy Into ipl_match
COPY INTO ipl_match FROM @sql_project_prac_stg
file_format = (format_name = 'csv_file_format')
PATTERN = '.*IPL Matches 2008-2020.csv$'
ON_ERROR = 'CONTINUE'
;

-- create table IPL_BALLS --
CREATE or replace TABLE IPL_BALLS
(
id int,
inning int,
over int,
ball int,
batsman varchar(50),
non_striker varchar(50),
bowler varchar(50),
batsaman_runs int,
extra_runes int,
total_runs int,
non_boundary varchar(50),
is_wicket varchar(50),
dismissal_kind varchar(50),
player_dismissed varchar(50),
fielder varchar(50),
extras_type varchar(10),
batting_team string,
bowling_team string);

-- Copy Into IPL_BALLS --
copy into IPL_BALLS from @ABHI_PRAC.SQL_PROJECT_PRAC.SQL_PROJECT_PRAC_STG
file_format = 'ABHI_PRAC.SQL_PROJECT_PRAC.CSV_FILE_FORMAT'
pattern = '.*IPL Ball-by-Ball 2008-2020.csv'
on_error = 'Continue';
