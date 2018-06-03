# Read Data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- strptime(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Subset the days of interest
datasubDay1 <- subset(data, Date=="2007-02-01")
datasubDay2 <- subset(data, Date=="2007-02-02")
datasub <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# Open Graphics Device
png("plot1.png")

#Generate plot
hist(datasub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts")


# Close Graphics Device
dev.off()