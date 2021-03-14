


impdir <- "C:/Users/Obajuluwa/Downloads/Web_Zephyr_PM_data/Web_Zephyr_PM_data/wetransfer-7c533e"

setwd(impdir)

pmfile <- list.files(path = impdir, pattern = "*.csv")

pmdata <- read_csv(pmfile[1],na = "NA")

summary(pmdata)


bic1415 <- filter(pmdata, cartridge == "BIC1415")   #NCF
bic1483 <- filter(pmdata, cartridge == "BIC1483")   #Unilag
bic1409 <- filter(pmdata, cartridge == "BIC1409")   #Abesan
bic1378 <- filter(pmdata, cartridge == "BIC1378")   #Ikorodu
bic1393 <- filter(pmdata, cartridge == "BIC1393")   #LASEPA x JANKARA
bic1374 <- filter(pmdata, cartridge == "BIC1374")   #JANKARA x LASEPA

summary(bic1415)
summary(bic1483)
summary(bic1409)
summary(bic1378)
summary(bic1393)
summary(bic1374)
