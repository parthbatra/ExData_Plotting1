elec <- read.delim("household_power_consumption.txt",sep = ";")
names(elec)
dates <- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]
var1 <- as.numeric(dates$Global_active_power)
png("plot1.png", height = 480, width = 480)
hist(var1,col = "red",
        ylim = c(0,1200), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",xaxt = "n")
axis(side = 1, at = seq(0,3000,500), labels = seq(0,6))
 
dev.off()




