	select count(distinct p.id) as totalBestAnswers, 
				u.profile as profile, 
				 p.period as period
				from post p 
	inner join chemistry_user_profile u on p.id_user = u.id	
	where p.id_post_comm in (	
		select p.accepted_answer_comm_id
		from post p where p.accepted_answer_comm_id is not null and p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')	
	) 	
	and p.id_community in (select c.id from community c where c.name = 'chemistry.stackexchange.com')	
	group by u.profile, p.period order by  p.period,  u.profile
	