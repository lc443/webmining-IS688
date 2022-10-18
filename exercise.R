library("rvest")
library("dplyr")
library("jsonlite")
library('xml2')

for (page_result in seq(from =1 , to = 51, by = 50)) {
  
}

# CRAW ONE PAGE AND SAVE DATA TO CSV FILE
link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc"

page = read_html(link)
# read_html translates a url into an html document

name = page %>% html_nodes(".lister-item-header a") %>% html_text()
#html_nodes allow us to grab element from the page tht we want to get
#html_text extracts text from the nodes

movie_links = page %>% html_nodes(".lister-item-header a") %>% html_attr("href") %>%
  paste("https://imdb.com", ., sep="")

year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating  = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()

get_cast = function(movie_link) {
  movie_page = read_html(movie_link)
  movie_cast = movie_page %>% html_nodes(".sc-36c36dd0-8 a") %>% 
    html_text() %>% paste(collapse = ",")
  #We are going to get this data put it in one line and separate it with,
  return(movie_cast)
}

cast = sapply(movie_links, FUN = get_cast, USE.NAMES = FALSE)
cast

movies = data.frame(name, year, rating, synopsis, cast, stringsAsFactors = FALSE)
write.csv(m)View(movies)

## NESTED LINKS