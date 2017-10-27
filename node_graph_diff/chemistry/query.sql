select node.*, u.profile_1, u.profile_2 from graph_node node 
inner join biology_user_profile u on node.id_user = u.id

where node.id_graph_analysis_context in (
	select max(g.id) from graph_analysis_context g 
	where g.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
)
