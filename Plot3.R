File <- "./household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01",]
data <- data[data$Date <= "2007-02-02",]

day <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)

png("Plot3.png", width=480, height=480)
plot(day,sm1, type="l", ylab="Energy Submetering", xlab="")
lines(day,sm2,type="l", col="red")
lines(day, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()