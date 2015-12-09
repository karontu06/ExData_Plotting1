##R script for creating plot4

setwd("/users/karonlewis/desktop")
cols=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
power<-read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = cols)

date1<-subset(power, Date=="1/2/2007")
date2<-subset(power, Date=="2/2/2007")
newdata<-rbind(date1, date2)

datetime<-strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(newdata$Global_active_power)
grp<-as.numeric(newdata$Global_reactive_power)
vol<-as.numeric(newdata$Voltage)
sm1<-as.numeric(newdata$Sub_metering_1)
sm2<-as.numeric(newdata$Sub_metering_2)
sm3<-as.numeric(newdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(datetime, gap, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
plot(datetime, vol, type="l", xlab="dateime", ylab="Voltage")
plot(datetime, sm1, col="black", type="l", xlab=" ", ylab="Energy sub metering")
lines(datetime, sm2, col="red")
lines(datetime, sm3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))
plot(datetime, grp, type="l", xlab="dateime", ylab="Global_reactive_power")
dev.off()
