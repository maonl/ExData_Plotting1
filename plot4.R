colnames <- c("Date", "Time", "GlobalActPwr", "GlobalReactPwr", "Voltage", "GlobalInt", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Data-file pre-"scouted" so that in the following I load only the lines wanted.
mydata <- read.table("household_power_consumption.txt", sep = ";", col.names = colnames, na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), skip = 66637, nrows = 2880)

## Use strptime and paste to fuse Date & Time together into col 2 of the data.frame
mydata$Time <- strptime(paste(mydata$Date, mydata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png("plot4.png", 480, 480)
par(mfrow = c(2, 2))
## Top Left: Global Active Power (kW) by Time
with(mydata, plot(Time, GlobalActPwr, xlab = "", ylab = "Global Active Power (kilowatts)", type="n"))
with(mydata, lines(Time, GlobalActPwr))

## Top Right: Voltage by "datetime"
with(mydata, plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type="n"))
with(mydata, lines(Time, Voltage))

## Bottom Left: Energy sub Metering, 3 times
with(mydata, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l"))
with(mydata, lines(Time, Sub_metering_2, col = "red"))
with(mydata, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Bottom Right: "Global_reactive_power" by "datetime"
with(mydata, plot(Time, GlobalReactPwr, xlab = "datetime", ylab = "Global_Reactive_Power", mar = c(4.1, 4.1, 4.1, 2.1), type="n"))
with(mydata, lines(Time, GlobalReactPwr))

dev.off()