select 
	(select 'answers' from dual) as post_type,
	u.profile ,
	A.period,
	sum(A.posts) as totalAnswersInPeriod,
	(
		select 
			sum(B.totalAnswersInPeriod) 	
		from (
		
			select 
				u.profile ,
				A.period,
				sum(A.posts) as totalAnswersInPeriod
			from (
			
				select 
					p.id_user,
					p.period,
					count(*) as posts 
				from post p
				where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
				and p.post_type =2
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
		count(*) as posts 
	from post p
	where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and p.post_type =2
	and p.id_user is not null
	group by  p.id_user, p.period
	order by p.period
	
)A inner join biology_user_profile u on u.id = A.id_user
group by u.profile, A.period
-- order by   A.period , u.profile

union all

select 
	(select 'questions' from dual) as post_type,
	u.profile ,
	A.period,
	sum(A.posts) as totalAnswersInPeriod,
	(
		select 
			sum(B.totalAnswersInPeriod) 	
		from (
		
			select 
				u.profile ,
				A.period,
				sum(A.posts) as totalAnswersInPeriod
			from (
			
				select 
					p.id_user,
					p.period,
					count(*) as posts 
				from post p
				where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
				and p.post_type =1
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
		count(*) as posts 
	from post p
	where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and p.post_type =1
	and p.id_user is not null
	group by  p.id_user, p.period
	order by p.period
	
)A inner join biology_user_profile u on u.id = A.id_user
group by u.profile, A.period
-- order by   A.period , u.profile

union all

select 
	(select 'comment' from dual) as post_type,
	u.profile ,
	A.period,
	sum(A.posts) as totalAnswersInPeriod,
	(
		select 
			sum(B.totalAnswersInPeriod) 	
		from (
		
			select 
				u.profile ,
				A.period,
				sum(A.posts) as totalAnswersInPeriod
			from (
			
				select 
					p.id_user,
					p.period,
					count(*) as posts 
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
		count(*) as posts 
	from comment p
	where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and p.id_user is not null
	group by  p.id_user, p.period
	order by p.period
	
)A inner join biology_user_profile u on u.id = A.id_user
group by u.profile, A.period
-- order by   A.period , u.profile

