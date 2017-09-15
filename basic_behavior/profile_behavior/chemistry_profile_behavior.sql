select   
(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 1
	) and p.post_type = 1
) as questionsProfile1,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 2
	) and p.post_type = 1
) as questionsProfile2,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 3
	) and p.post_type = 1
) as questionsProfile3,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 4
	) and p.post_type = 1
) as questionsProfile4,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 1
	) and p.post_type = 2
) as answersProfile1,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 2
	) and p.post_type = 2
) as answersProfile2,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 3
	) and p.post_type = 2
) as answersProfile3,

(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 4
	) and p.post_type = 2
) as answersProfile4,


(	select count(*) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 1
	) 
) as commentsProfile1,

(	select count(*) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 2
	) 
) as commentsProfile2,

(	select count(*) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 3
	) 
) as commentsProfile3,

(	select count(*) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 4
	) 
) as commentsProfile4



from dual
