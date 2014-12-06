#Course Project - Exploratory Data Analysis
#Plot2

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

#Convert to numeric variable "Global_active_power"
globalActivePower <- as.numeric(hpc1$Global_active_power )

#Conver Date and Time variables to Date/Time classes
 x <- paste(hpc1$Date, hpc1$Time, sep=" ")
 datetime <- strptime(x, "%d/%m/%Y%H:%M:%S")

#Define png archive dimensions
png("plot2.png", width=480, height=480)

#Generate graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)" )

dev.off()

