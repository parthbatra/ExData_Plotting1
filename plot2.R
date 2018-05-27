elec <- read.delim("household_power_consumption.txt",sep = ";",header= T)
dated_data <- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]
dated_data$Date <- as.Date(dates_data$Date, format="%d/%m/%Y")
day <- paste(dated_data$Date, dated_data$Time)
dated_data$Day <- as.POSIXct(day)
png("plot2.png", height = 480, width = 480)
plot(dated_data$Day,
     dated_data$Global_active_power,
     type = 'l',
     ylab = "GLobal Active Power (kilowatts)",
     xlab = "",
     yaxt = "n")
axis(side = 2 ,at =seq(0,3000,1000), label = seq(0,6,2))
dev.off()
length(day)
length(dated_data$Date)
length(dated_data$Day)
length(dated_data$Global_active_power)
