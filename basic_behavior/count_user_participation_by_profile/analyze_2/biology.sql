select   
(	select count(*) from post p where p.id_user in (
		select u.id from biology_user_profile u where u.profile_2 = 1
	) and p.post_type = 1
) as questionsProfile1,

(	select count(*) from post p where p.id_user in (
		select u.id from biology_user_profile u where u.profile_2 = 4
	) and p.post_type = 1
) as questionsProfile4,

(	select count(*) from post p where p.id_user in (
		select u.id from biology_user_profile u where u.profile_2 = 1
	) and p.post_type = 2
) as answersProfile1,

(	select count(*) from post p where p.id_user in (
		select u.id from biology_user_profile u where u.profile_2 = 4
	) and p.post_type = 2
) as answersProfile4,


(	select count(*) from comment p where p.id_user in (
		select u.id from biology_user_profile u where u.profile_2 = 1
	) 
) as commentsProfile1,

(	select count(*) from comment p where p.id_user in (
		select u.id from biology_user_profile u where u.profile_2 = 4
	) 
) as commentsProfile4



from dual
