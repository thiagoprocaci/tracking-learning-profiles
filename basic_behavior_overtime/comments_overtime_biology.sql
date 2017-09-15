select 
	u.profile ,
	A.period,
	sum(A.questions) as totalCommentsInPeriod,
	(
		select 
			sum(B.totalCommentsInPeriod) 	
		from (
		
			select 
				u.profile ,
				A.period,
				sum(A.questions) as totalCommentsInPeriod
			from (
			
				select 
					p.id_user,
					p.period,
					count(*) as questions 
				from comment p
				where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
				and p.id_user is not null
				group by  p.id_user, p.period
				order by p.period
				
			)A inner join biology_user_profile u on u.id = A.id_user
			group by u.profile, A.period
			order by   A.period , u.profile
			
		)B where B.period <= A.period
		and B.profile = u.profile
		) as accumulatedSum
	
from (

	select 
		p.id_user,
		p.period,
		count(*) as questions 
	from comment p
	where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and p.id_user is not null
	group by  p.id_user, p.period
	order by p.period
	
)A inner join biology_user_profile u on u.id = A.id_user
group by u.profile, A.period
order by   A.period , u.profile
