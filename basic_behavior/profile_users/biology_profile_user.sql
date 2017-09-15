select   
(select count(*) from biology_user_profile where profile = 1) as MIN_Q1,
(select count(*) from biology_user_profile where profile = 2) as Q1_MEDIAN,
(select count(*) from biology_user_profile where profile = 3) as MEDIAN_Q3,
(select count(*) from biology_user_profile where profile = 4) as Q3_MAX
from dual
