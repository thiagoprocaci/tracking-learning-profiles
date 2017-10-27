select CHAR_LENGTH(a.body) postLen, u.profile_2, u.id as idUser from post a
inner join chemistry_user_profile u on a.id_user = u.id where a.body is not null


select CHAR_LENGTH(a.body) postLen, u.profile_1, u.id as idUser from post a
inner join chemistry_user_profile u on a.id_user = u.id where a.body is not null



