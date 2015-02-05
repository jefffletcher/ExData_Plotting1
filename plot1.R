library(data.table)

raw_data <- fread("../household_power_consumption.txt", header=TRUE)
plot_data <- raw_data["Date" %in% c("1/2/2007","2/2/2007")]

plot_data <- within(plot_data, {
  Global_active_power <- as.numeric(Global_active_power)
})

png("plot1.png", width=480, height=480, units="px")

with(plot_data, {
  hist(Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
})

dev.off()
