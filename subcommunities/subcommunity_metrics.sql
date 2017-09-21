	select 
	  g.period,
	  n.modularity_class,
	  avg(n.indegree) as   avgIndegree,
	  avg(n.outdegree) as   avgOutdegree,
	  avg(n.degree) as avgDegree,
	  avg(n.betweenness) as avgBetweenness,
	  avg(n.page_rank) as avgPageRank,
	  avg(n.eigenvector) as avgEigenvector
	from graph_node n
	inner join biology_user_profile u
	on n.id_user = u.id
	inner join graph_analysis_context g
	on g.id = n.id_graph_analysis_context
	where n.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
	group by g.period, n.modularity_class