select  
g.period,
g.id as graph_context_id,
u.id as user_id,
u.reputation,
u.id_community,
u.profile_1,
u.profile_2,
n.*
from chemistry_user_profile u
inner join graph_node n on u.id = n.id_user
inner join graph_analysis_context g on g.id = n.id_graph_analysis_context

where g.period in (select max(g.period) from graph_analysis_context g where g.id_community in (
			select c.id from community c where c.name = 'chemistry.stackexchange.com'
		)  
	)

order by u.reputation desc
