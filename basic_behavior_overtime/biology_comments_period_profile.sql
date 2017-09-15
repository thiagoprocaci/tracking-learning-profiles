select 
	u.profile ,
	A.period,
	A.comments as myCount,
	(select 'comment' from dual) as description
from (

	select 
		p.id_user,
		p.period,
		count(*) as comments 
	from comment p
	where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and p.id_user is not null
	group by  p.id_user, p.period
	order by p.period
	
)A inner join biology_user_profile u on u.id = A.id_user
group by u.profile, A.period
order by   A.period , u.profile
