library(RTextTools)
library(tm)

# 1) (25 pts) Given the following documents, create a doc-term matrix using the following definition for term frequency

documents = c("technology class computer. server technology", "web technology server. web server", "web site server class ")
corpus = create_matrix(documents, removeStopwords = F, stemWords = F)
corpus = as.matrix(corpus)

#Reordering the corpus columns
col_order = c("technology", "class", "computer", "server", "web", "site")
orderedCorpus = corpus[, col_order]

#2) (25 pts) Compute the idf values for each of the columns above (use log base-10) technology, class, computer, server, web, site


idf = function(query, matrix){
  results = create_matrix(query, originalMatrix = matrix)
  results = as.matrix(results)
}

technology = idf("technology", orderedCorpus)
class = idf("class", orderedCorpus)
computer = idf("computer", orderedCorpus)
server = idf("server", orderedCorpus)
web = idf("web", orderedCorpus)
site = idf("site", orderedCorpus)

#Technology
# log3/1.5 = 0.310

#Class
# log3/2= 0.1761

#Computer
#log3/1 =0.4771

#server
#log3/2 = 0.1761

#Web
#log3/1.5 = 0.310

#Site
##log3/1 = 0.4771



# 3) (10 pts) Compute the tf-idf matrix using the information computed in questions 1 and 2. 
#TFIDF
#Document 1
  #Technology = 0.31
  #Class = 0.1761
  #Computer = 0.4771
  #Server = 0.08805
  #Web = 0 
  #Site = 0

# Document 2
# Technology = 0.155
# Class = 0
# Computer = 0
# Server = 1
# Web = 0.310
# Site = 0


#Document 3
  #Technology = 0
  #Class = 0.1761
  #Computer = 0
  #Server = 0.08805
  #Web = 0.155
  #Site = 0.4771

# 4) 

# Cosine ( Document1, query) = (0.31*0 + 0.1761*0 + 0.4771*0 + 0.08805*0 + 0*1.5 + 0*3) / [ (0.312 + 0.17612 + 0.47712 + 0.088052 + 02 + 02 )0.5 * (02 + 02 + 02 + 02 + 1.52 + 32 )0.5 ] 0.5
# = 0 / [ 0.6 *3.35 ]0.5 
# = 0

# Cosine ( Document 2, query) = (0.155*0 + 0*0 + 0*0 + 1*0+ 0.310*1.5 + 0*3) / [ (0.1552 + 02 + 02 + 12 + 0.3102 + 02 )0.5 * (02 + 02 + 02 + 02 + 1.52 + 32 )0.5​​​​​​​ ] 0.5
# = 0.465 / [ 1.06 *3.35 ]0.5 
# = 0.246

# Cosine ( Document 3,query) = (0*0 + 0.1761*0 + 0*0 + 0.08805*0 + 0.155*1.5 + 0.4771*3) / [ (02 + 0.17612 + 02 + 0.088052 + 0.1552 + 0.47712 )0.5​​​​​​​ * (02 + 02 + 02 + 02 + 1.52 + 32 )0.5​​​​​​​ ] 0.5
# = 1.6638 / [ 0.54*3.35]0.5 
# = 1.237
