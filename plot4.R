library(data.table)

raw_data <- fread("../household_power_consumption.txt", header=TRUE)
plot_data <- raw_data["Date" %in% c("1/2/2007","2/2/2007")]

plot_data <- within(plot_data, {
  my_date <- as.POSIXct(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
  Global_active_power <- as.numeric(Global_active_power)
  Global_reactive_power <- as.numeric(Global_reactive_power)
  Voltage <- as.numeric(Voltage)
  Global_intensity <- as.numeric(Global_intensity)
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
})

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

with(plot_data, {
  plot(my_date, Global_active_power, type="l", xlab="", ylab="Global Active Power")

  plot(my_date, Voltage, type="l", xlab="datetime")

  plot(my_date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(my_date, Sub_metering_2, col="red")
  lines(my_date, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

  plot(my_date, Global_reactive_power, type="l", xlab="datetime")
})

dev.off()
