#change locale
Sys.setlocale("LC_TIME", "English")

#read downloaded data and filter it
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
filtered <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm("data")

#added datetime field
filtered$DateTime <- as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S")

#4 plots in single png
#main titles are empty, x-axis and y-axis title are added
png(file='plot4.png', width=480, height=480)
#2 rows and 2 cols in resulted png
par(mfrow= c(2, 2))

#1st (Global Active Power / Days)
plot(filtered$DateTime, filtered$Global_active_power, type="l", main="", xlab="DateTime", ylab="Global Active Power")

#2nd (Voltage / Days)
plot(filtered$DateTime, filtered$Voltage, type="l", main="", xlab="DateTime", ylab="Voltage")

#3rd as in plot3.R
with(filtered, plot(DateTime, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="DateTime", main=""))
with(filtered, points(DateTime, Sub_metering_2, col="RED", type="l"))
with(filtered, points(DateTime, Sub_metering_3, col="BLUE", type="l"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("BLACK", "RED", "BLUE"), cex=1, bty="n")

#4th (Global reactive power / Days)
plot(filtered$DateTime, filtered$Global_reactive_power, type="l", main="", xlab="DateTime", ylab="Global Reactive Power")

dev.off()