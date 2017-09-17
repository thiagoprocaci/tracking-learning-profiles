

select 
		n.degree,
		n.indegree,
		n.outdegree,
		n.id_community,
		g.period,
		n.id_user
 from graph_node n 
inner join  graph_analysis_context g
on g.id = n.id_graph_analysis_context 
where g.period in (
	select max(g.period) from 
	graph_analysis_context  g 
	where g.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
)
and n.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
