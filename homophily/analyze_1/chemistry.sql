
select  
	A.period, 
	A.profileUserSource, 
	A.profileUserDest,
	count(*) as total
	from (
	select 
		 e.id_user_source as userSource,
		 u.profile_1 as profileUserSource,	  
		 e.id_user_dest as userDest,
		 u2.profile_1 as profileUserDest,
		 g.period as period
	
	from graph_edge e
	inner join graph_analysis_context g on g.id = e.id_graph_analysis_context
	inner join chemistry_user_profile u on u.id = e.id_user_source
	inner join chemistry_user_profile u2 on u2.id = e.id_user_dest
	
	where e.id_community in (select c.id from community c where c.name = 'chemistry.stackexchange.com')	
)A group by A.period, A.profileUserSource, A.profileUserDest
order by A.period