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
	u.profile_1,
	(SELECT 'answer' from dual) as post_type
	
	from post p 
	inner join chemistry_user_profile u on p.id_user = u.id	
	where p.post_type = 2
	group by  u.profile_1
	
	union all
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
	u.profile_1,
	(SELECT 'question' from dual) as post_type
	
	from post p 
	inner join chemistry_user_profile u on p.id_user = u.id	
	where p.post_type = 1
	group by  u.profile_1
	
	union all
	
		select avg(p.ari) as ariTextAvg, 
			 avg(p.smog) as smogTextAvg, 
 			 avg(p.flesch_reading) as fleschReadingTextAvg, 
  			 avg(p.flesch_kincaid) as fleschKincaidTextAvg, 
  			 avg(p.gunning_fog) as gunningFogTextAvg, 
			 avg(p.coleman_liau) as colemanLiauTextAvg, 
   		 avg(p.smog_index) as smogIndexTextAvg, 
   		 avg(p.characters) as charactersTextAvg,    		 
    		 avg(p.syllables) as syllablesTextAvg,	 
    		 avg(p.words) as wordsTextAvg,	     		 
    		 avg(p.complexwords) as complexWordsTextAvg,	     		 
		    avg(p.sentences) as sentencesTextAvg,	    		 
	u.profile_1,
	(SELECT 'comment' from dual) as post_type
	 from comment p 
	inner join chemistry_user_profile u on p.id_user = u.id	
	group by  u.profile_1