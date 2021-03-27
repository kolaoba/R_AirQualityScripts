
#install.packages("rtweet")
library (rtweet)
library(wordcloud2)
# install.packages("tm")
library(tm) # text minning
library(dplyr) # loads of fun stuff including piping


# kept my details in my Renviron file for safe keeping

twitter_token <- create_token(
  app = Sys.getenv("TWITTER_APPNAME"),
  consumer_key = Sys.getenv("TWITTER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_API-SECRET_KEY"))


fooood <- get_timelines(c("@coldstoneng","@dominosng"), n= 3200, home=FALSE)
news <- get_timelines(c("@CNN","@nytimes"), n= 3200, home=FALSE)
richpeople <- get_timelines(c("@elonmusk","@BillGates"), n= 3200, home=FALSE)


exportWordCloud <- function(tweet_category){
  tweets <- tweet_category
  tweets <- tweets %>% select("text") # selects just the text column
  
  tweets$text <- gsub("[^[:alnum:][:blank:]?&/\\-]", "",tweets$text) # remove alphanumeric characters 
  tweets$text <- gsub("https\\S*", "",tweets$text) # remove hyperlinks
  tweets$text <- gsub("amp", "",tweets$text) # amp just keeps showing up, remove it!!
  
  #create a corpus to allow us clean the text column with tm
  tweets.corpus <- Corpus(VectorSource(tweets$text))
  
  
  tweets.corpus <- tweets.corpus %>%
    tm_map(removeNumbers) %>% # removes numbers from text
    tm_map(removePunctuation) %>% # removes punctuation from text
    tm_map(stripWhitespace) %>% # trims the text of whitespace
    tm_map(content_transformer(tolower)) %>% # convert text to lowercase
    tm_map(removeWords,stopwords("english")) %>% # remove stopwords
    tm_map(removeWords,stopwords("SMART")) # remove stopwords not removed from previous line
  
  tdm <- TermDocumentMatrix(tweets.corpus) %>% # create a term document matrix
    as.matrix()
  
  words <- sort(rowSums(tdm), decreasing = TRUE) # count all occurences of each word and group them
  df <- data.frame(word = names(words), freq = words) # convert it to a dataframe
  set.seed(1234) # for reproducibility, sorta
  wcloud <- wordcloud2(df,   # generate word cloud
                       size = 1,
                       color= 'random-dark', # set colors
                       rotateRatio = 0) #horizontal looks better, but what do you think?
  wcloud
}

exportWordCloud(fooood)
exportWordCloud(richpeople)
exportWordCloud(news)

