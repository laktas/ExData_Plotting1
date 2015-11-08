File <- "./household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01",]
data <- data[data$Date <= "2007-02-02",]

GAP <- as.numeric(data$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
