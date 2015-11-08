File <- "./household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01",]
data <- data[data$Date <= "2007-02-02",]

day <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
GAP <- as.numeric(data$Global_active_power)
png("Plot2.png", width=480, height=480)
plot(day, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()