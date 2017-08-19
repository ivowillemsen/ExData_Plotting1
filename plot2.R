library(lubridate)
## only read data that is needed (1/2/2007 until 2/2/2007) to prevent out of RAM and make things faster
powerdf<-read.table('household_power_consumption.txt', header = TRUE, skip = 66636, sep=";", nrows = 2880)
colnames(powerdf) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "grey90")
plot.new()
par(mfrow = c(1, 1))
with(powerdf, plot(x=as.POSIXct(strptime(paste(powerdf$Date, powerdf$Time), "%d/%m/%Y %H:%M:%S")), y=Global_active_power, type="l", 
                   xlab="", ylab="Global Active Power (kilowatts)"))
remove(powerdf)
dev.off()

