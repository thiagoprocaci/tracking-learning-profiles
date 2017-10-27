
select -- accepted.id, 
		-- afterAccepted.id,
		-- accepted.parent_post_comm_id,
		-- afterAccepted.parent_post_comm_id,

		count(u.id) as totalPost,
		u.id as userId,
		u.profile_1 ,
	 	u.profile_2
 from chemistry_answer accepted 
inner join chemistry_answer afterAccepted on afterAccepted.parent_post_comm_id = accepted.parent_post_comm_id
inner join chemistry_user_profile u on afterAccepted.id_user = u.id
 where accepted.id_post_comm in (
	select q.accepted_answer_comm_id from chemistry_question q where q.accepted_answer_comm_id is not null
) and accepted.creation_date < afterAccepted.creation_date 

group by   u.id



