
setwd("C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis")

housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

subhousedata <- subset(housedata,housedata$Date=="1/2/2007" | housedata$Date =="2/2/2007")

subhousedata$Date <- as.Date(subhousedata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subhousedata$Date), subhousedata$Time)
subhousedata$Datetime <- as.POSIXct(datetime)

plot(subhousedata$Global_active_power~subhousedata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis/plot2.png", height=480, width=480)

dev.off()