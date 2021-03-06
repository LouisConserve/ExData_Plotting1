#Open File
openfile <- "./household_power_consumption.txt"
#Read Data
data <- read.table(openfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Correct Selection
selection <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Plotting
datetime <- strptime(paste(selection$Date, selection$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selection$Global_active_power)
subMetering1 <- as.numeric(selection$Sub_metering_1)
subMetering2 <- as.numeric(selection$Sub_metering_2)
subMetering3 <- as.numeric(selection$Sub_metering_3)
#Created the png file
png("plot3.png", width=480, height=480)
#Formattings
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# Legends formats
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
