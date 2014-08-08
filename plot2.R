##read in the data
input <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##pull only data for dates indicated in assignment (1/2/2007 and 2/2/2007)
data <- input[input$Date %in% c("1/2/2007","2/2/2007"),]

##combines the date and time fields
Combined_Datetime <-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

##merges data required for plot2
data <- cbind(Combined_Datetime, data)

##creates pgn file of plot2 with labels
png(file="plot2.png",width=480,height=480)
plot(data$Combined_Datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts")
dev.off()