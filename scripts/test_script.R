library("openair");library("dplyr");library("ggplot2");library("patchwork")

wkdir <- "C:/Users/koli0/Downloads"

setwd(wkdir)

metfiles <- list.files(path = wkdir, pattern = "Abesan*")

col_names <- c("utc_time", "uts_time", "local_time", "itemp",
               "irh", "no2", "o3","no","so2","lat","long",
               "pm1","pm2.5","pm10","co","h2s","temp","rh",
               "press","tvoc")

aqabesandata <- read.csv(file = metfiles[1], col.names = col_names)

names(aqabesandata)

summary(aqabesandata)

head(aqabesandata)

aqabesandata$date <- as.POSIXct(aqabesandata$local_time, tz = "GMT","%m/%d/%Y %H:%M" )

num_col_names <- c( "itemp","irh", "no2", "o3","no","so2","lat","long",
                    "pm1","pm2.5","pm10","co","h2s","temp","rh",
                    "press","tvoc")

aqabesandata[num_col_names] <- sapply(aqabesandata[num_col_names],as.numeric)

sapply(aqabesandata, class)

aqabesandata <- selectByDate(aqabesandata, month = "August" )

timePlot(aqabesandata, pollutant = c("temp","rh"), group = TRUE, date.pad = FALSE,normalise = "mean",
         cols = c("red","blue"), avg.time = "12 hour", statistic = "mean",main = "Abesan",ylab="",
         lty = c(1,1), pch = c(1,2), y.relation = "free")


aqabesanavg <- timeAverage(aqabesandata, avg.time = "12 hour", statistic = "mean")

summary(aqabesanavg)

coeff <- 0.5

p1 <- ggplot(aqabesanavg, aes(x=date)) +
  geom_line(aes(y =temp),color="blue", size = 0.5) +
  geom_line(aes(y =rh/coeff),color="red", size = 0.5) +
  scale_y_continuous(
    name = "Temperature",
    sec.axis = sec_axis(~.*coeff, name = "Relative Humidity")
  ) +
  ggtitle("Abesan") +
  theme_classic()

p1


