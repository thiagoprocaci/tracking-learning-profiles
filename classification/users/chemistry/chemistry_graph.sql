select 
	u.id,
	u.id_community,
	u.profile_1,
	u.profile_2,
	u.reputation,
	n.betweenness,
	n.closeness,
	n.eccentricity,
	n.harmonic_closeness,
	n.page_rank,
	n.indegree,
	n.outdegree,
	n.degree,
	n.eigenvector,
	n.modularity_class,
	n.clustering_coefficient,
	n.interactions,
	n.strongly_component,
	n.weakly_component,
	(select count(*) from chemistry_answer a where a.id_user = u.id) as answers,
	 (select count(*) from chemistry_comment a where a.id_user = u.id) as comments,
		 (select count(*) from chemistry_question a where a.id_user = u.id) as questions
from chemistry_user_profile u
inner join graph_node n on n.id_user = u.id
inner join graph_analysis_context g on g.id = n.id_graph_analysis_context
where g.period in (
	select max(g.period) from 
	graph_analysis_context  g 
	where g.id_community in (select c.id from community c where c.name = 'chemistry.stackexchange.com')
) order by u.id


