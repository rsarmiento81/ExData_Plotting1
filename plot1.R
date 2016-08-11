## Load and extract data to be used
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE,blank.lines.skip = TRUE)
alldata <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]
##Create date object
longdate <- as.POSIXct(paste(alldata$Date,alldata$Time), format="%d/%m/%Y %H:%M:%S",tz="")
##Open png plot device to save file
png(file="plot1.png",width=480,height=480)
##Plot 1. Create histogram of Global Active Power with red columns, arranged by frequency and labeled accordingly
hist(as.numeric(alldata$Global_active_power),col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power")
##Close plot device
dev.off()