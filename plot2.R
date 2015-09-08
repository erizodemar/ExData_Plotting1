#change locale
Sys.setlocale("LC_TIME", "English")

#read downloaded data and filter it
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
filtered <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm("data")

#added datetime field
filtered$DateTime <- as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S")

#plot Global Active Power / days plot
#main title and x-axis title are empty, y-axis title is added
png(file='plot2.png', width=480, height=480)
plot(filtered$DateTime, filtered$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()