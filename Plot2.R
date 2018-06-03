# Read Data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, format="%d/%m/%Y")
data <- cbind(DateTime, data)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Subset the days of interest
datasubDay1 <- subset(data, Date=="2007-02-01")
datasubDay2 <- subset(data, Date=="2007-02-02")
datasub <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Open Graphics Device
png("plot2.png")

#Generate plot
plot(datasub$DateTime,datasub$Global_active_power, type="l", main="", ylab = "Global Active Power (kilowatts)", xlab="")


# Close Graphics Device
dev.off()