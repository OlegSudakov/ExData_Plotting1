#Remember to put the data in your working directory!
data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE,
                   sep = ";",  as.is = c(1,2))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#Rewriting data
data <- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
#Making the histogram
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
