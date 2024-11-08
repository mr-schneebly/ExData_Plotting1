library(data.table)

data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot4.png", width = 800, height = 800)

par(mfrow = c(2, 2))

plot(subset_data$DateTime, subset_data$Global_active_power, 
     type = 'l', 
     ylab = 'Global Active Power (kilowatts)', 
     xlab = '', 
     col = 'black', 
     lwd = 1, 
     xaxt = 'n')
axis(1, at = c(as.POSIXct('2007-02-01 00:00:00'), 
               as.POSIXct('2007-02-02 00:00:00'), 
               as.POSIXct('2007-02-03 00:00:00')), 
     labels = c('Thu', 'Fri', 'Sat'))

plot(subset_data$DateTime, subset_data$Voltage, 
     type = 'l', 
     ylab = 'Voltage', 
     xlab = 'Datetime', 
     col = 'black', 
     lwd = 1, 
     xaxt = 'n')
axis(1, at = c(as.POSIXct('2007-02-01 00:00:00'), 
               as.POSIXct('2007-02-02 00:00:00'), 
               as.POSIXct('2007-02-03 00:00:00')), 
     labels = c('Thu', 'Fri', 'Sat'))

plot(subset_data$DateTime, subset_data$Sub_metering_1, 
     type = 'l', 
     ylab = 'Energy sub metering', 
     xlab = '', 
     col = 'black', 
     lwd = 1, 
     xaxt = 'n')
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = 'red', lwd = 1)
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = 'blue', lwd = 1)
axis(1, at = c(as.POSIXct('2007-02-01 00:00:00'), 
               as.POSIXct('2007-02-02 00:00:00'), 
               as.POSIXct('2007-02-03 00:00:00')), 
     labels = c('Thu', 'Fri', 'Sat'))
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), 
       lty = 1, lwd = 1, cex = 0.6)

plot(subset_data$DateTime, subset_data$Global_reactive_power, 
     type = 'l', 
     ylab = 'Global Reactive Power', 
     xlab = 'Datetime', 
     col = 'black', 
     lwd = 1, 
     xaxt = 'n')
axis(1, at = c(as.POSIXct('2007-02-01 00:00:00'), 
               as.POSIXct('2007-02-02 00:00:00'), 
               as.POSIXct('2007-02-03 00:00:00')), 
     labels = c('Thu', 'Fri', 'Sat'))

dev.off()

