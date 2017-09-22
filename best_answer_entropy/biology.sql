select a.id_user, u.reputation, u.profile_1, u.profile_2,
 count(*) as totalBestAnswer from biology_question q
inner join biology_answer a
on a.id_post_comm = q.accepted_answer_comm_id
inner join biology_user_profile u
on u.id = a.id_user
where a.id_user is not null
group by a.id_user
order by  count(*)
