
select 

		count(u.id) as totalPost,
		u.id as userId,
		u.profile_1  ,
	   u.profile_2
 from chemistry_answer answer 
inner join chemistry_user_profile u on answer.id_user = u.id
 where answer.id_post_comm not in (
	select q.accepted_answer_comm_id from chemistry_question q where q.accepted_answer_comm_id is not null
) 
group by  u.id




