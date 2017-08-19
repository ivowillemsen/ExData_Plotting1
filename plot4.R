library(lubridate)
## only read data that is needed (1/2/2007 until 2/2/2007) to prevent out of RAM and make things faster
powerdf<-read.table('household_power_consumption.txt', header = TRUE, skip = 66636, sep=";", nrows = 2880)
colnames(powerdf) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "grey90")
plot.new()
par(mfrow=c(2, 2))
with(powerdf, plot(x=as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), y=Global_active_power, type="l", 
                   xlab="", ylab="Global Active Power (kilowatts)"))
with(powerdf, plot(x=as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), y=Voltage, type="l", 
                   xlab="datetime", ylab="Voltage"))
plot(as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), powerdf$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering", col='black')
points(as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), powerdf$Sub_metering_2, type="l", col='red')
points(as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), powerdf$Sub_metering_3, type="l", col='blue')
legend( x="topright", 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"), lwd=1, lty=c(1,1,1))
with(powerdf, plot(x=as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), y=Global_reactive_power, type="l", 
                   xlab="datetime"))
remove(powerdf)
dev.off()