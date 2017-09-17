select 
q.id as questionId,
q.id_post_comm as questionCommId,
a.id as answerId,
u.id as userId,
u.profile,
q.period,
(select 'biology' from dual ) as communityName

from biology_answer a
inner join biology_user_profile u
on u.id = a.id_user
inner join biology_question q
on q.id_post_comm = a.parent_post_comm_id

union all

select 
q.id as questionId,
q.id_post_comm as questionCommId,
a.id as answerId,
u.id as userId,
u.profile,
q.period,
(select 'chemistry' from dual ) as communityName

from chemistry_answer a
inner join chemistry_user_profile u
on u.id = a.id_user
inner join chemistry_question q
on q.id_post_comm = a.parent_post_comm_id