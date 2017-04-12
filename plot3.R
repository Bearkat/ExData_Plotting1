##ensure that the file "household_power_consumption.txt" is in your working directory. 
power_data <- read.table(file = "household_power_consumption.txt", 
                         skip = grep("1/2/2007", readLines("household_power_consumption.txt"))[1], 
                         nrows = 2879, stringsAsFactors = FALSE, sep = ";", 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", "Global_intensity", 
                                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dt <- NULL
for(i in 1:length(power_data[,1])){dt[i] <- paste(power_data[i, 1], 
                                                  power_data[i, 2], sep = " ")}

dt1 <- dmy_hms(dt)

png(filename = "plot3.png")
par(mar = c(5, 4, 4, 4))
plot(dt1, power_data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(dt1, power_data$Sub_metering_1, col = "black")
lines(dt1, power_data$Sub_metering_2, col = "red")
lines(dt1, power_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
dev.off()
