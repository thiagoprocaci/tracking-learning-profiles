select e.id_user_source, count(*) reciprocityCount, u.profile_1, u.profile_2 from graph_edge e
inner join graph_edge e2 on 
e.id_user_source = e2.id_user_dest and e.id_user_dest = e2.id_user_source
inner join chemistry_user_profile u on u.id = e.id_user_source

 where e.id_graph_analysis_context in (
 select max(g.id) from graph_analysis_context g 
	where g.id_community in (select c.id from community c where c.name = 'chemistry.stackexchange.com')
 )
 
 and e.id_user_source != e.id_user_dest
 
 group by e.id_user_source
