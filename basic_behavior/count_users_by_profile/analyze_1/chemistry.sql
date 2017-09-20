select   
(select count(*) from chemistry_user_profile where profile_1 = 1) as profile_1,
(select count(*) from chemistry_user_profile where profile_1 = 4) as profile_4
from dual
