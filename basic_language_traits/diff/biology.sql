select avg(p.ari_text) avg_ari,
 avg(p.characters_text) as charactersTextAvg,    		 
 avg(p.syllables_text) as syllablesTextAvg,	 
 avg(p.words_text) as wordsTextAvg,	     		 
 avg(p.complexwords_text) as complexWordsTextAvg,	     		 
 avg(p.sentences_text) as sentencesTextAvg,	
p.id_user,
u.profile_1,
u.profile_2
from post p 
inner join biology_user_profile u
on p.id_user = u.id

where p.id_community in (
	select c.id from community c where c.name = 'biology.stackexchange.com' 
) 
and p.id_user is not null
group by p.id_user
