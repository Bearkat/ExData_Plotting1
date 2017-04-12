##ensure that the file "household_power_consumption.txt" is in you working directory. 
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

png(filename = "plot2.png")
plot(dt1, power_data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()
