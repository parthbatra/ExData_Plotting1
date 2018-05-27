elec <- read.delim("household_power_consumption.txt", sep = ";", header = T)
dated_data <-  elec[elec$Date %in% c("1/2/2007","2/2/2007"),]
dated_data$Date <- as.Date(dated_data$Date, format = "%d/%m/%Y")
dated_data$Day <-  paste(dated_data$Date, dated_data$Time)
dated_data$Day <- as.POSIXct(dated_data$Day)
png("plot4.png", width =480, height = 480)
par(mfrow = c(2,2),mar = c(4,4,2,2))
plot(dated_data$Day,
     dated_data$Global_active_power,
     type = 'l',
     ylab = "GLobal Active Power (kilowatts)",
     xlab = "",
     yaxt = "n")
axis(side = 2 ,at =seq(0,3000,1000), label = seq(0,6,2))

plot(dated_data$Day,
     dated_data$Voltage,
     type = "l",
     yaxt = "n",
     xlab = "datetime",
     ylab = "Voltage")
axis(side = 2, at = seq(800,2000,200), labels = seq(234,246,2))

plot(dated_data$Day,
     dated_data$Sub_metering_1,
     type = 'n',
     xlab="",
     ylab = "Energy Sub metering",
     yaxp = c(0,30,3))
lines(dated_data$Day,
      dated_data$Sub_metering_1,
      col = 'black')
lines(dated_data$Day,
      dated_data$Sub_metering_2,
      col = 'red')
lines(dated_data$Day,
      dated_data$Sub_metering_3,
      col = 'blue')
axis(side = 2, at = seq(0,30,10), labels = seq(0,30,10))
legend("topright", 
       col = c("black","red","blue"),
       lty = c(1,1,1),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

plot(dated_data$Day,
     dated_data$Global_reactive_power,
     type = 'l',
     ylab = "GLobal_reactive_power",
     xlab = "datetime",
     yaxt = "n")
axis(side = 2, at = seq(0,250,50), labels = seq(0.0,0.5,0.1))
dev.off()
