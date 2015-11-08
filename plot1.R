require(dplyr)
require(data.table)
require(lubridate)
require(ggplot2)

##Get full data set and convert date column to date format

Data0 <-  read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Data0$Date <- as.Date(Data0$Date, format="%d/%m/%Y")



##Get subset of the data between 2007-02-01 and 2007-02-02

Data <- filter(Data0, Date >= "2007-02-01" & Date <= "2007-02-02")
Data$Global_active_power <- as.numeric(Data$Global_active_power)
##Plot 1

hist(Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()