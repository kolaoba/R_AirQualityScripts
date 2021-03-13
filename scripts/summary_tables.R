library(tidyverse);library(plyr);library(data.table)
library(openair);library(sqldf);library(ggplot2);library(dplyr)
library(openxlsx);library(readxl);library(ggpubr);library(lubridate)
library(scales);library(tidyr);library(EnvStats)
library(cowplot)


 # import zeph data ###################################
#import aug 5min
aug5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/August Database/AQ_5min_August_QC.xlsx"
excel_sheets(aug5minfile)[1:6]
augabe <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[1], na = "NA",guess_max = 10000)
augiko <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[2], na = "NA",guess_max = 10000)
augjan <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[3], na = "NA",guess_max = 10000)
auglas <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[4], na = "NA",guess_max = 10000)
augncf <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[5], na = "NA",guess_max = 10000)
auguni <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[6], na = "NA",guess_max = 10000)

#import sep 5min
sep5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/September Database/AQ_5min_September_QC.xlsx"
excel_sheets(sep5minfile)[1:6]
sepabe <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[1], na = "NA",guess_max = 10000)
sepiko <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[2], na = "NA",guess_max = 10000)
sepjan <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[3], na = "NA",guess_max = 10000)
seplas <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[4], na = "NA",guess_max = 10000)
sepncf <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[5], na = "NA",guess_max = 10000)
sepuni <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[6], na = "NA",guess_max = 10000)

#import oct 5min
oct5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/October Database/AQ_5min_October_QC.xlsx"
excel_sheets(oct5minfile)[1:6]
octabe <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[1], na = "NA",guess_max = 10000)
octiko <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[2], na = "NA",guess_max = 10000)
octjan <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[3], na = "NA",guess_max = 10000)
octlas <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[4], na = "NA",guess_max = 10000)
octncf <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[5], na = "NA",guess_max = 10000)
octuni <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[6], na = "NA",guess_max = 10000)

#import nov 5min
nov5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/November Database/AQ_5min_November_QC.xlsx"
excel_sheets(nov5minfile)[1:6]
novabe <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[1], na = "NA",guess_max = 10000)
noviko <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[2], na = "NA",guess_max = 10000)
novjan <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[3], na = "NA",guess_max = 10000)
novlas <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[4], na = "NA",guess_max = 10000)
novncf <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[5], na = "NA",guess_max = 10000)
novuni <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[6], na = "NA",guess_max = 10000)

#import dec 5min
dec5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/December Database/AQ_5min_December_QC.xlsx"
excel_sheets(dec5minfile)[1:6]
decabe <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[1], na = "NA",guess_max = 10000)
deciko <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[2], na = "NA",guess_max = 10000)
decjan <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[3], na = "NA",guess_max = 10000)
declas <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[4], na = "NA",guess_max = 10000)
decncf <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[5], na = "NA",guess_max = 10000)
decuni <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[6], na = "NA",guess_max = 10000)

#import jan 5min
jan5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/January Database/AQ_5min_January_QC.xlsx"
excel_sheets(jan5minfile)[1:6]
janabe <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[1], na = "NA",guess_max = 10000)
janiko <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[2], na = "NA",guess_max = 10000)
janjan <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[3], na = "NA",guess_max = 10000)
janlas <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[4], na = "NA",guess_max = 10000)
janncf <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[5], na = "NA",guess_max = 10000)
januni <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[6], na = "NA",guess_max = 10000)


# bind each site for all six months
abe_bind <- rbind(augabe,sepabe,octabe,novabe,decabe,janabe)
iko_bind <- rbind(augiko,sepiko,octiko,noviko,deciko,janiko)
jan_bind <- rbind(augjan,sepjan,octjan,novjan,decjan,janjan)
las_bind <- rbind(auglas,seplas,octlas,novlas,declas,janlas)
ncf_bind <- rbind(augncf,sepncf,octncf,novncf,decncf,janncf)
uni_bind <- rbind(auguni,sepuni,octuni,novuni,decuni,januni)

names(abe_bind)[names(abe_bind) == "DateTime"] <- "date"
names(iko_bind)[names(iko_bind) == "DateTime"] <- "date"
names(jan_bind)[names(jan_bind) == "DateTime"] <- "date"
names(las_bind)[names(las_bind) == "DateTime"] <- "date"
names(ncf_bind)[names(ncf_bind) == "DateTime"] <- "date"
names(uni_bind)[names(uni_bind) == "DateTime"] <- "date"




startDate <- "2020-08-01 00:00:00" # august 1 2020
endDate <- "2021-01-31 23:59:00" # january 31 2021

# average to 5 min

abe_5min <- timeAverage(abe_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
iko_5min <- timeAverage(iko_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
jan_5min <- timeAverage(jan_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
las_5min <- timeAverage(las_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_5min <- timeAverage(ncf_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
uni_5min <- timeAverage(uni_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)

# # average to 1 hour
# 
# abe_1h <- timeAverage(abe_bind, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# iko_1h <- timeAverage(iko_bind, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# jan_1h <- timeAverage(jan_bind, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# las_1h <- timeAverage(las_bind, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# ncf_1h <- timeAverage(ncf_bind, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# uni_1h <- timeAverage(uni_bind, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# 
# # average to 8 hour
# 
# abe_8h <- timeAverage(abe_bind, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# iko_8h <- timeAverage(iko_bind, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# jan_8h <- timeAverage(jan_bind, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# las_8h <- timeAverage(las_bind, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# ncf_8h <- timeAverage(ncf_bind, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# uni_8h <- timeAverage(uni_bind, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# 
# # average to 24 hour
# 
# abe_24h <- timeAverage(abe_bind, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# iko_24h <- timeAverage(iko_bind, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# jan_24h <- timeAverage(jan_bind, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# las_24h <- timeAverage(las_bind, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# ncf_24h <- timeAverage(ncf_bind, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
# uni_24h <- timeAverage(uni_bind, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)

# iko_24h
# pm25_iko_24h_summ <- filter(iko_24h, pm25_24h > 25)

names(abe_24h)

newcolnames_5min <- c("date"    ,   "no2_5min" , "o3_5min"  , "no_5min"  , "so2_5min" ,
                    "lat_5min" , "lon_5min" , "pm1_5min" , "pm25_5min" ,"pm10_5min", "co_5min" , 
                    "tvoc_5min" , "co2_5min" )
# newcolnames_1h <- c("date"    ,   "no2_1h" , "o3_1h"  , "no_1h"  , "so2_1h" ,
#                  "lat_1h" , "lon_1h" , "pm1_1h" , "pm25_1h" ,"pm10_1h", "co_1h" , 
#                  "tvoc_1h" , "co2_1h" )
# newcolnames_24h <- c("date"    ,   "no2_24h" , "o3_24h"  , "no_24h"  , "so2_24h" ,
#                  "lat_24h" , "lon_24h" , "pm1_24h" , "pm25_24h" ,"pm10_24h", "co_24h" , 
#                  "tvoc_24h" , "co2_24h" )
# newcolnames_8h <- c("date"    ,   "no2_8h" , "o3_8h"  , "no_8h"  , "so2_8h" ,
#                  "lat_8h" , "lon_8h" , "pm1_8h" , "pm25_8h" ,"pm10_8h", "co_8h" , 
#                  "tvoc_8h" , "co2_8h" )

colnames(abe_5min) <- newcolnames_5min
colnames(iko_5min) <- newcolnames_5min
colnames(jan_5min) <- newcolnames_5min
colnames(las_5min) <- newcolnames_5min
colnames(ncf_5min) <- newcolnames_5min
colnames(uni_5min) <- newcolnames_5min

# 
# colnames(abe_24h) <- newcolnames_24h
# colnames(iko_24h) <- newcolnames_24h
# colnames(jan_24h) <- newcolnames_24h
# colnames(las_24h) <- newcolnames_24h
# colnames(ncf_24h) <- newcolnames_24h
# colnames(uni_24h) <- newcolnames_24h
# 
# colnames(abe_8h) <- newcolnames_8h
# colnames(iko_8h) <- newcolnames_8h
# colnames(jan_8h) <- newcolnames_8h
# colnames(las_8h) <- newcolnames_8h
# colnames(ncf_8h) <- newcolnames_8h
# colnames(uni_8h) <- newcolnames_8h
# 
# colnames(abe_1h) <- newcolnames_1h
# colnames(iko_1h) <- newcolnames_1h
# colnames(jan_1h) <- newcolnames_1h
# colnames(las_1h) <- newcolnames_1h
# colnames(ncf_1h) <- newcolnames_1h
# colnames(uni_1h) <- newcolnames_1h
# 

abe_5min$site <- "abesan"
iko_5min$site <- "ikorodu"
jan_5min$site <- "jankara"
las_5min$site <- "lasepa"
ncf_5min$site <- "ncf"
uni_5min$site <- "unilag"

abe_merge <- abe_5min
iko_merge <- iko_5min
jan_merge <- jan_5min
las_merge <- las_5min
ncf_merge <- ncf_5min
uni_merge <- uni_5min

# 
# abe_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(abe_5min,abe_1h, abe_8h, abe_24h))
# iko_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(iko_5min,iko_1h, iko_8h, iko_24h))
# jan_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(jan_5min,jan_1h, jan_8h, jan_24h))
# las_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(las_5min,las_1h, las_8h, las_24h))
# ncf_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(ncf_5min,ncf_1h, ncf_8h, ncf_24h))
# uni_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(uni_5min,uni_1h, uni_8h, uni_24h))

allsites <- rbind(abe_merge, iko_merge, jan_merge,las_merge,ncf_merge,uni_merge)
allsites$monthName <- format(allsites$date,"%b %Y")

is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

allsites[is.nan(allsites)] <- NA

################################################################
# filter -999 values ##################################

abe_bind_valid <- abe_bind
iko_bind_valid <- iko_bind
jan_bind_valid <- jan_bind
las_bind_valid <- las_bind
ncf_bind_valid <- ncf_bind
uni_bind_valid <- uni_bind

is.na(abe_bind_valid) <- abe_bind_valid < 0
is.na(iko_bind_valid) <- iko_bind_valid < 0
is.na(jan_bind_valid) <- jan_bind_valid < 0
is.na(las_bind_valid) <- las_bind_valid < 0
is.na(ncf_bind_valid) <- ncf_bind_valid < 0
is.na(uni_bind_valid) <- uni_bind_valid < 0



startDate <- "2020-08-01 00:00:00" # august 1 2020
endDate <- "2021-01-31 23:59:00" # february 1 2021

# average to 5 min

abe_5min_valid <- timeAverage(abe_bind_valid, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
iko_5min_valid <- timeAverage(iko_bind_valid, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
jan_5min_valid <- timeAverage(jan_bind_valid, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
las_5min_valid <- timeAverage(las_bind_valid, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_5min_valid <- timeAverage(ncf_bind_valid, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
uni_5min_valid <- timeAverage(uni_bind_valid, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)

# average to 1 hour

abe_1h_valid <- timeAverage(abe_bind_valid, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
iko_1h_valid <- timeAverage(iko_bind_valid, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
jan_1h_valid <- timeAverage(jan_bind_valid, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
las_1h_valid <- timeAverage(las_bind_valid, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_1h_valid <- timeAverage(ncf_bind_valid, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)
uni_1h_valid <- timeAverage(uni_bind_valid, avg.time = "1 hour", statistic = "mean", start.date = startDate, end.date = endDate)

# average to 8 hour

abe_8h_valid <- timeAverage(abe_bind_valid, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
iko_8h_valid <- timeAverage(iko_bind_valid, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
jan_8h_valid <- timeAverage(jan_bind_valid, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
las_8h_valid <- timeAverage(las_bind_valid, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_8h_valid <- timeAverage(ncf_bind_valid, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)
uni_8h_valid <- timeAverage(uni_bind_valid, avg.time = "8 hour", statistic = "mean", start.date = startDate, end.date = endDate)

# average to 24 hour

abe_24h_valid <- timeAverage(abe_bind_valid, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
iko_24h_valid <- timeAverage(iko_bind_valid, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
jan_24h_valid <- timeAverage(jan_bind_valid, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
las_24h_valid <- timeAverage(las_bind_valid, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_24h_valid <- timeAverage(ncf_bind_valid, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)
uni_24h_valid <- timeAverage(uni_bind_valid, avg.time = "24 hour", statistic = "mean", start.date = startDate, end.date = endDate)





newcolnames_5min <- c("date"    ,   "no2_5min" , "o3_5min"  , "no_5min"  , "so2_5min" ,
                      "lat_5min" , "lon_5min" , "pm1_5min" , "pm25_5min" ,"pm10_5min", "co_5min" , 
                      "tvoc_5min" , "co2_5min" )
newcolnames_1h <- c("date"    ,   "no2_1h" , "o3_1h"  , "no_1h"  , "so2_1h" ,
                    "lat_1h" , "lon_1h" , "pm1_1h" , "pm25_1h" ,"pm10_1h", "co_1h" , 
                    "tvoc_1h" , "co2_1h" )
newcolnames_24h <- c("date"    ,   "no2_24h" , "o3_24h"  , "no_24h"  , "so2_24h" ,
                     "lat_24h" , "lon_24h" , "pm1_24h" , "pm25_24h" ,"pm10_24h", "co_24h" , 
                     "tvoc_24h" , "co2_24h" )
newcolnames_8h <- c("date"    ,   "no2_8h" , "o3_8h"  , "no_8h"  , "so2_8h" ,
                    "lat_8h" , "lon_8h" , "pm1_8h" , "pm25_8h" ,"pm10_8h", "co_8h" , 
                    "tvoc_8h" , "co2_8h" )

colnames(abe_5min_valid) <- newcolnames_5min
colnames(iko_5min_valid) <- newcolnames_5min
colnames(jan_5min_valid) <- newcolnames_5min
colnames(las_5min_valid) <- newcolnames_5min
colnames(ncf_5min_valid) <- newcolnames_5min
colnames(uni_5min_valid) <- newcolnames_5min


colnames(abe_24h_valid) <- newcolnames_24h
colnames(iko_24h_valid) <- newcolnames_24h
colnames(jan_24h_valid) <- newcolnames_24h
colnames(las_24h_valid) <- newcolnames_24h
colnames(ncf_24h_valid) <- newcolnames_24h
colnames(uni_24h_valid) <- newcolnames_24h

colnames(abe_8h_valid) <- newcolnames_8h
colnames(iko_8h_valid) <- newcolnames_8h
colnames(jan_8h_valid) <- newcolnames_8h
colnames(las_8h_valid) <- newcolnames_8h
colnames(ncf_8h_valid) <- newcolnames_8h
colnames(uni_8h_valid) <- newcolnames_8h

colnames(abe_1h_valid) <- newcolnames_1h
colnames(iko_1h_valid) <- newcolnames_1h
colnames(jan_1h_valid) <- newcolnames_1h
colnames(las_1h_valid) <- newcolnames_1h
colnames(ncf_1h_valid) <- newcolnames_1h
colnames(uni_1h_valid) <- newcolnames_1h


abe_5min_valid$site <- "abesan"
iko_5min_valid$site <- "ikorodu"
jan_5min_valid$site <- "jankara"
las_5min_valid$site <- "lasepa"
ncf_5min_valid$site <- "ncf"
uni_5min_valid$site <- "unilag"

abe_24h <- abe_24h_valid
iko_24h <- iko_24h_valid
jan_24h <- jan_24h_valid
las_24h <- las_24h_valid
ncf_24h <- ncf_24h_valid
uni_24h <- uni_24h_valid

abe_24h$site <- "abesan"
iko_24h$site <- "ikorodu"
jan_24h$site <- "jankara"
las_24h$site <- "lasepa"
ncf_24h$site <- "ncf"
uni_24h$site <- "unilag"


abe_merge_valid <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(abe_5min_valid,abe_1h_valid, abe_8h_valid, abe_24h_valid))
iko_merge_valid <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(iko_5min_valid,iko_1h_valid, iko_8h_valid, iko_24h_valid))
jan_merge_valid <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(jan_5min_valid,jan_1h_valid, jan_8h_valid, jan_24h_valid))
las_merge_valid <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(las_5min_valid,las_1h_valid, las_8h_valid, las_24h_valid))
ncf_merge_valid <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(ncf_5min_valid,ncf_1h_valid, ncf_8h_valid, ncf_24h_valid))
uni_merge_valid <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(uni_5min_valid,uni_1h_valid, uni_8h_valid, uni_24h_valid))

allsites_valid <- rbind(abe_merge_valid, iko_merge_valid, jan_merge_valid,las_merge_valid,ncf_merge_valid,uni_merge_valid)
allsites_24h <- rbind(abe_24h, iko_24h, jan_24h,las_24h,ncf_24h,uni_24h)
allsites_5min <- rbind(abe_5min_valid, iko_5min_valid, jan_5min_valid,las_5min_valid,ncf_5min_valid,uni_5min_valid)
allsites_valid$monthName <- format(allsites_valid$date,"%b %y")



summary(allsites)


allsites_valid[is.nan(allsites_valid)] <- NA

summary(allsites_valid)
# Summary Tables for plots ###############################

summ_tbl <- sqldf("SELECT
                  UPPER(site) as SITE,
                  SUM(so2_24h > 20) as so2_24h,
                  SUM(pm25_24h > 25) as pm25_24h,
                  SUM(pm10_24h > 50) as pm10_24h,
                  SUM(no2_1h > 188.1) as no2_1h,
                  SUM(so2_1h > 196.2) as so2_1h,
                  SUM(o3_1h > 180) as o3_1h,
                  SUM(co_1h > 10) as co_1h,
                  SUM(o3_8h > 100) as o3_8h,
                  SUM(co_8h > 5) as co_8h
                  FROM 
                  allsites_valid
                  GROUP BY site
                  ORDER BY site ")

summ_tbl
expdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables"

write.csv(summ_tbl, paste(expdir,"six_months_summary_table.csv", sep= "/"), row.names = FALSE)


summ_tbl_mnth <- sqldf("SELECT
                  UPPER(site) as SITE,
                  monthName as Month,
                  SUM(so2_24h > 20) as so2_24h,
                  SUM(pm25_24h > 25) as pm25_24h,
                  SUM(pm10_24h > 50) as pm10_24h,
                  SUM(no2_1h > 200) as no2_1h,
                  SUM(so2_1h > 196.2) as so2_1h,
                  SUM(o3_1h > 180) as o3_1h,
                  SUM(co_1h > 10) as co_1h,
                  SUM(o3_8h > 100) as o3_8h,
                  SUM(co_8h > 5) as co_8h
                  FROM 
                  allsites_valid
                  GROUP BY site, monthName
                  ORDER BY site, monthName ")

write.csv(summ_tbl_mnth, paste(expdir,"six_months_summary_table_by_mnth.csv", sep= "/"), row.names = FALSE)

######### Exceedances Bar Plots ###########################################

# summ_tbl_mnth$Month <- factor(summ_tbl_mnth$Month, levels = c("Aug 20", "Sep 20", "Oct 20", "Nov 20", "Dec 20", "Jan 21"))
summ_tbl_mnth$Month <- factor(summ_tbl_mnth$Month, levels = c("Aug 20", "Sep 20", "Oct 20", "Nov 20", "Dec 20", "Jan 21"))

# co_1h plot
co_1hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=co_1h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("CO 1-hour Exceedances") +
  theme_bw()+
  ggtitle("CO 1-hour Exceedances per site from August 2020 to January 2021")
co_1hplot

# o3_1h plot
o3_1hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=o3_1h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("Ozone 1-hour Exceedances") +
  theme_bw()+
  ggtitle("Ozone 1-hour Exceedances per site from August 2020 to January 2021")
o3_1hplot

# so2_1h plot
so2_1hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=so2_1h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("SO2 1-hour Exceedances") +
  theme_bw()+
  ggtitle("SO2 1-hour Exceedances per site from August 2020 to January 2021")
so2_1hplot

# No2_1h plot
no2_1hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=no2_1h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("NO2 1-hour Exceedances") +
  theme_bw()+
  ggtitle("NO2 1-hour Exceedances per site from August 2020 to January 2021")
no2_1hplot


# o3_8h plot
o3_8hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=o3_8h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("Ozone 8-hour Exceedances") +
  theme_bw()+
  ggtitle("Ozone 8-hour Exceedances per site from August 2020 to January 2021")
o3_8hplot


# co_8h plot
co_8hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=co_8h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("CO 8-hour Exceedances") +
  theme_bw()+
  ggtitle("CO 8-hour Exceedances per site from August 2020 to January 2021")
co_8hplot

# SO2_24h plot
so2_24hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=so2_24h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("SO2 24-hour Exceedances") +
  theme_bw()+
  ggtitle("SO2 24-hour Exceedances per site from August 2020 to January 2021")
so2_24hplot

# pm25_24h plot
pm25_24hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=pm25_24h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("PM2.5 24-hour Exceedances") +
  theme_bw()+
  ggtitle("PM2.5 24-hour Exceedances per site from August 2020 to January 2021")
pm25_24hplot

# pm10_24h plot
pm10_24hplot <- ggplot(summ_tbl_mnth, aes(fill=SITE, y=pm10_24h, x=Month)) + 
  geom_bar(position="stack", stat="identity") + 
  xlab("Site") +
  ylab("PM10 24-hour Exceedances") +
  theme_bw()+
  ggtitle("PM10 24-hour Exceedances per site from August 2020 to January 2021")
pm10_24hplot



#######export exceedances count plots #############

pltheight <- 3000
pltwidth <- 5000


expdir
expdirplots <- paste(expdir,"Exceedances plots", sep ="/")
dir.create(expdirplots)
setwd(expdirplots)

# Open a tiff file
jpeg(file="co_1hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(co_1hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="o3_1hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(o3_1hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="so2_1hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(so2_1hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="no2_1hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(no2_1hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="o3_8hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(o3_8hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="co_8hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(co_8hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="so2_24hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(so2_24hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="pm25_24hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(pm25_24hplot)
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="pm10_24hplot.jpeg", res=700, width=pltwidth, height=pltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(pm10_24hplot)
# Close the pdf file
dev.off()



# Summary Table o3

o3_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN o3_5min != -999 OR o3_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
o3_24hmaxdaily <- sqldf("SELECT site,AVG(o3_5min) as 'o3 Mean concentration',MAX(o3_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
o3_24h_max2daily <- sqldf("SELECT site,MAX (o3_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE o3_24h NOT IN (SELECT MAX (o3_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
o3_8hmaxdaily <- sqldf("SELECT site,MAX(o3_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
o3_8h_max2daily <- sqldf("SELECT site,MAX (o3_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE o3_8h NOT IN (SELECT MAX (o3_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
o3_1hmaxdaily <- sqldf("SELECT site,MAX(o3_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
o3_1h_max2daily <- sqldf("SELECT site,MAX (o3_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE o3_1h NOT IN (SELECT MAX (o3_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
o3_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(o3_percvalid,o3_24hmaxdaily,o3_24h_max2daily,o3_8hmaxdaily,o3_8h_max2daily,o3_1hmaxdaily,o3_1h_max2daily))
o3_summtbl

# Summary Table so2

so2_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN so2_5min != -999 OR so2_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
so2_24hmaxdaily <- sqldf("SELECT site,AVG(so2_5min) as 'so2 Mean concentration',MAX(so2_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
so2_24h_max2daily <- sqldf("SELECT site,MAX (so2_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE so2_24h NOT IN (SELECT MAX (so2_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
so2_8hmaxdaily <- sqldf("SELECT site,MAX(so2_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
so2_8h_max2daily <- sqldf("SELECT site,MAX (so2_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE so2_8h NOT IN (SELECT MAX (so2_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
so2_1hmaxdaily <- sqldf("SELECT site,MAX(so2_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
so2_1h_max2daily <- sqldf("SELECT site,MAX (so2_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE so2_1h NOT IN (SELECT MAX (so2_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
so2_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(so2_percvalid,so2_24hmaxdaily,so2_24h_max2daily,so2_8hmaxdaily,so2_8h_max2daily,so2_1hmaxdaily,so2_1h_max2daily))
so2_summtbl

# Summary Table co2

co2_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN co2_5min != -999 OR co2_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
co2_24hmaxdaily <- sqldf("SELECT site,AVG(co2_5min) as 'Mean concentration',MAX(co2_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
co2_24h_max2daily <- sqldf("SELECT site,MAX (co2_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE co2_24h NOT IN (SELECT MAX (co2_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
co2_8hmaxdaily <- sqldf("SELECT site,MAX(co2_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
co2_8h_max2daily <- sqldf("SELECT site,MAX (co2_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE co2_8h NOT IN (SELECT MAX (co2_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
co2_1hmaxdaily <- sqldf("SELECT site,MAX(co2_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
co2_1h_max2daily <- sqldf("SELECT site,MAX (co2_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE co2_1h NOT IN (SELECT MAX (co2_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
co2_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(co2_percvalid,co2_24hmaxdaily,co2_24h_max2daily,co2_8hmaxdaily,co2_8h_max2daily,co2_1hmaxdaily,co2_1h_max2daily))
co2_summtbl

# Summary Table no2

no2_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN no2_5min != -999 OR no2_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
no2_24hmaxdaily <- sqldf("SELECT site,AVG(no2_5min) as 'Mean concentration',MAX(no2_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
no2_24h_max2daily <- sqldf("SELECT site,MAX (no2_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE no2_24h NOT IN (SELECT MAX (no2_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
no2_8hmaxdaily <- sqldf("SELECT site,MAX(no2_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
no2_8h_max2daily <- sqldf("SELECT site,MAX (no2_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE no2_8h NOT IN (SELECT MAX (no2_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
no2_1hmaxdaily <- sqldf("SELECT site,MAX(no2_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
no2_1h_max2daily <- sqldf("SELECT site,MAX (no2_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE no2_1h NOT IN (SELECT MAX (no2_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
no2_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(no2_percvalid,no2_24hmaxdaily,no2_24h_max2daily,no2_8hmaxdaily,no2_8h_max2daily,no2_1hmaxdaily,no2_1h_max2daily))
no2_summtbl


# Summary Table no

no_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN no_5min != -999 OR no_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
no_24hmaxdaily <- sqldf("SELECT site,AVG(no_5min) as 'Mean concentration',MAX(no_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
no_24h_max2daily <- sqldf("SELECT site,MAX (no_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE no_24h NOT IN (SELECT MAX (no_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
no_8hmaxdaily <- sqldf("SELECT site,MAX(no_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
no_8h_max2daily <- sqldf("SELECT site,MAX (no_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE no_8h NOT IN (SELECT MAX (no_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
no_1hmaxdaily <- sqldf("SELECT site,MAX(no_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
no_1h_max2daily <- sqldf("SELECT site,MAX (no_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE no_1h NOT IN (SELECT MAX (no_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
no_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(no_percvalid,no_24hmaxdaily,no_24h_max2daily,no_8hmaxdaily,no_8h_max2daily,no_1hmaxdaily,no_1h_max2daily))
no_summtbl

# Summary Table pm25

pm25_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN pm25_5min != -999 OR pm25_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
pm25_24hmaxdaily <- sqldf("SELECT site,AVG(pm25_5min) as 'Mean concentration',MAX(pm25_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
pm25_24h_max2daily <- sqldf("SELECT site,MAX (pm25_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE pm25_24h NOT IN (SELECT MAX (pm25_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
pm25_8hmaxdaily <- sqldf("SELECT site,MAX(pm25_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
pm25_8h_max2daily <- sqldf("SELECT site,MAX (pm25_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE pm25_8h NOT IN (SELECT MAX (pm25_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
pm25_1hmaxdaily <- sqldf("SELECT site,MAX(pm25_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
pm25_1h_max2daily <- sqldf("SELECT site,MAX (pm25_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE pm25_1h NOT IN (SELECT MAX (pm25_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
pm25_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(pm25_percvalid,pm25_24hmaxdaily,pm25_24h_max2daily,pm25_8hmaxdaily,pm25_8h_max2daily,pm25_1hmaxdaily,pm25_1h_max2daily))
pm25_summtbl

# Summary Table pm10

pm10_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN pm10_5min != -999 OR pm10_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
pm10_24hmaxdaily <- sqldf("SELECT site,AVG(pm10_5min) as 'Mean concentration',MAX(pm10_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
pm10_24h_max2daily <- sqldf("SELECT site,MAX (pm10_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE pm10_24h NOT IN (SELECT MAX (pm10_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
pm10_8hmaxdaily <- sqldf("SELECT site,MAX(pm10_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
pm10_8h_max2daily <- sqldf("SELECT site,MAX (pm10_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE pm10_8h NOT IN (SELECT MAX (pm10_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
pm10_1hmaxdaily <- sqldf("SELECT site,MAX(pm10_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
pm10_1h_max2daily <- sqldf("SELECT site,MAX (pm10_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE pm10_1h NOT IN (SELECT MAX (pm10_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
pm10_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(pm10_percvalid,pm10_24hmaxdaily,pm10_24h_max2daily,pm10_8hmaxdaily,pm10_8h_max2daily,pm10_1hmaxdaily,pm10_1h_max2daily))
pm10_summtbl

# Summary Table tvoc

tvoc_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN tvoc_5min != -999 OR tvoc_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")
tvoc_24hmaxdaily <- sqldf("SELECT site,AVG(tvoc_5min) as 'Mean concentration',MAX(tvoc_24h) as '24h 1st Max',date FROM allsites_valid GROUP BY site")
tvoc_24h_max2daily <- sqldf("SELECT site,MAX (tvoc_24h) as '24h 2nd Max' ,date FROM allsites_valid WHERE tvoc_24h NOT IN (SELECT MAX (tvoc_24h) FROM allsites_valid  GROUP BY site) GROUP BY site")
tvoc_8hmaxdaily <- sqldf("SELECT site,MAX(tvoc_8h) as '8h 1st Max',date FROM allsites_valid GROUP BY site")
tvoc_8h_max2daily <- sqldf("SELECT site,MAX (tvoc_8h) as '8h 2nd Max' ,date FROM allsites_valid WHERE tvoc_8h NOT IN (SELECT MAX (tvoc_8h) FROM allsites_valid  GROUP BY site) GROUP BY site")
tvoc_1hmaxdaily <- sqldf("SELECT site,MAX(tvoc_1h) as '1h 1st Max',date FROM allsites_valid GROUP BY site")
tvoc_1h_max2daily <- sqldf("SELECT site,MAX (tvoc_1h) as '1h 2nd Max' ,date FROM allsites_valid WHERE tvoc_1h NOT IN (SELECT MAX (tvoc_1h) FROM allsites_valid  GROUP BY site) GROUP BY site")
tvoc_summtbl <- Reduce(function(x, y) merge(x, y,by = "site", all=TRUE), list(tvoc_percvalid,tvoc_24hmaxdaily,tvoc_24h_max2daily,tvoc_8hmaxdaily,tvoc_8h_max2daily,tvoc_1hmaxdaily,tvoc_1h_max2daily))
tvoc_summtbl


sort(colnames(allsites_valid))
summary(allsites_valid)



o3_percvalid <- sqldf("SELECT site,ROUND((100.0 * SUM(CASE WHEN o3_5min != -999 OR o3_5min != NULL THEN 1 ELSE 0 END) / count(date)),1) as 'Percent valid data' FROM allsites  GROUP BY site")





summary(abe_5min_valid)


allsites_5min<- rbind(abe_5min_valid	,iko_5min_valid,jan_5min_valid,las_5min_valid,ncf_5min_valid,uni_5min_valid)

allsites_5min[is.nan(allsites_5min)] <- NA

# write.csv(na.omit(allsites_5min), "ANOVA Analysis.csv",row.names = FALSE)
# na_allsites_5min <- allsites_5min
# xl_list <- list("abesan" =filter(na_allsites_5min, site == "abesan"),
#                 "ikorodu" =filter(na_allsites_5min, site == "ikorodu"),
#                 "jankara" =filter(na_allsites_5min, site == "jankara"),
#                 "lasepa" =filter(na_allsites_5min, site == "lasepa"),
#                 "ncf" =filter(na_allsites_5min, site == "ncf"),
#                 "unilag" =filter(na_allsites_5min, site == "unilag"))
# 
# summary(na_allsites_5min)
# write.xlsx(x = xl_list,"ANOVA Analysis_noNA.xlsx",row.names = FALSE)
# getwd()

# cut pm25 and 10 into ranges for histograms ########################

allsites_24h$pm25range <- cut(allsites_24h$pm25_24h, breaks = c(-Inf,15,25,35,50,65,75,85,100, Inf), 
                               labels = c("0-15","16-25","26-35","36-50","51-65","66-75","76-85","86-100","100<"), include.lowest = TRUE)

allsites_24h$pm10range <- cut(allsites_24h$pm10_24h, breaks = c(-Inf, 25,50,75,100,125,150,175,200, Inf), 
                               labels = c("0-25","26-50","51-75","76-100","101-125","126-150","151-175","176-200","200<"), include.lowest = TRUE)


pm25lvls <- levels(allsites_24h$pm25range)



# cut data by the hour for boxplot
allsites_5min <- cutData(allsites_5min, type = "hour")

#make hour numeric for cut function to work
allsites_5min$hour <- as.numeric(allsites_5min$hour)

# create label based on hour of day
allsites_5min$time_of_day <- cut(x =allsites_5min$hour,breaks = c("00","06","12","18","24"),
                                labels = c("Night", "Morning", "Afternoon", "Evening"), include.lowest = TRUE)

# filtering by sites
abe_24h_new <- filter(allsites_24h, site == "abesan")
iko_24h_new <- filter(allsites_24h, site == "ikorodu")
jan_24h_new <- filter(allsites_24h, site == "jankara")
las_24h_new <- filter(allsites_24h, site == "lasepa")
ncf_24h_new <- filter(allsites_24h, site == "ncf")
uni_24h_new <- filter(allsites_24h, site == "unilag")

#pm histograms plots ##########################################
summary(abe_24h_new)

histdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/PM histograms"
dir.create(histdir)
setwd(histdir)

pm25who <- 
  (which(levels(allsites_24h$pm25range) == "16-25") +
     which(levels(allsites_24h$pm25range) == "26-35")) / 2
pm25epa <- 
  (which(levels(allsites_24h$pm25range) == "26-35") +
     which(levels(allsites_24h$pm25range) == "36-50")) / 2

pm10who <- 
  (which(levels(allsites_24h$pm10range) == "26-50") +
     which(levels(allsites_24h$pm10range) == "51-75")) / 2
pm10epa <- 
  (which(levels(allsites_24h$pm10range) == "126-150") +
     which(levels(allsites_24h$pm10range) == "151-175")) / 2


# ABESAN TO JANKARA ########################################

#Abesan pm hist

# abepm25hist
abe_pm25_hist_tbl <- abe_24h_new %>%
  drop_na(pm25range) %>%
  group_by(pm25range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
abe_pm25_hist_tbl

abe_pm25_labperc <- percent(abe_pm25_hist_tbl[['Ratio']][2] + abe_pm25_hist_tbl[['Ratio']][1], accuracy = 0.1)
abe_pm25_labperc2 <- percent(1 - abe_pm25_hist_tbl[['Ratio']][1] - abe_pm25_hist_tbl[['Ratio']][2] -abe_pm25_hist_tbl[['Ratio']][3] ,accuracy = 0.1)
arrw25height <- max(abe_pm25_hist_tbl[['Ratio']]) + 0.015
lab25height <- arrw25height + 0.03

abepm25_hist <- ggplot(abe_pm25_hist_tbl, aes(x=pm25range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy =1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm25who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm25epa, color = "red", lty = 2) +
  ggtitle("Abesan PM2.5") + 
  annotate(geom="text", x=pm25who - 0.3, y=lab25height, label=abe_pm25_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm25epa + 0.3, y=lab25height, label=abe_pm25_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm25who, y = arrw25height, xend = pm25who - 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm25epa, y = arrw25height, xend = pm25epa + 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
abepm25_hist

# abepm10hist
abe_pm10_hist_tbl <- abe_24h_new %>%
  drop_na(pm10range) %>%
  group_by(pm10range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
abe_pm10_hist_tbl

abe_pm10_labperc <- percent(abe_pm10_hist_tbl[['Ratio']][2] + abe_pm10_hist_tbl[['Ratio']][1], accuracy = 0.1)
abe_pm10_labperc2 <- percent(1 - abe_pm10_hist_tbl[['Ratio']][1] - abe_pm10_hist_tbl[['Ratio']][2],accuracy = 0.1)
arrw10height <- max(abe_pm10_hist_tbl[['Ratio']]) + 0.015
lab10height <- arrw10height + 0.03

abepm10_hist <- ggplot(abe_pm10_hist_tbl, aes(x=pm10range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm10who, color = "grey3", lty = 2) +
  # geom_vline(xintercept = pm10who, color = "red", lty = 2) +
  ggtitle("Abesan PM10") + 
  annotate(geom="text", x=pm10who - 0.3, y=lab10height, label=abe_pm10_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm10who + 0.3, y=lab10height, label=abe_pm10_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who - 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who + 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
abepm10_hist


abehist <- plot_grid(abepm25_hist,abepm10_hist, ncol = 2, labels = "AUTO")
abehist

#Ikorodu pm hist

# ikopm10hist
iko_pm25_hist_tbl <- iko_24h_new %>%
  drop_na(pm25range) %>%
  group_by(pm25range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
iko_pm25_hist_tbl

iko_pm25_labperc <- percent(iko_pm25_hist_tbl[['Ratio']][2] + iko_pm25_hist_tbl[['Ratio']][1], accuracy = 0.1)
iko_pm25_labperc2 <- percent(1 - iko_pm25_hist_tbl[['Ratio']][1] - iko_pm25_hist_tbl[['Ratio']][2] -iko_pm25_hist_tbl[['Ratio']][3] ,accuracy = 0.1)
arrw25height <- max(iko_pm25_hist_tbl[['Ratio']]) + 0.015
lab25height <- arrw25height + 0.03

ikopm25_hist <- ggplot(iko_pm25_hist_tbl, aes(x=pm25range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy =1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm25who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm25epa, color = "red", lty = 2) +
  ggtitle("Ikorodu PM2.5") + 
  annotate(geom="text", x=pm25who - 0.3, y=lab25height, label=iko_pm25_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm25epa + 0.3, y=lab25height, label=iko_pm25_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm25who, y = arrw25height, xend = pm25who - 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm25epa, y = arrw25height, xend = pm25epa + 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
ikopm25_hist

# ikopm10hist
iko_pm10_hist_tbl <- iko_24h_new %>%
  drop_na(pm10range) %>%
  group_by(pm10range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
iko_pm10_hist_tbl

iko_pm10_labperc <- percent(iko_pm10_hist_tbl[['Ratio']][2] + iko_pm10_hist_tbl[['Ratio']][1], accuracy = 0.1)
iko_pm10_labperc2 <- percent(iko_pm10_hist_tbl[['Ratio']][7],accuracy = 0.1)
arrw10height <- max(iko_pm10_hist_tbl[['Ratio']]) + 0.015
lab10height <- arrw10height + 0.03

ikopm10_hist <- ggplot(iko_pm10_hist_tbl, aes(x=pm10range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm10who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm10epa, color = "red", lty = 2) +
  ggtitle("Ikorodu PM10") + 
  annotate(geom="text", x=pm10who - 0.3, y=lab10height, label=iko_pm10_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm10epa + 0.3, y=lab10height, label=iko_pm10_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who - 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm10epa, y = arrw10height, xend = pm10epa + 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
ikopm10_hist


ikohist <- plot_grid(ikopm25_hist,ikopm10_hist, ncol = 2, labels = c("C","D"))
ikohist




#Jankara pm hist

# janpm25hist
jan_pm25_hist_tbl <- jan_24h_new %>%
  drop_na(pm25range) %>%
  group_by(pm25range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
jan_pm25_hist_tbl

jan_pm25_labperc <- percent(jan_pm25_hist_tbl[['Ratio']][2] + jan_pm25_hist_tbl[['Ratio']][1], accuracy = 0.1)
jan_pm25_labperc2 <- percent(1 - jan_pm25_hist_tbl[['Ratio']][1] - jan_pm25_hist_tbl[['Ratio']][2] -jan_pm25_hist_tbl[['Ratio']][3] ,accuracy = 0.1)
arrw25height <- max(jan_pm25_hist_tbl[['Ratio']]) + 0.015
lab25height <- arrw25height + 0.03

janpm25_hist <- ggplot(jan_pm25_hist_tbl, aes(x=pm25range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy =1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm25who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm25epa, color = "red", lty = 2) +
  ggtitle("Jankara PM2.5") + 
  annotate(geom="text", x=pm25who - 0.3, y=lab25height, label=jan_pm25_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm25epa + 0.3, y=lab25height, label=jan_pm25_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm25who, y = arrw25height, xend = pm25who - 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm25epa, y = arrw25height, xend = pm25epa + 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
janpm25_hist

# janpm10hist
jan_pm10_hist_tbl <- jan_24h_new %>%
  drop_na(pm10range) %>%
  group_by(pm10range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
jan_pm10_hist_tbl

jan_pm10_labperc <- percent(jan_pm10_hist_tbl[['Ratio']][2] + jan_pm10_hist_tbl[['Ratio']][1], accuracy = 0.1)
jan_pm10_labperc2 <- percent(1 - jan_pm10_hist_tbl[['Ratio']][1] - jan_pm10_hist_tbl[['Ratio']][2],accuracy = 0.1)
arrw10height <- max(jan_pm10_hist_tbl[['Ratio']]) + 0.015
lab10height <- arrw10height + 0.03

janpm10_hist <- ggplot(jan_pm10_hist_tbl, aes(x=pm10range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm10who, color = "grey3", lty = 2) +
  # geom_vline(xintercept = pm10who, color = "red", lty = 2) +
  ggtitle("Jankara PM10") + 
  annotate(geom="text", x=pm10who - 0.3, y=lab10height, label=jan_pm10_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm10who + 0.3, y=lab10height, label=jan_pm10_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who - 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who + 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
janpm10_hist


janhist <- plot_grid(janpm25_hist,janpm10_hist, ncol = 2, labels = c("E","F"))
janhist


#abesan to jankara plots
abe_janhist <- plot_grid(abehist,
                     ikohist,
                     janhist,
                     ncol =1, nrow =3) + ggtitle("PM2.5 & PM10 Concentration Distributions for Abesan, Ikorodu and Jankara")
abe_janhist

# LASEPA TO UNILAG ##############################

#LASEPA pm hist

# laspm25hist
las_pm25_hist_tbl <- las_24h_new %>%
  drop_na(pm25range) %>%
  group_by(pm25range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
las_pm25_hist_tbl

las_pm25_labperc <- percent(las_pm25_hist_tbl[['Ratio']][2] + las_pm25_hist_tbl[['Ratio']][1], accuracy = 0.1)
las_pm25_labperc2 <- percent(1 - las_pm25_hist_tbl[['Ratio']][1] - las_pm25_hist_tbl[['Ratio']][2] -las_pm25_hist_tbl[['Ratio']][3] ,accuracy = 0.1)
arrw25height <- max(las_pm25_hist_tbl[['Ratio']]) + 0.015
lab25height <- arrw25height + 0.03

laspm25_hist <- ggplot(las_pm25_hist_tbl, aes(x=pm25range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy =1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm25who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm25epa, color = "red", lty = 2) +
  ggtitle("LASEPA PM2.5") + 
  annotate(geom="text", x=pm25who - 0.3, y=lab25height, label=las_pm25_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm25epa + 0.3, y=lab25height, label=las_pm25_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm25who, y = arrw25height, xend = pm25who - 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm25epa, y = arrw25height, xend = pm25epa + 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
laspm25_hist

# laspm10hist
las_pm10_hist_tbl <- las_24h_new %>%
  drop_na(pm10range) %>%
  group_by(pm10range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
las_pm10_hist_tbl

las_pm10_labperc <- percent(las_pm10_hist_tbl[['Ratio']][2] + las_pm10_hist_tbl[['Ratio']][1], accuracy = 0.1)
las_pm10_labperc2 <- percent(1 - las_pm10_hist_tbl[['Ratio']][1] - las_pm10_hist_tbl[['Ratio']][2],accuracy = 0.1)
arrw10height <- max(las_pm10_hist_tbl[['Ratio']]) + 0.015
lab10height <- arrw10height + 0.03

laspm10_hist <- ggplot(las_pm10_hist_tbl, aes(x=pm10range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm10who, color = "grey3", lty = 2) +
  # geom_vline(xintercept = pm10who, color = "red", lty = 2) +
  ggtitle("LASEPA PM10") + 
  annotate(geom="text", x=pm10who - 0.3, y=lab10height, label=las_pm10_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm10who + 0.3, y=lab10height, label=las_pm10_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who - 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who + 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
laspm10_hist


lashist <- plot_grid(laspm25_hist,laspm10_hist, ncol = 2, labels = c("A","B"))
lashist

#NCF pm hist

# ncfpm25hist
ncf_pm25_hist_tbl <- ncf_24h_new %>%
  drop_na(pm25range) %>%
  group_by(pm25range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
ncf_pm25_hist_tbl

ncf_pm25_labperc <- percent(ncf_pm25_hist_tbl[['Ratio']][2] + ncf_pm25_hist_tbl[['Ratio']][1], accuracy = 0.1)
ncf_pm25_labperc2 <- percent(1 - ncf_pm25_hist_tbl[['Ratio']][1] - ncf_pm25_hist_tbl[['Ratio']][2] -ncf_pm25_hist_tbl[['Ratio']][3] ,accuracy = 0.1)
arrw25height <- max(ncf_pm25_hist_tbl[['Ratio']]) + 0.015
lab25height <- arrw25height + 0.03

ncfpm25_hist <- ggplot(ncf_pm25_hist_tbl, aes(x=pm25range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy =1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm25who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm25epa, color = "red", lty = 2) +
  ggtitle("NCF PM2.5") + 
  annotate(geom="text", x=pm25who - 0.3, y=lab25height, label=ncf_pm25_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm25epa + 0.3, y=lab25height, label=ncf_pm25_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm25who, y = arrw25height, xend = pm25who - 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm25epa, y = arrw25height, xend = pm25epa + 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
ncfpm25_hist

# ncfpm10hist
ncf_pm10_hist_tbl <- ncf_24h_new %>%
  drop_na(pm10range) %>%
  group_by(pm10range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
ncf_pm10_hist_tbl

ncf_pm10_labperc <- percent(ncf_pm10_hist_tbl[['Ratio']][2] + ncf_pm10_hist_tbl[['Ratio']][1], accuracy = 0.1)
ncf_pm10_labperc2 <- percent(ncf_pm10_hist_tbl[['Ratio']][7],accuracy = 0.1)
arrw10height <- max(ncf_pm10_hist_tbl[['Ratio']]) + 0.015
lab10height <- arrw10height + 0.03

ncfpm10_hist <- ggplot(ncf_pm10_hist_tbl, aes(x=pm10range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm10who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm10epa, color = "red", lty = 2) +
  ggtitle("NCF PM10") + 
  annotate(geom="text", x=pm10who - 0.3, y=lab10height, label=ncf_pm10_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm10epa + 0.3, y=lab10height, label=ncf_pm10_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who - 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm10epa, y = arrw10height, xend = pm10epa + 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
ncfpm10_hist


ncfhist <- plot_grid(ncfpm25_hist,ncfpm10_hist, ncol = 2, labels = c("C","D"))
ncfhist

#UNILAG pm hist

# unipm25hist
uni_pm25_hist_tbl <- uni_24h_new %>%
  drop_na(pm25range) %>%
  group_by(pm25range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
uni_pm25_hist_tbl

uni_pm25_labperc <- percent(uni_pm25_hist_tbl[['Ratio']][2] + uni_pm25_hist_tbl[['Ratio']][1], accuracy = 0.1)
uni_pm25_labperc2 <- percent(1 - uni_pm25_hist_tbl[['Ratio']][1] - uni_pm25_hist_tbl[['Ratio']][2] -uni_pm25_hist_tbl[['Ratio']][3] ,accuracy = 0.1)
arrw25height <- max(uni_pm25_hist_tbl[['Ratio']]) + 0.015
lab25height <- arrw25height + 0.03

unipm25_hist <- ggplot(uni_pm25_hist_tbl, aes(x=pm25range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy =1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm25who, color = "grey3", lty = 2) +
  geom_vline(xintercept = pm25epa, color = "red", lty = 2) +
  ggtitle("UNILAG PM2.5") + 
  annotate(geom="text", x=pm25who - 0.3, y=lab25height, label=uni_pm25_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm25epa + 0.3, y=lab25height, label=uni_pm25_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm25who, y = arrw25height, xend = pm25who - 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm25epa, y = arrw25height, xend = pm25epa + 0.5, yend = arrw25height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
unipm25_hist

# unipm10hist
uni_pm10_hist_tbl <- uni_24h_new %>%
  drop_na(pm10range) %>%
  group_by(pm10range) %>%
  summarise(counts = n()) %>%
  mutate(Ratio = counts/sum(counts),
         label = percent(Ratio))
uni_pm10_hist_tbl

uni_pm10_labperc <- percent(uni_pm10_hist_tbl[['Ratio']][2] + uni_pm10_hist_tbl[['Ratio']][1], accuracy = 0.1)
uni_pm10_labperc2 <- percent(1 - uni_pm10_hist_tbl[['Ratio']][1] - uni_pm10_hist_tbl[['Ratio']][2],accuracy = 0.1)
arrw10height <- max(uni_pm10_hist_tbl[['Ratio']]) + 0.015
lab10height <- arrw10height + 0.03

unipm10_hist <- ggplot(uni_pm10_hist_tbl, aes(x=pm10range,y = counts/sum(counts)) ) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  xlab("Temperature range (\u00B0C)") +
  ylab("") + 
  xlab("Concentration ranges, ug/m3") + 
  geom_vline(xintercept = pm10who, color = "grey3", lty = 2) +
  # geom_vline(xintercept = pm10who, color = "red", lty = 2) +
  ggtitle("UNILAG PM10") + 
  annotate(geom="text", x=pm10who - 0.3, y=lab10height, label=uni_pm10_labperc,color="black", size = 3.2) +
  annotate(geom="text", x=pm10who + 0.3, y=lab10height, label=uni_pm10_labperc2,color="black", size = 3.2) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who - 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  geom_segment(aes(x = pm10who, y = arrw10height, xend = pm10who + 0.5, yend = arrw10height),
               lineend = "round" , linejoin = "round" , size = 0.5,
               arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_text(aes(label=label), vjust = -0.15) +
  theme_bw() 
unipm10_hist


unihist <- plot_grid(unipm25_hist,unipm10_hist, ncol = 2, labels = c("E","F"))
unihist


#lasepa to unilag plots
las_unihist <- plot_grid(lashist,
                         ncfhist,
                         unihist,
                         ncol =1, nrow =3)
las_unihist

getwd()
# export pm histograms ###############
# Open a tiff file ABESAN- JANKARA
jpeg(file="abe_janpm_histogram.jpeg", res=750, width=8000, height=9000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_janhist
# Close the pdf file
dev.off()

# Open a tiff file LASEPA - UNILAG
jpeg(file="las_unipm_histogram.jpeg", res=750, width=8000, height=9000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_unihist
# Close the pdf file
dev.off()

# 
# # Open a tiff file JANKARA
# jpeg(file="jan_pm_histogram.jpeg", res=700, width=8000, height=4000, pointsize=10,
#      type="windows", antialias="cleartype")
# # 2. Create a plot
# janhist
# # Close the pdf file
# dev.off()
# 
# 
# # Open a tiff file LASEPA
# jpeg(file="las_pm_histogram.jpeg", res=700, width=8000, height=4000, pointsize=10,
#      type="windows", antialias="cleartype")
# # 2. Create a plot
# lashist
# # Close the pdf file
# dev.off()
# 
# # Open a tiff file NCF
# jpeg(file="ncf_pm_histogram.jpeg", res=700, width=8000, height=4000, pointsize=10,
#      type="windows", antialias="cleartype")
# # 2. Create a plot
# ncfhist
# # Close the pdf file
# dev.off()
# 
# # Open a tiff file UNILAG
# jpeg(file="uni_pm_histogram.jpeg", res=700, width=8000, height=4000, pointsize=10,
#      type="windows", antialias="cleartype")
# # 2. Create a plot
# unihist
# # Close the pdf file
# dev.off()


# Box Plots #################################

boxdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Boxplots"
dir.create(boxdir)
setwd(boxdir)

# write.csv(na.omit(abe_5min_new), "Abesan_data_boxplot.csv", row.names = FALSE)

# filtering by sites
abe_5min_new <- filter(allsites_5min, site == "abesan")
iko_5min_new <- filter(allsites_5min, site == "ikorodu")
jan_5min_new <- filter(allsites_5min, site == "jankara")
las_5min_new <- filter(allsites_5min, site == "lasepa")
ncf_5min_new <- filter(allsites_5min, site == "ncf")
uni_5min_new <- filter(allsites_5min, site == "unilag")



box_o3_lims <- c(0,200)

# Abesan pollutants 

abe_box_no2_data <- abe_5min_new %>%
  drop_na(no2_5min)
br = c(0,5,10,20,50,100,250)
abe_box_no2 <- ggplot(abe_box_no2_data, aes(y = no2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(1,250)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_no2


abe_box_o3_data <- abe_5min_new %>%
  drop_na(o3_5min)
br = c(0,5,10,20,50,100,250,500)
abe_box_o3 <- ggplot(abe_box_o3_data, aes(y = o3_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_o3


abe_box_no_data <- abe_5min_new %>%
  drop_na(no_5min)
br = c(0,0.5,1,1.5,3,5,10,20,50,100)
abe_box_no <- ggplot(abe_box_no_data, aes(y = no_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,100)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_no


abe_box_so2_data <- abe_5min_new %>%
  drop_na(so2_5min)
br = c(0,5,10,20,50,100,200,500)
abe_box_so2 <- ggplot(abe_box_so2_data, aes(y = so2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_so2

abe_box_pm25_data <- abe_5min_new %>%
  drop_na(pm25_5min)
br = c(5,10,20,50,100,200,500,1000)
abe_box_pm25 <- ggplot(abe_box_pm25_data, aes(y = pm25_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_pm25

abe_box_pm10_data <- abe_5min_new %>%
  drop_na(pm10_5min)
br = c(5,10,20,50,100,200,500,1000)
abe_box_pm10 <- ggplot(abe_box_pm10_data, aes(y = pm10_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_pm10


abe_box_co_data <- abe_5min_new %>%
  drop_na(co_5min)
br = c(0,0.2,0.5,1,5,15,30)
abe_box_co <- ggplot(abe_box_co_data, aes(y = co_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mgm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,30)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_co

abe_box_co2_data <- abe_5min_new %>%
  drop_na(co2_5min)
# br = c(0,0.2,0.5,1,5,15,30)
abe_box_co2 <- ggplot(abe_box_co2_data, aes(y = co2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # co2ord_trans(y="log10") +
  # scale_y_co2ntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_co2

abe_box_tvoc_data <- abe_5min_new %>%
  drop_na(tvoc_5min)
# br = c(0,0.2,0.5,1,5,15,30)
abe_box_tvoc <- ggplot(abe_box_tvoc_data, aes(y = tvoc_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # tvocord_trans(y="log10") +
  # scale_y_tvocntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
abe_box_tvoc

# Ikorodu pollutants 

iko_box_no2_data <- iko_5min_new %>%
  drop_na(no2_5min)
br = c(0,5,10,20,50,100,250)
iko_box_no2 <- ggplot(iko_box_no2_data, aes(y = no2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(1,250)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_no2


iko_box_o3_data <- iko_5min_new %>%
  drop_na(o3_5min)
br = c(0,5,10,20,50,100,250,500)
iko_box_o3 <- ggplot(iko_box_o3_data, aes(y = o3_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_o3


iko_box_no_data <- iko_5min_new %>%
  drop_na(no_5min)
br = c(0,0.5,1,1.5,3,5,10,20,50,100)
iko_box_no <- ggplot(iko_box_no_data, aes(y = no_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,100)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_no


iko_box_so2_data <- iko_5min_new %>%
  drop_na(so2_5min)
br = c(0,5,10,20,50,100,200,500)
iko_box_so2 <- ggplot(iko_box_so2_data, aes(y = so2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_so2

iko_box_pm25_data <- iko_5min_new %>%
  drop_na(pm25_5min)
br = c(5,10,20,50,100,200,500,1000)
iko_box_pm25 <- ggplot(iko_box_pm25_data, aes(y = pm25_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_pm25

iko_box_pm10_data <- iko_5min_new %>%
  drop_na(pm10_5min)
br = c(5,10,20,50,100,200,500,1000)
iko_box_pm10 <- ggplot(iko_box_pm10_data, aes(y = pm10_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_pm10


iko_box_co_data <- iko_5min_new %>%
  drop_na(co_5min)
br = c(0,0.2,0.5,1,3,5,15,30)
iko_box_co <- ggplot(iko_box_co_data, aes(y = co_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mgm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,30)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_co

iko_box_co2_data <- iko_5min_new %>%
  drop_na(co2_5min)
# br = c(0,0.2,0.5,1,5,15,30)
iko_box_co2 <- ggplot(iko_box_co2_data, aes(y = co2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # co2ord_trans(y="log10") +
  # scale_y_co2ntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_co2

iko_box_tvoc_data <- iko_5min_new %>%
  drop_na(tvoc_5min)
# br = c(0,0.2,0.5,1,5,15,30)
iko_box_tvoc <- ggplot(iko_box_tvoc_data, aes(y = tvoc_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # tvocord_trans(y="log10") +
  # scale_y_tvocntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
iko_box_tvoc


# LASEPA pollutants 

las_box_no2_data <- las_5min_new %>%
  drop_na(no2_5min)
br = c(0,5,10,20,50,100,250)
las_box_no2 <- ggplot(las_box_no2_data, aes(y = no2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(1,250)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_no2


las_box_o3_data <- las_5min_new %>%
  drop_na(o3_5min)
br = c(0,5,10,20,50,100,250,500)
las_box_o3 <- ggplot(las_box_o3_data, aes(y = o3_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_o3


las_box_no_data <- las_5min_new %>%
  drop_na(no_5min)
br = c(0,0.5,1,1.5,3,5,10,20,50,100)
las_box_no <- ggplot(las_box_no_data, aes(y = no_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,100)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_no


las_box_so2_data <- las_5min_new %>%
  drop_na(so2_5min)
br = c(0,5,10,20,50,100,200,500)
las_box_so2 <- ggplot(las_box_so2_data, aes(y = so2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_so2

las_box_pm25_data <- las_5min_new %>%
  drop_na(pm25_5min)
br = c(5,10,20,50,100,200,500,1000)
las_box_pm25 <- ggplot(las_box_pm25_data, aes(y = pm25_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_pm25

las_box_pm10_data <- las_5min_new %>%
  drop_na(pm10_5min)
br = c(5,10,20,50,100,200,500,1000)
las_box_pm10 <- ggplot(las_box_pm10_data, aes(y = pm10_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_pm10


las_box_co_data <- las_5min_new %>%
  drop_na(co_5min)
br = c(0,0.2,0.5,1,3,5,15,30)
las_box_co <- ggplot(las_box_co_data, aes(y = co_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mgm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,30)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_co

las_box_co2_data <- las_5min_new %>%
  drop_na(co2_5min)
# br = c(0,0.2,0.5,1,5,15,30)
las_box_co2 <- ggplot(las_box_co2_data, aes(y = co2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # co2ord_trans(y="log10") +
  # scale_y_co2ntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_co2

las_box_tvoc_data <- las_5min_new %>%
  drop_na(tvoc_5min)
# br = c(0,0.2,0.5,1,5,15,30)
las_box_tvoc <- ggplot(las_box_tvoc_data, aes(y = tvoc_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # tvocord_trans(y="log10") +
  # scale_y_tvocntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
las_box_tvoc


# Jankara pollutants


jan_box_no2_data <- jan_5min_new %>%
  drop_na(no2_5min)
br = c(0,5,10,20,50,100,250)
jan_box_no2 <- ggplot(jan_box_no2_data, aes(y = no2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(1,250)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_no2


jan_box_o3_data <- jan_5min_new %>%
  drop_na(o3_5min)
br = c(0,5,10,20,50,100,250,500)
jan_box_o3 <- ggplot(jan_box_o3_data, aes(y = o3_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_o3


jan_box_no_data <- jan_5min_new %>%
  drop_na(no_5min)
br = c(0,0.5,1,1.5,3,5,10,20,50,100)
jan_box_no <- ggplot(jan_box_no_data, aes(y = no_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,100)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_no


jan_box_so2_data <- jan_5min_new %>%
  drop_na(so2_5min)
br = c(0,5,10,20,50,100,200,500)
jan_box_so2 <- ggplot(jan_box_so2_data, aes(y = so2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_so2

jan_box_pm25_data <- jan_5min_new %>%
  drop_na(pm25_5min)
br = c(5,10,20,50,100,200,500,1000)
jan_box_pm25 <- ggplot(jan_box_pm25_data, aes(y = pm25_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_pm25

jan_box_pm10_data <- jan_5min_new %>%
  drop_na(pm10_5min)
br = c(5,10,20,50,100,200,500,1000)
jan_box_pm10 <- ggplot(jan_box_pm10_data, aes(y = pm10_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_pm10


jan_box_co_data <- jan_5min_new %>%
  drop_na(co_5min)
br = c(0,0.2,0.5,1,3,5,15,30)
jan_box_co <- ggplot(jan_box_co_data, aes(y = co_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mgm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,30)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_co

jan_box_co2_data <- jan_5min_new %>%
  drop_na(co2_5min)
# br = c(0,0.2,0.5,1,5,15,30)
jan_box_co2 <- ggplot(jan_box_co2_data, aes(y = co2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # co2ord_trans(y="log10") +
  # scale_y_co2ntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_co2

jan_box_tvoc_data <- jan_5min_new %>%
  drop_na(tvoc_5min)
# br = c(0,0.2,0.5,1,5,15,30)
jan_box_tvoc <- ggplot(jan_box_tvoc_data, aes(y = tvoc_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # tvocord_trans(y="log10") +
  # scale_y_tvocntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
jan_box_tvoc

# NCF pollutants 

ncf_box_no2_data <- ncf_5min_new %>%
  drop_na(no2_5min)
br = c(0,5,10,20,50,100,250)
ncf_box_no2 <- ggplot(ncf_box_no2_data, aes(y = no2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(1,250)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_no2


ncf_box_o3_data <- ncf_5min_new %>%
  drop_na(o3_5min)
br = c(0,5,10,20,50,100,250,500)
ncf_box_o3 <- ggplot(ncf_box_o3_data, aes(y = o3_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_o3


ncf_box_no_data <- ncf_5min_new %>%
  drop_na(no_5min)
br = c(0,0.5,1,1.5,3,5,10,20,50,100)
ncf_box_no <- ggplot(ncf_box_no_data, aes(y = no_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,100)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_no


ncf_box_so2_data <- ncf_5min_new %>%
  drop_na(so2_5min)
br = c(0,5,10,20,50,100,200,500)
ncf_box_so2 <- ggplot(ncf_box_so2_data, aes(y = so2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_so2

ncf_box_pm25_data <- ncf_5min_new %>%
  drop_na(pm25_5min)
br = c(5,10,20,50,100,200,500,1000)
ncf_box_pm25 <- ggplot(ncf_box_pm25_data, aes(y = pm25_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_pm25

ncf_box_pm10_data <- ncf_5min_new %>%
  drop_na(pm10_5min)
br = c(5,10,20,50,100,200,500,1000)
ncf_box_pm10 <- ggplot(ncf_box_pm10_data, aes(y = pm10_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_pm10


ncf_box_co_data <- ncf_5min_new %>%
  drop_na(co_5min)
br = c(0,0.2,0.5,1,3,5,15,30)
ncf_box_co <- ggplot(ncf_box_co_data, aes(y = co_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mgm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,30)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_co

ncf_box_co2_data <- ncf_5min_new %>%
  drop_na(co2_5min)
# br = c(0,0.2,0.5,1,5,15,30)
ncf_box_co2 <- ggplot(ncf_box_co2_data, aes(y = co2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # co2ord_trans(y="log10") +
  # scale_y_co2ntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_co2

ncf_box_tvoc_data <- ncf_5min_new %>%
  drop_na(tvoc_5min)
# br = c(0,0.2,0.5,1,5,15,30)
ncf_box_tvoc <- ggplot(ncf_box_tvoc_data, aes(y = tvoc_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # tvocord_trans(y="log10") +
  # scale_y_tvocntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
ncf_box_tvoc


# Unilag pollutants

uni_box_no2_data <- uni_5min_new %>%
  drop_na(no2_5min)
br = c(0,5,10,20,50,100,250)
uni_box_no2 <- ggplot(uni_box_no2_data, aes(y = no2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(1,250)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_no2


uni_box_o3_data <- uni_5min_new %>%
  drop_na(o3_5min)
br = c(0,5,10,20,50,100,250,500)
uni_box_o3 <- ggplot(uni_box_o3_data, aes(y = o3_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_o3


uni_box_no_data <- uni_5min_new %>%
  drop_na(no_5min)
br = c(0,0.5,1,1.5,3,5,10,20,50,100)
uni_box_no <- ggplot(uni_box_no_data, aes(y = no_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,100)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_no


uni_box_so2_data <- uni_5min_new %>%
  drop_na(so2_5min)
br = c(0,5,10,20,50,100,200,500)
uni_box_so2 <- ggplot(uni_box_so2_data, aes(y = so2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,500)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_so2

uni_box_pm25_data <- uni_5min_new %>%
  drop_na(pm25_5min)
br = c(5,10,20,50,100,200,500,1000)
uni_box_pm25 <- ggplot(uni_box_pm25_data, aes(y = pm25_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_pm25

uni_box_pm10_data <- uni_5min_new %>%
  drop_na(pm10_5min)
br = c(5,10,20,50,100,200,500,1000)
uni_box_pm10 <- ggplot(uni_box_pm10_data, aes(y = pm10_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mu~gm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(5,1000)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_pm10


uni_box_co_data <- uni_5min_new %>%
  drop_na(co_5min)
br = c(0,0.2,0.5,1,3,5,15,30)
uni_box_co <- ggplot(uni_box_co_data, aes(y = co_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(mgm^-3)) +  
  coord_trans(y="log10") +
  scale_y_continuous(breaks =  br, limits = c(0.1,30)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_co

uni_box_co2_data <- uni_5min_new %>%
  drop_na(co2_5min)
# br = c(0,0.2,0.5,1,5,15,30)
uni_box_co2 <- ggplot(uni_box_co2_data, aes(y = co2_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # co2ord_trans(y="log10") +
  # scale_y_co2ntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_co2

uni_box_tvoc_data <- uni_5min_new %>%
  drop_na(tvoc_5min)
# br = c(0,0.2,0.5,1,5,15,30)
uni_box_tvoc <- ggplot(uni_box_tvoc_data, aes(y = tvoc_5min, x = time_of_day )) + geom_boxplot() +  xlab("") +  
  ylab(bquote(ppm)) +  
  # tvocord_trans(y="log10") +
  # scale_y_tvocntinuous(breaks =  br, limits = c(0.1,600)) +
  # ggtitle(bquote(Boxplot~of~NO[2]~at~Abesan~(August~2020~-~January~2021))) +   
  ggtitle("") +
  theme_bw(base_size = 10)
uni_box_tvoc




#group boxplots per site #######################

# no2
allno2 <- ggarrange(abe_box_no2,iko_box_no2,jan_box_no2,las_box_no2,ncf_box_no2,uni_box_no2,
                    labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                    ncol = 2,nrow = 3)
allno2 <- annotate_figure(allno2, top = text_grob(bquote(Boxplots~of~NO[2]~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# o3
allo3 <- ggarrange(abe_box_o3,iko_box_o3,jan_box_o3,las_box_o3,ncf_box_o3,uni_box_o3,
                    labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                    ncol = 2,nrow = 3)
allo3 <- annotate_figure(allo3, top = text_grob(bquote(Boxplots~of~O[3]~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# no
allno <- ggarrange(abe_box_no,iko_box_no,jan_box_no,las_box_no,ncf_box_no,uni_box_no,
                   labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                   ncol = 2,nrow = 3)
allno <- annotate_figure(allno, top = text_grob(bquote(Boxplots~of~NO~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# so2
allso2 <- ggarrange(abe_box_so2,iko_box_so2,jan_box_so2,las_box_so2,ncf_box_so2,uni_box_so2,
                   labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                   ncol = 2,nrow = 3)
allso2 <- annotate_figure(allso2, top = text_grob(bquote(Boxplots~of~SO[2]~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# pm25
allpm25 <- ggarrange(abe_box_pm25,iko_box_pm25,jan_box_pm25,las_box_pm25,ncf_box_pm25,uni_box_pm25,
                    labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                    ncol = 2,nrow = 3)
allpm25 <- annotate_figure(allpm25, top = text_grob(bquote(Boxplots~of~PM[2.5]~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# pm10
allpm10 <- ggarrange(abe_box_pm10,iko_box_pm10,jan_box_pm10,las_box_pm10,ncf_box_pm10,uni_box_pm10,
                     labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                     ncol = 2,nrow = 3)
allpm10 <- annotate_figure(allpm10, top = text_grob(bquote(Boxplots~of~PM[10]~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# co
allco <- ggarrange(abe_box_co,iko_box_co,jan_box_co,las_box_co,ncf_box_co,uni_box_co,
                     labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                     ncol = 2,nrow = 3)
allco <- annotate_figure(allco, top = text_grob(bquote(Boxplots~of~CO~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# co2
allco2 <- ggarrange(abe_box_co2,iko_box_co2,jan_box_co2,las_box_co2,ncf_box_co2,uni_box_co2,
                     labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                     ncol = 2,nrow = 3)
allco2 <- annotate_figure(allco2, top = text_grob(bquote(Boxplots~of~CO[2]~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))

# tvoc
alltvoc <- ggarrange(abe_box_tvoc,iko_box_tvoc,jan_box_tvoc,las_box_tvoc,ncf_box_tvoc,uni_box_tvoc,
                     labels = c("   Abesan","   Ikorodu","   Jankara","   LASEPA","   NCF","   Unilag"),
                     ncol = 2,nrow = 3)
alltvoc <- annotate_figure(alltvoc, top = text_grob(bquote(Boxplots~of~TVOCs~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))



boxpltwidth <- 8000
boxpltheight <- 8000
# Open a tiff file no2
jpeg(file="no2_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allno2
# Close the pdf file
dev.off()
# Open a tiff file o3
jpeg(file="o3_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allo3
# Close the pdf file
dev.off()


# Open a tiff file no
jpeg(file="no_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allno
# Close the pdf file
dev.off()

# Open a tiff file co
jpeg(file="co_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allco
# Close the pdf file
dev.off()


# Open a tiff file so2
jpeg(file="so2_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allso2
# Close the pdf file
dev.off()

# Open a tiff file pm25
jpeg(file="pm25_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allpm25
# Close the pdf file
dev.off()

# Open a tiff file pm10
jpeg(file="pm10_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allpm10
# Close the pdf file
dev.off()

# Open a tiff file co2
jpeg(file="co2_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
allco2
# Close the pdf file
dev.off()

# Open a tiff file tvoc
jpeg(file="tvoc_boxplot_flip.jpeg", res=700, width=boxpltwidth, height=boxpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
alltvoc
# Close the pdf file
dev.off()



# Diurnal Plots #########################
names(abe_5min_new)
#pexport directory for diurnal averages 
diurn_expdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Diurnal Plots"
dir.create(diurn_expdir)
setwd(diurn_expdir)

# no2 ###############
no2_lims <- c(0,47)
abe_diurn_no2 <- timeVariation(abe_5min_new, "no2_5min", ylab = "ugm-3")[[1]][2]
abe_diurn_no2[["hour"]][["main"]] <- "(a) Abesan NO2"
abe_diurn_no2[["hour"]][["xlab"]] <- ""
abe_diurn_no2[["hour"]][["y.limits"]] <- no2_lims
abe_diurn_no2

iko_diurn_no2 <- timeVariation(iko_5min_new, "no2_5min", ylab = "ugm-3")[[1]][2]
iko_diurn_no2[["hour"]][["main"]] <- "(b) Ikorodu NO2"
iko_diurn_no2[["hour"]][["xlab"]] <- ""
iko_diurn_no2[["hour"]][["y.limits"]] <- no2_lims
iko_diurn_no2

jan_diurn_no2 <- timeVariation(jan_5min_new, "no2_5min", ylab = "ugm-3")[[1]][2]
jan_diurn_no2[["hour"]][["main"]] <- "(c) Jankara NO2"
jan_diurn_no2[["hour"]][["xlab"]] <- ""
jan_diurn_no2[["hour"]][["y.limits"]] <- no2_lims
jan_diurn_no2

las_diurn_no2 <- timeVariation(las_5min_new, "no2_5min", ylab = "ugm-3")[[1]][2]
las_diurn_no2[["hour"]][["main"]] <- "(d) LASEPA NO2"
las_diurn_no2[["hour"]][["xlab"]] <- ""
las_diurn_no2[["hour"]][["y.limits"]] <- no2_lims
las_diurn_no2

ncf_diurn_no2 <- timeVariation(ncf_5min_new, "no2_5min", ylab = "ugm-3")[[1]][2]
ncf_diurn_no2[["hour"]][["main"]] <- "(e) NCF NO2"
ncf_diurn_no2[["hour"]][["xlab"]] <- ""
ncf_diurn_no2[["hour"]][["y.limits"]] <- no2_lims
ncf_diurn_no2

uni_diurn_no2 <- timeVariation(uni_5min_new, "no2_5min", ylab = "ugm-3")[[1]][2]
uni_diurn_no2[["hour"]][["main"]] <- "(f) UNILAG NO2"
uni_diurn_no2[["hour"]][["xlab"]] <- ""
uni_diurn_no2[["hour"]][["y.limits"]] <- no2_lims
uni_diurn_no2

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file no2
jpeg(file="no2_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_no2, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_no2, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_no2, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_no2, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_no2, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_no2, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# o3 #############
o3_lims <- c(0,125)
abe_diurn_o3 <- timeVariation(abe_5min_new, "o3_5min", ylab = "ugm-3")[[1]][2]
abe_diurn_o3[["hour"]][["main"]] <- "(a) Abesan O3"
abe_diurn_o3[["hour"]][["xlab"]] <- ""
abe_diurn_o3[["hour"]][["y.limits"]] <- o3_lims
abe_diurn_o3

iko_diurn_o3 <- timeVariation(iko_5min_new, "o3_5min", ylab = "ugm-3")[[1]][2]
iko_diurn_o3[["hour"]][["main"]] <- "(b) Ikorodu O3"
iko_diurn_o3[["hour"]][["xlab"]] <- ""
iko_diurn_o3[["hour"]][["y.limits"]] <- o3_lims
iko_diurn_o3

jan_diurn_o3 <- timeVariation(jan_5min_new, "o3_5min", ylab = "ugm-3")[[1]][2]
jan_diurn_o3[["hour"]][["main"]] <- "(c) Jankara O3"
jan_diurn_o3[["hour"]][["xlab"]] <- ""
jan_diurn_o3[["hour"]][["y.limits"]] <- o3_lims
jan_diurn_o3

las_diurn_o3 <- timeVariation(las_5min_new, "o3_5min", ylab = "ugm-3")[[1]][2]
las_diurn_o3[["hour"]][["main"]] <- "(d) LASEPA O3"
las_diurn_o3[["hour"]][["xlab"]] <- ""
las_diurn_o3[["hour"]][["y.limits"]] <- o3_lims
las_diurn_o3

ncf_diurn_o3 <- timeVariation(ncf_5min_new, "o3_5min", ylab = "ugm-3")[[1]][2]
ncf_diurn_o3[["hour"]][["main"]] <- "(e) NCF O3"
ncf_diurn_o3[["hour"]][["xlab"]] <- ""
ncf_diurn_o3[["hour"]][["y.limits"]] <- o3_lims
ncf_diurn_o3

uni_diurn_o3 <- timeVariation(uni_5min_new, "o3_5min", ylab = "ugm-3")[[1]][2]
uni_diurn_o3[["hour"]][["main"]] <- "(f) UNILAG O3"
uni_diurn_o3[["hour"]][["xlab"]] <- ""
uni_diurn_o3[["hour"]][["y.limits"]] <- o3_lims
uni_diurn_o3

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file o3
jpeg(file="o3_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_o3, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_o3, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_o3, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_o3, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_o3, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_o3, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# no #############
no_lims <- c(0,4.2)
abe_diurn_no <- timeVariation(abe_5min_new, "no_5min", ylab = "ugm-3")[[1]][2]
abe_diurn_no[["hour"]][["main"]] <- "(a) Abesan NO"
abe_diurn_no[["hour"]][["xlab"]] <- ""
abe_diurn_no[["hour"]][["y.limits"]] <- no_lims
abe_diurn_no

iko_diurn_no <- timeVariation(iko_5min_new, "no_5min", ylab = "ugm-3")[[1]][2]
iko_diurn_no[["hour"]][["main"]] <- "(b) Ikorodu NO"
iko_diurn_no[["hour"]][["xlab"]] <- ""
iko_diurn_no[["hour"]][["y.limits"]] <- no_lims
iko_diurn_no

jan_diurn_no <- timeVariation(jan_5min_new, "no_5min", ylab = "ugm-3")[[1]][2]
jan_diurn_no[["hour"]][["main"]] <- "(c) Jankara NO"
jan_diurn_no[["hour"]][["xlab"]] <- ""
jan_diurn_no[["hour"]][["y.limits"]] <- no_lims
jan_diurn_no

las_diurn_no <- timeVariation(las_5min_new, "no_5min", ylab = "ugm-3")[[1]][2]
las_diurn_no[["hour"]][["main"]] <- "(d) LASEPA NO"
las_diurn_no[["hour"]][["xlab"]] <- ""
las_diurn_no[["hour"]][["y.limits"]] <- no_lims
las_diurn_no

ncf_diurn_no <- timeVariation(ncf_5min_new, "no_5min", ylab = "ugm-3")[[1]][2]
ncf_diurn_no[["hour"]][["main"]] <- "(e) NCF NO"
ncf_diurn_no[["hour"]][["xlab"]] <- ""
ncf_diurn_no[["hour"]][["y.limits"]] <- no_lims
ncf_diurn_no

uni_diurn_no <- timeVariation(uni_5min_new, "no_5min", ylab = "ugm-3")[[1]][2]
uni_diurn_no[["hour"]][["main"]] <- "(f) UNILAG NO"
uni_diurn_no[["hour"]][["xlab"]] <- ""
uni_diurn_no[["hour"]][["y.limits"]] <- no_lims
uni_diurn_no

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file no
jpeg(file="no_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_no, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_no, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_no, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_no, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_no, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_no, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# so2 #############
so2_lims <- c(0,60)
abe_diurn_so2 <- timeVariation(abe_5min_new, "so2_5min", ylab = "ugm-3")[[1]][2]
abe_diurn_so2[["hour"]][["main"]] <- "(a) Abesan SO2"
abe_diurn_so2[["hour"]][["xlab"]] <- ""
abe_diurn_so2[["hour"]][["y.limits"]] <- so2_lims
abe_diurn_so2

iko_diurn_so2 <- timeVariation(iko_5min_new, "so2_5min", ylab = "ugm-3")[[1]][2]
iko_diurn_so2[["hour"]][["main"]] <- "(b) Ikorodu SO2"
iko_diurn_so2[["hour"]][["xlab"]] <- ""
iko_diurn_so2[["hour"]][["y.limits"]] <- so2_lims
iko_diurn_so2

jan_diurn_so2 <- timeVariation(jan_5min_new, "so2_5min", ylab = "ugm-3")[[1]][2]
jan_diurn_so2[["hour"]][["main"]] <- "(c) Jankara SO2"
jan_diurn_so2[["hour"]][["xlab"]] <- ""
jan_diurn_so2[["hour"]][["y.limits"]] <- so2_lims
jan_diurn_so2

las_diurn_so2 <- timeVariation(las_5min_new, "so2_5min", ylab = "ugm-3")[[1]][2]
las_diurn_so2[["hour"]][["main"]] <- "(d) LASEPA SO2"
las_diurn_so2[["hour"]][["xlab"]] <- ""
las_diurn_so2[["hour"]][["y.limits"]] <- so2_lims
las_diurn_so2

ncf_diurn_so2 <- timeVariation(ncf_5min_new, "so2_5min", ylab = "ugm-3")[[1]][2]
ncf_diurn_so2[["hour"]][["main"]] <- "(e) NCF SO2"
ncf_diurn_so2[["hour"]][["xlab"]] <- ""
ncf_diurn_so2[["hour"]][["y.limits"]] <- so2_lims
ncf_diurn_so2

uni_diurn_so2 <- timeVariation(uni_5min_new, "so2_5min", ylab = "ugm-3")[[1]][2]
uni_diurn_so2[["hour"]][["main"]] <- "(f) UNILAG SO2"
uni_diurn_so2[["hour"]][["xlab"]] <- ""
uni_diurn_so2[["hour"]][["y.limits"]] <- so2_lims
uni_diurn_so2

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file so2
jpeg(file="so2_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_so2, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_so2, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_so2, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_so2, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_so2, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_so2, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# pm25 #############
pm25_lims <- c(0,65)
abe_diurn_pm25 <- timeVariation(abe_5min_new, "pm25_5min", ylab = "ugm-3")[[1]][2]
abe_diurn_pm25[["hour"]][["main"]] <- "(a) Abesan PM2.5"
abe_diurn_pm25[["hour"]][["xlab"]] <- ""
abe_diurn_pm25[["hour"]][["y.limits"]] <- pm25_lims
abe_diurn_pm25

iko_diurn_pm25 <- timeVariation(iko_5min_new, "pm25_5min", ylab = "ugm-3")[[1]][2]
iko_diurn_pm25[["hour"]][["main"]] <- "(b) Ikorodu PM2.5"
iko_diurn_pm25[["hour"]][["xlab"]] <- ""
iko_diurn_pm25[["hour"]][["y.limits"]] <- pm25_lims
iko_diurn_pm25

jan_diurn_pm25 <- timeVariation(jan_5min_new, "pm25_5min", ylab = "ugm-3")[[1]][2]
jan_diurn_pm25[["hour"]][["main"]] <- "(c) Jankara PM2.5"
jan_diurn_pm25[["hour"]][["xlab"]] <- ""
jan_diurn_pm25[["hour"]][["y.limits"]] <- pm25_lims
jan_diurn_pm25

las_diurn_pm25 <- timeVariation(las_5min_new, "pm25_5min", ylab = "ugm-3")[[1]][2]
las_diurn_pm25[["hour"]][["main"]] <- "(d) LASEPA PM2.5"
las_diurn_pm25[["hour"]][["xlab"]] <- ""
las_diurn_pm25[["hour"]][["y.limits"]] <- pm25_lims
las_diurn_pm25

ncf_diurn_pm25 <- timeVariation(ncf_5min_new, "pm25_5min", ylab = "ugm-3")[[1]][2]
ncf_diurn_pm25[["hour"]][["main"]] <- "(e) NCF PM2.5"
ncf_diurn_pm25[["hour"]][["xlab"]] <- ""
ncf_diurn_pm25[["hour"]][["y.limits"]] <- pm25_lims
ncf_diurn_pm25

uni_diurn_pm25 <- timeVariation(uni_5min_new, "pm25_5min", ylab = "ugm-3")[[1]][2]
uni_diurn_pm25[["hour"]][["main"]] <- "(f) UNILAG PM2.5"
uni_diurn_pm25[["hour"]][["xlab"]] <- ""
uni_diurn_pm25[["hour"]][["y.limits"]] <- pm25_lims
uni_diurn_pm25

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file pm25
jpeg(file="pm25_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_pm25, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_pm25, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_pm25, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_pm25, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_pm25, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_pm25, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# pm10 #############
pm10_lims <- c(0,125)
abe_diurn_pm10 <- timeVariation(abe_5min_new, "pm10_5min", ylab = "ugm-3")[[1]][2]
abe_diurn_pm10[["hour"]][["main"]] <- "(a) Abesan PM10"
abe_diurn_pm10[["hour"]][["xlab"]] <- ""
abe_diurn_pm10[["hour"]][["y.limits"]] <- pm10_lims
abe_diurn_pm10

iko_diurn_pm10 <- timeVariation(iko_5min_new, "pm10_5min", ylab = "ugm-3")[[1]][2]
iko_diurn_pm10[["hour"]][["main"]] <- "(b) Ikorodu PM10"
iko_diurn_pm10[["hour"]][["xlab"]] <- ""
iko_diurn_pm10[["hour"]][["y.limits"]] <- pm10_lims
iko_diurn_pm10

jan_diurn_pm10 <- timeVariation(jan_5min_new, "pm10_5min", ylab = "ugm-3")[[1]][2]
jan_diurn_pm10[["hour"]][["main"]] <- "(c) Jankara PM10"
jan_diurn_pm10[["hour"]][["xlab"]] <- ""
jan_diurn_pm10[["hour"]][["y.limits"]] <- pm10_lims
jan_diurn_pm10

las_diurn_pm10 <- timeVariation(las_5min_new, "pm10_5min", ylab = "ugm-3")[[1]][2]
las_diurn_pm10[["hour"]][["main"]] <- "(d) LASEPA PM10"
las_diurn_pm10[["hour"]][["xlab"]] <- ""
las_diurn_pm10[["hour"]][["y.limits"]] <- pm10_lims
las_diurn_pm10

ncf_diurn_pm10 <- timeVariation(ncf_5min_new, "pm10_5min", ylab = "ugm-3")[[1]][2]
ncf_diurn_pm10[["hour"]][["main"]] <- "(e) NCF PM10"
ncf_diurn_pm10[["hour"]][["xlab"]] <- ""
ncf_diurn_pm10[["hour"]][["y.limits"]] <- pm10_lims
ncf_diurn_pm10

uni_diurn_pm10 <- timeVariation(uni_5min_new, "pm10_5min", ylab = "ugm-3")[[1]][2]
uni_diurn_pm10[["hour"]][["main"]] <- "(f) UNILAG PM10"
uni_diurn_pm10[["hour"]][["xlab"]] <- ""
uni_diurn_pm10[["hour"]][["y.limits"]] <- pm10_lims
uni_diurn_pm10

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file pm10
jpeg(file="pm10_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_pm10, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_pm10, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_pm10, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_pm10, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_pm10, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_pm10, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# co #############
co_lims <- c(0,5)
abe_diurn_co <- timeVariation(abe_5min_new, "co_5min", ylab = "mgm-3")[[1]][2]
abe_diurn_co[["hour"]][["main"]] <- "(a) Abesan CO"
abe_diurn_co[["hour"]][["xlab"]] <- ""
abe_diurn_co[["hour"]][["y.limits"]] <- co_lims
abe_diurn_co

iko_diurn_co <- timeVariation(iko_5min_new, "co_5min", ylab = "mgm-3")[[1]][2]
iko_diurn_co[["hour"]][["main"]] <- "(b) Ikorodu CO"
iko_diurn_co[["hour"]][["xlab"]] <- ""
iko_diurn_co[["hour"]][["y.limits"]] <- co_lims
iko_diurn_co

jan_diurn_co <- timeVariation(jan_5min_new, "co_5min", ylab = "mgm-3")[[1]][2]
jan_diurn_co[["hour"]][["main"]] <- "(c) Jankara CO"
jan_diurn_co[["hour"]][["xlab"]] <- ""
jan_diurn_co[["hour"]][["y.limits"]] <- co_lims
jan_diurn_co

las_diurn_co <- timeVariation(las_5min_new, "co_5min", ylab = "mgm-3")[[1]][2]
las_diurn_co[["hour"]][["main"]] <- "(d) LASEPA CO"
las_diurn_co[["hour"]][["xlab"]] <- ""
las_diurn_co[["hour"]][["y.limits"]] <- co_lims
las_diurn_co

ncf_diurn_co <- timeVariation(ncf_5min_new, "co_5min", ylab = "mgm-3")[[1]][2]
ncf_diurn_co[["hour"]][["main"]] <- "(e) NCF CO"
ncf_diurn_co[["hour"]][["xlab"]] <- ""
ncf_diurn_co[["hour"]][["y.limits"]] <- co_lims
ncf_diurn_co

uni_diurn_co <- timeVariation(uni_5min_new, "co_5min", ylab = "mgm-3")[[1]][2]
uni_diurn_co[["hour"]][["main"]] <- "(f) UNILAG CO"
uni_diurn_co[["hour"]][["xlab"]] <- ""
uni_diurn_co[["hour"]][["y.limits"]] <- co_lims
uni_diurn_co

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file co
jpeg(file="co_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_co, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_co, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_co, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_co, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_co, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_co, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# co2 #############
co2_lims <- c(400,600)
abe_diurn_co2 <- timeVariation(abe_5min_new, "co2_5min", ylab = "ppm")[[1]][2]
abe_diurn_co2[["hour"]][["main"]] <- "(a) Abesan CO2"
abe_diurn_co2[["hour"]][["xlab"]] <- ""
abe_diurn_co2[["hour"]][["y.limits"]] <- co2_lims
abe_diurn_co2

iko_diurn_co2 <- timeVariation(iko_5min_new, "co2_5min", ylab = "ppm")[[1]][2]
iko_diurn_co2[["hour"]][["main"]] <- "(b) Ikorodu CO2"
iko_diurn_co2[["hour"]][["xlab"]] <- ""
iko_diurn_co2[["hour"]][["y.limits"]] <- co2_lims
iko_diurn_co2

jan_diurn_co2 <- timeVariation(jan_5min_new, "co2_5min", ylab = "ppm")[[1]][2]
jan_diurn_co2[["hour"]][["main"]] <- "(c) Jankara CO2"
jan_diurn_co2[["hour"]][["xlab"]] <- ""
jan_diurn_co2[["hour"]][["y.limits"]] <- co2_lims
jan_diurn_co2

las_diurn_co2 <- timeVariation(las_5min_new, "co2_5min", ylab = "ppm")[[1]][2]
las_diurn_co2[["hour"]][["main"]] <- "(d) LASEPA CO2"
las_diurn_co2[["hour"]][["xlab"]] <- ""
las_diurn_co2[["hour"]][["y.limits"]] <- co2_lims
las_diurn_co2

ncf_diurn_co2 <- timeVariation(ncf_5min_new, "co2_5min", ylab = "ppm")[[1]][2]
ncf_diurn_co2[["hour"]][["main"]] <- "(e) NCF CO2"
ncf_diurn_co2[["hour"]][["xlab"]] <- ""
ncf_diurn_co2[["hour"]][["y.limits"]] <- co2_lims
ncf_diurn_co2

uni_diurn_co2 <- timeVariation(uni_5min_new, "co2_5min", ylab = "ppm")[[1]][2]
uni_diurn_co2[["hour"]][["main"]] <- "(f) UNILAG CO2"
uni_diurn_co2[["hour"]][["xlab"]] <- ""
uni_diurn_co2[["hour"]][["y.limits"]] <- co2_lims
uni_diurn_co2

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file co2
jpeg(file="co2_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_co2, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_co2, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_co2, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_co2, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_co2, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_co2, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# tvoc #############
tvoc_lims <- c(450,1200)
abe_diurn_tvoc <- timeVariation(abe_5min_new, "tvoc_5min", ylab = "ppb")[[1]][2]
abe_diurn_tvoc[["hour"]][["main"]] <- "(a) Abesan TVOCs"
abe_diurn_tvoc[["hour"]][["xlab"]] <- ""
abe_diurn_tvoc[["hour"]][["y.limits"]] <- tvoc_lims
abe_diurn_tvoc

iko_diurn_tvoc <- timeVariation(iko_5min_new, "tvoc_5min", ylab = "ppb")[[1]][2]
iko_diurn_tvoc[["hour"]][["main"]] <- "(b) Ikorodu TVOCs"
iko_diurn_tvoc[["hour"]][["xlab"]] <- ""
iko_diurn_tvoc[["hour"]][["y.limits"]] <- tvoc_lims
iko_diurn_tvoc

jan_diurn_tvoc <- timeVariation(jan_5min_new, "tvoc_5min", ylab = "ppb")[[1]][2]
jan_diurn_tvoc[["hour"]][["main"]] <- "(c) Jankara TVOCs"
jan_diurn_tvoc[["hour"]][["xlab"]] <- ""
jan_diurn_tvoc[["hour"]][["y.limits"]] <- tvoc_lims
jan_diurn_tvoc

las_diurn_tvoc <- timeVariation(las_5min_new, "tvoc_5min", ylab = "ppb")[[1]][2]
las_diurn_tvoc[["hour"]][["main"]] <- "(d) LASEPA TVOCs"
las_diurn_tvoc[["hour"]][["xlab"]] <- ""
las_diurn_tvoc[["hour"]][["y.limits"]] <- tvoc_lims
las_diurn_tvoc

ncf_diurn_tvoc <- timeVariation(ncf_5min_new, "tvoc_5min", ylab = "ppb")[[1]][2]
ncf_diurn_tvoc[["hour"]][["main"]] <- "(e) NCF TVOCs"
ncf_diurn_tvoc[["hour"]][["xlab"]] <- ""
ncf_diurn_tvoc[["hour"]][["y.limits"]] <- tvoc_lims
ncf_diurn_tvoc

uni_diurn_tvoc <- timeVariation(uni_5min_new, "tvoc_5min", ylab = "ppb")[[1]][2]
uni_diurn_tvoc[["hour"]][["main"]] <- "(f) UNILAG TVOCs"
uni_diurn_tvoc[["hour"]][["xlab"]] <- ""
uni_diurn_tvoc[["hour"]][["y.limits"]] <- tvoc_lims
uni_diurn_tvoc

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file tvoc
jpeg(file="tvoc_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_tvoc, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_tvoc, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_tvoc, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_tvoc, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_tvoc, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_tvoc, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()


##########################################################












# ############### Descriptive Statistics ###################

options(scipen = 100)
options(digits =2)

gas.summary <- function(x, na.rm=TRUE){
  result <- c(N=length(x),
              Minimum =min(x, na.rm=na.rm),
              Maximum =max(x, na.rm=na.rm),
              Median=median(x, na.rm=na.rm),
              Mean=mean(x, na.rm=na.rm),
              `Standard Deviation`=sd(x, na.rm=na.rm),
              `Coeff. Variation`=cv(x,na.rm=na.rm))
}




#abesan descriptive stats

abe_descdata <- data.frame(sapply(dplyr::select_if(abe_5min_new, is.numeric)[,], gas.summary))
abe_descdata <- cbind(`Abesan Stats` = rownames(abe_descdata), abe_descdata)
rownames(abe_descdata) <- 1:nrow(abe_descdata)
abe_descdata <- select(abe_descdata, c(1:5,9:13))
abe_descdata <- setNames(abe_descdata,c("Abesan Stats","NO2","O3","NO","SO2","PM25","PM10","CO","TVOC","CO2"))
abe_descdata

#ikorodu descriptive stats
iko_descdata <- data.frame(sapply(dplyr::select_if(iko_5min_new, is.numeric)[,], gas.summary))
iko_descdata <- cbind(`ikosan Stats` = rownames(iko_descdata), iko_descdata)
rownames(iko_descdata) <- 1:nrow(iko_descdata)
iko_descdata <- select(iko_descdata, c(1:5,9:13))
iko_descdata <- setNames(iko_descdata,c("Ikorodu Stats","NO2","O3","NO","SO2","PM25","PM10","CO","TVOC","CO2"))
iko_descdata

#jankara descriptive stats
jan_descdata <- data.frame(sapply(dplyr::select_if(jan_5min_new, is.numeric)[,], gas.summary))
jan_descdata <- cbind(`jansan Stats` = rownames(jan_descdata), jan_descdata)
rownames(jan_descdata) <- 1:nrow(jan_descdata)
jan_descdata <- select(jan_descdata, c(1:5,9:13))
jan_descdata <- setNames(jan_descdata,c("Jankara Stats","NO2","O3","NO","SO2","PM25","PM10","CO","TVOC","CO2"))
jan_descdata

#lasepa descriptive stats
las_descdata <- data.frame(sapply(dplyr::select_if(las_5min_new, is.numeric)[,], gas.summary))
las_descdata <- cbind(`lassan Stats` = rownames(las_descdata), las_descdata)
rownames(las_descdata) <- 1:nrow(las_descdata)
las_descdata <- select(las_descdata, c(1:5,9:13))
las_descdata <- setNames(las_descdata,c("LASEPA Stats","NO2","O3","NO","SO2","PM25","PM10","CO","TVOC","CO2"))
las_descdata

#ncf descriptive stats
ncf_descdata <- data.frame(sapply(dplyr::select_if(ncf_5min_new, is.numeric)[,], gas.summary))
ncf_descdata <- cbind(`ncfsan Stats` = rownames(ncf_descdata), ncf_descdata)
rownames(ncf_descdata) <- 1:nrow(ncf_descdata)
ncf_descdata <- select(ncf_descdata, c(1:5,9:13))
ncf_descdata <- setNames(ncf_descdata,c("NCF Stats","NO2","O3","NO","SO2","PM25","PM10","CO","TVOC","CO2"))
ncf_descdata

#uni descriptive stats
uni_descdata <- data.frame(sapply(dplyr::select_if(uni_5min_new, is.numeric)[,], gas.summary))
uni_descdata <- cbind(`unisan Stats` = rownames(uni_descdata), uni_descdata)
rownames(uni_descdata) <- 1:nrow(uni_descdata)
uni_descdata <- select(uni_descdata, c(1:5,9:13))
uni_descdata <- setNames(uni_descdata,c("UNILAG Stats","NO2","O3","NO","SO2","PM25","PM10","CO","TVOC","CO2"))
uni_descdata

summstats_expdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables"

setwd(summstats_expdir)
# explist <- list("abe_desc_summary" = abe_descdata,"iko_desc_summary" = iko_descdata,
                # "jan_desc_summary" = jan_descdata,"las_desc_summary" = las_descdata,
                # "ncf_desc_summary" = ncf_descdata,"uni_desc_summary" = uni_descdata)

abe_descdata <- abe_descdata %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
iko_descdata <- iko_descdata %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
jan_descdata <- jan_descdata %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
las_descdata <- las_descdata %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
ncf_descdata <- ncf_descdata %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
uni_descdata <- uni_descdata %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))

wb = createWorkbook()

addWorksheet(wb, "Combined SummStats")

sheet = "Combined SummStats"
unitlist <- c("(µg/m3)","	(µg/m3)","	(µg/m3)	","(µg/m3)","	(µg/m3)	","(µg/m3)	","(mg/m3)","	(ppb)","(ppm)",
              "(µg/m3)","	(µg/m3)","	(µg/m3)	","(µg/m3)","	(µg/m3)	","(µg/m3)	","(mg/m3)","	(ppb)","(ppm)")
writeData(wb,x= unitlist, sheet =sheet, borders = "all", startCol =2, startRow = 29)
writeData(wb, x= "Abesan", sheet=sheet, borders = "all",     startCol=2,startRow = 1, rowNames=FALSE, borderStyle = "thick")
writeData(wb, x= abe_descdata, sheet=sheet, borders = "all", startCol=1,startRow = 2, rowNames=FALSE)
writeData(wb, x= "Ikorodu", sheet=sheet, borders = "all",     startCol=11,startRow = 1, rowNames=FALSE, borderStyle = "thick")
writeData(wb, x= iko_descdata, sheet=sheet, borders = "all", startCol=11,startRow = 2, rowNames=FALSE)
writeData(wb, x= "Jankara", sheet=sheet, borders = "all",     startCol=2,startRow = 10, rowNames=FALSE, borderStyle = "thick")
writeData(wb, x= jan_descdata, sheet=sheet, borders = "all", startCol=1,startRow = 11, rowNames=FALSE)
writeData(wb, x= "LASEPA", sheet=sheet, borders = "all",     startCol=11,startRow = 10, rowNames=FALSE, borderStyle = "thick")
writeData(wb, x= las_descdata, sheet=sheet, borders = "all", startCol=11,startRow = 11, rowNames=FALSE)
writeData(wb, x= "NCF", sheet=sheet, borders = "all",     startCol=2,startRow = 19, rowNames=FALSE, borderStyle = "thick")
writeData(wb, x= ncf_descdata, sheet=sheet, borders = "all", startCol=1,startRow = 20, rowNames=FALSE)
writeData(wb, x= "UNILAG", sheet=sheet, borders = "all",     startCol=11,startRow = 19, rowNames=FALSE, borderStyle = "thick")
writeData(wb, x= uni_descdata, sheet=sheet, borders = "all", startCol=11,startRow = 20, rowNames=FALSE)


saveWorkbook(wb, "Summary_statistics.xlsx", overwrite = TRUE)

# write.xlsx(explist, "summary_statistics.xlsx",row.names = TRUE)



# PM Descriptive Statistics ###############
# function to obtain summary
pm.summary <- function(x, na.rm=TRUE){
  result <- c(N=length(x),
              Mean=mean(x, na.rm=na.rm),
              Median=median(x, na.rm=na.rm),
              `Standard Deviation`=sd(x, na.rm=na.rm),
              Minimum =min(x, na.rm=na.rm),
              Maximum =max(x, na.rm=na.rm),
              Percentiles = quantile(x,probs = c(.10, .25,0.50,0.75,0.90),na.rm = na.rm))
}

ind <- c("pm25_5min","pm10_5min","pm25___10")

#abe 
abe_5min_new$pm25___10 <- abe_5min_new$pm25_5min / abe_5min_new$pm10_5min
abe_pm_stats <- data.frame(sapply(abe_5min_new[, ind], pm.summary))
abe_pm_stats <- cbind(`Abesan PM Stats` = rownames(abe_pm_stats), abe_pm_stats)
abe_pm_stats <- setNames(abe_pm_stats,c("Abesan","PM2.5","PM10","PM2.5/10"))
rownames(abe_pm_stats) <- 1:nrow(abe_pm_stats)
abe_pm_stats

#iko
iko_5min_new$pm25___10 <- iko_5min_new$pm25_5min / iko_5min_new$pm10_5min
iko_pm_stats <- data.frame(sapply(iko_5min_new[, ind], pm.summary))
iko_pm_stats <- cbind(`Abesan PM Stats` = rownames(iko_pm_stats), iko_pm_stats)
iko_pm_stats <- setNames(iko_pm_stats,c("Ikorodu","PM2.5","PM10","PM2.5/10"))
rownames(iko_pm_stats) <- 1:nrow(iko_pm_stats)
iko_pm_stats

#jan
jan_5min_new$pm25___10 <- jan_5min_new$pm25_5min / jan_5min_new$pm10_5min
jan_pm_stats <- data.frame(sapply(jan_5min_new[, ind], pm.summary))
jan_pm_stats <- cbind(`Abesan PM Stats` = rownames(jan_pm_stats), jan_pm_stats)
jan_pm_stats <- setNames(jan_pm_stats,c("Jankara","PM2.5","PM10","PM2.5/10"))
rownames(jan_pm_stats) <- 1:nrow(jan_pm_stats)
jan_pm_stats

#las
las_5min_new$pm25___10 <- las_5min_new$pm25_5min / las_5min_new$pm10_5min
las_pm_stats <- data.frame(sapply(las_5min_new[, ind], pm.summary))
las_pm_stats <- cbind(`Abesan PM Stats` = rownames(las_pm_stats), las_pm_stats)
las_pm_stats <- setNames(las_pm_stats,c("LASEPA","PM2.5","PM10","PM2.5/10"))
rownames(las_pm_stats) <- 1:nrow(las_pm_stats)
las_pm_stats

#ncf
ncf_5min_new$pm25___10 <- ncf_5min_new$pm25_5min / ncf_5min_new$pm10_5min
ncf_pm_stats <- data.frame(sapply(ncf_5min_new[, ind], pm.summary))
ncf_pm_stats <- cbind(`Abesan PM Stats` = rownames(ncf_pm_stats), ncf_pm_stats)
ncf_pm_stats <- setNames(ncf_pm_stats,c("NCF","PM2.5","PM10","PM2.5/10"))
rownames(ncf_pm_stats) <- 1:nrow(ncf_pm_stats)
ncf_pm_stats

#uni
uni_5min_new$pm25___10 <- uni_5min_new$pm25_5min / uni_5min_new$pm10_5min
uni_pm_stats <- data.frame(sapply(uni_5min_new[, ind], pm.summary))
uni_pm_stats <- cbind(`Abesan PM Stats` = rownames(uni_pm_stats), uni_pm_stats)
uni_pm_stats <- setNames(uni_pm_stats,c("UNILAG","PM2.5","PM10","PM2.5/10"))
rownames(uni_pm_stats) <- 1:nrow(uni_pm_stats)
uni_pm_stats

abe_pm_stats <- abe_pm_stats %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
iko_pm_stats <- iko_pm_stats %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
jan_pm_stats <- jan_pm_stats %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
las_pm_stats <- las_pm_stats %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
ncf_pm_stats <- ncf_pm_stats %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))
uni_pm_stats <- uni_pm_stats %>% mutate(across(where(is.numeric), ~ round(., digits = 2)))

wb = createWorkbook()

addWorksheet(wb, "PM_Stats")

sheet = "PM_Stats"

writeData(wb, x= abe_pm_stats, sheet=sheet, borders = "all", startCol=1,startRow = 1, rowNames=FALSE)
writeData(wb, x= iko_pm_stats, sheet=sheet, borders = "all", startCol=5,startRow = 1, rowNames=FALSE)
writeData(wb, x= jan_pm_stats, sheet=sheet, borders = "all", startCol=1,startRow = 14, rowNames=FALSE)
writeData(wb, x= las_pm_stats, sheet=sheet, borders = "all", startCol=5,startRow = 14, rowNames=FALSE)
writeData(wb, x= ncf_pm_stats, sheet=sheet, borders = "all", startCol=1,startRow = 27, rowNames=FALSE)
writeData(wb, x= uni_pm_stats, sheet=sheet, borders = "all", startCol=5,startRow = 27, rowNames=FALSE)

saveWorkbook(wb, "PM_Stats.xlsx",overwrite = TRUE)


abe_pm_tbl <- flextable(abe_pm_stats)

abe_pm_tbl <- theme_vanilla(abe_pm_tbl)
abe_pm_tbl <- align(abe_pm_tbl,j = c(2,3,4) ,align = "center")
abe_pm_tbl







































































