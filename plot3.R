library(data.table)

raw_data <- fread("../household_power_consumption.txt", header=TRUE)
plot_data <- raw_data["Date" %in% c("1/2/2007","2/2/2007")]

plot_data$my_date <- as.POSIXct(strptime(paste(plot_data$Date, plot_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)

png("plot3.png", width=480, height=480, units="px")
plot(plot_data$my_date, plot_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot_data$my_date, plot_data$Sub_metering_2, col="red")
lines(plot_data$my_date, plot_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
