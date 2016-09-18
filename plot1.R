setwd("C:/Users/Wutdy/Desktop/datasci/explo/w1/ExData_Plotting1")
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";",stringsAsFactors=FALSE, dec="." )
subSetData <- data[data$Date, %in% c("1/2/2007", "2/2/2007"),]

#Subset Data
globalactivepower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")
dev.off()