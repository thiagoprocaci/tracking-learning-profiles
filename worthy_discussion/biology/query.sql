select question.id as questionId ,
		 case 
		 	when question.accepted_answer_comm_id is not null then '1'
		 	when question.accepted_answer_comm_id is null then '0'
		 	end as finished,
		 	avg(node.indegree) as avgIndegree,
		 	avg(node.outdegree) as avgOutdegree,
		 	avg(node.betweenness) as avgBetweenness,
		 	avg(node.eigenvector) as avgEigenvector,
		 	avg(node.page_rank) as avgPagerank
from post question
left join post answer 
	on answer.parent_post_comm_id = question.id_post_comm and answer.id_community = question.id_community
left join graph_node node
	on answer.id_user = node.id_user
where answer.post_type = 2 and  question.post_type = 1
and question.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
and node.id_graph_analysis_context in (
	select max(g.id) from graph_analysis_context g where g.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
)
group by question.id

