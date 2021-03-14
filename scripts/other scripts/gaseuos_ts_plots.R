library(tidyverse);library(plyr);library(data.table)
library(openair);library(sqldf);library(ggplot2);library(dplyr)
library(openxlsx);library(readxl);library(gtable)

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

colocationStart1 <- as.POSIXct('2020-10-08 00:00', tz = 'GMT')
colocationStart2 <- as.POSIXct('2021-01-15 00:00', tz = 'GMT')
colocationEnd1 <- as.POSIXct('2020-10-30 00:00', tz = 'GMT')
colocationEnd2 <- as.POSIXct('2021-01-23 06:00', tz = 'GMT')


expdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Gaseous timeseries plots"

setwd(expdir)

keycols <- 6
fntsize <- 15
# CO plots
co_1hts=timePlot(aq_merge,pollutant=c("abeco","ikoco","janco","lasco","ncfco","unico"), fill = TRUE,group = TRUE, ylim=c(0,45), avg.time = "1 hour", statistic = "mean",
                      main = "CO (1-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                      ylab="CO (mg/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                      key.position=NA, name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                      ref.y = list(h = c(40, 10), lty = c(2, 2), lwd=c(2,2), col = c("red3", "gray")),
                      ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

co_8hts=timePlot(aq_merge,pollutant=c("abeco","ikoco","janco","lasco","ncfco","unico"), fill = TRUE,group = TRUE, ylim=c(0,15), avg.time = "8 hour", statistic = "mean",
                 main = "CO (8-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                 ylab="CO (mg/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                 key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                 ref.y = list(h = c(10, 5), lty = c(2, 2), lwd=c(2,2), col = c("red3", "gray")),
                 ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

# Open a tiff file
jpeg(file="co_1h_8hts.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(co_1hts, position = c(0, 0.5, 1, 1), more = TRUE)
print(co_8hts, position = c(0, 0, 1, 0.5))
# Close the pdf file
dev.off()

o3_1hts=timePlot(aq_merge,pollutant=c("abeo3","ikoo3","jano3","laso3","ncfo3","unio3"), fill = TRUE,group = TRUE, ylim=c(0,270), avg.time = "1 hour", statistic = "mean",
                 main = "O3 (1-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                 ylab="O3 (ug/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                 key.position=NA, name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                 ref.y = list(h = c(180), lty = c(2), lwd=c(2), col = c( "gray")),
                 ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

o3_8hts=timePlot(aq_merge,pollutant=c("abeo3","ikoo3","jano3","laso3","ncfo3","unio3"), fill = TRUE,group = TRUE, ylim=c(0,250), avg.time = "8 hour", statistic = "mean",
                 main = "O3 (8-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                 ylab="O3 (ug/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                 key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                 ref.y = list(h = c(137.4, 100), lty = c(2, 2), lwd=c(2,2), col = c("red3", "gray")),
                 ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

# Open a tiff file
jpeg(file="o3_1h_8hts.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(o3_1hts, position = c(0, 0.5, 1, 1), more = TRUE)
print(o3_8hts, position = c(0, 0, 1, 0.5))
# Close the pdf file
dev.off()


no2_1hts=timePlot(aq_merge,pollutant=c("abeno2","ikono2","janno2","lasno2","ncfno2","unino2"), fill = TRUE,group = TRUE, ylim=c(0,250), avg.time = "1 hour", statistic = "mean",
                 main = "NO2 (1-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                 ylab="NO2 (ug/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                 key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                 ref.y = list(h = c(188.1, 200), lty = c(2, 2), lwd=c(2,2), col = c("red3", "gray")),
                 ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))


# Open a tiff file
jpeg(file="no2_1hts.jpeg", res=700, width=8000, height=2250, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
no2_1hts$plot
# Close the pdf file
dev.off()




so2_1hts=timePlot(aq_merge,pollutant=c("abeso2","ikoso2","janso2","lasso2","ncfso2","uniso2"), fill = TRUE,group = TRUE, ylim=c(0,400), avg.time = "1 hour", statistic = "mean",
                  main = "SO2 (1-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                  ylab="SO2 (ug/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                  key.position=NA, name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                  ref.y = list(h = c(196.5, 350), lty = c(2, 2), lwd=c(2,2), col = c("red3", "gray")),
                  ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

so2_24hts=timePlot(aq_merge,pollutant=c("abeso2","ikoso2","janso2","lasso2","ncfso2","uniso2"), fill = TRUE,group = TRUE, ylim=c(0,400), avg.time = "1 day", statistic = "mean",
                  main = "SO2 (24-hour averages)", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                  ylab="SO2 (ug/m3)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE, 
                  key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols,
                  ref.y = list(h = c(120), lty = c(2), lwd=c(2), col = c("gray")),
                  ref.x = list(v = c(colocationStart1,colocationEnd1,colocationStart2,colocationEnd2), lty = c(4,4), lwd = c(3,3), col = c('pink3','pink3')))

# Open a tiff file
jpeg(file="so2_1h_24hts.jpeg", res=700, width=8000, height=4000, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(so2_1hts, position = c(0, 0.5, 1, 1), more = TRUE)
print(so2_24hts, position = c(0, 0, 1, 0.5))
# Close the pdf file
dev.off()







