# Script to generate Plot 4 of the Course Exploratory Data Assignament 1

#Active Packages
library(dplyr)
library(lubridate)

# Read Data
data <- tbl_df(read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";",colClasses = c(rep("character",2),rep("numeric",7))))

# Filter data to obtain only the info for day 2007/02/01 and 2007/02/02
data2<-filter(data,dmy(Date)==ymd("2007/02/01") | dmy(Date)==ymd("2007/02/02"))

# Generate time to draw the plots
b<-strptime(paste(data2$Date,data2$Time,sep = " "),"%d/%m/%Y %T", tz="UCT")

# Open PNG Device
png(file="plot4.png",width=480,height=480)

# Prepare the 4 areas
par(mfrow=c(2,2))

# Plot 1. Top Left
plot(b,data2$Global_active_power,ylab = "Global Active Power (kilowat)", xlab="", type="l")

# Plot 2. Top Right
plot(b,data2$Voltage,ylab = "Voltage", xlab="datetime", type="l")

#Plot 3. Bottom Left
plot(b,data2$Sub_metering_1,ylab = "Energy submetering", xlab="", type="l", col="black")
lines(b,data2$Sub_metering_2,type = "l", col="blue")
lines(b,data2$Sub_metering_3,type = "l", col="red")
legend("topright",col=c("black","blue","red"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)

#Plot 4. Bottom Right
plot(b,data2$Global_reactive_power,type="l")

#Device off to save the image 
dev.off()