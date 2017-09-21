select 
	B.userId, 
	B.reputation,
	B.tag1 ,
	sum(B.total) as totalPost

from (

	select  -- total a question
	 A.userId ,
 	 A.reputation,
	 A.tag1,
	 count(*) as total,
	(select 'questions' from dual) as description 	
	from (
		select
		 	u.id as userId,
			u.reputation,
		 	q.id as postId,
			replace(substring_index(q.tags,'>',1), '<', '') as tag1,	
			(select 'questions' from dual) as description 	
		from biology_question q
		inner join biology_user_profile u
		on u.id = q.id_user
	
	
	)A group by A.userId, A.tag1
	
	union all
	
	select  -- total answer of a question
	 A.userId ,
	 A.reputation,
	 A.tag1,
	 count(*) as total,
	(select 'answers' from dual) as description 	
	from (
		select
		 	u.id as userId,
			u.reputation,
		 	a.id as postId,
			replace(substring_index(q.tags,'>',1), '<', '') as tag1,	
			(select 'answers' from dual) as description 	
		from biology_answer a
		inner join biology_user_profile u
		on u.id = a.id_user
		inner join biology_question q 
		on q.id_post_comm = a.parent_post_comm_id
	
	)A group by A.userId, A.tag1
	
	union all
	
	select -- total comment of a question
	 A.userId ,
	 A.reputation,
	 A.tag1,
	 count(*) as total,
	(select 'comments' from dual) as description 	
	from (
		select
			u.reputation,
		 	u.id as userId,
		 	c.id as postId,
			replace(substring_index(q.tags,'>',1), '<', '') as tag1,	
			(select 'comments_question' from dual) as description 	
		from biology_comment c
		inner join biology_user_profile u
		on u.id = c.id_user
		inner join biology_question q 
		on q.id = c.id_post
	
	)A group by A.userId, A.tag1
	
	union all
	
	select -- total comment of a answer
	 A.userId ,
	 A.reputation,
	 A.tag1,
	 count(*) as total,
	(select 'comments_answer' from dual) as description 	
	from (
		select
			u.reputation,
		 	u.id as userId,
		 	c.id as postId,
			replace(substring_index(q.tags,'>',1), '<', '') as tag1,	
			(select 'comments_answer' from dual) as description 	
		from biology_comment c
		inner join biology_user_profile u
		on u.id = c.id_user
		inner join biology_answer a 
		on a.id = c.id_post
		inner join biology_question q
		on q.id_post_comm = a.parent_post_comm_id
	
	)A group by A.userId, A.tag1

)B group by B.userId, B.tag1, B.reputation
