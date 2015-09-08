#change locale
Sys.setlocale("LC_TIME", "English")

#read downloaded data and filter it
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
filtered <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm("data")

#added datetime field
filtered$DateTime <- as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S")

#plot Energy submetering / days plot
#main title and x-axis title are empty, y-axis title is added
png(file='plot3.png', width=480, height=480)
with(filtered, plot(DateTime, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="", main=""))
with(filtered, points(DateTime, Sub_metering_2, col="RED", type="l"))
with(filtered, points(DateTime, Sub_metering_3, col="BLUE", type="l"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("BLACK", "RED", "BLUE"), cex=0.75)
dev.off()