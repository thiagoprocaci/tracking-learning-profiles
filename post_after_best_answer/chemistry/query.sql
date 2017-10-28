
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

-----------------------------------------------


select B.question_id ,
	case 
		when count(*) = 1 then 'no_answer_after_best'
		when count(*) > 1 then 'answer_after_best'
	end as has_answer_after_best
	from (
	select A.question_id, A.answer_type, count(*) as answers_count from (
		select q.id as question_id, 
			 best.creation_date as best_date,
			 a.creation_date as answer_date,
			 case 
			 	when  best.creation_date < a.creation_date then 'post_after_best'
			 	when	best.creation_date >= a.creation_date then 'post_before_best'
			 end as answer_type
		from chemistry_question q 
			inner join chemistry_answer a on a.parent_post_comm_id = q.id_post_comm
			inner join chemistry_answer best on best.id_post_comm = q.accepted_answer_comm_id
		where  q.accepted_answer_comm_id is not null
	)A group by A.question_id, A.answer_type order by A.question_id
	
) B group by B.question_id



