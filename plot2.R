
data <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
subset_data <- data[data$DateTime >= '2007-02-01' & data$DateTime < '2007-02-03', ]

png('plot2.png', width = 480, height = 480)

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

dev.off()

