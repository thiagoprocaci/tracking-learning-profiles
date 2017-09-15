biologyProfileData = read.csv("biology_profile_behavior.csv", header = TRUE, sep = ";")
chemistryProfileData = read.csv("chemistry_profile_behavior.csv", header = TRUE, sep = ";")


biologyGeneralData = read.csv("../general_description/biology_desc.csv", header = TRUE, sep = ";")
chemistryGeneralData = read.csv("../general_description/chemistry_desc.csv", header = TRUE, sep = ";")

sumBioQuestions = sum(biologyProfileData$questionsProfile1, biologyProfileData$questionsProfile2,  biologyProfileData$questionsProfile3, biologyProfileData$questionsProfile4 )
sumBioAnswers = sum(biologyProfileData$answersProfile1, biologyProfileData$answersProfile2,  biologyProfileData$answersProfile3, biologyProfileData$answersProfile4 )
sumBioComments = sum(biologyProfileData$commentsProfile1, biologyProfileData$commentsProfile2,  biologyProfileData$commentsProfile3, biologyProfileData$commentsProfile4 )
 
 
sumChemQuestions = sum(chemistryProfileData$questionsProfile1, chemistryProfileData$questionsProfile2,  chemistryProfileData$questionsProfile3, chemistryProfileData$questionsProfile4 )
sumChemAnswers = sum(chemistryProfileData$answersProfile1, chemistryProfileData$answersProfile2,  chemistryProfileData$answersProfile3, chemistryProfileData$answersProfile4 )
sumChemComments = sum(chemistryProfileData$commentsProfile1, chemistryProfileData$commentsProfile2,  chemistryProfileData$commentsProfile3, chemistryProfileData$commentsProfile4 )

if(sumChemQuestions == chemistryGeneralData$questions) {
  print("Sum Chemistry Questions Correct")
} else {
  print("Sum Chemistry Questions Incorrect")
}

if(sumChemAnswers == chemistryGeneralData$answers) {
  print("Sum Chemistry Answers Correct")
} else {
  print("Sum Chemistry Answers Incorrect")
}

if(sumChemComments == chemistryGeneralData$comments) {
  print("Sum Chemistry Comments Correct")
} else {
  print("Sum Chemistry Comments Incorrect")
}

 if(sumBioQuestions == biologyGeneralData$questions) {
   print("Sum Biology Questions Correct")
 } else {
   print("Sum Biology Questions Incorrect")
 }
 
 if(sumBioAnswers == biologyGeneralData$answers) {
   print("Sum Biology Answers Correct")
 } else {
   print("Sum Biology Answers Incorrect")
 }
 
 if(sumBioComments == biologyGeneralData$comments) {
   print("Sum Biology Comments Correct")
 } else {
   print("Sum Biology Comments Incorrect")
 }
 