#If you have already installed the RTextTools package, uninstall it
#by clicking on the "x" to the right of the package name in the
#Packages tab

#Insall file from source I posted on Moodle.  Provide the path to the folder after downloading

#For Mac OS X users (replace with your computer path):
#First install XCode from the Mac App Store so your computer can compile the code
install.packages("~/Downloads/RTextTools/", repos = NULL, type="source")

#For Windows users (replace with your computer path):
install.packages("C:/RTextTools_1.4.2.zip", repos = NULL, type = "win.binary")

library(NLP)
library(tm)
library(SparseM)
library(RTextTools)

test<-c("the cat is grey",
        "how to care for a cat",
        "caring for pets")

dt<-create_matrix(test,removeStopwords = F,stemWords = F)
dt<-as.matrix(dt)
q1<-"cats"

q1matrix<-create_matrix(q1,originalMatrix = dt,removeStopwords = F,stemWords = F)
q1matrix<-as.matrix(q1matrix)
