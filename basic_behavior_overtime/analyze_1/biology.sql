select
 	u.profile_1 ,
	a.period,
	 count(a.id) as myCount,
	(select 'answers' from dual) as description 	
from biology_answer a
inner join biology_user_profile u
on u.id = a.id_user
group by u.profile_1, a.period
 union all
 
 select
 	u.profile_1 ,
	q.period,
	 count(q.id) as myCount,
	(select 'questions' from dual) as description 	
from biology_question q
inner join biology_user_profile u
on u.id = q.id_user
group by u.profile_1, q.period

union all
 
 select
 	u.profile_1 ,
	c.period,
	 count(c.id) as myCount,
	(select 'comments' from dual) as description 	
from biology_comment c
inner join biology_user_profile u
on u.id = c.id_user
group by u.profile_1, c.period
