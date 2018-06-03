# Read Data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, format="%d/%m/%Y")
data <- cbind(DateTime, data)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Subset the days of interest
datasubDay1 <- subset(data, Date=="2007-02-01")
datasubDay2 <- subset(data, Date=="2007-02-02")
datasub <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Open Graphics Device
png("plot3.png")

#Generate plot
plot(datasub$DateTime,datasub$Sub_metering_1, type="l", main="", ylab = "Energy sub metering", xlab="")
points(datasub$DateTime,datasub$Sub_metering_2, type="l", col="red")
points(datasub$DateTime,datasub$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Close Graphics Device
dev.off()