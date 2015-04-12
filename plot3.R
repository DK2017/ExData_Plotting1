library("data.table")

Origdata = fread("household_power_consumption.txt", stringsAsFactors=FALSE)

#subset of the data from  dates 2007-02-01 and 2007-02-02
sData<-subset(Origdata, Date=="1/2/2007"| Date=="2/2/2007")

data <- sData

#convert the date variable from char to date format
data$Date <-as.Date(sData$Date, "%d/%m/%Y")

#convert the time variable from char to time format
data$Time <- as.POSIXct(data$Date) + as.ITime(data$Time)

#convert the variable from char to number
data$Global_active_power<-as.numeric(sData$Global_active_power)

#open png graphics device
png("plot3.png", width = 480, height = 480)

#plot to graphics device 
plot(data$Time, data$Sub_metering_1, par("lty"), ylab="Energy sub metering", xlab="Date", col="black")
lines(data$Time, data$Sub_metering_2, par("lty"), ylab="Energy sub metering", xlab="Date", col="red")
lines(data$Time, data$Sub_metering_3, par("lty"), ylab="Energy sub metering", xlab="Date", col="blue")
legend("topright", lty=c(1,1), pch = c(NA,NA,NA), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

#close graphics device
dev.off()
