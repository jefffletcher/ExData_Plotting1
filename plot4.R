library(data.table)

raw_data <- fread("../household_power_consumption.txt", header=TRUE)
plot_data <- raw_data["Date" %in% c("1/2/2007","2/2/2007")]

plot_data$my_date <- as.POSIXct(strptime(paste(plot_data$Date, plot_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)
plot_data$Global_reactive_power <- as.numeric(plot_data$Global_reactive_power)
plot_data$Voltage <- as.numeric(plot_data$Voltage)
plot_data$Global_intensity <- as.numeric(plot_data$Global_intensity)
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(plot_data$my_date, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(plot_data$my_date, plot_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(plot_data$my_date, plot_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot_data$my_date, plot_data$Sub_metering_2, col="red")
lines(plot_data$my_date, plot_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

plot(plot_data$my_date, plot_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
