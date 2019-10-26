# plot1.png generation

# load text data into table
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# make subset with defined date range
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subset$Global_active_power)

# prepare graphic PNG device
png("plot1.png", width=480, height=480)

# make histogram
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# close device
dev.off()