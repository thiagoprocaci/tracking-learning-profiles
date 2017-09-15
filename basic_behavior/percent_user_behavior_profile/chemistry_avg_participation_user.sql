select   
(	select count(*)/ (select count(*) from chemistry_user_profile u where u.profile = 1) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 1
	) and p.post_type = 1
) as AvgQuestionsUserProfile1,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 2) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 2
	) and p.post_type = 1
) as AvgQuestionsUserProfile2,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 3) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 3
	) and p.post_type = 1
) as AvgQuestionsUserProfile3,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 4) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 4
	) and p.post_type = 1
) as AvgQuestionsUserProfile4,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 1) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 1
	) and p.post_type = 2
) as AvgAnswersUserProfile1,

(	select count(*)/ (select count(*) from chemistry_user_profile u where u.profile = 2) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 2
	) and p.post_type = 2
) as AvgAnswersUserProfile2,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 3) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 3
	) and p.post_type = 2
) as AvgAnswersUserProfile3,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 4) from post p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 4
	) and p.post_type = 2
) as AvgAnswersUserProfile4,


(	select count(*)/(	select count(*) from chemistry_user_profile u where u.profile = 1) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 1
	) 
) as AvgCommentsUserProfile1,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 2) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 2
	) 
) as AvgCommentsUserProfile2,

(	select count(*)/(select count(*) from chemistry_user_profile u where u.profile = 3) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 3
	) 
) as AvgCommentsUserProfile3,

(	select count(*) / (select count(*) from chemistry_user_profile u where u.profile = 4) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u where u.profile = 4
	) 
) as AvgCommentsUserProfile4



from dual
