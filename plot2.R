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
png(filename = "plot2.png")
plot(data$Time, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()