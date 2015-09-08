#read downloaded data and filter it
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
filtered <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm("data")

#plot Global Active Power histogram (in red)
#main title and x-axis title are added
png(file='plot1.png', width=480, height=480)
hist(filtered$Global_active_power, col="RED", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()