
#Open file
openfile <- "./household_power_consumption.txt"
#Read data
data <- read.table(openfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#correct seelction
selection <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Plotting
datetime <- strptime(paste(selection$Date, selection$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selection$Global_active_power)
globalReactivePower <- as.numeric(selection$Global_reactive_power)
voltage <- as.numeric(selection$Voltage)
subMetering1 <- as.numeric(selection$Sub_metering_1)
subMetering2 <- as.numeric(selection$Sub_metering_2)
subMetering3 <- as.numeric(selection$Sub_metering_3)
# Create png file
png("plot4.png", width=480, height=480)
# Formatings
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# Legend formats
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
