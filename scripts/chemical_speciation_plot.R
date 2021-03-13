
library(tidyverse);library(plyr);library(data.table)
library(openair);library(sqldf);library(ggplot2);library(dplyr)
library(openxlsx);library(readxl);library(ggpubr);library(lubridate)
library(scales);library(tidyr);library(EnvStats)
library(cowplot)



wkdir <- "C://Users/Obajuluwa/Downloads/XRF -1.xlsx"


xrffile <- read_xlsx(wkdir, sheet = 2, na = "ND")



xrffile$ec <- as.numeric(xrffile$ec)

summary(xrffile)
head(xrffile)

xrffile$date <- format(xrffile$month, "%b %y")
xrffile$date <- factor(xrffile$date, levels = c("Aug 20" ,"Sep 20" ,"Oct 20","Nov 20" ,"Dec 20", "Jan 21"))


summary(xrffile)
head(xrffile)


pm25xrf <- filter(xrffile, pm_size  == "pm25")
pm10xrf <- filter(xrffile, pm_size  == "pm10")

#abesan
#pm25
abe_pm25xrf <- filter(pm25xrf, site == "Abesan")
abe_pm25xrf <- select(abe_pm25xrf, -c("month", "site", "pm_size"))
abe_pm25xrf <- abe_pm25xrf %>%gather(Total, Value, -date)
abe_pm25xrf$Total <- factor(abe_pm25xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

abe_pm25xrf_plt <- ggplot(abe_pm25xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,2,4,8,16,32,64,128)) +
  # ylim(0,280) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("Abesan"~PM[2.5]))
abe_pm25xrf_plt

#pm10
abe_pm10xrf <- filter(pm10xrf, site == "Abesan")
abe_pm10xrf <- select(abe_pm10xrf, -c("month", "site", "pm_size"))
abe_pm10xrf <- abe_pm10xrf %>%gather(Total, Value, -date)
abe_pm10xrf$Total <- factor(abe_pm10xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

abe_pm10xrf_plt <- ggplot(abe_pm10xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # ylim(0,400) +
  scale_fill_discrete(name = "", labels = c("PM10", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("Abesan"~PM[10]))
abe_pm10xrf_plt



#ikorodu
#pm25
iko_pm25xrf <- filter(pm25xrf, site == "Ikorodu")
iko_pm25xrf <- select(iko_pm25xrf, -c("month", "site", "pm_size"))
iko_pm25xrf <- iko_pm25xrf %>%gather(Total, Value, -date)
iko_pm25xrf$Total <- factor(iko_pm25xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

iko_pm25xrf_plt <- ggplot(iko_pm25xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,2,4,8,16,32,64,128)) +
  # ylim(0,280) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("Ikorodu"~PM[2.5]))
iko_pm25xrf_plt

#pm10
iko_pm10xrf <- filter(pm10xrf, site == "Ikorodu")
iko_pm10xrf <- select(iko_pm10xrf, -c("month", "site", "pm_size"))
iko_pm10xrf <- iko_pm10xrf %>%gather(Total, Value, -date)
iko_pm10xrf$Total <- factor(iko_pm10xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

iko_pm10xrf_plt <- ggplot(iko_pm10xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,5,20,50,100,200,400)) +
  # ylim(0,400) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("Ikorodu"~PM[10]))
iko_pm10xrf_plt

#lasepa
#pm25
las_pm25xrf <- filter(pm25xrf, site == "LASEPA")
las_pm25xrf <- select(las_pm25xrf, -c("month", "site", "pm_size"))
las_pm25xrf <- las_pm25xrf %>%gather(Total, Value, -date)
las_pm25xrf$Total <- factor(las_pm25xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

las_pm25xrf_plt <- ggplot(las_pm25xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,2,4,8,16,32,64,128)) +
  # ylim(0,280) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("LASEPA"~PM[2.5]))
las_pm25xrf_plt

#pm10
las_pm10xrf <- filter(pm10xrf, site == "LASEPA")
las_pm10xrf <- select(las_pm10xrf, -c("month", "site", "pm_size"))
las_pm10xrf <- las_pm10xrf %>%gather(Total, Value, -date)
las_pm10xrf$Total <- factor(las_pm10xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

las_pm10xrf_plt <- ggplot(las_pm10xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,5,20,50,100,200,400)) +
  # ylim(0,400) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("LASEPA"~PM[10]))
las_pm10xrf_plt

#jan
#pm25
jan_pm25xrf <- filter(pm25xrf, site == "Jankara")
jan_pm25xrf <- select(jan_pm25xrf, -c("month", "site", "pm_size"))
jan_pm25xrf <- jan_pm25xrf %>%gather(Total, Value, -date)
jan_pm25xrf$Total <- factor(jan_pm25xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

jan_pm25xrf_plt <- ggplot(jan_pm25xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,2,4,8,16,32,64,128)) +
  # ylim(0,280) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("Jankara"~PM[2.5]))
jan_pm25xrf_plt

#pm10
jan_pm10xrf <- filter(pm10xrf, site == "Jankara")
jan_pm10xrf <- select(jan_pm10xrf, -c("month", "site", "pm_size"))
jan_pm10xrf <- jan_pm10xrf %>%gather(Total, Value, -date)
jan_pm10xrf$Total <- factor(jan_pm10xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

jan_pm10xrf_plt <- ggplot(jan_pm10xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(.1,5,20,50,100,200,400)) +
  # ylim(0,330) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("Jankara"~PM[10]))
jan_pm10xrf_plt

#ncf
#pm25
ncf_pm25xrf <- filter(pm25xrf, site == "NCF")
ncf_pm25xrf <- select(ncf_pm25xrf, -c("month", "site", "pm_size"))
ncf_pm25xrf <- ncf_pm25xrf %>%gather(Total, Value, -date)
ncf_pm25xrf$Total <- factor(ncf_pm25xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

ncf_pm25xrf_plt <- ggplot(ncf_pm25xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,2,4,8,16,32,64,128)) +
  # ylim(0,280) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("NCF"~PM[2.5]))
ncf_pm25xrf_plt

#pm10
ncf_pm10xrf <- filter(pm10xrf, site == "NCF")
ncf_pm10xrf <- select(ncf_pm10xrf, -c("month", "site", "pm_size"))
ncf_pm10xrf <- ncf_pm10xrf %>%gather(Total, Value, -date)
ncf_pm10xrf$Total <- factor(ncf_pm10xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

ncf_pm10xrf_plt <- ggplot(ncf_pm10xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(.1,5,20,50,100,200,400)) +
  # ylim(0,330) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("NCF"~PM[10]))
ncf_pm10xrf_plt

#uni
#pm25
uni_pm25xrf <- filter(pm25xrf, site == "UNILAG")
uni_pm25xrf <- select(uni_pm25xrf, -c("month", "site", "pm_size"))
uni_pm25xrf <- uni_pm25xrf %>%gather(Total, Value, -date)
uni_pm25xrf$Total <- factor(uni_pm25xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

uni_pm25xrf_plt <- ggplot(uni_pm25xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(1,2,4,8,16,32,64,128)) +
  # ylim(0,280) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("UNILAG"~PM[2.5]))
uni_pm25xrf_plt

#pm10
uni_pm10xrf <- filter(pm10xrf, site == "UNILAG")
uni_pm10xrf <- select(uni_pm10xrf, -c("month", "site", "pm_size"))
uni_pm10xrf <- uni_pm10xrf %>%gather(Total, Value, -date)
uni_pm10xrf$Total <- factor(uni_pm10xrf$Total, levels = c("massconc", "ec","oc","no3", "so4","nh4","others"))

uni_pm10xrf_plt <- ggplot(uni_pm10xrf, aes(x = date, y = Value, fill = Total)) +
  geom_bar(position = position_dodge(width = 0.8) , stat = 'identity', width = .6) +
  ylab(bquote(Mass~Concentrations~mu~gm^-3)) +
  xlab("")+
  # scale_y_log10(breaks = c(.1,5,20,50,100,200,400)) +
  # ylim(0,330) +
  scale_fill_discrete(name = "", labels = c("PM2.5", "EC", "OC",'NO3-',"SO4-","NH4+","Others")) +
  theme_bw() +
  labs(title = expression("UNILAG"~PM[10]))
uni_pm10xrf_plt


abe_unibar <- plot_grid(abe_pm25xrf_plt,abe_pm10xrf_plt,
                        iko_pm25xrf_plt,iko_pm10xrf_plt,
                        las_pm25xrf_plt,las_pm10xrf_plt,
                        jan_pm25xrf_plt,jan_pm10xrf_plt,
                        ncf_pm25xrf_plt,ncf_pm10xrf_plt,
                        uni_pm25xrf_plt,uni_pm10xrf_plt,
                         ncol =4, nrow =3) + ggtitle("PM2.5 & PM10 Concentration Distributions for Abesan, Ikorodu and Jankara")


abe_unibar <- annotate_figure(abe_unibar, top = text_grob(bquote(PM[2.5]~and~PM[10]~Chemical~Speciation~from~August~2020~to~January~2021), color = "black", face = "bold", size = 18))
# abe_unibar

getwd()

bardir <- "C:/Users/Obajuluwa/OneDrive/OneDrive Collaboration for August to December Reports 290121/Rev0/Six-Month Interim Report/plots and tables/Chem_Speciation Bar Plots"
dir.create(bardir)
setwd(bardir)

metpltwidth <- 16000
metpltheight <- 8000
# Open a tiff file no2
jpeg(file="abe_unibar.jpeg", res=700, width=metpltwidth, height=metpltheight, pointsize=10,
     type="windows", antialias="cleartype")
# 2. Create a plot
abe_unibar
# Close the pdf file
dev.off()















