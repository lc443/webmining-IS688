library(RCurl)
library(XML)
library(stringr)
library(httr)
install.packages("rvest")
library(rvest)



frontier = c("https://www.cnn.com","https://www.kdnuggets.com/",
             "https://news.google.com", "https://www.njit.edu/",
             "https://apple.com", "https://rutgers.edu/",
            "https://stackoverflow.com/", "https://www.wikipedia.org/",
            "https://canvas.njit.edu/", "https://www.facebook.com/",
            "https://www.atlassian.com/software/jira",
            "https://www.microsoft.com/en-us/microsoft-teams/group-chat-software",
            "https://youtube.com", "https://amazon.com",
            "https://paypal.com", "https://walmart.com", "https://indeed.com", 
            "https://linkedin.com", "https://twitch.tv", "https://tiktok.com",
            "https://usps.com", "https://att.com"
             )

topicwords = c("technology","school","web","mining","news")

j = 0
num = 50

result = c()
title = c()


while (j < num){

  if(length(frontier)< 1){
      break
    } else {
      urllink = frontier[1]
      frontier = frontier[-1]
      website = read_html(urllink)
      exploredlink = website %>% html_nodes("body") %>% html_text()
      pagetitle = website %>% html_node("title") %>% html_text()
      if(str_detect(exploredlink,"\\.jpg$"))
      {
        next
      } else {
        if(str_length(exploredlink)<10){
          next
        }
      for(word in topicwords) {
      
        if(str_detect(exploredlink, word))
          {
          result = append(result, urllink)
          title = append(title, pagetitle)
          title = unique(title)
          result = unique(result)
             j = j + 1
          } 
      }
      }
  }
}

Urls = c(result)
Page_Titles= c(title)

repository = data.frame( Page_Titles, Urls, stringsAsFactors = FALSE)
#write.csv(data, "repository.csv")
View(repository)
