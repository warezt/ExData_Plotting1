###Section1 Get file from web
##Create directory "data" if they doesn't exist create it. If exist, nothing happen
dir.create(file.path(getwd(),"data"), showWarnings = FALSE)

linkfromweb<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zippedfile<-"./data/household_power_consumption.zip"
extractedfile<-"./data/household_power_consumption.txt"

if(!file.exists(extractedfile)){
  download.file(linkfromweb,zippedfile)##No need for method="curl" as it is window
  unzip(zippedfile,overwrite=T,exdir="./data")}

##Section2 Get data and strip out between 1-2 Feb 2007
rawdata<-read.table(extractedfile,header=T,sep=";",na.strings="?")
#Matching doc https://stat.ethz.ch/R-manual/R-devel/library/base/html/match.html
#Get the data for 2 days
selecteddata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]
#Test if data have 2 days
if(length(unique(selecteddata$Date))!=2){"Wrong"}
#Create character vector
date_and_time<-paste(selecteddata$Date, selecteddata$Time, sep=" ")
#Convert character vector to POSIXlt vector
date_and_time_as_POSIXlt<-strptime(date_and_time,"%d/%m/%Y %H:%M:%S")
#Add date and time in front of data for plot chart
finaldata<-cbind(date_and_time_as_POSIXlt,selecteddata)

##Don't use ggplot2, use base plot
##library("ggplot2")
##qplot(finaldata$Global_active_power)

##Section 3; Create plot
##Initiate file
##Link here https://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/png.html
png(filename = "plot2.png",width = 480, height = 480, units = "px",bg = "white")
##Create plot
plot(finaldata$date_and_time_as_POSIXlt, finaldata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
##Close developer
dev.off()
##Display
plot(finaldata$date_and_time_as_POSIXlt, finaldata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
