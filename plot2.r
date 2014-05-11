#! /usr/bin/env Rscript

# read the file
p = read.csv('./household_power_consumption.csv', sep=";")

# convert date str to date obj
p$Date = as.numeric(as.POSIXct(paste(p$Date, p$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

# two days - 11 to 13 jan 2007 UTC
subsetP = subset(p, p$Date > 1168473600 & p$Date < 1168646400)

# Re-convert to POSIX date type for cosmetic puropses (graph X-tick)
subsetP$Date = as.POSIXlt(subsetP$Date, origin="1970-01-01", tz="Asia/Calcutta")

png("./plot2.png")

plot(x=subsetP$Date, y=subsetP$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")

dev.off()
