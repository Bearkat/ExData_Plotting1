##ensure that the file "household_power_consumption.txt" is in you working directory. 
power_data <- read.table(file = "household_power_consumption.txt", 
                         skip = grep("1/2/2007", readLines("household_power_consumption.txt"))[1], 
                         nrows = 2879, stringsAsFactors = FALSE, sep = ";", 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", "Global_intensity", 
                                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


png(filename = "plot1.png")
hist(power_data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()