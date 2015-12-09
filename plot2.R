##R script for creating plot2

setwd("/users/karonlewis/desktop")
cols=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
power<-read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = cols)

date1<-subset(power, Date=="1/2/2007")
date2<-subset(power, Date=="2/2/2007")
newdata<-rbind(date1, date2)

datetime<-strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(datetime)
gap<-as.numeric(newdata$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()
