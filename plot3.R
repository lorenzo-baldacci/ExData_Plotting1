rm(list=ls())
dataset<-read.delim(file="household_power_consumption.txt", header=FALSE, sep=";", quote="", dec=".", skip=66637, nrows=2880, na.strings="?")
n<-read.delim(file="household_power_consumption.txt", header=TRUE, sep=";", quote="", dec=".", skip=0, nrows=1)

names(dataset)<-names(n)
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

png(filename="plot3.png", width=480, height=480)
par(mfrow=c(1,1))
dataset$Date_Time<-strptime(paste(dataset$Date, dataset$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
plot(dataset$Date_Time, dataset$Sub_metering_1, main="", ylab="Energy sub metering", xlab="", type="l")
lines(dataset$Date_Time, dataset$Sub_metering_2, col="red")
lines(dataset$Date_Time, dataset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1), col=c("black", "red", "blue"))

dev.off()
