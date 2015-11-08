Data0 <-  read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Data0$Date <- as.Date(Data0$Date, format="%d/%m/%Y")



##Get subset of the data between 2007-02-01 and 2007-02-02

Data <- filter(Data0, Date >= "2007-02-01" & Date <= "2007-02-02")
Data$Global_active_power <- as.numeric(Data$Global_active_power)

##Convert dates
Data$DateTime <- paste(Data$Date, Data$Time)
Data$DateTime <- as.POSIXct(Data$DateTime)

## Plot 2
plot(Data$Global_active_power~Data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Save to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()