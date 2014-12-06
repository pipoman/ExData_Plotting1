#Course Project - Exploratory Data Analysis
#Plot3

#Set path for Java
Sys.setenv(JAVA_HOME='c:\\Archivos de programa(x86)\\Java\\jre1.8.0_25')

#Set working directory
setwd("G:/Coursera/Exploratory Data Analysis/Course Project I")

 #Load library
 library(sqldf)
 library(downloader)
 library(plyr)

# Create folder "Data"
if(!file.exists("data")) {
   dir.create("data")
}

 #Write the file destination to an object
 dataFile <- "./data/household_power_consumption.txt"

 #Load data file
hpc <- read.table(dataFile, header=TRUE, sep=";" , stringsAsFactors=FALSE, dec=".", na.string=c("?", "", "-"))

#Subset data
hpc1 <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

#Convert to numeric variables
globalActivePower <- as.numeric(hpc1$Global_active_power )
subMetering1 <- as.numeric(hpc1$Sub_metering_1)
subMetering2 <- as.numeric(hpc1$Sub_metering_2)
subMetering3 <- as.numeric(hpc1$Sub_metering_3)

#Conver Date and Time variables to Date/Time classes
 x <- paste(hpc1$Date, hpc1$Time, sep=" ")
datetime <- strptime(x, "%d/%m/%Y%H:%M:%S")

#Define png archive dimensions
png("plot3.png", width=480, height=480)

#Generate graph
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering" )
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,lwd=2.5, col=c("black","red","blue"))

dev.off()

