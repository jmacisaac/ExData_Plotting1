
setwd("C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis")

housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

subhousedata <- subset(housedata,housedata$Date=="1/2/2007" | housedata$Date =="2/2/2007")

hist(as.numeric(as.character(subhousedata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.copy(png, file="C:/Users/MacIsaac/Documents/Coursera/exploratory data analysis/plot1.png", height=480, width=480)

dev.off()