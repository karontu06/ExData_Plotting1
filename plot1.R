##R program for reading in the household power consumption dataset, and generating plot1.
##Performed by Karon C. Lewis

setwd("/users/karonlewis/desktop")
cols=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

power<-read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = cols)
summary(power)
head(power)

date1<-subset(power, Date=="1/2/2007")
head(date1)
dim(date1)
date2<-subset(power, Date=="2/2/2007")
head(date2)
dim(date2)
mydata<-rbind(date1, date2)
dim(mydata)

png("plot1.png", width=480, height=480)
hist(mydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off()
