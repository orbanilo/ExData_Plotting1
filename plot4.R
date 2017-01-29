#Plot4
#importing data
elcons<-read.table("C:/Users/Ildikó/Desktop/R data/household_power_consumption.txt",skip=66637, nrows=2880, na.strings="?", sep=";")
# data for only the days 1st and 2nd January 2007
# setting colum names
library(data.table)
setnames(elcons, old=c("V1","V2","V3","V4","V5","V6","V7","V8","V9"), new=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot4.png",  width = 480, height = 480)
par(mfrow=c(2,2))

#1st
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l") #as for the x axis: my Windows is in Hungarian and probably because of that, I have the Hungarian abbreviation of the days of the week on the axis... I could not find out how to change that but would be happy to get some advice...

#2nd
 plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Voltage, ylab="Voltage", xlab="datetime", type="l")

#3rd
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="", ylim=c(0,40))
#as for the x axis: my Windows is in Hungarian and probably because of that, I have the Hungarian abbreviation of the days of the week on the axis... I could not find out how to change that but would be happy to get some advice...
par(new=TRUE)
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Sub_metering_2, ylab="Energy sub metering", type="l", xlab="", ylim=c(0,40), col="red")
par(new=TRUE)
plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Sub_metering_3, ylab="Energy sub metering", type="l", xlab="", ylim=c(0,40), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

#4th
 plot(as.POSIXct(paste(elcons$Date, elcons$Time), format="%d/%m/%Y %H:%M:%S"), elcons$Global_reactive_power, ylab="Global_reactive_power (kilowatts)", xlab="dateime", type="l")
 dev.off()