setwd("C:/Users/Wutdy/Desktop/datasci/explo/w1/ExData_Plotting1")
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";",stringsAsFactors=FALSE, dec="." )
subSetData <- data[data$Date, %in% c("1/2/2007", "2/2/2007"),]

#Subset Data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
