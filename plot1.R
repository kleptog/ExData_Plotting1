# Read data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Only 1st and 2nd of February 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Merge Data and Time columns into single timestamp column with the correct type
data$ts <- strptime(paste(data$Date, " ", data$Time), "%d/%m/%Y %H:%M:%S")

png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

