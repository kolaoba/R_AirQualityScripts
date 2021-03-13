library(tidyverse);library(plyr);library(data.table)
library(openair);library(sqldf);library(ggplot2);library(dplyr)
library(openxlsx);library(readxl);library(gtable);library(tidyr)

# import zephyr data ##########################################################

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

# ikorodu data after 

# bind each site for all six months
abe_bind <- rbind(augabe,sepabe,octabe,novabe,decabe,janabe)
iko_bind <- rbind(augiko,sepiko,octiko,noviko,deciko,janiko)
jan_bind <- rbind(augjan,sepjan,octjan,novjan,decjan,janjan)
las_bind <- rbind(auglas,seplas,octlas,novlas,declas,janlas)
ncf_bind <- rbind(augncf,sepncf,octncf,novncf,decncf,janncf)
uni_bind <- rbind(auguni,sepuni,octuni,novuni,decuni,januni)

aq_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(abe_bind,iko_bind,jan_bind,las_bind,ncf_bind,uni_bind))

summary(aq_merge)


# import ARA data ##############################################


abe_colnames_ara <- c("date","abepm25_ara","abepm10_ara","abesite_ara","abelat_ara","abelon_ara")
iko_colnames_ara <- c("date","ikopm25_ara","ikopm10_ara","ikosite_ara","ikolat_ara","ikolon_ara")
jan_colnames_ara <- c("date","janpm25_ara","janpm10_ara","jansite_ara","janlat_ara","janlon_ara")
las_colnames_ara <- c("date","laspm25_ara","laspm10_ara","lassite_ara","laslat_ara","laslon_ara")
ncf_colnames_ara <- c("date","ncfpm25_ara","ncfpm10_ara","ncfsite_ara","ncflat_ara","ncflon_ara")
uni_colnames_ara <- c("date","unipm25_ara","unipm10_ara","unisite_ara","unilat_ara","unilon_ara")

#import aug 5min
ara_aug5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/August Database/AQ_ARA_PM_5min_August_QC.xlsx"
excel_sheets(ara_aug5minfile)[1:6]
ara_augabe <- read_xlsx(ara_aug5minfile,sheet = excel_sheets(ara_aug5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_ara, skip = 1)
ara_augiko <- read_xlsx(ara_aug5minfile,sheet = excel_sheets(ara_aug5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_ara, skip = 1)
ara_augjan <- read_xlsx(ara_aug5minfile,sheet = excel_sheets(ara_aug5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_ara, skip = 1)
ara_auglas <- read_xlsx(ara_aug5minfile,sheet = excel_sheets(ara_aug5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_ara, skip = 1)
ara_augncf <- read_xlsx(ara_aug5minfile,sheet = excel_sheets(ara_aug5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_ara, skip = 1)
ara_auguni <- read_xlsx(ara_aug5minfile,sheet = excel_sheets(ara_aug5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_ara, skip = 1)

#import sep 5min
ara_sep5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/September Database/AQ_ARA_PM_5min_September_QC.xlsx"
excel_sheets(ara_sep5minfile)[1:6]
ara_sepabe <- read_xlsx(ara_sep5minfile,sheet = excel_sheets(ara_sep5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_ara, skip = 1)
ara_sepiko <- read_xlsx(ara_sep5minfile,sheet = excel_sheets(ara_sep5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_ara, skip = 1)
ara_sepjan <- read_xlsx(ara_sep5minfile,sheet = excel_sheets(ara_sep5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_ara, skip = 1)
ara_seplas <- read_xlsx(ara_sep5minfile,sheet = excel_sheets(ara_sep5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_ara, skip = 1)
ara_sepncf <- read_xlsx(ara_sep5minfile,sheet = excel_sheets(ara_sep5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_ara, skip = 1)
ara_sepuni <- read_xlsx(ara_sep5minfile,sheet = excel_sheets(ara_sep5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_ara, skip = 1)

#import oct 5min
ara_oct5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/October Database/AQ_ARA_PM_5min_October_QC.xlsx"
excel_sheets(ara_oct5minfile)[1:6]
ara_octabe <- read_xlsx(ara_oct5minfile,sheet = excel_sheets(ara_oct5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_ara, skip = 1)
ara_octiko <- read_xlsx(ara_oct5minfile,sheet = excel_sheets(ara_oct5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_ara, skip = 1)
ara_octjan <- read_xlsx(ara_oct5minfile,sheet = excel_sheets(ara_oct5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_ara, skip = 1)
ara_octlas <- read_xlsx(ara_oct5minfile,sheet = excel_sheets(ara_oct5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_ara, skip = 1)
ara_octncf <- read_xlsx(ara_oct5minfile,sheet = excel_sheets(ara_oct5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_ara, skip = 1)
ara_octuni <- read_xlsx(ara_oct5minfile,sheet = excel_sheets(ara_oct5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_ara, skip = 1)

#import nov 5min
ara_nov5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/November Database/AQ_ARA_PM_5min_November_QC.xlsx"
excel_sheets(ara_nov5minfile)[1:6]
ara_novabe <- read_xlsx(ara_nov5minfile,sheet = excel_sheets(ara_nov5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_ara, skip = 1)
ara_noviko <- read_xlsx(ara_nov5minfile,sheet = excel_sheets(ara_nov5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_ara, skip = 1)
ara_novjan <- read_xlsx(ara_nov5minfile,sheet = excel_sheets(ara_nov5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_ara, skip = 1)
ara_novlas <- read_xlsx(ara_nov5minfile,sheet = excel_sheets(ara_nov5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_ara, skip = 1)
ara_novncf <- read_xlsx(ara_nov5minfile,sheet = excel_sheets(ara_nov5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_ara, skip = 1)
ara_novuni <- read_xlsx(ara_nov5minfile,sheet = excel_sheets(ara_nov5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_ara, skip = 1)

#import dec 5min
ara_dec5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/December Database/AQ_ARA_PM_5min_December_QC.xlsx"
excel_sheets(ara_dec5minfile)[1:6]
ara_decabe <- read_xlsx(ara_dec5minfile,sheet = excel_sheets(ara_dec5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_ara, skip = 1)
ara_deciko <- read_xlsx(ara_dec5minfile,sheet = excel_sheets(ara_dec5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_ara, skip = 1)
ara_decjan <- read_xlsx(ara_dec5minfile,sheet = excel_sheets(ara_dec5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_ara, skip = 1)
ara_declas <- read_xlsx(ara_dec5minfile,sheet = excel_sheets(ara_dec5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_ara, skip = 1)
ara_decncf <- read_xlsx(ara_dec5minfile,sheet = excel_sheets(ara_dec5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_ara, skip = 1)
ara_decuni <- read_xlsx(ara_dec5minfile,sheet = excel_sheets(ara_dec5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_ara, skip = 1)

#import jan 5min
ara_jan5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/January Database/AQ_ARA_PM_5min_January_QC.xlsx"
excel_sheets(ara_jan5minfile)[1:6]
ara_janabe <- read_xlsx(ara_jan5minfile,sheet = excel_sheets(ara_jan5minfile)[1], na = c("NA","-999"),guess_max = 10000,col_names = abe_colnames_ara, skip = 1)
ara_janiko <- read_xlsx(ara_jan5minfile,sheet = excel_sheets(ara_jan5minfile)[2], na = c("NA","-999"),guess_max = 10000,col_names = iko_colnames_ara, skip = 1)
ara_janjan <- read_xlsx(ara_jan5minfile,sheet = excel_sheets(ara_jan5minfile)[3], na = c("NA","-999"),guess_max = 10000,col_names = jan_colnames_ara, skip = 1)
ara_janlas <- read_xlsx(ara_jan5minfile,sheet = excel_sheets(ara_jan5minfile)[4], na = c("NA","-999"),guess_max = 10000,col_names = las_colnames_ara, skip = 1)
ara_janncf <- read_xlsx(ara_jan5minfile,sheet = excel_sheets(ara_jan5minfile)[5], na = c("NA","-999"),guess_max = 10000,col_names = ncf_colnames_ara, skip = 1)
ara_januni <- read_xlsx(ara_jan5minfile,sheet = excel_sheets(ara_jan5minfile)[6], na = c("NA","-999"),guess_max = 10000,col_names = uni_colnames_ara, skip = 1)

# ikorodu data after 

# bind each site for all six months
ara_abe_bind <- rbind(ara_augabe,ara_sepabe,ara_octabe,ara_novabe,ara_decabe,ara_janabe)
ara_iko_bind <- rbind(ara_augiko,ara_sepiko,ara_octiko,ara_noviko,ara_deciko,ara_janiko)
ara_jan_bind <- rbind(ara_augjan,ara_sepjan,ara_octjan,ara_novjan,ara_decjan,ara_janjan)
ara_las_bind <- rbind(ara_auglas,ara_seplas,ara_octlas,ara_novlas,ara_declas,ara_janlas)
ara_ncf_bind <- rbind(ara_augncf,ara_sepncf,ara_octncf,ara_novncf,ara_decncf,ara_janncf)
ara_uni_bind <- rbind(ara_auguni,ara_sepuni,ara_octuni,ara_novuni,ara_decuni,ara_januni)

ara_aq_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(ara_abe_bind,ara_iko_bind,ara_jan_bind,ara_las_bind,ara_ncf_bind,ara_uni_bind))

summary(ara_aq_merge)


zephyrpm <- c("date","abepm1","abepm25","abepm10","ikopm1","ikopm25","ikopm10",
                     "janpm1","janpm25","janpm10","laspm1","laspm25","laspm10",
                     "ncfpm1","ncfpm25","ncfpm10","unipm1","unipm25","unipm10")
names(ara_aq_merge)

arapm <- c("date","abepm25_ara","abepm10_ara","ikopm25_ara","ikopm10_ara","janpm25_ara","janpm10_ara",
                  "laspm25_ara","laspm10_ara","ncfpm25_ara","ncfpm10_ara","unipm25_ara","unipm10_ara")


aq_zephyr <- select(aq_merge, all_of(zephyrpm))
aq_ara <- select(ara_aq_merge,all_of(arapm))

aq5min <- merge(aq_zephyr,aq_ara, by = "date", all = TRUE)



#import aug grav
grav_aug5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/August Database/August_PM_Filter_Data.xlsx"
excel_sheets(grav_aug5minfile)[1:6]
grav_augabev1 <- read_xlsx(grav_aug5minfile,sheet = excel_sheets(grav_aug5minfile)[1], na = c("NA","-999","-"),guess_max = 10000, skip = 1)

#import sep grav
grav_sep5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/September Database/September_PM_Filter_Data.xlsx"
excel_sheets(grav_sep5minfile)[1:6]
grav_sepabev1 <- read_xlsx(grav_sep5minfile,sheet = excel_sheets(grav_sep5minfile)[1], na = c("NA","-999","-"),guess_max = 10000, skip = 1)

#import oct grav
grav_oct5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/October Database/October_PM_Filter_Data.xlsx"
excel_sheets(grav_oct5minfile)[1:6]
grav_octabev1 <- read_xlsx(grav_oct5minfile,sheet = excel_sheets(grav_oct5minfile)[1], na = c("NA","-999","-"),guess_max = 10000, skip = 1)

#import nov grav
grav_nov5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/November Database/November_PM_Filter_Data.xlsx"
excel_sheets(grav_nov5minfile)[1:6]
grav_novabev1 <- read_xlsx(grav_nov5minfile,sheet = excel_sheets(grav_nov5minfile)[1], na = c("NA","-999","-"),guess_max = 10000, skip = 1)

#import dec grav
grav_dec5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/December Database/December_PM_Filter_Data.xlsx"
excel_sheets(grav_dec5minfile)[1:6]
grav_decabev1 <- read_xlsx(grav_dec5minfile,sheet = excel_sheets(grav_dec5minfile)[1], na = c("NA","-999","-"),guess_max = 10000, skip = 1)

#import jan grav
grav_jan5minfile <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/January Database/January_PM_Filter_Data.xlsx"
excel_sheets(grav_jan5minfile)[1:6]
grav_janabev1 <- read_xlsx(grav_jan5minfile,sheet = excel_sheets(grav_jan5minfile)[1], na = c("NA","-999","-"),guess_max = 10000, skip = 1)


#format grav data and transform to appropriate form
grav_pmv1 <- bind_rows(grav_augabev1,grav_sepabev1,grav_octabev1,grav_novabev1,grav_decabev1,grav_janabev1)
grav_pmv1
grav_pmv1$newcol <- paste(grav_pmv1$Location,grav_pmv1$`Cyclone Particle Size`,sep = ".")
grav_pmv1
# head(grav_pmv1)
# names(grav_pmv1)

#filter the grav data
grav_pmv1 <- subset(grav_pmv1, grav_pmv1$`Filter Type` != "F")
grav_pm <- select(grav_pmv1,c("Sampling Date", "PM Conc (ug/m3)", "newcol"))

# pivot the grav data
grav_pm <- grav_pm %>%
  pivot_wider(names_from = c("newcol"), values_from = "PM Conc (ug/m3)")
grav_pm

grav_pm$date <- as.POSIXct(grav_pm$`Sampling Date`, tz = "GMT", "%Y-%m-%d")

# averaging the data

aq1_day <- timeAverage(aq5min, avg.time = "1 day", statistic = "mean", start.date = as.POSIXct("2020-08-01",tz = "GMT"), end.date = as.POSIXct("2021-02-01", tz = "GMT"))
aq1_mnth <- timeAverage(aq5min, avg.time = "1 month", statistic = "mean", start.date = as.POSIXct("2020-08-01",tz = "GMT"))
grav_pm_mnth <- timeAverage(grav_pm, avg.time = "1 month", statistic = 'mean', start.date = as.POSIXct("2020-08-01",tz = "GMT"))

allpm_mnth <- merge(aq1_mnth, grav_pm_mnth, by = "date")
allpm_day <- merge(aq1_day, grav_pm, by = "date")
summary(allpm_mnth)
nrow(allpm_mnth)
names(allpm_mnth)


allpm_day["WHOPM10"] <- 50
allpm_day["WHOPM2.5"] <- 25
allpm_day["USEPA_NGNPM10"] <- 150
allpm_day["USEPAPM25"] <- 35



colocationStart1 <- as.POSIXct('2020-10-08 00:00', tz = 'GMT')
colocationStart2 <- as.POSIXct('2021-01-15 00:00', tz = 'GMT')
colocationEnd1 <- as.POSIXct('2020-10-30 00:00', tz = 'GMT')
colocationEnd2 <- as.POSIXct('2021-01-23 06:00', tz = 'GMT')



polnames <- c("Zephyr.PM2.5","Zephyr.PM10","ARA.PM2.5","ARA.PM10","Grav.PM2.5","Grav.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5")
polnames1 <- c("Zephyr.PM2.5","Zephyr.PM10","ARA.PM2.5","ARA.PM10","Grav.PM2.5","Grav.PM10")
plotcols <- c("green","blue","purple","cyan","deeppink","black","red3","red3","gray", "gray")
plotcols1 <- c("green","blue","purple","cyan","deeppink","black")
ltypes <- c(1,1,1,1,1,1,2,2,2,2)
ltypes1 <- c(1,1,1,1,1,1)
lpch <- c(1,1,9,9,3,3,NA,NA,NA,NA)
lpch1 <- c(1,1,9,9,3,3)
keycols <- 5

abe_pm_plot_mnth <- timePlot(allpm_mnth, pollutant = c("abepm25", "abepm10", "abepm25_ara", "abepm10_ara", "Abesan.PM2.5","Abesan.PM10"), group = TRUE,
                        name.pol = polnames1, key.columns = 3, cols = plotcols1, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes1, pch = lpch1,
                        main = "Abesan PM Monthly Averages")

abe_pm_plot_day <- timePlot(allpm_day, pollutant = c("abepm25", "abepm10", "abepm25_ara", "abepm10_ara", "Abesan.PM2.5","Abesan.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5"),
                            group = TRUE, name.pol = polnames, key.columns = keycols, cols = plotcols, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes, pch = lpch,
                        main = "Abesan PM Daily Averages",log = TRUE,
                        # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                        ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))


iko_pm_plot_mnth <- timePlot(allpm_mnth, pollutant = c("ikopm25", "ikopm10", "ikopm25_ara", "ikopm10_ara", "Ikorodu.PM2.5","Ikorodu.PM10"), group = TRUE,
                             name.pol = polnames1, key.columns = 3, cols = plotcols1, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes1, pch = lpch1,
                             main = "Ikorodu PM Monthly Averages")

iko_pm_plot_day <- timePlot(allpm_day, pollutant = c("ikopm25", "ikopm10", "ikopm25_ara", "ikopm10_ara", "Ikorodu.PM2.5","Ikorodu.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5"),
                            group = TRUE, name.pol = polnames, key.columns = keycols, cols = plotcols, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes, pch = lpch,
                            main = "Ikorodu PM Daily Averages",log = TRUE,
                            # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                            ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

jan_pm_plot_mnth <- timePlot(allpm_mnth, pollutant = c("janpm25", "janpm10", "janpm25_ara", "janpm10_ara", "Jankara.PM2.5","Jankara.PM10"), group = TRUE,
                             name.pol = polnames1, key.columns = 3, cols = plotcols1, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes1, pch = lpch1,
                             main = "Jankara PM Monthly Averages")

jan_pm_plot_day <- timePlot(allpm_day, pollutant = c("janpm25", "janpm10", "janpm25_ara", "janpm10_ara", "Jankara.PM2.5","Jankara.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5"),
                            group = TRUE, name.pol = polnames, key.columns = keycols, cols = plotcols, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes, pch = lpch,
                            main = "Jankara PM Daily Averages",log = TRUE,
                            # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                            ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

las_pm_plot_mnth <- timePlot(allpm_mnth, pollutant = c("laspm25", "laspm10", "laspm25_ara", "laspm10_ara", "Lasepa.PM2.5","Lasepa.PM10"), group = TRUE,
                             name.pol = polnames1, key.columns = 3, cols = plotcols1, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes1, pch = lpch1,
                             main = "LASEPA PM Monthly Averages")

las_pm_plot_day <- timePlot(allpm_day, pollutant = c("laspm25", "laspm10", "laspm25_ara", "laspm10_ara", "Lasepa.PM2.5","Lasepa.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5"),
                            group = TRUE, name.pol = polnames, key.columns = keycols, cols = plotcols, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes, pch = lpch,
                            main = "LASEPA PM Daily Averages",log = TRUE,
                            # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                            ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

ncf_pm_plot_mnth <- timePlot(allpm_mnth, pollutant = c("ncfpm25", "ncfpm10", "ncfpm25_ara", "ncfpm10_ara", "Ncf.PM2.5","Ncf.PM10"), group = TRUE,
                             name.pol = polnames1, key.columns = 3, cols = plotcols1, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes1, pch = lpch1,
                             main = "NCF PM Monthly Averages")

ncf_pm_plot_day <- timePlot(allpm_day, pollutant = c("ncfpm25", "ncfpm10", "ncfpm25_ara", "ncfpm10_ara", "Ncf.PM2.5","Ncf.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5"),
                            group = TRUE, name.pol = polnames, key.columns = keycols, cols = plotcols, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes, pch = lpch,
                            main = "NCF PM Daily Averages",log = TRUE,
                            # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                            ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

uni_pm_plot_mnth <- timePlot(allpm_mnth, pollutant = c("unipm25", "unipm10", "unipm25_ara", "unipm10_ara", "Unilag.PM2.5","Unilag.PM10"), group = TRUE,
                             name.pol = polnames1, key.columns = 3, cols = plotcols1, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes1, pch = lpch1,
                             main = "UNILAG PM Monthly Averages")

uni_pm_plot_day <- timePlot(allpm_day, pollutant = c("unipm25", "unipm10", "unipm25_ara", "unipm10_ara", "Unilag.PM2.5","Unilag.PM10","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5"),
                            group = TRUE, name.pol = polnames, key.columns = keycols, cols = plotcols, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes, pch = lpch,
                            main = "UNILAG PM Daily Averages",log = TRUE,
                            # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                            ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))


pltexpdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/PM plots"

setwd(pltexpdir)

# Open a tiff file
jpeg(file="abe_pm_mnth.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_pm_plot_mnth$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="abe_pm_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_pm_plot_day$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="iko_pm_mnth.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
iko_pm_plot_mnth$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="iko_pm_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
iko_pm_plot_day$plot
# Close the pdf file
dev.off()


# Open a tiff file
jpeg(file="jan_pm_mnth.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
jan_pm_plot_mnth$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="jan_pm_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
jan_pm_plot_day$plot
# Close the pdf file
dev.off()


# Open a tiff file
jpeg(file="las_pm_mnth.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_pm_plot_mnth$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="las_pm_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
las_pm_plot_day$plot
# Close the pdf file
dev.off()


# Open a tiff file
jpeg(file="ncf_pm_mnth.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
ncf_pm_plot_mnth$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="ncf_pm_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
ncf_pm_plot_day$plot
# Close the pdf file
dev.off()


# Open a tiff file
jpeg(file="uni_pm_mnth.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
uni_pm_plot_mnth$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="uni_pm_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
uni_pm_plot_day$plot
# Close the pdf file
dev.off()


polnames_sites <- c("Abesan","Ikorodu","Jankara","Lasepa","Ncf","Unilag","USEPA_NGNPM10","USEPAPM25","WHOPM10","WHOPM2.5")
polnames_sites <- c("Abesan","Ikorodu","Jankara","Lasepa","Ncf","Unilag","USEPAPM25","WHOPM2.5")
plotcols_sites <- c("green","blue","purple","cyan","deeppink","black","red3", "gray")
ltypes_sites <- c(1,1,1,1,1,1,2,2)
lpch_sites <- c(1,1,9,9,3,3,NA,NA)
keycols <- 4

all_pm25_plot_day <- timePlot(allpm_day, pollutant = c("abepm25", "ikopm25", "janpm25", "laspm25", "ncfpm25","unipm25","USEPAPM25","WHOPM2.5"),log = TRUE,
                            group = TRUE, name.pol = polnames_sites, key.columns = keycols, cols = plotcols_sites, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes_sites, pch = lpch_sites,
                            main = "PM2.5 (24-hour Averages)",
                            # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                            ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

all_pm10_plot_day <- timePlot(allpm_day, pollutant = c("abepm10", "ikopm10", "janpm10", "laspm10", "ncfpm10","unipm10","USEPA_NGNPM10","WHOPM10"), log  = TRUE,
                              group = TRUE, name.pol = c("Abesan","Ikorodu","Jankara","Lasepa","Ncf","Unilag","USEPAPM10","WHOPM10"), key.columns = keycols,
                              cols = plotcols_sites, ylab = "PM Mass Concentrations (ugm-3)", lty = ltypes_sites, pch = lpch_sites,
                              main = "PM10 (24-hour Averages)",
                              # ref.y = list(h = c(150, 35 ,50 ,25), lty = c(2, 2,2,2), lwd=c(2,2,2,2), col = c("red3","red3","gray", "gray")),
                              ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))



# Open a tiff file
jpeg(file="allsites_pm25_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
all_pm25_plot_day$plot
# Close the pdf file
dev.off()

# Open a tiff file
jpeg(file="allsites_pm10_day.jpeg", res=700, width=10000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
all_pm10_plot_day$plot
# Close the pdf file
dev.off()








