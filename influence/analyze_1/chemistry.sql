select 
	C.period,
	avg(C.size) as avgSize,
	C.containsOutstanding 
 from (
	
	select 
		B.dicussionID,
		B.period,
		B.userCountByProfile as size,
		case when sum(B.profile_1) > 1 then 1
			  when sum(B.profile_1) = 1 then 0
		end as 'containsOutstanding'	  
		from (
	
			select  A.dicussionID, 
					  A.period,
					  A.profile1UserParticipation as profile_1,
					  count(*) as userCountByProfile
					  
					  
					  from (
				select -- answers of a question
				q.id as dicussionID,
				q.period,
				u.id as idUserParticipation,
				u.profile_1 as profile1UserParticipation,
				u.profile_2 as profile2UserParticipation
				from chemistry_question q
				inner join chemistry_answer a on a.parent_post_comm_id = q.id_post_comm
				inner join chemistry_user_profile u on a.id_user = u.id
				union all
				select -- comments of the answers of the discussion
				q.id as dicussionID,
				q.period,
				u.id as idUserParticipation,
				u.profile_1 as profile1UserParticipation,
				u.profile_2 as profile2UserParticipation
				from chemistry_question q
				inner join chemistry_answer a on a.parent_post_comm_id = q.id_post_comm
				inner join chemistry_comment c on c.id_post = a.id
				inner join chemistry_user_profile u on c.id_user = u.id
				
				union all
				select -- comments of the question
				q.id as dicussionID,
				q.period,
				u.id as idUserParticipation,
				u.profile_1 as profile1UserParticipation,
				u.profile_2 as profile2UserParticipation
				from chemistry_question q
				inner join chemistry_comment c on c.id_post = q.id
				inner join chemistry_user_profile u on c.id_user = u.id
			) A group by A.dicussionID, A.profile1UserParticipation
			
			)B 
			group by B.dicussionID 
			
		)C group by C.period, C.containsOutstanding order by C.period