# Read data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Only 1st and 2nd of February 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Merge Data and Time columns into single timestamp column with the correct type
data$ts <- strptime(paste(data$Date, " ", data$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(data$ts, data$Sub_metering_1, pch='.', ylab="Energy sub metering", xlab="", type="n")
lines(data$ts, data$Sub_metering_1)
lines(data$ts, data$Sub_metering_2, col="red")
lines(data$ts, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
