fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./data/dataset2.zip", method ="curl")

unzip(zipfile="./data/dataset2.zip", exdir = "./data")

power <- read.table("./data/household_power_consumption.txt", sep=";", header = TRUE)

power <- subset(power,power$Date == "1/2/2007" | power$Date == "2/2/2007")

globalactive_num <- as.numeric(power$Global_active_power)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

plot(power$Datetime, power$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(power$Datetime, power$Sub_metering_2, type="l", col="red")
lines(power$Datetime, power$Sub_metering_3, type="l", col ="blue")
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()