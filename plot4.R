##read in the data
input <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##pull only data for dates indicated in assignment (1/2/2007 and 2/2/2007)
data <- input[input$Date %in% c("1/2/2007","2/2/2007"),]

##combines the date and time fields
Combined_Datetime <-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

##merges data required for plot3
data <- cbind(Combined_Datetime, data)

##creats png file of plot4 (four graphs)
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

##top left graph with labels
plot(data$Combined_Datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

##top right graph with labels
plot(data$Combined_Datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

##bottom left graph with legend and labels
plot(data$Combined_Datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Combined_Datetime,data$Sub_metering_2,type="l",col="red")
lines(data$Combined_Datetime,data$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

##bottom right graph with labels
plot(data$Combined_Datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()