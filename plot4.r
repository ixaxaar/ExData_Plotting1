#! /usr/bin/env Rscript

# read the file
p = read.csv('./household_power_consumption.csv', sep=";")

# convert date str to date obj
p$Date = as.numeric(as.POSIXct(paste(p$Date, p$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

# two days - 11 to 13 jan 2007 UTC
subsetP = subset(p, p$Date > 1168473600 & p$Date < 1168646400)

# Re-convert to POSIX date type for cosmetic puropses (graph X-tick)
subsetP$Date = as.POSIXlt(subsetP$Date, origin="1970-01-01", tz="Asia/Calcutta")

png("./plot4.png")

par(mfrow=c(2,2))

plot(x=subsetP$Date, y=subsetP$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")

plot(x=subsetP$Date, y=subsetP$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(x=subsetP$Date, y=subsetP$Sub_metering_1, ylab="", xlab="", type="l", col="black")
par(new=T)
plot(x=subsetP$Date, y=subsetP$Sub_metering_2, ylab="", xlab="", type="l", col="red")
par(new=T)
plot(x=subsetP$Date, y=subsetP$Sub_metering_3, ylab="", xlab="", type="l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c('black', 'red', 'blue'), cex=.75)


plot(x=subsetP$Date, y=subsetP$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
