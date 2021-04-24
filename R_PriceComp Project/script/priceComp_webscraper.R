
# install.packages('pacman')
library(pacman)
p_load(tidyverse, ralger, glue, RSelenium, magrittr, DT, plotly)

n_pages <- 5

# Jumia ------------------------------------------------------------------------

jumia_link <- glue("https://www.jumia.com.ng/catalog/?q=yamaha+piano+keyboard&page={seq(1,n_pages)}")

jumia_nodes <- c(".name" , ".prc")
jumia_names <- c("name", "price")

jumia_data <- tidy_scrap(jumia_link,jumia_nodes, jumia_names)

jumia_data$condition <- "Brand New"

jumia_data$source <- "Jumia"


# Konga ------------------------------------------------------------------------

rD <- rsDriver(port=4440L, browser="chrome", chromever = "90.0.4430.24", verbose = FALSE)

remDr <- rD$client
 

konga_link <- glue("https://www.konga.com/search?search=yamaha%20keyboard&page={seq(1,n_pages)}")

konga_list <- list()

for (i in seq(1,length(konga_link))){
  
  remDr$navigate(konga_link[i])
  src <- remDr$getPageSource()[[1]]
  
  konga_nodes <- c(".af885_1iPzH", ".d7c0f_sJAqi")
  konga_names <- c("name", "price")
  
  konga_datav1 <- tidy_scrap(src,konga_nodes, konga_names)
  
  konga_list[[i]] <- konga_datav1
}
konga_data <- do.call("bind_rows", konga_list)

konga_data$condition <- "Brand New"

konga_data$source <- "Konga"

# Jiji -------------------------------------------------------------------------

jiji_link <- "https://jiji.ng/search?query=yamaha%20psr"

remDr$navigate(jiji_link)

webElem <- remDr$findElement("css", "body")

jijiScroll <- function() {
  webElem$sendKeysToElement(list(key = "end"))
  webElem$sendKeysToElement(list(key = "up_arrow"))
  webElem$sendKeysToElement(list(key = "end"))
  Sys.sleep(3)
}

replicate(n_pages, jijiScroll())

jiji_src <- remDr$getPageSource()[[1]]


jiji_nodes <- c(".b-advert-title-inner--h3", ".qa-advert-price",".b-list-advert__item-attr")
jiji_names <- c("name", "price", "condition")

jiji_datav1 <- tidy_scrap(jiji_src,jiji_nodes, jiji_names)

jiji_datav1$source <- "jiji"

jiji_data <- jiji_datav1

whitespace <- "\\s+"

jiji_data_strip <-  as.data.frame(lapply(jiji_data, function(x) gsub(whitespace, " ", x)))

# ------------------------------------------------------------------------------
# end selenium session by killing port use
pid <- rD$server$process$get_pid()
system(paste0("Taskkill /F /T" ," /PID ", pid))

# ------------------------------------------------------------------------------

combined_data <- rbind(jumia_data,konga_data,jiji_data_strip)

combined_data$condition <- ifelse(grepl("New", combined_data$condition), "New",combined_data$condition)

combined_data %<>% 
  mutate(condition = factor(condition), source = factor(source),price = as.numeric(gsub("\\D","",price))) 

# write.csv(combined_data, "combined_data.csv", row.names = FALSE)

# combined_data.csv <- read.csv("C:/Projects/R Projects/R_Projects/R_PriceComp Project/combined_data.csv")

combined_data.csv <- combined_data

combined_data <- combined_data.csv %>% group_by(source) %>% 
  summarise(count = n()) 


ggplotly(ggplot(combined_data) +
  aes(x = source, y = count, fill = source) +
  geom_bar(stat = 'identity') +
  scale_fill_manual(
    values = list(
      jiji = "#3DB83B",
      Jumia = "#F68C1E",
      Konga = "#ED017F"
    ) 
    )+
  labs(x = "Source", y = "Count of Items") +
  theme_bw() +
    theme(
      legend.position = "top",
      axis.title.y = element_text(
        size = 10L,
        face = "bold"
      ),
      axis.text.x=element_text(
        # size = 10L,
        face = "bold"
      ),
      axis.ticks.x=element_blank()
    )
  )






e373_data <- combined_data.csv %>% filter(price >= 80000 & price <= 200000 & grepl("E373", name))

ggplotly(ggplot(e373_data) +
  aes(x = name, fill = source, y = price) +
  geom_bar(stat = 'identity') +
  scale_fill_manual(
    values = list(
      jiji = "#3DB83B",
      Jumia = "#F68C1E",
      Konga = "#ED017F"
    )
  ) +
  labs(x = "Yamaha PSR E373", y = "Price (₦)") +
  theme_minimal() +
  theme(
    legend.position = "top",
    axis.title.y = element_text(
      size = 10L,
      face = "bold"
    ),
    axis.title.x=element_text(
      size = 10L,
      face = "bold"
    ),
    axis.text.x=element_blank(),
    axis.ticks.x=element_blank()
  ))


DT::datatable(combined_data, filter = "top")


