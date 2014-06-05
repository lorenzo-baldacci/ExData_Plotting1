rm(list=ls())
dataset<-read.delim(file="household_power_consumption.txt", header=FALSE, sep=";", quote="", dec=".", skip=66637, nrows=2880, na.strings="?")
n<-read.delim(file="household_power_consumption.txt", header=TRUE, sep=";", quote="", dec=".", skip=0, nrows=1)

names(dataset)<-names(n)
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

png(filename="plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()