library(tidyverse);library(plyr);library(data.table)
library(openair);library(sqldf);library(ggplot2);library(dplyr)
library(openxlsx);library(readxl);library(ggpubr);library(lubridate)
#function to replace all NaN with NA
is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

# import AQ data ####################
abe_colnames <- c("date","no2","o3","no","so2","lat","lon","pm1","pm25","pm10","co","tvoc","co2","site")
iko_colnames <- c("date","no2","o3","no","so2","lat","lon","pm1","pm25","pm10","co","tvoc","co2","site")
jan_colnames <- c("date","no2","o3","no","so2","lat","lon","pm1","pm25","pm10","co","tvoc","co2","site")
las_colnames <- c("date","no2","o3","no","so2","lat","lon","pm1","pm25","pm10","co","tvoc","co2","site")
ncf_colnames <- c("date","no2","o3","no","so2","lat","lon","pm1","pm25","pm10","co","tvoc","co2","site")
uni_colnames <- c("date","no2","o3","no","so2","lat","lon","pm1","pm25","pm10","co","tvoc","co2","site")

#import aug 5min
aug5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/August Database/AQ_5min_August_QC.xlsx"
excel_sheets(aug5minfile)[1:6]
augabe <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames, skip = 1)
augiko <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames, skip = 1)
augjan <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames, skip = 1)
auglas <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames, skip = 1)
augncf <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames, skip = 1)
auguni <- read_xlsx(aug5minfile,sheet = excel_sheets(aug5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames, skip = 1)

#import sep 5min
sep5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/September Database/AQ_5min_September_QC.xlsx"
excel_sheets(sep5minfile)[1:6]
sepabe <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames, skip = 1)
sepiko <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames, skip = 1)
sepjan <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames, skip = 1)
seplas <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames, skip = 1)
sepncf <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames, skip = 1)
sepuni <- read_xlsx(sep5minfile,sheet = excel_sheets(sep5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames, skip = 1)

#import oct 5min
oct5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/October Database/AQ_5min_October_QC.xlsx"
excel_sheets(oct5minfile)[1:6]
octabe <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames, skip = 1)
octiko <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames, skip = 1)
octjan <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames, skip = 1)
octlas <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames, skip = 1)
octncf <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames, skip = 1)
octuni <- read_xlsx(oct5minfile,sheet = excel_sheets(oct5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames, skip = 1)

#import nov 5min
nov5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/November Database/AQ_5min_November_QC.xlsx"
excel_sheets(nov5minfile)[1:6]
novabe <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames, skip = 1)
noviko <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames, skip = 1)
novjan <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames, skip = 1)
novlas <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames, skip = 1)
novncf <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames, skip = 1)
novuni <- read_xlsx(nov5minfile,sheet = excel_sheets(nov5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames, skip = 1)

#import dec 5min
dec5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/December Database/AQ_5min_December_QC.xlsx"
excel_sheets(dec5minfile)[1:6]
decabe <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames, skip = 1)
deciko <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames, skip = 1)
decjan <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames, skip = 1)
declas <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames, skip = 1)
decncf <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames, skip = 1)
decuni <- read_xlsx(dec5minfile,sheet = excel_sheets(dec5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames, skip = 1)

#import jan 5min
jan5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/January Database/AQ_5min_January_QC.xlsx"
excel_sheets(jan5minfile)[1:6]
janabe <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames, skip = 1)
janiko <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames, skip = 1)
janjan <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames, skip = 1)
janlas <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames, skip = 1)
janncf <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames, skip = 1)
januni <- read_xlsx(jan5minfile,sheet = excel_sheets(jan5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames, skip = 1)

# bind each site for all six months
abe_bind <- rbind(augabe,sepabe,octabe,novabe,decabe,janabe)
iko_bind <- rbind(augiko,sepiko,octiko,noviko,deciko,janiko)
jan_bind <- rbind(augjan,sepjan,octjan,novjan,decjan,janjan)
las_bind <- rbind(auglas,seplas,octlas,novlas,declas,janlas)
ncf_bind <- rbind(augncf,sepncf,octncf,novncf,decncf,janncf)
uni_bind <- rbind(auguni,sepuni,octuni,novuni,decuni,januni)


startDate <- "2020-08-01 00:00:00" # august 1 2020
endDate <- "2021-01-31 23:59:00" # february 1 2021

# average to 1 day

abe_24h <- timeAverage(abe_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
iko_24h <- timeAverage(iko_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
jan_24h <- timeAverage(jan_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
las_24h <- timeAverage(las_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_24h <- timeAverage(ncf_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
uni_24h <- timeAverage(uni_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)

summary(abe_24h)
summary(abe_bind)

abe_24h$site <- "Abesan"
iko_24h$site <- "Ikorodu"
jan_24h$site <- "Jankara"
las_24h$site <- "LASEPA"
ncf_24h$site <- "NCF"
uni_24h$site <- "UNILAG"

names(abe_24h)
summary(abe_24h)

aq_allsites_24h <- rbind(abe_24h,iko_24h,jan_24h,las_24h,ncf_24h,uni_24h)
# aq_allsites_24h <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(abe_24h,iko_24h,jan_24h,las_24h,ncf_24h,uni_24h))

aq_allsites_24h$mergecol <- paste(aq_allsites_24h$date,aq_allsites_24h$site, sep = "") 

summary(aq_allsites_24h)
nrow(aq_allsites_24h)

# import met data ##############################################



abe_colnames_met <- c("date","press","temp","rh","wb_temp","ws","wd","rain","lat1","lon1","site")
iko_colnames_met <- c("date","press","temp","rh","wb_temp","ws","wd","rain","lat1","lon1","site")
jan_colnames_met <- c("date","press","temp","rh","wb_temp","ws","wd","rain","lat1","lon1","site")
las_colnames_met <- c("date","press","temp","rh","wb_temp","ws","wd","rain","lat1","lon1","site")
ncf_colnames_met <- c("date","press","temp","rh","wb_temp","ws","wd","rain","lat1","lon1","site")
uni_colnames_met <- c("date","press","temp","rh","wb_temp","ws","wd","rain","lat1","lon1","site")

#import aug 24h
met_aug5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/August Database/MET_5min_August.xlsx"
excel_sheets(met_aug5minfile)[1:6]
met_augabe <- read_xlsx(met_aug5minfile,sheet = excel_sheets(met_aug5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_met, skip = 1)
met_augiko <- read_xlsx(met_aug5minfile,sheet = excel_sheets(met_aug5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_met, skip = 1)
met_augjan <- read_xlsx(met_aug5minfile,sheet = excel_sheets(met_aug5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_met, skip = 1)
met_auglas <- read_xlsx(met_aug5minfile,sheet = excel_sheets(met_aug5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_met, skip = 1)
met_augncf <- read_xlsx(met_aug5minfile,sheet = excel_sheets(met_aug5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_met, skip = 1)
met_auguni <- read_xlsx(met_aug5minfile,sheet = excel_sheets(met_aug5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_met, skip = 1)

#import sep 5min
met_sep5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/September Database/MET_5min_September.xlsx"
excel_sheets(met_sep5minfile)[1:6]
met_sepabe <- read_xlsx(met_sep5minfile,sheet = excel_sheets(met_sep5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_met, skip = 1)
met_sepiko <- read_xlsx(met_sep5minfile,sheet = excel_sheets(met_sep5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_met, skip = 1)
met_sepjan <- read_xlsx(met_sep5minfile,sheet = excel_sheets(met_sep5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_met, skip = 1)
met_seplas <- read_xlsx(met_sep5minfile,sheet = excel_sheets(met_sep5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_met, skip = 1)
met_sepncf <- read_xlsx(met_sep5minfile,sheet = excel_sheets(met_sep5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_met, skip = 1)
met_sepuni <- read_xlsx(met_sep5minfile,sheet = excel_sheets(met_sep5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_met, skip = 1)

#import oct 5min
met_oct5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/October Database/MET_5min_October.xlsx"
excel_sheets(met_oct5minfile)[1:6]
met_octabe <- read_xlsx(met_oct5minfile,sheet = excel_sheets(met_oct5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_met, skip = 1)
met_octiko <- read_xlsx(met_oct5minfile,sheet = excel_sheets(met_oct5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_met, skip = 1)
met_octjan <- read_xlsx(met_oct5minfile,sheet = excel_sheets(met_oct5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_met, skip = 1)
met_octlas <- read_xlsx(met_oct5minfile,sheet = excel_sheets(met_oct5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_met, skip = 1)
met_octncf <- read_xlsx(met_oct5minfile,sheet = excel_sheets(met_oct5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_met, skip = 1)
met_octuni <- read_xlsx(met_oct5minfile,sheet = excel_sheets(met_oct5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_met, skip = 1)

#import nov 5min
met_nov5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/November Database/MET_5min_November.xlsx"
excel_sheets(met_nov5minfile)[1:6]
met_novabe <- read_xlsx(met_nov5minfile,sheet = excel_sheets(met_nov5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_met, skip = 1)
met_noviko <- read_xlsx(met_nov5minfile,sheet = excel_sheets(met_nov5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_met, skip = 1)
met_novjan <- read_xlsx(met_nov5minfile,sheet = excel_sheets(met_nov5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_met, skip = 1)
met_novlas <- read_xlsx(met_nov5minfile,sheet = excel_sheets(met_nov5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_met, skip = 1)
met_novncf <- read_xlsx(met_nov5minfile,sheet = excel_sheets(met_nov5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_met, skip = 1)
met_novuni <- read_xlsx(met_nov5minfile,sheet = excel_sheets(met_nov5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_met, skip = 1)

#import dec 5min
met_dec5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/December Database/MET_5min_December.xlsx"
excel_sheets(met_dec5minfile)[1:6]
met_decabe <- read_xlsx(met_dec5minfile,sheet = excel_sheets(met_dec5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_met, skip = 1)
met_deciko <- read_xlsx(met_dec5minfile,sheet = excel_sheets(met_dec5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_met, skip = 1)
met_decjan <- read_xlsx(met_dec5minfile,sheet = excel_sheets(met_dec5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_met, skip = 1)
met_declas <- read_xlsx(met_dec5minfile,sheet = excel_sheets(met_dec5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_met, skip = 1)
met_decncf <- read_xlsx(met_dec5minfile,sheet = excel_sheets(met_dec5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_met, skip = 1)
met_decuni <- read_xlsx(met_dec5minfile,sheet = excel_sheets(met_dec5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_met, skip = 1)

#import jan 5min
met_jan5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/January Database/MET_5min_January.xlsx"
excel_sheets(met_jan5minfile)[1:6]
met_janabe <- read_xlsx(met_jan5minfile,sheet = excel_sheets(met_jan5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_met, skip = 1)
met_janiko <- read_xlsx(met_jan5minfile,sheet = excel_sheets(met_jan5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_met, skip = 1)
met_janjan <- read_xlsx(met_jan5minfile,sheet = excel_sheets(met_jan5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_met, skip = 1)
met_janlas <- read_xlsx(met_jan5minfile,sheet = excel_sheets(met_jan5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_met, skip = 1)
met_janncf <- read_xlsx(met_jan5minfile,sheet = excel_sheets(met_jan5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_met, skip = 1)
met_januni <- read_xlsx(met_jan5minfile,sheet = excel_sheets(met_jan5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_met, skip = 1)



# bind each site for all six months
met_abe_bind <- rbind(met_augabe,met_sepabe,met_octabe,met_novabe,met_decabe,met_janabe)
met_iko_bind <- rbind(met_augiko,met_sepiko,met_octiko,met_noviko,met_deciko,met_janiko)
met_jan_bind <- rbind(met_augjan,met_sepjan,met_octjan,met_novjan,met_decjan,met_janjan)
met_las_bind <- rbind(met_auglas,met_seplas,met_octlas,met_novlas,met_declas,met_janlas)
met_ncf_bind <- rbind(met_augncf,met_sepncf,met_octncf,met_novncf,met_decncf,met_janncf)
met_uni_bind <- rbind(met_auguni,met_sepuni,met_octuni,met_novuni,met_decuni,met_januni)

# average to 5 min

met_abe_24h <- timeAverage(met_abe_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
met_iko_24h <- timeAverage(met_iko_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
met_jan_24h <- timeAverage(met_jan_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
met_las_24h <- timeAverage(met_las_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
met_ncf_24h <- timeAverage(met_ncf_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)
met_uni_24h <- timeAverage(met_uni_bind, avg.time = "1 day", statistic = "mean", start.date = startDate, end.date = endDate)


met_abe_24h$site <- "Abesan"
met_iko_24h$site <- "Ikorodu"
met_jan_24h$site <- "Jankara"
met_las_24h$site <- "LASEPA"
met_ncf_24h$site <- "NCF"
met_uni_24h$site <- "UNILAG"



met_allsites_24h <- rbind(met_abe_24h,met_iko_24h,met_jan_24h,met_las_24h,met_ncf_24h,met_uni_24h)
summary(met_allsites_24h)
met_allsites_24h$mergecol <- paste(met_allsites_24h$date,met_allsites_24h$site, sep = "")
allsites_24h <- merge(aq_allsites_24h,met_allsites_24h, by = "mergecol", all = TRUE)
summary(allsites_24h)

###### PM MET SUMMAARY TABLE ####################

names(allsites_24h)

pm_met_summ_tbl <- sqldf("SELECT `site.x` as Location,
                         ROUND(MIN(pm25),1) || ' - ' || ROUND(MAX(pm25),1) as Range,
                         ROUND(AVG(pm25),1) as Mean,
                         ROUND(MIN(pm10),1) || ' - ' || ROUND(MAX(pm10),1) as Range,
                         ROUND(AVG(pm10),1) as Mean,
                         ROUND(MIN(temp),1) || ' - ' || ROUND(MAX(temp),1) as Range,
                         ROUND(AVG(temp),1) as Mean,
                         ROUND(MIN(rh),0) || ' - ' || ROUND(MAX(rh),0) as Range,
                         ROUND(AVG(rh),1) as Mean,
                         ROUND(MIN(ws),1) || ' - ' || ROUND(MAX(ws),1) as Range,
                         ROUND(AVG(ws),1) as Mean
                         FROM allsites_24h
                         GROUP BY `site.x`")
pm_met_summ_tbl

write.xlsx(pm_met_summ_tbl, "PM_MET_Summary_table_unformatted.xlsx", row.names = FALSE)

setwd("C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/")



# 
# pm_kt <- kable(pm_met_summ_tbl) %>%
#   kable_classic(full_width = F) %>%
#   add_header_above(c(" " =1, "PM2.5 (ug/m3)" = 2,"PM10 (ug/m3)" = 2,"Air Temperature (\u00B0C)" = 2, "Relative Humidity (%)" = 2, "Wind Speed (m/s)" = 2 ))
# 
# pm_kt
# 
# str <- paste(expression(PM[2.5]~(mu~gm^-3)))







