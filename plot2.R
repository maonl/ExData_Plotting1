colnames <- c("Date", "Time", "GlobalActPwr", "GlobalReactPwr", "Voltage", "GlobalInt", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Data-file pre-"scouted" so that in the following I load only the lines wanted.
mydata <- read.table("household_power_consumption.txt", sep = ";", col.names = colnames, na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), skip = 66637, nrows = 2880)

## Use strptime and paste to fuse Date & Time together into col 2 of the data.frame
mydata$Time <- strptime(paste(mydata$Date, mydata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", 480, 480)
with(mydata, plot(Time, GlobalActPwr, xlab = "", ylab = "Global Active Power (kilowatts)", type="n"))
with(mydata, lines(Time, GlobalActPwr))
dev.off()
