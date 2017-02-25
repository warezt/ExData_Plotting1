'Section1 Get file from web

linkfromweb<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zippedfile<-"./data/household_power_consumption.zip"
extractedfile<-"./data/household_power_consumption.txt"

if(!file.exists(zippedfile)){download.file(linkfromweb,zippedfile,method="curl")
  upzip(zippedfile,overwrite=T,exdir="./data")}
