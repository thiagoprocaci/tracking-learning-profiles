
discussions = read.csv("questions.csv", header = TRUE, sep = ";")
answers = read.csv("answers.csv", header = TRUE, sep = ";")
comments = read.csv("comments.csv", header = TRUE, sep = ";")

discussions[, "seniors"] = FALSE
discussions[, "avgDiscussionSize"] = 0

biologyDiscussion = subset(discussions, discussions$communityName == "biology")

index = 1

while (index <= nrow(biologyDiscussion)) {
  row = biologyDiscussion[index, ]
  mysubset = subset(answers, answers$questionId == row$questionId & answers$profile == 4)
  if(nrow(mysubset) > 0) {
    biologyDiscussion[index, "seniors"] = TRUE
  } else {
    #mysubset = subset(comments, comments$questionId == row$questionId & comments$profile == 4)
    #if(nrow(mysubset) > 0) {
    # biologyDiscussion[index, "seniors"] = TRUE
    #}
  }
  
  mysubset = subset(biologyDiscussion, biologyDiscussion$period == row$period)
  biologyDiscussion[index, "avgDiscussionSize"] = mean(mysubset$discussionSize)
  
  index = index + 1
}



library("ggplot2")
require(gridExtra)

bioPlot = ggplot(data=biologyDiscussion,
                 aes(x = period, y = avgDiscussionSize, colour = seniors)) +
  xlab("Time Slice") + ylab("Prob. of give the best answer") +
  geom_line()


grid.arrange(bioPlot, ncol=2)



