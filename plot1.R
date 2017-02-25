###Section1 Get file from web

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


