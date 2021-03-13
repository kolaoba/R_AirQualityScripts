library(tidyverse);library(plyr);library(data.table)
library(openair);library(sqldf);library(ggplot2);library(dplyr)
library(openxlsx);library(readxl);library(ggpubr);library(lubridate)
#function to replace all NaN with NA
is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))

# import AQ data ####################
abe_colnames <- c("date","abeno2","abeo3","abeno","abeso2","abelat","abelon","abepm1","abepm25","abepm10","abeco","abetvoc","abeco2","abesite")
iko_colnames <- c("date","ikono2","ikoo3","ikono","ikoso2","ikolat","ikolon","ikopm1","ikopm25","ikopm10","ikoco","ikotvoc","ikoco2","ikosite")
jan_colnames <- c("date","janno2","jano3","janno","janso2","janlat","janlon","janpm1","janpm25","janpm10","janco","jantvoc","janco2","jansite")
las_colnames <- c("date","lasno2","laso3","lasno","lasso2","laslat","laslon","laspm1","laspm25","laspm10","lasco","lastvoc","lasco2","lassite")
ncf_colnames <- c("date","ncfno2","ncfo3","ncfno","ncfso2","ncflat","ncflon","ncfpm1","ncfpm25","ncfpm10","ncfco","ncftvoc","ncfco2","ncfsite")
uni_colnames <- c("date","unino2","unio3","unino","uniso2","unilat","unilon","unipm1","unipm25","unipm10","unico","unitvoc","unico2","unisite")

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

# average to 5 min

abe_5min <- timeAverage(abe_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
iko_5min <- timeAverage(iko_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
jan_5min <- timeAverage(jan_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
las_5min <- timeAverage(las_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
ncf_5min <- timeAverage(ncf_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
uni_5min <- timeAverage(uni_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)

names(abe_5min)
summary(abe_5min)
aq_allsites_5min <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(abe_5min,iko_5min,jan_5min,las_5min,ncf_5min,uni_5min))


summary(aq_allsites_5min)
nrow(aq_allsites_5min)

# import met data ##############################################



abe_colnames_met <- c("date","abepress","abetemp","aberh","abewb_temp","abews","abewd","aberain","abelat","abelon","abesite")
iko_colnames_met <- c("date","ikopress","ikotemp","ikorh","ikowb_temp","ikows","ikowd","ikorain","ikolat","ikolon","ikosite")
jan_colnames_met <- c("date","janpress","jantemp","janrh","janwb_temp","janws","janwd","janrain","janlat","janlon","jansite")
las_colnames_met <- c("date","laspress","lastemp","lasrh","laswb_temp","lasws","laswd","lasrain","laslat","laslon","lassite")
ncf_colnames_met <- c("date","ncfpress","ncftemp","ncfrh","ncfwb_temp","ncfws","ncfwd","ncfrain","ncflat","ncflon","ncfsite")
uni_colnames_met <- c("date","unipress","unitemp","unirh","uniwb_temp","uniws","uniwd","unirain","unilat","unilon","unisite")

#import aug 5min
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

met_abe_5min <- timeAverage(met_abe_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
met_iko_5min <- timeAverage(met_iko_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
met_jan_5min <- timeAverage(met_jan_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
met_las_5min <- timeAverage(met_las_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
met_ncf_5min <- timeAverage(met_ncf_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)
met_uni_5min <- timeAverage(met_uni_bind, avg.time = "5 min", statistic = "mean", start.date = startDate, end.date = endDate)


met_allsites_5min <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(met_abe_5min,met_iko_5min,met_jan_5min,met_las_5min,met_ncf_5min,met_uni_5min))
summary(met_allsites_5min)
# merge aq mnd met for all sites ###########################

allsites_5min <- merge(aq_allsites_5min,met_allsites_5min, by = "date")


summary(allsites_5min)
nrow(allsites_5min)
ncol(allsites_5min)

allsites_5min[is.nan(allsites_5min)] <- NA

summary(allsites_5min)

# 
# tempnames <-grep("*temp", names(met_allsites_5min), value =  TRUE)
# tempcols <- select(met_allsites_5min, all_of(tempnames))
# summary(tempcols[,seq_len(ncol(tempcols)) %% 2 != 0])



# average to x hours ###############
allsites_24h <- timeAverage(allsites_5min, avg.time = "1 day", statistic = "mean")
allsites_1h <- timeAverage(allsites_5min, avg.time = "1 hour", statistic = "mean")
allsites_8h <- timeAverage(allsites_5min, avg.time = "8 hour", statistic = "mean")

# format, add site column, filter by site, then stack ##################
hnames = names(allsites_24h)

abenames <-c("date",grep("^a", hnames, value =  TRUE))
ikonames <-c("date",grep("^i", hnames, value =  TRUE))
lasnames <-c("date",grep("^l", hnames, value =  TRUE))
jannames <-c("date",grep("^j", hnames, value =  TRUE))
ncfnames <-c("date",grep("^n", hnames, value =  TRUE))
uninames <-c("date",grep("^u", hnames, value =  TRUE))


abe_5m <- select(allsites_5min,all_of(abenames))
iko_5m <- select(allsites_5min,all_of(ikonames))
las_5m <- select(allsites_5min,all_of(lasnames))
jan_5m <- select(allsites_5min,all_of(jannames))
ncf_5m <- select(allsites_5min,all_of(ncfnames))
uni_5m <- select(allsites_5min,all_of(uninames))

############## quick export for mr Ganiyu ################
# 
# abe_5m_drop <- abe_5m %>% drop_na(abepm25) %>% select(c(1,8,9,10,14,15,16,18,20)) %>% drop_na(abetemp)
# iko_5m_drop <- iko_5m %>% drop_na(ikopm25) %>% select(c(1,8,9,10,14,15,16,18,20)) %>% drop_na(ikotemp)
# las_5m_drop <- las_5m %>% drop_na(laspm25) %>% select(c(1,8,9,10,14,15,16,18,20)) %>% drop_na(lastemp)
# jan_5m_drop <- jan_5m %>% drop_na(janpm25) %>% select(c(1,8,9,10,14,15,16,18,20)) %>% drop_na(jantemp)
# ncf_5m_drop <- ncf_5m %>% drop_na(ncfpm25) %>% select(c(1,8,9,10,14,15,16,18,20)) %>% drop_na(ncftemp)
# uni_5m_drop <- uni_5m %>% drop_na(unipm25) %>% select(c(1,8,9,10,14,15,16,18,20)) %>% drop_na(unitemp)
# 
# names(abe_5m_drop)
# explistxl <- list('abesan' = abe_5m_drop,
#                   'ikorodu' = iko_5m_drop,
#                   'jankara' = jan_5m_drop,
#                   'lasepa' = las_5m_drop,
#                   'ncf' = ncf_5m_drop,
#                   'unilag' = uni_5m_drop)
# getwd()
# 
# write.xlsx(explistxl, "Met_AQ_data_for_correlation.xlsx", row.names = FALSE)

############


abe_24h <- select(allsites_24h,all_of(abenames))
iko_24h <- select(allsites_24h,all_of(ikonames))
las_24h <- select(allsites_24h,all_of(lasnames))
jan_24h <- select(allsites_24h,all_of(jannames))
ncf_24h <- select(allsites_24h,all_of(ncfnames))
uni_24h <- select(allsites_24h,all_of(uninames))

abe_24h$site <- "abesan"
iko_24h$site <- "ikorodu"
las_24h$site <- "lasepa"
jan_24h$site <- "jankara"
ncf_24h$site <- "ncf"
uni_24h$site <- "unilag"

summary(abe_24h)
colnames(abe_24h)

abe_1h <- select(allsites_1h,all_of(abenames))
iko_1h <- select(allsites_1h,all_of(ikonames))
las_1h <- select(allsites_1h,all_of(lasnames))
jan_1h <- select(allsites_1h,all_of(jannames))
ncf_1h <- select(allsites_1h,all_of(ncfnames))
uni_1h <- select(allsites_1h,all_of(uninames))

abe_1h$site <- "abesan"
iko_1h$site <- "ikorodu"
las_1h$site <- "lasepa"
jan_1h$site <- "jankara"
ncf_1h$site <- "ncf"
uni_1h$site <- "unilag"


abe_8h <- select(allsites_8h,all_of(abenames))
iko_8h <- select(allsites_8h,all_of(ikonames))
las_8h <- select(allsites_8h,all_of(lasnames))
jan_8h <- select(allsites_8h,all_of(jannames))
ncf_8h <- select(allsites_8h,all_of(ncfnames))
uni_8h <- select(allsites_8h,all_of(uninames))

abe_8h$site <- "abesan"
iko_8h$site <- "ikorodu"
las_8h$site <- "lasepa"
jan_8h$site <- "jankara"
ncf_8h$site <- "ncf"
uni_8h$site <- "unilag"


force_bind = function(df1, df2, df3, df4, df5, df6) {
  colnames(df2) = colnames(df1)
  colnames(df3) = colnames(df1)
  colnames(df4) = colnames(df1)
  colnames(df5) = colnames(df1)
  colnames(df6) = colnames(df1)
  bind_rows(df1, df2, df3, df4, df5, df6)
}

all_24h <- data.frame(force_bind(abe_24h, iko_24h, las_24h, jan_24h, ncf_24h, uni_24h))
all_1h <- data.frame(force_bind(abe_1h, iko_1h, las_1h, jan_1h, ncf_1h, uni_1h))
all_8h <- data.frame(force_bind(abe_8h, iko_8h, las_8h, jan_8h, ncf_8h, uni_8h))

all_24h[is.nan(all_24h)] <- NA
all_1h[is.nan(all_1h)] <- NA
all_8h[is.nan(all_8h)] <- NA

names(all_24h)

nnames <- c("date","no2","o3","no","so2","lat.x","lon.x","pm1","pm25","pm10","co","tvoc","co2",
            "press","temp","rh","wb_temp","ws","wd","rain","lat.y","lon.y","site")

all_24h <- setNames(all_24h, nnames)
all_1h <- setNames(all_1h, nnames)
all_8h <- setNames(all_8h, nnames)

# add met categories ################################
all_24h$temprange <- cut(all_24h$temp, breaks = c(-Inf,28.9,30.9,35.9, Inf), labels = c("<28.9","29-30.9","31-35.9",">36"), include.lowest = TRUE)
all_24h$rhrange <- cut(all_24h$rh, breaks = c(-Inf,68.08, 82.6, Inf), labels = c("<68.08","68.09-82.60",">82.61"), include.lowest = TRUE)
all_24h$rainrange <- cut(all_24h$rain, breaks = c(-Inf,0, Inf), labels = c("dry","wet"), include.lowest = TRUE)
all_24h$wsrange <- cut(all_24h$ws, breaks = c(-Inf,1.39, 2.79, Inf), labels = c("<1.39","1.40-2.79",">2.80"), include.lowest = TRUE)

all_1h$temprange <- cut(all_1h$temp, breaks = c(-Inf,28.9,30.9,35.9, Inf), labels = c("<28.9","29-30.9","31-35.9",">36"), include.lowest = TRUE)
all_1h$rhrange <- cut(all_1h$rh, breaks = c(-Inf,68.08, 82.6, Inf), labels = c("<68.08","68.09-82.60",">82.61"), include.lowest = TRUE)
all_1h$rainrange <- cut(all_1h$rain, breaks = c(-Inf,0, Inf), labels = c("dry","wet"), include.lowest = TRUE)
all_1h$wsrange <- cut(all_1h$ws, breaks = c(-Inf,1.39, 2.79, Inf), labels = c("<1.39","1.40-2.79",">2.80"), include.lowest = TRUE)

all_8h$temprange <- cut(all_8h$temp, breaks = c(-Inf,28.9,30.9,35.9, Inf), labels = c("<28.9","29-30.9","31-35.9",">36"), include.lowest = TRUE)
all_8h$rhrange <- cut(all_8h$rh, breaks = c(-Inf,68.08, 82.6, Inf), labels = c("<68.08","68.09-82.60",">82.61"), include.lowest = TRUE)
all_8h$rainrange <- cut(all_8h$rain, breaks = c(-Inf,0, Inf), labels = c("dry","wet"), include.lowest = TRUE)
all_8h$wsrange <- cut(all_8h$ws, breaks = c(-Inf,1.39, 2.79, Inf), labels = c("<1.39","1.40-2.79",">2.80"), include.lowest = TRUE)


#######################################
#exceedance plots for all met parameters ########
# PM plots #################
# expdir for PM plots
met_plt_dir_pm <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Met_Exceedances Plots/PM plots"
dir.create(met_plt_dir_pm)
setwd(met_plt_dir_pm)



# filter pm exceedances events
pm25_all_24h <- filter(all_24h, pm25 > 25)
pm10_all_24h <- filter(all_24h, pm10 > 50)
# add a pollutrant column
pm25_all_24h$pollutant <- "PM2.5"
pm10_all_24h$pollutant <- "PM10"

# bind for multiple pollutants 
pm_all_24h <- rbind(pm25_all_24h,pm10_all_24h) 
# arrange pollutants as per perference
pm_all_24h$pollutant <- factor(pm_all_24h$pollutant, levels = c("PM2.5","PM10"))



# ABESAN #####################################
# group by and summarise events into bins
pm_all_24h_temp_tbl <- pm_all_24h %>%
  group_by(temprange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")



# barplot 
abe_pm_temp_pl <- ggplot(na.omit(filter(pm_all_24h_temp_tbl, site == "abesan")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_pm_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
pm_all_24h_rh_tbl <- pm_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_pm_rh_pl <- ggplot(na.omit(filter(pm_all_24h_rh_tbl, site == "abesan")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_pm_rh_pl

# PRECIPITATION
# group by and summarise events into bins
pm_all_24h_rain_tbl <- pm_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_pm_rain_pl <- ggplot(na.omit(filter(pm_all_24h_rain_tbl, site == "abesan")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_pm_rain_pl

# WIND SPEED
# group by and summarise events into bins
pm_all_24h_ws_tbl <- pm_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_pm_ws_pl <- ggplot(na.omit(filter(pm_all_24h_ws_tbl, site == "abesan")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_pm_ws_pl

abe_met_pm <- ggarrange(abe_pm_temp_pl,abe_pm_rh_pl,abe_pm_rain_pl,abe_pm_ws_pl,
                    labels = c("(a)","(b)","(c)","(d)"),
                    ncol = 2,nrow = 2)
abe_met_pm

abe_met_pm <- annotate_figure(abe_met_pm, top = text_grob(bquote(Abesan~PM~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="abe_met_pm.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_met_pm
# Close the pdf file
dev.off()

# IKORODU ####################################################################
# barplot 
iko_pm_temp_pl <- ggplot(na.omit(filter(pm_all_24h_temp_tbl, site == "ikorodu")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_pm_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
pm_all_24h_rh_tbl <- pm_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_pm_rh_pl <- ggplot(na.omit(filter(pm_all_24h_rh_tbl, site == "ikorodu")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_pm_rh_pl

# PRECIPITATION
# group by and summarise events into bins
pm_all_24h_rain_tbl <- pm_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_pm_rain_pl <- ggplot(na.omit(filter(pm_all_24h_rain_tbl, site == "ikorodu")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_pm_rain_pl

# WIND SPEED
# group by and summarise events into bins
pm_all_24h_ws_tbl <- pm_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_pm_ws_pl <- ggplot(na.omit(filter(pm_all_24h_ws_tbl, site == "ikorodu")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_pm_ws_pl

iko_met_pm <- ggarrange(iko_pm_temp_pl,iko_pm_rh_pl,iko_pm_rain_pl,iko_pm_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
iko_met_pm

iko_met_pm <- annotate_figure(iko_met_pm, top = text_grob(bquote(Ikorodu~PM~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="iko_met_pm.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
iko_met_pm
# Close the pdf file
dev.off()

# JANKARA ####################################################################
# barplot 
jan_pm_temp_pl <- ggplot(na.omit(filter(pm_all_24h_temp_tbl, site == "jankara")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_pm_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
pm_all_24h_rh_tbl <- pm_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_pm_rh_pl <- ggplot(na.omit(filter(pm_all_24h_rh_tbl, site == "jankara")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_pm_rh_pl

# PRECIPITATION
# group by and summarise events into bins
pm_all_24h_rain_tbl <- pm_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_pm_rain_pl <- ggplot(na.omit(filter(pm_all_24h_rain_tbl, site == "jankara")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_pm_rain_pl

# WIND SPEED
# group by and summarise events into bins
pm_all_24h_ws_tbl <- pm_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_pm_ws_pl <- ggplot(na.omit(filter(pm_all_24h_ws_tbl, site == "jankara")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_pm_ws_pl

jan_met_pm <- ggarrange(jan_pm_temp_pl,jan_pm_rh_pl,jan_pm_rain_pl,jan_pm_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
jan_met_pm

jan_met_pm <- annotate_figure(jan_met_pm, top = text_grob(bquote(Jankara~PM~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="jan_met_pm.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
jan_met_pm
# Close the pdf file
dev.off()

# Lasepa ####################################################################
# barplot 
las_pm_temp_pl <- ggplot(na.omit(filter(pm_all_24h_temp_tbl, site == "lasepa")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_pm_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
pm_all_24h_rh_tbl <- pm_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_pm_rh_pl <- ggplot(na.omit(filter(pm_all_24h_rh_tbl, site == "lasepa")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_pm_rh_pl

# PRECIPITATION
# group by and summarise events into bins
pm_all_24h_rain_tbl <- pm_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_pm_rain_pl <- ggplot(na.omit(filter(pm_all_24h_rain_tbl, site == "lasepa")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_pm_rain_pl

# WIND SPEED
# group by and summarise events into bins
pm_all_24h_ws_tbl <- pm_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_pm_ws_pl <- ggplot(na.omit(filter(pm_all_24h_ws_tbl, site == "lasepa")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_pm_ws_pl

las_met_pm <- ggarrange(las_pm_temp_pl,las_pm_rh_pl,las_pm_rain_pl,las_pm_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
las_met_pm

las_met_pm <- annotate_figure(las_met_pm, top = text_grob(bquote(LASEPA~PM~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="las_met_pm.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_met_pm
# Close the pdf file
dev.off()


# NCF ####################################################################
# barplot 
ncf_pm_temp_pl <- ggplot(na.omit(filter(pm_all_24h_temp_tbl, site == "ncf")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_pm_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
pm_all_24h_rh_tbl <- pm_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_pm_rh_pl <- ggplot(na.omit(filter(pm_all_24h_rh_tbl, site == "ncf")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_pm_rh_pl

# PRECIPITATION
# group by and summarise events into bins
pm_all_24h_rain_tbl <- pm_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_pm_rain_pl <- ggplot(na.omit(filter(pm_all_24h_rain_tbl, site == "ncf")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_pm_rain_pl

# WIND SPEED
# group by and summarise events into bins
pm_all_24h_ws_tbl <- pm_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_pm_ws_pl <- ggplot(na.omit(filter(pm_all_24h_ws_tbl, site == "ncf")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_pm_ws_pl

ncf_met_pm <- ggarrange(ncf_pm_temp_pl,ncf_pm_rh_pl,ncf_pm_rain_pl,ncf_pm_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
ncf_met_pm

ncf_met_pm <- annotate_figure(ncf_met_pm, top = text_grob(bquote(NCF~PM~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="ncf_met_pm.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
ncf_met_pm
# Close the pdf file
dev.off()

# UNILAG ####################################################################
# barplot 
uni_pm_temp_pl <- ggplot(na.omit(filter(pm_all_24h_temp_tbl, site == "unilag")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_pm_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
pm_all_24h_rh_tbl <- pm_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_pm_rh_pl <- ggplot(na.omit(filter(pm_all_24h_rh_tbl, site == "unilag")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_pm_rh_pl

# PRECIPITATION
# group by and summarise events into bins
pm_all_24h_rain_tbl <- pm_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_pm_rain_pl <- ggplot(na.omit(filter(pm_all_24h_rain_tbl, site == "unilag")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_pm_rain_pl

# WIND SPEED
# group by and summarise events into bins
pm_all_24h_ws_tbl <- pm_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_pm_ws_pl <- ggplot(na.omit(filter(pm_all_24h_ws_tbl, site == "unilag")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("PM2.5" = "darkgrey", "PM10" = "gray18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_pm_ws_pl

uni_met_pm <- ggarrange(uni_pm_temp_pl,uni_pm_rh_pl,uni_pm_rain_pl,uni_pm_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
uni_met_pm

uni_met_pm <- annotate_figure(uni_met_pm, top = text_grob(bquote(UNILAG~PM~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="uni_met_pm.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
uni_met_pm
# Close the pdf file
dev.off()







#########################################

########################################
# SO2 plots ###########################################
# expdir for SO2 plots
met_plt_dir_so2 <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Met_Exceedances Plots/SO2 plots"
dir.create(met_plt_dir_so2)
setwd(met_plt_dir_so2)

# filter pm exceedances events
so2_all_24h <- filter(all_24h, so2 > 20)

# add a pollutrant column
so2_all_24h$pollutant <- "SO2"


# bind for multiple pollutants 
# pm_all_24h <- rbind(pm25_all_24h,pm10_all_24h) 
# arrange pollutants as per perference
# pm_all_24h$pollutant <- factor(pm_all_24h$pollutant, levels = c("PM2.5","PM10"))



# ABESAN #####################################
# group by and summarise events into bins
so2_all_24h_temp_tbl <- so2_all_24h %>%
  group_by(temprange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")



# barplot 
abe_so2_temp_pl <- ggplot(na.omit(filter(so2_all_24h_temp_tbl, site == "abesan")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_so2_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
so2_all_24h_rh_tbl <- so2_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_so2_rh_pl <- ggplot(na.omit(filter(so2_all_24h_rh_tbl, site == "abesan")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_so2_rh_pl

# PRECIPITATION
# group by and summarise events into bins
so2_all_24h_rain_tbl <- so2_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_so2_rain_pl <- ggplot(na.omit(filter(so2_all_24h_rain_tbl, site == "abesan")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_so2_rain_pl

# WIND SPEED
# group by and summarise events into bins
so2_all_24h_ws_tbl <- so2_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_so2_ws_pl <- ggplot(na.omit(filter(so2_all_24h_ws_tbl, site == "abesan")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_so2_ws_pl

abe_met_so2 <- ggarrange(abe_so2_temp_pl,abe_so2_rh_pl,abe_so2_rain_pl,abe_so2_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
abe_met_so2

abe_met_so2 <- annotate_figure(abe_met_so2, top = text_grob(bquote(Abesan~SO[2]~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="abe_met_so2.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_met_so2
# Close the pdf file
dev.off()

# IKORODU ####################################################################
# barplot 
iko_so2_temp_pl <- ggplot(na.omit(filter(so2_all_24h_temp_tbl, site == "ikorodu")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_so2_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
so2_all_24h_rh_tbl <- so2_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_so2_rh_pl <- ggplot(na.omit(filter(so2_all_24h_rh_tbl, site == "ikorodu")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_so2_rh_pl

# PRECIPITATION
# group by and summarise events into bins
so2_all_24h_rain_tbl <- so2_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_so2_rain_pl <- ggplot(na.omit(filter(so2_all_24h_rain_tbl, site == "ikorodu")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_so2_rain_pl

# WIND SPEED
# group by and summarise events into bins
so2_all_24h_ws_tbl <- so2_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_so2_ws_pl <- ggplot(na.omit(filter(so2_all_24h_ws_tbl, site == "ikorodu")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_so2_ws_pl

iko_met_so2 <- ggarrange(iko_so2_temp_pl,iko_so2_rh_pl,iko_so2_rain_pl,iko_so2_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
iko_met_so2

iko_met_so2 <- annotate_figure(iko_met_so2, top = text_grob(bquote(Ikorodu~SO[2]~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="iko_met_so2.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
iko_met_so2
# Close the pdf file
dev.off()

# JANKARA ####################################################################
# barplot 
jan_so2_temp_pl <- ggplot(na.omit(filter(so2_all_24h_temp_tbl, site == "jankara")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_so2_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
so2_all_24h_rh_tbl <- so2_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_so2_rh_pl <- ggplot(na.omit(filter(so2_all_24h_rh_tbl, site == "jankara")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_so2_rh_pl

# PRECIPITATION
# group by and summarise events into bins
so2_all_24h_rain_tbl <- so2_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_so2_rain_pl <- ggplot(na.omit(filter(so2_all_24h_rain_tbl, site == "jankara")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_so2_rain_pl

# WIND SPEED
# group by and summarise events into bins
so2_all_24h_ws_tbl <- so2_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_so2_ws_pl <- ggplot(na.omit(filter(so2_all_24h_ws_tbl, site == "jankara")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_so2_ws_pl

jan_met_so2 <- ggarrange(jan_so2_temp_pl,jan_so2_rh_pl,jan_so2_rain_pl,jan_so2_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
jan_met_so2

jan_met_so2 <- annotate_figure(jan_met_so2, top = text_grob(bquote(Jankara~SO2~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="jan_met_so2.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
jan_met_so2
# Close the pdf file
dev.off()

# Lasepa ####################################################################
# barplot 
las_so2_temp_pl <- ggplot(na.omit(filter(so2_all_24h_temp_tbl, site == "lasepa")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_so2_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
so2_all_24h_rh_tbl <- so2_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_so2_rh_pl <- ggplot(na.omit(filter(so2_all_24h_rh_tbl, site == "lasepa")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_so2_rh_pl

# PRECIPITATION
# group by and summarise events into bins
so2_all_24h_rain_tbl <- so2_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_so2_rain_pl <- ggplot(na.omit(filter(so2_all_24h_rain_tbl, site == "lasepa")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_so2_rain_pl

# WIND SPEED
# group by and summarise events into bins
so2_all_24h_ws_tbl <- so2_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_so2_ws_pl <- ggplot(na.omit(filter(so2_all_24h_ws_tbl, site == "lasepa")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_so2_ws_pl

las_met_so2 <- ggarrange(las_so2_temp_pl,las_so2_rh_pl,las_so2_rain_pl,las_so2_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
las_met_so2

las_met_so2 <- annotate_figure(las_met_so2, top = text_grob(bquote(LASEPA~SO2~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="las_met_so2.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_met_so2
# Close the pdf file
dev.off()


# NCF ####################################################################
# barplot 
ncf_so2_temp_pl <- ggplot(na.omit(filter(so2_all_24h_temp_tbl, site == "ncf")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.9,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_so2_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
so2_all_24h_rh_tbl <- so2_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_so2_rh_pl <- ggplot(na.omit(filter(so2_all_24h_rh_tbl, site == "ncf")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_so2_rh_pl

# PRECIPITATION
# group by and summarise events into bins
so2_all_24h_rain_tbl <- so2_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_so2_rain_pl <- ggplot(na.omit(filter(so2_all_24h_rain_tbl, site == "ncf")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_so2_rain_pl

# WIND SPEED
# group by and summarise events into bins
so2_all_24h_ws_tbl <- so2_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_so2_ws_pl <- ggplot(na.omit(filter(so2_all_24h_ws_tbl, site == "ncf")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_so2_ws_pl

ncf_met_so2 <- ggarrange(ncf_so2_temp_pl,ncf_so2_rh_pl,ncf_so2_rain_pl,ncf_so2_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
ncf_met_so2

ncf_met_so2 <- annotate_figure(ncf_met_so2, top = text_grob(bquote(NCF~SO[2]~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="ncf_met_so2.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
ncf_met_so2
# Close the pdf file
dev.off()

# UNILAG ####################################################################
# barplot 
uni_so2_temp_pl <- ggplot(na.omit(filter(so2_all_24h_temp_tbl, site == "unilag")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_so2_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
so2_all_24h_rh_tbl <- so2_all_24h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_so2_rh_pl <- ggplot(na.omit(filter(so2_all_24h_rh_tbl, site == "unilag")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_so2_rh_pl

# PRECIPITATION
# group by and summarise events into bins
so2_all_24h_rain_tbl <- so2_all_24h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_so2_rain_pl <- ggplot(na.omit(filter(so2_all_24h_rain_tbl, site == "unilag")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_so2_rain_pl

# WIND SPEED
# group by and summarise events into bins
so2_all_24h_ws_tbl <- so2_all_24h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_so2_ws_pl <- ggplot(na.omit(filter(so2_all_24h_ws_tbl, site == "unilag")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("SO2" = "grey18")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_so2_ws_pl

uni_met_so2 <- ggarrange(uni_so2_temp_pl,uni_so2_rh_pl,uni_so2_rain_pl,uni_so2_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
uni_met_so2

uni_met_so2 <- annotate_figure(uni_met_so2, top = text_grob(bquote(UNILAG~SO2~Exceedances~at~various~Meteorological~conditions~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="uni_met_so2.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
uni_met_so2
# Close the pdf file
dev.off()


































##########################################

##########################################
# 03 plots 1hr  #################
# expdir for O3 plots
met_plt_dir_o3 <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Met_Exceedances Plots/O3 plots"
dir.create(met_plt_dir_o3)
setwd(met_plt_dir_o3)



# filter o3 exceedances events
o3_1h <- filter(all_1h, o3 > 180)
no2_all_1h <- filter(all_1h, no2 > 188.1)
co_all_1h <- filter(all_1h, co > 10)
# add a pollutant column
o3_1h$pollutant <- "O3"
no2_all_1h$pollutant <- "NO2"
co_all_1h$pollutant <- "CO"

# bind for multiple pollutants 
o3_all_1h <- rbind(o3_1h,no2_all_1h,co_all_1h) 
# arrange pollutants as per perference
o3_all_1h$pollutant <- factor(o3_all_1h$pollutant, levels = c("NO2","CO","O3"))



# ABESAN #####################################
# group by and summarise events into bins
o3_all_1h_temp_tbl <- o3_all_1h %>%
  group_by(temprange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")



# barplot 
abe_o3_temp_pl <- ggplot(na.omit(filter(o3_all_1h_temp_tbl, site == "abesan")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_1h_rh_tbl <- o3_all_1h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_o3_rh_pl <- ggplot(na.omit(filter(o3_all_1h_rh_tbl, site == "abesan")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_1h_rain_tbl <- o3_all_1h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_o3_rain_pl <- ggplot(na.omit(filter(o3_all_1h_rain_tbl, site == "abesan")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_1h_ws_tbl <- o3_all_1h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_o3_ws_pl <- ggplot(na.omit(filter(o3_all_1h_ws_tbl, site == "abesan")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_ws_pl

abe_met_o3 <- ggarrange(abe_o3_temp_pl,abe_o3_rh_pl,abe_o3_rain_pl,abe_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
abe_met_o3

abe_met_o3 <- annotate_figure(abe_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
abe_met_o3 <- annotate_figure(abe_met_o3, top = text_grob(bquote(Abesan~Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="abe_met_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_met_o3
# Close the pdf file
dev.off()

# IKORODU ####################################################################
# barplot 
iko_o3_temp_pl <- ggplot(na.omit(filter(o3_all_1h_temp_tbl, site == "ikorodu")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_1h_rh_tbl <- o3_all_1h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_o3_rh_pl <- ggplot(na.omit(filter(o3_all_1h_rh_tbl, site == "ikorodu")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")

iko_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_1h_rain_tbl <- o3_all_1h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_o3_rain_pl <- ggplot(na.omit(filter(o3_all_1h_rain_tbl, site == "ikorodu")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_1h_ws_tbl <- o3_all_1h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_o3_ws_pl <- ggplot(na.omit(filter(o3_all_1h_ws_tbl, site == "ikorodu")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_o3_ws_pl

iko_met_o3 <- ggarrange(iko_o3_temp_pl,iko_o3_rh_pl,iko_o3_rain_pl,iko_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
iko_met_o3

iko_met_o3 <- annotate_figure(iko_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
iko_met_o3 <- annotate_figure(iko_met_o3, top = text_grob(bquote(Ikorodu~Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="iko_met_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
iko_met_o3
# Close the pdf file
dev.off()

# JANKARA ####################################################################
# barplot 
jan_o3_temp_pl <- ggplot(na.omit(filter(o3_all_1h_temp_tbl, site == "jankara")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_1h_rh_tbl <- o3_all_1h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_o3_rh_pl <- ggplot(na.omit(filter(o3_all_1h_rh_tbl, site == "jankara")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_1h_rain_tbl <- o3_all_1h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_o3_rain_pl <- ggplot(na.omit(filter(o3_all_1h_rain_tbl, site == "jankara")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_1h_ws_tbl <- o3_all_1h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_o3_ws_pl <- ggplot(na.omit(filter(o3_all_1h_ws_tbl, site == "jankara")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_ws_pl

jan_met_o3 <- ggarrange(jan_o3_temp_pl,jan_o3_rh_pl,jan_o3_rain_pl,jan_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
jan_met_o3

jan_met_o3 <- annotate_figure(jan_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
jan_met_o3 <- annotate_figure(jan_met_o3, top = text_grob(bquote(JANKARA~Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="jan_met_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
jan_met_o3
# Close the pdf file
dev.off()

# Lasepa ####################################################################
# barplot 
las_o3_temp_pl <- ggplot(na.omit(filter(o3_all_1h_temp_tbl, site == "lasepa")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_1h_rh_tbl <- o3_all_1h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_o3_rh_pl <- ggplot(na.omit(filter(o3_all_1h_rh_tbl, site == "lasepa")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_1h_rain_tbl <- o3_all_1h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_o3_rain_pl <- ggplot(na.omit(filter(o3_all_1h_rain_tbl, site == "lasepa")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_1h_ws_tbl <- o3_all_1h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_o3_ws_pl <- ggplot(na.omit(filter(o3_all_1h_ws_tbl, site == "lasepa")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_ws_pl

las_met_o3 <- ggarrange(las_o3_temp_pl,las_o3_rh_pl,las_o3_rain_pl,las_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
las_met_o3

las_met_o3 <- annotate_figure(las_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
las_met_o3 <- annotate_figure(las_met_o3, top = text_grob(bquote(LASEPA~Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="las_met_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_met_o3
# Close the pdf file
dev.off()


# NCF ####################################################################
# barplot 
ncf_o3_temp_pl <- ggplot(na.omit(filter(o3_all_1h_temp_tbl, site == "ncf")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_1h_rh_tbl <- o3_all_1h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_o3_rh_pl <- ggplot(na.omit(filter(o3_all_1h_rh_tbl, site == "ncf")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_1h_rain_tbl <- o3_all_1h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_o3_rain_pl <- ggplot(na.omit(filter(o3_all_1h_rain_tbl, site == "ncf")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_1h_ws_tbl <- o3_all_1h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_o3_ws_pl <- ggplot(na.omit(filter(o3_all_1h_ws_tbl, site == "ncf")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_ws_pl

ncf_met_o3 <- ggarrange(ncf_o3_temp_pl,ncf_o3_rh_pl,ncf_o3_rain_pl,ncf_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
ncf_met_o3

ncf_met_o3 <- annotate_figure(ncf_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
ncf_met_o3 <- annotate_figure(ncf_met_o3, top = text_grob(bquote(NCF~Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="ncf_met_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
ncf_met_o3
# Close the pdf file
dev.off()

# UNILAG ####################################################################
# barplot 
uni_o3_temp_pl <- ggplot(na.omit(filter(o3_all_1h_temp_tbl, site == "unilag")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_temp_pl

# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_1h_rh_tbl <- o3_all_1h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_o3_rh_pl <- ggplot(na.omit(filter(o3_all_1h_rh_tbl, site == "unilag")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_1h_rain_tbl <- o3_all_1h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_o3_rain_pl <- ggplot(na.omit(filter(o3_all_1h_rain_tbl, site == "unilag")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_1h_ws_tbl <- o3_all_1h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_o3_ws_pl <- ggplot(na.omit(filter(o3_all_1h_ws_tbl, site == "unilag")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_ws_pl

uni_met_o3 <- ggarrange(uni_o3_temp_pl,uni_o3_rh_pl,uni_o3_rain_pl,uni_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
uni_met_o3

uni_met_o3 <- annotate_figure(uni_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
uni_met_o3 <- annotate_figure(uni_met_o3, top = text_grob(bquote(UNILAG~Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="uni_met_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
uni_met_o3
# Close the pdf file
dev.off()







#########################################


##########################################


# 03 plots 8hr  #################
# expdir for O3 plots
met_plt_dir_o3 <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Met_Exceedances Plots/O3 plots"
dir.create(met_plt_dir_o3)
setwd(met_plt_dir_o3)



# filter o3 exceedances events
o3_8h <- filter(all_8h, o3 > 100)
# no2_all_8h <- filter(all_8h, no2 > 188.1)
co_all_8h <- filter(all_8h, co > 10.35)
# add a pollutant column
o3_8h$pollutant <- "O3"
# no2_all_8h$pollutant <- "NO2"
co_all_8h$pollutant <- "CO"

# bind for multiple pollutants 
o3_all_8h <- rbind(o3_8h,co_all_8h) 
# arrange pollutants as per perference
o3_all_8h$pollutant <- factor(o3_all_8h$pollutant, levels = c("CO","O3"))



# ABESAN #####################################
# group by and summarise events into bins
o3_all_8h_temp_tbl <- o3_all_8h %>%
  group_by(temprange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")



# barplot 
abe_o3_temp_pl <- ggplot(na.omit(filter(o3_all_8h_temp_tbl, site == "abesan")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_8h_rh_tbl <- o3_all_8h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_o3_rh_pl <- ggplot(na.omit(filter(o3_all_8h_rh_tbl, site == "abesan")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_8h_rain_tbl <- o3_all_8h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_o3_rain_pl <- ggplot(na.omit(filter(o3_all_8h_rain_tbl, site == "abesan")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_8h_ws_tbl <- o3_all_8h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
abe_o3_ws_pl <- ggplot(na.omit(filter(o3_all_8h_ws_tbl, site == "abesan")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
abe_o3_ws_pl

abe_met_o3 <- ggarrange(abe_o3_temp_pl,abe_o3_rh_pl,abe_o3_rain_pl,abe_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
abe_met_o3

abe_met_o3 <- annotate_figure(abe_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
abe_met_o3 <- annotate_figure(abe_met_o3, top = text_grob(bquote(Abesan~8-Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="abe_met_8h_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_met_o3
# Close the pdf file
dev.off()

# IKORODU ####################################################################
# barplot 
iko_o3_temp_pl <- ggplot(na.omit(filter(o3_all_8h_temp_tbl, site == "ikorodu")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_8h_rh_tbl <- o3_all_8h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_o3_rh_pl <- ggplot(na.omit(filter(o3_all_8h_rh_tbl, site == "ikorodu")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")

iko_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_8h_rain_tbl <- o3_all_8h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_o3_rain_pl <- ggplot(na.omit(filter(o3_all_8h_rain_tbl, site == "ikorodu")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_8h_ws_tbl <- o3_all_8h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
iko_o3_ws_pl <- ggplot(na.omit(filter(o3_all_8h_ws_tbl, site == "ikorodu")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "NO2" = "gray18","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
iko_o3_ws_pl

iko_met_o3 <- ggarrange(iko_o3_temp_pl,iko_o3_rh_pl,iko_o3_rain_pl,iko_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
iko_met_o3

iko_met_o3 <- annotate_figure(iko_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
iko_met_o3 <- annotate_figure(iko_met_o3, top = text_grob(bquote(Ikorodu~8-Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="iko_met_8h_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
iko_met_o3
# Close the pdf file
dev.off()

# JANKARA ####################################################################
# barplot 
jan_o3_temp_pl <- ggplot(na.omit(filter(o3_all_8h_temp_tbl, site == "jankara")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_8h_rh_tbl <- o3_all_8h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_o3_rh_pl <- ggplot(na.omit(filter(o3_all_8h_rh_tbl, site == "jankara")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_8h_rain_tbl <- o3_all_8h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_o3_rain_pl <- ggplot(na.omit(filter(o3_all_8h_rain_tbl, site == "jankara")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_8h_ws_tbl <- o3_all_8h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
jan_o3_ws_pl <- ggplot(na.omit(filter(o3_all_8h_ws_tbl, site == "jankara")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
jan_o3_ws_pl

jan_met_o3 <- ggarrange(jan_o3_temp_pl,jan_o3_rh_pl,jan_o3_rain_pl,jan_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
jan_met_o3

jan_met_o3 <- annotate_figure(jan_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
jan_met_o3 <- annotate_figure(jan_met_o3, top = text_grob(bquote(JANKARA~8-Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="jan_met_8h_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
jan_met_o3
# Close the pdf file
dev.off()

# Lasepa ####################################################################
# barplot 
las_o3_temp_pl <- ggplot(na.omit(filter(o3_all_8h_temp_tbl, site == "lasepa")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_8h_rh_tbl <- o3_all_8h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_o3_rh_pl <- ggplot(na.omit(filter(o3_all_8h_rh_tbl, site == "lasepa")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_8h_rain_tbl <- o3_all_8h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_o3_rain_pl <- ggplot(na.omit(filter(o3_all_8h_rain_tbl, site == "lasepa")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_8h_ws_tbl <- o3_all_8h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
las_o3_ws_pl <- ggplot(na.omit(filter(o3_all_8h_ws_tbl, site == "lasepa")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
las_o3_ws_pl

las_met_o3 <- ggarrange(las_o3_temp_pl,las_o3_rh_pl,las_o3_rain_pl,las_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
las_met_o3

las_met_o3 <- annotate_figure(las_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
las_met_o3 <- annotate_figure(las_met_o3, top = text_grob(bquote(LASEPA~8-Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="las_met_8h_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_met_o3
# Close the pdf file
dev.off()


# NCF ####################################################################
# barplot 
ncf_o3_temp_pl <- ggplot(na.omit(filter(o3_all_8h_temp_tbl, site == "ncf")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_temp_pl
# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_8h_rh_tbl <- o3_all_8h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_o3_rh_pl <- ggplot(na.omit(filter(o3_all_8h_rh_tbl, site == "ncf")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_8h_rain_tbl <- o3_all_8h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_o3_rain_pl <- ggplot(na.omit(filter(o3_all_8h_rain_tbl, site == "ncf")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_8h_ws_tbl <- o3_all_8h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
ncf_o3_ws_pl <- ggplot(na.omit(filter(o3_all_8h_ws_tbl, site == "ncf")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate","CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
ncf_o3_ws_pl

ncf_met_o3 <- ggarrange(ncf_o3_temp_pl,ncf_o3_rh_pl,ncf_o3_rain_pl,ncf_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
ncf_met_o3

ncf_met_o3 <- annotate_figure(ncf_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
ncf_met_o3 <- annotate_figure(ncf_met_o3, top = text_grob(bquote(NCF~8-Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="ncf_met_8h_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
ncf_met_o3
# Close the pdf file
dev.off()

# UNILAG ####################################################################
# barplot 
uni_o3_temp_pl <- ggplot(na.omit(filter(o3_all_8h_temp_tbl, site == "unilag")), aes(x=temprange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Temperature range (\u00B0C)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",legend.key = element_rect(size = 3),
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_temp_pl

# RELATIVE HUMIDITY
# group by and summarise events into bins
o3_all_8h_rh_tbl <- o3_all_8h %>%
  group_by(rhrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_o3_rh_pl <- ggplot(na.omit(filter(o3_all_8h_rh_tbl, site == "unilag")), aes(x=rhrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Range of Relative Humidity (%)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_rh_pl

# PRECIPITATION
# group by and summarise events into bins
o3_all_8h_rain_tbl <- o3_all_8h %>%
  group_by(rainrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_o3_rain_pl <- ggplot(na.omit(filter(o3_all_8h_rain_tbl, site == "unilag")), aes(x=rainrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Precipitation (mm)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.8,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_rain_pl

# WIND SPEED
# group by and summarise events into bins
o3_all_8h_ws_tbl <- o3_all_8h %>%
  group_by(wsrange,pollutant, site) %>%
  dplyr::summarise(counts = n(),.groups =  "keep")

# barplot 
uni_o3_ws_pl <- ggplot(na.omit(filter(o3_all_8h_ws_tbl, site == "unilag")), aes(x=wsrange,y = counts, fill = pollutant)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  ylab("Day Count") +
  xlab("Wind speed range (m/sec)") +
  scale_fill_manual("legend", values = c("O3" = "chocolate", "CO" = "darkgrey")) +
  theme_bw() +
  theme(legend.position = c(0.18,0.9),legend.title = element_blank(), legend.text = element_text(size = 10),legend.direction = "horizontal",
        legend.background = element_rect(linetype = "solid", colour = "black")) +
  ggtitle(label = "")
uni_o3_ws_pl

uni_met_o3 <- ggarrange(uni_o3_temp_pl,uni_o3_rh_pl,uni_o3_rain_pl,uni_o3_ws_pl,
                        labels = c("(a)","(b)","(c)","(d)"),
                        ncol = 2,nrow = 2)
uni_met_o3

uni_met_o3 <- annotate_figure(uni_met_o3, top = text_grob(bquote(from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
uni_met_o3 <- annotate_figure(uni_met_o3, top = text_grob(bquote(UNILAG~8-Hourly~O[3]~CO~NO[2]~Exceedances~at~various~Meteorological~conditions), color = "black", face = "bold", size = 18))


metpltwidth <- 8000
metpltheight <- 5000
# Open a tiff file no2
jpeg(file="uni_met_8h_o3.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
uni_met_o3
# Close the pdf file
dev.off()







#########################################


#####pm-met regression tables ##############

# 
# # define function to extract regression equation
# 
# regEq <- function(lmObj, dig) {
#   gsub(":", "*", 
#        paste0(
#          names(lmObj$model)[1]," = ",
#          paste0(
#            c(round(lmObj$coef[1], dig), round(sign(lmObj$coef[-1])*lmObj$coef[-1], dig)),
#            c("", rep("*", length(lmObj$coef)-1)),
#            paste0(c("", names(lmObj$coef)[-1]), c(ifelse(sign(lmObj$coef)[-1]==1," + "," - "), "")),
#            collapse=""
#          )
#        )
#   )
# }
# 
# 
# names(abe_5m)
# pmlist <- c(9,10)
# metlist <- names(abe_5m)[15:18]
# 
# 
# abepm25_mdl <- lapply(metlist,function(x){
#   lm(substitute(abepm25 ~ i, list(i = as.name(x))), data = abe_5m)
# }) 
# 
# summary(abepm25_mdl[[4]])[[8]]
# 
# abepm10_mdl <- lapply(metlist,function(x){
#   lm(substitute(abepm10 ~ i, list(i = as.name(x))), data = abe_5m)
# }) 
# 
# 
# ############################################# DEPRECATED
# extractfun <- function (x){
#   summlist <- list()
#   
#   for (j in 1:4){
#     dat <- c(`Regression Equation` = regEq(x[[j]]),
#              `R2`= round(summary(x[[j]])[[8]] * 100,2)
#     )
#     summlist[[j]] <- dat
#   }
#   
#   final <- do.call(rbind,summlist)
#   return(final)
# }
# 
# extractfun(abepm25_mdl)
# ####################################################
# 
# 

















