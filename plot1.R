fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="./data/dataset2.zip", method ="curl")

unzip(zipfile="./data/dataset2.zip", exdir = "./data")

power <- read.table("./data/household_power_consumption.txt", sep=";", header = TRUE)

power <- subset(power,power$Date == "1/2/2007" | power$Date == "2/2/2007")

globalactive_num <- as.numeric(power$Global_active_power)

hist(globalactive_num, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active power")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
