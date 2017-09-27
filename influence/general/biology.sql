
select max(B.size), avg(B.size) from (
	select  A.dicussionID, 
				count(A.idUserParticipation) as size
					  
					  
					  from (
				select -- answers of a question
				q.id as dicussionID,
				q.period,
				u.id as idUserParticipation,
				u.profile_1 as profile1UserParticipation,
				u.profile_2 as profile2UserParticipation
				from biology_question q
				inner join biology_answer a on a.parent_post_comm_id = q.id_post_comm
				inner join biology_user_profile u on a.id_user = u.id
				union all
				select -- comments of the answers of the discussion
				q.id as dicussionID,
				q.period,
				u.id as idUserParticipation,
				u.profile_1 as profile1UserParticipation,
				u.profile_2 as profile2UserParticipation
				from biology_question q
				inner join biology_answer a on a.parent_post_comm_id = q.id_post_comm
				inner join biology_comment c on c.id_post = a.id
				inner join biology_user_profile u on c.id_user = u.id
				
				union all
				select -- comments of the question
				q.id as dicussionID,
				q.period,
				u.id as idUserParticipation,
				u.profile_1 as profile1UserParticipation,
				u.profile_2 as profile2UserParticipation
				from biology_question q
				inner join biology_comment c on c.id_post = q.id
				inner join biology_user_profile u on c.id_user = u.id
			) A group by A.dicussionID
			
			)B
