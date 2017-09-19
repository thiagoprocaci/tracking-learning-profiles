select  
u.id,
u.profile,
u.reputation,
(select avg(q.score) from chemistry_question q where q.id_user = u.id ) as avgScoreQuestion,
(select avg(a.score) from chemistry_answer a where a.id_user = u.id ) as avgScoreAnswers,
(select avg(c.score) from chemistry_comment c where c.id_user = u.id ) as avgScoreComments,
(select sum(q.score) from chemistry_question q where q.id_user = u.id ) as sumScoreQuestion,
(select sum(a.score) from chemistry_answer a where a.id_user = u.id ) as sumScoreAnswers,
(select sum(c.score) from chemistry_comment c where c.id_user = u.id ) as sumScoreComments

from chemistry_user_profile u
where u.profile > 0
order by u.reputation 

