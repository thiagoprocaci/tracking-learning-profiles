	
	
	select count(distinct p.id) as totalBestAnswers, u.profile as profile from post p 
	inner join biology_user_profile u on p.id_user = u.id	
	where p.id_post_comm in (	
		select p.accepted_answer_comm_id
		from post p where p.accepted_answer_comm_id is not null and p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')	
	) 	
	and p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')	
	group by u.profile
	
	
----------------------------
		
	
	select avg(p.ari_text) as ariTextAvg, 
			 avg(p.smog_text) as smogTextAvg, 
 			 avg(p.flesch_reading_text) as fleschReadingTextAvg, 
  			 avg(p.flesch_kincaid_text) as fleschKincaidTextAvg, 
  			 avg(p.gunning_fog_text) as gunningFogTextAvg, 
			 avg(p.coleman_liau_text) as colemanLiauTextAvg, 
   		 avg(p.smog_index_text) as smogIndexTextAvg, 
   		 avg(p.characters_text) as charactersTextAvg,    		 
    		 avg(p.syllables_text) as syllablesTextAvg,	 
    		 avg(p.words_text) as wordsTextAvg,	     		 
    		 avg(p.complexwords_text) as complexWordsTextAvg,	     		 
		    avg(p.sentences_text) as sentencesTextAvg,	     		 
    		 
	
	u.profile as profile from post p 
	inner join biology_user_profile u on p.id_user = u.id	
	where p.id_post_comm in (	
		select p.accepted_answer_comm_id
		from post p where p.accepted_answer_comm_id is not null and p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')	
	) 	
	and p.id_community in (select c.id from community c where c.name = 'biology.stackexchange.com')	
	group by u.profile
