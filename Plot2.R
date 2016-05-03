#Open file
openfile <- "./household_power_consumption.txt"
#Read data
data <- read.table(openfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Correct selection
selection <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(selection$Date, selection$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
#Formattings
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
