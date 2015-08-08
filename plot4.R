# Read data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Only 1st and 2nd of February 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Merge Data and Time columns into single timestamp column with the correct type
data$ts <- strptime(paste(data$Date, " ", data$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))

# TL
plot(data$ts, data$Global_active_power, pch='.', ylab="Global Active Power", xlab="", type="n")
lines(data$ts, data$Global_active_power)

# TR
plot(data$ts, data$Voltage, pch='.', ylab="Voltage", xlab="datetime", type="n")
lines(data$ts, data$Voltage)

# BL
plot(data$ts, data$Sub_metering_1, pch='.', ylab="Energy sub metering", xlab="", type="n")
lines(data$ts, data$Sub_metering_1)
lines(data$ts, data$Sub_metering_2, col="red")
lines(data$ts, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

# BR
plot(data$ts, data$Global_reactive_power, pch='.', ylab="Global_reactive_power", xlab="datetime", type="n")
lines(data$ts, data$Global_reactive_power)

dev.off()
