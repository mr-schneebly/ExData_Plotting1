data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(
  data_subset$Global_active_power,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  col = "red",
  ylim = c(0, 1200)
)
dev.off()
