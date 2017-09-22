select A.*,
	(	(A.usersInComponent * 100)/ A.totalUsers ) as percentComponent

	from (

select n.strongly_component as componentId, 
			count(*) as usersInComponent,
			(select count(*) from chemistry_user_profile n) as totalUsers
			from graph_node n
where n.id_graph_analysis_context in (
	select max(g.period) from graph_analysis_context g where g.id_community in 
	(select c.id from community c where c.name = 'chemistry.stackexchange.com')
) group by n.strongly_component  order by count(*) desc limit 1

)A