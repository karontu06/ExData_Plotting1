##R script for creating plot3

setwd("/users/karonlewis/desktop")
cols=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
power<-read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = cols)

date1<-subset(power, Date=="1/2/2007")
date2<-subset(power, Date=="2/2/2007")
newdata<-rbind(date1, date2)

datetime<-strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(datetime)
sm1<-as.numeric(newdata$Sub_metering_1)
sm2<-as.numeric(newdata$Sub_metering_2)
sm3<-as.numeric(newdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sm1, col="black", type="l", xlab=" ", ylab="Energy sub metering")
lines(datetime, sm2, col="red")
lines(datetime, sm3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
