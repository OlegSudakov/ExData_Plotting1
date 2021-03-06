#Remember to put the data in your working directory!
data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE,
                   sep = ";",  as.is = c(1,2))
#Changing time and date format
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#Rewriting data
data <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
#Chaning OS locale to get correct values on x axis
Sys.setlocale("LC_TIME","English")
#Making the plot
png(filename = "plot3.png")
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()