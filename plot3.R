data <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
subset_data <- data[data$DateTime >= '2007-02-01' & data$DateTime < '2007-02-03', ]
png('plot3.png', width = 480, height = 480)
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
       lty = 1, lwd = 1)
dev.off()
