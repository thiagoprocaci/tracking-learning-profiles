select count(*) numberQuestions, u.profile_1 from biology_question q
inner join biology_user_profile u on q.id_user = u.id
group by u.profile_1

select count(*) numberQuestions, u.profile_2 from biology_question q
inner join biology_user_profile u on q.id_user = u.id
group by u.profile_2
