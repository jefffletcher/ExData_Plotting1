library(data.table)

raw_data <- fread("../household_power_consumption.txt", header=TRUE)
plot_data <- raw_data["Date" %in% c("1/2/2007","2/2/2007")]

plot_data <- within(plot_data, {
  my_date <- as.POSIXct(strptime(paste(Date, Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
  Global_active_power <- as.numeric(Global_active_power)
})

png("plot2.png", width=480, height=480, units="px")

with(plot_data, {
  plot(my_date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
})

dev.off()
