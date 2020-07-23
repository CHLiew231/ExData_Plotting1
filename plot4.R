fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./data/dataset2.zip", method ="curl")

unzip(zipfile="./data/dataset2.zip", exdir = "./data")

power <- read.table("./data/household_power_consumption.txt", sep=";", header = TRUE)

power <- subset(power,power$Date == "1/2/2007" | power$Date == "2/2/2007")

globalactive_num <- as.numeric(power$Global_active_power)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))

plot(power$Datetime, globalactive_num, type="l", xlab="", ylab="Global Active Power")
plot(power$Datetime, power$Voltage, type='l', xlab="datetime", ylab="Voltage")
plot(power$Datetime, power$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(power$Datetime, power$Sub_metering_2, type="l", col="red")
lines(power$Datetime, power$Sub_metering_3, type="l", col ="blue")
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6)
plot(power$Datetime, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()