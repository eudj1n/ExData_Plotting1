# plot4.png generation

# load text data into table
# @note used russian locale for dates

file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# make subset with defined date range and define variables
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)

# define and assign metering vars
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

# prepare graphic PNG device
png("plot4.png", width=480, height=480)

# define layout
par(mfrow = c(2, 2))

# draw plots
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type ="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# close device
dev.off()