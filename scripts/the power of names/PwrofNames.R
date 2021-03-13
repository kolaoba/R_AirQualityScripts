wkdir <- "C:/Users/koli0/Downloads/Compressed/archive/"

csvs <- list.files(path = wkdir, pattern = "*.csv")

csvs
#granular, so hour
setwd(wkdir)
testr1 <- read.csv(paste(wkdir,csvs[2],sep =""))

testr1 <- read.csv(csvs[2])

head(testr1)
summary(testr1)

#want to work with openair, as such, would need a date column for r to understand

testr1$date <- as.POSIXct(testr1$Datetime, tz = "GMT", "%Y-%m-%d %H:%M:%S")

summary(testr1)


#let's see the unique cities

unique(testr1$City)

mumbai_aq <- filter(testr1, City == "Mumbai" )

names(mumbai_aq)

# say we want to plot diurnal plots of NOx, CO and O3, cos chemical relationship

# there's a neat package for air quality analysis created by my main man, David Carslaw, check him out

# let's install his package! 

# install.packages("openair")

#load it!
library(openair)

#hello timevariation

nox_plt <- timeVariation(mumbai_aq, pollutant = 'NOx')

# how do we extract the hour plot

# david has documentation on this, using the subset function

nox_plt_hr <- plot(nox_plt, subset = "hour")

nox_plt_hr


# alas we cannot assign it to a variable

# let's fix this

#back to nox_plt

nox_plt

#it's anopenair object, object items can be referenced easily in r with either $ or [[]]

names(nox_plt)
names(nox_plt$plot)
nox_plt$plot[2]

#let's try assigning it now

nox_plt_hr <- nox_plt$plot$hour

nox_plt_hr

# this is awesome! now we can replicate for co and o3 real quick

co_plt <- timeVariation(mumbai_aq, pollutant = 'CO')
co_plt_hr <- co_plt$plot$hour

o3_plt <- timeVariation(mumbai_aq, pollutant = 'O3')
o3_plt_hr <- o3_plt$plot$hour

names(o3_plt_hr)
names(o3_plt_hr$hour)

#so i can edit any of these components by inxexing them

# let's add a main title to each plot
o3_plt_hr$hour$main <- bquote(O[3]~Diurnal~Plot)
o3_plt_hr$hour$ylab <- "Mass Concentration (ppm)"
o3_plt_hr

nox_plt_hr$hour$main <- bquote(NO[x]~Diurnal~Plot)
nox_plt_hr$hour$ylab <- "Mass Concentration (ppm)"
nox_plt_hr

co_plt_hr$hour$main <- bquote(CO~Diurnal~Plot)
co_plt_hr$hour$ylab <- "Mass Concentration (ppm)"
co_plt_hr


# awesome, we have the three plots, now let's stack them on each other

# so we can eaily identify any relationship 

jpeg(file="diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(o3_plt_hr, position = c(0, 0.67, 1, 1), more = TRUE)
print(nox_plt_hr, position = c(0, 0.33, 1, 0.67),more = TRUE)
print(co_plt_hr, position = c(0, 0, 1, 0.33))
#Close plot
dev.off()


# more next week on how to stack different types of plots? let's see how that goes!







