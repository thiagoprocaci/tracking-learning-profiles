select   
(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u 
	) and p.post_type = 1
) as questions,


(	select count(*) from post p where p.id_user in (
		select u.id from chemistry_user_profile u 
	) and p.post_type = 2
) as answers,


(	select count(*) from comment p where p.id_user in (
		select u.id from chemistry_user_profile u 
	) 
) as comments,

(select count(*) from chemistry_user_profile) as users

from dual
