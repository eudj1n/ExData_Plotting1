# plot2.png generation

# load text data into table
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# make subset with defined date range and define variables
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)

# prepare graphic PNG device
png("plot2.png", width=480, height=480)

# make plot
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close device
dev.off()