# read the dataset text file and force the col types to characters and numbers

power_data <- read.csv("household_power_consumption.txt", header = T, sep = ";",na.strings = "?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# get only to days of data
sub_data <- power_data[(power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007"), ]
# merge the 2 date & time strings into a new col DAY
sub_data$Day = strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")
# prepare PNG plot1.png with the required size
#Sys.setlocale("LC_TIME","en_US.UTF-8")     # Depends on the system, works for me on my OS

png(filename = "plot2.png", width = 480, height = 480)

plot(sub_data$Day, sub_data$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(sub_data$Day, sub_data$Global_active_power)
#dev.copy(png,"plot2.png")
dev.off()