
setwd("C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis")

housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

subhousedata <- subset(housedata,housedata$Date=="1/2/2007" | housedata$Date =="2/2/2007")

subhousedata$Date <- as.Date(subhousedata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subhousedata$Date), subhousedata$Time)
subhousedata$Datetime <- as.POSIXct(datetime)

with(subhousedata, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
		    })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis/plot3.png", height=480, width=480)

dev.off()