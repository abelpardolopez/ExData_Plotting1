# Script to generate Plot 2 of the Course Exploratory Data Assignament 1

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
png(file="plot2.png",width=480,height=480)

#Draw the Global Active Power
plot(b,data2$Global_active_power,ylab = "Global Active Power (kilowat)", xlab="", type="l")

#Device off to save the image 
dev.off()