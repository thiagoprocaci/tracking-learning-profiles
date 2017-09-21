select  
	A.period,
	A.modularity_class,
	sum(A.outstanding) as outstanding,
	sum(A.ordinary) as ordinary
	
	from ( 

	select 
		 g.period,
	    u.profile_1,
		 n.modularity_class,
		 count(u.id) as countUser,
		 n.id_community,
		CASE WHEN u.profile_1 = 4 then count(u.id)
		  else 0
	    end as 'outstanding',
	   CASE WHEN u.profile_1 = 1 then count(u.id)
		  else 0
	   end as 'ordinary'
	from graph_node n
	inner join biology_user_profile u
	on n.id_user = u.id
	inner join graph_analysis_context g
	on g.id = n.id_graph_analysis_context
	where n.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	group by g.period, n.modularity_class, u.profile_1
	order by g.period

)A group by A.period, A.modularity_class