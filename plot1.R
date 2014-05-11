colnames <- c("Date", "Time", "GlobalActPwr", "GlobalReactPwr", "Voltage", "GlobalInt", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Data-file pre-"scouted" so that in the following I load only the lines wanted.
mydata <- read.table("household_power_consumption.txt", sep = ";", col.names = colnames, na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), skip = 66637, nrows = 2880)

png("plot1.png", 480, 480)
hist(mydata[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
