

# import met data ##############################################

"DateTime	pressure_mmHg	Temp_C	rh_percent	wb_temp	ws_m_s_1	wd_degree	rain_mm	latitude	longitude	site"

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

# ikorodu data after 

# bind each site for all six months
met_abe_bind <- rbind(met_augabe,met_sepabe,met_octabe,met_novabe,met_decabe,met_janabe)
met_iko_bind <- rbind(met_augiko,met_sepiko,met_octiko,met_noviko,met_deciko,met_janiko)
met_jan_bind <- rbind(met_augjan,met_sepjan,met_octjan,met_novjan,met_decjan,met_janjan)
met_las_bind <- rbind(met_auglas,met_seplas,met_octlas,met_novlas,met_declas,met_janlas)
met_ncf_bind <- rbind(met_augncf,met_sepncf,met_octncf,met_novncf,met_decncf,met_janncf)
met_uni_bind <- rbind(met_auguni,met_sepuni,met_octuni,met_novuni,met_decuni,met_januni)

met_5min_merge <- Reduce(function(x, y) merge(x, y,by = "date", all=TRUE), list(met_abe_bind,met_iko_bind,met_jan_bind,met_las_bind,met_ncf_bind,met_uni_bind))

summary(met_5min_merge)

# export directory for met diurnal averages #############
diurn_expdir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/MET Diurnal Plots"
dir.create(diurn_expdir)
setwd(diurn_expdir)

# temperature ###############
temp_lims <- c(23,33)
abe_diurn_temp <- timeVariation(met_abe_bind, "abetemp", ylab = "degreesC")[[1]][2]
abe_diurn_temp[["hour"]][["main"]] <- "(a) Abesan Ambient Temperature"
abe_diurn_temp[["hour"]][["xlab"]] <- ""
abe_diurn_temp[["hour"]][["y.limits"]] <- temp_lims
abe_diurn_temp


iko_diurn_temp <- timeVariation(met_iko_bind, "ikotemp", ylab = "degreesC")[[1]][2]
iko_diurn_temp[["hour"]][["main"]] <- "(b) Ikorodu Ambient Temperature"
iko_diurn_temp[["hour"]][["xlab"]] <- ""
iko_diurn_temp[["hour"]][["y.limits"]] <- temp_lims
iko_diurn_temp

jan_diurn_temp <- timeVariation(met_jan_bind, "jantemp", ylab = "degreesC")[[1]][2]
jan_diurn_temp[["hour"]][["main"]] <- "(c) Jankara Ambient Temperature"
jan_diurn_temp[["hour"]][["xlab"]] <- ""
jan_diurn_temp[["hour"]][["y.limits"]] <- temp_lims
jan_diurn_temp

las_diurn_temp <- timeVariation(met_las_bind, "lastemp", ylab = "degreesC")[[1]][2]
las_diurn_temp[["hour"]][["main"]] <- "(d) LASEPA Ambient Temperature"
las_diurn_temp[["hour"]][["xlab"]] <- ""
las_diurn_temp[["hour"]][["y.limits"]] <- temp_lims
las_diurn_temp

ncf_diurn_temp <- timeVariation(met_ncf_bind, "ncftemp", ylab = "degreesC")[[1]][2]
ncf_diurn_temp[["hour"]][["main"]] <- "(e) NCF Ambient Temperature"
ncf_diurn_temp[["hour"]][["xlab"]] <- ""
ncf_diurn_temp[["hour"]][["y.limits"]] <- temp_lims
ncf_diurn_temp

uni_diurn_temp <- timeVariation(met_uni_bind, "unitemp", ylab = "degreesC")[[1]][2]
uni_diurn_temp[["hour"]][["main"]] <- "(f) UNILAG Ambient Temperature"
uni_diurn_temp[["hour"]][["xlab"]] <- ""
uni_diurn_temp[["hour"]][["y.limits"]] <- temp_lims
uni_diurn_temp

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file temp
jpeg(file="temp_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_temp, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_temp, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_temp, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_temp, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_temp, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_temp, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()


# rherature ###############
rh_lims <- c(60,100)
abe_diurn_rh <- timeVariation(met_abe_bind, "aberh", ylab = "%")[[1]][2]
abe_diurn_rh[["hour"]][["main"]] <- "(a) Abesan Relative Humidity"
abe_diurn_rh[["hour"]][["xlab"]] <- ""
abe_diurn_rh[["hour"]][["y.limits"]] <- rh_lims
abe_diurn_rh


iko_diurn_rh <- timeVariation(met_iko_bind, "ikorh", ylab = "%")[[1]][2]
iko_diurn_rh[["hour"]][["main"]] <- "(b) Ikorodu Relative Humidity"
iko_diurn_rh[["hour"]][["xlab"]] <- ""
iko_diurn_rh[["hour"]][["y.limits"]] <- rh_lims
iko_diurn_rh

jan_diurn_rh <- timeVariation(met_jan_bind, "janrh", ylab = "%")[[1]][2]
jan_diurn_rh[["hour"]][["main"]] <- "(c) Jankara Relative Humidity"
jan_diurn_rh[["hour"]][["xlab"]] <- ""
jan_diurn_rh[["hour"]][["y.limits"]] <- rh_lims
jan_diurn_rh

las_diurn_rh <- timeVariation(met_las_bind, "lasrh", ylab = "%")[[1]][2]
las_diurn_rh[["hour"]][["main"]] <- "(d) LASEPA Relative Humidity"
las_diurn_rh[["hour"]][["xlab"]] <- ""
las_diurn_rh[["hour"]][["y.limits"]] <- rh_lims
las_diurn_rh

ncf_diurn_rh <- timeVariation(met_ncf_bind, "ncfrh", ylab = "%")[[1]][2]
ncf_diurn_rh[["hour"]][["main"]] <- "(e) NCF Relative Humidity"
ncf_diurn_rh[["hour"]][["xlab"]] <- ""
ncf_diurn_rh[["hour"]][["y.limits"]] <- rh_lims
ncf_diurn_rh

uni_diurn_rh <- timeVariation(met_uni_bind, "unirh", ylab = "%")[[1]][2]
uni_diurn_rh[["hour"]][["main"]] <- "(f) UNILAG Relative Humidity"
uni_diurn_rh[["hour"]][["xlab"]] <- ""
uni_diurn_rh[["hour"]][["y.limits"]] <- rh_lims
uni_diurn_rh

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file rh
jpeg(file="rh_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_rh, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_rh, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_rh, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_rh, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_rh, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_rh, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()

# windspeed ###############
ws_lims <- c(0,4)
abe_diurn_ws <- timeVariation(met_abe_bind, "abews", ylab = "m/s")[[1]][2]
abe_diurn_ws[["hour"]][["main"]] <- "(a) Abesan Wind Speed"
abe_diurn_ws[["hour"]][["xlab"]] <- ""
abe_diurn_ws[["hour"]][["y.limits"]] <- ws_lims
abe_diurn_ws


iko_diurn_ws <- timeVariation(met_iko_bind, "ikows", ylab = "m/s")[[1]][2]
iko_diurn_ws[["hour"]][["main"]] <- "(b) Ikorodu Wind Speed"
iko_diurn_ws[["hour"]][["xlab"]] <- ""
iko_diurn_ws[["hour"]][["y.limits"]] <- ws_lims
iko_diurn_ws

jan_diurn_ws <- timeVariation(met_jan_bind, "janws", ylab = "m/s")[[1]][2]
jan_diurn_ws[["hour"]][["main"]] <- "(c) Jankara Wind Speed"
jan_diurn_ws[["hour"]][["xlab"]] <- ""
jan_diurn_ws[["hour"]][["y.limits"]] <- ws_lims
jan_diurn_ws

las_diurn_ws <- timeVariation(met_las_bind, "lasws", ylab = "m/s")[[1]][2]
las_diurn_ws[["hour"]][["main"]] <- "(d) LASEPA Wind Speed"
las_diurn_ws[["hour"]][["xlab"]] <- ""
las_diurn_ws[["hour"]][["y.limits"]] <- ws_lims
las_diurn_ws

ncf_diurn_ws <- timeVariation(met_ncf_bind, "ncfws", ylab = "m/s")[[1]][2]
ncf_diurn_ws[["hour"]][["main"]] <- "(e) NCF Wind Speed"
ncf_diurn_ws[["hour"]][["xlab"]] <- ""
ncf_diurn_ws[["hour"]][["y.limits"]] <- ws_lims
ncf_diurn_ws

uni_diurn_ws <- timeVariation(met_uni_bind, "uniws", ylab = "m/s")[[1]][2]
uni_diurn_ws[["hour"]][["main"]] <- "(f) UNILAG Wind Speed"
uni_diurn_ws[["hour"]][["xlab"]] <- ""
uni_diurn_ws[["hour"]][["y.limits"]] <- ws_lims
uni_diurn_ws

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file ws
jpeg(file="ws_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_ws, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_ws, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_ws, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_ws, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_ws, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_ws, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()


# pressure ###############
press_lims <- c(752,770)
abe_diurn_press <- timeVariation(met_abe_bind, "abepress", ylab = "mmHg")[[1]][2]
abe_diurn_press[["hour"]][["main"]] <- "(a) Abesan Air Pressure"
abe_diurn_press[["hour"]][["xlab"]] <- ""
abe_diurn_press[["hour"]][["y.limits"]] <- press_lims
abe_diurn_press


iko_diurn_press <- timeVariation(met_iko_bind, "ikopress", ylab = "m/s")[[1]][2]
iko_diurn_press[["hour"]][["main"]] <- "(b) Ikorodu Air Pressure"
iko_diurn_press[["hour"]][["xlab"]] <- ""
iko_diurn_press[["hour"]][["y.limits"]] <- press_lims
iko_diurn_press

jan_diurn_press <- timeVariation(met_jan_bind, "janpress", ylab = "m/s")[[1]][2]
jan_diurn_press[["hour"]][["main"]] <- "(c) Jankara Air Pressure"
jan_diurn_press[["hour"]][["xlab"]] <- ""
jan_diurn_press[["hour"]][["y.limits"]] <- press_lims
jan_diurn_press

las_diurn_press <- timeVariation(met_las_bind, "laspress", ylab = "m/s")[[1]][2]
las_diurn_press[["hour"]][["main"]] <- "(d) LASEPA Air Pressure"
las_diurn_press[["hour"]][["xlab"]] <- ""
las_diurn_press[["hour"]][["y.limits"]] <- press_lims
las_diurn_press

ncf_diurn_press <- timeVariation(met_ncf_bind, "ncfpress", ylab = "m/s")[[1]][2]
ncf_diurn_press[["hour"]][["main"]] <- "(e) NCF Air Pressure"
ncf_diurn_press[["hour"]][["xlab"]] <- ""
ncf_diurn_press[["hour"]][["y.limits"]] <- press_lims
ncf_diurn_press

uni_diurn_press <- timeVariation(met_uni_bind, "unipress", ylab = "m/s")[[1]][2]
uni_diurn_press[["hour"]][["main"]] <- "(f) UNILAG Air Pressure"
uni_diurn_press[["hour"]][["xlab"]] <- ""
uni_diurn_press[["hour"]][["y.limits"]] <- press_lims
uni_diurn_press

diurnpltwidth <- 8000
diurnpltheight <- 8000
# Open a tiff file press
jpeg(file="press_diurnplot.jpeg", res=700, width=diurnpltwidth, height=diurnpltheight, pointsize=10,
     type="windopress", antialias="cleartype")
# 2. Create a plot
print(abe_diurn_press, position = c(0, 0.67, 0.5, 1), more = TRUE)
print(iko_diurn_press, position = c(0.5, 0.67, 1, 1),more = TRUE)
print(jan_diurn_press, position = c(0, 0.33, 0.5, 0.67),more = TRUE)
print(las_diurn_press, position = c(0.5, 0.33, 1, 0.67),more = TRUE)
print(ncf_diurn_press, position = c(0, 0, 0.5, 0.33),more = TRUE)
print(uni_diurn_press, position = c(0.5, 0, 1, 0.33))
#Close plot
dev.off()






# monthly and daily average plots #################

timePlot(met_5min_merge, pollutant = c("abetemp","ikotemp","jantemp","lastemp","ncftemp","unitemp"))

keycols <- 6
fntsize <- 15

met_temp_mnth=timePlot(met_5min_merge,pollutant=c("abetemp","ikotemp","jantemp","lastemp","ncftemp","unitemp"), fill = TRUE,group = TRUE, ylim=c(25,30), avg.time = "1 month", statistic = "mean",
                 main = "Ambient Temperature Monthly Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                 ylab="Temperature (degreesC)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,pch = c(20,20,20,20,20,20), 
                 key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)

met_temp_day=timePlot(met_5min_merge,pollutant=c("abetemp","ikotemp","jantemp","lastemp","ncftemp","unitemp"), fill = TRUE,group = TRUE, ylim=c(20,35), avg.time = "1 day", statistic = "mean",
                  main = "Ambient Temperature Daily Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                  ylab="Temperature (degreesC)", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,
                 # pch = c(20,20,20,20,20,20), 
                  key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)

met_rh_mnth=timePlot(met_5min_merge,pollutant=c("aberh","ikorh","janrh","lasrh","ncfrh","unirh"), fill = TRUE,group = TRUE, ylim=c(75,90), avg.time = "1 month", statistic = "mean",
                       main = "Relative Humidity Monthly Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                       ylab="%RH", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,pch = c(20,20,20,20,20,20), 
                       key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)

met_rh_day=timePlot(met_5min_merge,pollutant=c("aberh","ikorh","janrh","lasrh","ncfrh","unirh"), fill = TRUE,group = TRUE, ylim=c(55,100), avg.time = "1 day", statistic = "mean",
                      main = "Relative Humidity Daily Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                      ylab="%RH", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,
                      # pch = c(20,20,20,20,20,20), 
                      key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)


met_ws_mnth=timePlot(met_5min_merge,pollutant=c("abews","ikows","janws","lasws","ncfws","uniws"), fill = TRUE,group = TRUE, ylim=c(0,3), avg.time = "1 month", statistic = "mean",
                     main = "Wind Speed Monthly Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                     ylab="m/s", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,pch = c(20,20,20,20,20,20), 
                     key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)

met_ws_day=timePlot(met_5min_merge,pollutant=c("abews","ikows","janws","lasws","ncfws","uniws"), fill = TRUE,group = TRUE, ylim=c(0,4), avg.time = "1 day", statistic = "mean",
                    main = "Wind Speed Daily Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                    ylab="m/s", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,
                    # pch = c(20,20,20,20,20,20), 
                    key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)


met_press_mnth=timePlot(met_5min_merge,pollutant=c("abepress","ikopress","janpress","laspress","ncfpress","unipress"), fill = TRUE,group = TRUE, ylim=c(750,765), avg.time = "1 month", statistic = "mean",
                     main = "Air Pressure Monthly Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                     ylab="mmHg", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,pch = c(20,20,20,20,20,20), 
                     key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)

met_press_day=timePlot(met_5min_merge,pollutant=c("abepress","ikopress","janpress","laspress","ncfpress","unipress"), fill = TRUE,group = TRUE, ylim=c(745,765), avg.time = "1 day", statistic = "mean",
                    main = "Air Pressure Daily Averages", fontsize = fntsize,cols=c("red","blue","green2","black","purple","cyan"), 
                    ylab="mmHg", lty=c(1,1,1,1,1,1), lwd=c(2,2,2,2,2,2), date.pad = TRUE,
                    # pch = c(20,20,20,20,20,20), 
                    key.position="bottom", name.pol = c("Abesan", "Ikorodu","Jankara","Lasepa","NCF","Unilag"),key.columns=keycols)











