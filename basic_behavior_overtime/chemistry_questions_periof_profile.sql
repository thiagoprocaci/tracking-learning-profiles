
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
		from post p
		where p.id_community in (select c.id from community c where c.name = 'chemistry.stackexchange.com')
		and p.post_type =2
		and p.id_user is not null
		group by  p.id_user, p.period
		order by p.period
		
	)A inner join chemistry_user_profile u on u.id = A.id_user
	group by u.profile, A.period
	order by   A.period , u.profile
