## Load and extract data to be used
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE,blank.lines.skip = TRUE)
alldata <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]
##Create date object
longdate <- as.POSIXct(paste(alldata$Date,alldata$Time), format="%d/%m/%Y %H:%M:%S",tz="")
##Open png device to save file
png(file="plot3.png",width=480,height=480)
##Plot 3. Create line graph with multiple line readings
plot(longdate,alldata$Sub_metering_1, type="s",xlab="",ylab="Energy sub metering")
points(longdate,alldata$Sub_metering_2, type="s", col="red")
points(longdate,alldata$Sub_metering_3, type="s", col="blue")
legend("topright",legend=c("Sub_metering1","Sub_metering2","Sub_metering3"),col=c("black","red","blue"),lwd=2)
##Close device
dev.off()