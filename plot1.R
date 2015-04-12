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

#plot to png graphics device png
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, main = "Global active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#close graphics device
dev.off()
