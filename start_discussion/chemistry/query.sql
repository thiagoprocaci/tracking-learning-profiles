select count(*) numberQuestions, u.profile_1 from chemistry_question q
inner join chemistry_user_profile u on q.id_user = u.id
group by u.profile_1

select count(*) numberQuestions, u.profile_2 from chemistry_question q
inner join chemistry_user_profile u on q.id_user = u.id
group by u.profile_2
