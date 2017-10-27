select * from post p 
inner join biology_user_profile u on u.id = p.id_user
where p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')
-- and (u.profile_1 = 1 or profile_2 = 1) 
and p.score > 3
