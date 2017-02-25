###Section1 Get file from web

linkfromweb<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zippedfile<-"./data/household_power_consumption.zip"
extractedfile<-"./data/household_power_consumption.txt"

if(!file.exists(extractedfile)){
  download.file(linkfromweb,zippedfile)##No need for method="curl" as it is window
  unzip(zippedfile,overwrite=T,exdir="./data")}
