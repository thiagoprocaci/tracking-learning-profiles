select  
g.period,
u.profile_1,
avg(n.degree) as avgDegree,
avg(n.indegree) as avgIndegree,
avg(n.outdegree) as avgOutdegree,
avg(n.betweenness) as avgBetweenness,
avg(n.page_rank) as avgPagerank,
avg(n.eigenvector) as avgEigenvector,
avg(n.interactions) as avgInteractions

from biology_user_profile u
inner join graph_node n on u.id = n.id_user
inner join graph_analysis_context g on g.id = n.id_graph_analysis_context

group by g.period, u.profile_1
order by g.period, u.profile_1
