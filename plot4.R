setwd("C:/Users/Wutdy/Desktop/datasci/explo/w1/ExData_Plotting1")
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";",stringsAsFactors=FALSE, dec="." )
subSetData <- data[data$Date, %in% c("1/2/2007", "2/2/2007"),]

#Subset Data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subSetData$Global_active_power)
globalreactivepower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
Sub_Metering1 <- as.numeric(subSetData$Sub_metering_1)
Sub_Metering2 <- as.numeric(subSetData$Sub_metering_2)
Sub_Metering3 <- as.numeric(subSetData$Sub_metering_3)
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_Metering2, type="l", col="red")
lines(datetime, Sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
