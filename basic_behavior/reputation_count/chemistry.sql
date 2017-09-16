select profile, 
min(reputation) as minRep,
max(reputation) as maxRep ,
count(*) as profileTotalUser, 
(100 * count(*)/(select count(*) from chemistry_user_profile)) as percent
from chemistry_user_profile 
group by profile