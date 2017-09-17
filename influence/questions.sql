select * from (
select 
	q.id as questionId,
	q.id_post_comm as questionCommId,
	u.id as userId,
	q.id_community,
	q.answer_count,
	q.comment_count,
	(q.answer_count + q.comment_count) as discussionSize,
	(select 'biology' from dual ) as communityName,
	u.profile,
	q.period
from biology_question q
inner join biology_user_profile u
on q.id_user = u.id


union all

select 
	q.id as questionId,
	q.id_post_comm as questionCommId,
	u.id as userId,
	q.id_community,	
	q.answer_count,
	q.comment_count,
	(q.answer_count + q.comment_count) as discussionSize,
	
	(select 'chemistry' from dual ) as communityName,
	u.profile,
	q.period
from chemistry_question q
inner join chemistry_user_profile u
on q.id_user = u.id

) A order by A.communityName, A.period