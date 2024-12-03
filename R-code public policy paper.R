# install packages
install.packages('thePackage')
install.packages('Hmisc')
install.packages('SDMTools')
install.packages('ggplot2')
library('thePackage')
library('Hmisc')
library('ggplot2')

DrinkingWater <- read.csv('Drinking Water Microplastic Concentrations_1-5000um.csv')
DrinkingWater[is.na(DrinkingWater)]<- ''
print(DrinkingWater)

#updated datasheet
DW <- read.csv('bottlewaterconc.csv')

#weighted mean
BottleWater <- weighted.mean(DW$Bottle_C, DW$Bottle_W, na.rm = TRUE)
TapWater <- weighted.mean(DW$Tap_C, DW$Tap_W, na.rm = TRUE)
RawWater <- weighted.mean(DW$Raw_C, DW$Raw_W, na.rm = TRUE)
TreatedWater <- weighted.mean(DW$Treated_C,DW$Treated_W, na.rm = TRUE)

#weighted variance and standard deviation

VarBW <- wtd.var(DW$Bottle_C, DW$Bottle_W)
SdBW <- sqrt(VarBW)
VarTW <- wtd.var(DW$Tap_C, DW$Tap_W)
SdTW <- sqrt(VarTW)
VarRW <- wtd.var(DW$Raw_C, DW$Raw_W)
SdRW <- sqrt(VarRW)
VarTrW <- wtd.var(DW$Treated_C, DW$Treated_W)
SdTrW <- sqrt(VarTrW)

DWplot<- ggplot(df2, aes(x=Bottle, y=DW$Bottle_C, fill=supp)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=BottleWater-sd, ymax=BottleWater+sd), width=.2,
                position=position_dodge(.9)) 




