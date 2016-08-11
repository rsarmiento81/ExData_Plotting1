## Load and extract data to be used
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE,blank.lines.skip = TRUE)
alldata <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]
##Create date object
longdate <- as.POSIXct(paste(alldata$Date,alldata$Time), format="%d/%m/%Y %H:%M:%S",tz="")
##Open png device to save file
png(file="plot2.png",width=480,height=480)
##Plot 2. Create line graph
plot(longdate, alldata$Global_active_power,type="s", xlab="", ylab="Global Active Power")
##Close device
dev.off()