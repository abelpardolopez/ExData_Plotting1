# Script to generate Plot 1 of the Course Exploratory Data Assignament 1

# #Active Packages
library(dplyr)
library(lubridate)

# Read Data
data <- tbl_df(read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";",colClasses = c(rep("character",2),rep("numeric",7))))

# Filter data to obtain only the info for day 2007/02/01 and 2007/02/02
data2<-filter(data,dmy(Date)==ymd("2007/02/01") | dmy(Date)==ymd("2007/02/02"))

# Open PNG Device
png(file="plot1.png",width=480,height=480)

# Draw Histogram
hist(data2$Global_active_power,col="red",xlab ="Global Active Pover (kilowatts)",main="Global Active Power")

#Device off to save the image 
dev.off()