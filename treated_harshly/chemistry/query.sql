select u.id, p.score, u.profile_1, u.profile_2  from post p 
inner join chemistry_user_profile u on u.id = p.id_user
where p.id_community in (select c.id from community c where c.name = 'chemistry.stackexchange.com')
and p.id_user is not null

