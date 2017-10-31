select count(*) as total, 'askers' as pattern from graph_node n where 
n.id_graph_analysis_context in (
	select max(g.id) from graph_analysis_context g where g.id_community in (
		select c.id from community c where c.name = 'chemistry.stackexchange.com'
	)
) and n.indegree = 0 and n.outdegree > 0

union all 

select count(*) as total, 'helpers' as pattern from graph_node n where 
n.id_graph_analysis_context in (
	select max(g.id) from graph_analysis_context g where g.id_community in (
		select c.id from community c where c.name = 'chemistry.stackexchange.com'
	)
) and n.indegree > 0 and n.outdegree = 0

union all 

select count(*) as total, 'askers-helpers' as pattern from graph_node n where 
n.id_graph_analysis_context in (
	select max(g.id) from graph_analysis_context g where g.id_community in (
		select c.id from community c where c.name = 'chemistry.stackexchange.com'
	)
) and n.indegree > 0 and n.outdegree > 0

union all 

select count(*) as total, 'all' as pattern from graph_node n where 
n.id_graph_analysis_context in (
	select max(g.id) from graph_analysis_context g where g.id_community in (
		select c.id from community c where c.name = 'chemistry.stackexchange.com'
	)
)

