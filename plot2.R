#Plot2
#importing data
elcons<-read.table("C:/Users/Ildik�/Desktop/R data/household_power_consumption.txt",skip=66637, nrows=2880, na.strings="?", sep=";")
# data for only the days 1st and 2nd January 2007
# setting colum names
library(data.table)
setnames(elcons, old=c("V1","V2","V3","V4","V5","V6","V7","V8","V9"), new=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Voltage, ylab="Voltage", xlab="datetime", type="l")