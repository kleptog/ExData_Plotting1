# Read data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Only 1st and 2nd of February 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Merge Data and Time columns into single timestamp column with the correct type
data$ts <- strptime(paste(data$Date, " ", data$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(data$ts, data$Global_active_power, pch='.', ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(data$ts, data$Global_active_power)
dev.off()

