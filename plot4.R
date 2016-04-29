# read the dataset text file and force the col types to characters and numbers

power_data <- read.csv("household_power_consumption.txt", header = T, sep = ";",na.strings = "?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# get only to days of data
sub_data <- power_data[(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"), ]
# merge the 2 date & time strings into a new col DAY
sub_data$Day = strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=400, height=400)

# set global par param for 2*2 graphs        
par(mfrow=c(2,2))
        
# 1st plot 
plot(sub_data$Day, sub_data$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power")
# 2nd plot 
plot(sub_data$Day, sub_data$Voltage, type="l",
             xlab="datetime", ylab="Voltage")
# 3rd plot
plot(sub_data$Day, sub_data$Sub_metering_1, type="l", col="black",
             xlab="", ylab="Energy sub metering")
lines(sub_data$Day, sub_data$Sub_metering_2, col="red")
lines(sub_data$Day, sub_data$Sub_metering_3, col="blue")
legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1,
               box.lwd=0)
# 4th plot
plot(sub_data$Day, sub_data$Global_reactive_power, type="n",
             xlab="datetime", ylab="Global_reactive_power")
lines(sub_data$Day, sub_data$Global_reactive_power)
dev.off()