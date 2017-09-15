select  
u.id,
u.profile,
u.reputation,
(select avg(q.score) from biology_question q where q.id_user = u.id ) as avgScoreQuestion,
(select avg(a.score) from biology_answer a where a.id_user = u.id ) as avgScoreAnswers,
(select avg(c.score) from biology_comment c where c.id_user = u.id ) as avgScoreComments,
(select sum(q.score) from biology_question q where q.id_user = u.id ) as sumScoreQuestion,
(select sum(a.score) from biology_answer a where a.id_user = u.id ) as sumScoreAnswers,
(select sum(c.score) from biology_comment c where c.id_user = u.id ) as sumScoreComments

from biology_user_profile u
where u.profile > 1
order by u.reputation 

