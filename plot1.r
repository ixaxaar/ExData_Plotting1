#! /usr/bin/env Rscript

# read the file
p = read.csv('./household_power_consumption.csv', sep=";")

# convert date str to date obj
p$Date = as.numeric(as.POSIXct(paste(p$Date, p$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

# two days - 11 to 13 jan 2007 UTC
subsetP = subset(p, p$Date > 1168473600 & p$Date < 1168646400)

png("./plot1.png")

hist(as.numeric(subsetP$Global_active_power), xlab="Global Active Power (Kilowatts)", main="Global Active Power", col="red")

dev.off()
