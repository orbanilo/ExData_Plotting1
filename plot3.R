#Plot3
#importing data
elcons<-read.table("C:/Users/Ildik�/Desktop/R data/household_power_consumption.txt",skip=66637, nrows=2880, na.strings="?", sep=";")
# data for only the days 1st and 2nd January 2007
# setting colum names
library(data.table)
setnames(elcons, old=c("V1","V2","V3","V4","V5","V6","V7","V8","V9"), new=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot3.png",  width = 480, height = 480)
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="", ylim=c(0,40))
#as for the x axis: my Windows is in Hungarian and probably because of that, I have the Hungarian abbreviation of the days of the week on the axis... I could not find out how to change that but would be happy to get some advice...
par(new=TRUE)
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Sub_metering_2, ylab="Energy sub metering", type="l", xlab="", ylim=c(0,40), col="red")
par(new=TRUE)
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Sub_metering_3, ylab="Energy sub metering", type="l", xlab="", ylim=c(0,40), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()