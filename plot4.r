
setwd("C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis")

housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

subhousedata <- subset(housedata,housedata$Date=="1/2/2007" | housedata$Date =="2/2/2007")

subhousedata$Date <- as.Date(subhousedata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subhousedata$Date), subhousedata$Time)
subhousedata$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subhousedata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="")
})

dev.copy(png, file="C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis/plot4.png", height=480, width=480)

dev.off()