select  
u.id,
u.reputation,
u.id_community,
u.profile_1,
u.profile_2,
(select count(*) from chemistry_question q where q.id_user = u.id ) as questions,
(select count(*) from chemistry_answer a where a.id_user = u.id ) as answers,
(select count(*) from chemistry_comment c where c.id_user = u.id ) as comments

from chemistry_user_profile u
order by u.reputation
