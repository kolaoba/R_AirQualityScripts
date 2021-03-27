



library(shiny)
# for some cool themes!!
# install.packages("shinythemes")
library(shinythemes)

library (rtweet)
library(wordcloud2)
# install.packages("tm")
library(tm) # text minning
library(dplyr) # loads of fun stuff including piping
library(jsonlite) # to read from json files


# kept my details in a json file for safe keeping
# this loads the keys from the json file
keys <- read_json("config.json")

# creates a token for oauth
token <- create_token(
app = "TwitterWithLove",
consumer_key = keys$consumer_key,
consumer_secret = keys$consumer_secret,
access_token = keys$access_token,
access_secret = keys$access_secret)

#define exportwordcloud function------------------------------------------------

exportWordCloud <- function(twitter_handle){
    twitter_handle_str <- toString(twitter_handle)
    tweets_df <- get_timelines(c(twitter_handle_str), n= 1000, home=FALSE)
    tweets <- tweets_df
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
                         rotateRatio = 0
                         ) #horizontal looks better, but what do you think?
    wcloud
}

#-------------------------------------------------------------------------------


ui <- fluidPage( 

    theme = shinytheme("superhero"),
    # Give the page a title
    titlePanel("Twitter Word Cloud Generator"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
            
            textInput(
                "twitter_handle",
                "Twitter Handle:",
                value = "@coldstoneng",
                placeholder = "@coldstoneng"
            ),
            actionButton("update", "Generate Word Cloud"),
            # a(href = url, "Authorize this app"),
            width = "4"
        ),
        # Create a spot for the barplot
        mainPanel( wordcloud2Output("wordCloud"), width = "50%" )
        
        
    )
)

# Define server logic required to draw a wordcloud
server <- function(input, output) {
    
    
    output$wordCloud <- renderWordcloud2({
        input$update
        isolate(exportWordCloud(input$twitter_handle))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)



