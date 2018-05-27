elec <- read.delim("household_power_consumption.txt", sep = ";",header = T)
dated_data <- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]
dated_data$Date <- as.Date(dated_data$Date, format="%d/%m/%Y")
Day <- paste(dated_data$Date, dated_data$Time)
dated_data$Day <- as.POSIXct(Day)

png("plot3.png", height = 480, width = 480)
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
dev.off()
