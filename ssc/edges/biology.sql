
select 
	e.id_user_source,
	e.id_user_dest,
	u.profile_1 as user_source_profile_1,
	u2.profile_1 as user_dest_profile_1,
	u.profile_2 as user_source_profile_2,
	u2.profile_2 as user_dest_profile_2
 from graph_edge e
inner join biology_user_profile u
on e.id_user_source = u.id
inner join biology_user_profile u2
on e.id_user_dest = u2.id
inner join biology_max_graph_analysis_context g
on e.id_graph_analysis_context = g.id
where e.id_graph_node_source in (
	select n.id from graph_node n
	where n.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and n.strongly_component in (select * from giant_component_biology_max_period)
)

and 

e.id_graph_node_dest in (
	select n.id from graph_node n
	where n.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	and n.strongly_component in (select * from giant_component_biology_max_period)
)

