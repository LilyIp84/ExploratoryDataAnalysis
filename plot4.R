Data0 <-  read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Data0$Date <- as.Date(Data0$Date, format="%d/%m/%Y")



##Get subset of the data between 2007-02-01 and 2007-02-02

Data <- filter(Data0, Date >= "2007-02-01" & Date <= "2007-02-02")
Data$Global_active_power <- as.numeric(Data$Global_active_power)
Data$Global_reactive_power <- as.numeric(Data$Global_reactive_power)
Data$Voltage <- as.numeric(Data$Voltage)

##Convert dates
Data$DateTime <- paste(Data$Date, Data$Time)
Data$DateTime <- as.POSIXct(Data$DateTime)

##Convert sub_metering columns
Data$Sub_metering_1 <- as.numeric(Data$Sub_metering_1)

Data$Sub_metering_2 <- as.numeric(Data$Sub_metering_2)

Data$Sub_metering_3 <- as.numeric(Data$Sub_metering_3)

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(Data$DateTime, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(Data$DateTime, Data$Voltage, type="l",xlab = "datetime", ylab = "Voltage")
plot(Data$DateTime, Data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Data$DateTime, Data$Sub_metering_2, type="l", col="red")
lines(Data$DateTime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty= 1, lwd=2, col=c("black", "red", "blue"), bty="n")
plot(Data$DateTime, Data$Global_reactive_power, type= "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
##Save to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()