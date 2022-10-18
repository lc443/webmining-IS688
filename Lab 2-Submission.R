#Write a function in R to compute the cosine similarity between a document and a query

#Use:
library(RTextTools)
library(tm)

documents = c("the grey cat is nice","how to feed a cats","dogs make great pets")
corpus = create_matrix(documents,removeStopwords = T,stemWords = T)
corpus = as.matrix(corpus)

q1 = "feeding cats"

#Question 1: Show your results without stemming and stopword removal

#Question 2: Show your results with stemming and stop word removal


#The format of the function should be as follows:

nostopwordsnostems = function(query,document){
  #Your code here 
  matrix = create_matrix(document, removeStopwords = F, stemWords = F )
  matrix = as.matrix(matrix)
  
  results = create_matrix(query, originalMatrix = matrix,removeStopwords = F, minWordLength=1, stemWords = F )
 results
}

stopwordsstems = function(query, document) {
  matrix = create_matrix(document, removeStopwords = T, stemWords = T )
  matrix = as.matrix(matrix)
  
  results = create_matrix(query, originalMatrix = matrix,removeStopwords = T, stemWords = T )
  results
}

questionOne = nostopwordsnostems(q1, documents)
questionTwo =  stopwordsstems(q1, documents)

