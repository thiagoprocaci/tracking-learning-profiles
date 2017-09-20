select   

(select count(*) from biology_user_profile where profile_2 = 1) as profile_1,

(select count(*) from biology_user_profile where profile_2 = 4) as profile_4

from dual

