#Plot 1
 #importing data
elcons<-read.table("C:/Users/Ildikó/Desktop/R data/household_power_consumption.txt",skip=66637, nrows=2880, na.strings="?", sep=";")
# data for only the days 1st and 2nd January 2007
# setting colum names
library(data.table)
setnames(elcons, old=c("V1","V2","V3","V4","V5","V6","V7","V8","V9"), new=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot1
png("plot1.png",  width = 480, height = 480)
hist(elcons$Global_active_power, col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()