##read in the data
input <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##pull only data for dates indicated in assignment (1/2/2007 and 2/2/2007)
data <- input[input$Date %in% c("1/2/2007","2/2/2007"),]

##combines the date and time fields
Combined_Datetime <-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

##merges data required for plot3
data <- cbind(Combined_Datetime, data)

##creates png file of plot3 with legend and labels
png(file="plot3.png",width=480,height=480)
plot(plotdata$Combined_Datetime,plotdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(plotdata$Combined_Datetime,plotdata$Sub_metering_2,type="l",col="red")
lines(plotdata$Combined_Datetime,plotdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()