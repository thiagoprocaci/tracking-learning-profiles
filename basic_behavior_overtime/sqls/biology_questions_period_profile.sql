
	select 
		u.profile ,
		A.period	,
		A.questions as myCount,
		(select 'question' from dual) as description
	from (
	
		select 
			p.id_user,
			p.period,
			count(*) as questions 
		from biology_question p
		where 
		 p.id_user is not null
		group by  p.id_user, p.period
		order by p.period
		
	)A inner join biology_user_profile u on u.id = A.id_user
	group by u.profile, A.period
	order by   A.period , u.profile
