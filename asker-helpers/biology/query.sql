select * from graph_node e
 inner join biology_user_profile u on u.id = e.id_user
 where e.id_graph_analysis_context in (
 select max(g.id) from graph_analysis_context g 
	where g.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
 )


