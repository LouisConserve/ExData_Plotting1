#Open File
openfile <- "./household_power_consumption.txt"
# Read Data
data <- read.table(openfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Set Selection
selection <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(selection$Global_active_power)
#Proper formattings
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
