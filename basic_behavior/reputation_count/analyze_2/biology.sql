select profile, 
min(reputation) as minRep,
max(reputation) as maxRep ,
count(*) as profileTotalUser, 
(100 * count(*)/(select count(*) from biology_user_profile)) as percent
from biology_user_profile 
group by profile_2